Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=182.48.54.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616321;
	b=DPoKtTnP8VZ/EZ/iPv2eF36xN1ykkObWEvWJYdb4AG7lMbzvFDpVJbQayroqjvimVNWp
	 0HfwCpB7FMxP4GHvKYL1JuFIqHX5DPZ2DqZfIE6fFTJ6iEKReYMuHcOqK2rDG21YjsuML
	 00WUg2HYxQnL+kr3Fkd2g0iPh+SUEt7VV3XCqenknUE1a7YTR5i1m+DgFhv3o45Gm4HUk
	 knSu7hPN/eNFnBysNo6CtnWr9VcrgCuIFWWB/Nq4ep0GNwI1Y+7Usay3++T18o5AYttsG
	 p/Qbfmc0VMLzpEoqgPBmP7bdNLlr1PHYtKASEvoLUqV4QD7ASvql8Ksh0XLPz799GJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616321;
	h=DMARC-Filter:Received:From:Date:To:Cc:Subject:Message-ID;
	bh=d+Fe56rO9Y8xjvaMg3TO/RXpFnmt/k5+69VkIh7gtzg=;
	b=t5IsNXyI30uRcxSdSH8aUc6P8tgtpo9B//o6BKEZ60ueWadeykmDI6GmUzlOGdnrRjOi
	 uWrXO1D8/X3Nxhk/1UTyJNyzDmW0BFn86kfBdBfeqrm3oTAKrOQLDw5iMYyEA9cXYQoL1
	 Vk1/vJuZj2U50vhC/+bZdHtsNXCvbMl2va46ohcv9l8wGrYoaKUEWh7T6XCnJVB4l/kO0
	 9gZ9JIxIz56z/2h5dwpFwRcDP9jeFxGoRgMvceXI7Aa7LoVLmSb9gZyZMXtU+IvdO7KRO
	 uHzyx8gO5hIn60NPRcanWEOw15sY8p5NFvQyB7ehtobQZ0uucmlPCEO38GkYZYRrbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=snowrabbit.org;
	spf=pass smtp.mailfrom=snowrabbit.org;
	arc=none smtp.remote-ip=182.48.54.220
Received: from bambi.snowrabbit.org (bambi.snowrabbit.org [182.48.54.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C482606A323
	for <ntfs3@lists.linux.dev>; Wed, 25 Nov 2026 14:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C482606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=snowrabbit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snowrabbit.org
Received: by bambi.snowrabbit.org (Postfix, from userid 3001)
	id B0E5DC9300; Wed, 25 Nov 2026 23:18:38 +0900 (JST)
From: Showta Ishizaki <zakinko@snowrabbit.org>
Date: Wed, 25 Nov 2026 23:18:20 +0900
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
    linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Showta Ishizaki <zakinko@snowrabbit.org>
Subject: [PATCH] fs/ntfs3: drop the mapping pairs when a file loses all its clusters
Message-ID: <20261125-ntfs3-03-v1@snowrabbit.org>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list

When a non-resident attribute is truncated to nothing,
attr_set_size_ex() sets evcn to -1 and leaves the old mapping pairs in
the record.  chkdsk on Windows reports such a record as corrupt:

  Attribute record (80, "") from file record segment AD is corrupt.

Leave only the zero byte that ends the mapping pairs, and shrink the
attribute to it.  mi_pack_runs() cannot be used for this, it returns
-ENOSPC when there is nothing to pack.

I tried it on two volumes, one where files were written and some of them
truncated to nothing, and one after fsstress (-n 4000 -p 4).  Without
the patch all 16 empty files of the first and 3 of the 90 of the second
still had mapping pairs, and chkdsk exited 3 on both.  With it there
were none, and chkdsk exited 0 on both.  File contents were the same
after a remount.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
---
 fs/ntfs3/attrib.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index d0f8c48..fbda12b 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -818,6 +818,21 @@ pack_runs:
 
 			le = (struct ATTR_LIST_ENTRY *)((u8 *)le - le_sz);
 		} else {
+			u32 asize = le32_to_cpu(attr->size);
+			u32 roff = le16_to_cpu(attr->nres.run_off);
+			u32 nsize = ALIGN(roff + 1, 8);
+
+			/*
+			 * Every cluster goes.  Setting evcn alone left the old
+			 * mapping pairs behind it, and chkdsk on Windows
+			 * reports such an attribute record as corrupt.  Leave
+			 * only the zero byte which ends the mapping pairs.
+			 * mi_pack_runs() does not take an empty range.
+			 */
+			if (nsize <= asize) {
+				memset(Add2Ptr(attr, roff), 0, nsize - roff);
+				mi_resize_attr(mi, attr, (int)nsize - (int)asize);
+			}
 			attr->nres.evcn = cpu_to_le64((u64)vcn - 1);
 			mi->dirty = true;
 		}
-- 
2.54.0 (Apple Git-157)

