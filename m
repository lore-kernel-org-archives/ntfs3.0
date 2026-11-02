Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630277;
	b=X2vA/e3TRxYakcHWieA7QX31c9/++mlPEVbUXyjeCwOx1O0pZwlZ9xzj6TWd/4/0ccij
	 z1c+iWp8MHSWwGXeUe7aWhGFOGcIWe/ciag0O+RUyZCWygNEsR2rMeKMNihxGwyPy2Z4Y
	 +mT5JFH0a/KUUmoHCW2viRd0OIwlDUzQfBDHukt4rH6Uyn8noidgpA3LnSd5YM0S5zQgw
	 AplY1vobDoPqnxx8iPHHFnMH1qZ3Vuh0t2W8d+170rWKU1D9MJXt5PKgsSAr83UXgPS0C
	 tlyR+VvwogxoU5AEHoNYH3EtH/15ivw8u/9hcVbo4UNgT0yij+vlzLIhKCyOtB9bRtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630277;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Envelope-From;
	bh=KkZEDMc9TV7vIke2IgqAteHrPzpueQVEpD8e48hwjuY=;
	b=S45SNQJerOJXABsIO8VCFmwNkUfLAd7dx1A5Qm2e3rU1WjQ+NGcFrVZYWRXyuJ00sdKD
	 WYYXHY6XR/IETyQChFSIo8yb7SpaHtPSQwBlyO+rPbyGIvPmcu8laq4rkgWTgN2wgg3En
	 VTtTx1Yu7AjfGEwTJZxw5LKvVxCSoVy9Z49L4r3vcQtQv7OJO25bCAbsnZOmVlzDW13Mh
	 ljvNs7g/7K3e3MxQI2Ohtr3vu8Z9kw+WlXyKk2yzoL8e6zWqN0a3LH0rNDCKluzYq3nIa
	 cWa4a582ymxSTfAzppuCEJ7GLKAyAuSoz2jvuUGj76Edk9KdgJmU/Sslb2s3NdaPIHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=elliotjb.com;
	spf=pass smtp.mailfrom=elliotjb.com;
	dkim=pass header.d=elliotjb.com header.i=@elliotjb.com header.a=rsa-sha256 header.s=default header.b=Lucy0rYA;
	arc=none smtp.remote-ip=63.250.43.117
