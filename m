Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4373B7760
	for <ntfs3@lists.linux.dev>; Mon, 14 Sep 2026 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420604; cv=none; b=a1zruKEkhYUKnMWvsPw03YIl59sH4QtY/MZbIoqKUCilDZxA0d2MppR8CBZL3VUlofSsv0M6ZMBScl/a7/TMea0y1Vo91CBGJe9YKUUIpcaVW8tMwM7Os0Y4Eqb9rmE9Pqj3Bcf2eor7T0OAg3Br4k29sInHDMKlENGv4FZRJcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420604; c=relaxed/simple;
	bh=W+JE7JPVt6/Na9NslGoDRa2gEJpyxJc+zuyfzIaEVJA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tf1Pj3fnaRsXuOpqRYSf7iJ12LA9q94+PBt8Zzc3LfildyWYXhmDlom0Fb8pvcL9nkBJKyzh68R9ago/4vUx8PpsCcQOCvYntuPRcXUfN0WXEsy34TM5ZiCOKWlVeKKR0BH5iA83L1TKxoDWr5ZGAL5/WEvcd1yzUzjN/CpFQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ymovneyy; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ymovneyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789420590; x=1789679790;
	bh=+WPtYFMqE1Vfo/MLjZF9A1KgMfZ28NL+WJVeQ5x0+gY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YmovneyynssoFLUw4gW01/RlIktj7gZXtd8P9QN4Z+5flgrG6VRR049SfgykTipuc
	 ZYK/rj7aB7yUSCk6R6IrYEYRDIG45hJwOhA4u4CCShQmTPCtGO20W95oZ2RnwBDWGe
	 RXDFKsoRXjyMaxZkVbqeWKktRmaFs2ssEsydySh6ieWcjG2t6plOm9u6/Kt39Vv7Zz
	 ZBrE41CnqRJHZSFM/VqGpeOZfGuxMdP9ncKwhoD/chvhfVG8F85XtlyYfG936X0x4+
	 2/xVroBatW9uQB0Mw2MZb/a0iWI8lTY3oVEa6Q25OkNmy0Rj80Q7WYbr4Fipqss6AT
	 S0s+rqwuzPvFw==
Date: Mon, 14 Sep 2026 21:16:26 +0000
To: "almaz.alexandrovich@paragon-software.com" <almaz.alexandrovich@paragon-software.com>
From: sulamufor <sulamufor@proton.me>
Cc: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: ntfs3: lookup with nocase returns ENOENT when name case differs from $FILE_NAME and inode is not cached
Message-ID: <b-QfpgeIM7Dlb6u4_o6qJhNO7ulaAq_u3NdHYuIPiRICddaT6UipUPJOH7p1W9o4OQStfgJzX2sn3uQYdkygel1cEM5QlXo4TnCdSbsEgsc=@proton.me>
Feedback-ID: 221793378:user:proton
X-Pm-Message-ID: ac861e46777dc6f8b96c6bb7d84115f56222292a
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

with ntfs3 mounted with the `nocase` option, looking up a file whose name d=
iffers only in case from the
on-disk name fails with ENOENT as long as the inode is not yet in the inode=
 cache. Once the inode has been
loaded by some other path (e.g. readdir), the same lookup succeeds.

Kernel: 7.2.5 (CachyOS build, unmodified fs/ntfs3). The relevant code is id=
entical in current mainline and
in the Paragon linux-ntfs3 tree. Without `nocase` the same lookup fails con=
sistently (as expected), so the
inconsistency is specific to the `nocase` option.

Minimal reproducer (fresh image, no special content):

    #!/bin/sh
    set -e
    IMG=3D$(mktemp /tmp/ntfs3-XXXX.img); MNT=3D$(mktemp -d /tmp/ntfs3-mnt-X=
XXX)
    truncate -s 64M "$IMG"
    mkfs.ntfs -F -q "$IMG" >/dev/null
    mount -t ntfs3 -o loop,nocase "$IMG" "$MNT"
    : > "$MNT/Foo.TXT"
    umount "$MNT"
    mount -t ntfs3 -o loop,nocase "$IMG" "$MNT"
    stat -c '%n ino=3D%i' "$MNT/foo.txt"   # -> ENOENT
    stat -c '%n ino=3D%i' "$MNT/Foo.TXT"   # exact case: OK, loads the inod=
e
    stat -c '%n ino=3D%i' "$MNT/foo.txt"   # -> now OK, same inode
    cat "$MNT/FOO.txt"                   # -> works

Output on 7.2.5:

    stat: cannot statx '/mnt/foo.txt': No such file or directory
    /mnt/Foo.TXT ino=3D27
    /mnt/foo.txt ino=3D27
    hello

Listing the directory (`ls`) instead of the exact-case access has the same =
effect.

The same happens on a long-running mount whenever the inode gets evicted (o=
bserved with a large read-only
game asset tree accessed by a Windows application under Wine: after a reboo=
t or under memory pressure a
subset of files that the application references with different casing than =
on disk "disappears", and
listing the directory makes them come back).

Analysis:

The directory index lookup itself honours `nocase`: `cmp_fnames()` in fs/nt=
fs3/index.c compares with
`sbi->upcase` and `both_case =3D ... && !sbi->options->nocase`, so `dir_sea=
rch_u()` finds the entry and
calls `ntfs_iget5_flags(sb, &e->ref, uni, ...)` with the *caller-supplied* =
name.

If the inode is not cached, `ntfs_read_mft()` in fs/ntfs3/inode.c then walk=
s the $FILE_NAME attributes
and compares each against that name with

    if (name && name->len =3D=3D fname->name_len &&
        !ntfs_cmp_names_cpu(name, (struct le_str *)&fname->name_len,
                            NULL, false))
            is_match =3D true;

`ntfs_cmp_names_cpu()` with `upcase =3D=3D NULL` never takes the case-insen=
sitive path, so this comparison is
always case-sensitive regardless of the mount option. `is_match` stays fals=
e and the function returns
-ENOENT (`if (!is_match && name) { err =3D -ENOENT; ... }`).

If the inode is already cached, `iget5_locked()` returns it without calling=
 `ntfs_read_mft()`, hence the
lookup succeeds =E2=80=94 which is why readdir (which loads the inodes) or =
an exact-case access appears to "fix" it.
