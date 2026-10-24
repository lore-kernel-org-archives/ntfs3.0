Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.11.79.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841222;
	b=gdyykrJ+sTrMAi5aLj99jFkWDzQXjyViYYTxP0YKxFh5HAUlZpHUGrEQHv2od+BLH/j6
	 DHNULL0zYZ/mfI1H2hBnMnFLwSZ0xk2m5fimHUoZgDPvaKvS3vX25LAZipudZwuA8UHzB
	 4X5CQZKrocuL6Pr4l6X5EAyuXq5yGeNNEQTu2uE5+0yjCjLZgzwVOHNvyCJjLjgL+9uaN
	 8b0DfI959NXklhflgJjs0WUXhsHI6aZyZkhr9NDhqbfQ5M7PrnL8rFcURt6XhUQDUlNtD
	 1H9L0VsdGwTUfQRi0xCrwYRMkQnvHDwEHVpYxWc9jruiltHmdR+m6NPDfplMNlgsxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841222;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer-Info:Subject:
	 From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:
	 Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1ePy/7DtRjSH/7YiNDxqRZYlYA7Rkm9Xz1sKnQwiPM=;
	b=BAoPWRmsvl0+sMecwNwmtYYktkdU1CmWZO7zaLRD14qOBucItG8MMgCint4zRol/kUtr
	 ciiei21qnApL835vX0kJRcw9A6e8FW/nNags/LeG269AsJOUMWEr0kt85hBdFngPrxQ6x
	 rT0yhibb4Fwl2AZ0feysbxMjK5n1ue7BLkxF7fCIqWktzIsO74NV0/fkzA7EPApfIalTs
	 fm4gaJQPUoN9YjXE9GljOJDspykVP5y9KlzccNMwMS94yiVW00iqIhV70TpReKEh0DWpq
	 vToFuDHrcifUe6FQZGGr0xlwI3NCrLh4HjKW/FXoVzz8pckA+yMMehyfxCkMvIuiDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hatchling.org;
	spf=pass smtp.mailfrom=mta.hatchling.org;
	dkim=pass header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=GZ14414o;
	dkim=pass header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=eV7mhUbg;
	arc=none smtp.remote-ip=212.11.79.130
