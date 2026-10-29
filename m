Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311355;
	b=Xz8jCJyGNjJkYyMret1oHdG1jncUWqH5Lfado90AaNofo1UB/CVaUJ3WnS8c0koclzX2
	 7Csro23t1zRFDdVhR6Yegz81pXxS/Z3dI1ZZbuJcrR+7tAgeREUvuxq2wxTaRTDhHaSiu
	 Oi5OdQQ1IlgSXVxbGCtzinEZYYK8Pz+V+LDhg3sag3tHbCFddok9b1sW6TjVksO4FiFJG
	 LHHkxI9CZxe9UNaM65kgTNBGd2q0P83o/uaqn/fBd1NoAAPMxcxQNzp5YJkIn0JvUlSPJ
	 7G8gYOh1RNZY29p7Ikim7u/6OJozdNTti0bvai5VKaqrvVKcZxe1KZhi9tWMmeVY8zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Tqi07G2NK5B5Re2GQGo+ZSlYw+c4Yb95iVdRzLGMPO4=;
	b=c8F/bc2MibNqgPKBlHqg+qJb66QhGdrdlEMxxyOmYAvlO9mUFdp309MB7eXQlHdbhmqV
	 GJk/OmaN1HUAC01V+gKcxz+NQB9an7uPhyGeDD1wfyPNByDR4VPvTDDJMZgBdAV1kanWA
	 vqc6e0ytaUw9YCL0hCFxCsNr14fjSLii5jQZuyvsN2GM8HEy39ZXmemv5YpXns1AKH7Yx
	 ThODFkmWRBx8QpSMXupRHYqFyDLm4oOkZXtEomktCCz0XBo37xdttsZymd7E8p6Ckn8cE
	 m3Rhjz6IITTzDS4mTY023CWbHnyHFF5Qzm3Vg/LGatycAvmWuELvAUIRzWuBfp0Czxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnlt10OC;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0199606A31F
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 22:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0199606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnlt10OC
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so9880c88.0
        for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311354; x=1793916154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tqi07G2NK5B5Re2GQGo+ZSlYw+c4Yb95iVdRzLGMPO4=;
        b=fnlt10OC1Gx2zmTXvJc9CUCz/Yni7oY/LF1AEkP3lHXXi2cblp1J8Gt4HkguKcLc1G
         jsNC22MMWJSnStUMHa4rBPpliyaQLoEYIOe8Vd43kDDDug7kfE6+HNQ0hD6bKrHiRK71
         0tp2k9xkXUX3WhNvBlmq9/8YLRx//ZwHE7B9wPnZayPxlQddZ/omiZ4Yu8oHJ293x3Pc
         Us2Q3PVuLaQ9XKNRnqTUpyo9eN3JJMi8+qu7PiHMAOyhSO3wBfCePYO7mTrj/47QNjtg
         JFt1ljc5hqhFz3+nZN7g7OIwpw30B6YltlVq4BrUGX4bDvKRjnY1M5gmXQ9ipac4FM6q
         OkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311354; x=1793916154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tqi07G2NK5B5Re2GQGo+ZSlYw+c4Yb95iVdRzLGMPO4=;
        b=kzDdq5FybZLiekgEeSYpt8UXVHttAZ7r+P3N/6aeNgBHfxCVca6TpSuXp013kPwFz7
         dpHxba1fgOXL+IAnbS+1rCRFxcdXwam2xMM3cg7TDJ8jS927RP9hkDznSW6vzkyYuuhA
         oEs8o5323oC3wOzUJ+8wuc74p5AfZ/o1/aipl1j0KssIt/+C7fNKB6b7TLeWah6/mQbu
         dAJMr+O3hs5vsGkFhCDOZoyS5x0yJ/CKXZfnTJeTBp+rpXBvGJDtLTdY12RIsMCcONva
         1ONr1G7I9LzWJ7XLQUr30ii2QAQNOE38q6S3rDtu7U4V+xPIeTNF9LjhvZB+WuAeGZ0I
         BtYw==
