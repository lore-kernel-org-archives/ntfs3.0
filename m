Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5880C
	for <ntfs3@lists.linux.dev>; Wed,  4 Jan 2023 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672835957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HT6SGP2i78kW2gUupMImNqxz+qH6nvN5AI03QdfPR8A=;
	b=QJi5iRiPWD1zcguqeyaimFUm/aPe/s4oMF5/BOQcqYqB+OIqaIElor6bh+u7fIIsP6w/S/
	VZx7oEi1JYU4o6CGgnwxDEAw3b6L4rlVwiaxLqdTdC/mUgCi5dL2K3uvtDwi0+0Vz8DRUq
	SRQOXNGpGkX9E7nKHqXwT6HSPu6zL+0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-WJr4M-IpPxOTHdSzCHGG_A-1; Wed, 04 Jan 2023 07:39:15 -0500
X-MC-Unique: WJr4M-IpPxOTHdSzCHGG_A-1
Received: by mail-pf1-f199.google.com with SMTP id y19-20020a056a00191300b0058217bbc6ceso5221095pfi.4
        for <ntfs3@lists.linux.dev>; Wed, 04 Jan 2023 04:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT6SGP2i78kW2gUupMImNqxz+qH6nvN5AI03QdfPR8A=;
        b=YkSunwazPi1p9ocrgB7ZopnVROqAzfAQHbCY9n/ixDk03ZreRXNvgtqTKuyUk2orMq
         EMmlQkHCrcDhl+C/1bugDrXyg6wQj7hzV4EVROQfqjvBoyX0NJ/RxB6RE5jfVYj514O/
         Y64W01Mm0OGjSn0R6nh1gaZMdSEq7Q0hK8iyZ/eRLfEZU+4mll2wphaZtY7hVpN77kqV
         3l1n7+AxAPVy6Lq8AQBDPBG6OZA4n4ikI9QUViVpU9Rwd+5IXEB13IP/4B9FMNDDkSj2
         pRofQeVR3gxHUDI3ygqj26y67F2KTTWOijgzxBZvoOrHSKOPMUBJDfhX9uGj+8RisZAK
         Lw9w==
X-Gm-Message-State: AFqh2koC4JU9LEWL8Sa03dj5oVqt9rxxjDWchDYJHw9/rbZOxK9eedca
	qBzdKP5VnQjeTi69OC+4n8pEepFkU6x1Pg8+sMifeiChN7W2fLwr7309J3FgrPFZvCNl0h70ji2
	vdL5CI0GsC5UGaC0=
X-Received: by 2002:a62:1b85:0:b0:576:450d:6e68 with SMTP id b127-20020a621b85000000b00576450d6e68mr44274766pfb.27.1672835954977;
        Wed, 04 Jan 2023 04:39:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuS+56hyDv4XiZSPomeGZ+6oZdoxwahD5jgKiXMmSvgP6DBwRwRh4MgdTAmN+0r/VSrpMEl4A==
X-Received: by 2002:a62:1b85:0:b0:576:450d:6e68 with SMTP id b127-20020a621b85000000b00576450d6e68mr44274751pfb.27.1672835954684;
        Wed, 04 Jan 2023 04:39:14 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:c0d:9f00:ca6:1aff:fead:cef4])
        by smtp.gmail.com with ESMTPSA id y188-20020a6264c5000000b00580e3917af7sm19352828pfb.117.2023.01.04.04.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 04:39:14 -0800 (PST)
From: Shigeru Yoshida <syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>
Subject: [PATCH] fs/ntfs3: Fix error handling in ntfs_new_inode()
Date: Wed,  4 Jan 2023 21:39:02 +0900
Message-Id: <20230104123902.978084-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.39.0
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

When memory allocation for mi->mrec fails, ntfs_new_inode() calls
iput().  iput() calls ni_write_inode() indirectly, it references
uninitialized mi->mrec, and this causes the kernel crash.  This patch
fixes the issue by making the inode bad before calling iput().

Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/ntfs3/fsntfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 567563771bf8..7b93f2aeb6f6 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1683,6 +1683,7 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno, bool dir)
 
 out:
 	if (err) {
+		_ntfs_bad_inode(inode);
 		iput(inode);
 		ni = ERR_PTR(err);
 	}
-- 
2.39.0

