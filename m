Received: from mail132.mailersend.net (mail132.mailersend.net [212.11.79.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED11F5821
	for <ntfs3@lists.linux.dev>; Sat, 13 Jun 2026 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.11.79.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781381891; cv=none; b=jKLvBUcV6jWZrOcgr3O6wXoNdQLKeGF72wR1452KrJi/n/x28LySYgDHLP2z5Cx6CHZoaefHl+nE5mzzLbu8/KVi7LwC0N2g89m3MQCumY/M5HbVM2E8goK1SKXo21sGb0FAJPr8z7G8QrBwBBFAYc01URUBpkfeAwn6rl7rnRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781381891; c=relaxed/simple;
	bh=IsPnnkcStKwn/MBO4rst1iWYTEgBoCltqXe+kYqebD0=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=XczU9xUDhwHx9ucrlWEOKenyN4htLHZzO1AQNTvx9RcZxgO3iCXCDQPwTAP27T4txfyH0y0vMRhwg8g6ZMkMP09fIrrBfrzKLiEqRu5oyC28CP36hl9tF69JPM5E/9IuWMMgSOopFwxrE5uprGPyf/4Az3djESO+bDjABAi5irI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org; spf=pass smtp.mailfrom=mta.hatchling.org; dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b=jbI8yoES; dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b=Kkqtu4KX; arc=none smtp.client-ip=212.11.79.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b="jbI8yoES";
	dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b="Kkqtu4KX"
DKIM-Signature: a=rsa-sha256; bh=5AQtSs1N99XVv55ur6IoSIyJIMJiny1kmWPnaLkE11Y=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1781381773; v=1;
 b=jbI8yoESmB2aaSWe21jLLbyzf+/4bmN96CISzE8RdKVM91aHtf8xcpQOhbhFu437WlUorr8s
 cXbncH5lupnI4eDuLyZDX/xgy5T0ZXy6UAitdcGCJ9GwPQpHNjmwjwqDwEdkH6wBJ3EegEKJe4e
 70gHLlzcvk1sHJChd60Dn3kU=
DKIM-Signature: a=rsa-sha256; bh=5AQtSs1N99XVv55ur6IoSIyJIMJiny1kmWPnaLkE11Y=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend; t=1781381773; v=1;
 b=Kkqtu4KXCQpCRXkVM4TVTcXabzQTosT7vdBU01e6m3YqwUJovAYCTyuMjDjU4CS4lIUOHvNX
 gQiRBdLcnrPXS6XJMNNH7Q38Ss7jYZURzzHip640UBWFhdCnjjremusVN2uf8oPVp+paXuEiaAu
 /GNUDddZgcnyQkF3aJEy8w1o=
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH v2 0/2] fs/ntfs3: two fixes for large NTFS volumes
From: Senjin <senjin@hatchling.org>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
 linux-kernel@vger.kernel.org
Date: 13 Jun 2026 20:16:13 -0000
Received: from 10.32.22.247 by 10.132.0.99 with http; 13 Jun 2026 20:16:13 +0000
Message-ID: <6a2dba8d1b6e7397b139b1e6@mailersend.net>
X-MailerSend-RecipientID: 6a2dba8d1b6e7397b139b1e6;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6a2dba8dd6f973735d98941f
Reply-To: senjin@hatchling.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Both patches were found on a 16 TB NTFS volume with 0xFFFFFEFF total
clusters, compiled with CONFIG_NTFS3_64BIT_CLUSTER=3Dy.

Patch 1 is v2 of the previously submitted MFT bitmap fix, correcting
a malformed hunk header in the diff. No code change from v1.

Patch 2 is a new fix: sbi->maxbytes_sparse is assigned -1 in the
CONFIG_NTFS3_64BIT_CLUSTER path. As a signed loff_t, -1 is the most
negative value, causing vfs_setpos() to return -EINVAL for every seek
on sparse or compressed files on such a volume. Sequential reads work
correctly; random access does not. Fix assigns MAX_LFS_FILESIZE
instead, consistent with the other two limits in the same block.

Senjin (2):
  fs/ntfs3: load ATTR_BITMAP run extents from $MFT extension records
  fs/ntfs3: fix lseek EINVAL on sparse/compressed files with 64-bit clus=
ters

 fs/ntfs3/inode.c | 10 +++++++---
 fs/ntfs3/super.c |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)
