Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314762;
	b=UsiEwe32Wh+YIaQPL1xVBmABtQtDR3fIFS3nMaG9XzPkvVQSg07yR2rPdr55VmS/W7Mx
	 li+HruQgdzZe/ViZiJmt78o/RV1MB0JSNlnj6OBN+8BTQfS2J6pgYrERs90CUrUOfgwyD
	 18kAbOlS35IGbSXr2yUZBcz/N3Xg2Z/1XXvV1sXaVYOJ9sNbHfMJCk1GkFidcfJoHZLBR
	 2n70qJWlaryw03iTef7Xr55Aa0EbehA47nwMhgTQlQYzty0OBTfVX4NAglhzZzjSYWuqT
	 JR9K7hf70LBLZcABJ7R9Inf9es6aDcstsncH9UvJgAvm6iRtO8HGZwITHDU0HdkUVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LoIbjYHReLG6WDNOTPVhVG9Y8H5GzjW3qhBS6aSgkkg=;
	b=zNHBoTvC84C9C++MROlpyjL4UCQQTRmAYN1CAzVYaPV+L4ajmEeTJMm14e8bmWnJ/YKQ
	 IinLHBKVtw2Rc109HJgVOZUbOsFXgoEjUu4mtpoE6DuOzjqiQDTzcFpaPmEQuSh+xWvEK
	 My7omviHI8an/fTxPIomqWgOUSQKRSrNuUMGBYwwyfQjDfoE8Gg/FRYC/76Qa7knfszWf
	 iRoOKGLswYLHNFBhKkEBbhTXOao2/D0DxB9i3ylLd+c+AfWDOXPmBN1RyYxzd7HWeahWx
	 WUmjAFoebRhHaK5XCv30f8aDDcjluuh1devRZykZ5hruqu7o1sz/GiIKUjVGsCKcAnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5Lr8wpX;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D3606A31D
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 22:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D4D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5Lr8wpX
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so34171eec.1
        for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314760; x=1793919560; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoIbjYHReLG6WDNOTPVhVG9Y8H5GzjW3qhBS6aSgkkg=;
        b=l5Lr8wpX1kGYPwfJnht5zISSXjaqTRWcT1+QIJ5BO85A807aS5ho3xiOth3ENKv2lM
         iRPfTfimp2xNXFoHg8ttuWD224dTa4N1yzQRZuLU3wYtV0RtW1AjK+UeicstjzoG6gQB
         U1Q5fMR2Ci8MSFaaBiDH46hirpXsF+XdLLSV05IG1NR2oszZVPqdMj4VWy1GdItvDsAm
         ij4V5gKWNr6M/LBrNnhAWdeyQ/MnPA0RDwf0OgG418qJxhhN6vxRfreXZVUBGuE2X/LO
         ASqh8UzX12MA0gNmpk5CUTddf/VwrGHRGrlfQkop0tunVE6hYsaWxG7r0oBHuTufv5li
         GCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314760; x=1793919560;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoIbjYHReLG6WDNOTPVhVG9Y8H5GzjW3qhBS6aSgkkg=;
        b=u/MOLqVx7LEjZw2yV1EByYVQsYWyl4VjaGi5frrOL4MR4czJvi0QKf4FPJbD260lTj
         y44L7nJw+HKZC7oMjx92y4piwLD81NKWOEjufuy8LN9c7I2xC+lok2ce7LuOoVm3FgSj
         NXk47btv2NHUkF1oxM1dKq0jnhz/EyCtLM/+gBZ3mjmj/1PECZB+jF25nOExczpWtvYU
         S22J6YwF9umDCgTuGHgRSQsD4av8tpk+lFR5yGlViZ9TnxIWk2NfFsB3OxBy52OEKKsr
         YfXVnIKgJnmYaiOKkIVBW2j3SZxxdc++AWyZ8KpAJVAjImaiqQg1fAMpCM37VdqzDmq3
         VIWg==
X-Gm-Message-State: AFq9FYKv2FsFCCAggNOP2siivqGH6fFhynSGegHTLWZ7MoGNLINAGo2s
	WgTk7FRmZUScNMVx5A6+9nFGkBEh/7mt1mBElvjJS5Fwi9WzOpmqgN7G
