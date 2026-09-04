Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E7399CF0
	for <ntfs3@lists.linux.dev>; Fri,  4 Sep 2026 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550386; cv=pass; b=ehESq8oNg57rykVflozSlHKifSKWTXj8OGCkMnBSyvb3RyaP4vobLjI7lknvdMbvUnrIUgQofbnf6y5R5RUBYmRgXPVqhXOZeasKw/0h+js+/xhUc12X3LUli/3Ok7zGTzV/ORyZkEkt0FQ07X3G1tSwuCrCfbNZKNWGH7xZ+4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550386; c=relaxed/simple;
	bh=zvGOvXHAJp1shZcRChcErzxzpyVPh0f2Uh1cZttTleE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CaKRhR6O2lnRVRqXsCU2+QDKkqh56RfheC3XP8tgNYS2yXaq1iX1hcrrTperEevunl4NnV5sfxQ0+TOFObiZBoMQsmcgEP7ffJnradEDZQFPDNsypk33/oAIOVbzT/X7gtw4/wuOyoh2QjMPPbiLPLTdrt0/ipn7jGyhCuk7SeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adkWiwo1; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adkWiwo1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5cad1a6baso13325685ad.3
        for <ntfs3@lists.linux.dev>; Fri, 04 Sep 2026 12:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788550384; cv=none;
        d=google.com; s=arc-20260327;
        b=hgfNoEKZMO2ZYSgp0gUDduYYaClqZswDvfxDYi/4aOJyiR5yWjsd6OhnOUKCD8dNhv
         9INw75rZ9oNUynJEXOPrs+7y9lkCGbMXx8deCHKbEWxEw5hOoc3v1gTcho6cJSMgnFRK
         oadOBUGm1R0EAIX4BXimgU50aemzoLx8aD7nzf0oi7waE0O2UPDM4oXSXNXblTwPLsQP
         VED+JL8MVqP2thzmMRbGsN5QGRiKUiuUR21AwUOzHbTn1wnodGBWSh4CTaYKyLa1Y8Jj
         ud53ON9RyPgnB2aXg8/EK0NXlyRnmkCFay6YD400nO+q3qaoSvbum8gQh7eMNgGDhpet
         iXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=jB3v08RBkN7KF5rBTAl1q6yqyUqvF+COSA5mT/oj+d0=;
        fh=rWh9wnLZM644V9cck9EmmpmIr+OpXH4pMaLvPTsQrLM=;
        b=KAWY3qo2v2C9Wh/g5oDS+VYsI9/WoJF37jIZlQa3TaIak03Uht3xiceAFMXvHSGyx+
         U0ropv6EYzyV6jTP/hHK+HSlN4kOdoZDQMwUlwHiQhyjbbDg8bS1R6fDRVlGUbO8N3aq
         za4kCzWvSt+vSwuxxhq9OgZ4EqizXVdrLaBTpcwCHdeYOec1lUKTX0L6FocMIZLOqpCD
         S4uMYPxESC0JhXDboWc10kEN4+xxSMl+ShnuC0fI8zC+yz+efFckAMoF6XuqCJYsQ0mh
         L1nmyuKoXvejP5QGc/vEGno8PN8nw5HLW1FixkIFdEkq5JcfcR/uMYUJKOn17yMbJ8Ak
         WFVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788550384; x=1789155184; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jB3v08RBkN7KF5rBTAl1q6yqyUqvF+COSA5mT/oj+d0=;
        b=adkWiwo1NGjL/pICNVDHLlLGvdjHoU9c2sMQJxlvmaKq8RIzmT6uNI2ZRBK6kDogDq
         4u8TX9i6LRrrg94g0HYSiBrGXWkP3pdpR32JuxVVrAgqFPb5TpwDjuMxjrBM/UoeWHBS
         ts6KNQdoLNimHxjYinslYSRECSMR8h8gnuu790AcYMwvHGWlexMMSwNOOREMV2olMEDT
         0HDfBPs+X8BoZYKKkGvyYshqllzZ81fdk6MKU/OlgALvgGrqJul9Hos1kzxxRw8sPsvY
         9EZszmcecIV2NIEM68+as6BsZstLXe8LNChvj7dw5IaG0Q66i20YGChr41sRMDSIKKA5
         eoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788550384; x=1789155184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jB3v08RBkN7KF5rBTAl1q6yqyUqvF+COSA5mT/oj+d0=;
        b=E+YE/zDCzH5Qr3xmtp3GDsE4oSKbwshJ23mldwPqmyt5t+cQZEvI5RfcsGC1UcicAF
         cv8zo5KQ6Jyyb2RU1bWhjk6HYkEXZRPU2/sutDbEuxDjA/KrlyVx5Wmcwt9j2l0/C+Q/
         WLRgUcVt9wgntyZGo3BoGH33nRa2p0KVtdLMy2wXIUjvMFNtj1A/jANQwG8AUiPgimCR
         RAxr7AsyrhQXDHPBfYnEXazOqdlEujn+XPzykvVV0fg6vmPRMDKedMjFEfoD7Gw5+3xw
         hS6m7iQRnl40eRmdXeqv+jIxcYsvAj9zSsykArtq0doSjbD704aa+R7FqqYKV/dYvdXd
         Fy+g==
