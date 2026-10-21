Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.11.79.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558729;
	b=raYMsdA69GUqexD9Pi5pDwEpySTH0bM+JoqHGQUr6vzt6NuvXXGeNMcAadOsX+V4by7M
	 UenJ774qc6YIpOmEkK/6WgobZN08ww2L7dn/6qwvCs/kkspSO4lQztfjz72N2aMDAQClV
	 XsvNQyf90wloAhdvrur7Rw7Q5mvr3XtxhNOMflji/QaxGLpuSHrOMs0SG5FzjvIljYPLz
	 xglBUtpavHWLVA+f0Q6oVO9+NowyTkzjyrBJpBkxAG1drRRVcf33R/cG9P7XGVtY71woU
	 KlRkEO9ntM7bEu9ZlHCwpRZob4OIwKtKDCUnEGHttov484YQiWTJPW9/ElDjIEl+BKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558729;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer-Info:Subject:
	 From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:
	 Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XNIiXMO9bfSyLcpPsK7ibpdKfu6r2xJzZLEZeW2Ur4U=;
	b=j344Q1jr35p/BFjpLzNdxM2AecOjCa7YjHWAREAK/qW356W4Nt2sYSqLQ2m9OlCPsOI8
	 e4NjCVYuQ63sh3hkiGnsampRgVhcnYwZpiTMzmG3vtHLlixy9eX8hln3XC7UUxTeV5Xuq
	 MEdSy4faEjbsFK1cumyg9AzgkYrvbY8kGl/rnPufH4+f+CwujnH1y4aTEVCdk6vwyOCnk
	 6Nyp5ickcN8J+3CAkeKljoQU4HmvegDyii0xEH20nrqoydxDIZ3zZn95r88csgG3+amqw
	 PAgZXmKyFXKyq80i7KTYzoB/O92toPecM73Bc2Yk8z0p5Cvo4nqDXR6ZLYxgzl9z8zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hatchling.org;
	spf=pass smtp.mailfrom=mta.hatchling.org;
	dkim=pass header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=FMMx9862;
	dkim=pass header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=ZBvsTWbv;
	arc=none smtp.remote-ip=212.11.79.129
