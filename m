Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1D72
	for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 09:56:39 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id q21so20079953ljj.6
        for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 02:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5JhVyRqtdJpuGBlvHxS0x0qfaPttBBsFZAiPeZDkRE=;
        b=qzYp3rH7/Jm8TDxr6yuA+GxjZA0ElQbz+XiSyKTodB3ODMiqYP6Z1EQ5n9KB2NIwTw
         2SvuQ+RKW2jsUtPbsUtkyHU0F9IavDD2WE6BKHNy41tM6LxZcN5Ff6VVaM6EdfKdUEqQ
         SPE2ql5GgbpuGftmpq2DpuZWToI8bxY65K0LDETKTkgbRgOl9agQJpyH6Dvkj5rhIXQu
         yDP7ycj8oV9G65tXPhwIzU5P8AqWGWhhWzYM/rVW8ECRD9PNt7XAF+cFYS5nX+W9hDFR
         9Q3OkArdxcj55YnD5JiYMD23jkuVL66GW1qazxsMyWMmOLig/yu52046SJZ1r2xyHdRW
         aWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5JhVyRqtdJpuGBlvHxS0x0qfaPttBBsFZAiPeZDkRE=;
        b=B2X0GjHzYFXvoCLGaCDG3x8T8SHNkkhuTfqqAL6z/GzfMQvfF+sbBNC3SWo4z22XIp
         rruyFgdUp/zfv0jyx59AW7qUwKRA+wwOjbNyIdx4FjyN+JBiLQJWAmdeQRlD44ZV6bYD
         310+Rug09IAo4+cvQc6ZkBc+A1h75QJhJqwtrT35fn1l0R+9Yzehv/NJsJtrg0Bb7Nrf
         Btb6w07jTpp4tAX1GEaPizHx04M5agGkxEa4r4jUYjOU+3+WgPY8DW9GOwvAfXsGlmgU
         ULlBtX5sj7HiSFIj3AL9vdpkZU1QSRsp/mPdxAuVGh2Gqaqj/DlUHmy8RWwmktQAl3kn
         8lUQ==
X-Gm-Message-State: AOAM530vCcMBe0KTgvghxUp1dOLtm1p3Fp8Yp5YBUAl8x9iQzMXj27A6
	my4qIwAhr3rvhRvU9Qu/3Mo=
X-Google-Smtp-Source: ABdhPJzvp+0/k+8fJsE1oNkghP54+v3DnfTEMaNOWwPx7Ct3+qO6Agd5rJZIQr2pxzu+SOwtXi9dwQ==
X-Received: by 2002:a2e:1514:: with SMTP id s20mr16140249ljd.34.1630230998034;
        Sun, 29 Aug 2021 02:56:38 -0700 (PDT)
Received: from localhost.localdomain (37-33-245-172.bb.dnainternet.fi. [37.33.245.172])
        by smtp.gmail.com with ESMTPSA id d6sm1090521lfi.57.2021.08.29.02.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:56:37 -0700 (PDT)
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
Subject: [PATCH v3 2/9] fs/ntfs3: Remove unnecesarry remount flag handling
Date: Sun, 29 Aug 2021 12:56:07 +0300
Message-Id: <20210829095614.50021-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829095614.50021-1-kari.argillander@gmail.com>
References: <20210829095614.50021-1-kari.argillander@gmail.com>
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
index 267f123b0109..c590872070e1 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -407,8 +407,6 @@ static int ntfs_remount(struct super_block *sb, int *flags, char *data)
 
 	clear_mount_options(&old_opts);
 
-	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME) |
-		 SB_NODIRATIME | SB_NOATIME;
 	ntfs_info(sb, "re-mounted. Opts: %s", orig_data);
 	err = 0;
 	goto out;
-- 
2.25.1

