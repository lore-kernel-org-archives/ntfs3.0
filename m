Received: from mail129.mailersend.net (mail129.mailersend.net [212.11.79.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3960328B7F
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 05:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.11.79.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070632; cv=none; b=nARZZ4y8Wmxmy//osG+jj05Gi8qwgJ81SGQo5xnrLnzUJt5fQB2XCEN3JZwtPxq0weKiU4r6ssR/xcH7y3bzDxFYfMIzm0cylcXImn+sxiH8jZbY9VOY+WWjHPLnOUcYPFkvPG2hLhF8WdZu+locpwdL6Ic/o12gGLH+QgrEvpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070632; c=relaxed/simple;
	bh=EOJ40Vb+1gII/syT9GUL8e9vhq+ISKk9xd8lpQUyLN4=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=r6aucdnqeaKgftsRpkIRfG3CJ6aFFJBEM8kMqMcO7u+zviGdC8bOseMa6c/0vyASBeaqt0hnxYVeMX/xd7Tyq1Iqf8BHLaNkPZfj3OGZx+dEQWhiJH1mi8lZbinj6yEDastvgOFKsVBeP2kfZXH7ATNLZknm+aPWnIXfFa7/0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org; spf=pass smtp.mailfrom=mta.hatchling.org; dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b=BFNNQZQL; dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b=k9PxnbiV; arc=none smtp.client-ip=212.11.79.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b="BFNNQZQL";
	dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b="k9PxnbiV"
DKIM-Signature: a=rsa-sha256; bh=8T/WpLUYw2yjVQSzvBDURq1U1Wn5nQElRds88WGFsLo=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1781070356; v=1;
 b=BFNNQZQLrTRVvCjc/PY04O1sz/Pov8OgxjcZmupv1X3ULO7r7cbeA8ZJlp4VXG34jIC/6ly6
 e/C5x89VBEuoiUVBamRl7GEgR/MxMQxj2ychV+Pnikc+oKZJpvIPv03UDl06mK6WR+EhOuEakyC
 kDZlK8rBFB0jxPbErT6ZFWDU=
DKIM-Signature: a=rsa-sha256; bh=8T/WpLUYw2yjVQSzvBDURq1U1Wn5nQElRds88WGFsLo=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend; t=1781070356; v=1;
 b=k9PxnbiVUi5Dcp8A03JyfBcAg07F0RbFf+1uaUoGla7Oax87em8FnWNs8ylUmfB2z1JIRRNX
 7Vn9gn2qNAahoriMn4S6TSnSVGm2ioch0llACIYUIyifqdLfDxRJVQuD1P7f9PenOK6A7PaEvuS
 TnBd3DdiM8f8h33P0pxCGHSM=
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH] fs/ntfs3: load ATTR_BITMAP run extents from $MFT extension records
From: Senjin <senjin@hatchling.org>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
 linux-kernel@vger.kernel.org,
 Senjin <senjin@hatchling.org>
Date: 10 Jun 2026 05:45:56 -0000
Received: from 10.32.5.223 by 10.132.0.99 with http; 10 Jun 2026 05:45:56 +0000
Message-ID: <6a28fa140d6912274b57d5f6@mailersend.net>
X-MailerSend-RecipientID: 6a28fa140d6912274b57d5f6;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6a28fa1441ebd2207168956d
Reply-To: senjin@hatchling.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When $MFT's ATTR_BITMAP attribute is heavily fragmented, its run list
can span multiple MFT extension records (attribute list entries with
vcn > 0). The non-primary segment handler in ntfs_read_mft() only
processed ATTR_DATA extension segments for MFT_REC_MFT, silently
skipping any ATTR_BITMAP segments. This left sbi->mft.bitmap.run
incomplete, causing wnd_init() to fail with -ENOENT when wnd_rescan()
tried to look up a VCN not covered by the truncated run list.

Observed on a 16 TB NTFS volume (0xFFFFFEFF total clusters) whose MFT
bitmap run list was split across 97 extents in extension records.
wnd_rescan() successfully looked up VCNs 0-122 from the runs loaded
from the base record, then failed at VCN 123 (the last cluster of the
bitmap) whose run was only present in an extension record.

Fix by extending the MFT_REC_MFT special case to also handle
ATTR_BITMAP extension segments, storing their runs into
sbi->mft.bitmap.run the same way the primary segment does.

Signed-off-by: Senjin <senjin@hatchling.org>
---
 fs/ntfs3/inode.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index XXXXXXX..XXXXXXX 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -128,11 +128,16 @@ static struct inode *ntfs_read_mft(struct inode *i=
node,

 	if (le && le->vcn) {
 		/* This is non primary attribute segment. Ignore if not MFT. */
-		if (ino !=3D MFT_REC_MFT || attr->type !=3D ATTR_DATA)
+		if (ino !=3D MFT_REC_MFT)
 			goto next_attr;

-		run =3D &ni->file.run;
+		if (attr->type =3D=3D ATTR_DATA)
+			run =3D &ni->file.run;
+		else if (attr->type =3D=3D ATTR_BITMAP)
+			run =3D &sbi->mft.bitmap.run;
+		else
+			goto next_attr;
+
 		asize =3D le32_to_cpu(attr->size);
 		goto attr_unpack_run;
 	}
--
2.x
