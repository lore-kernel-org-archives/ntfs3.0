Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765845;
	b=jF5kfMOV3yabUOxUJ3tMo9/imYkcIg0lAshZueKnQh9OR4vpz37+3nebNhLhpWIgp3eG
	 jZcN+AVl8gehqEMH8Mk+P7hrVCZ3fIXZ1n0vFnnfzAH4iDL4jZt85Wkk0+Ta8TjVbhLxl
	 tQKBmRIxlFx2i9gGzy4xiGqyKIhlwNXGwp1gCRBoSYrB6EAebv9Rdo2dKZarJVruidDiH
	 5FzyVNsUjir0qebMMntYPuZDGsSHmUrKNAzR/P6eG6enrNqB8BQA8xS6HDxsNUJCC2ewA
	 lbEW94vRoJahZbSAub+DY+j+Ubl/ZigLxVQLCZB6+CGd5fxPaeq6hiP8Z7cdrL6RT5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
	b=3jcl/2/DALiVTesbfIEuSMfYpw08FwQ1I1nWknhahX3m9csVxpQxMo03mDCtg3I+Sjr2
	 ACFZXEEmGXdfTp7Iae4SGGMKmsRdFIyMBJJgA1BZjtsiGiNeIzYizhgu6ET066c1XJvYZ
	 MSGjfqPElae8bPKsmej7bEf2SyD/fXx01FpHuuNIhbzJGYqPIFQuXyuNAtTlaOE/gdVP6
	 Z/wglROi0Q4XDSg2xZNjlfgq3yewlh6/ll5D13vig9ryd2XMcWuTw2UINdP5X94ESQBwQ
	 xG4cRpTruj9cuV31PSDW0zXIQ7925X+Y3c5+IMWkE/syp1gVEiRuf/rLssae9nGJVeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAa1Kgm4;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F198606A898
	for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 18:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F198606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAa1Kgm4
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1063216f8f.2
        for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765844; x=1795370644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
        b=ZAa1Kgm4CoZOu+Kv9Q7YmDXLfp+YEx5DbtFMYvKqrKKX70AxK1GWNnusmpTAOju/k3
         qJRPdU8iU9TkoffTxHQBuwl7M7jBmgAoT8MEPq3IlQexELierfXGL98DzbDJNG7t7kLZ
         6nMnWkMWjFax+plQplFeEJFrnBYpKu5WCZDpH4lX6J6+OjvO4+umVhwUW0bP+VtbcRKD
         /Dm5WdeP5I6yuQ2O5LvoiUGHmMikr4R6Z7/yBYrlzqwTuXDGK8M5K2XS2K6XEA/qWeUw
         wJVTY4Wbfr36BaeDiyKIiPf5/aHwIW7j6LPWLQ61pgF3fj4w6amygZESAWRqJeOLPQD0
         hQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765844; x=1795370644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
        b=h6E8ePvV1CJmxs5BPFEeV1zKZ9uqdhUDTad5uuRZkeiexSnNf/ts2VgFEL1rFJCfRz
         eDtBWAWSRKEfh3rTe+Y0MfaTNhzmEtYIpT45BhXsRtmeC0705U8kzYWbIMLiXkXpP5PE
         l57Uq2AI5QANWjcx9ohOXAgh6v8aJliAPRVRZsPmG60gZffDhJmQ2V9lySub0oL52sLy
         Hqa9HLIbQPhcsZg/lQ303vZ/vR2vltIK9nTCbvXnKqvbS7EVa6Fa+YxnOu4vzaDb4uR1
         73lNXiQdrfNsB8O+k59iB7ZLVONZl+zD/EhioRiM0ynrCjEsWdXrrAnEwwMWXW++YYkl
         hrMw==
X-Forwarded-Encrypted: i=1; AL+hErF1WTK4Knk05G9juHB3vUavDZx4fbjlzjL9UvmpdzNKIBiwdxw59Sj1QmJfkeOgwMcN/ZDd2A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8AJ3S+y21UkopDjnh/6ji7ziORlD/9VWqtw+oEu0x/oArAakf4
	/LiCsAfLWg+mIPtgJm7BT8J5ijroWFMfSJSGHqRHyxI66s3u1KfDKM/W
X-Gm-Gg: AYBFou16s1PAx6vmksPAmA55xF6OffCGcKcCnGp01Fz2wEzmFmVepAlXwAf4CzDd6CG
	J56KHUjXkmrSqaAgYQJd1jeqpY/aZBtGJLO9s8Nd73tSd23VAFUDUr+b8HVlSENPiBASD9S6o7n
	7zw+zpKIYAcLAmhmtiHTHboSUYlbj6ZQvnTKMXcXrjt84fwk49Bmx9tUZMxhm/fvGG6dbKYhhCH
	9Pboz6YR90L1i/kuWFBXrq3JXkvtvgzPKAN79HiIGSw0m0Pg922C0XIxAQkCsRG2kgFPQlf+Z2d
	5p2qM/rqsDhhkMKv4wgK77dr/NhuGwfq4pMcbUzBKaKQV2fBQFxITZBJhNWIdSe1IPICI9tgw9F
	hPlF+AFmleTWWQDbT+nwbi6riyq6dFoqfqxI/Vu9e1g/3Di+F/qlwZNf8CSLtk3cBBwcE2H5fX2
	phZeGg94ESZrJaVvdM3VCWbWFJQxK4WVO7/KKLC7MsCjsGIXppaYcC96b+WJ26LYL3RaY+3QXai
	rpFOR+4abfdOUs5xPwYZdVjjONaMjGOFY5ofpu2Fn1JUvv7PXGrwDxJRRSGOzCctTPsmu2C8y58
	pWEuNgvO5d5bjinwH/5x4fKB
X-Received: by 2002:a05:6000:1841:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49c6b97336emr21325466f8f.0.1794765843381;
        Sun, 15 Nov 2026 10:04:03 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:02 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
Date: Sun, 15 Nov 2026 19:03:35 +0100
Message-ID: <20261115180343.576773-3-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fileattr_has_fsx_mask() as a helper to let filesystems check for
unsupported xflags while allowing supported ones. Can be used in the
same way as fileattr_has_fsx().

Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 include/linux/fileattr.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 42b92ccdc583..ba7ed3b387d8 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa
 void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
 void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
 
+/**
+ * fileattr_has_fsx_mask - check for extended flags/attributes
+ * @fa:				fileattr pointer
+ * @allowed_xflags_mask:	additional xflags permitted
+ *
+ * Return: true if any attributes are present that are not represented in
+ * ->flags or @allowed_xflags_mask.
+ */
+static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
+					 u32 allowed_xflags_mask)
+{
+	return fa->fsx_valid &&
+		((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_mask)) ||
+		 fa->fsx_extsize != 0 || fa->fsx_projid != 0 ||
+		 fa->fsx_cowextsize != 0);
+}
+
 /**
  * fileattr_has_fsx - check for extended flags/attributes
  * @fa:		fileattr pointer
@@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
  */
 static inline bool fileattr_has_fsx(const struct file_kattr *fa)
 {
-	return fa->fsx_valid &&
-		((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize != 0 ||
-		 fa->fsx_projid != 0 ||	fa->fsx_cowextsize != 0);
+	return fileattr_has_fsx_mask(fa, 0);
 }
 
 int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
-- 
2.56.0