Received: from mail129.mailersend.net (mail129.mailersend.net [212.11.79.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE57606A31A
	for <ntfs3@lists.linux.dev>; Wed, 21 Oct 2026 04:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=FMMx9862;
	dkim=pass (2048-bit key, unprotected) header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=ZBvsTWbv
DKIM-Signature: a=rsa-sha256; bh=XNIiXMO9bfSyLcpPsK7ibpdKfu6r2xJzZLEZeW2Ur4U=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1792558718; v=1;
 b=FMMx9862pOJ5jJRZev415nKJbdQSErLwYInxsKSYXf0OaIBvdEK0PROSyrjobRye+RGRgIfs
 BUlV2QeJmGIKPlQVU55Ax1FB1HXhLG04mbTqqksJ4oNi6znkAmxgm8s79ecJ+xpV3/JIg8ZIk9m
 A9QqOdyxXba/2xO+7GdcudqY=
DKIM-Signature: a=rsa-sha256; bh=XNIiXMO9bfSyLcpPsK7ibpdKfu6r2xJzZLEZeW2Ur4U=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=ms1; t=1792558718; v=1;
 b=ZBvsTWbv5n2qW4MOL9uqL2YSZcNX7ESgDNfwKpQOfJi5lWgQaaGev/RJcP24cn8DsG+SWk49
 qnWiz/Nddj8qxJvZkj/ORD0c7dX1FPCWTfhvM/2OYP0L58beFls1cMP2QLx4A97s7czlSQG3qAf
 H+Y9xMEU+c0gv8nfKHR0snORTN/kvhvx8wPiHWm9H20ouHrJCgKooEyn0eBaBJCCXPlj71fgfby
 CqUISN4FOINnGuvyWPIMkqR9lywY+KHaJXhtr4ilCTa7jmKjzwLYLSugczt1qy5g1x7BqHXhGzD
 fjBzOnCys5Ww5OcCnnQo4M8exyR7Pp3inEOK0Rrcbqsyg==
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH 1/2] fs/ntfs3: map the right page of large folios in
 ntfs_read_write_run()
From: Senjin <senjin@hatchling.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Senjin <senjin@hatchling.org>,
 ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 stable@vger.kernel.org
Date: 21 Oct 2026 04:58:38 -0000
Received: from 10.8.12.114 by 10.132.0.99 with http; 21 Oct 2026 04:58:38 +0000
Message-ID: <6ad8467eae24f98e92c2aef0@mailersend.net>
X-MailerSend-RecipientID: 6ad8467eae24f98e92c2aef0;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6ad8467e4b4189a79bb7fc2b
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

ntfs_read_write_run() reads and writes through the block device page
cache. It looks up the folio that contains lbo with read_mapping_folio()=
,
but then maps offset 0 of that folio and only adds offset_in_page(lbo):

	folio =3D read_mapping_folio(mapping, lbo >> PAGE_SHIFT, NULL);
	off =3D offset_in_page(lbo);
	kaddr =3D kmap_local_folio(folio, 0);
	memcpy(buf, kaddr + off, op);

This is only correct for order-0 folios. If the folio is a large folio
that starts before lbo, the data is copied from (or written to) the wron=
g
page, (index - folio->index) * PAGE_SIZE bytes before the intended
position.

ntfs3 itself populates the block device mapping with order-0 folios, so
this goes unnoticed on a cold cache. But a userspace read of the block
device (ntfs-3g tools such as ntfscat/ntfsinfo, probing tools, ...) fill=
s
the same mapping through readahead with large folios. After that,
reading a WOF (LZX/XPRESS) compressed file passes garbage to the
decompressor: on a test volume, lzx_decompress() failed for 33 of 35
frames of a 1.1 MB file, and the compressed input it was given matched
the real WofCompressedData stream shifted back by 4 KiB to 52 KiB.

Reproducer (WOF-compressed file, e.g. made with "compact /c /exe:lzx"):

	echo 3 > /proc/sys/vm/drop_caches
	ntfscat -f -a 0x80 -n WofCompressedData $DEV /path/file >/dev/null
	md5sum /mnt/path/file    # wrong; correct without the ntfscat step

On a corpus of 16,716 WOF-compressed files, reading each file right
after ntfscat had read its stream gave wrong contents for 1,051 of them,=

nearly all files spanning more than a few 32 KiB frames. With this patch=

all 16,716 read correctly, and plain reads with a cold cache were
correct both before and after.

The same helper is used for writes (ni_write_frame(), and
ni_decompress_file() via ni_read_frame()), so on a read-write mount the
data could be written to the wrong place on disk as well.

Map the page that contains lbo. op is already limited to the end of that=

page, so a single kmap_local_folio() mapping is enough.

Fixes: f35590ee26f5 ("fs/ntfs3: remove ntfs_bio_pages and use page cache=
 for compressed I/O")
Cc: stable@vger.kernel.org # 6.19+
Signed-off-by: Senjin <senjin@hatchling.org>
---
 fs/ntfs3/fsntfs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 97c04ab..3340e72 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1557,12 +1557,17 @@ int ntfs_read_write_run(struct ntfs_sb_info *sbi=
, const struct runs_tree *run,
 		if (op > bytes)
 			op =3D bytes;
=20
-		kaddr =3D kmap_local_folio(folio, 0);
+		/*
+		 * The folio may be a large folio that starts before
+		 * lbo (e.g. created by readahead on the block device),
+		 * so map the page that actually contains lbo.
+		 */
+		kaddr =3D kmap_local_folio(folio, offset_in_folio(folio, lbo));
 		if (wr) {
-			memcpy(kaddr + off, buf, op);
+			memcpy(kaddr, buf, op);
 			folio_mark_dirty(folio);
 		} else {
-			memcpy(buf, kaddr + off, op);
+			memcpy(buf, kaddr, op);
 			flush_dcache_folio(folio);
 		}
 		kunmap_local(kaddr);
--=20
2.56.0
