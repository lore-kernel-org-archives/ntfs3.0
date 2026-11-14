Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794646051;
	b=KWjBn2IhD5btfP38hWmi8xUoFVB6JqPSymt0TBXrOcmvCt50kbmfK9VwM8C3KyuaUAjU
	 rq5O7aWs7flo37Ihb4gRltacBuePZzwN9gKkMNx3+Ad7Lngz9XEuCP0MnTzALfCG31X2c
	 YkDMMvnpEAVLW7+5e3dQjx5/udrf2q+YggFQWL5mT50vSTffRxbzmbKOZcn/qgv6FFR+V
	 1XXGX3XnpfbFsbrYba72dNT814sLYgq/3GLkeZ6EambTWHep2jxyP3iVRUyqaXtW2YaLb
	 YPtcA8H7IFh+IszJqCiLsQZm+AbV3ONv8KpFAhlvaFto5qcFOrd5pVMVo6a65hEinNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794646051;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=QZow5gF9A3oF8F9f2iUXyBFNDUBD0v/YVRX+8fupRp0=;
	b=SR0q58zQsaXRF54pTGmlWat5+OhGQ6p/12C+tmdUSXwNTHEhl8fo/pN8BWGkmmTzj93i
	 iRajFamnHdFbQ3eOefOTI0Own+XChk9QjBPliQuovwzjGsf1g/XjgTAUOj9Vql2E5Z2rX
	 bBUCv2Af/ekbMgf9J688i5TWH76UIGKCEiyG90ZqJh5MP8kLznTU8TsGri3LGTd0xZj9E
	 AirfGl6z2YrETi6zCdqg0477+CqLP9OrEWftQqbg11cB5heN4IZep6MWlQiuWXTdXxuon
	 m7um0WOKgrd77lpwThtD9+QMQlPm5URxkFzGNqPnuxuy4K1fcSglXXJXcKCawafUGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A623606A330
	for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A623606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so2556579b6e.0
        for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 00:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794646050; x=1795250850;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QZow5gF9A3oF8F9f2iUXyBFNDUBD0v/YVRX+8fupRp0=;
        b=H0N0BwK0W/3FcFQb33W8XIntMndVm/shT0+d7zpPZRq50wC5Ql/kqV9Lvw0DZkQr2c
         Dhyz1MJ9StbDw21soYyxj91Z/WB1lo5G1SuguMubehMUh5iK0UkVJ79pVM3zIuEPJWKD
         t7Z1XEtmjw8WVyUL+0PFl0cIWTcYZBSJDpEC29cb4m3TbX3Z0C1JujbhH9Ub7E3WWL/E
         hQGyywrrS5gcnhA3zXolmccerFcqIlaFOW/EXqjXvO2o/aSydhluPy4noZ9WF3Q4UqFY
         rwT7Ln2+Zk8x3XeZIA5HpT8Wlx5m0I4gDDya7XcbuncaQRZCCFPUXnCJxr9Re3n1L7VH
         KoGw==
X-Forwarded-Encrypted: i=1; AL+hErEkQZ9raMawZRpta18fSXHDSmDK+6/+vxyfu/IOphRA0JMt7xHmQh8ZYg+wjd01sAN6ZujSRw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8AQM+zxS49XpxfmZd+kemn0exlu+YSkGGQkWAveosxjF182YBQ
	IPCHHhFbvDSPVFbSh0HUAYE8mU9OavqOTepgNln539mx8pI047kop2P2fw2i3v1KmJxsq7oW4ns
	Apnoid8Qcd/qz7iAalHB9ytq+LuHlPe/+nU/zFW86JGYrdzgYSi/b438dc4E=
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1d3:b0:4e8:e664:f268 with SMTP id
 5614622812f47-56e63fb930cmr4454021b6e.25.1794646050017; Sat, 14 Nov 2026
 00:47:30 -0800 (PST)
Date: Sat, 14 Nov 2026 00:47:29 -0800
In-Reply-To: <6af53e12.6d8d289a.8382.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af82021.097d52ff.3d440.0002.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in
 ntfs_read_hdr (2)
From: syzbot <syzbot+7f14bc1da1f4da6518e5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2800868f6322 Merge tag 'sound-7.4-rc3' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17b9a755580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=7f14bc1da1f4da6518e5
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11dfc9ad580000

AI-generated root cause summary:
A slab-use-after-free occurs in ntfs_read_hdr() because ntfs_readdir() unlocks
ni_lock before calling ntfs_read_hdr() with a pointer to root->ihdr located
inside the MFT record buffer (ni->mi.mrec). The directory code erroneously
assumed that holding shared i_rwsem was sufficient to keep the record buffer
stable. However, background writeback (ni_write_inode()) does not take i_rwsem
and only checks ni_trylock(), so it concurrently runs ni_try_remove_attr_list()
on the inode. In ni_try_remove_attr_list(), the error recovery path restores the
primary record via swap(mrec, ni->mi.mrec) followed by kfree(mrec), freeing the
original MFT record buffer while ntfs_read_hdr() is actively traversing entries
within it.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=7f14bc1da1f4da6518e5

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7f14bc1da1f4da6518e5@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ntfs_read_hdr+0x8f2/0xc10 fs/ntfs3/dir.c:427
Read of size 2 at addr ffff88801f8f6268 by task syz-executor233/5623