X-Gm-Message-State: AFuF++ljIrsvK7NfSyUveAyJ6r6ylQTxHkTeMpMU3qDDOi0CF7EuixqJ
	vkrGd55lqxYTBIJNmKmeQWiKQBYgooiyJyoY52bTaUGdEFoVKaCIRKOvVGXI4rqecAZm3KQtbTG
	Qxqd8RwOGDGTvws20XKAgDF8oVsqwFJtEXDas8w==
X-Gm-Gg: AYBFou2haE6f8HES/izJvg4CXTKjuVnIO5T2Ku76vgENBShPqn56miislMmr/drFWtg
	Zuhwnvibo9t5aXr7vfygwGtJPb/Auf89GFijBGBnhe6eVmooA9UyQgkzbJp/VhbDiskoBLrA182
	EmKwnUNJP7Uff3Vdu5N0t+12/0kgSFWWkAT66CYYrb9+GIg+eYiigAOJk9F4hyTo9vVorBZeBih
	+21gx0Uv6ONF5xdHbCQ3k6YkqX0WBy89O9A/8rBdbKq9REb2NHIKppEPiwUfOcXcObyMO4i/Q61
	2IkVqhMhMDWTHjPItzIvBIe+QWxFI1yz7pdxjA5R1yfGjo5uEOBHRHHKpnuz0as7U77tLiH+US4
	UmEsjyHyR5aM=
X-Received: by 2002:a17:903:8c3:b0:2d6:fec3:bd57 with SMTP id
 d9443c01a7336-2db125c2f3cmr135994915ad.14.1788550383958; Fri, 04 Sep 2026
 12:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?5pmT6aOO5q6L5pyI?= <xfcyhuang@gmail.com>
Date: Sat, 5 Sep 2026 03:32:53 +0800
X-Gm-Features: AcwNN1XElmasuByWvxqwp2qWbd3EOtwHXgGNQs-62uKN_28XyLbAkWkEVdBBaVk
Message-ID: <CAC_Ok8x21q=Fy4n7V5j78G3rn5ByHpLVRiM4FrYGaJnmdFiP_w@mail.gmail.com>
Subject: [REPORT] fs/ntfs3: several bugs in ADS support merged for 7.3
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kernel: linux.git master, commit 986c24e0fe44 (includes the
"ntfs3_for_7.3" merge dc83d18cdd90, which introduced basic ADS support
in be310476e886). The ads mount option defaults to on
(fs/ntfs3/super.c: opts->ads =3D 1).

The ADS design introduces a per-stream inode whose ni->base points at
the base file inode; all attribute-list/MFT operations redirect to the
base. Most ni_find_attr(..., ATTR_DATA, ...) call sites were updated
to pass ni->file.ads.name/len, and the base's ni_lock is taken via the
redirected inline helpers. A number of call sites were missed, and the
stream-inode creation path never takes the lock at all. Findings
below, ordered by severity. All call chains were verified against the
source; none of this is present in the Paragon linux-ntfs3 master
branch (identical to torvalds/master as of today).

1. Compressed streams read/write the wrong attribute (data leak +
uninitialized-variable UB) =E2=80=94 HIGH
ni_read_frame() (fs/ntfs3/frecord.c:2306) and ni_write_frame()
(fs/ntfs3/frecord.c:2554) redirect ni =3D ni->base and then look up the
unnamed $DATA attribute:


