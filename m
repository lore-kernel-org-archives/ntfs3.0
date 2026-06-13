Received: from mail132.mailersend.net (mail132.mailersend.net [212.11.79.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74BC20459A
	for <ntfs3@lists.linux.dev>; Sat, 13 Jun 2026 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.11.79.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781382164; cv=none; b=q5g3ci4fCtX3PLBDWAfZyJo2qa4Ig/C/dadaSCip4tbSS8rqMkZKBFUG0dk3H0Dxed0YZaGGbEup723vwG34eefD5+i1XLWRfg9XWUXWZ1unK+5NoFSXgwzJxVunKQRUUKHQ5EmrS8X+wNj1islhnE/tr1FAaBied9/Jvtq6NAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781382164; c=relaxed/simple;
	bh=GbZferK7dvytbg95Iq5Q1luNdF6CaQLlH8863DtI5Ks=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5GPvk3ylgG8JQUD6lUo0OoCkr33Z8ZiWWAzE6UNarWqtVOdWfEUj6rpezCn7SmIhdKmtGMeTVQayklP8IP1JvPQ7SqGQ1lukH/WHhpGxx8+Ffg7CFuJ4SDSMNiVbl0fAE1NAHIrGR27rN3aC4Zn8QB5R8pblzkiiGu/sOmo6Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org; spf=pass smtp.mailfrom=mta.hatchling.org; dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b=34bT1r2e; dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b=QsGCJhI3; arc=none smtp.client-ip=212.11.79.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b="34bT1r2e";
	dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b="QsGCJhI3"
DKIM-Signature: a=rsa-sha256; bh=N3tmiE2uJVeZ0ITnjg6+ghHDHw85rvLVlCqarCy+Mxw=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1781381774; v=1;
 b=34bT1r2eColILXCV/YASdlMdy4YB/1uncKQo1UkXR2eHaZMKDJaCbh2BSJdD8Fv8p1Lqh5gX
 uJustk4PzgjyfzRpla2Nl0pMjb1aP6D1jvnMh03LvDWLxPcIHh+pNLYdVt8KiyrviB6Wlu4ElGb
 8l04xbZZg+gL8zr44X9a3icU=
DKIM-Signature: a=rsa-sha256; bh=N3tmiE2uJVeZ0ITnjg6+ghHDHw85rvLVlCqarCy+Mxw=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend; t=1781381774; v=1;
 b=QsGCJhI30zmoMSLcYo8yKPDYu4D7Bib94NOq83KXO3hjK9kIMtI/EEeTCiZkUQwKXIYjc9i7
 HawmLEG31FoSPFVS3hQ30151IuVvODPiKFuD9X3VCZEInaWiS5PAdz0kA5XhjSyOI0OOPbrkj4H
 OQppFQmYpwEgNuNIz/HO7AGs=
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH v2 2/2] fs/ntfs3: fix lseek EINVAL on sparse/compressed files
 with 64-bit clusters
From: Senjin <senjin@hatchling.org>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
 linux-kernel@vger.kernel.org,
 Senjin <senjin@hatchling.org>
Date: 13 Jun 2026 20:16:14 -0000
Received: from 10.32.1.122 by 10.132.0.99 with http; 13 Jun 2026 20:16:14 +0000
Message-ID: <6a2dba8e030b48618aa54661@mailersend.net>
X-MailerSend-RecipientID: 6a2dba8e030b48618aa54661;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6a2dba8e16561d003133c5de
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

When CONFIG_NTFS3_64BIT_CLUSTER is enabled, sbi->maxbytes_sparse is set
to -1. As a signed loff_t this is -1LL, the most negative value. Any
lseek on a sparse or compressed file passes this as maxsize to
vfs_setpos(), which returns -EINVAL whenever offset > maxsize, and
since -1LL is less than any non-negative offset, every seek fails,
including lseek(fd, 0, SEEK_SET).

The intent of -1 here appears to be "no limit" (matching the spirit of
MAX_LFS_FILESIZE assigned to sbi->maxbytes and sb->s_maxbytes in the
same block), but the signed type makes it the minimum instead of the
maximum.

Fix by assigning MAX_LFS_FILESIZE to sbi->maxbytes_sparse in the
64-bit cluster path, consistent with the other two limits set there.

Observed on a 16 TB NTFS volume with 0xFFFFFEFF total clusters compiled
with CONFIG_NTFS3_64BIT_CLUSTER=3Dy. Sequential reads via dd/cp worked
correctly; any lseek call on sparse files returned EINVAL, preventing
archive managers and other tools from random-accessing files on the
volume. The non-64-bit-cluster path correctly sets maxbytes_sparse to
(1ull << (cluster_bits + 32)) - 1, a large positive value.

Signed-off-by: Senjin <senjin@hatchling.org>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index XXXXXXX..XXXXXXX 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1193,7 +1193,7 @@ static int ntfs_fill_super(struct super_block *sb,=
 struct fs_context *fc)
 #ifdef CONFIG_NTFS3_64BIT_CLUSTER
 	if (clusters >=3D (1ull << (64 - cluster_bits)))
 		sbi->maxbytes =3D -1;
-	sbi->maxbytes_sparse =3D -1;
+	sbi->maxbytes_sparse =3D MAX_LFS_FILESIZE;
 	sb->s_maxbytes =3D MAX_LFS_FILESIZE;
 #else
 	/* Maximum size for sparse file. */
--
2.x
