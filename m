Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3123A7
	for <ntfs3@lists.linux.dev>; Sat,  1 Oct 2022 07:02:13 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d82so6018942pfd.10
        for <ntfs3@lists.linux.dev>; Sat, 01 Oct 2022 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UZi6urliHkT7uuCCwMJIEdfiFKYnQrKuVx0cI+vnDEU=;
        b=jj0QTDpgDeZfGbcn6HGHaPXlP88xl40rG7Pv4j42eH9P9CfKS18A/RSUi7ExdFCu37
         CPbHmiQ23xzPkU2WKU0+1760AmANnC0w052wPTKM0i1n+DQdxeU2G01si0Ql7OaMuWoe
         T9mOR3PK4ShjtJAlj6fzSzqPu+Qe4mrPb124p8mLQZA6L0tbb49F2E1J0C1ZXTx51OyE
         8BjJnaFLFYhwQIoeAIERiZrq6DJ8FcViu0Jor6jnsYh1VkpsByCAYu0WraPm3E60jseB
         emkBG78Wy5SQmcXIlmwaeCxP2KFBDShazS8b5Cgu5Y5oHEM9m9Zq+0SWZFSARrOpcGH7
         qD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UZi6urliHkT7uuCCwMJIEdfiFKYnQrKuVx0cI+vnDEU=;
        b=houlAA6pehqUgHA4CVstYSHsoHhCjVfhx+wfpmJSrK16W/txR6KEWFvVxg/JXT53/x
         K4OE+4sd4kcz3unZyB5gLsFLGqP2WHyklzQ+nGSiwuw+fP7BOmPp7U/xyhKmCEJDFIPt
         iGJTlpIq2w5Qo/9UShWR0d8XtDfl2wKMZ44C7CGqMJIMboPjr8AQ0BlasUUZ6uW4q0IG
         t7mdktpDE7Gu/9qTlumRqJ7G/tON2UlHhbJ9nxEnvAvIgZ7rwFGo0CYnmybYYk04/RXS
         nJbJ3/+R3x9dbtud/W64N8zhj6lskMx2tDQhOgjH72dn+6F/R015ioKIoKatDnH0MbhC
         5JjQ==
X-Gm-Message-State: ACrzQf0hgjA6ihMbisQJ5tiulDYYomnCwbAKj0mF2TdT162aSSi0noB7
	JPtVd8T4S04ws4llIOyYUy4=
X-Google-Smtp-Source: AMsMyM6NekkCQ+SPiH7FgzScGB7FRte1AggwIPEioxwjLKRo72tVf8xBr2hlsYj7VC29MD0zXyl0/A==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id l13-20020a056a00140d00b0052ad561d991mr12604792pfu.46.1664607732558;
        Sat, 01 Oct 2022 00:02:12 -0700 (PDT)
Received: from localhost.localdomain ([171.78.165.127])
        by smtp.googlemail.com with ESMTPSA id 9-20020a631349000000b00429b6e6c539sm2764473pgt.61.2022.10.01.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 00:02:12 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdun Nihaal <abdun.nihaal@gmail.com>,
	syzbot+b892240eac461e488d51@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: Fix slab-out-of-bounds read in ntfs_trim_fs
Date: Sat,  1 Oct 2022 12:30:24 +0530
Message-Id: <20221001070024.1366018-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reports an out of bound access in ntfs_trim_fs.
The cause of this is using a loop termination condition that compares
window index (iw) with wnd->nbits instead of wnd->nwnd, due to which the
index used for wnd->free_bits exceeds the size of the array allocated.

Fix the loop condition.

Fixes: 3f3b442b5ad2 ("fs/ntfs3: Add bitmap")
Link: https://syzkaller.appspot.com/bug?extid=b892240eac461e488d51
Reported-by: syzbot+b892240eac461e488d51@syzkaller.appspotmail.com
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 fs/ntfs3/bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 1675c9a69788..629c1ee97268 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1424,7 +1424,7 @@ int ntfs_trim_fs(struct ntfs_sb_info *sbi, struct fstrim_range *range)
 
 	down_read_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
 
-	for (; iw < wnd->nbits; iw++, wbit = 0) {
+	for (; iw < wnd->nwnd; iw++, wbit = 0) {
 		CLST lcn_wnd = iw * wbits;
 		struct buffer_head *bh;
 
-- 
2.37.3