CPU: 0 UID: 0 PID: 5623 Comm: syz-executor233 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ntfs_read_hdr+0x8f2/0xc10 fs/ntfs3/dir.c:427
 ntfs_readdir+0x68c/0xf00 fs/ntfs3/dir.c:573
 iterate_dir+0x3db/0x880 fs/readdir.c:114
 __do_sys_getdents fs/readdir.c:324 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:309
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbe88d96f69
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffcfbaca88 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fbe88d96f69
RDX: 0000000000001000 RSI: 00007fbe88d60fd0 RDI: 0000000000000003
RBP: 00007fffcfbacae0 R08: 0000000000000000 R09: 00007fffcfbacac0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fbe88e04112
R13: 00007fbe88d60fd0 R14: 00007fbe88e040cb R15: 00007fffcfbacb00
 </TASK>

Allocated by task 5623:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x366/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 mi_init+0x76/0xe0 fs/ntfs3/record.c:105
 ntfs_read_mft fs/ntfs3/inode.c:61 [inline]
 ntfs_iget5_flags+0x67e/0x4780 fs/ntfs3/inode.c:735
 dir_search_flags+0x2d7/0x560 fs/ntfs3/dir.c:318
 ntfs_lookup+0x1d9/0x450 fs/ntfs3/namei.c:96
 lookup_open+0xa54/0x1ae0 fs/namei.c:4536
 open_last_lookups fs/namei.c:4774 [inline]
 path_openat+0x70c/0x20f0 fs/namei.c:5013
 do_file_open+0x23e/0x4a0 fs/namei.c:5045
 do_sys_openat2+0x115/0x200 fs/open.c:1443
 do_sys_open fs/open.c:1449 [inline]
 __do_sys_openat fs/open.c:1465 [inline]
 __se_sys_openat fs/open.c:1460 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1460
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5625:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 ni_try_remove_attr_list+0xda6/0xf40 fs/ntfs3/frecord.c:-1
 ni_write_inode+0xbf1/0x1200 fs/ntfs3/frecord.c:3266
 write_inode fs/fs-writeback.c:1629 [inline]
 __writeback_single_inode+0x69d/0x1220 fs/fs-writeback.c:1872
 writeback_single_inode+0x544/0xf70 fs/fs-writeback.c:1947
 write_inode_now+0x1bd/0x290 fs/fs-writeback.c:3102
 ntfs_file_fsync+0x133/0x250 fs/ntfs3/file.c:1536
 vfs_fsync_range fs/sync.c:186 [inline]
 vfs_fsync fs/sync.c:200 [inline]
 do_fsync fs/sync.c:211 [inline]
 __do_sys_fsync fs/sync.c:216 [inline]
 __se_sys_fsync fs/sync.c:214 [inline]
 __x64_sys_fsync+0x12a/0x180 fs/sync.c:214
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88801f8f6000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 616 bytes inside of
 freed 1024-byte region [ffff88801f8f6000, ffff88801f8f6400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1f8f4
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c841dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c841dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 38, tgid 38 (kworker/u4:2), ts 105555018334
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1860
 prep_new_page mm/page_alloc.c:1868 [inline]
 get_page_from_freelist+0x225d/0x22e0 mm/page_alloc.c:3950
 __alloc_pages_slowpath+0x768/0x14a0 mm/page_alloc.c:4893
 __alloc_frozen_pages_noprof+0x3ea/0x450 mm/page_alloc.c:5510
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x476/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ieee802_11_parse_elems_full+0x14b/0x2a10 net/mac80211/parse.c:1077
 ieee80211_inform_bss+0x1b3/0x1150 net/mac80211/scan.c:91
 rdev_inform_bss net/wireless/rdev-ops.h:457 [inline]
 cfg80211_inform_single_bss_data+0xd9d/0x1df0 net/wireless/scan.c:2447
 cfg80211_inform_bss_data+0x25b/0x3be0 net/wireless/scan.c:3304
 cfg80211_inform_bss_frame_data+0x51a/0xae0 net/wireless/scan.c:3400
 ieee80211_bss_info_update+0x791/0xa50 net/mac80211/scan.c:237
 ieee80211_rx_bss_info net/mac80211/ibss.c:1070 [inline]
 ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1560 [inline]
 ieee80211_ibss_rx_queued_mgmt+0x1ce1/0x2c40 net/mac80211/ibss.c:1587
 ieee80211_iface_process_skb net/mac80211/iface.c:1808 [inline]
 ieee80211_iface_work+0x78a/0x1010 net/mac80211/iface.c:1862
page last free pid 5310 tgid 5310 ts 95675130580 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xd1a/0xe10 mm/page_alloc.c:2958
 __slab_free+0x269/0x2c0 mm/slub.c:5926
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:361
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 __kmalloc_cache_noprof+0x29a/0x600 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 ref_tracker_alloc+0x221/0x530 lib/ref_tracker.c:270
 register_netdevice+0x1aa9/0x2280 net/core/dev.c:11764
 lowpan_newlink+0x3b6/0x580 net/ieee802154/6lowpan/core.c:178
 rtnl_newlink_create+0x305/0x7b0 net/core/rtnetlink.c:4006
 __rtnl_newlink net/core/rtnetlink.c:4135 [inline]
 rtnl_newlink+0x167a/0x1c30 net/core/rtnetlink.c:4252
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7169
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2585
 netlink_unicast_kernel net/netlink/af_netlink.c:1336 [inline]
 netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1362
 netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1921
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800

Memory state around the buggy address:
 ffff88801f8f6100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801f8f6180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88801f8f6200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff88801f8f6280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801f8f6300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