c
attr =3D ni_find_attr(ni, NULL, &le, ATTR_DATA, NULL, 0, NULL, NULL); /* :2=
306 */
attr =3D ni_find_attr(ni, NULL, &le, ATTR_DATA, NULL, 0, NULL, &mi);  /* :2=
554 */
For a compressed stream this finds the base file's default data
attribute instead of the stream. The call chain is reachable for
stream inodes:

read: ntfs_read_folio() checks is_compressed(ni)
(fs/ntfs3/inode.c:851). ni->std_fa of a stream inode is set from the
stream's attribute flags in ntfs_init_ads_node(), so a LZNT-compressed
stream passes the check and reaches ni_read_folio_cmpr() ->
ni_read_frame().
write: buffered writes to compressed files go through
ntfs_compress_write() (fs/ntfs3/file.c:983+) -> ni_write_frame().
Consequences, depending on the base file's default attribute:

Default attribute resident: ni_read_frame() takes the early
!attr->non_res branch and does memcpy(frame_mem, resident_data(attr) +
frame_vbo, ...) =E2=80=94 the stream's folios are filled with the base file=
's
content. cat file:stream returns the base file data: cross-stream data
leak.
Default attribute non-resident and not compressed: neither the WOF
branch nor is_attr_compressed(attr) matches, so control falls into the
else { __builtin_unreachable(); } branch
(fs/ntfs3/frecord.c:2450-2453). Execution continues with uninitialized
ondisk_size, vbo_disk and clst_data: kvmalloc(ondisk_size) /
ntfs_read_run(sbi, run, frame_ondisk, vbo_disk, ondisk_size). This is
real UB in release builds (the __builtin_unreachable() also entitles
the compiler to assume the branch is dead).
Default attribute compressed: frame parameters (cunit, valid size,
on-disk frame size) are computed from the default attribute while data
is read/written through the stream's ni->file.run =E2=80=94 silently corrup=
ted
stream data.
ni_write_frame() on a base whose default attribute is resident calls
attr_make_nonresident() on the default attribute with the stream's
pages (fs/ntfs3/frecord.c:2571).
Same missed-name pattern in:

ni_new_attr_flags() (fs/ntfs3/frecord.c:1722) =E2=80=94 see item 5,
ni_decompress_file() step 5 (fs/ntfs3/frecord.c:2164) =E2=80=94 FS_IOC
decompress on a stream inode would strip the sparse flag from the
base's default attribute.
Fix: pass ni->file.ads.name/len (captured before the ni =3D ni->base
redirection, since after it ni->file is the base's) at frecord.c:1722,
2164, 2306, 2554.

Reproducer sketch: on a NTFS volume mounted with ntfs3 (default
options), create a compressed stream, e.g. from Windows: compact /c
foo.txt:s1 or copy a file into a compressed folder with a stream name;
then on Linux cat foo.txt:s1, and/or write to it.

2. Stream creation and enumeration run without ni_lock =E2=80=94 HIGH (conc=
urrency)
ntfs_lookup() takes only the directory lock, then calls
dir_search_flags() -> ntfs_iget5_flags() -> ntfs_init_ads_node()
(fs/ntfs3/inode.c:522), which operates on the base inode with no lock:


c
while ((attr =3D ni_enum_attr_ex(nb, attr, &le, NULL))) { ... }   /*
unlocked walk of base's attr list */
...
err =3D ni_insert_resident(nb, 0, ATTR_DATA, ads_name, ads_len, &attr,
NULL, NULL);  /* unlocked record mutation */
The insert branch is reachable from userspace: open("file:stream",
O_CREAT) on a stream that does not exist walks the dentry with
LOOKUP_CREATE (fs/namei.c passes nd->flags into ->lookup), the lookup
succeeds by creating the on-disk attribute, and ->create is never
called (ntfs_create_inode's EINVAL check for colon names is never
reached for this path).

Meanwhile every metadata mutation on the base file (truncate, append,
attr-list growth) is serialized by the base's ni_lock. Concurrent
open("f:s2", O_CREAT) vs. truncate("f", ...) therefore mutate the same
MFT record / attr_list without a common lock; the attr_list can also
be reallocated (al_add_le -> kvrealloc) while another CPU walks it in
ni_enum_attr_ex() =E2=80=94 UAF-class read window and record corruption.

ni_query_ads() (fs/ntfs3/frecord.c:3384, the file:query_streams
pseudo-file) likewise enumerates the base's attribute list under only
inode_lock_shared() of the stream inode.

Fix: take ni_lock(nb) (the base lock) around the enumeration and
around ni_insert_resident() in ntfs_init_ads_node(), and inside or
around ni_query_ads().

3. Clusters of a deleted stream are never freed =E2=80=94 MEDIUM
ntfs_unlink() for a stream inode (fs/ntfs3/namei.c) only calls
ni_remove_attr() (removes the attribute record + attr-list entry) and
drop_nlink(). Reclamation of the stream's allocated clusters would
have to happen in ni_clear():


c
if (!ni->vfs_inode.i_nlink && ni->mi.mrec && is_rec_inuse(ni->mi.mrec) && .=
..)
        ni_delete_all(ni);                     /* frecord.c:105 */
but a stream inode's ni->mi.mrec is always NULL (ntfs_init_ads_node()
only sets mi.sbi/mi.rno), so ni_delete_all() is skipped and
run_close(&ni->file.run) just drops the in-memory tree. Result: every
non-resident stream deletion permanently leaks its clusters from
$Bitmap until chkdsk.

