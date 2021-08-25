Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688572
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 18:25:29 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y34so830132lfa.8
        for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d34tpgIDKyjoD+L4mvGfC7Pr2FZGyCS0REfCnZnALE4=;
        b=NTCkk85hdTszQdVSWZsBa4U7PdPHVCrr2DIrlPps1N4JjOBRLqpcyq2U3OVukRhuLm
         y4TX+gXab+wpApfXgCq5RpKUJk7IaS3oj5c2glU4aIToCBwH//1INcQXOApePS6UTVEC
         WmdMlUg5LeF2wJX2qL2DhBNqZLcPOB7T613aUGCLlw8AXMeg5FvQNrchcjYglT0S8ZoS
         EOxZSvyE+jFJexinDkVZAG5oteyQBJ0DtcjZU57k5Xww7rE6jvHFNUjT9OrKDKjpQ5SD
         RIrGdQ0w4EhnNQzI7HdaVoqc6WZQV5D6Vf9D2MlTR6AN93fphs4ci8fKJjstT4b7fOsJ
         1pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d34tpgIDKyjoD+L4mvGfC7Pr2FZGyCS0REfCnZnALE4=;
        b=uVqDIej2NT36LjZ2fkUCO8SY6H7CIza2/x5uFJxqSZfz6dB0YiS7GDuud25MI9BW8h
         agmeEG6J2QGNoFMgbX34jQKjlOR0tk3RcNZH5zQ+hCrtrPLwSXDJQwqodxlA7/M3jBum
         o5bZkOSkuekzzL0kazopsUghefejGjdOpl+R01zKsw2feaq5UI4yaML4cO7yeQ9cLP20
         7Ofqk2iMXme4C8YAtBUxr3Q/f/gZGfv5Me+AIe0QTS7S35opnXbv3pM1brkBGnjnHR6k
         nc9df99TQ0tX7floiSo9aEGVlE2b0Cye8q002+WLEqAeZcCwjMNi4mzQZcB11p7ebxXe
         IhWw==
X-Gm-Message-State: AOAM532CNkRZrj70qlB4BubOrTCyd0JRyx2wX4HvPcHcMF06Tumf6h7g
	X+OcYboyK2sx5E3ihx+3ev0=
X-Google-Smtp-Source: ABdhPJzfDXlT0XpCjZC5y7PHJPLcPv3wN4+gJJ3W+UcSgUhmxDrfau0/ftDl1nstIBQVYqXpn1RWdA==
X-Received: by 2002:a05:6512:21b1:: with SMTP id c17mr34446215lft.34.1629915928045;
        Wed, 25 Aug 2021 11:25:28 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id t12sm73396lfg.151.2021.08.25.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 11:25:27 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] fs/ntfs3: Remove unnecessary condition checking from ntfs_file_read_iter
Date: Wed, 25 Aug 2021 21:25:22 +0300
Message-Id: <20210825182522.1367594-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This check will be also performed in generic_file_read_iter() so we do
not want to check this two times in a row.

This was founded with Smatch
	fs/ntfs3/file.c:803 ntfs_file_read_iter()
	warn: unused return: count = iov_iter_count()

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
I cc Dan also because I am happy that I finally managed to install
Smack and straight away I found something with it. Thank you for
this great tool.

Next step is to integrate Smack to CI system. But will probanly take
a moment.
---
 fs/ntfs3/file.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index cb736701f2cc..5d41b84067ee 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -799,8 +799,6 @@ int ntfs3_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 
 static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
-	ssize_t err;
-	size_t count = iov_iter_count(iter);
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file->f_mapping->host;
 	struct ntfs_inode *ni = ntfs_i(inode);
@@ -829,9 +827,7 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 		return -EOPNOTSUPP;
 	}
 
-	err = count ? generic_file_read_iter(iocb, iter) : 0;
-
-	return err;
+	return generic_file_read_iter(iocb, iter);
 }
 
 /* returns array of locked pages */
-- 
2.30.2