X-Gm-Gg: AYBFou1jTwiHnAngAiR9+u8/Q+uecXiaRvaBYjnoDsuy//jDvQaWXAXuzIf4DGPYeuu
	bu2TTHF5t3UPaoVZOc6b9SyYgy6pHIP1h9PwfzPmt+Kt4XX0kZYVDnf65KHdIvpdVzIa0XeTrvu
	27vAnrHcs+vJz0dnjjHFwhicnBWAIk50AIEtjQuh+VXP8KuoEBj04uJkB6DYnNAULHYzBYzYlVD
	uZuHDa3GsiYS/1sFLA2PwKTgK4Q3UFqVYP4dn+bLKNnSAJZoI8b4hRVP1HJNJFkzuAnDiwRzLil
	bs9h31rOx9dF6eHYESYgvnijYCgrJaf7wwX5hVCJvTiZjdbsOXwGG8nPeoRZztuFGstBbOlRrH9
	UVznr7o3Z78KmmxdaXyhQy3Mwvdyl+AXc9VC8Lury21D/OcWaavrtyNv7DU3tl2bqq70xkON4HR
	nRtM0xJ4FL3ucp9aCcpSs1zl6eqh8R9QfGX71h6DIpUggfeBczq8y5Maq/1cSSaF+SFITLd0bH7
	I31+MQ19QFlELnMYFFzreKtie+qubX8GfPUxRLNawCiA4mNr1FxbZj2vv2vXJllKzzOwzGwTXNF
	onW65kIlUQ/BOz7uk9SPDPMNSXSfVEMVZl3g4oBSmQN8HEJ+u2igqVD/
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr660166c88.30.1793314760261;
        Thu, 29 Oct 2026 15:59:20 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2009723c88.10.2026.10.29.15.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:59:19 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	xfcyhuang@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: preserve colons in volume labels
Date: Thu, 29 Oct 2026 22:58:56 +0000
Message-ID: <20261029225856.1173-1-dennylin0707@gmail.com>
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

With the ads mount option enabled, ntfs_nls_to_utf16() replaces an
interior colon with NUL. ntfs_set_label() restores the full length, but
does not restore the overwritten character before writing ATTR_LABEL.

For example, xfs_io -c 'label -s Backup:2026' succeeds on an NTFS3 mount,
but the label becomes "Backup" after unmounting and mounting it again.
The same-mount cached label still contains the original input, hiding
the on-disk corruption.

Disable ADS parsing when converting a volume label and remove the
incomplete attempt to undo the split. Volume labels are not stream
pathnames and should retain their complete contents.

Reported-by: 晓风残月 <xfcyhuang@gmail.com>
Link: https://lore.kernel.org/ntfs3/CAC_Ok8x21q=Fy4n7V5j78G3rn5ByHpLVRiM4FrYGaJnmdFiP_w@mail.gmail.com/
Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
This applies on top of:
  [PATCH] fs/ntfs3: preserve colons in symlink targets
  https://lore.kernel.org/ntfs3/20261029203457.59990-1-dennylin0707@gmail.com/

 fs/ntfs3/fsntfs.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index b06de8566a72..df939ee18904 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2668,16 +2668,10 @@ int ntfs_set_label(struct ntfs_sb_info *sbi, u8 *label, int len)
 		return -ENOMEM;
 
 	err = ntfs_nls_to_utf16(sbi, label, len, uni, (PATH_MAX - 2) / 2,
-				UTF16_LITTLE_ENDIAN, true);
+				UTF16_LITTLE_ENDIAN, false);
 	if (err < 0)
 		goto out;
 
-	if (uni->ads_len) {
-		/* Undo delimiter parse */
-		uni->len += uni->ads_len + 1;
-		uni->ads_len = 0;
-	}
-
 	uni_bytes = uni->len * sizeof(u16);
 	if (uni_bytes > NTFS_LABEL_MAX_LENGTH * sizeof(u16)) {
 		ntfs_warn(sbi->sb, "new label is too long");

base-commit: 4a77fa820d937fae9fe0bd6a6795c2d749fd4df7
-- 
2.43.0

