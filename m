Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D172F50
	for <ntfs3@lists.linux.dev>; Sat, 12 Aug 2023 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691855300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uuLnbEX1liSo9dO1MfauQpa5/jKTKZTbSP5WgwBnljo=;
	b=VACSOKurBzEFOihT4lh7kGWJRlLzAjygpv58XobgVXvESQl/jVOMWGmR4Q3hKn0SBjUNdy
	tOCFqTtD3pLnK7QFvY1aOCUfUPNouW6038im/ISLGUvKzAHMrCh7XZk3vECCyg/aHhGbw3
	w39FjSnjRsrDeFiwsRkM11dNb2MfyjM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-Wr9250RYNhOwjVQ2rUCnpg-1; Sat, 12 Aug 2023 11:48:19 -0400
X-MC-Unique: Wr9250RYNhOwjVQ2rUCnpg-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-686e29b0548so3516221b3a.1
        for <ntfs3@lists.linux.dev>; Sat, 12 Aug 2023 08:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691855298; x=1692460098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuLnbEX1liSo9dO1MfauQpa5/jKTKZTbSP5WgwBnljo=;
        b=DJgi6Eh4TkaZIuS09i+jbY5ayK0Ee3+TanSzyRemhspCvFsE8HllZaZ8j1C9mo2/i4
         l5D+MtcRM03cULe4uMdOG0a6V55H+Z0XwJdC7lrHO+nP6MvVwL2B17S9kZHflsh9Bipz
         2TfFkV9vHGGJstC5et7IvL9GVZqaPNJ21lB6cUwZ3gtyoVLMBK5NheNNfsDgGXVjcIRD
         Izfvxf7l2jmbSdjovQUw3rW8PP5G472bzRCeyO/UDcewhRp5rcgg8xJrat2MFU6xVK6+
         uyvkMNnjDlD676lwoUiNu2jijaVl6RHJvdgt24UPlxuZi7+INNY5GXqcnO9M3kR6j1aw
         SDPA==
X-Gm-Message-State: AOJu0YzQdwXsZ07FYGxlKsDYVmIDZDG9861t2yt0LiEYGaHYL1IPeEPB
	f6O4WWLiCx1sFeK27bcItccN0320VKw313CjXhT8smK3BSSxZkTJWwpz2yuKe8v6RVH4eaWiRv6
	KqtDHa0bN7W8AUDg=
X-Received: by 2002:a05:6a20:1051:b0:13f:53b1:c063 with SMTP id gt17-20020a056a20105100b0013f53b1c063mr4173185pzc.49.1691855298030;
        Sat, 12 Aug 2023 08:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHupd6CSNAmZCrljB3o8Tar4e/zKNEPo62QO1TeETuTpebirRFV4bfNnpfVDC5YZ1yWo5a1+g==
X-Received: by 2002:a05:6a20:1051:b0:13f:53b1:c063 with SMTP id gt17-20020a056a20105100b0013f53b1c063mr4173169pzc.49.1691855297650;
        Sat, 12 Aug 2023 08:48:17 -0700 (PDT)
Received: from kernel-devel.local ([240d:1a:c0d:9f00:245e:16ff:fe87:c960])
        by smtp.gmail.com with ESMTPSA id i12-20020aa78b4c000000b0068338b6667asm5057462pfd.212.2023.08.12.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 08:48:17 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>
Subject: [PATCH] fs/ntfs3: Fix potential use-after-free in ntfs_init_from_boot()
Date: Sun, 13 Aug 2023 00:47:36 +0900
Message-ID: <20230812154736.975753-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

KASAN found the following issue:

BUG: KASAN: use-after-free in memcmp+0x172/0x1c0
Read of size 8 at addr ffff88802d88a002 by task repro/4557

CPU: 0 PID: 4557 Comm: repro Not tainted 6.5.0-rc5-00296-gf8de32cc060b-dirty #20
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc38 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xd3/0x1b0
 print_report+0xc4/0x630
 ? __virt_addr_valid+0x5e/0x2d0
 ? __phys_addr+0xc6/0x140
 kasan_report+0xda/0x110
 ? memcmp+0x172/0x1c0
 ? memcmp+0x172/0x1c0
 memcmp+0x172/0x1c0
 ? __bread_gfp+0x79/0x310
 ntfs_fill_super+0x722/0x43a0
 ? put_ntfs+0x330/0x330
 ? vsprintf+0x30/0x30
 ? set_blocksize+0x2c0/0x360
 get_tree_bdev+0x43e/0x7d0
 ? put_ntfs+0x330/0x330
 vfs_get_tree+0x88/0x350
 path_mount+0x69f/0x1ec0
 ? kmem_cache_free+0xf0/0x4a0
 ? finish_automount+0xa50/0xa50
 ? putname+0x105/0x140
 __x64_sys_mount+0x293/0x310
 ? copy_mnt_ns+0xb60/0xb60
 ? syscall_enter_from_user_mode+0x26/0x80
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2d6bf29eaa
Code: 48 8b 0d 71 df 0a 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 c8
RSP: 002b:00007ffcf8924638 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000423e00 RCX: 00007f2d6bf29eaa
RDX: 0000000020000080 RSI: 00000000200000c0 RDI: 00007ffcf8924770
RBP: 00007ffcf8924800 R08: 00007ffcf8924670 R09: 0000000000000000
R10: 0000000000000040 R11: 0000000000000202 R12: 00007ffcf8924978
R13: 00007ffcf8924988 R14: 0000000000402c65 R15: 00007f2d6c014a60
 </TASK>

dev_size variable is used to calculate the LBO of the alternative boot
in ntfs_init_from_boot().  dev_size is set to the number of bytes of
the device, but it can be modified when the NTFS sector size and the
media sector size are different.  So, using dev_size can cause the
above issue in that case.

This patch fixes this issue by resetting dev_size to the actual number
of bytes of the device before calculating the LBO of the alternative
boot.

Fixes: 6a4cd3ea7d77 ("fs/ntfs3: Alternative boot if primary boot is corrupted")
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/ntfs3/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 1a02072b6b0e..43b698353840 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1067,7 +1067,10 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 out:
 	if (err == -EINVAL && !bh->b_blocknr && dev_size > PAGE_SHIFT) {
 		u32 block_size = min_t(u32, sector_size, PAGE_SIZE);
-		u64 lbo = dev_size - sizeof(*boot);
+		u64 lbo;
+
+		dev_size = bdev_nr_bytes(sb->s_bdev);
+		lbo = dev_size - sizeof(*boot);
 
 		/*
 	 	 * Try alternative boot (last sector)
-- 
2.41.0

