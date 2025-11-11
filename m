Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DE348883
	for <ntfs3@lists.linux.dev>; Tue, 11 Nov 2025 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859659; cv=none; b=bn9W4ZcGvVOj3/VridRwxw8VLOBV3Ssi1dwixn+Il8dYiK3ahe1eRCyQIjiAAPQONej+3YPjzkJWFi46zJMW2KKX/Z5V1PGKfRlc9Aav3/xaphzovojIudGJEdVaVWPqdDTmCy1KzTgRHzR0CzV9whIKap95EYmQ5URfyS659O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859659; c=relaxed/simple;
	bh=qUPdyWreFV1lPbWkZi9HrJb9CBDP9RMP7SqB5J9u/7A=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BzXtqhbtXgVjwcH+GP1POj1cqpgEiBuwHCbl8SnMt3TfWhGOaMHpcflyqWTmlu5j5ePTJSQspmQQE+3k7Dzj7+Fznzzpy4zLzzFv2zih77HOzCftgXeAK4JXaI41/rHPw+mKLJv37/LqHImAB8gKEcmu7gxOGggMjrDeG/MfnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Z07rrWbZ; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Z07rrWbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1762859648; bh=taXUVma0NRozkDssCapELyL8AA0H9E6fe9k8SGAz+xg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z07rrWbZ1CHXUUnU1K/lgc2I7nhG3CO38GiTTLJLGpOcwRnIRzXAb5YnD6aBs99so
	 JDyNre+HSQjH00GoOPxpjsoLz3s5sSmAXF39MdM+Nb2m9KMT2cFVHBBgtpwT+ZVRb0
	 vylWk40cZi0f4zvCVApjDUWbT9S2JY7hvO56k5ro=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.201.7.117])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 377862D6; Tue, 11 Nov 2025 19:13:55 +0800
X-QQ-mid: xmsmtpt1762859635tobyr8oqy
Message-ID: <tencent_046B83AAE44C976C976926C9936903604905@qq.com>
X-QQ-XMAILINFO: NZSml8PQdeKATZu7Oi29OrL6p4nZCwdAumMuUoAO7ogqU4gDANGJwIkk9PT+nH
	 34QYt+uV4WPwAUjbKcaEBNQmZMmajqhzGDLDRCZz9fJ6xHuLgRheVuhFNco2AniZGs4N/vGBqh6y
	 h+/tM9CED4wVNFr5B+q45ObLgSK3nEjrLPvt9myXYfbHzBKZeFLVohXeTVNqyGCT410pnpx55rWm
	 JDvgDyHbR/BBmdlCk0lYaHehqg8NRAgujIBP9khYm39NbaXfWzsTokdjGoTNjxsCmXFkmXv7JIrq
	 cfSui55ICmUHbfKaUkjsF3JhbZdgZkjI2pgQmwCytRvXW2RhqlK9CMWwj2S0EtUX27mzN1wmZC64
	 tazlskO+j9CGhwwVTzx4iuQPN183+tDyHNa78PqGAgM/PGNQBhtdYl6KMWAEFsHkZbTjE0GPU9nY
	 g1GZ3+2sfeKFRyLoYN4jXwQeZHuLY4FD1+iOpAy/ZqMxbUn8Pfr/WDm783bG6ooY1vjPd8PlBmo1
	 tO+L7560hPZ/E9NANQXkvyImSNGKDBqYy3d2+N+x4ooV3FMVSp8jdNG/t93/AVrWzKgqZe4X9lzY
	 9xzp/TX51Bbo+YWNGqsHQa1mmnnECya8mVE5okUVN0J6Ol0ge8qdaF8yIi96gSRSBcrHTn+w6EGG
	 0FbhQtWXIFIPRdap2YkwdohFrAm+Z075jFEjc5wjk0sWiMNZduagNWmrlxvWfQispPVYRCPJiVwQ
	 YL0vxtDIe4kIJJIagkpNgHkD1a4XUFJ3rspfl3XeDoQcK17FX3F5hkIq6KwAWVHSg3F9sIPjeYuZ
	 GO0IVaMK54CyRZ8knyiPnLmX+avd6mUEq7gjwbn6aWK/dJuJn727u2E5DIkxjk4CDOEisjikKCtB
	 pWG7OsYOnIipfOr4GZwqXpVKG5p+uLHVUCKrMFC2YY71831MyWBGYyUhwDKZuwI8/DJMIARPaRl7
	 XxzHYNbG02N3A1AZfqtKCY0DbpjTS1GrPVDgn3e+4z/yTzD4jNsNd41/oNJOrlpr/lF/Lv5jyfeq
	 Odq9/dsA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3932ccb896e06f7414c9@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH 2/2] fs/ntfs3: out1 also needs to put mi
Date: Tue, 11 Nov 2025 19:13:56 +0800
X-OQ-MSGID: <20251111111355.2274848-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <69122a96.a70a0220.22f260.00fe.GAE@google.com>
References: <69122a96.a70a0220.22f260.00fe.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After ntfs_look_free_mft() executes successfully, all subsequent code
that fails to execute must put mi.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index b6cbc1fc3455..e5a005d216f3 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1017,9 +1017,9 @@ static int ni_ins_attr_ext(struct ntfs_inode *ni, struct ATTR_LIST_ENTRY *le,
 
 out2:
 	ni_remove_mi(ni, mi);
-	mi_put(mi);
 
 out1:
+	mi_put(mi);
 	ntfs_mark_rec_free(sbi, rno, is_mft);
 
 out:
-- 
2.43.0

