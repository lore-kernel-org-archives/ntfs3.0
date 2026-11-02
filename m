Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631211;
	b=Fa9uqfQMZ1lc6MP/LeQPZ0OQ1UkpO1ghc93PoydubfgFViQLkYmZOTUzRSndJQQdcgAF
	 qC11MbF6KsSp3GU1XFMEb5JHe+eG0X1Y6gzLPTHPbmoiwDHSWfa/pSDFhRrFfsFp7qG+4
	 WKQyejJqg9FqMiRJzkiRy20EHa4eyCKqwroWYiHUY7gcN1T+7nLGGgw9TJPAvg9yntULz
	 Hc3j8Bw4AdekzjwTZrqcVwaQbeBCa0zc5FRfmkQJjXFEIPb88UDzRrRIcwHanYhwzLl7T
	 HeLEe7oijAijOOYyNsnCGGIhqDRJmly2Jxj8SPXIgKozE/dnNIVreUxHNbzgiteNhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+jf6C5QZHCYFZk+bTrNhuIvnn0Dge3f+1lrrKUvhbkk=;
	b=rt+SXSJYGEwEbGJBZY/A+UkFmN8cLpCjtifZg5Pil5lofo+sKQmV1t/YQp/Gxwlu6aQT
	 v7dfgRE7l1AwYY4yy+U3C65xI0vwLe77gVpywhIkBd6voSfiPcAi4/gwWyUHYbfiLYLao
	 cpIS3Ja7s0dMPpWweV3iReZ3EG9Jqcpmz9uDMrAGWmZ2UEL8fHcCn/iLjtIb6PPI5Vyrb
	 X8gQTE555hUJZ/WreCtkTm1Slqdz8PuIzWwPtOxFboC3TJOsuJJpSTSkSXgxY8fgHwpaP
	 rnPiaOsHKMrTmqy2xwgah+Znv1s0k6sbNTbd+CS8gAYRqpCy4ILqjfGRar5eZTuP7/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H24TXK7g;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8246079930
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 14:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8246079930
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H24TXK7g
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so28101005e9.1
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 06:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631210; x=1794236010; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jf6C5QZHCYFZk+bTrNhuIvnn0Dge3f+1lrrKUvhbkk=;
        b=H24TXK7g00MUBUmLpRjX9S/u33pmbolOun7zEnRq3xta73hO7mq+aF83/ZGgEzinMl
         wqDqgaA+awJZpjQmb+ZTcb2H7s+NC8w2YLnK1gYwsJMWiAg9oks2Y/6AwBejiTs11fow
         RIIbQqcvYAupB+gO4OFIacZ/JXlGb7DDDh7MUpVteajAWdkewpv7y94uhvjbUPs8KHM6
         D7I4/KAQ2dZXgH/sT9DebsVYlyAaEhgq7Y5OqQYYOiHahgaFTOHcOvneOvL7AZDCR+Uj
         GZu/EaJQ5MkBDWvHFR5yzVykSXow71P6RKgyGcn3mj7nE5Q+DIudItNGdk+M/kBnF5T9
         p3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631210; x=1794236010;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jf6C5QZHCYFZk+bTrNhuIvnn0Dge3f+1lrrKUvhbkk=;
        b=FK2RoEwN6FPQW+zAjZqC+//JMxzv2GCExeM0YvtlUrS72TH7N5UdUVI5aaJEiKlwez
         fgyIqs6ufak4Z0ZBn4DjXsoz0MnVrSCMyhdlONI4jDx1fI5S6w6ypmjPkIOt49qOGqQD
         ho3YmMgyJM2HIZTp1i2IXWfMgJ+/lII2GFVAQlXyqJkujcNFhKtkgkYKNX2cPNzqB6Rv
         +BPJpPbIm4sxLmkJ0Pc7yit2OEXKVNTaou0+QMrP62uZNqk4Z64I6M43OuW6ROmYg+2p
         7pzUL8/LfhN4S9acSgjNRhdN6fv5CZcsT1rujxtiQV8oG8iRZ+qTuioyX5aPFjER4DAh
         jOrA==
