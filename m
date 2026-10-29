Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793251343;
	b=gchXNtKHVSyRwoimrtbD1+sfLG/AVPvPz1op/7VhAjALpkEchVobAOhczoA6YDCkJ19i
	 7cEsop/y8GUnSZo3BmxdWhNucH4ge+3yezLLW2AOc2kpkt1NzC805SMEPtELbgRifYq1B
	 4gYtOMFIazP6labeinBW/u7F6+i96eiJ4qttLnIp1UZDdhnmyvuG/jCipONcs5/k+TxyF
	 s47LZTR2r+U6UxMeU1E2R6O4FQfQO6IcXJmYQW6StCnM+/LgnZ53TS7jJaj7btDnxgv/K
	 FOzmUnExS4nw0rsc4p2BAx6ekLheXPuSfq0KB8sXAKOkKtaPhxSKcSroTxJg+6TL+sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DtBdbryVCQZJwqxQX+yRKPENpGCAPSn/JZly+yP2sLk=;
	b=jT3avVL9MzoQ6S3OpFGm3p1RZYo4+aoqYkLElUDNTYyhqWLzOFi8N5NJNjY2Y/a4ywK+
	 OVjvjgH8pG+9jeB9MtNn57LidEU64sUsjfl+uv42xs31va6erPJgmlsqPhmfOofCx21l6
	 WatA3NMoJHbd9HzCzjyIu98yorM8Igvze8PZZjmUyNqVYmh7JKB04ztXcN+eQOSuo5JDK
	 oXPj88hKXciXsThREEI3Gsesvyb+eM1h6/SqnPI/cCpVWyTakSIljamqEpXB8yK0h6zS9
	 jZMCDoEhk7OPsGGauvyoJXyarD2nb321L0fG5yj56Ef8fsKrgD7/HdwrfMLEY6tzJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfHoCUjE;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED686606A31C
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 05:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED686606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jfHoCUjE
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so1790741e0c.3
        for <ntfs3@lists.linux.dev>; Wed, 28 Oct 2026 22:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793251342; x=1793856142; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DtBdbryVCQZJwqxQX+yRKPENpGCAPSn/JZly+yP2sLk=;
        b=jfHoCUjE9LXn/cYobLpTqy0VdYu26wGJS0gkJ6gSqRhdfRSnNAMXHAHDjfAO7/8g1L
         +ax4jFU0+wDRNBK+WcfjHMStpUyrX1o97NljJc9S8IvPkfJV/9qhY8blUMgZjRXzSeXE
         WpxS4LPu88k/Cr/nuKAJ9Sm6l/MJqARbIMuDhA5I7wHYWOBPhPEEPxVh98arJOVv78vX
         4FL1XuVc8IwcNPF417B3QPudwQ4GslJpXnFfmJcSB4LAtGhHG/n9uCVm4MG5AaiT7f1f
         7MfJamCvG1qigEHdkyo8T2Eb7+kvGKy7AbxAqftO556BE6mgnmZiauOD7SRuwAvrnHEj
         m3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793251342; x=1793856142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtBdbryVCQZJwqxQX+yRKPENpGCAPSn/JZly+yP2sLk=;
        b=jbJCe39BwO/F8/f8/L/isVXPHyP6Ms3tp3DL7cuoOCHFwTpMit29HpbUxAJXVYAP9e
         qv+ymYbPhpacAj88/yoRQIU9VZb8LuPziklmYS2/ZiaXE+9xsb6EJMu6yTz4qDHnbQs3
         27YkNi2+nHfUcNm9GN3RCQEnYlFzIDFV++nDm+lYlDmKlI0s3IsnJ53o3YJxrBO/e2Fx
         XsTB8igUI9crXZOv7ZzNXKCNDw9j8lZJ/jyRliriG30rumqwLSFpwfqFbiPhdnVcJ624
         SR2aGcdz91gfiKXBWuVHTwOOU6DtUrdlNkcFPIjNOgYTKRNpI4sHzj2wiOc4HhBkPtGW
         8k7w==
X-Gm-Message-State: AFq9FYJzPeUypdJeGW7e7aKYytjCDQDyp0mKE3BhdFK30nbKcbRc6Vd/
	xRBW0+S2zn0jx3X7cZx9RcI9yc970SKZ46dYiRw7c0J8CfD7t6BlL5rN
