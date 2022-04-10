Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C16880F
	for <ntfs3@lists.linux.dev>; Mon, 18 Apr 2022 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gp4V6
	ElMJdLdIssAij3ACdw5nkfgVbrbRO2Z+bKp15Q=; b=Z8TfkIIz/GbMrqHwR0Bvr
	Nmz8JIt8AaFwx9Zi4y+p9m6EaETSeXD7f3OXBahdX6qfnro/LnXtgF2MUqW4txr8
	J7d3uE+WpDvxNWWtP43eZYH1VYdymqnK9e+tEay2tRZho/UZtu3lBCIMls+s6lmh
	Z7ORODBKBc4jdNdBWYUTRU=
Received: from localhost.localdomain.localdomain (unknown [115.197.34.188])
	by smtp13 (Coremail) with SMTP id EcCowACXr0NwaV1id2mvBw--.6665S2;
	Mon, 18 Apr 2022 21:36:49 +0800 (CST)
From: chinayanlei2002@163.com
To: ntfs3@lists.linux.dev,
	arnd@arndb.de
Cc: Yan Lei <yan_lei@dahuatech.com>
Subject: [PATCH 5/6] misc: sgi-gru: fix Using uninitialized value excdet.cbrexecstatus
Date: Sun, 10 Apr 2022 14:16:01 +0800
Message-Id: <20220410061601.4089-1-chinayanlei2002@163.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:EcCowACXr0NwaV1id2mvBw--.6665S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1rXw45JF1DtFWfXFyDAwb_yoW3ZrgEkF
	sagr4kXrWUG3s8AwnxuF4fuFyay3WUWrZ3Cw1rtrWqvFW7Zr1rZ3yqvF98Gr4kurs8Ar9r
	ur1qqFyFyw4rCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUX4S7UUUUU==
X-Originating-IP: [115.197.34.188]
X-CM-SenderInfo: xfkl0tx1dqzvblsqiji6rwjhhfrp/1tbi2xHmLGB0G+FyyAAAsU

From: Yan Lei <yan_lei@dahuatech.com>

Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
---
 drivers/misc/sgi-gru/grukservices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/sgi-gru/grukservices.c b/drivers/misc/sgi-gru/grukservices.c
index 19dbdad8a..c4dbd1a10
--- a/drivers/misc/sgi-gru/grukservices.c
+++ b/drivers/misc/sgi-gru/grukservices.c
@@ -453,7 +453,7 @@ static int gru_wait_idle_or_exception(struct gru_control_block_status *gen)
 static int gru_retry_exception(void *cb)
 {
 	struct gru_control_block_status *gen = (void *)cb;
-	struct control_block_extended_exc_detail excdet;
+	struct control_block_extended_exc_detail excdet = {0};
 	int retry = EXCEPTION_RETRY_LIMIT;
 
 	while (1)  {
-- 
2.30.0

