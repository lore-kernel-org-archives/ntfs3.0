Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295014;
	b=QrURO/kXViF3bzAHqUJbRlQM5TMutr66pqTUobl9wb4inaVSSo4/bFYu7L0qABhvWNn1
	 F0Ljb1CCRJ5dy4xcqdHUQB/pJTnbbjCcSyzVya3WrhavGZDiMfV2C05Q6LASuB2gvUnfn
	 zb9xzkXyWpkWNiotfH9Ce6LOSo0U2YJON9NE7iSsDrhNGm00UWbUDm92CEgja/Yf7+T0K
	 0WhBXQALK6uHPoUdD356Wk3M70CWD2O09rBkMrrloeAv7R8uA3kABGg8BP6ZjbLHxiQe9
	 AowglETE5ywREBNvKuTYgDHGKMhqMmaM7ADkIEFbPR+h9RXdokU8YF7fTnQbg+PV0ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wjBbZLmL2nJWDltpNm4adLX/POwuycJOXIJ8cPOk5kw=;
	b=ckDo3f8JuFslvrAe1rBC2jRsebZsHvsQ/v60cE7x9OZ55PVeScCj4fkCys+rA+5pO4x7
	 13ImzmM4fwxFWW1xWSBAzI/2KxMa+FqALPHmmr+cUheYe8lHqer4P/8zfCqKNcyqFN4gQ
	 0XSyT3+i3kjtdV/ZNnM6+QNgIpJPoAzeLSBq/9YXPu5mmKmJ8Q6L3U7W6FEfdHAimSF3/
	 VMSbeEkmMagacOXJonAH0MTaZyzHBFPeCrFqlgqoYeI3R5kj8NMi55ykzXm4kxneDrPX3
	 VHiK+HLw2OfPa9Bwy/IHp4LEyNXDJlXzfWjqf0iILOz0qdKKCN36b/UyHYtkB+IZwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Swb7q2XO;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B50D606A322
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 17:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B50D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Swb7q2XO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so24710635e9.2
        for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295012; x=1793899812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjBbZLmL2nJWDltpNm4adLX/POwuycJOXIJ8cPOk5kw=;
        b=Swb7q2XO3mOdn3oCp3o19lJmJ9bdkbMLMsoV3rOe0gfg7RNwJ8ajQkT2xAuAf4uCuE
         K59KRYyT29abAi+dpV7PtxFGLtrMDGPtaU0Wp5YDKH8UeMRuhFw8lQTBLORkDliDuBv5
         ajx8DuAB0xY2NZ0E1sV8NuqnGBNLMMpKhE1dzp2rs5Ij2Yt1SXx8sKBTioC76l3e6Qhs
         qmI8XGZrURK36uKFcFjDX3yonfjw1G7HYMBEnGV2BE7ZXalSOsnhAfuIS/Nksq/pDruY
         rPhqF9WaYKIF0pkE+UJjtHv2Yqo11Z6tFzjjcL67qluRYF4N3ZWJ+bb8q+FIwUVcJnfh
         FMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295012; x=1793899812;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjBbZLmL2nJWDltpNm4adLX/POwuycJOXIJ8cPOk5kw=;
        b=c8k3C7D1F4sZiLLZ/A9zL/9Vo+WhmGNks/j8iGDaKJAnOmrwTO7dzz2qOe8lfEPz6U
         Bq8AHPhb07cXSEXtYmZGaMr7I1As8NlFdyYq7S7VZ96l2CBcfPFIvTnl/wo/DCir9lu8
         xQvpjs14zbOIEE/QC92oUJOa1mHjMzdDacFQ9Xt3QBMc6JX/eAR/aSrrn/vvQnsqAW7t
         CgaGtro9N7H3HkBt2zABuVOryvvByky5Dxk48NTZnl+7+z/CBbKf/2jtXVrSUjvpBUjK
         QWBopX8OsyjjJWs4OPahgS5dC9pfZfC7BoYtO87b9wotclwBI/kFJLyScB7xGPGkvVSJ
         kPcQ==
X-Gm-Message-State: AFq9FYIDvIYaPq+e/lSVm2riZjMmzGy1au3QFZJ8QER8Cn60puGKqCfg
	xIahyMDsSFdTPD4nc0kFw8P7da5E1YpfrDGYeGmdjzOXlO9nE5ay61qjApbEZT/zEZg=