Fix: on stream unlink, truncate the stream attribute to 0
(attr_set_size(..., 0)) / explicitly run_deallocate() the stream run
before removing the attribute.

4. ni_query_ads() zero-fill branch desyncs iter vs. return value =E2=80=94 =
MEDIUM
fs/ntfs3/frecord.c:3429:


c
if (vbo >=3D end) {
        iov_iter_zero(bytes, iter);
        break;
}
iov_iter_zero() advances the iterator by bytes, but neither ret nor
*pos is updated. For read(2) the caller only uses the return value,
but for splice/sendfile-style consumers (copy_splice_read ->
read_iter) the kernel rolls ki_pos back by the returned count while
the iter was advanced =E2=80=94 pipe contents get misaligned/duplicated.

5. setxattr on a stream inode mutates the base's default attribute =E2=80=
=94 MEDIUM
fs/ntfs3/xattr.c:894: a stream inode's i_mode is copied from the base
(S_IFREG), so S_ISREG() passes and ni_new_attr_flags(ni, new_fa) is
called; that function redirects to the base and looks up the unnamed
$DATA attribute (frecord.c:1722). Setting e.g. setfattr -n
system.ntfs_attrib -v 0x08000000 file:stream (sparse bit) applies the
sparse/compressed conversion to the base file's default attribute
(in-place attribute resize, c_unit change, a_ops switch), silently
ignoring the stream. The in-function guard only prevents the
conversion when the default attribute is non-empty, so data-destroying
effects are limited to empty base files, but the operation always
lands on the wrong object and the stream request is silently lost.

6. ntfs_test_inode() matches any stream request against a directory =E2=80=
=94 LOW
fs/ntfs3/inode.c:657: a cached directory inode returns "match" for any
ADS name, so stat("dir:anything") succeeds returning directory
attributes instead of an error. Harmless from a memory-safety point of
view (subsequent open fails with EISDIR), but incorrect for malformed
images that place named $DATA attributes on directories.

7. Minor
ntfs_set_label() (fs/ntfs3/fsntfs.c:2675) undoes the ADS name split by
restoring uni->len but not the colon character that
ntfs_nls_to_utf16() overwrote with NUL, and not the byte order of the
tail on big-endian: label "a:b" is stored as "a\0b".
ntfs_create_inode() (fs/ntfs3/inode.c:1419): strchr(name->name+1, ':')
skips the first character, so names starting with ':' are not
rejected; the message "failed to create ads" actually means "creation
of ADS is refused".
ni_rename() (fs/ntfs3/frecord.c:2846): const int way =3D 1; keeps a
permanently dead branch alive.
ntfs_setattr() (fs/ntfs3/file.c:753): silently drops ATTR_SIZE for
stream inodes =E2=80=94 truncate("file:s") returns success without doing
anything; -EOPNOTSUPP would be honest.
All findings verified on master 986c24e0fe44 ("Merge tag
'hid-for-linus-2026090401'"); the Paragon linux-ntfs3 master is
currently identical for fs/ntfs3, so none of this is fixed upstream
yet. Happy to follow up with patches for items 1-5 if the approach
sketched above is agreed.
