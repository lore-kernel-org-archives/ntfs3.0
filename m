Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440817;
	b=y3fJIXnnoquZjPlcEsxCRgmntJqM5Pj6bVVaYmgzOZPe0O7f3OS77ntTCVaJxwaliecp
	 7u1ASOdNfYFPLLR8NVcno5BIrBjrTwtPr/tIyfYZxB1wjLREyLqvLt+2AS/Jvhe8/WUUZ
	 mOerAmNDdWbWuJFExwIZMzvlNeN/Mm41OTIczpyEVlc9iuu0saSu4GIQYGcUJB8eCRjWj
	 NrXaJquwRZdxp2eek3EaQnsCCv0PIWzkT+TsiSVRuv8kwHBrnpwg/PrLPqmC4DzX72M/s
	 2e6ov7bLxkMDPwIZbFPHINZ4RLMK1f5zaBarmT7v4sj+VX2DhU/XIM7HupfmcWLt4Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OzlivQNgHb8VY8kKsWtbA4ScHSDu95fLH3UgBspZhnU=;
	b=GVjbj2GFETbaj44P9qsne43fRK1MA2w97/ZiinPIigLuPMN4PQJ5/muPOzUz2diA3Oe6
	 6lwEfo2v1fla7cgc5paT55dYmhcWUHGCE88Fu0ujg7iyamlDYhJccnUyyOwkEEsLspy22
	 qVKJ5rsRDZB8oeSgKFENcGGP4Nu4c27O31pbfgTUHEw+hIfuf1sUtqoQqtgTOGeku7RZF
	 8pPe6KXNCvyXZdBSFXJJnIlKHG/SrsSm7MVyIuUOp57S3l5WyJr565E6/sqXYqGtnfXN2
	 mXuPQcuqwTGvbV7XGpkLmyBW+smfo3Rgrve4E6DZCvSW9n0fcLyE/l+r6pzmy5jebVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGMAQCxw;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CAE606A31E
	for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGMAQCxw
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c45111bebso638913f8f.0
        for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440815; x=1794045615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzlivQNgHb8VY8kKsWtbA4ScHSDu95fLH3UgBspZhnU=;
        b=KGMAQCxw4aVJEZ4DrFHzfnEmeBQfmZwA2g8LFd+y37oAzvzikVTT8JoLx7y4inH/xs
         cnkckWPLsGr8Cy3h8B7IPxOQ7++PyJYRghkK1+tZFYnA9amcPWFrlCG/638S4/l9+inX
         o9z4gm4wq5EH2fFlSmfYY7roQdHSSEwT1ks3//Tf+UP+5F3LM1Zsxfu9Id+lkULIiyGj
         rOk3CIG6fwwQ29WSIlfn8o9fNF8awSh80zlmMlW/wZmw/uHIDp471wfWUiPW4bnOc/i0
         bLreIZoN9LGj3vdLIyAkYPi71A5ZaC+46/rjiYpTDiqIWzab6HvAfJxkAq1h25kXy3jD
         4Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440815; x=1794045615;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OzlivQNgHb8VY8kKsWtbA4ScHSDu95fLH3UgBspZhnU=;
        b=wFmvBnYx3cMX/xLRWjvg0BqTWgKHyIbfN5o7YObPSzMRzhAL4+aEXDuJbmxboYk5ES
         DBD8EVdkRRfx9urxlmdRkLoOwpB/lndoCCNr73/ux8NlPtoFjNeihmSfoUJGS3SD41bE
         0isJZ0I/LZdSNv0/+omkFQSNOQaOb3l94XSpcbnt02OV9663IOFNDNhddjpNPu0q/pgT
         dECcCwFcS/ie+WwBj/VVSu9F2YUN05FCch6BSuFELuP0tBqIVYwfl0OG1I8gXgs2E+b/
         EQKxD7mg6LGRMJTEz/0O+KAOS30Gl+qUSWP4oH9lVIip5O9dxYBfpJABc8WTesmvP+/+
         tp0w==
X-Gm-Message-State: AFq9FYLqGkF5mJ8e9kKvjfuqElzVI6HfV2pxE8tYLbvmehCl91jwD65l
	KAkNkAItQXocAZTEREhysBXbJGjKENADZUvjjicW4Zp6s689EXUluxQY
