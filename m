Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498246;
	b=gshX5+zvXAGlostzeU4aVgCVrSAy3GWPEGciJqsbzUbeVfxw60XXtrQTkLplx0TdFrj6
	 8tjZz5mg3jBKNfp2NFSTR2P4F2+ZtTyDv2a9RnksC1gjJCot3VIce5KyiKetv6HGwL3PI
	 Oyi3m3t6r8iOx3H9M7XktbtkO4jQ5XgvZklwmG/LdnSnnODJwiuTtuTL7DLw3kiSe9g/V
	 0nAtWQutiLX8buo+xJ1kHkxU6QJQx2Lp4YlmArCqO0HdtRTSZo5ksbvQ2Y/SLmxqGTcyG
	 gwLE8u8ejFy3SuldjYkJYcFJSlVCkxmP4K1yzbGNWiV8+kzilNShUndWp1RCHIdhvCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
	b=HJQVGHsJLkoonIVNw7NJeyKJnSXxV7QOZkZgnkxZhfpmqOwQv5WaoKaIUdXTkS50xbJc
	 uOD+17NNakXlHicTooEEBglmv6mgg8voftiYJHv8E0VAQI8KFD9YBYKr9GoWGznsIYlPX
	 jXY1i05gfjKJNr2c4V43lEU4IFsAzIYgx/WhXaHcmFa2vbiSCs+ID2yantHq786o3aX60
	 Ycgx9TMgT053DAQ1NP0lR9FW9BTNNfDh1ddw8rO4lIMSQGQRVJ2uiq9nKfAaQjwFFd3AM
	 DQSzS9qVPVdTUuj5yND8rljvJpgPeHWg6qEVYvr2M8msiMCT2p93HffDewesraDnt/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqovdYU9;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB560A2623
	for <ntfs3@lists.linux.dev>; Sun,  1 Nov 2026 01:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CB560A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqovdYU9
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so14565845e9.0
        for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498245; x=1794103045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
        b=yqovdYU95DsXBqNs8ObhfwVaopEBfZhUdOhJXDiG2K9tlVf1JGiSvgq+n30do3YxHS
         Bp0J0XlDqTDcdX4tAyQ1nMzmKYo4e+FvhwFWxSkzBjvFaw5sVgokO7ANyR+QYP2W5W7w
         dPVG1N8Wy11cHkAjlLZKdCPoQ5J8FO1Nvg9ZcCUHeRmqZOpCzM5DJeiw/LSg95MU0UyA
         qFwnvHT57ScVVIoO9p2/LQWxeoA7clLftRUWtAUHYxAewDnkCR+GZ/2AbPAdQKTP4lL+
         MH/eqBHGmB2EgT8045CCyWotDOzcYULKlgqel0mC+RbPCtCceHZ5oPShh14U4+zYfqU4
         ZMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498245; x=1794103045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
        b=0LFCiS7W8kOWcJ2FnZNXpe1ej7ajVIEbn+2eOduT3PdKf3k6Ih3uROjR81gKS6znMl
         GUOSeICE8He+Ub+uWEiNkqW23Xhlv9SSDg/NM1/dnRp+UHa8TUC+UvP+NNq95jopz1s7
         vHyLJklNj86vs7HykslkO5zpJlP0mYw/xlZbNEGI/z8Xs3LP2KfqXD30Umopl3rPS1jN
         pUEc+iX6FEhj0BaVs04UjbdZnbp70rL9tkI9IGwDlbgg69Ou3aBEfGQ615gMCxOwKW47
         l99Ped8h4iypIYuBGv2B0mM+63bLPicq6lKvcsDmpiPWyKKCpLBGi73J0H/BeBE3/jAV
         /x6g==
X-Forwarded-Encrypted: i=1; AKwUvByBzZ2S4d/viDzAv6lA3YirInUhqOqlz9J7043lixxxihOBAyui0kMicjk0iWbh38Y0iqffqQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKu9cdqAcTXixZAe2Pd6zVOnbuoiOK2LK4yllTWNKq4Ut9CqOZ0
	b1rGkxC2vl4AMendu2FZ30xMjiehYysqKkHSkYeSA370kyu4apimSakV
X-Gm-Gg: AYBFou2AKuVXh2wocSiOItmw2lS9DRtJnRiGFhnmAM2gfRIXgCMAUd2S5r5SfnD+Yak
	/6DAAxRdRZF8iRWJ+8RHrwdGgQbEsa5yppNeHnhFn0r3uNdB/8feaTVNHkQhEecTCPgMAKiCmFP
	Jx2jX0VvtlJJ6eZY373TAzojbLh4239PJVC9fuqcbODTio+Z2b81lsDNM9LHy3kKSVNN/O6MKuy
	+WfBSGNc9+8y7RAOSX/RYp5nNkoLQjhKH6Fx1nriIWvVEsUDVwQjvB94U3mZla45gyxIdWjlaI/
	qgdld483Bv+P7njpOyFpzurPdFWKe0JCxxb6sWYKb+EM4BuRsHxJukafSL8FCnL6hb69egFpELo
	orYR64D5AgflUfXrj+9thO9a3rsMuVzZLpBCQxu8lb1Q95RBC1/5BxwqOorMfwP8Vtuu/scGJxc
	XJxIJTGyc/Hd6V0j3sMDI7AsIJWv1ErENCgRVvoxeMel8Dlihdo5x84YPTXWz70AFUcDFQ8cT5Z
	1Qo7nQE8vHAkUJW+6QYglhhHRaKObpTn87ie2kxZBuJfM/qUk5NecmZYF8gTqKjxiGWaM3gGaf0
	7uTAYeX7nLoBVZVingWRheKL
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr142228025e9.3.1793498244682;
        Sat, 31 Oct 2026 18:57:24 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:23 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 2/5] vfs: add fileattr_has_fsx_mask()
Date: Sun,  1 Nov 2026 02:55:48 +0100
Message-ID: <20261101015551.786044-3-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
References: <20261101015551.786044-1-koray.fra@gmail.com>
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
index 0b93f9609284..16acc61c9af1 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -64,6 +64,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa
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
@@ -73,9 +90,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
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

