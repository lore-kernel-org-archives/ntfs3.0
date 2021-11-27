Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F90268
	for <ntfs3@lists.linux.dev>; Sat, 27 Nov 2021 13:51:51 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id y13so50572834edd.13
        for <ntfs3@lists.linux.dev>; Sat, 27 Nov 2021 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMgI7UZ8bYorIpgxTWhGahpvFK7ny7kkXMTziiNej+0=;
        b=mWOd2DXuW5EN1i5DmFFqr4mBUn//G2o6ju7h9u5R1gXcTCkm/8cvRcG2fLSbPRJiX9
         dWeIGk9G7rg4jXYyOfiggm6Omhx1lh0DQJC0YvHCFAvK4kQQtO4ZKq1JJEc7/2BA+sBh
         /83RhpxwDMvwVR+hOI/pYKhs5+W0PTnLe4jXvfcFRrma8KA6ArQ3rDbGgVcuffErZmAA
         iOipJLrf3wOdzI8uy4QT6Op8Khy0QEEEz3K7ID0WnhoSjv3KUgDTLfXjAEyA/x0cdKNZ
         hAZ+zwDwX/lbrNCliRW2Z2pzFMEGoztnp9zXnkLR4lrRFy6MUKeMd5MPnFx2tj671SIb
         4x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMgI7UZ8bYorIpgxTWhGahpvFK7ny7kkXMTziiNej+0=;
        b=NPu/UGt6WDul3KFZLoXNjDp3PcNjCOs8a7EzPRXa/m3/QAzF8ZtvHZnHpQOrpiTqQi
         wBBGnNpLJYkLCFDv4Nety5Of8gl0Pgp+FfVPX4qb2aBQ8w1338jd4N1uVP+/aBgvt6A3
         A6TZg4nAOMzxLNvclKkYAYcYYlzj2ZrZk9BYK1cZ3rYA8NFp2VC5OSJxPUvNkA4p/7tR
         cxKw5HxzNYcYFR6LwYNG8JB3DP/GmIaOy4QgCwUnVfQ+mK86WJ0YCw5Dh9WQ9X3NsSsd
         wuQLoNf/1g92P0prTDbMgfzX5hxZ4iRIGoycO9sCYa4O2n56FfdoJVPtz9UOj+9IXqI/
         8ASA==
X-Gm-Message-State: AOAM533MkORu0vXODKzwCcomG6hdjrM8B1oM+zkceTuNKETbVsXDNFtT
	zhAr8j1Fuy5SkY42aS0Oz5M=
X-Google-Smtp-Source: ABdhPJxFLLHzOevdxL5qJx4Ca2r6IN4wTQVo/iuxdqvnR6jN2vvPussGQvrcHlBs84b9W0Qkv72hlw==
X-Received: by 2002:a05:6402:270b:: with SMTP id y11mr56960723edd.29.1638021109395;
        Sat, 27 Nov 2021 05:51:49 -0800 (PST)
Received: from localhost (host-82-63-56-77.business.telecomitalia.it. [82.63.56.77])
        by smtp.gmail.com with UTF8SMTPSA id kw10sm4391806ejc.71.2021.11.27.05.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Nov 2021 05:51:49 -0800 (PST)
From: Alessandro Astone <ales.astone@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ales.astone@gmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: Fix showing umask option
Date: Sat, 27 Nov 2021 14:51:05 +0100
Message-Id: <20211127135105.27795-1-ales.astone@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fmask and dmask are 16 bit unsigned, but without the explicit cast
printf sign-extends to 32 bit making it print fmask=37777600022
when it should print fmask=0022.

Signed-off-by: Alessandro Astone <ales.astone@gmail.com>
---
 fs/ntfs3/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29813200c7af..815a597a45ab 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -518,9 +518,9 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 	seq_printf(m, ",gid=%u",
 		  from_kgid_munged(user_ns, opts->fs_gid));
 	if (opts->fmask)
-		seq_printf(m, ",fmask=%04o", ~opts->fs_fmask_inv);
+		seq_printf(m, ",fmask=%04o", (u16)~opts->fs_fmask_inv);
 	if (opts->dmask)
-		seq_printf(m, ",dmask=%04o", ~opts->fs_dmask_inv);
+		seq_printf(m, ",dmask=%04o", (u16)~opts->fs_dmask_inv);
 	if (opts->nls)
 		seq_printf(m, ",iocharset=%s", opts->nls->charset);
 	else
-- 
2.33.1

