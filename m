Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAE2FAE
	for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 00:27:12 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s3so8292817ljp.11
        for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 17:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+mLjxLSEHZbWDASGXk6f6L4oOTwEXpRclV6xV2hv/zQ=;
        b=KVGz7UtKDDA5D4dyMAchK21PYLITGd23DuesglQwSDdZKDgRcMgpgyfgbeI0spunGt
         +Zw+sr5Yybpq2ql2yqW+T5rob10oybFDgSlKBeIv7dlPjnWciq8vEoF10XzaoWGHSOWi
         Xmh8bzXgIw50kFs2m3bO3coWuw1n6F6Mwe/S9nxYsFzCx4uRRim9bWP3E4Amle3o34Lm
         gouiVf4vsP7BD84jtebstAw7NikELniQGlDnungnPv8coXHznp4ysEwYkgIvpKGN4giM
         oq1yq8n2Tkb8abEmNy+Ok2DLmhmJVY/l1ZakOUHtMqEg0CYDzoR36+D8aaNVna5/yK1z
         JBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+mLjxLSEHZbWDASGXk6f6L4oOTwEXpRclV6xV2hv/zQ=;
        b=Yo7E3FlIrVtl5Tvfkq6iN9tv/uGZWP1dC4JNd6OXRrcXW7xAJIPztktXkzht+G04+t
         S/3hNzSUK4pNZhQGdl3opBnnm0tjCmkMqm88mD4ARrnqaf23DS2o316ZhbCIFwgTdIRV
         +ooFKoCa5+dP3wJOwWEQX1dNNfHSigFoF6pL1r1MndeQnASPS0VBO/FnHC+BmD3dQo4k
         hlxgZP1zb2fkmVFpo5RCmxfGLWFW9vckxHSvBg3CCSyCr9Pu2aYKoNQ+RsrKtH0cYydL
         hmRHT1tewHfa4t9wWgxXq806X6wDT085l26FgV46DUcn73kClrzf6Px46R60o3fCSnAc
         HR3A==
X-Gm-Message-State: AOAM532oZdSwIoX7J8LIoAG3WfT1I/PijudHRNzU3MU10K5D4fXyydhr
	KrUplTUqMzf1oRZ2ZrD8P0c=
X-Google-Smtp-Source: ABdhPJzEz78zC8JxSKikbHOB2+HRAblmqMoJ/I20iwWQFQ422ar8BBo1ck1ZNqEn7R4GLt4fVTErGw==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr9842869lji.389.1629332830685;
        Wed, 18 Aug 2021 17:27:10 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l14sm125907lji.106.2021.08.18.17.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 17:27:10 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v2 2/6] fs/ntfs3: Remove unnecesarry remount flag handling
Date: Thu, 19 Aug 2021 03:26:29 +0300
Message-Id: <20210819002633.689831-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819002633.689831-1-kari.argillander@gmail.com>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
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

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 081ac875a61a..702da1437cfd 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -406,8 +406,6 @@ static int ntfs_remount(struct super_block *sb, int *flags, char *data)
 
 	clear_mount_options(&old_opts);
 
-	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME) |
-		 SB_NODIRATIME | SB_NOATIME;
 	ntfs_info(sb, "re-mounted. Opts: %s", orig_data);
 	err = 0;
 	goto out;
-- 
2.25.1

