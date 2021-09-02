Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79582FAE
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:42 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id j12so4554470ljg.10
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JjzmQo1N7d1P1cyzIEi8qkH6o8WLXVag9lNOKET+p2c=;
        b=QXnEL8wUBZ5IdkU13PdI7ypnoy6W4VPTqeqnkOXW6FfJRhYaDm0Jzzmtbq6Si2JQSQ
         69QHO43owdL60VNdB33s5dRErlPWV3PvXL/RtwRcDscmXdZD0TwwIgGFjyiYltKBwKDN
         tyL8ZDMF2kHzldgDRajFcpfGqAqNZXSO3yR+dpWVwZXLO7B/nlr/uNutpuTRM7FpmOet
         YDuTae0SPZZMzNiuezHB0njjBAstCwjgMSj9DRLn5AG6O1V7PK1gvjRLhQZVVOk5cuE2
         Ej/sGOjuA+Oa3qN78MWM6pIOddg3RiibPrGKSOar4ouSQQJViqM2RD6ZuUjNDWaob14o
         Nt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JjzmQo1N7d1P1cyzIEi8qkH6o8WLXVag9lNOKET+p2c=;
        b=LHSQP3+IujzQYverQGhGmaA7KsVr1Kn+R2BvByzFo4GN4f4PHnsOYcA7/mUq2QTird
         l1SuH9LggCG9VAKU7A6DLvnrLm4YPaXH9yRtgaupUNmR9VUhqz6phoiaLJYeEh9WPHfM
         w+T+jN0hJmTjCRhDncajtGllP78u4/AZsEhbGf1R+nPNQ8xucOYCliGEvLMk/ZgWWvV+
         2JYm0lZz7A+LBoVSFhdO9XI7z9R+x9SRLpWtfqSXGT9LFGSJHq17FegWe79xpnrPN9e2
         5AUQA34svV2Rk0J8s8Dt9pHRiXlV+PizVuK4rKsBSd8H9c2J5y5hNfJ2lifUoV4u+dur
         KAbQ==
X-Gm-Message-State: AOAM530xl0F/+5zBmG8ZENQWlGAextPyOvplWIvKW8FutRu3FEnLSuRG
	80m9cBRS4bG63xmB6xki7TGJrj++Poc5Yw==
X-Google-Smtp-Source: ABdhPJzn38UO6/Tx9z3krFJBpz+i6XLMy6kjCdpnZ6d5ICoOhqIkWrMGhKAN5N6oTk+AjBxn8UkwDw==
X-Received: by 2002:a2e:5708:: with SMTP id l8mr3273905ljb.481.1630599340934;
        Thu, 02 Sep 2021 09:15:40 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:40 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] fs/ntfs3: Add missing header and guards to lib/ headers
Date: Thu,  2 Sep 2021 19:15:24 +0300
Message-Id: <20210902161528.6262-5-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902161528.6262-1-kari.argillander@gmail.com>
References: <20210902161528.6262-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

size_t needs header. Add missing header guards so that compiler will
only include these ones.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/lib/decompress_common.h | 5 +++++
 fs/ntfs3/lib/lib.h               | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/fs/ntfs3/lib/decompress_common.h b/fs/ntfs3/lib/decompress_common.h
index 66297f398403..a2a858d4bf35 100644
--- a/fs/ntfs3/lib/decompress_common.h
+++ b/fs/ntfs3/lib/decompress_common.h
@@ -19,6 +19,9 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#ifndef _LINUX_NTFS3_LIB_DECOMPRESS_COMMON_H
+#define _LINUX_NTFS3_LIB_DECOMPRESS_COMMON_H
+
 #include <linux/string.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
@@ -350,3 +353,5 @@ static forceinline u8 *lz_copy(u8 *dst, u32 length, u32 offset, const u8 *bufend
 
 	return dst;
 }
+
+#endif /* _LINUX_NTFS3_LIB_DECOMPRESS_COMMON_H */
diff --git a/fs/ntfs3/lib/lib.h b/fs/ntfs3/lib/lib.h
index f508fbad2e71..90309a5ae59c 100644
--- a/fs/ntfs3/lib/lib.h
+++ b/fs/ntfs3/lib/lib.h
@@ -7,6 +7,10 @@
  * - linux kernel code style
  */
 
+#ifndef _LINUX_NTFS3_LIB_LIB_H
+#define _LINUX_NTFS3_LIB_LIB_H
+
+#include <linux/types.h>
 
 /* globals from xpress_decompress.c */
 struct xpress_decompressor *xpress_allocate_decompressor(void);
@@ -24,3 +28,5 @@ int lzx_decompress(struct lzx_decompressor *__restrict d,
 		   const void *__restrict compressed_data,
 		   size_t compressed_size, void *__restrict uncompressed_data,
 		   size_t uncompressed_size);
+
+#endif /* _LINUX_NTFS3_LIB_LIB_H */
-- 
2.25.1

