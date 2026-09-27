Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB48E41D11A
	for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532406; cv=none; b=eFwOJsFys9ngSlBYm4g19YC38xdaR4lDo6kb0R40qF1RwWyGomwbWeYUOOrap2dd04hsNW27dC7LQ4lNTRhZ/wJzgEk95smQXqS9fHW9Ces+z25J9TAITuCE0pvW/WPGhxRMFXBN39yQ+29Hx66xVW2QxPOvEJDxyMZvU3+sL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532406; c=relaxed/simple;
	bh=b5NKuB6SItvoxvfgKvZiKcCoXcf63jX7nGZfWfucc4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6DVQ0gQBKi2EmnnEMFNDnDJnAxonaOFPSX/ImnvcWy6RYr4WqkGds/dtZ8iFdZl4rf2bHAK5uARoxdBsPKP2+9SFuHfQ5/bvSRltAXNKRtPszD5t9+1x1kXkbaEWsFOalBl7hQ85h6yicNATnAw/uw9NtNcXCyqZpX+UMAje5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKbKOpN3; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKbKOpN3"
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3a0cb6b922eso772051a91.1
        for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532404; x=1791137204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sITXU/nnez7G10EQWApisgywwNOD7MhsfavkNvgebls=;
        b=NKbKOpN3e71j9TamDW1igms1+uDrNK/5Z8j1k87qHWJKSTFt1Km7Dk7YGEuYdY/8UD
         jn9GsqA/EINP40ZHX+VpnUspXeb3vcc1FBERFWcEkGe6hAUYC6B/UJPq9kX554uhLMNz
         PkuW4F3agAmAXtna5UP9SoIoi0WRpzETr4bMGLeN1vAndottYjDfw7pHUjRf8E76U0jW
         oQbvXKLbvFZwRvMpZKSw3LXyqeiaIk+ASj8BQfBuCwO63xfhl99hgGaCq1Gt+RrOq4am
         QYgTRyVFIS2CVdnkqP1zCAdKIkyJbEkwW3o4n81LwG5LWb1iSOl0JwuJf6nldkhZ2hco
         qFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532404; x=1791137204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sITXU/nnez7G10EQWApisgywwNOD7MhsfavkNvgebls=;
        b=Bp3sJqBpleoCYn0yhVwylWTldfgkn7pO+e8gi5+GizFHcLO4Wel+l8zgTwIirjskpC
         TM4nkMJ9WvmF6pkIK3Pp7ti/bnWOTc+M+qtZjhLWwQTnoelqBq4T+/k9gwHOMxo79VuG
         6rGbFm7rVXx7VDXI6xDqSfL6VPu0AJN9kCC4bHj9aZXRkBJdEPzsxigCq3Afz/fIFN4Z
         H6hep32sAneWbTg6TJdP6ny1Qs4uA4CObrZTUuMpxI0IBUXY+8o84WlFdt6kX2pR/lq5
         Cjf28Xgg87+44MAyPqVtm/u77Wqqo/naqxMhdraO4mvvgBAX0fZsP/WIPfZX4gLNKj8r
         Zaiw==
X-Forwarded-Encrypted: i=1; AKwUvBwTastv0s7BjuBTaq7QdWD+zvo0Y1d0eaGVCySkw3FtA9pALZxogqdEMO0H9kBpZiwi3IJaMw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI22pfPm3U2rX93x7UbTq6Z8eoOgPmkvPMtUG+k5PSdDXbaV6Lo
	sgKu91HQBsPvBlLxPjOiCdzvXXduoe5v8kI8CY/04uC+Z5JMdMKUrSd1