X-Gm-Gg: AYBFou1Sto5nv1WyxT9WbvGzPegWhvodFC5MISEtwB11tBdPSxhoPj8+harZQVTCN06
	GG0mxWE2h2FyTreO11LQa1oziAs0T5TFfM71r0W+EDjDhmQAV73tdTftMX3IBA5Catt1MNnDY7x
	SHFvEVu3IBSkaVqRZ06GhcnoMGxZ/P9yrsBpdtV65XSLE0xGTi7oGGyINRV9nP1rgz5vMPL0BG4
	WUKdLwNqxlCxn8V31g1mDUvzs9r+1+FAhES4yKIwhoB1SZtMxOJIv7qJmQJwA3M8dDKu/eamyl0
	zAJ2kw6ApgybH/ElhEzQUd/T4YX/0rkRdT2pH8NB2RyHEc1nBccTFZAb1ks4hP8iv/J7eM/YMGF
	2COz6RlOquzvQgBYU88mZA5uIRnmHGuwEwGlyYJcEp0fFuRmEAjqUDdtlTsXtpuDCTqryAIT1qq
	UUz0l1yxZIlklf9rR0dFXW4bi1/Ws/rYEDkaqkVafApV+3M6xvgKENyP4NH6IJVzyEI3X2Je63r
	v6qogfBNBTkNe2Cs7rY1f/aI8XAgHKwwUpwp5vGBLu83wbzXIMszC2pSlE3BJlVC7+Lw8EoJcPb
	yT7gU6Y1F1KRH4jA1skA8mDSHkaTkjAmM6FS9FfF3hAHT+2c8lc7dW76ktsbQPbnrsxCmK8=
X-Received: by 2002:a05:600c:4e42:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a9678c276dmr141729545e9.30.1793295011657;
        Thu, 29 Oct 2026 10:30:11 -0700 (PDT)
