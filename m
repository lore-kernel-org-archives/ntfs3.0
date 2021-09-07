Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E272
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 15:36:14 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id j12so17196042ljg.10
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wnl5XEhkh1MPnWBnjk0/9SddCZUQ/Patup1iPbeWRo=;
        b=TrcQyDIOury2E1YNGllTiyd9zQIT/S19byBaL6Tkko9MZoj++wOT6b4iYeAjiWY6u2
         MsDFIXsUnf5r9rIOr3cYnlQVTX/u/9H9gqFhw89/QjV3GlFyOjuG6JBXvD3NRUATM+VV
         +ebQHQ8DFhzxIwBG+X2VAifnkbfcwKKRhqMvIcTPHYEQZ8YUkxbxKglVQ85p/+4hO723
         Dbx98HjId2Yzs6YNVKGBoda/ojZU3K/EW4H+JLikgsn9ZgI1FoqVoiMNSd+GAUTC1gTt
         PhUdNHqFvCIDhyQTAzJpjV+c5hUF2qSJZgMY48va8ICmz2y6SbrkNM6EYNaDUYyrqIDi
         Tz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wnl5XEhkh1MPnWBnjk0/9SddCZUQ/Patup1iPbeWRo=;
        b=obDHXqkFago9tgKjOTW/uDKqPS7n0ZFLzH9QPQrkt6y2kbpDkC9omDO1n7tcpWwqyR
         LNhsRapxaNHGioCwTPdlg4s7PFGw6tSswaHPlqPqG9RU7ZN9OAJMAHiL8rpKs+N5jm/T
         yq7oWOaFQKUSqjZpTMQQqUtTLS1JkxBHj4qvzmITIcl9TaSKrzZgx9Dj8bVYf1X2+vj7
         1XL1uNpKsgMTWA5B2YIlI2LxHTpXP5bAnCR8m44GJskBF3E13yh8AMiwiC4pVvcutxmW
         HXvxPx+QUNVLIRfOy1pOs0mhLtAgnT7wnmyTYnWLfRwPtt4kmHqz/h7qf1WiFHyc6oJA
         tvRA==
X-Gm-Message-State: AOAM531y5HTovRnYleQvCbptGWImS0wU4atuc5zBX2DTaKsCCjfXCO0/
	5e7YSItWQBWqkU6VZFzauis=
X-Google-Smtp-Source: ABdhPJwgvFMH2G3rwok9ZZOeY6CuDzZMwUDdV5/PmUlytfXrNH3n0s6VNKjSUC7m/Fw8FKjqrkdkOA==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr14797242ljk.121.1631028971244;
        Tue, 07 Sep 2021 08:36:11 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p14sm1484458lji.56.2021.09.07.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 08:36:10 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v4 2/9] fs/ntfs3: Remove unnecesarry remount flag handling
Date: Tue,  7 Sep 2021 18:35:50 +0300
Message-Id: <20210907153557.144391-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907153557.144391-1-kari.argillander@gmail.com>
References: <20210907153557.144391-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecesarry remount flag handling. This does not do anything for
this driver. We have already set SB_NODIRATIME when we fill super. Also
noatime should be set from mount option. Now for some reson we try to
set it when remounting.

Lazytime part looks like it is copied from f2fs and there is own mount
parameter for it. That is why they use it. We do not set lazytime
anywhere in our code. So basically this just blocks lazytime when
remounting.

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index a18b99a3e3b5..6cb689605089 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -417,8 +417,6 @@ static int ntfs_remount(struct super_block *sb, int *flags, char *data)
 
 	clear_mount_options(&old_opts);
 
-	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME) |
-		 SB_NODIRATIME | SB_NOATIME;
 	ntfs_info(sb, "re-mounted. Opts: %s", orig_data);
 	err = 0;
 	goto out;
-- 
2.25.1