X-Gm-Gg: AYBFou1lySLxSPABkPZ2lHgYlMJET1fp1mjJ4LAqFB8rtgsrXCS19GDdR22ykcN4puC
	0gr7AdTVaBV1kDaCiRtnbWh4bE4764xfVOpGV2bUnCWcLXtpMkCowDSaIHr8O/NincXiunYEK4y
	m0Nh21x7GqD2UDVgf/uI0E0d5Xojczsx1BxoC0uBsSsGoBp5glaoopoGxUEhh36MNFy1bzIQcWZ
	yAUszgIB3lcflzq8cVBSwCG5PSjaaDWfllhCf/DKlNZx/5zRbN0ESO7WKrzpMXmqrFdlJ5NWpNQ
	aAvV0I9KF8du5golV4tYi+or0rgzNDXWnDTq9BX8aqG6SyFmSEbCADODqOIj/FfKg8Gx3sLIKZg
	6GomW3tqpgAbsfMeeA1fN90cnaBEF4SJIK5dRGvp4yDxADXO38R+lczUheVfkECUPgLYhwHYDtC
	nXE1QcTrP4c+a+54j98E9lcGtP0NtaQg58SHBdTBdCeWistw==
X-Received: by 2002:a17:90b:254e:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-3a098bb640bmr9080747a91.33.1790532403996;
        Sun, 27 Sep 2026 11:06:43 -0700 (PDT)
Received: from huawei-w510 ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm5225385a91.3.2026.09.27.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:06:42 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhenyan Wang <maximwang110@gmail.com>
Subject: [PATCH 2/2] fs/ntfs3: keep PrintName not changed when creating symlink
Date: Sun, 27 Sep 2026 18:03:59 +0000
Message-ID: <20260927180359.3867508-3-maximwang110@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927180359.3867508-1-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating a symlink, ntfs3 converts all the '/' to '\' in both
PrintName and SubstituteName.

When reading this symlink, ntfs3 converts all the '\' to '/'. So if you
create a symlink to 'a\b', the result of readlink would be 'a/b'.

Fix this by converting SubstituteName only because SubstituteName is
used by NT kernel to read symlink while PrintName isn't; PrintName is
left unchanged to ensure consistency.

Signed-off-by: Zhenyan Wang <maximwang110@gmail.com>
---
 fs/ntfs3/inode.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 6717563..000ac34 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1091,6 +1091,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	int i, err;
 	struct REPARSE_DATA_BUFFER *rp;
 	__le16 *rp_name;
+	__le16 *sub_name;
 	typeof(rp->SymbolicLinkReparseBuffer) *rs;
 	bool is_absolute;
 
@@ -1118,12 +1119,6 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 		goto out;
 	}
 
-	/* Translate Linux '/' into Windows '\'. */
-	for (i = 0; i < err; i++) {
-		if (rp_name[i] == cpu_to_le16('/'))
-			rp_name[i] = cpu_to_le16('\\');
-	}
-
 	rp->ReparseTag = IO_REPARSE_TAG_SYMLINK;
 	rp->ReparseDataLength =
 		cpu_to_le16(*nsize - offsetof(struct REPARSE_DATA_BUFFER,
@@ -1142,9 +1137,16 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	 */
 	rs->Flags = cpu_to_le32(is_absolute ? 0 : SYMLINK_FLAG_RELATIVE);
 
-	memmove(rp_name + err + (is_absolute ? 4 : 0), rp_name,
+	sub_name = rp_name + err + (is_absolute ? 4 : 0);
+	memmove(sub_name, rp_name,
 		sizeof(short) * err);
 
+	/* Translate Linux '/' into Windows '\'. */
+	for (i = 0; i < err; i++) {
+		if (sub_name[i] == cpu_to_le16('/'))
+			sub_name[i] = cpu_to_le16('\\');
+	}
+
 	if (is_absolute) {
 		/* Decorate SubstituteName. */
 		rp_name += err;
@@ -2031,12 +2033,6 @@ static noinline int ntfs_readlink_hlp(const struct dentry *link_de,
 	if (err < 0)
 		goto out;
 
-	/* Translate Windows '\' into Linux '/'. */
-	for (i = 0; i < err; i++) {
-		if (buffer[i] == '\\')
-			buffer[i] = '/';
-	}
-
 	/* Always set last zero. */
 	buffer[err] = 0;
 
-- 
2.53.0