X-Gm-Message-State: AFq9FYJjcHdXg74jdiPososmklILB28MLrnNyuAt2mFaIJNIoqx4Uzk9
	Jtv/lqdhXZOk4EwU2lsSryFadU0i2WcG5yfn77DzjnFH0yTYI9OJqTDU
X-Gm-Gg: AYBFou1hoTRC2IZ0SYZ7OkM1zIO3INJsF1w5rgfosLvzChXyXVIIYBg3UPG0GvRFw4N
	BKS2zij8Vifda5xRV4+h6ln2yd1SurfLbUk0QWmzw/zqa8LWMV8lP6vkwjREb8etoaWJzVyihD2
	SBNNZs/EC7mlax6hUfqmXwNnw7CdunZ3R8Hv197kNhp60EduulbG1Mc8/TB8zyhrLlUJYaPThvZ
	YOK/tp9nWEcMbnh1T18EPi0LV0Meg7gkchZpjqYi+8HXSdGnav6h7P70EOqohuG4wxgLpTGoz2f
	yhcqtQNSqYWuo79eQefJASG2h18YEv0yiAK2v+n5cGBjXpwzV+oQBNBxLXDft1/bejNDz6Gd+vX
	jIemWJIgz5HdwFajKkM8cw4XF14VZQXtbAVWFO0lOyct8vgdLec6XfbAWY1fSYAmSEQG+yr5NWc
	aUabcFfNaYcfeo7K/keyxhetYL6HEKycqC9KY8dC13BMXGVWOwGXAxF6HtI+257Ly4xJY9E04vQ
	tiUTCToc98TwCI/XMgyshdUz1G0ZvQtlnXaacWi10J/qg70/53hnn+Jd6e3CMD6jNnpqYEBuu4A
	s++xB9ST6yCJmsiaWhWLIlR/YSL1FDHWf8QcJQjXq7rW4aF5nt5KHRTl
X-Received: by 2002:a05:701b:4354:b0:1a2:6b9f:f7e1 with SMTP id a92af1059eb24-1ac5cb1a31bmr472033c88.14.1793311353726;
        Thu, 29 Oct 2026 15:02:33 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm1316007c88.20.2026.10.29.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:02:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: accept unchanged read-only fileattr flags
Date: Thu, 29 Oct 2026 22:02:03 +0000
Message-ID: <20261029220203.80532-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_fileattr_get() reports casefold, compression and encryption flags,
while ntfs_fileattr_set() only accepts immutable, append and nodump.
chattr preserves the reported flags when adding or removing nodump, so
chattr +d and -d fail with EOPNOTSUPP on nocase mounts and compressed
files even though neither command requests a change to those properties.

Read the current attributes and allow reported flags to be passed back.
Continue rejecting unsupported bits that are not already present, and
keep applying only the existing mutable flags. Requests that omit
read-only flags, such as chattr =d, retain their existing behavior.

Fixes: 33f29fc7c67e ("fs/ntfs3: add fileattr support")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/file.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 52e1cd969e06..af6fb438eaa8 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -134,17 +134,21 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 {
 	struct inode *inode = d_inode(dentry);
 	struct ntfs_inode *ni = ntfs_i(inode);
+	struct file_kattr old_fa = {};
 	u32 flags = fa->flags;
 	unsigned int new_fl = 0;
+	int err;
 
-	/* Avoid any operation if inode is bad. */
-	if (unlikely(is_bad_ni(ni)))
-		return -EINVAL;
+	err = ntfs_fileattr_get(dentry, &old_fa);
+	if (err)
+		return err;
 
 	if (fileattr_has_fsx(fa))
 		return -EOPNOTSUPP;
 
-	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
+	/* Accept unchanged read-only flags. */
+	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL |
+		      old_fa.flags))
 		return -EOPNOTSUPP;
 
 	if (flags & FS_IMMUTABLE_FL)
