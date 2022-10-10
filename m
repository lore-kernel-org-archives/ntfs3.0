Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944B7E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:44:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id n12so16593350wrp.10
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXX5hX07BGx/rUvDQD47pclnXvdWt2TdZfsk0DmyS1o=;
        b=QexsQ6NvWngVUCHCUdnqWXuh8RZErinzEE4b3IjlzZ03MmM1SmxA4a84dqAhvaBgzQ
         eKM9/cPYLiS1VWKZ0UsZ1zIIzjOLuD4izjOLHh8mZ8uO9q8ExiSM7Ef+AYKefqt8Qs2e
         M1hNR+FcptTA1OUk0gJNi6M+MjHlQKgTy6BEAqHS5F8com8gJGUuN/00wRoIjYviBBBK
         tozKSitImOhpjJjHnobV4hxFWD9G5bjVLFqzfP/rGDatO2kL+4k28zPr/v5G3u3bCNRg
         lJeuauoIq+M8ZFyzjqSbjU5sNI0Nh3PmosNakz4WhtzCBv30A6l8uzs8WpykRHMQf3Y2
         HRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXX5hX07BGx/rUvDQD47pclnXvdWt2TdZfsk0DmyS1o=;
        b=tyPJ0FShGrhXzJCitIQ248eZ+ZQbo9nSyM0DsspXAfhP8zq0klkxZr39PjNV7xFEZw
         jiklQK8FRJ4YkjP0DJHC1ItVRGXhXKjrHlRHbPidF4mCUCN2MYyUUifEgmNYkBXBk8zY
         B40hBj+xlmgmhh9b8ssdFmlAUdkd8JhV16a9QivpHDMvZH/0qC8xiMsDtdqUh+YARc1y
         C7O11Ax+HGFJlBiGBsvydQrV8Y0w4ydqE2OHi2BY6ddKeMP3n5nTYczB3wJImbpBQQ2S
         tyhFb9QLPiGaozwGjp3OUcKoD9G2xcaGK4ITZER3NmblEi8aNpQ7oWrwr6ao9s3sKnzv
         G3pQ==
X-Gm-Message-State: ACrzQf0aT/LAvN+KBmoEX1nx1t6d3EJ1eSeuZZJQyW/vMRl9gGTSxu81
	FEEv+gY+NRXn/UUlqQYFFOc=
X-Google-Smtp-Source: AMsMyM4sebHFxp5Jj63tGNP0OMsIxa0DrvD6ZYUsc5f/20a2jtYEL8Ih5nU0TwPAkZujH9oIODxA6g==
X-Received: by 2002:a05:6000:1688:b0:22e:58cd:5a2b with SMTP id y8-20020a056000168800b0022e58cd5a2bmr11111660wrd.365.1665402268389;
        Mon, 10 Oct 2022 04:44:28 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id l15-20020adfe58f000000b0022ac119fcc5sm8451711wrm.60.2022.10.10.04.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:44:28 -0700 (PDT)
Message-ID: <75c2aaa4-1e4d-ae30-3207-f6d88f8e55a0@gmail.com>
Date: Mon, 10 Oct 2022 12:44:27 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 1/2] fs/ntfs3: add system.ntfs_attrib_be extended attribute
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c9b467dd-9294-232b-b808-48f62c3c2186@gmail.com>
In-Reply-To: <c9b467dd-9294-232b-b808-48f62c3c2186@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

NTFS-3G provides the system.ntfs_attrib_be extended attribute, which
has the same value as system.ntfs_attrib but represented in big-endian.
Some utilities rely on the existence of this extended attribute.

Improves compatibility with NTFS-3G by adding the system.ntfs_attrib_be
extended attribute.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 fs/ntfs3/xattr.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index aeee5fb12092..8620a7b4b3e6 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -15,9 +15,10 @@
 #include "ntfs_fs.h"
 
 // clang-format off
-#define SYSTEM_DOS_ATTRIB    "system.dos_attrib"
-#define SYSTEM_NTFS_ATTRIB   "system.ntfs_attrib"
-#define SYSTEM_NTFS_SECURITY "system.ntfs_security"
+#define SYSTEM_DOS_ATTRIB     "system.dos_attrib"
+#define SYSTEM_NTFS_ATTRIB    "system.ntfs_attrib"
+#define SYSTEM_NTFS_ATTRIB_BE "system.ntfs_attrib_be"
+#define SYSTEM_NTFS_SECURITY  "system.ntfs_security"
 // clang-format on
 
 static inline size_t unpacked_ea_size(const struct EA_FULL *ea)
@@ -796,7 +797,8 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		goto out;
 	}
 
-	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
+	if (!strcmp(name, SYSTEM_NTFS_ATTRIB) ||
+	    !strcmp(name, SYSTEM_NTFS_ATTRIB_BE)) {
 		/* system.ntfs_attrib */
 		if (!buffer) {
 			err = sizeof(u32);
@@ -805,6 +807,8 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		} else {
 			err = sizeof(u32);
 			*(u32 *)buffer = le32_to_cpu(ni->std_fa);
+			if (!strcmp(name, SYSTEM_NTFS_ATTRIB_BE))
+				*(u32 *)buffer = cpu_to_be32(*(u32 *)buffer);
 		}
 		goto out;
 	}
@@ -889,10 +893,14 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 		goto set_new_fa;
 	}
 
-	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
+	if (!strcmp(name, SYSTEM_NTFS_ATTRIB) ||
+	    !strcmp(name, SYSTEM_NTFS_ATTRIB_BE)) {
 		if (size != sizeof(u32))
 			goto out;
-		new_fa = cpu_to_le32(*(u32 *)value);
+		if (!strcmp(name, SYSTEM_NTFS_ATTRIB_BE))
+			new_fa = cpu_to_le32(be32_to_cpu(*(u32 *)value));
+		else
+			new_fa = cpu_to_le32(*(u32 *)value);
 
 		if (S_ISREG(inode->i_mode)) {
 			/* Process compressed/sparsed in special way. */