X-Gm-Gg: AYBFou3qVXBPjqXy6XZSFWVtNjfjUG9m+gaLcHZGU5oPZ44WxXy79Goq72k2hBfdsMk
	y0uGcoFXDvR0x3nNmXoeJZ3w8EixNUoLOBVnv6v34TMrW9OxbQ6GAuRE2i2wTM00LWUyxXEi0G6
	UsdkULlqPNlTDZ4G+je9XbB/HvOouzL6Rx0iPJZbMWz9aVyWpIZPz/TYJ28rUWV8RkfvOfGBm6e
	/hz/Em/EsRpcndMr07iQFQC58HhHVDUU+GFrzbvLO/9v3wnoW9t6/Pu7bvaYhhTiZZ5saOYjeK4
	okGypyWgOcYjz1/u9x/V5etLrAvySS9NCd2tWl3732L/lYqi6HS3YfyxvCWSTPD+xwbH+q8/Lp6
	9is9ripcqcsxeCVwBbvQxZh6yODyo3cSlRECfHX1Kp2wiPtWrKhC6KFYt/6I+TLzL5JG0ukwkWt
	YlJIM6eM+lUmSa8bw4NJwbXQHVddBRbp0TZv5XGc6EQkigBiD4g3F4mjCddRDM9zb9US+gMAeop
	Wh/qxc9WKC1RLoDSQoXDoEHeNPcKR0LKW0Ge4lbt9uJwebilWcfJicM2gvOw3aL4vwVMkSA/8CG
	psWETbia60hSDf/2LIv2eMXAoGdcnW1TYy+h+2RIrWpSEZMTGYowQCCi1bDoJ+11pOf8ki8=
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr9638269f8f.50.1793440814932;
        Sat, 31 Oct 2026 03:00:14 -0700 (PDT)
