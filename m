Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAB3239
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 10:27:30 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id s26so389477pgv.7
        for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/w7UwzbnmRu6xEONdwmcsNTVMZbCIcvKyFDV77tAiGg=;
        b=mehSYMeQH8vOgqAOnwXfGbYx+IpqCu5xdiL89kkg46DrWR8EVIhDqlVLrMK84WfLBB
         EHRTcIyurlarGnPmFcwDx8g577B7xFhNLIciS6F3ctrEJNt5dnDTSB7nX47utcyLCLGb
         H5+diuZ6d+2QxalKWw8jC8ohSt5uMVqaJMdRtv3q//TFHgVub4QkReED8S1/BQcmjRdk
         9/WclkM2Nft0LF2S4C5Kal3Rx2P8kXhTJYCEUHrYmfTm9NgMzD0/cnJ+tYTAcmOedKmS
         aco1p239ISkaZXkLq5qNtemNoaM6VjC6WJ5PQUQi10Kd+BEtqsHjhcckZkAyem8aFq8Y
         3mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/w7UwzbnmRu6xEONdwmcsNTVMZbCIcvKyFDV77tAiGg=;
        b=221Gj5Qv33QnkNOtN2/hOII/tjb7z8g7opi8Ygp9Rde8w/+aotJ6N8LHya3SMzQCc8
         +9ZABJNztWKqgnXHj0k/zM+wsatkFacN4QYXwha2AmH5DCVbS2k6eju0IlVGUQ03GWBn
         h6CnvZ1usjE788ph76SQtT/wDpJqvBcchr9/r0xAUO+qBp7XnZxz+K2C4DyJ2alEHad6
         ojnLnCB05mcTzjmN/WHKnQ6R+zCZVrOHbUgHwZTG3+W0ENYWK5m3xH3dNbAU49yWncvZ
         3PJ1q1w+kopNnMsjEmgSB9wXBF74mNG8hb0yWycUqLqJRScYR2YwR++2sqzRnQlNU52c
         RFJw==
X-Gm-Message-State: ACrzQf1oC5qR6yKvqXCODDHnWOH7d2WYnGkMpuTs8MXGHYPZt5QzYZ4U
	OiKEWv5h5VvkFPtVAVhvX8NUHA/Ny5mqykm9
X-Google-Smtp-Source: AMsMyM56YedmD5V4tFh9GW+U5G0/uzoj2JAE4AJoZh+GDlKD73vrBZx+LRvm/XOrqzuRLehduaT9KQ==
X-Received: by 2002:a63:cc4a:0:b0:439:1c48:2fed with SMTP id q10-20020a63cc4a000000b004391c482fedmr7158359pgi.618.1663928849810;
        Fri, 23 Sep 2022 03:27:29 -0700 (PDT)
Received: from localhost ([223.104.44.30])
        by smtp.gmail.com with ESMTPSA id ij29-20020a170902ab5d00b00172e19c5f8bsm5669042plb.168.2022.09.23.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 03:27:29 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: yin31149@gmail.com
Cc: 18801353760@163.com,
	almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzbot+8d6fbb27a6aded64b25b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fs/ntfs3: fix slab-out-of-bounds Read in run_unpack
Date: Fri, 23 Sep 2022 18:27:21 +0800
Message-Id: <20220923102721.32425-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923084917.17666-1-yin31149@gmail.com>
References: <20220923084917.17666-1-yin31149@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 23 Sept 2022 at 16:51, Hawkins Jiawei <yin31149@gmail.com> wrote:
>
> Syzkaller reports slab-out-of-bounds bug as follows:
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in run_unpack+0x8b7/0x970 fs/ntfs3/run.c:944
> Read of size 1 at addr ffff88801bbdff02 by task syz-executor131/3611
>
> [...]
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
>  print_address_description mm/kasan/report.c:317 [inline]
>  print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
>  kasan_report+0xb1/0x1e0 mm/kasan/report.c:495
>  run_unpack+0x8b7/0x970 fs/ntfs3/run.c:944
>  run_unpack_ex+0xb0/0x7c0 fs/ntfs3/run.c:1057
>  ntfs_read_mft fs/ntfs3/inode.c:368 [inline]
>  ntfs_iget5+0xc20/0x3280 fs/ntfs3/inode.c:501
>  ntfs_loadlog_and_replay+0x124/0x5d0 fs/ntfs3/fsntfs.c:272
>  ntfs_fill_super+0x1eff/0x37f0 fs/ntfs3/super.c:1018
>  get_tree_bdev+0x440/0x760 fs/super.c:1323
>  vfs_get_tree+0x89/0x2f0 fs/super.c:1530
>  do_new_mount fs/namespace.c:3040 [inline]
>  path_mount+0x1326/0x1e20 fs/namespace.c:3370
>  do_mount fs/namespace.c:3383 [inline]
>  __do_sys_mount fs/namespace.c:3591 [inline]
>  __se_sys_mount fs/namespace.c:3568 [inline]
>  __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>  [...]
>  </TASK>
>
> The buggy address belongs to the physical page:
> page:ffffea00006ef600 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1bbd8
> head:ffffea00006ef600 order:3 compound_mapcount:0 compound_pincount:0
> flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  ffff88801bbdfe00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff88801bbdfe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ffff88801bbdff00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                    ^
>  ffff88801bbdff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff88801bbe0000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
> Kernel will tries to read record and parse MFT from disk in
> ntfs_read_mft().
>
> Yet the problem is that during enumerating attributes in record,
> kernel doesn't check whether run_off field loading from the disk
> is a valid value.
>
> To be more specific, if attr->nres.run_off is larger than attr->size,
> kernel will passes an invalid argument run_buf_size in
> run_unpack_ex(), which having an integer overflow. Then this invalid
> argument will triggers the slab-out-of-bounds Read bug as above.
>
> This patch solves it by adding the sanity check between
> the offset to packed runs and attribute size.
>
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---
>  fs/ntfs3/inode.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 51363d4e8636..443a32f789ff 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -365,6 +365,11 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>         roff = le16_to_cpu(attr->nres.run_off);
>
>         t64 = le64_to_cpu(attr->nres.svcn);
> +
> +       /* offset to packed runs is out-of-bounds */
> +       if (roff > asize)
> +               goto out;
> +
>         err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
>                             t64, Add2Ptr(attr, roff), asize - roff);
>         if (err < 0)
> --
> 2.25.1
>
return -EINVAL when roff is out-of-bounds

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 51363d4e8636..10723231e482 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -365,6 +365,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	roff = le16_to_cpu(attr->nres.run_off);
 
 	t64 = le64_to_cpu(attr->nres.svcn);
+
+	/* offset to packed runs is out-of-bounds */
+	if (roff > asize) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	err = run_unpack_ex(run, sbi, ino, t64, le64_to_cpu(attr->nres.evcn),
 			    t64, Add2Ptr(attr, roff), asize - roff);
 	if (err < 0)
