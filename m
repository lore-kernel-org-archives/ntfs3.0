Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935043F9CD
	for <ntfs3@lists.linux.dev>; Mon, 29 Jan 2024 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551240; cv=none; b=Yyd6ePoHO47AKaKoBRwwvL5QpaEzhIut+5ZLop+zVQrMWr1s4buhvE+CA47g6l0n/b3mv0dIJLAZSyqtXKlfQ5XyNjpyRBMbQq7mZZDeRFT67XMx+BoIPZE1riRzFyxAiU16kCSbidRjUEhRyhA6rbghG5aRcEr7s5BhKuJpeIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551240; c=relaxed/simple;
	bh=8dnqni1i0A26L48rcT03UdEc1rRuCmcmNOl+uBBBp6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lnp04SACBoRwgy+CpuHKWNoQCTCEuspxDe4xGqFYABCqAdtg1k2BZFtcVInrPDHCQJTyJVX5R+8YaZmqzVkE6Ak59nTyfBY3wK1M/TJfNV+rcvvmiCGZUjIKODykCbH/QDtwFqttR6gp1uAr+TjF7sfOKWop7ZxYlOsXL9JXGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=lUhgbhNn; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="lUhgbhNn"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AEFE43F5DA
	for <ntfs3@lists.linux.dev>; Mon, 29 Jan 2024 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706551233;
	bh=8ZF26zqFi961N4xCf2xSg7p646IkBT56MWEZW1L3RH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=lUhgbhNnSh1/5UrV6sWqroFL0wfq/OtZw8tNd02P6MB44s4cjjzTgkobx1Q884P2v
	 U5AFORRhkCg74sp8vD59qyPXa7apVYXJWGNzB9ut4EX3PwYVxVn7pjS/z9R7lJ4mY+
	 6H9xqhd7gnk0L7/Bzm1SROPgVtCPbVF6SIZ4qEGo1SuWSFO+eYOvkKCnqT0+5+fzLa
	 6K0+alJa3K4+C7NTpacJtaEoSVZBicTsGwRCVHcEykQImUh6eCZgDwfGnr4std+zK+
	 r7P8xamcw9a/XOx8Lf9Yejux3PfR2qb0T+h+pKYPWhThkOW5R1XRYaiNlOgVvC+VN2
	 jGXRopbO9rgCw==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a357c92f241so85201866b.0
        for <ntfs3@lists.linux.dev>; Mon, 29 Jan 2024 10:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551233; x=1707156033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZF26zqFi961N4xCf2xSg7p646IkBT56MWEZW1L3RH8=;
        b=ut6zmYTnuRLDCWpPB6fqNNzos0caJMToQBqvc9QWC+wfhlDCQinRtBQ9nDxis7+dwI
         vL2KmC5xwOEMRncgRi5Mg4qK5STOnxWh9iIE0PVzi7R3brHzy3TAjC0NBcoOsbkEGRMM
         spYtl+j2QUwVwPeyXLULPLDt4CLusFF/SaUUbxcRQNA4cmI7fL1o5CMtqYfgJma6x1ks
         kYAvX18Veh7kbwI5ELDzqufI8lPLDTgu7qsuR0JB6aC01FnAoAmYhU8oTSfVNYTa/KME
         JyrpyoubSCkiFuPLV0lyrlKjqq72hA4ERZxtYECVxdrxpLzodyOz7OxT3o4WVNoBhIsZ
         eVlQ==
X-Gm-Message-State: AOJu0YyRPSba+ir90APYAl4z5gS2aXHSdqaqDNorPVJTNcm06CwOMz2+
	AY58itabOzMwzUAYFJ5QWn7gJVROQLDs/ep3JCMLmeKtOV1/0qeeX8HnGbvSkaQZMxebmLtnPQn
	Ua6Lfql0bZoLYKTO+Dg+e2SCQIRNWXPPZhZjyjfLqQ6h1wHSQ8XpA1A7ihi1/2hWmXsvU
X-Received: by 2002:a17:906:560e:b0:a35:3ce3:c48c with SMTP id f14-20020a170906560e00b00a353ce3c48cmr4621180ejq.23.1706551233346;
        Mon, 29 Jan 2024 10:00:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6WK2Tup3/s17NUfjas7PhWpttkvWLK15SZRHVDXcx0AkLhE1oarw2KV1uiJddN93c+MQByw==
X-Received: by 2002:a17:906:560e:b0:a35:3ce3:c48c with SMTP id f14-20020a170906560e00b00a353ce3c48cmr4621173ejq.23.1706551233104;
        Mon, 29 Jan 2024 10:00:33 -0800 (PST)
Received: from localhost.localdomain ([91.64.72.41])
        by smtp.gmail.com with ESMTPSA id un8-20020a170907cb8800b00a2fb9c0337esm4147500ejc.112.2024.01.29.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:00:32 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: brauner@kernel.org
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ntfs3: use file_mnt_idmap helper
Date: Mon, 29 Jan 2024 19:00:23 +0100
Message-Id: <20240129180024.219766-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's use file_mnt_idmap() as we do that across the tree.

No functional impact.

Cc: Christian Brauner <brauner@kernel.org>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: <ntfs3@lists.linux.dev>
Cc: <linux-fsdevel@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 fs/ntfs3/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index ee3093be5170..144aa80cca43 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -419,7 +419,7 @@ static int ntfs_atomic_open(struct inode *dir, struct dentry *dentry,
 	 * fnd contains tree's path to insert to.
 	 * If fnd is not NULL then dir is locked.
 	 */
-	inode = ntfs_create_inode(mnt_idmap(file->f_path.mnt), dir, dentry, uni,
+	inode = ntfs_create_inode(file_mnt_idmap(file), dir, dentry, uni,
 				  mode, 0, NULL, 0, fnd);
 	err = IS_ERR(inode) ? PTR_ERR(inode) :
 			      finish_open(file, dentry, ntfs_file_open);
-- 
2.34.1