Received: from macstation (109-206-198-198.host.skynet.net.pl. [109.206.198.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm8352456f8f.30.2026.10.31.03.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:00:12 -0700 (PDT)
From: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: index root entries lost if indx_new() fails
Date: Sat, 31 Oct 2026 11:00:12 +0100
Message-ID: <20261031100012.1533166-1-m.sadowniczyk@gmail.com>
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

If indx_insert_into_root() fails after it has shrunk the $INDEX_ROOT
and allocated the new index block, the entries that were in the root
are lost: the files disappear from the directory, also after a
remount. In the case I reproduced, the create only returns ENOMEM and
ntfs3 logs nothing. I can reproduce it with failslab (script below). I
do not have a simple fix and would like to ask which direction you
prefer.

This is separate from "[PATCH] fs/ntfs3: fix loss of index entries in
indx_insert_into_root()" [2], which fixes a stale hdr_used check that
reaches the same unrestored-root state deterministically with
4096-byte MFT records. This report is about the remaining error paths.

Tree: ntfs3 devel ee1cb3443cff ("ntfs3: add file I/O tracepoints");
fs/ntfs3/index.c is identical in current mainline. The order of
operations below goes back to 82cae269cfa9 ("fs/ntfs3: Add
initialization of super block").

What happens
------------
Line numbers are from fs/ntfs3/index.c in devel. When the new entry
does not fit into the root, indx_insert_into_root():

  1. copies the root attribute (a_root, 1687) and its entries (re, 1713),
  2. shrinks the root to a single END entry with the subnode flag and
     sets mi->dirty (1736-1750),
  3. creates $INDEX_ALLOCATION and $BITMAP (indx_create_allocate()) or
     takes a free block in, or extends, the existing allocation
     (indx_add_allocate()) (1753-1755),
  4. looks the root up again (1758) and sets the subnode VCN in it
     (1778),
  5. creates the new index block with indx_new() (1782) and copies the
     saved entries into it.

Only a failure in step 3 restores the root (1766-1775). These leave it
shrunk:

  - the root lookup in step 4 fails (1758-1764; the VCN is not set),
  - indx_new() fails (1782): one of its two kzalloc()s, or
    ntfs_get_bh() with -ENOENT (fixed for reused blocks by [1]), -EIO,
    -EINVAL or -ENOMEM,
  - the to_move check fails (1802; a crafted image),
  - hdr_insert_de() fails (1838), after indx_mark_used(). This is what
    the stale hdr_used check makes happen with 4096-byte MFT records.

In the last three cases the root points at an index block that was
never written. re and a_root, the only copies of the entries, are then
freed, and the shrunk root is written back with the MFT record.

When the root already had subnodes (indx_insert_into_buffer()
promoting a key after a split), re and t_vbn also hold the VCNs of all
child blocks, so no lookup can reach any existing index block;
readdir, which walks $BITMAP, still lists the entries of the child
blocks. I reproduced this with 4096-byte MFT records on devel with [2]
applied (without it the 7th create already fails and loses the first
six files; the test kernel also had a debug printk and a local
stand-in for the pending ntfs_readdir() unlock fix): 247-character names,
failslab failing indx_new() when the 25th create pushes down a root
with subnodes. After a remount, readdir lists 18 of the 24 existing
files and the lookups of all 24 fail. Every index insert can get here:
create, mkdir, link and rename in $I30, the re-inserts in
indx_delete_entry() and ni_remove_name_undo(), $Secure ($SII, $SDH)
and $Reparse. I only tested $I30 creates.

How likely it is outside fault injection: the two kzalloc()s are small
GFP_NOFS allocations. As far as I can tell, the page allocator keeps
retrying them rather than failing them (out_of_memory() kills nothing
for a !__GFP_FS allocation but reports progress), unless the task is
an OOM victim, which includes a task that already has a fatal signal
pending. ntfs_get_bh() gets its buffers through sb_getblk() with
__GFP_NOFAIL. So I expect this to be rare now, apart from the
4096-byte MFT record case fixed by [2]. When it happens, though, the
loss is silent: nothing calls ntfs_set_state(NTFS_DIRTY_ERROR), and the
volume is marked clean at umount.

Reproducer output
-----------------
Environment: virtme-ng VM, x86_64, KASAN and lockdep enabled (no
reports), mkntfs from ntfs-3g 2026.9.28, 1 KiB MFT records.

  7.3.0-rc1-virtme
  n=1: create B: errno 12, 0 entries in d1
  n=2: create B: errno 12, 0 entries in d2
  n=3: create B: ok, 2 entries in d3
  n=4: create B: ok, 2 entries in d4
  after remount:
    d0: 1 entries
    d1: 0 entries
    d2: 0 entries
    d3: 2 entries
    d4: 2 entries

d0 is a reference directory with one file A (201 characters). Each
other dN is a fresh directory with the same file A, then file B (same
length) is created with failslab failing the n-th allocation made with
indx_new() on the stack. Creating B moves the root to a new index
block, because two such entries do not fit into a 1 KiB MFT record.
According to the failslab stack traces, n = 1 is the kzalloc() of the
node and n = 2 the kzalloc() of the index buffer; both lose A. n = 3
is not logged because that allocation has __GFP_NOWARN, and creating
B succeeds; most likely it is the GFP_NOWAIT xarray node allocation
under sb_getblk(), which is retried with __GFP_NOFAIL. n = 4 injects
nothing and ends the loop. The results for n = 1 to 4 were the same in
eight runs on this kernel; whether a silent n = 3 appears presumably
depends on the page cache.

In earlier runs with an older version of the script, which filtered
on indx_insert_into_root() and did not exclude SLUB sheaf refills,
failures in the two kmemdup()s and in attr_allocate_clusters() under
indx_create_allocate() left A in place, as expected. The failed
kmalloc() of an empty sheaf in __pcs_replace_empty_main() falls back
without an error but made n vary between runs, so the script now
rejects it.

Excerpt of ntfsinfo -F /dN (ntfs-3g) on the image afterwards, and the
stack of the failure at n = 1 (failslab verbose output; fault-injection,
syscall-entry and "?" frames removed):

  === d0
  Bytes Used:              936 (0x3a8) bytes
  Bytes Allocated:         1024 (0x400) bytes
  Dumping attribute $INDEX_ROOT (0x90) from mft record 27 (0x1b)
          Index Size:              520 (0x208)
          Index header flags:      0x00
          Index entries total:     2
  === d1
  Bytes Used:              576 (0x240) bytes
  Bytes Allocated:         1024 (0x400) bytes
  Dumping attribute $INDEX_ROOT (0x90) from mft record 29 (0x1d)
          Index Size:              40 (0x28)
          Index header flags:      0x01
          Index entries total:     1
  Dumping attribute $INDEX_ALLOCATION (0xa0) from mft record 29 (0x1d)
          Index entries total:     0
          INDX blocks total:       0
  Dumping attribute $BITMAP (0xb0) from mft record 29 (0x1d)
  === stack of injected failure n=1
  __kmalloc_cache_noprof+0x89/0x5b0
  indx_new+0xcc/0x5c0
  indx_insert_into_root+0xbc4/0x1800
  indx_insert_entry+0x546/0x760
  ntfs_create_inode+0x1b2f/0x5780
  ntfs_create+0x22/0x30
  lookup_open+0xcf9/0x16e0
  path_openat+0xe6b/0x2070
  do_file_open+0x209/0x480

"Index entries total" includes the END entry; "INDX blocks total"
counts blocks whose $BITMAP bit is set.

Why restoring the root is not enough
------------------------------------
I first tried to route the later error paths through the existing
"Restore root." code. That did not help for the case above: in the
failed directory the MFT record has 576 of 1024 bytes in use after the
shrink and the new $INDEX_ALLOCATION and $BITMAP attributes. Growing
the root back from 40 to 520 bytes needs 480 more, 1056 > 1024, so
mi_resize_attr() fails. Its fallback, ntfs_set_state(NTFS_DIRTY_ERROR),
does nothing here either: ntfs_create_inode() has already set
NTFS_DIRTY_DIRTY, so ntfs_set_state() returns early on the cached flag,
and the volume is marked clean again at the next sync or umount. (That
early return seems to drop any NTFS_DIRTY_ERROR raised after a write
has marked the volume dirty, which may deserve a look of its own.)

Presumably the root is shrunk first to make room for the new
attributes; in this case, once indx_create_allocate() has succeeded,
the old root no longer fits.

The undo added to indx_insert_into_buffer() in 63e92a0c5a0d ("fs/ntfs3:
Undo critial modificatins to keep directory consistency") restores the
split buffer from its saved copy and frees the new buffer's bit when
indx_insert_into_root() fails, which assumes the root was left as it
was. The subnode case above goes through this undo: the split block is
restored, but the root stays shrunk.

Possible directions
-------------------
  a) On failure after indx_create_allocate(), undo it: remove the
     $INDEX_ALLOCATION and $BITMAP it added, free the clusters, reset
     indx->alloc_run and the inode sizes, then restore the root. For
     indx_add_allocate() the plain restore fits unless the attributes
     grew in the same record.
  b) Change the order as ntfs-3g does in ntfs_ir_reparent(): add the
     allocation while the full root is still in place, build and write
     the new index block, and only then shrink the root. In the case
     above the full root leaves no room for the two new attributes
     (936 + 120 > 1024), so they would go to an extension record with
     an $ATTRIBUTE_LIST, and with 1 KiB records that would happen to
     most directories that outgrow their root. A variant: allocate the
     clusters and write the block first, then shrink the root and add
     the attributes; a failure there still leaves room to restore the
     root.
  c) A smaller step: do indx_new()'s two kzalloc()s, the to_move check
     and the copy into the new buffer before shrinking the root. That
     removes the allocation failures from the window, but not
     ntfs_get_bh() errors.

There is no patch for this because the simple restore does not work
and the real fix is a design choice; I can write and test whichever
direction you prefer.

Reproducer
----------
Needs root, cc, mkntfs and a v6.2+ kernel with CONFIG_FAULT_INJECTION,
CONFIG_FAILSLAB, CONFIG_FAULT_INJECTION_DEBUG_FS and
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER (FRAME_POINTER on some
architectures),
ntfs3, loop devices and kptr_restrict <= 1. The stack filter limits
failslab to allocations with indx_new() on the stack, and fail-nth
only counts allocations that pass it. Without the filter the injection
also hits ntfs_new_inode() and triggers the al_destroy() oops that
"[PATCH v2] fs/ntfs3: Refine the ni cleanup" (Edward Adam Davis,
2026-08-27) fixes. The script restores the failslab settings it
changes.

---- repro-root.sh ----
#!/bin/sh
# ntfs3: a create that fails in indx_new() under indx_insert_into_root()
# loses the entries that were in a directory's $INDEX_ROOT.
#
# Needs root, cc, mkntfs (ntfs-3g) and a v6.2+ kernel with
# CONFIG_FAULT_INJECTION, CONFIG_FAILSLAB, CONFIG_FAULT_INJECTION_DEBUG_FS
# and CONFIG_FAULT_INJECTION_STACKTRACE_FILTER, kptr_restrict <= 1. Uses a
# 64 MiB image in a temporary directory (or in $1).
#
# A fresh directory gets one file with a 201-character name. Creating a
# second one does not fit in the $INDEX_ROOT, so indx_insert_into_root()
# shrinks the root and creates a new index block with indx_new(). That
# create runs with /proc/thread-self/fail-nth = n; failslab applies the
# stack filter before counting, so only allocations with indx_new() on
# the stack count and the n-th of them fails (SLUB sheaf refills, which
# fall back without an error, are excluded). n goes up until nothing is
# injected.
set -eu
trap 'exit 130' INT TERM
w=$(mktemp -d "${1:-/tmp}/ntfs3-root.XXXXXX")
fs=/sys/kernel/debug/failslab

# open(O_CREAT) with fail-nth set; reads fail-nth back afterwards.
# Prints "<created 0|1> <errno> <fail-nth left>" (left 0: injected).
cat > "$w/failnth-open.c" <<'EOF'
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	char nbuf[16], rbuf[32] = "";
	int nth, fd, err, len;

	if (argc != 3)
		return 2;
	len = snprintf(nbuf, sizeof(nbuf), "%d", atoi(argv[2]));
	nth = open("/proc/thread-self/fail-nth", O_RDWR);
	if (nth < 0 || pwrite(nth, nbuf, len, 0) != len)
		return 3;
	fd = open(argv[1], O_CREAT | O_WRONLY, 0644);
	err = fd < 0 ? errno : 0;
	if (pread(nth, rbuf, sizeof(rbuf) - 1, 0) < 0 ||
	    pwrite(nth, "0", 1, 0) != 1)
		return 4;
	if (fd >= 0)
		close(fd);
	printf("%d %d %d\n", fd >= 0, err, atoi(rbuf));
	return 0;
}
EOF
cc -O2 -o "$w/failnth-open" "$w/failnth-open.c"

