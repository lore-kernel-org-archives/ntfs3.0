Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E018C34C
	for <ntfs3@lists.linux.dev>; Tue, 20 Aug 2024 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724151259; cv=none; b=KuLf4WQwZf9skyV/warT9rkZD2poe0TQcyLH9RJewABZayegX2YgVjYl7mUPbdrqp3VTSq1VfatYdexQwnyA4yNborGoW4GzAEm1ATDti4FI3CGpc7+jYtHQBpxLu/6DYylmNlcWi/CXOn8Nf/3B2gp7r0zcMpZOY1FqS8k1JLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724151259; c=relaxed/simple;
	bh=2wnt2Py/6AfQ1cB1tR0NJpnl/QPyfgu/B+4g1qR9SIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cD31WnmCltIUZlk8q78qX/VkbapE4Ab00vn1Fyly9YJowOFrw4uA/nQHNZF/DhoEFO+ucyaNn32ZcFGwcPKuiA6Z+3moC2c1jgVhPyKD1rfIjOJD2+2GuYyzSu2NxbWFUcTmGTddQivf5qlDIXusnXUD2ztd3ZBozvfLIh2SCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw15fxgJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw15fxgJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201f2b7fe0dso35696135ad.1
        for <ntfs3@lists.linux.dev>; Tue, 20 Aug 2024 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724151258; x=1724756058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPpaIGJ3T0+YeZPhDXd9BCL2MDyokAOX8E2baD5a+IA=;
        b=Yw15fxgJSScIBAMw/LKnXCjZYUZqYxWVXljBboORXfLI9/ix7vxSoPf41ieLD/zDHW
         8wToBJWRrcc0QzXesJtk+AvQzvRr8Tv9ZuTCFdg+MjUVlnqZh1YqXHVeFIiwY1D6xrqQ
         qcvLt6oFNMJNfM7oCuRRmE/Wp4WIaI3sgHxnCb9W00iDB9KYLihjkKXjMFidBUkDBqdq
         uMAAzWJxr1c443cJGNsB6OnoaG5+SVqmUFUrN2dWipMGDOkSFSN2cOweGgsRyfANMUm7
         bJtlWawBiViy1QSehsjvqZ9VUzW3HI/ocGZIKe9cH3TGdUQlYVvbNlTI8tyYxNQWLXdj
         IhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724151258; x=1724756058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPpaIGJ3T0+YeZPhDXd9BCL2MDyokAOX8E2baD5a+IA=;
        b=vZitmh5Wek7nuOSPh/zzNOPSSbm9n05nqIW54HvT6WyjOBm2IzgsCatFk0Thu3Xtu0
         ckICnFJKFpbeMAuXVgk9Qgvc0Z/80RlI4T90Ohs3/afruaugH3wvWrHhkpGzW2TvX99b
         Tfr6x1z5c+l3gK/bEpdELzUnW8eZoQAmpB7r7kdnJEmdqwUBhsAlZp24W+r2idU37vOZ
         xQln4CyjP6FVIs0EO6MXiXyYmiiTUTwaXdhd4o/vvVGjtiYNev2racgtaG0PRtMhANnh
         i2OaGitQmiwPFrVk/0pWH++4sa0HoHizvdwW91+AeXF77FFZ9dhq5aKNgvI9CwSz6QYc
         xCSw==
X-Forwarded-Encrypted: i=1; AJvYcCWdvgOv6ZGRfxr6ngYtR7k4doISuh4PDbK4tuLMH1Eg/KHeSJkFp0J+k8lKxa1nDhdonrapqASbGXxA6c2wE33Cd12zOwA=
X-Gm-Message-State: AOJu0Yy+MR7jjnFhiS4kUZQTF+r1zXrdsBR8Q2HbxyHydHhlcMJ+myYc
	4mbx1hesjtwhUpVAvGKSBPDfq0e56aQXIphzMVorgedpYouKHt9r
