Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795035;
	b=i+u7AaqR30Q5qL/DxEjqM+6GvHSgagcg3xbi2Ko6nGkJnzXkfGDWYy7J4ulurdAY8kx9
	 vRl/GeO++SUrCtKfklyQPIMffQ3unpKUmDP35ybsq1/dmS1nmY4WXc8TBQ3Temm0xfH1H
	 Sni07EY4Jt9ile3MKS5MrJndgdCaFfu4TJcKREJJjRCZWOJtDR3GVOHaR71Yqx1BTA/80
	 4qYUAhJ8l9I5cET9vBBAJiwf5OjNc+WXmwjbnYGVkCalimVwuFIESsU2kTdQ0fqy8MVZI
	 7BWDyfZr/LB3vo9pstexA7qYz+CejH1LNlW2xM782dZ6C17R2sAJLdkeRntdjyoGLYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cJoRqfaV2dmK7samaJuoXpWgrgrZZWBwrjmheHlVWq4=;
	b=yrWOvmVgVUCfFZ/X5UMXPBnN/cc7fhxHwJq4tgEu1dQmyKIz0bYR80xij8x4DqiH9jtl
	 i6F1mkb8jxbNCi7J4OzLgGn7EtvGTEdDppHtazOOB2JQv+wX1kj/3C59dQUld/SAldBaT
	 zDcJyPJ++SYFY7CwQNbshfiX4E9AL6AP6ict0Y1qwo4Kssvfvkr1oJc46pxJeMhVmIECf
	 mafW7oLJiIaNKXjx322SRINUJveO0kXyq5bqGpywuZk8FWk/WYEriE0lx2OpQoH40jVtf
	 +tO13nUqhQJsmbJutAcX67IQwcRD4AIICH7fKKknT4a+kqcr5CbmFmYHgIILWxoUa2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PxtiX1Uv;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA7606A324
	for <ntfs3@lists.linux.dev>; Fri, 23 Oct 2026 22:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DA7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PxtiX1Uv
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso784209241.1
        for <ntfs3@lists.linux.dev>; Fri, 23 Oct 2026 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792795034; x=1793399834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJoRqfaV2dmK7samaJuoXpWgrgrZZWBwrjmheHlVWq4=;
        b=PxtiX1UvhPqClOyVewu7MvO3RQ1/3vAdJ6ChfwlX4w8fvR8DZ7JJgoxYxXrnTtCDPJ
         mLNXc8VwMFEGKxz13TLsod3JSUyxTJ5eDZAWgzHBeDmNIMlv/CxEommB7CgdAgwFh6qD
         UD/JeyTHGFHFQ9N0RNLGHP77/po6RBPbCuVqNh6G04eEr/N0y8wWOmCcmgploGl5Bc/7
         PkqBC16FU7lHw/qdM1qu9uW+t1PMSY/YXweAaFKaYSind/0rEFuE8YvMYBqmpLlFC4hW
         8hiOw1aHzLxERxCvDItOtalC9JmAgovr2HbTR+bea9xf3/QyQlkv2hvf66naQeqj1Ns0
         GdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795034; x=1793399834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJoRqfaV2dmK7samaJuoXpWgrgrZZWBwrjmheHlVWq4=;
        b=RK1S6vh02orJvD+OPkvZYUmBaIHrF1Klv0ZfDqHtU6MWsmkLvZhJdb9L+cfvnIER/7
         sveVPV7InkNf5Emd84nydSR6omMQhfRDSEAjH6g4KyQY1Sa11uDFU7vFQsdA5RvYDGXw
         3qnxcCKPHkayR3QlDdYQemwVV9WWLLuFQ/DNWp4Cs+bLIYbXKOjJkTJJN0VazbeLJScB
         t3zp/MIa3zsdgtyAGDa1rNoEHWDQ7Sz4Cxw7wulTKDpsp/4Tfivg7v7l+WobDn+b9Tax
         nZ2RbqyTJtCeXJ2mjjKhFCn6/6AZA/UygyFOsdnJRQM6t4iuutzDkbljpHR+G05wUrhy
         ItYQ==
X-Gm-Message-State: AFq9FYKB5qlMG9h1YjigPuAyvjK5dyxUdp6jEdvd63jcfTgtAsLFhEnR
	po0zC7C5kkr0Eh0qfb7iEvb8q6fXAOf/v1Pw0yVn4VoV03vUs+DZ3x0J
X-Gm-Gg: AYBFou2VVwuvF069krNnFdhwe47zTUbLnPyIsfTPikZMhGzo8p0qr2rrWAgbX3sHTgj
	8pmv0UkchCFw71I7H1UoS/Qg1hYC4+KDysJ5mG5e8dtBwLRPlofb1RW0G7FyoAEUq9C9zhO5CXR
	GIW6lZtWg2ZYxjScP88XBjcFaaN6WGEn20LBkiHuIYdZVw8Fou8duUshwhpd+A+UeCWvTTcF8Nv
	WUSs+rH2T7OUqZlbsAUNGExDYO2UlZZKtvHVZUMRAM4HFO/3dA+5Tefltm7+jKqWi/2x/dsuJh0
	/hN4tY26XJ7XxQZStS7zle3q91B7ayAp2XIyJqdlGtTkZhKF5a7ofiaaA13qZdmNqweIfy8uf9A
	F5LkNhKTt3oOYUYquRFVhvud+fkaUQkY5+X5ThnTuqOf2PGKZUrYM6uKbX5MJqOzdE8TIaYo8fP
	YCSXYpYc45aLwnEL0vW33SAtRvekya2lKZE+IBFq1hbZ1gsq/bml5MlSqhB/d5eLsPltvIn9e0q
	+fvkpFLoq8h1RzMu9QswpO+qXjMYPcYDre/1emKlMAMJlKPehP2laEUdF6ZNjOjUBb77WB6Tsmq
	KTYzPgg=
X-Received: by 2002:a05:6102:604e:b0:7cc:cb56:bf83 with SMTP id ada2fe7eead31-7ce5cc30470mr211202137.12.1792795033895;
        Fri, 23 Oct 2026 15:37:13 -0700 (PDT)
Received: from bridge.. (deps54-26.deps.ufsc.br. [150.162.54.26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm817532241.5.2026.10.23.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:37:12 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yun.zhou@windriver.com,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
Date: Fri, 23 Oct 2026 19:35:33 -0300
Message-ID: <20261023223533.686085-1-christian.aurichzm@gmail.com>
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

Commit da4391c496fe ("ntfs3: release ni_lock before dir_emit in
ntfs_readdir to fix deadlocks") drops ni_lock before calling
ntfs_read_hdr() in ntfs_readdir(). If either call returns non-zero,
execution jumps to out, which calls ni_unlock() even though the lock
is no longer held.

This also happens when getdents64() fills the supplied buffer,
triggering a lockdep "bad unlock balance" warning.

Jump to out_free instead to avoid unlocking an already released lock.

Reported-by: syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5c0ed4f2974a8b100ed4
Fixes: da4391c496fe ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Based on Paragon's ntfs3 master (da4391c496fe), also in linux-next.

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

base-commit: da4391c496fedc1ca78a99907712f2256ce8fb80
