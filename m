Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.11.79.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558731;
	b=iuCfMXuL0nr3BCfxKfqaqx3BXwp4hEVI5kVhmnfQJ63Jlc2Lnwmcvpn2adKQRGogiEqn
	 8gOzQHrn3Evp07qD+MET3bdXggZKWgDRQ8KmGax0pNH1icE1+DzMrsVePupoaktNGyJim
	 itnpsV9klxua+MZZ5VLtfKkxZxvrhCoZTYc7RXsy3+nwSVmA/2m5Zu0iPmhOUowfpe4+u
	 566ZDBotlA1f2DQoQ/t7u6if4OBtBThHrzxFcrf/yzkdlKcB4jy/CY37J97J+Rfhj/Gn9
	 n6DJ9VCDyHDd6AaLUFgD4d4v9SigBScbRvszIiJUtkgsEtuXoZYysjyGORPMssR5vPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558731;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer-Info:Subject:
	 From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:
	 Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Abp8x3DSJqqn2+3iXSrmmhIrpq3pCoX57uw/qGsuvA8=;
	b=cIR/ynGSZ3wH8kUM9HUKd3QxBcmeUk5IS7AINPKMPjzB3y+MKUMjQD2xlz4+/FEsMiXN
	 pRO/CdgcPHTdF4oWXFZ2XIlZQAQdpIKEizlsNmEpeLD9stNiSCdw32PdM3IotisOkF6PE
	 Dx/Hby39i8Oskk3fpH8EOtQwNNZzLx3aBb2DSZvVsBNn8C4y9sxvkufGJ1lOUaMXKRqqX
	 UHKmdfq6kLJkD+CFV5il6iJW0oe6GWkMboedLoRuBdobeUUazvAXpH83LW73b8nDO737J
	 C5cOESldHH5W/Jmg7h9VFDSarHGUXRdOaOD4EqagN7eyFWiARgZ2eJKZbjfHtQeoKiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hatchling.org;
	spf=pass smtp.mailfrom=mta.hatchling.org;
	dkim=pass header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=hvn0BhtH;
	dkim=pass header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=OTQ2QqiX;
	arc=none smtp.remote-ip=212.11.79.129
Received: from mail129.mailersend.net (mail129.mailersend.net [212.11.79.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A2606A32D
	for <ntfs3@lists.linux.dev>; Wed, 21 Oct 2026 04:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=hvn0BhtH;
	dkim=pass (2048-bit key, unprotected) header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=OTQ2QqiX
DKIM-Signature: a=rsa-sha256; bh=Abp8x3DSJqqn2+3iXSrmmhIrpq3pCoX57uw/qGsuvA8=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1792558719; v=1;
 b=hvn0BhtHWZZLbtDof5OsEmGVA/QdODyhL01977bYfB17+O0/fNdIMh0Ugtle0QmhNB94SM5q
 tp8RVQEn2UpeVtNgABfJv0mGiKZJMbavvPd+ZjkBGnEXZT3usA7kDw9ZI+iU0bpk+QOqqO777nH
 ksnYMdBDHMsuYpCrHRQMtdDw=
DKIM-Signature: a=rsa-sha256; bh=Abp8x3DSJqqn2+3iXSrmmhIrpq3pCoX57uw/qGsuvA8=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=ms1; t=1792558719; v=1;
 b=OTQ2QqiXpkSU7ewTRAP83FQBV7X1A86yrEBx2i7HuVxYXNcozGXGFp8yaz3RJmHkxkX35hcQ
 gfVMqUqO1jIRfwgeZ3kYXt5Tx9ir0FgbB7VghLPwcxtQC4TrRGPq6AByiV2wM06q/A1tfcoZ1KI
 DKHcWB6RNystc2FXWUIE7gLgb6huGHdV9qZPimYBIcPwt69JS7h3QKrA0ObkAdGQhmYxLY1NZ/k
 LUdUpoUiAdruIOwa23pRNpDUiIMRzv57Sahm0V27T9qXoUgtNO64Fsvo1XXzYF8psI8M5B8gCyj
 dyNhnvHL/cvFtgGztS+Q2gx6pQMOs7lKF2Gu41ZK0r3+Q==
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH 2/2] fs/ntfs3: don't mark pages uptodate when ni_read_frame() fails
From: Senjin <senjin@hatchling.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Senjin <senjin@hatchling.org>,
 ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 stable@vger.kernel.org
Date: 21 Oct 2026 04:58:39 -0000
Received: from 10.8.15.26 by 10.132.0.99 with http; 21 Oct 2026 04:58:39 +0000
Message-ID: <6ad8467fd5964fe995621b38@mailersend.net>
X-MailerSend-RecipientID: 6ad8467fd5964fe995621b38;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6ad8467f6da68140f232e816
In-Reply-To: <20261021045734.573753-1-senjin@hatchling.org>
References: <20261021045734.573753-1-senjin@hatchling.org>
Reply-To: senjin@hatchling.org
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ni_read_frame() calls SetPageUptodate() on every page of the frame on
exit, including when reading or decompressing the frame failed. The
pages then hold zeroes or partially decompressed data, and that is
served as valid file data until the page cache is dropped.

The error is also lost for the folio that was actually requested:
ni_read_folio_cmpr() returns it from ->read_folio, but
filemap_read_folio() only checks folio_test_uptodate() afterwards and
treats the read as successful. Userspace gets wrong data, read() returns=

no error, and nothing is logged.

Only mark the pages uptodate when the frame was read successfully. On
failure the requested folio is left !uptodate and the read returns an
error; the other pages of the frame are retried on their next access.

With the bug fixed by the previous patch still present, a read of an
affected file now fails with an error after the last good frame, instead=

of silently returning zeroes.

Fixes: f35590ee26f5 ("fs/ntfs3: remove ntfs_bio_pages and use page cache=
 for compressed I/O")
Cc: stable@vger.kernel.org # 6.19+
Signed-off-by: Senjin <senjin@hatchling.org>
---
 fs/ntfs3/frecord.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a..a8b696d 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2287,7 +2287,6 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame=
_vbo, struct page **pages,
 	u64 vbo_disk;
 	size_t unc_size =3D 0;
 	u32 frame_size, i, ondisk_size;
-	struct page *pg;
 	struct ATTRIB *attr;
 	CLST frame, clst_data;
=20
@@ -2519,9 +2518,14 @@ out1:
 #endif
 	vunmap(frame_mem);
 out:
-	for (i =3D 0; i < pages_per_frame; i++) {
-		pg =3D pages[i];
-		SetPageUptodate(pg);
+	/*
+	 * Only mark the pages uptodate if the frame was read successfully,
+	 * otherwise zeroed or partially decompressed pages would be served
+	 * from the page cache as valid data.
+	 */
+	if (!err) {
+		for (i =3D 0; i < pages_per_frame; i++)
+			SetPageUptodate(pages[i]);
 	}
=20
 	return err;
--=20
2.56.0