Received: from macstation (109-206-198-198.host.skynet.net.pl. [109.206.198.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df8804bsm461805f8f.15.2026.10.29.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:30:10 -0700 (PDT)
From: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: [BUG] ntfs3: symlink() fails with ENOENT when $Reparse reuses an index block in an unloaded $INDEX_ALLOCATION segment
Date: Thu, 29 Oct 2026 18:26:55 +0100
Message-ID: <20261029172655.432752-1-m.sadowniczyk@gmail.com>
X-Mailer: git-send-email 2.56.0
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
Content-Transfer-Encoding: 8bit

Hi,

on one of my NTFS volumes, every symlink() started to fail with ENOENT,
while creating regular files, directories and hard links kept working.
The volume is consistent (ntfsfix -n on the unmounted device reports no
problems), remounting does not help, and nothing is logged to dmesg.
It is reproducible from scratch on a freshly made image (script below).

Kernel: 7.3.0 (CachyOS 7.3.0-4; fs/ntfs3 identical to linux-7.3.y).
The code path described below is unchanged in linux-next and in the
Paragon devel tree as of 2026-10-29.

How it showed up
----------------
Proton (Steam's Wine) builds each game prefix out of ~1350 symlinks. After
a dozen prefixes had been created and some deleted on the volume, building
a new prefix died partway through with:

  os.symlink(...) -> FileNotFoundError: [Errno 2] No such file or directory

At that point $Extend/$Reparse held ~15k entries, and its $INDEX_ALLOCATION
was split over two MFT records via $ATTRIBUTE_LIST (records 26 and 111941
in ntfsinfo -F '/$Extend/$Reparse').

Where the ENOENT comes from
---------------------------
function_graph trace (funcgraph-retval) of a failing symlink(), cut down
to the relevant calls:

  ntfs_create_inode() {
    ntfs_insert_reparse() {
      indx_insert_entry() {
        indx_insert_into_buffer() {
          indx_add_allocate() {
            ni_find_attr() {
            ni_find_attr() {
          } /* indx_add_allocate ret=0x0 */
          indx_new() {
            ntfs_get_bh() {
              run_lookup_entry(); /* ret=0x0 */
            } /* ntfs_get_bh ret=-2 */
          } /* indx_new ret=-2 */
        } /* indx_insert_into_buffer ret=-2 */
      } /* indx_insert_entry ret=-2 */
    } /* ntfs_insert_reparse ret=-2 */
  } /* ntfs_create_inode ret=-2 */

indx_add_allocate() finds a free bit in the $R bitmap that lies within the
existing allocation ("Reuse index." branch, so attr_set_size() is not
called). indx_new() then calls ntfs_get_bh() on indx->alloc_run for that
VBN. The runs for that part of $INDEX_ALLOCATION live in an extension
record and have never been loaded into alloc_run, so run_lookup_entry()
fails and ntfs_get_bh() returns -ENOENT.

indx_read() handles exactly this case: on -ENOENT from ntfs_read_bh_ra()
it calls attr_load_runs_range() for the block and retries. indx_new() has
no such fallback.

Reproducer
----------
Needs root, mkntfs (ntfs-3g) and python3; uses a 2 GiB sparse image.

  1. mkntfs a 2 GiB image, mount it with ntfs3.
  2. Create 40000 symlinks, writing an 8 KiB file after every 40 so that
     the $R allocation gets fragmented and spills into extension records.
  3. Delete 20000 of those symlinks (frees $R index blocks), umount.
  4. Mount again and create symlinks: ENOENT.

On my machine step 4 fails at the same symlink (#14940) in two runs from
scratch. Without step 3 (no freed blocks) or without the remount (runs are
still in memory), I could not trigger it.

---- repro.sh ----
#!/bin/sh
# ntfs3: symlink() fails with ENOENT once $Extend/$Reparse:$R reuses a freed
# index block whose runs are not loaded (indx_new -> ntfs_get_bh).
# Needs: root, mkntfs (ntfs-3g), python3.
# Uses a 2 GiB sparse image in $1 (default: cwd).
set -eu
dir=$(realpath "${1:-.}")
img=$dir/ntfs3-reparse.img
mnt=$dir/ntfs3-reparse.mnt

fill() { # fill <dir> <count>: <count> symlinks, an 8 KiB file after every 40
    python3 - "$1" "$2" <<'EOF'
import errno, os, sys
d, n = sys.argv[1], int(sys.argv[2])
os.makedirs(d + "/l", exist_ok=True); os.makedirs(d + "/s", exist_ok=True)
for i in range(n):
    try:
        os.symlink("/nonexistent", f"{d}/l/{i:06d}")
    except OSError as e:
        print(f"symlink #{i} in {d}: {errno.errorcode[e.errno]}"); sys.exit(1)
    if i % 40 == 39:
        open(f"{d}/s/{i:06d}", "wb").write(b"\0" * 8192)
print(f"{n} symlinks in {d}: ok")
EOF
}

truncate -s 2G "$img"
mkntfs -F -Q -L repro "$img" >/dev/null 2>&1
loop=$(losetup --find --show "$img")
mkdir -p "$mnt"
trap 'umount "$mnt" 2>/dev/null; losetup -d "$loop"' EXIT

mount -t ntfs3 "$loop" "$mnt"
# Grow $R until its $INDEX_ALLOCATION spills into extension records.
fill "$mnt/a" 40000
# Free some $R index blocks.
find "$mnt/a/l" -name '0[01]*' -delete
umount "$mnt"

# After remount, $R runs are loaded lazily.
mount -t ntfs3 "$loop" "$mnt"
uname -r
# Expected: ENOENT (here: at symlink #14940).
fill "$mnt/b" 20000
---- end ----

Suggested fix (untested: not compiled or run, only checked that it
applies to linux-7.3.y with offset -3). It mirrors the indx_read()
fallback: on -ENOENT from ntfs_get_bh(), load the runs with
attr_load_runs_range() under indx->run_lock and retry.

--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -987,6 +987,21 @@
 	}
 
 	err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo, bytes, &r->nb);
+	if (err == -ENOENT) {
+		/*
+		 * A reused block may lie in an $INDEX_ALLOCATION segment whose
+		 * runs have not been loaded yet. Load them, as indx_read() does.
+		 */
+		const struct INDEX_NAMES *in = &s_index_names[indx->type];
+
+		down_write(&indx->run_lock);
+		err = attr_load_runs_range(ni, ATTR_ALLOC, in->name, in->name_len,
+					   &indx->alloc_run, vbo, vbo + bytes);
+		up_write(&indx->run_lock);
+		if (!err)
+			err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo,
+					  bytes, &r->nb);
+	}
 
 	if (err) {
 		kfree(index);


I have not checked whether a failed symlink() leaves anything behind (MFT
record, directory entry). Large directories ($I30) go through indx_new()
too and may hit the same path, but I have not tried to reproduce that.

I can test a patch on the reproducer image if that helps.

Thanks,
Maciej
