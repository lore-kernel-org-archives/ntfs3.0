Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FA3815C3
	for <ntfs3@lists.linux.dev>; Fri, 27 Mar 2026 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774592411; cv=none; b=gGMQ3biM7SvyRrhL3jDfdCBvBNG5uyhqqi5ZSxgGtzjqQTjuvPNMqvhITS2FHujJc2aIVm5EEpvdGatnU9vIsyGXHkdueNrfIjBEZ82+1v3Hj+BndrhVyvLeiIP6KDoNT7i7+UzaGIyGXTagHxtn6V8KriSalvhp/ULFAXe0txc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774592411; c=relaxed/simple;
	bh=6qpRluxXbFDYcisVRhM9mXQIfdUbwzynHJbrf8xCMVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rNz4kM03mcNSCP+F49tRmQZVp7u/CpTUgIJy0MT4UlZRczYbL3Yyw0oh17ODGR0N1TpzE1ftw7BeNqqcc6lmaKie/td8iBk37gKAKNZD93X+1+WOnx+KOo+ydkIihFAbivTAgBAo0+cdB+d8Adg9PlN+x8NOY3xCPyjRRuNpoeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAD3iAyLIcZpl3ClCw--.13856S2;
	Fri, 27 Mar 2026 14:19:55 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] fs/ntfs3: terminate the cached volume label after UTF-8 conversion
Date: Fri, 27 Mar 2026 14:19:55 +0800
Message-ID: <20260327061955.46242-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3iAyLIcZpl3ClCw--.13856S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kJrWDGF1UAF4fAFW5Jrb_yoW8Xr1DpF
	Za9Fs7t34kX34rtanxJa1xWa409393uFWUJr1Iy34DJr1ftr1IvrWUtw1F9r97ZrZ3urn2
	vFZ8tF47Xa4DCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ntfs_fill_super() loads the on-disk volume label with utf16s_to_utf8s()
and stores the result in sbi->volume.label. The converted label is later
exposed through ntfs3_label_show() using %s, but utf16s_to_utf8s() only
returns the number of bytes written and does not add a trailing NUL.

If the converted label fills the entire fixed buffer,
ntfs3_label_show() can read past the end of sbi->volume.label while
looking for a terminator.

Terminate the cached label explicitly after a successful conversion and
clamp the exact-full case to the last byte of the buffer.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 fs/ntfs3/super.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 174a7cb202a0..9ed485f9efba 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1339,8 +1339,13 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 				      le32_to_cpu(attr->res.data_size) >> 1,
 				      UTF16_LITTLE_ENDIAN, sbi->volume.label,
 				      sizeof(sbi->volume.label));
-		if (err < 0)
+		if (err < 0) {
 			sbi->volume.label[0] = 0;
+		} else if (err >= sizeof(sbi->volume.label)) {
+			sbi->volume.label[sizeof(sbi->volume.label) - 1] = 0;
+		} else {
+			sbi->volume.label[err] = 0;
+		}
 	} else {
 		/* Should we break mounting here? */
 		//err = -EINVAL;
-- 
2.50.1 (Apple Git-155)