Received: from out-2uec-a117.jellyfish.systems (out-2uec-a117.jellyfish.systems [63.250.43.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BC607827C
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 14:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52BC607827C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=elliotjb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elliotjb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=elliotjb.com header.i=@elliotjb.com header.a=rsa-sha256 header.s=default header.b=Lucy0rYA
Received: from mail.privateemail.com (unknown [77.233.63.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jJDnb6wCZz8sWR;
	Mon, 02 Nov 2026 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elliotjb.com;
	s=default; t=1793630261;
	bh=KkZEDMc9TV7vIke2IgqAteHrPzpueQVEpD8e48hwjuY=;
	h=From:Subject:Date:To:Cc:From;
	b=Lucy0rYAla2d7RoATI04kJj5bIZJlfOotWlUwswr2HfsfFXFgUpeFleOqoUpxdkpJ
	 53LtC3faDdcMCljr/Odo+kYpLmIFCrVTklr0LtubDj6ZyJI5JtOfYOT5NMcglHJnsP
	 rjFCpYI5r4RxnEK9gMxVnGsK/z0RnP0cMIsCDPxjLEI5IV/rlss9DyVdqNU0mdLXl1
	 hBpqOyeMvczEC90aLF9y2KMiwkv/pbYMfQ8mGshfTcSJ/qGaqWW8bFZln8ZcKLXWUh
	 pnWKpn+Y1tRjx8CaUU4M9qZye5RN3gl1GhMzKvul0kmIUEbRfuW13TAXeKJacU0ahG
	 mzdU1GUMlgROA==
From: Elliot Berman <elliotjb@elliotjb.com>
Subject: [PATCH 6.1.y 0/2] Fix NULL folio dereferences from IS_ERR() checks
 in 6.1.191
Date: Mon, 02 Nov 2026 06:37:02 -0800
Message-Id: <20261102-ext4-ntfs3-null-folio-v1-0-4fd91ee23a4a@elliotjb.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6g6GoC/yWMQQrCMBAAv1L27JYkDQH9iniozUZXQiLZVCqlf
 zetxxmYWUGoMAlcuhUKfVg4pwb61MH0HNODkH1jMMo4rZVGWqrFVIMMmOYYMeTIGc3gR6e8PVt
 F0Np3ocDL8b2C63X/hdtfy3x/0VT3J2zbD/H2EFaAAAAA
X-Change-ID: 20261101-ext4-ntfs3-null-folio-23da60d4940e
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Sasha Levin <sashal@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yongjian Sun <sunyongjian1@huawei.com>, Jan Kara <jack@suse.cz>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ntfs3@lists.linux.dev, Tom Bereknyei <tomberek@gmail.com>, 
 Elliot Berman <elliotjb@elliotjb.com>
X-Mailer: b4 0.15.2
X-Envelope-From: elliotjb@elliotjb.com

We hit a kernel oops in 6.1.191 in ext4_mb_regular_allocator(), When
ext4's s_buddy_cache pages are evicted, the next block allocation
dereferences a NULL folio.

$ echo 3 > /proc/sys/vm/drop_caches
$ dd if=/dev/zero of=/mnt/b0 bs=1M count=4 conv=fsync
BUG: kernel NULL pointer dereference, address: 0000000000000000

PGD 5f19067 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 0 PID: 908 Comm: dd Not tainted 6.1.191 #1-NixOS
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
RIP: 0010:ext4_mb_load_buddy_gfp (fs/ext4/mballoc.c:1536 (discriminator 1)) ext4
Call Trace:
 <TASK>
ext4_mb_regular_allocator (fs/ext4/mballoc.c:1641 fs/ext4/mballoc.c:2798) ext4
ext4_mb_new_blocks (fs/ext4/mballoc.c:5793) ext4
 ? ext4_find_extent (fs/ext4/extents.c:925) ext4
ext4_ext_map_blocks (fs/ext4/extents.c:4369) ext4
   ...

The cause is a mismatch in these backports first released in 6.1.191:
    d34e4fd4e73f ("ext4: convert bd_bitmap_page to bd_bitmap_folio")
    862483175d3d ("ext4: convert bd_buddy_page to bd_buddy_folio")

The ext4 mballoc folio conversions were written for v6.4 and later, where
__filemap_get_folio() returns ERR_PTR() on failure. 6.1 does not have 
commit 66dabbb65d67 ("mm: return an ERR_PTR from __filemap_get_folio") and
returns NULL instead. The backports should check for NULL and not IS_ERR.

These came in as dependencies of a3a7d360252c ("ext4: fix e4b bitmap
inconsistency reports"), also new in 6.1.191. We could revert all 3
patches and translate Yongjian's patch from `folio_test_locked(folio)`
-> `PageLocked(page)` instead. I suspect backporting 66dabbb65d67 ("mm:
return an ERR_PTR from __filemap_get_folio") is too heavy for stable,
since it requires updating all callers.

Since the same mistake could exist elsewhere, I ran a Coccinelle script
over the tree to flag similar missed backports. Besides ext4, I found one
more case in ntfs3:
    95b917a14b15 ("ntfs: Do not overwrite uptodate pages")

That one needs a folio allocation failure while reading a compressed
file, so it required crafting a fault injection in __filemap_add_folio to
reproduce. I've fixed this one as well.

Reported-by: Tom Bereknyei <tomberek@gmail.com>
Signed-off-by: Elliot Berman <elliotjb@elliotjb.com>
---
Elliot Berman (2):
      ext4: fix NULL folio dereference in mballoc
      bs/ntfs3: fix NULL folio dereference in ntfs_lock_new_page()

 fs/ext4/mballoc.c  | 28 ++++++++++++++--------------
 fs/ntfs3/frecord.c |  4 ++--
 2 files changed, 16 insertions(+), 16 deletions(-)
---
base-commit: 08889840163ebcdb7e24bf7ec311bc2e6fc3aaea
change-id: 20261101-ext4-ntfs3-null-folio-23da60d4940e

Best regards,
--  
Elliot Berman <elliotjb@elliotjb.com>

