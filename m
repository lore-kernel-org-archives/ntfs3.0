Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284651F929
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 19:41:51 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fc8049fd8bso1867906e87.2
        for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689277310; x=1691869310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vrpif+TWcUEv65hsE9Ro9qWNgOPp3o8fXtbJS5f3czc=;
        b=mvANe6FUTFFsZW4UGXUmDE5e/+U3bTLPc89o7LHrg/t8xq93mTvJRAWKXcqde1/Afs
         txJeEUorkXBqspyHS67REz4bzKahCZAO9gTwSeLIxBmPpIiYIByspj1QKx4h2qiS4LBd
         eQc6RWHCHOMhd1e1All9kZd43l9Qp2yznObCYrPBmw1ROsCdMDttHn0N7tkmrZhfL+yA
         /1qX2D4hYfLWjP8LVPRvFrorGqknmu1SuZl/e8ztl4i+SdvMjO4OcApKFV4MSr1z5hgT
         EjjL+ijNuI4OQvcqN4gCaMOH5AZTGCDVs9ZTdnoQvJgB8cencJKL1UkCNqj8jI31ZBb7
         ZRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689277310; x=1691869310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vrpif+TWcUEv65hsE9Ro9qWNgOPp3o8fXtbJS5f3czc=;
        b=gtR58nHbytH2VM6WcmI7pCJX1+BSo9iUwbQ22bfcfsh+zeqbElooN7J6vo9wjSBJii
         16tuqinlENCWqErOzp5G5lFuFeaGT05cpyszr9fnUS4WSV8RKopnMBHnQCGTaat6TPRU
         C/5sQNcs6OqmBp/LzKztt+RrmLAg2yR4zPi/WmsDXUB1Qgtirk+Hbk4uNXfpBP0HJ79k
         tF4Q2MkD0PnkJnDQTxfoikIZwLYfQl5Ri3uDxhyutwOuS/Aqi5N4X5/jjjAqcCnYSPFr
         Tk27yAXbE2WCkVxAL7zy3t7biKQeHWn7zIcNAgqzVZrB0DNlRD0gbHWYzhCW+WoNHGZA
         mMQg==
X-Gm-Message-State: ABy/qLY1By2690IwwphFDjkIO+WpTtN4mIOVg+VHeNRPS9efQ+HUxznJ
	JzhCp/o98XNqPKk78j/Gw0s=
X-Google-Smtp-Source: APBJJlFl6v/ohCAnvgIKUIS+NR9JCG7//DZMAWP2vTcunaM/0M22+S8+kTL8+J/Sol9e3EKe3Yn/KQ==
X-Received: by 2002:a19:8c04:0:b0:4fb:7592:7e03 with SMTP id o4-20020a198c04000000b004fb75927e03mr2191338lfd.20.1689277309388;
        Thu, 13 Jul 2023 12:41:49 -0700 (PDT)
Received: from fedora.. ([2a00:1370:8180:6b00:a1a8:4887:1af4:637a])
        by smtp.gmail.com with ESMTPSA id q14-20020ac2514e000000b004fb79feb288sm1223258lfd.152.2023.07.13.12.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 12:41:48 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	syzbot+53ce40c8c0322c06aea5@syzkaller.appspotmail.com
Subject: [PATCH] ntfs3: fix OOB read in ntfs_init_from_boot
Date: Thu, 13 Jul 2023 22:41:46 +0300
Message-Id: <20230713194146.93568-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot was able to create a device which has the last sector of size
512.

After failing to boot from initial sector, reading from boot info from
offset 511 causes OOB read.

To prevent such reports add sanity check to validate if size of buffer_head
if big enough to hold ntfs3 bootinfo

Fixes: 6a4cd3ea7d77 ("fs/ntfs3: Alternative boot if primary boot is corrupted")
Reported-by: syzbot+53ce40c8c0322c06aea5@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 fs/ntfs3/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 1a02072b6b0e..e04e89b7335e 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -855,6 +855,11 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 
 check_boot:
 	err = -EINVAL;
+
+	/* Corrupted image; do not read OOB */
+	if (bh->b_size - sizeof(*boot) < boot_off)
+		goto out;
+
 	boot = (struct NTFS_BOOT *)Add2Ptr(bh->b_data, boot_off);
 
 	if (memcmp(boot->system_id, "NTFS    ", sizeof("NTFS    ") - 1)) {
-- 
2.40.1