X-Google-Smtp-Source: AGHT+IGiABgPn2r18CuS/apEaIYh6digFuMx6WWCCLB6gdnieJI+bl8FDHuqa10s6+Z5iTyCrH73mQ==
X-Received: by 2002:a17:902:c613:b0:201:f1b5:24ac with SMTP id d9443c01a7336-20203f4ff2cmr88707715ad.54.1724151257324;
        Tue, 20 Aug 2024 03:54:17 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03a5633sm75929675ad.295.2024.08.20.03.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:54:16 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: dvyukov@google.com,
	keescook@google.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhi.xu@windriver.com,
	ntfs3@lists.linux.dev,
	syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in mi_enum_attr
Date: Tue, 20 Aug 2024 18:53:42 +0800
Message-Id: <20240820105342.79788-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <216de662-023a-4a94-8b07-d2affb72aeb5@paragon-software.com>
References: <216de662-023a-4a94-8b07-d2affb72aeb5@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Konstantin,

I think this patch is not fully considered. The root cause is there is a lack of
verification of the space occupied by the fixed members of attr before accessing.
In this patch, 'if (off + 8 > used)' just ensure that type and size field don't
stry beyond valid memory region without considering other members.

We can make a PoC as below to trigger out-of-bound read in 'if (!attr->non_res)',
because if the attr is the first ATTRIB, it will not call
'if (asize < SIZEOF_REDISENT)'. So 'if (off + asize < off || off + asize > used)'
is an invalid check.

PoC:
MFT_REC for MFT_REC_VOL located at: 0x660c00
  MFT_REC.rhdr.sign: 0x454c4946 (FILE)
  MFT_REC.rhdr.fix_off: 0x30
  MFT_REC.rhdr.fix_num: 0x3
  MFT_REC.rhdr.lsn: 0x10550c
  MFT_REC.seq: 0x3
  MFT_REC.hard_links: 0x1
  MFT_REC.attr_off: 0x38 --> 0x3f8
  MFT_REC.flags: 0x1
  MFT_REC.used: 0x178 --> 0x400
  MFT_REC.total: 0x400
  MFT_REC.parent_ref.low: 0x0
  MFT_REC.parent_ref.high: 0x0
  MFT_REC.parent_ref.seq: 0x0
  MFT_REC.next_attr_id: 0x6
  MFT_REC.res: 0x0
  MFT_REC.mft_record: 0x3
ATTRIB[0] located at: 0x660ff8
  ATTRIB[0].type: 0x0 --> 0x10
  ATTRIB[0].size: 0x20000 --> 0x8

