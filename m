Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40272
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 12:02:09 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id i28so5469269ljm.7
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6r8va6Dg2Si6p1qLWqzldiHMFwpXfRX5u3lnqvgf50=;
        b=jdBYVl6FVZiGHHJ07dR6L+gaooQEvB6aUPT7DdTl2sxzZB72QvIm8RjFuksMDCsvxs
         QACEMWzp/Q3iBoOjiKNZgcOebLotXfTDiRG/6VU7bW+9PQAEVQbbM8sfV9+AeK8NCbwB
         dOqsowtWGiOYzzik+kGvYfcRt/uHZPFJLL5DHMbAXigBGPSv+cDn20pKDwtJucPdL07E
         aYBSAPv3PU0ANahj14MJS6sUfUfrTJYD7yuklIwmLKbTFEUsIPqOhyA6x+wk33Ix/KAs
         zf6OvGO8cFF6p7JbPnyC+e2+p1WgCyFyO+5nuoUWR6d7Jq89QOQbkWDOwNhTt6xOB3LZ
         /2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6r8va6Dg2Si6p1qLWqzldiHMFwpXfRX5u3lnqvgf50=;
        b=rxIVbGKKLrhhW0M1x/STi1bHUf1PZidnsKI+8GIZ3ApEf4BMlnHalkFTLKIHdB4E8a
         NogJD0NO95lMYjXpfQisnThWy63LEqLWAB7R9S3h1elYYQuciWcUDzikOMYyQrgz6Eg4
         ypRLq3EUXpw4gXuq6VQJVG+YbivBSxt+DEwbCtszXOi4ukBwVCcHInNmIoID8nRVXIl8
         IDwujZR3JggjdF5c1gVk36d8NnSPTsD1sEf1i8Gx0PlxCCxxblKf4YuK/5zihV/ggPFD
         bfpVO54dmZMg8t7efbabIKhABMHgjcDKxPKdJuZkC87KrPdMR5Lx05MoErNHb/otMhi7
         53hw==
X-Gm-Message-State: AOAM530yL1OPA2/NMkHpIjYmbdR61yACRehg7lPqlqQoofw0K78DvQtV
	x57qk0lR0Bq31Tr5dJF+L+M=
X-Google-Smtp-Source: ABdhPJwuu5CRQ+ULVJ3im3r0i6BORE41/c2yLBzmo1gk45h3Bk3q0m02bP4lyLSStgA+Aeyo4cDcTA==
X-Received: by 2002:a2e:b80f:: with SMTP id u15mr9208488ljo.232.1629115326402;
        Mon, 16 Aug 2021 05:02:06 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id c10sm1144333ljr.134.2021.08.16.05.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 05:02:05 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Add ifndef + define to all header files
Date: Mon, 16 Aug 2021 15:01:56 +0300
Message-Id: <20210816120156.186193-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add guards so that compiler will only include header files once.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
I do not mind if this get's merged to V28/V29 without commit.
---
 fs/ntfs3/debug.h   | 5 +++++
 fs/ntfs3/ntfs.h    | 3 +++
 fs/ntfs3/ntfs_fs.h | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/fs/ntfs3/debug.h b/fs/ntfs3/debug.h
index dfaa4c79dc6d..465466631d38 100644
--- a/fs/ntfs3/debug.h
+++ b/fs/ntfs3/debug.h
@@ -7,6 +7,9 @@
  */
 
 // clang-format off
+#ifndef _LINUX_NTFS3_DEBUG_H
+#define _LINUX_NTFS3_DEBUG_H
+
 #ifndef Add2Ptr
 #define Add2Ptr(P, I)		((void *)((u8 *)(P) + (I)))
 #define PtrOffset(B, O)		((size_t)((size_t)(O) - (size_t)(B)))
@@ -61,4 +64,6 @@ void ntfs_inode_printk(struct inode *inode, const char *fmt, ...)
 #define ntfs_free(p)		kfree(p)
 #define ntfs_vfree(p)		kvfree(p)
 #define ntfs_memdup(src, len)	kmemdup(src, len, GFP_NOFS)
+
+#endif /* _LINUX_NTFS3_DEBUG_H */
 // clang-format on
diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 40398e6c39c9..16da514af124 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -7,6 +7,8 @@
  */
 
 // clang-format off
+#ifndef _LINUX_NTFS3_NTFS_H
+#define _LINUX_NTFS3_NTFS_H
 
 /* TODO:
  * - Check 4K mft record and 512 bytes cluster
@@ -1235,4 +1237,5 @@ struct SID {
 };
 static_assert(offsetof(struct SID, SubAuthority) == 8);
 
+#endif /* _LINUX_NTFS3_NTFS_H */
 // clang-format on
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 0c3ac89c3115..80e1dea2579a 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -6,6 +6,9 @@
  */
 
 // clang-format off
+#ifndef _LINUX_NTFS3_NTFS_FS_H
+#define _LINUX_NTFS3_NTFS_FS_H
+
 #define MINUS_ONE_T			((size_t)(-1))
 /* Biggest MFT / smallest cluster */
 #define MAXIMUM_BYTES_PER_MFT		4096
@@ -1090,3 +1093,5 @@ static inline void le64_sub_cpu(__le64 *var, u64 val)
 {
 	*var = cpu_to_le64(le64_to_cpu(*var) - val);
 }
+
+#endif /* _LINUX_NTFS3_NTFS_FS_H */
-- 
2.30.2

