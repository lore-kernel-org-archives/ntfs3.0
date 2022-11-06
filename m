Received: from frv150.fwdcdn.com (frv150.fwdcdn.com [212.42.77.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830C2F4D
	for <ntfs3@lists.linux.dev>; Sun,  6 Nov 2022 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ukr.net;
	s=fsm; h=To:Date:Message-Id:Subject:Mime-Version:Content-Transfer-Encoding:
	Content-Type:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RVTHr4qdHko4UbdSO+WtV60uPPYBPTtauNssLrPD3+0=; b=Iz7RyJt1oGVpYkxq3ty4zyuQqL
	57WtnKwQdnTOponudANkZ27+VepOZ+jdPDBDptkVdIGhqm1bDKSBypkTqog3QBbzM2f9AXH+IXZNy
	oHo4KSDJJaAjoZY6s9BA21Z0U4PUpmIykxVw1tA+DRuZTCyJj0WWpvwTMLspWbqyPczE=;
Received: from host-2-100-172-224.as13285.net ([2.100.172.224] helo=smtpclient.apple)
	by frv150.fwdcdn.com with esmtpsa ID 1orkwJ-000Bk0-7l
	for ntfs3@lists.linux.dev; Sun, 06 Nov 2022 21:04:15 +0200
From: Andriy Tkachuk <andrit@ukr.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Deadlock at kswapd0 on ntfs_iget5
Message-Id: <F91A8ABF-6422-4ED8-AA5B-A41FC6AC67A8@ukr.net>
Date: Sun, 6 Nov 2022 19:04:14 +0000
To: ntfs3@lists.linux.dev
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Result: IP=2.100.172.224; mail.from=andrit@ukr.net; dkim=pass; header.d=ukr.net

Hi, here is the stack:

Nov 06 16:25:11 nas kernel: sysrq: Show Blocked State
Nov 06 16:25:11 nas kernel: task:kswapd0         state:D stack:    0 =
pid:   45 ppid:     2 flags:0x00000000
Nov 06 16:25:11 nas kernel: Backtrace:=20
Nov 06 16:25:11 nas kernel: [<c08d1f60>] (__schedule) from [<c08d2944>] =
(schedule+0x78/0x138)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:c08d32a4 r8:dbf68b40 =
r7:bf7ff8f0 r6:c873c400 r5:c12eabe0
Nov 06 16:25:11 nas kernel:  r4:ffffe000
Nov 06 16:25:11 nas kernel: [<c08d28cc>] (schedule) from [<c022b258>] =
(__wait_on_freeing_inode+0x88/0xb8)
Nov 06 16:25:11 nas kernel:  r5:c0c2c758 r4:c0c2d028
Nov 06 16:25:11 nas kernel: [<c022b1d0>] (__wait_on_freeing_inode) from =
[<c022b30c>] (find_inode+0x84/0xc8)
Nov 06 16:25:11 nas kernel:  r5:c77570b0 r4:c8f46c30
Nov 06 16:25:11 nas kernel: [<c022b288>] (find_inode) from [<c022b398>] =
(ilookup5_nowait+0x48/0x5c)
Nov 06 16:25:11 nas kernel:  r9:c08d32a4 r8:c873c400 r7:0000acf7 =
r6:bf7ff8f0 r5:00007fff r4:c0c2d970
Nov 06 16:25:11 nas kernel: [<c022b350>] (ilookup5_nowait) from =
[<c022caa8>] (ilookup5.part.9+0x3c/0x90)
Nov 06 16:25:11 nas kernel:  r5:c77570b0 r4:c77570b0
Nov 06 16:25:11 nas kernel: [<c022ca6c>] (ilookup5.part.9) from =
[<c022cee8>] (iget5_locked+0x30/0x88)
Nov 06 16:25:11 nas kernel:  r9:00000000 r8:bf7ff91c r7:bf7ff8f0 =
r6:0000acf7 r5:c873c400 r4:c77570b0
Nov 06 16:25:11 nas kernel: [<c022ceb8>] (iget5_locked) from =
[<bf800ec0>] (ntfs_iget5+0x40/0xf44 [ntfs3])
Nov 06 16:25:11 nas kernel:  r8:c7757098 r7:c77570b0 r6:c873c400 =
r5:c0c2d028 r4:c77570b0
Nov 06 16:25:11 nas kernel: [<bf800e80>] (ntfs_iget5 [ntfs3]) from =
[<bf7f413c>] (ni_write_inode+0x8f8/0xe08 [ntfs3])
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:00000000 r8:c7757098 =
r7:c77570b0 r6:c873c400 r5:c0c2d028
Nov 06 16:25:11 nas kernel:  r4:d1a34c30
Nov 06 16:25:11 nas kernel: [<bf7f3844>] (ni_write_inode [ntfs3]) from =
[<bf8034c4>] (ntfs_evict_inode+0x60/0x68 [ntfs3])
Nov 06 16:25:11 nas kernel:  r10:c873c660 r9:c873c400 r8:0000012d =
r7:000002d4 r6:000002d3 r5:bf810804
Nov 06 16:25:11 nas kernel:  r4:d1a34c30
Nov 06 16:25:11 nas kernel: [<bf803464>] (ntfs_evict_inode [ntfs3]) from =
[<c022c304>] (evict+0x94/0x13c)
Nov 06 16:25:11 nas kernel:  r5:bf810804 r4:d1a34c30
Nov 06 16:25:11 nas kernel: [<c022c270>] (evict) from [<c022c3f0>] =
(dispose_list+0x44/0x58)
Nov 06 16:25:11 nas kernel:  r5:c0c2d028 r4:c12d1d64
Nov 06 16:25:11 nas kernel: [<c022c3ac>] (dispose_list) from =
[<c022d234>] (prune_icache_sb+0x5c/0x84)
Nov 06 16:25:11 nas kernel:  r5:c0c2d028 r4:c12d1d64
Nov 06 16:25:11 nas kernel: [<c022d1d8>] (prune_icache_sb) from =
[<c021074c>] (super_cache_scan+0x120/0x170)
Nov 06 16:25:11 nas kernel:  r6:000005bd r5:00000000 r4:c12d1e48
Nov 06 16:25:11 nas kernel: [<c021062c>] (super_cache_scan) from =
[<c019c230>] (do_shrink_slab+0x1d0/0x3ac)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:00000000 r8:c0cb57ec =
r7:00000400 r6:c12d1e48 r5:c873c660
Nov 06 16:25:11 nas kernel:  r4:0000040d
Nov 06 16:25:11 nas kernel: [<c019c060>] (do_shrink_slab) from =
[<c019f0a4>] (shrink_slab+0xb8/0x2bc)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:c0cb1240 r8:c0cb1220 =
r7:00000000 r6:00000752 r5:c12d1e50
Nov 06 16:25:11 nas kernel:  r4:c873c660
Nov 06 16:25:11 nas kernel: [<c019efec>] (shrink_slab) from [<c01a139c>] =
(shrink_node+0x278/0x74c)
Nov 06 16:25:11 nas kernel:  r10:00009023 r9:00000000 r8:c0d5caa8 =
r7:c0d5c46c r6:c12d1efc r5:c12d1f24
Nov 06 16:25:11 nas kernel:  r4:00000000
Nov 06 16:25:11 nas kernel: [<c01a1124>] (shrink_node) from [<c01a20a4>] =
(kswapd+0x424/0x9d0)
Nov 06 16:25:11 nas kernel:  r10:00000001 r9:c0d5c46c r8:00000000 =
r7:00000001 r6:00000001 r5:00000000
Nov 06 16:25:11 nas kernel:  r4:00009023
Nov 06 16:25:11 nas kernel: [<c01a1c80>] (kswapd) from [<c0046da8>] =
(kthread+0x144/0x16c)
Nov 06 16:25:11 nas kernel:  r10:c129a2dc r9:c112be28 r8:c12d0000 =
r7:c0d5c46c r6:c01a1c80 r5:c128adc0
Nov 06 16:25:11 nas kernel:  r4:c129a2c0
Nov 06 16:25:11 nas kernel: [<c0046c64>] (kthread) from [<c00082f4>] =
(ret_from_fork+0x14/0x20)
Nov 06 16:25:11 nas kernel: Exception stack(0xc12d1fb0 to 0xc12d1ff8)
Nov 06 16:25:11 nas kernel: 1fa0:                                     =
00000000 00000000 00000000 00000000
Nov 06 16:25:11 nas kernel: 1fc0: 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000
Nov 06 16:25:11 nas kernel: 1fe0: 00000000 00000000 00000000 00000000 =
00000013 00000000
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:00000000 r8:00000000 =
r7:00000000 r6:00000000 r5:c0046c64
Nov 06 16:25:11 nas kernel:  r4:c128adc0 r3:60000093
Nov 06 16:25:11 nas kernel: task:smbd            state:D stack:    0 =
pid: 7705 ppid:  6239 flags:0x00000000
Nov 06 16:25:11 nas kernel: Backtrace:=20
Nov 06 16:25:11 nas kernel: [<c08d1f60>] (__schedule) from [<c08d2944>] =
(schedule+0x78/0x138)
Nov 06 16:25:11 nas kernel:  r10:c0c2d77c r9:00000000 r8:00000102 =
r7:c0d5c46c r6:c0c2d028 r5:c234abe0
Nov 06 16:25:11 nas kernel:  r4:ffffe000
Nov 06 16:25:11 nas kernel: [<c08d28cc>] (schedule) from [<c019c8e4>] =
(throttle_direct_reclaim+0x2e0/0x2f4)
Nov 06 16:25:11 nas kernel:  r5:c0d5c46c r4:c0f17b30
Nov 06 16:25:11 nas kernel: [<c019c604>] (throttle_direct_reclaim) from =
[<c01a2b34>] (try_to_free_pages+0xbc/0x1cc)
Nov 06 16:25:11 nas kernel:  r9:00000000 r8:00000000 r7:c0d5ca3c =
r6:00000000 r5:c0c2d028 r4:00000cc0
Nov 06 16:25:11 nas kernel: [<c01a2a78>] (try_to_free_pages) from =
[<c01dd81c>] (__alloc_pages+0x4f0/0xf2c)
Nov 06 16:25:11 nas kernel:  r8:00000000 r7:00008000 r6:00000000 =
r5:00400140 r4:00000000
Nov 06 16:25:11 nas kernel: [<c01dd32c>] (__alloc_pages) from =
[<c0734c68>] (skb_page_frag_refill+0xdc/0x104)
Nov 06 16:25:11 nas kernel:  r10:00008000 r9:00007e88 r8:c37e0dc0 =
r7:00008000 r6:c37e0ebc r5:00000cc0
Nov 06 16:25:11 nas kernel:  r4:c234b1d0
Nov 06 16:25:11 nas kernel: [<c0734b8c>] (skb_page_frag_refill) from =
[<c0734cd0>] (sk_page_frag_refill+0x24/0x78)
Nov 06 16:25:11 nas kernel:  r5:c0f17f38 r4:c37e0dc0
Nov 06 16:25:11 nas kernel: [<c0734cac>] (sk_page_frag_refill) from =
[<c07f2590>] (tcp_sendmsg_locked+0x344/0xe8c)
Nov 06 16:25:11 nas kernel:  r5:c0f17f38 r4:c6395300
Nov 06 16:25:11 nas kernel: [<c07f224c>] (tcp_sendmsg_locked) from =
[<c07f3110>] (tcp_sendmsg+0x38/0x4c)
Nov 06 16:25:11 nas kernel:  r10:c0f17ddc r9:c0c2d028 r8:00000000 =
r7:cfb79380 r6:00020054 r5:c0f17f38
Nov 06 16:25:11 nas kernel:  r4:c37e0dc0
Nov 06 16:25:11 nas kernel: [<c07f30d8>] (tcp_sendmsg) from [<c082cae8>] =
(inet_sendmsg+0x44/0x78)
Nov 06 16:25:11 nas kernel:  r7:cfb79380 r6:00000000 r5:cfb79380 =
r4:c37e0dc0
Nov 06 16:25:11 nas kernel: [<c082caa4>] (inet_sendmsg) from =
[<c0730b08>] (sock_sendmsg+0x44/0x54)
Nov 06 16:25:11 nas kernel:  r4:c0f17f38
Nov 06 16:25:11 nas kernel: [<c0730ac4>] (sock_sendmsg) from =
[<c0730ec4>] (____sys_sendmsg+0x1e8/0x21c)
Nov 06 16:25:11 nas kernel:  r5:00000040 r4:c0f17f38
Nov 06 16:25:11 nas kernel: [<c0730cdc>] (____sys_sendmsg) from =
[<c0732a24>] (___sys_sendmsg+0x78/0xa8)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:00000000 r8:00000000 =
r7:cfb79380 r6:00000000 r5:c0c2d028
Nov 06 16:25:11 nas kernel:  r4:c0f17f38
Nov 06 16:25:11 nas kernel: [<c07329ac>] (___sys_sendmsg) from =
[<c0732e18>] (__sys_sendmsg+0x5c/0x9c)
Nov 06 16:25:11 nas kernel:  r9:c0f16000 r8:c00083e4 r7:cfb79380 =
r6:00000000 r5:be911558 r4:c0c2d028
Nov 06 16:25:11 nas kernel: [<c0732dbc>] (__sys_sendmsg) from =
[<c0732e74>] (sys_sendmsg+0x1c/0x20)
Nov 06 16:25:11 nas kernel:  r7:00000128 r6:00000000 r5:b247e080 =
r4:00000035
Nov 06 16:25:11 nas kernel: [<c0732e58>] (sys_sendmsg) from [<c0008260>] =
(ret_fast_syscall+0x0/0x1c)
Nov 06 16:25:11 nas kernel: Exception stack(0xc0f17fa8 to 0xc0f17ff0)
Nov 06 16:25:11 nas kernel: 7fa0:                   00000035 b247e080 =
00000035 be911558 00000000 00000000
Nov 06 16:25:11 nas kernel: 7fc0: 00000035 b247e080 00000000 00000128 =
b6e33798 b6e337c0 0127a8b0 00000005
Nov 06 16:25:11 nas kernel: 7fe0: 00000000 be911538 00000000 b6723254
Nov 06 16:25:11 nas kernel: task:smbd            state:D stack:    0 =
pid: 8839 ppid:  6239 flags:0x00000000
Nov 06 16:25:11 nas kernel: Backtrace:=20
Nov 06 16:25:11 nas kernel: [<c08d1f60>] (__schedule) from [<c08d2944>] =
(schedule+0x78/0x138)
Nov 06 16:25:11 nas kernel:  r10:c0c2d77c r9:00000000 r8:00000102 =
r7:c0d5c46c r6:c0c2d028 r5:c1930ea0
Nov 06 16:25:11 nas kernel:  r4:ffffe000
Nov 06 16:25:11 nas kernel: [<c08d28cc>] (schedule) from [<c019c8e4>] =
(throttle_direct_reclaim+0x2e0/0x2f4)
Nov 06 16:25:11 nas kernel:  r5:c0d5c46c r4:d46cfc10
Nov 06 16:25:11 nas kernel: [<c019c604>] (throttle_direct_reclaim) from =
[<c01a2b34>] (try_to_free_pages+0xbc/0x1cc)
Nov 06 16:25:11 nas kernel:  r9:00000000 r8:00000000 r7:c0d5ca3c =
r6:00000000 r5:c0c2d028 r4:01100cca
Nov 06 16:25:11 nas kernel: [<c01a2a78>] (try_to_free_pages) from =
[<c01dd81c>] (__alloc_pages+0x4f0/0xf2c)
Nov 06 16:25:11 nas kernel:  r8:00000000 r7:00001f6c r6:00000000 =
r5:00400040 r4:00000000
Nov 06 16:25:11 nas kernel: [<c01dd32c>] (__alloc_pages) from =
[<c0189834>] (filemap_read+0x218/0x9c8)
Nov 06 16:25:11 nas kernel:  r10:d46cff08 r9:d46cfef0 r8:00001f6c =
r7:00001f6c r6:00001000 r5:c3e9a1c8
Nov 06 16:25:11 nas kernel:  r4:00001f6d
Nov 06 16:25:11 nas kernel: [<c018961c>] (filemap_read) from =
[<c018a104>] (generic_file_read_iter+0x120/0x198)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:d46cff88 r8:c0c2d028 =
r7:d46cfef0 r6:00001000 r5:00000000
Nov 06 16:25:11 nas kernel:  r4:d46cff08
Nov 06 16:25:11 nas kernel: [<c0189fe4>] (generic_file_read_iter) from =
[<bf7f492c>] (ntfs_file_read_iter+0x58/0xd4 [ntfs3>
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:d46cff88 r8:c0c2d028 =
r7:00000000 r6:01f6c000 r5:00001000
Nov 06 16:25:11 nas kernel:  r4:c6399f00
Nov 06 16:25:11 nas kernel: [<bf7f48d4>] (ntfs_file_read_iter [ntfs3]) =
from [<c020ca38>] (vfs_read+0x1fc/0x33c)
Nov 06 16:25:11 nas kernel: [<c020c83c>] (vfs_read) from [<c020d228>] =
(ksys_pread64+0x70/0x9c)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:d46ce000 r8:c00083e4 =
r7:00001000 r6:01637098 r5:c6399f00
Nov 06 16:25:11 nas kernel:  r4:c6399f01
Nov 06 16:25:11 nas kernel: [<c020d1b8>] (ksys_pread64) from =
[<c020d278>] (sys_pread64+0x24/0x2c)
Nov 06 16:25:11 nas kernel:  r7:000000b4 r6:b09ff600 r5:00000000 =
r4:01f6c000
Nov 06 16:25:11 nas kernel: [<c020d254>] (sys_pread64) from [<c0008260>] =
(ret_fast_syscall+0x0/0x1c)
Nov 06 16:25:11 nas kernel: Exception stack(0xd46cffa8 to 0xd46cfff0)
Nov 06 16:25:11 nas kernel: ffa0:                   01f6c000 00000000 =
00000052 01637098 00001000 00000000
Nov 06 16:25:11 nas kernel: ffc0: 01f6c000 00000000 b09ff600 000000b4 =
00001000 01637098 00000000 0150ab58
Nov 06 16:25:11 nas kernel: ffe0: 00000000 b09fea70 00000000 b6722bf8
Nov 06 16:25:11 nas kernel:  r5:00000000 r4:01f6c000
Nov 06 16:25:11 nas kernel: task:systemd-user-ru state:D stack:    0 =
pid: 9121 ppid:     1 flags:0x00000000
Nov 06 16:25:11 nas kernel: Backtrace:=20
Nov 06 16:25:11 nas kernel: [<c08d1f60>] (__schedule) from [<c08d2944>] =
(schedule+0x78/0x138)
Nov 06 16:25:11 nas kernel:  r10:00000002 r9:00000001 r8:00000000 =
r7:c0cb1238 r6:ffffe000 r5:c613e660
Nov 06 16:25:11 nas kernel:  r4:ffffe000
Nov 06 16:25:11 nas kernel: [<c08d28cc>] (schedule) from [<c0068470>] =
(rwsem_down_write_slowpath+0x2c8/0x3bc)
Nov 06 16:25:11 nas kernel:  r5:c0c27db4 r4:c0cb1230
Nov 06 16:25:11 nas kernel: [<c00681a8>] (rwsem_down_write_slowpath) =
from [<c08d57f0>] (down_write+0x50/0x6c)
Nov 06 16:25:11 nas kernel:  r10:c19bea80 r9:c020f958 r8:c0c35a08 =
r7:c6171800 r6:c0cb1230 r5:c0cb1220
Nov 06 16:25:11 nas kernel:  r4:c0cb1230
Nov 06 16:25:11 nas kernel: [<c08d57a0>] (down_write) from [<c019f694>] =
(register_shrinker_prepared+0x28/0x60)
Nov 06 16:25:11 nas kernel:  r5:c0cb1220 r4:c6171a60
Nov 06 16:25:11 nas kernel: [<c019f66c>] (register_shrinker_prepared) =
from [<c020fe3c>] (sget_fc+0x16c/0x1b4)
Nov 06 16:25:11 nas kernel:  r7:c6171800 r6:00000000 r5:c627e1e0 =
r4:00000000
Nov 06 16:25:11 nas kernel: [<c020fcd0>] (sget_fc) from [<c0210d98>] =
(vfs_get_super+0x3c/0xf8)
Nov 06 16:25:11 nas kernel:  r9:c19be4e0 r8:c01a4438 r7:c627e1e0 =
r6:c2874000 r5:00000003 r4:c627e1e0
Nov 06 16:25:11 nas kernel: [<c0210d5c>] (vfs_get_super) from =
[<c0210e74>] (get_tree_nodev+0x20/0x24)
Nov 06 16:25:11 nas kernel:  r9:c19be4e0 r8:c0c27f34 r7:c0c2d028 =
r6:c2874000 r5:00000023 r4:c627e1e0
Nov 06 16:25:11 nas kernel: [<c0210e54>] (get_tree_nodev) from =
[<c01a3678>] (shmem_get_tree+0x1c/0x24)
Nov 06 16:25:11 nas kernel: [<c01a365c>] (shmem_get_tree) from =
[<c020ef98>] (vfs_get_tree+0x34/0x110)
Nov 06 16:25:11 nas kernel: [<c020ef64>] (vfs_get_tree) from =
[<c0235520>] (path_mount+0x3cc/0x984)
Nov 06 16:25:11 nas kernel:  r6:c2874000 r5:00000023 r4:c627e1e0
Nov 06 16:25:11 nas kernel: [<c0235154>] (path_mount) from [<c0235b44>] =
(do_mount+0x6c/0x9c)
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:c2874000 r8:00000006 =
r7:c19bea80 r6:c19be4e0 r5:00000000
Nov 06 16:25:11 nas kernel:  r4:c0c2d028
Nov 06 16:25:11 nas kernel: [<c0235ad8>] (do_mount) from [<c0235fdc>] =
(sys_mount+0x100/0x1a8)
Nov 06 16:25:11 nas kernel:  r9:c0c26000 r8:00000006 r7:bebe9a90 =
r6:c2874000 r5:c19be4e0 r4:c19bea80
Nov 06 16:25:11 nas kernel: [<c0235edc>] (sys_mount) from [<c0008260>] =
(ret_fast_syscall+0x0/0x1c)
Nov 06 16:25:11 nas kernel: Exception stack(0xc0c27fa8 to 0xc0c27ff0)
Nov 06 16:25:11 nas kernel: 7fa0:                   016b1848 004d2218 =
004d2218 bebe9a90 004d2218 00000006
Nov 06 16:25:11 nas kernel: 7fc0: 016b1848 004d2218 004d2218 00000015 =
016b1848 016b1398 004d2218 00000000
Nov 06 16:25:11 nas kernel: 7fe0: b6f5006c bebe9a80 b6d9efb4 b6c6a9b0
Nov 06 16:25:11 nas kernel:  r10:00000000 r9:c0c26000 r8:c00083e4 =
r7:00000015 r6:004d2218 r5:004d2218
Nov 06 16:25:11 nas kernel:  r4:016b1848

Looks like a deadlock, isn't it?

Kernel version - 5.15.74.

Andriy=