KASAN report:
[  611.082411] ==================================================================
[  611.082411] BUG: KASAN: slab-out-of-bounds in mi_enum_attr+0x762/0x810
[  611.082411] Read of size 1 at addr ffff88810e853c00 by task mount/298
[  611.082411]
[  611.082411] CPU: 1 PID: 298 Comm: mount Not tainted 6.8.2 #2
[  611.082411] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
[  611.082411] Call Trace:
[  611.082411]  <TASK>
[  611.082411]  dump_stack_lvl+0x50/0x70
[  611.082411]  print_report+0xcc/0x620
[  611.082411]  ? __virt_addr_valid+0xcb/0x320
[  611.082411]  ? mi_enum_attr+0x762/0x810
[  611.082411]  kasan_report+0xb0/0xe0
[  611.082411]  ? mi_enum_attr+0x762/0x810
[  611.082411]  mi_enum_attr+0x762/0x810
[  611.082411]  ni_enum_attr_ex+0x2fc/0x3e0
[  611.082411]  ? ntfs_read_bh+0x48/0xa0
[  611.082411]  ? __pfx_ni_enum_attr_ex+0x10/0x10
[  611.082411]  ? mi_read+0x32b/0x540
[  611.082411]  ntfs_iget5+0x86c/0x2dc0
[  611.082411]  ? __pfx_ntfs_iget5+0x10/0x10
[  611.082411]  ? __brelse+0x7c/0xa0
[  611.082411]  ntfs_fill_super+0x1686/0x3c00
[  611.082411]  ? __pfx_ntfs_fill_super+0x10/0x10
[  611.082411]  ? set_blocksize+0xbe/0x3a0
[  611.082411]  ? set_blocksize+0x28c/0x3a0
[  611.082411]  ? sb_set_blocksize+0xde/0x110
[  611.082411]  ? setup_bdev_super+0x331/0x690
[  611.082411]  get_tree_bdev+0x32b/0x590
[  611.082411]  ? __pfx_ntfs_fill_super+0x10/0x10
[  611.082411]  ? __pfx_get_tree_bdev+0x10/0x10
[  611.082411]  ? __pfx_vfs_parse_fs_string+0x10/0x10
[  611.082411]  ? cap_capable+0x199/0x200
[  611.082411]  ? security_capable+0x8d/0xc0
[  611.082411]  vfs_get_tree+0x8c/0x300
[  611.082411]  path_mount+0x507/0x1a30
[  611.082411]  ? sysvec_apic_timer_interrupt+0xf/0x80
[  611.082411]  ? __pfx_path_mount+0x10/0x10
[  611.082411]  __x64_sys_mount+0x23b/0x2d0
[  611.082411]  ? __pfx___x64_sys_mount+0x10/0x10
[  611.082411]  ? __do_softirq+0x18a/0x575
[  611.082411]  do_syscall_64+0xb3/0x1b0
[  611.082411]  entry_SYSCALL_64_after_hwframe+0x6f/0x77
[  611.082411] RIP: 0033:0x7f2d7417566a
[  611.082411] Code: 48 8b 0d 29 18 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 8
[  611.082411] RSP: 002b:00007fff27f71598 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
[  611.082411] RAX: ffffffffffffffda RBX: 00007f2d742a9264 RCX: 00007f2d7417566a
[  611.082411] RDX: 000055ec2ff0cf80 RSI: 000055ec2ff0cfc0 RDI: 000055ec2ff0cfa0
[  611.082411] RBP: 000055ec2ff0cd50 R08: 0000000000000000 R09: 00007f2d74247be0
[  611.082411] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[  611.082411] R13: 000055ec2ff0cfa0 R14: 000055ec2ff0cf80 R15: 000055ec2ff0cd50
[  611.082411]  </TASK>
[  611.082411]
[  611.082411] Allocated by task 298:
[  611.082411]  kasan_save_stack+0x24/0x50
[  611.082411]  kasan_save_track+0x14/0x30
[  611.082411]  __kasan_kmalloc+0x7f/0x90
[  611.082411]  __kmalloc+0x179/0x370
[  611.082411]  mi_init+0x90/0x100
[  611.082411]  ntfs_iget5+0x3d1/0x2dc0
[  611.082411]  ntfs_fill_super+0x1686/0x3c00
[  611.082411]  get_tree_bdev+0x32b/0x590
[  611.082411]  vfs_get_tree+0x8c/0x300
[  611.082411]  path_mount+0x507/0x1a30
[  611.082411]  __x64_sys_mount+0x23b/0x2d0
[  611.082411]  do_syscall_64+0xb3/0x1b0
[  611.082411]  entry_SYSCALL_64_after_hwframe+0x6f/0x77
[  611.082411]
[  611.082411] The buggy address belongs to the object at ffff88810e853800
[  611.082411]  which belongs to the cache kmalloc-1k of size 1024
[  611.082411] The buggy address is located 0 bytes to the right of
[  611.082411]  allocated 1024-byte region [ffff88810e853800, ffff88810e853c00)
[  611.082411]
[  611.082411] The buggy address belongs to the physical page:
[  611.082411] page:00000000a08f2d1e refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10e850
[  611.082411] head:00000000a08f2d1e order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  611.082411] flags: 0x200000000000840(slab|head|node=0|zone=2)
[  611.082411] page_type: 0xffffffff()
[  611.082411] raw: 0200000000000840 ffff888100041dc0 dead000000000122 0000000000000000
[  611.082411] raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
[  611.082411] page dumped because: kasan: bad access detected
[  611.082411]
[  611.082411] Memory state around the buggy address:
[  611.082411]  ffff88810e853b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  611.082411]  ffff88810e853b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  611.082411] >ffff88810e853c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  611.082411]                    ^
[  611.082411]  ffff88810e853c80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  611.082411]  ffff88810e853d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  611.082411] ==================================================================

Thanks,
LL