X-Forwarded-Encrypted: i=1; AKwUvBwHYNipv8hEXeubaJaZUyWqdM/DZ/X0tFTtwJHZ+xfecJyeI3uGP/msXS3drrJ0EAGGnrzU/g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJdHddHpVdPugm2RLCx1sFQdtWKNkrtc83OJFYQQG7BSboawa3h
	NKQmHqf6wwntSC9F79RukTw9ktjfvaEweTYWI7N4t7nQSz6kx6zES2uC
X-Gm-Gg: AYBFou1Y4/9gdrCpKN6Vo/8A3jUWIYluCccKx5jkUO/SeXebu580N7WCY4qxexQ5SjV
	1X3XM02bLefPBzJm7rzdPgre2KhgGDe5W8Fxw+X1nyMD8/GDFUaOzBMFhe+wtCVAZO8I7CIu8GA
	orib+Z3H/q9Vm5C794h7tMJdkp8/3GS/3Bwj3vgH7NBsg0joXKm8CyuLR1klJQ9kRsNWo2WCcBt
	h9dCT+1eYFiqaZ4t04IOxxGSB1K4lMTaNbOw7ldxNuhOBEDQfqHkv2JfDretKim/W+x+SaP12g9
	Cdy7mwUyUI8Ir2ZcoeuUjF/HgZDYtpvxAsdqPO8UB4qQ97x253WDlaKQ/O7e+zpvs79vtl4Hjit
	DVmIr0hj/BNKnj32tRjMAQQ7splRE+TSUCLyaQmLaKuxyScTOkpwf11SbiddMlDeFEVLKqp60+2
	Mif7JqwxdAddi8znJZQgbtK2m/v5pwKK+CHyrufPlKPfl8i3UF0mAAyzw9F1s6tN6gLYfZ0xmRH
	y2HF/LKYtmWkMfvuOeujxVoim427ZtGyoDVM0zvDcyxvwBVlwtV/jwHmfFo59RFx2CDujXDiGLW
	jmb0/Gy0av2FWAD+2AFQrjh79rlh6mexuudIUD5YSF/j
X-Received: by 2002:a05:600c:3b18:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ac1932b542mr244898535e9.35.1793631209531;
        Mon, 02 Nov 2026 06:53:29 -0800 (PST)
Received: from localhost.localdomain ([2800:810:84a:dc6d:d32b:1515:b2a9:c74e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm366474025e9.9.2026.11.02.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:53:29 -0800 (PST)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: use put_indx_node() in indx_find_sort()
Date: Mon,  2 Nov 2026 11:53:22 -0300
Message-ID: <20261102145322.169626-1-ivanrwcm25@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

indx_find_sort() frees struct indx_node without nb_put(): bare kfree()
on two error paths, and kfree(index)+kfree(node) on pop. Buffer heads
taken by indx_read() therefore leak. Use put_indx_node(), as
indx_find_raw() already does.

194491be54e1 freed n->index on pop only; bh refs and the error paths
were left. Jiasheng Jiang sent the complete put_indx_node() change
earlier (v2) but it was not merged.

QEMU: 300 distinct system.ntfs_security inserts; unpatched pop path
holds nbufs=1 across teardown, patched does not.

Link: https://lore.kernel.org/all/20260118185736.41529-1-jiashengjiangcool@gmail.com/
Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 fs/ntfs3/index.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760448..00dc87818dfb 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1297,7 +1297,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		    sizeof(struct NTFS_DE) + sizeof(u64)) {
 			if (n) {
 				fnd_pop(fnd);
-				kfree(n);
+				put_indx_node(n);
 			}
 			return -EINVAL;
 		}
@@ -1310,7 +1310,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Try next level. */
 		e = hdr_first_de(&n->index->ihdr);
 		if (!e) {
-			kfree(n);
+			put_indx_node(n);
 			return -EINVAL;
 		}
 
@@ -1330,8 +1330,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Pop one level. */
 		if (n) {
 			fnd_pop(fnd);
-			kfree(n->index);
-			kfree(n);
+			put_indx_node(n);
 		}
 
 		level = fnd->level;
-- 
2.43.0

