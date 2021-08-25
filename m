Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7672
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 18:25:06 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id y6so305391lje.2
        for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEFdUjBoguMCYu79H5CG+fjqzScpor0FXOKgS+zYbuE=;
        b=OtitS2JGGBRTnBeNYMNJdvP0DYo1pvWK6BXTFmgjvIF09Tw6H1BCEavHoocWWDYbjn
         BzRKK2n9F9dxjQOzP64y26EJ9EHMPeDhPW5+cAns/plrwVY66NcOtrNMhnGinW5Z/yMq
         iDjBfk5DFHgHy9BGDoHTZn1XTwtDSkr1NgyF2WBTXad/3zoWWaS0cL8uYW7FLM7LJonX
         mKrt1YD0c7q+7eA8/pB23oWxqSvRXnlzN3BSu7dBQOgHha9FMRXDge9sDFk6KwzrrOAh
         4NVokKzQSAoWYkp7UmYatLpmLmnIVYuBhRpmOEm25xaMwq9MegzhUd1i8zIklkWBKlXA
         ds9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEFdUjBoguMCYu79H5CG+fjqzScpor0FXOKgS+zYbuE=;
        b=Y+yCYijyBJamU6FBST69liFANIzN29+PmeRj17LjU5QqUK+4O5g3vq7yqHP8kBX1dD
         FQ1Jlab0hx8Q4E4fbZkmJUCBXjyBiKOO0l5fSITBAZDsmLtIwDWT4ZWL+XuBNEupJd1j
         goZdBX5k+wQChOscOlT8eTq39ymIZ7o9bmdeY/IDqmoOnKWa2UwJqWBLscnRwPp4Jt1y
         yOAnhcUDJptaZEuhPFamcvz+qCzwH/vn5NFkXtyZaEx0QjnnmGWpG3up6xR+btFOMaLb
         B84N6LvIUE1VA5B9RtzKPuGlAV+fOU5ER7DFWRHcMxKa6aBD27hhfiWR4eCT4EmZZ0dU
         SjoQ==
X-Gm-Message-State: AOAM532P8b8SRV5ieulwiyNrToebXJuon0XQFAlGzEtsjHbGbidd6j4o
	If3On4bwkm4pgI9fcTqGvO0=
X-Google-Smtp-Source: ABdhPJwD4UridqD1q/3Mp9EAb7nsbM+UrtHso3wRPcn1yCXUclqczh3cz4JTo+XaCC/U1jC33FV+GA==
X-Received: by 2002:a2e:9dca:: with SMTP id x10mr31595221ljj.140.1629915904300;
        Wed, 25 Aug 2021 11:25:04 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id v5sm86122ljg.117.2021.08.25.11.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 11:25:03 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] fs/ntfs3: Fix integer overflow in ni_fiemap with fiemap_prep()
Date: Wed, 25 Aug 2021 21:24:35 +0300
Message-Id: <20210825182435.1367530-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use fiemap_prep() to check valid flags. It also shrink request scope
(@len) to what the fs can actually handle.

This address following Smatch static checker warning:
	fs/ntfs3/frecord.c:1894 ni_fiemap()
	warn: potential integer overflow from user 'vbo + len'

Because fiemap_prep() shrinks @len this cannot happened anymore.

Reported-by Dan Carpenter <dan.carpenter@oracle.com>
Link: lore.kernel.org/ntfs3/20210825080440.GA17407@kili/

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 59344985c2e8..cb736701f2cc 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1210,8 +1210,9 @@ int ntfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	int err;
 	struct ntfs_inode *ni = ntfs_i(inode);
 
-	if (fieinfo->fi_flags & FIEMAP_FLAG_XATTR)
-		return -EOPNOTSUPP;
+	err = fiemap_prep(inode, fieinfo, start, &len, ~FIEMAP_FLAG_XATTR);
+	if (err)
+		return err;
 
 	ni_lock(ni);
 
-- 
2.30.2

