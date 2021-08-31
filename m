Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1752FB6
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:15:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id g13so38804256lfj.12
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JjzmQo1N7d1P1cyzIEi8qkH6o8WLXVag9lNOKET+p2c=;
        b=nBsQ1UMQrWHJWCVlOmyWqaGEI3ZWxg5jWFSIiCpRXMa+99AnD2rhYiPisfrrobVAXZ
         21zYOxG9jay1p43sOz/PGA2M+t/d+qH8/1D2TcQ2TkH0qSV7qvKJzRZUp3ucZVlC3o5w
         6ZLTOjWiwqrqg4I1GGbWk2yo6Wr4S9DgvyHdWGvXaG0jxKu3WmMv/Imke+CM4oi2jMRi
         4nsGABkULhIdVS8ceBlk2SxcfWYcBCGHh9pjTHKhpqL2OtYs+E7dSTyLdyTrFBMStQjl
         b50xt6kvP2Hqf9iXTbEu2rbq6Krv0RiM8B7xjcVjLX6fo/9K6LIu35USWBlKZceLIOZV
         V9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JjzmQo1N7d1P1cyzIEi8qkH6o8WLXVag9lNOKET+p2c=;
        b=Zwz9OO7HwNVGUqzZ4UZGZk9NUInxVtR0w63vBfPO1f79X2u24SVk1SXJWMuX41h5oX
         IR9lRsLeKnh4LqcGx7Tj0eI2XNpce6WLMj1T/hcvyEieURVvjNih8zUB3RfIrfjllcRV
         kqr8giVxI+qbXbZFCsg9r7zuGlDlpPxPVSA+cPaWEISQJcVfURZYm8OH2y/Rg+R8y4DU
         /FGrM1ZcqPkx25fZR9MGTooOzFcA5tpZxKK4g4j86rioCHWXBxDwulYfAxe0baGvjCQw
         XtZ+rNILoucEIb2wK0TkYwhXqQ130tE1Iljt3FYe5xetHMTv85QLqXHW2S/c6iQZ4wVN
         Vyng==
X-Gm-Message-State: AOAM532yczegE0z09YpCL49EsdE+IiW34+WV8vTNCaEWkJVBE6pqOwPr
	FduoSIe8a7do2xewqy1hF1/jSuxgv+xgkg==
X-Google-Smtp-Source: ABdhPJzXPEinHOtHgNiedNMJpgG4DnomQ5x9de0q9GYvNAvWi5hDOnaZygJC6dEl2gsTaowvN5gAqA==
X-Received: by 2002:ac2:4c50:: with SMTP id o16mr11491952lfk.224.1630419304952;
        Tue, 31 Aug 2021 07:15:04 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:15:04 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] fs/ntfs3: Add missing header and guards to lib/ headers
Date: Tue, 31 Aug 2021 17:14:30 +0300
Message-Id: <20210831141434.975175-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831141434.975175-1-kari.argillander@gmail.com>
References: <20210831141434.975175-1-kari.argillander@gmail.com>
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

