Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [178.154.239.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49E3FFF80
	for <ntfs3@lists.linux.dev>; Tue,  9 Jun 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008790; cv=none; b=VgI3KJrdCXU+nLP/Q7QEfA62tHeNjlxfBg49Tu7W/F3DB6SbZO4Z5CVlWo1kyvqKiJ5gDja/lpD2lWV9mcCP0PtGX1HQap9H+JWa25KTYDRtUTRpHkfCxdHbgfh5flyzmM00zsXiUgfVoaB5sPa6BjNA/nDW2QP1aXKlaX/Watk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008790; c=relaxed/simple;
	bh=BLSsBptSpjjSNayMxsbaiKpo9MlgZu2gvXX/u6Kgkqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXmw/JMonKgrO8nzU1i0baydyoqNL3PXLLeKniPAJYa1BY3TYvk3MpI7db7MXWei0yWswpR6rScgAQIL574shIJ1Tzez4RKd81LuZS8HeQLOSDL59uOUDFzKyr/uK1bCQWa6h17YzOYYvSsS86QMVyyjp3Bb7WhzxUd3obT7Txs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=IXIelmgb; arc=none smtp.client-ip=178.154.239.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="IXIelmgb"
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:f85:0:640:673a:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 15312C00F9;
	Tue, 09 Jun 2026 15:39:45 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp) with ESMTPSA id gdIrOg9dJuQ0-hTGYciVn;
	Tue, 09 Jun 2026 15:39:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781008784; bh=c7YLS0X+q/iPWjbCX66LMm3KWEfMTakCN8s6/J0HmaY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=IXIelmgbc/vwaos172GdAILy1XfcBjuhF9k+R2lU9gjKHThG/gF0INSJZo762EtIq
	 U73TupmnmgjQQFyU6Hy70MGmPC97WxP+b8+ODCJLErSAS3cMdRXgnFz31aPKqmDeAq
	 23MxSx+tv0H5M2olC7cY4f8zbiKBW+LH4xD9oESA=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	ntfs3@lists.linux.dev,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Subject: [PATCH] ntfs3: fix info-leak in ntfs_rename()
Date: Tue,  9 Jun 2026 15:36:18 +0300
Message-ID: <20260609123618.712961-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'ntfs_rename()', buffer passed to 'fill_name_de()' should
be allocated with 'kzalloc()' to avoid exposing contents of
an uninitialized kernel memory via 'copy_to_user_iter()'.

Reported-by: syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=905d785c4923bea2c1db
Fixes: ca2a04e84af7 ("ntfs: ->d_compare() must not block")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 fs/ntfs3/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index b2af8f695e60..74fe002214f3 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -303,7 +303,7 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
 			return err;
 	}
 
-	de = kmalloc(PATH_MAX, GFP_KERNEL);
+	de = kzalloc(PATH_MAX, GFP_KERNEL);
 	if (!de)
 		return -ENOMEM;
 
-- 
2.54.0

