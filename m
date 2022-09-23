Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85428FE
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 08:51:27 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so4812988pjl.0
        for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 01:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Gt2dkK02sbgeo7mn1Wgwa1cKyDKOnpdA5NuZsFPhKrA=;
        b=iMbaCc403cdqyshh/Wudiut7tnps6OxuzYF6+SoEpXVDHnhxY+VzBUcCF+YodQJBM3
         ZF9C7mHOTkbdghio/ghBltakqQ1mJxE4rAaANLvxRnmrAu0yWURPTM+HkUp2zZl/k5QU
         9U18oGWpKhqBXw2cjjZQpTBvNYRuBdWZ6Q7IbSDeWkCIdqCCRNNJJQfk5hh8d9brECFA
         RaFiKlS/tBGmOqKHwV7SCxmYpUDPz4WcvoWytMkchV5lONPkNJynqJd1EJ82H4ECECNj
         UVRMmpw4ywdfHXv80MXER+urhG+w+deOaZOyFcG9Qyq9fSHzR/FUkiv2mk+3L1K+h4Ok
         yYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gt2dkK02sbgeo7mn1Wgwa1cKyDKOnpdA5NuZsFPhKrA=;
        b=QRNxqSyydnTfySAFiicjqq28B2z+4lbHSmEJn8Z6z39qalh3oX5yZIM6iJfnx+SH7n
         TwgKPumWQbreOJgXjSjoI/1zox1/cgJjlb3ZgKPaBxdU7VkopxU2wxhthl+ZcA7DvTqm
         4RnnaqNQAKizHz8sfB8/6RRoSQyFNYLuWN4Ow8boKi1/vg86hMp1BrQm/knhZV5eaavQ
         iP2YYYGrpOuujclWadzco1jqWnQ0TnwUG0CHIjxQEhVCqLDJKPYj0BXgeORvpAB6D4xh
         1JAY26Ow5UsvVTGnVPbNTxx/43qnQx2gD5l68WKMTF7J6iTkg+0sRxwUwesCDfNMQSJ/
         ujcw==
X-Gm-Message-State: ACrzQf15TZ++NgDuBZmXCWOaGMVcFFfOaybt65Pw+oVGIG+x2ESzC2wY
	ghCEcq0Ze1pD2wfxCDIJ1IY=
X-Google-Smtp-Source: AMsMyM6OceHxMLniTPQQX0y8IMq4tfngkC0NxTex8K5ZS2DGsHrxfGIru5JGweNgSBOKMGbdB+Z28w==
X-Received: by 2002:a17:902:6bc8:b0:178:81db:c6d9 with SMTP id m8-20020a1709026bc800b0017881dbc6d9mr7480515plt.56.1663923087215;
        Fri, 23 Sep 2022 01:51:27 -0700 (PDT)
Received: from localhost ([223.104.44.30])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090301cd00b00172d9f6e22bsm5523906plh.15.2022.09.23.01.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:51:26 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: syzbot+8d6fbb27a6aded64b25b@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: 18801353760@163.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	yin31149@gmail.com
Subject: [PATCH] fs/ntfs3: fix slab-out-of-bounds Read in run_unpack
Date: Fri, 23 Sep 2022 16:49:17 +0800
Message-Id: <20220923084917.17666-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0000000000002d50a505e94fe5bd@google.com>
References: <0000000000002d50a505e94fe5bd@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reports slab-out-of-bounds bug as follows:
==================================================================
BUG: KASAN: slab-out-of-bounds in run_unpack+0x8b7/0x970 fs/ntfs3/run.c:944
Read of size 1 at addr ffff88801bbdff02 by task syz-executor131/3611

[...]
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:317 [inline]
 print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
 kasan_report+0xb1/0x1e0 mm/kasan/report.c:495
 run_unpack+0x8b7/0x970 fs/ntfs3/run.c:944
 run_unpack_ex+0xb0/0x7c0 fs/ntfs3/run.c:1057
 ntfs_read_mft fs/ntfs3/inode.c:368 [inline]
 ntfs_iget5+0xc20/0x3280 fs/ntfs3/inode.c:501
 ntfs_loadlog_and_replay+0x124/0x5d0 fs/ntfs3/fsntfs.c:272
 ntfs_fill_super+0x1eff/0x37f0 fs/ntfs3/super.c:1018
 get_tree_bdev+0x440/0x760 fs/super.c:1323
 vfs_get_tree+0x89/0x2f0 fs/super.c:1530
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1326/0x1e20 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
 [...]
 </TASK>

The buggy address belongs to the physical page:
page:ffffea00006ef600 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1bbd8
head:ffffea00006ef600 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88801bbdfe00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88801bbdfe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88801bbdff00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                   ^
 ffff88801bbdff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88801bbe0000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

Kernel will tries to read record and parse MFT from disk in
ntfs_read_mft().

Yet the problem is that during enumerating attributes in record,
kernel doesn't check whether run_off field loading from the disk
is a valid value.

To be more specific, if attr->nres.run_off is larger than attr->size,
kernel will passes an invalid argument run_buf_size in
run_unpack_ex(), which having an integer overflow. Then this invalid
argument will triggers the slab-out-of-bounds Read bug as above.

This patch solves it by adding the sanity check between
the offset to packed runs and attribute size.

Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 fs/ntfs3/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 51363d4e8636..443a32f789ff 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -365,6 +365,11 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	roff = le16_to_cpu(attr->nres.run_off);
 
 	t64 = le64_to_cpu(attr->nres.svcn);
+
+	/* offset to packed runs is out-of-bounds */
+	if (roff > asize)
+		goto out;
+
 	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
 			    t64, Add2Ptr(attr, roff), asize - roff);
 	if (err < 0)
-- 
2.25.1