Received: from mail130.mailersend.net (mail130.mailersend.net [212.11.79.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162F606A31B
	for <ntfs3@lists.linux.dev>; Sat, 24 Oct 2026 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6162F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=GZ14414o;
	dkim=pass (2048-bit key, unprotected) header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=eV7mhUbg
DKIM-Signature: a=rsa-sha256; bh=J1ePy/7DtRjSH/7YiNDxqRZYlYA7Rkm9Xz1sKnQwiPM=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1792841212; v=1;
 b=GZ14414op2+1liAWGRoHRhs9U0zSh0MlWlM0kH/SFiERjPgMB0re+hufJTiLR5rFjlfXyEBy
 ufFK2qsIbkGc5OuvpeyA5EPwr/LfccxPNRY6lQHRSElYyAWvBKVRyPE6RbiaiY4QDMakJJIC3ba
 EBLmN9nyA0Wx0Zi3LFiP5yLQ=
DKIM-Signature: a=rsa-sha256; bh=J1ePy/7DtRjSH/7YiNDxqRZYlYA7Rkm9Xz1sKnQwiPM=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=ms1; t=1792841212; v=1;
 b=eV7mhUbgTS58Xs1R0ulhjzWzdE4n2yt4/xda4CfDagdxDWxmFCCepfe5l/MP8KO3KYRmPzsw
 WD6wfIc2VjiIedTJYaZVRRD3zHiozlATlMVukC6lSp2/deOLhyiy5mFHY5PY0Ym6vwcZbN2+dBI
 dLscdJ6/7QsA6wQljMreLo/qyIycpNu/fLCIQJCsPVHoXcDwXrkJ3MAfsYm1120B0ndMaWa2QKv
 NqV2aorzkQxycg22pPk4yK0PtV+2Di+L5RHw8OUPQ7QqwZdR7N9IQr6usowC9HT57XoV98k2OSs
 S3OO/XPFXX9tOC+X+2RBcJzf/ixQpiiLHlhoGPoHTshYQ==
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH] fs/ntfs3: fix SEEK_DATA/SEEK_HOLE on externally compressed (WOF) files
From: Senjin <senjin@hatchling.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Senjin <senjin@hatchling.org>,
 ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 stable@vger.kernel.org
Date: 24 Oct 2026 11:26:52 -0000
Received: from 10.8.11.244 by 10.132.0.99 with http; 24 Oct 2026 11:26:52 +0000
Message-ID: <6adc95fc26efdd1658b01fc5@mailersend.net>
X-MailerSend-RecipientID: 6adc95fc26efdd1658b01fc5;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6adc95fb646700d215d33fb3
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

ni_seek_data_or_hole() only treats a sparse cluster run as still
containing data when the file uses classic NTFS compression
(FILE_ATTRIBUTE_COMPRESSED, LZNT1) and the run isn't aligned to a
NTFS_LZNT_CLUSTERS (16 cluster) boundary. It never checks whether the
file is externally compressed (WOF, reparse point, Xpress/LZX,
NI_FLAG_COMPRESSED_MASK).

For an externally compressed file, the main $DATA attribute's run list
is not frame-compressed in place like LZNT1: it is one continuous
sparse run end to end. The actual compressed bytes live in a separate
named attribute ("WofCompressedData", see ni_read_frame() and
ni_decompress_file()), and ni_read_folio_cmpr()/ni_read_frame()
reconstruct every logical byte of the file on a normal read. There is
no real hole anywhere in such a file.

Because ni_seek_data_or_hole() never recognised this, SEEK_DATA on an
externally compressed file walks its one sparse run straight to
EOF_LCN and returns -ENXIO for the entire file, as if it were empty.

This silently corrupts anything that trusts SEEK_DATA/SEEK_HOLE to
decide what to copy. cp(1) on a modern coreutils probes the source
file with lseek(SEEK_DATA) before falling back to a plain read loop;
when that probe comes back -ENXIO at offset 0, cp treats the whole
file as a hole, punches a hole of the same size in the destination
with fallocate(FALLOC_FL_PUNCH_HOLE), and never calls read() at all.
The result is a destination file of the right size that is entirely
zeroed, copied without any error being reported anywhere.

Confirmed with strace: cp of a WOF-compressed file does exactly this,
producing an all-zero copy every time, unconditionally (no large-folio
readahead trigger needed, unlike the page-mapping bug fixed earlier in
this series). A plain read() of the same file, e.g. via Python's
open().read(), decompresses correctly throughout.

This is not a new class of problem for this driver: ntfs_fiemap()
already special-cases is_compressed() and refuses fiemap outright for
any compressed file, with a comment noting that "cp -r incorrectly
treats compressed clusters". bmap()/FIBMAP is also unreachable for
compressed files, since they use a separate address_space_operations
table (ntfs_aops_cmpr) that has no .bmap. SEEK_DATA/SEEK_HOLE was the
one remaining place that exposes the main attribute's raw run-list
layout to userspace without either accounting for external compression
or refusing outright, which is how this went unnoticed until a plain
cp hit it.

Treat an externally compressed file as having no holes: SEEK_DATA
returns the requested offset whenever it is inside i_size, and
SEEK_HOLE returns i_size (the implicit hole at EOF, same as for any
other file). This mirrors how the already-existing LZNT1 case is
handled, just without pretending the WOF run list carries any
frame-aligned structure it doesn't have.

Fixes: c61326967728 ("fs/ntfs3: implement llseek SEEK_DATA/SEEK_HOLE by =
scanning data runs")
Cc: stable@vger.kernel.org # 7.0+
Signed-off-by: Senjin <senjin@hatchling.org>
---
 fs/ntfs3/frecord.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index a8b696d..d77465d 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2910,9 +2910,32 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni=
, loff_t offset, bool data)
 {
 	int err;
 	u8 cluster_bits =3D ni->mi.sbi->cluster_bits;
-	CLST vcn, lcn, clen;
+	CLST vcn, lcn, clen, frame_clusters =3D 0;
 	loff_t vbo;
=20
+	if (ni->ni_flags & NI_FLAG_COMPRESSED_MASK) {
+		/*
+		 * Xpress or LZX (WOF). The main data attribute's run list is
+		 * entirely sparse: the real, compressed bytes live in a
+		 * separate named attribute (see ni_read_frame()) and every
+		 * logical byte in [0, i_size) is reconstructed on read. There
+		 * is no hole to find here.
+		 */
+		loff_t i_size =3D i_size_read(&ni->vfs_inode);
+
+		if (data)
+			return offset < i_size ? offset : -ENXIO;
+
+		return i_size;
+	}
+
+	if (ni->std_fa & FILE_ATTRIBUTE_COMPRESSED) {
+		/* LZNT compression: compressed frames are embedded directly
+		 * in the main data attribute's own run list.
+		 */
+		frame_clusters =3D NTFS_LZNT_CLUSTERS;
+	}
+
 	/* Enumerate all fragments. */
 	for (vcn =3D offset >> cluster_bits;; vcn +=3D clen) {
 		err =3D attr_data_get_block(ni, vcn, 1, &lcn, &clen, NULL, false,
@@ -2960,8 +2983,8 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni,=
 loff_t offset, bool data)
 				break;
 			}
=20
-			if ((ni->std_fa & FILE_ATTRIBUTE_COMPRESSED) &&
-			    (vcn & (NTFS_LZNT_CLUSTERS - 1))) {
+			if (frame_clusters &&
+			    (vcn & (frame_clusters - 1))) {
 				/* Compressed cluster in compressed frame. */
 				break;
 			}
@@ -2975,8 +2998,8 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni,=
 loff_t offset, bool data)
 			 */
 			if (lcn =3D=3D SPARSE_LCN &&
 			    /* native compression hole begins at aligned vcn. */
-			    (!(ni->std_fa & FILE_ATTRIBUTE_COMPRESSED) ||
-			     !(vcn & (NTFS_LZNT_CLUSTERS - 1)))) {
+			    (!frame_clusters ||
+			     !(vcn & (frame_clusters - 1)))) {
 				/* Hole in sparsed or compressed file frame. */
 				break;
 			}
--=20
2.56.0
