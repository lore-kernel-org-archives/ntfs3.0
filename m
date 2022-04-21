Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC323B3
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 20:53:44 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id x17so10784994lfa.10
        for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QMaXVrKk9gfumVTRL9xZxvAh+Uev5F5t1NCU2kpSj9Y=;
        b=JgY2opUF0mU6jJmGtfHvRgRMwUOhHike+V7WS9GYAJv9FeWiJLS9GaHBurVKfTpigk
         wN8dPahuZhpq23Et8iKWCKhJXFl3aTuSWePFXPAscZb6bO/gDWg1dM4wwl7qRy5PLuCx
         2voGTpg1P1uhNu4AMkX31N0ZJApoQiBqclQF166RqDTxK6AE5JvYsBZJ4YY0VNXx4nDc
         CBfFo/Te5JGq4nk95zBSjhH8graeObWF02JcqVfHXd1l53flgQbqjxmqBKMi4iwab9LP
         4vMeqWEXhojruavaihjE5vGLmUcKtdUfX4o4C7LG8cjM2F6I3J0E2GrJ/4vNTbCTE25H
         4NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QMaXVrKk9gfumVTRL9xZxvAh+Uev5F5t1NCU2kpSj9Y=;
        b=W3cR472GEKQ4b9S1tSxYiGF8y/10IzhsSV3WT/wgq3h0CzFwicm25K+WyONAqMFbnc
         NwiQdaszSBByLrdXauWQfJixIEU2c4Ejoyju7H0pcIWe2pBLD+8gNF/KuSveXC0pwnH3
         R/GM2BGla2xgxMMJA3WJByAzN+MqOlCjacqlnXKImRyByt7IBzqvv+8kAqV2XYJ3JcKW
         mPErHind+OZDFi5C5vIVUtieJTiv65jsO8Q9KpfddUyUZ5Gfjk9QCKpKAyhnlpAYFGfF
         C9p3gCTMHRG/ebtQvK4Ew0w/hqvANytE5rC3G3SBbN7+gDVIoQ5QQycy58XR0plPQ5FS
         jzhA==
X-Gm-Message-State: AOAM532wEqpuOgnpVzngoTKHzdZx135WUvtRT77+MHAFCIfJce2v7WSn
	37ZI8mC92kd6XXxKzBgF+oo=
X-Google-Smtp-Source: ABdhPJw9myzb07PcFULj//fMjCRC8IEUK0ANDWS8yQnArFiD3LTeE6lCvtrrKb38lDXibyNjWif1EQ==
X-Received: by 2002:a19:ee05:0:b0:46e:2f8d:db76 with SMTP id g5-20020a19ee05000000b0046e2f8ddb76mr836068lfb.321.1650574422442;
        Thu, 21 Apr 2022 13:53:42 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id q21-20020a05651232b500b0046bacf73c9fsm11963lfe.151.2022.04.21.13.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 13:53:42 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavel Skripkin <paskripkin@gmail.com>,
	syzbot+c95173762127ad76a824@syzkaller.appspotmail.com
Subject: [PATCH 1/2] ntfs3: fix NULL deref in ntfs_update_mftmirr
Date: Thu, 21 Apr 2022 23:53:36 +0300
Message-Id: <85293dd018cae78e4d48d74ca77710b11eed59ba.1650574393.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ntfs_fill_super() wasn't called then sbi->sb will be equal to NULL.
Code should check this ptr before dereferencing. Syzbot hit this issue
via passing wrong mount param as can be seen from log below

Fail log:
ntfs3: Unknown parameter 'iochvrset'
general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 1 PID: 3589 Comm: syz-executor210 Not tainted 5.18.0-rc3-syzkaller-00016-gb253435746d9 #0
...
Call Trace:
 <TASK>
 put_ntfs+0x1ed/0x2a0 fs/ntfs3/super.c:463
 ntfs_fs_free+0x6a/0xe0 fs/ntfs3/super.c:1363
 put_fs_context+0x119/0x7a0 fs/fs_context.c:469
 do_new_mount+0x2b4/0xad0 fs/namespace.c:3044
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-and-tested-by: syzbot+c95173762127ad76a824@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 fs/ntfs3/fsntfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 3de5700a9b83..891125ca6848 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -831,10 +831,15 @@ int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
 {
 	int err;
 	struct super_block *sb = sbi->sb;
-	u32 blocksize = sb->s_blocksize;
+	u32 blocksize;
 	sector_t block1, block2;
 	u32 bytes;
 
+	if (!sb)
+		return -EINVAL;
+
+	blocksize = sb->s_blocksize;
+
 	if (!(sbi->flags & NTFS_FLAGS_MFTMIRR))
 		return 0;
 
-- 
2.35.1