X-Gm-Gg: AYBFou18HvlxtegBqpDlWohJo6js4FhHu6RTNRYLj6kvK/jaRT6hoP95xUNuOQRLKq6
	Y/2QSrbq9vm3y5x39PlYElBkS0kEsj1d268IFWgfM8HRu2wjDwjdiS+HP26firjgPQYomYzNkZ1
	wIa3PSN9qmfyVyhKmhqflwz6Sacl76ciPBvuFnWJNgBjP7ugLzXlH8OhhfP8IlFPGAE28TQWdWc
	XdId6jLCXZujlDI6QWacu9kbN3zc30wopMLGkRRJur7iO9gTgEvi65eygKt3jR0l/SdIEMjv1zU
	mBmGOfT1RcD3LiU6DAUhN5BHjsjuX9/zTfKcgAILQqRbqoJgRiM3yCfBwbUoGDhHhdx1oY9c1x1
	eWlBf4DoyalwklmhryUzVVkKoljZ3EPJVhWK9DsiRLp02GaYo4hxmNfdUG58JqEAU3MHFVKs2HZ
	Z10z8CuAZGZizH4fu9Sko8l1SRbq6vfpsWvu1pDVPL79TksnCazpktsCD2NqCJMS7cLCiSa0nky
	1vXu2VzR1f/4U1yTzWMfrxtlDn8f88xvVYLkCNs0bQGH59c/RVegjHjeBd1Rw05H6iUTNZIgMdX
	FjXybcmzF0VNxK+s3S7YWwdAFyo502XNKjDktAEYcUrWAv8Bh1TSFIbdaiMM
X-Received: by 2002:a05:6122:1b0a:b0:5ea:9ec6:72b1 with SMTP id 71dfb90a1353d-5ec4ccbce65mr2347697e0c.23.1793251341793;
        Wed, 28 Oct 2026 22:22:21 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:8b5e:397a:cdcb:e1d9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f5cebbbsm4360066e0c.0.2026.10.28.22.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:22:20 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yun.zhou@windriver.com,
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH v2] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
Date: Thu, 29 Oct 2026 02:21:02 -0300
Message-ID: <20261029052102.1585462-1-christian.aurichzm@gmail.com>
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

ntfs_readdir() drops ni_lock before each ntfs_read_hdr() call and jumps
to out if the call returns non-zero. As posted, the patch that became
commit 7a5aa6c45072 ("ntfs3: release ni_lock before dir_emit in
ntfs_readdir to fix deadlocks") used out as the label after ni_unlock().
It was applied on top of commit fb058ccff579 ("fs/ntfs3: take ni_lock()
once in ntfs_readdir()"), which renamed out_unlock to out, so these
jumps now unlock a lock that is no longer held.

This also happens when getdents64() fills the supplied buffer,
triggering a lockdep "bad unlock balance" warning.

Jump to out_free instead to avoid unlocking an already released lock.

Reported-by: syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5c0ed4f2974a8b100ed4
Fixes: 7a5aa6c45072 ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Changes in v2:
    - Explain that the bug comes from 7a5aa6c45072 being applied on top
      of fb058ccff579 (Yun Zhou). No code change.
    - Rebase on ntfs3 master (da4391c496fe is now 7a5aa6c45072).
    - v1: https://lore.kernel.org/all/20261023223533.686085-1-christian.aurichzm@gmail.com/
    
    Based on Paragon's ntfs3 master (ee1cb3443cff), also in next-20261028.
    
    Tested in QEMU with lockdep. A 128-byte getdents64() buffer
    reproduced the warning before the fix. After the fix, no warning
    occurred when reading root-only and 700-entry directories,
    including four concurrent readers and a writer.

 fs/ntfs3/dir.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b54828735d55..45d6a41a7222 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -563,7 +563,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 		 */
 		err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;
 
 		ni_lock(ni);
 		bit = 0;
@@ -607,7 +607,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 				    ((u64)bit << index_bits) + sbi->record_size,
 				    pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;
 
 		ni_lock(ni);
 	}
@@ -615,6 +615,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 out:
 	ni_unlock(ni);
 
+out_free:
 	kfree(name);
 	put_indx_node(node);
 

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.43.0