modprobe ntfs3 2>/dev/null || :
mountpoint -q /sys/kernel/debug || mount -t debugfs none /sys/kernel/debug
# Restore the failslab settings this script changes when it exits.
saved=
for k in ignore-gfp-wait require-start require-end reject-start reject-end \
	 stacktrace-depth verbose times; do
	saved="$saved $k=$(cat $fs/$k)"
done
trap 'for kv in $saved; do echo "${kv#*=}" > "$fs/${kv%%=*}"; done' EXIT

sym_range() { # sym_range <symbol>: start and end address, nothing if unknown
	LC_ALL=C sort /proc/kallsyms |
	awk -v s="$1" '$3 == s && a == "" {a = $1; next} a != "" && e == "" {e = $1}
	    END {if (a ~ /[1-9a-f]/ && e != "") print a, e}'
}
set -- $(sym_range indx_new)
[ $# = 2 ] || { echo "indx_new not in /proc/kallsyms (ntfs3 not loaded," \
	"kptr_restrict=2, or inlined in this build)" >&2; exit 1; }
echo 0x$1 > $fs/require-start
echo 0x$2 > $fs/require-end
set -- $(sym_range __pcs_replace_empty_main)  # SLUB sheaves, v6.18+
if [ $# = 2 ]; then
	echo 0x$1 > $fs/reject-start
	echo 0x$2 > $fs/reject-end
fi
echo N > $fs/ignore-gfp-wait
echo 32 > $fs/stacktrace-depth
echo 2 > $fs/verbose

img=$w/img
mnt=$w/mnt
truncate -s 64M "$img"
mkntfs -F -Q "$img" >"$w/mkntfs.log" 2>&1 || { cat "$w/mkntfs.log"; exit 1; }
loop=$(losetup --find --show "$img")
mkdir "$mnt"
mount -t ntfs3 "$loop" "$mnt"
uname -r

x=$(printf '%0200d' 0)
# d0: reference directory with A only.
mkdir "$mnt/d0"
: > "$mnt/d0/A$x"
n=1
while :; do
	d=$mnt/d$n
	mkdir "$d"
	: > "$d/A$x"
	r=$("$w/failnth-open" "$d/B$x" $n) || { echo "helper failed"; exit 1; }
	set -- $r
	res=$([ "$1" = 1 ] && echo ok || echo "errno $2")
	echo "n=$n: create B: $res, $(ls "$d" | wc -l) entries in d$n"
	[ "$3" = 0 ] || break
	n=$((n + 1))
done

umount "$mnt"
mount -t ntfs3 "$loop" "$mnt"
echo "after remount:"
for d in "$mnt"/d*; do
	echo "  ${d##*/}: $(ls "$d" | wc -l) entries"
done
umount "$mnt"
losetup -d "$loop"
echo "image kept in $img"
---- end ----

I used an AI assistant (Claude Code with Claude Opus 5.5) to analyse
the code, write the reproducer, run it in a VM on unmodified devel and
draft this report; I reviewed its output, the ntfsinfo dumps and the
failslab stacks. The GFP_NOFS and OOM statements, the statements about
the volume's dirty flag and the proposed directions come from reading
the code and are not tested.

[1] https://lore.kernel.org/ntfs3/20261030155631.953779-1-m.sadowniczyk@gmail.com/
[2] https://lore.kernel.org/ntfs3/20261031095944.1532712-1-m.sadowniczyk@gmail.com/

Thanks,
Maciej
