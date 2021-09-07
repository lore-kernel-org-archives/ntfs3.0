Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E972
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 08:34:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id q21so15258981ljj.6
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k1y8fx3XyyuMLOh73EHMZ9CZAfZ05dGHF3wHDWaTIu0=;
        b=XMFPIknVlp3KFEhnevBgXqF9hxFQQ13ql7cNvAHCnggyYN5E7vsGa8M+dsrPKn0WyL
         dQAQOnIH7yTrcHk/WPxzPmp2cgFVd+z5WrBw8BfkorqefGnN69xHf2IYA6Xz71ryD093
         HaGYFtCYXGmyzlnjptLNvk05utiq2rzM2Wd7Dm7MzgvI8xNNpCVZpZ48tWeeCOfVVc+e
         OW/itM+qgLTm+Eq8S9Ni5+DE5XJfA+SntFu5YLv50Qb26H0ubzpX8qQpNmNOaQPwrrPE
         vaQrhSS4U8hiqn/X9ttdGm/uW6BeoG8oC5bk2NJJfGdhtz5QIQAk8qLwu1kRrxSrURtO
         usmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1y8fx3XyyuMLOh73EHMZ9CZAfZ05dGHF3wHDWaTIu0=;
        b=i0IDVRxk29oy31GzzY+zMkpbnGMwidJVFwfG4kRt4/Ar4pIgg6ZG/8A3JXCtV70vdA
         rzCgl6kb2L5iVozHHomkts29fs+ZJTGxmhdLSs9e+v36q+OO8252tcSSCdPZvNJ3xepy
         SC/mJgIUhQELHDSPsj8saPFh9R74emw5wUNQvMX2K6XyQScu4HByv0AagAea27OqgjNq
         b8IFzSPgaEcqv7fr9crmGDMiaPeyd2OvG6GjToB4a3ufHmoia5X536oBjbR0DUfBZ1yX
         AkG0XgWZPacaufHyZvlpaCGEJBQbjyG0paLdoGcLsHJojCAjRrQlXvJ9xmKkQns8GBum
         OCeQ==
X-Gm-Message-State: AOAM530kbw23oEvXseTvPrSqND5yw8NjEPFhIL3+f3cIqHE7kSgc+MYh
	rxYcRjYtNpSLdk0ucjRvXYY=
X-Google-Smtp-Source: ABdhPJxaUQUluOpHE8UwCQyv++XP9XWaaHIX6F7YZ/VX3VuRwL9R4zr2h0zfBfAW9zWvYT4Y4K7CmQ==
X-Received: by 2002:a2e:bd09:: with SMTP id n9mr13681082ljq.76.1631003695346;
        Tue, 07 Sep 2021 01:34:55 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id q30sm944771lfb.155.2021.09.07.01.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:34:55 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v2 3/4] fs/ntfs3: Remove braces from single statment block
Date: Tue,  7 Sep 2021 11:34:40 +0300
Message-Id: <20210907083441.3212-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907083441.3212-1-kari.argillander@gmail.com>
References: <20210907083441.3212-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single statment block as they are not needed. Also
Linux kernel coding style guide recommend this and checkpatch warn about
this.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index d3c1c46cfb0a..549ad245269a 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2906,9 +2906,8 @@ bool ni_remove_name_undo(struct ntfs_inode *dir_ni, struct ntfs_inode *ni,
 		memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), de + 1, de_key_size);
 		mi_get_ref(&ni->mi, &de->ref);
 
-		if (indx_insert_entry(&dir_ni->dir, dir_ni, de, sbi, NULL, 1)) {
+		if (indx_insert_entry(&dir_ni->dir, dir_ni, de, sbi, NULL, 1))
 			return false;
-		}
 	}
 
 	return true;
-- 
2.25.1

