Received: from mail135.mailersend.net (mail135.mailersend.net [212.11.79.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890B4125A0
	for <ntfs3@lists.linux.dev>; Sat, 13 Jun 2026 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.11.79.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781382454; cv=none; b=G9ScBbGB0+TBp7vBXuV+QqBhdZmp2cBu1Fg4VpfMhgQIXgIYM0/qoHot2TW/L1Cqg3rBASLQ/Nr3NDasmwiOVXuJ/mb02Uk6dGxGXoqYroPyJubpHPRUQtZD1yX5uHIXPdaXdpc9z6aoHUnk7WDQZ+ctQNRs8BrBtO3zg+daMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781382454; c=relaxed/simple;
	bh=F/0JDouk4PENmZ8o64R9b66o0Hto6t5zNsBLb6ZPjKQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEUVW9lry3FzaZhoz0OoAV1bUBiOAnc9gHcRZ7d/opH+NL5mq9UHqQj3QjhaUJ3LkXEST/HEUm9QOUIxglVvzAo4XLHGP6yikt6n9T0TCygIBG57vWFbMM9ob/5e6EkmsJNm55U8qr2SZMK4FEly434J84qdUoPTqudaRIzvmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org; spf=pass smtp.mailfrom=mta.hatchling.org; dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b=tLcaL47/; dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b=vcN/Wgai; arc=none smtp.client-ip=212.11.79.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b="tLcaL47/";
	dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b="vcN/Wgai"
DKIM-Signature: a=rsa-sha256; bh=49bFjSlCo/o5F3zHV/tFWlrPZavNvphqtp+i1jaWXDM=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1781381773; v=1;
 b=tLcaL47/8klNqpFPbvZ66fOx2XOQNzmn9aQjenV5d51IbDW2p12nD8ILC+ICjNQAPBthDVIb
 Q42wj1UMQpoi4qiPGpcnq5H8qv0+N8ZGKmiFLpHeRoQ9W/2uaF/2A9P+GFiWM8YUf3TDWi5IN1C
 Zg6fktSQ1FhaGOeUvmjaZdQE=
DKIM-Signature: a=rsa-sha256; bh=49bFjSlCo/o5F3zHV/tFWlrPZavNvphqtp+i1jaWXDM=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend; t=1781381773; v=1;
 b=vcN/Wgaitpgtiake917PC8uYt7ZN+HdYh2NB4dHse/4UZn3Wxis4mGkzewY+yW9lfyGJ2r3o
 mMG56FQU32bblHI52tpgWR66JeqG3kw5BbtL4JrRwf95PrgMIcO340UZN0ejySafkVDcZ7FVsZL
 qPqZVM4X5e183k2Rj03YrCHQ=
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH v2 1/2] fs/ntfs3: load ATTR_BITMAP run extents from $MFT
 extension records
From: Senjin <senjin@hatchling.org>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
 linux-kernel@vger.kernel.org,
 Senjin <senjin@hatchling.org>
Date: 13 Jun 2026 20:16:13 -0000
Received: from 10.32.22.250 by 10.132.0.99 with http; 13 Jun 2026 20:16:13 +0000
Message-ID: <6a2dba8dda547d28f51dc46a@mailersend.net>
X-MailerSend-RecipientID: 6a2dba8dda547d28f51dc46a;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6a2dba8d0035a2e1bf48c954
In-Reply-To: <20260613201610.14467-1-senjin@hatchling.org>
References: <20260613201610.14467-1-senjin@hatchling.org>
Reply-To: senjin@hatchling.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

v2: fix malformed hunk header in patch (no code change)

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
@@ -127,10 +127,16 @@ static struct inode *ntfs_read_mft(struct inode *i=
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
