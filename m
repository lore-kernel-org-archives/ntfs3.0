Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEADE34B19F
	for <ntfs3@lists.linux.dev>; Wed,  2 Sep 2026 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313178; cv=none; b=b10uwLbiM5P68FoUzWx3DekBlVDRoyRpoO/PF4fbaQw/lr2qmeM1tprARfCo+C5e7EZuO4vA+cVIIv5frdh2bCEq1MuZBY0+DSJtgrG/mNh+OZ0tv/vJ72qP3zasru2PfvHcPpdjCnowsDMqILKQIy8p2fumv5+h2RdzLw6jxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313178; c=relaxed/simple;
	bh=VwtIBFjThakAzRxuWkTJ5EPGqksgT3HHdwmVtU3ISoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=o+9ddUvaHu9p+1knfaxUedmJV8EPNm82d8Em8I8+tfZ2t4ZHBXICPP6up7bynHVyzb0VXHWFsljwBQK2SKV9YFOUz9SjVLeSrA3bD07HGKG5k5oyZQilBGtCRUpzBJogVwEzjAASKgaOGmpmrNe81Ze0UvsTbKWMvIqMRYCIe/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JOq9fFrH; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JOq9fFrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=WKK9oZ+lcOMtH/OgoqXlh/TDex1W4i/zWmitlnXof7g=;
	b=JOq9fFrHBL2XO7VNswRr7V8hsEq/Dez1cAoxrw/fc+zw/vZJjDrRW9heA4rwyX
	9ntBoxZn2FMl9Y/A3WlPbKzBl5d9DBm19qFG1e1YQ6jSOWevTOuiSj3BW2UNsRKm
	HY79Khp478f7QhJPNcy7x1QMP7uGDb4oGvFWwyTxstDqI=
Received: from ubuntu.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3_35CfpdqTp4PAA--.3751S2;
	Wed, 02 Sep 2026 09:39:17 +0800 (CST)
From: huhai <15815827059@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	huhai <huhai@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] fs/ntfs3: fix -Wmaybe-uninitialized warning in ntfs_ioctl_fitrim
Date: Wed,  2 Sep 2026 09:39:11 +0800
Message-Id: <20260902013911.30680-1-15815827059@163.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_35CfpdqTp4PAA--.3751S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw43Ww1rKryfZw1xtFWUJwb_yoW8KFW8pa
	sxuws7KrW8WrWjgryqya15Z340qw1UC3yIyryrWwnxZFySgr97KFn0gw15CFnFyrWDKa4x
	KF13W345Cw1DZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UE9aPUUUUU=
X-CM-SenderInfo: rprvmiivyslimvzbiqqrwthudrp/xtbC8AYxtmqXfkacxAAA3s

From: huhai <huhai@kylinos.cn>

With CONFIG_KASAN and CONFIG_WERROR enabled, GCC 13.2 reports:

  CC      fs/ntfs3/file.o
In file included from ./include/asm-generic/rwonce.h:26,
                 from ./arch/arm64/include/asm/rwonce.h:81,
                 from ./include/linux/compiler.h:369,
                 from ./include/linux/array_size.h:5,
                 from ./include/linux/kernel.h:16,
                 from ./include/linux/backing-dev.h:12,
                 from fs/ntfs3/file.c:10:
In function ‘instrument_copy_from_user_before’,
    inlined from ‘_inline_copy_from_user’ at ./include/linux/uaccess.h:184:2,
    inlined from ‘copy_from_user’ at ./include/linux/uaccess.h:222:9,
    inlined from ‘ntfs_ioctl_fitrim’ at fs/ntfs3/file.c:77:6,
    inlined from ‘ntfs_ioctl’ at fs/ntfs3/file.c:242:10:
./include/linux/kasan-checks.h:38:27: error: ‘range’ may be used uninitialized [-Werror=maybe-uninitialized]
   38 | #define kasan_check_write __kasan_check_write
./include/linux/instrumented.h:146:9: note: in expansion of macro ‘kasan_check_write’
  146 |         kasan_check_write(to, n);
      |         ^~~~~~~~~~~~~~~~~
./include/linux/kasan-checks.h: In function ‘ntfs_ioctl’:
./include/linux/kasan-checks.h:20:6: note: by argument 1 of type ‘const volatile void *’ to ‘__kasan_check_write’ declared here
   20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
      |      ^~~~~~~~~~~~~~~~~~~
fs/ntfs3/file.c:65:29: note: ‘range’ declared here
   65 |         struct fstrim_range range;
      |                             ^~~~~

copy_from_user() initializes the entire structure on success, but GCC fails
to recognize this after the KASAN checks are inlined. Zero-initialize range
to avoid the false positive.

Assisted-by: Codex:gpt-5.6-sol
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: huhai <huhai@kylinos.cn>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2abf334bfa0c..df46d153fed0 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -62,7 +62,7 @@ static bool ntfs_should_use_dio(struct kiocb *iocb, struct iov_iter *iter)
 static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 {
 	struct fstrim_range __user *user_range;
-	struct fstrim_range range;
+	struct fstrim_range range = {};
 	struct block_device *dev;
 	int err;
 
-- 
2.40.1

