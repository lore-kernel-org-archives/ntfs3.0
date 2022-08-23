Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7967F5
	for <ntfs3@lists.linux.dev>; Tue, 23 Aug 2022 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661250772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/7B7tsXp66/9aCmeuLAxDC7tXxat0QsJzIWKfv9VwQc=;
	b=AqgcX6kiiI90ZjEHcTxOAsljaLTdb91n8DZA7Cu6UqfSOwnjKHk+78TEOZCUhoegEORq7p
	h8oGluSti/r9sDbT9NvqL/B1/1AgUeME+GGxU8DuX5RBQQY1nZJhkaRGfzEg+gyDOlB+HD
	fsqpr9gXKGQ1vx0cfnm1XlSqrRDtprA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-2y2Pqr9SMASezePOEH7B0A-1; Tue, 23 Aug 2022 06:32:51 -0400
X-MC-Unique: 2y2Pqr9SMASezePOEH7B0A-1
Received: by mail-pl1-f200.google.com with SMTP id m5-20020a170902f64500b0016d313f3ce7so8972953plg.23
        for <ntfs3@lists.linux.dev>; Tue, 23 Aug 2022 03:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/7B7tsXp66/9aCmeuLAxDC7tXxat0QsJzIWKfv9VwQc=;
        b=pxAZmnK4rsDTSU83jQR2grD9iENEFw2YtBcb6y+zelqh0sR94Yjy+VmQ7epmqCLmc+
         v++fex+ygqUirUrpHIjRkJVSQiywuLgBm47XnS37K+QkhMgkyvwLpa2tBc68hS2W+Mkj
         1Y5ZHXWTGdAFY4Nw3Umk5kJ3o5oCN9rwmQ3bClUDRIFgJJJisAm+cpvWg3pNwoSSzb4t
         bnKjugJju5FAEU8UUINnZTLWb6lBwkFjopbAA+hqs7ZLlsZOByMRldyFm7kLisUEZCww
         hbFpTpV77x+STMCagDIpgszwdP4CbRG0UVayRCNZ0kylePzqR6FaXWpyUvsTKmY3QLat
         rL5g==
X-Gm-Message-State: ACgBeo1YCtfqxqmxtcDCUC++TIF3Ez0T8sYKe3FmruGgerhC74xWPKyQ
	6+ZYN7r6K0Iy3LZEVFgO8j3+hZsU+7wPS+GQna+pTP+8MHj0raWKPY7JQRfN4L21Lek7PsvM275
	RUi3fH8fPb3MZkVQ=
X-Received: by 2002:a17:90b:388e:b0:1fb:62c1:9cb7 with SMTP id mu14-20020a17090b388e00b001fb62c19cb7mr2376268pjb.207.1661250770106;
        Tue, 23 Aug 2022 03:32:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6iUm2WmP1VFW5pKsIifzT1lsCFYmGmekjg+OIP+inBS9uOxw2yUraGZCxAbxxhzTwSWAiNsA==
X-Received: by 2002:a17:90b:388e:b0:1fb:62c1:9cb7 with SMTP id mu14-20020a17090b388e00b001fb62c19cb7mr2376248pjb.207.1661250769833;
        Tue, 23 Aug 2022 03:32:49 -0700 (PDT)
Received: from xps13.. ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b0016d88dc7745sm10128914plf.259.2022.08.23.03.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 03:32:49 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Fix memory leak on ntfs_fill_super() error path
Date: Tue, 23 Aug 2022 19:32:05 +0900
Message-Id: <20220823103205.1380235-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.37.2
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

syzbot reported kmemleak as below:

BUG: memory leak
unreferenced object 0xffff8880122f1540 (size 32):
  comm "a.out", pid 6664, jiffies 4294939771 (age 25.500s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 ed ff ed ff 00 00 00 00  ................
  backtrace:
    [<ffffffff81b16052>] ntfs_init_fs_context+0x22/0x1c0
    [<ffffffff8164aaa7>] alloc_fs_context+0x217/0x430
    [<ffffffff81626dd4>] path_mount+0x704/0x1080
    [<ffffffff81627e7c>] __x64_sys_mount+0x18c/0x1d0
    [<ffffffff84593e14>] do_syscall_64+0x34/0xb0
    [<ffffffff84600087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

This patch fixes this issue by freeing mount options on error path of
ntfs_fill_super().

Reported-by: syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/ntfs3/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 47012c9bf505..c0e45f170701 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1281,6 +1281,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	 * Free resources here.
 	 * ntfs_fs_free will be called with fc->s_fs_info = NULL
 	 */
+	put_mount_options(sbi->options);
 	put_ntfs(sbi);
 	sb->s_fs_info = NULL;
 
-- 
2.37.2

