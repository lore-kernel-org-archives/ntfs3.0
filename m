Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E97183CBB
	for <ntfs3@lists.linux.dev>; Mon,  2 Sep 2024 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725297606; cv=none; b=uuS4TyTr7bUhIzdrtlw39pT5dy5MQcPV2a2lr44f7jTfAsBLBhxF8Yqp0WkQrxqMXjGkblX3FZujdhNDE6K0w+GBbjkRo5pK4sx8iWI0QmYFCxVdQXJB2nBDoLEbnH7u48GxrsYARtgWUoxaBm+GdPFNLjs17YUvAwZ+xpiEvjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725297606; c=relaxed/simple;
	bh=4Qhsku91lFKJ8KjbB5aFPJSDK9oNgKbdpsT1c9CLkqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/tlLXpIzVuD63jXWLdIbQ8YFr8+WJss2YDBLaevK4/lURJLcPDfxlGbQ+ajNK0AU5EQyJS7kABeW32B/veb6hN+iJnobw/43vkc92kcDPeGioe2KT8KQA11jYQ7CUps55tUwBnriV35KSwF5JIGNlo5xsDNmzCKObed4idQZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGL8gTaW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGL8gTaW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-715abede256so3252051b3a.3
        for <ntfs3@lists.linux.dev>; Mon, 02 Sep 2024 10:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725297604; x=1725902404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tfqQDexu4Vmpn8wv3LnZmio6F6PpZY2ba5RnBulZUU=;
        b=dGL8gTaWky2oKCCR83Wk2CYkyj29F/KlWiWuGZJ7kDF/J6e2uEId1pS+EE4kja8w1e
         +aL3RpAELqpK09s9I7LYl/MF9eJtxSWyGgM2iQAZdcNw6b4oLejGcK0VArxq6/i5iZgz
         d9TFSQfI/7rc/1DZDhhGJOrT7a2TTv4V9ER3rGzFpcygL3ipF11izUp1dRCWVfEY8uzk
         rjF88WN0EO12l5ZtZhhmRoFzqnMxTskowR0lyfD5TrmcZDzzppWQVVqbZjF1Jyt9A84V
         atga8mu4Qwal4tW2muWApRbni1cUwJWbFPadTUkh3iNw+YpUqSKwbf0nYkPL1Zk49/4+
         3AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725297604; x=1725902404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tfqQDexu4Vmpn8wv3LnZmio6F6PpZY2ba5RnBulZUU=;
        b=PH5NMMprlyLjGlOcPOwk3Zel+f0ax/R49/Zqmcv55Er5B8gud3M/uqEAcqrmAF34SU
         cQ5rFPhBl75g3ZfcLOE8EVcGdcMEoLJykLhYZMwXsCRhbGigN8Y70KOOfsuYBfhuff2i
         K2iPsF6O4gdgL/SNcx3aakrNRYzTBlp6A3o0ACHIaQ/QLUFyL9XB5AIqXPQAP+5/anxH
         k/6BVtZyXBcHwbLA1+WAa5whTg3BP6p40/bkCeAXLD4wxPHtL20lbQ+o1l0PQbgOYo+1
         fWzC0UADnGpPtmHYbrq818CufbMIOyMIn+XzV+Tpr5fzZZdkKiTxSPtrgfSstLWnQnva
         TWLA==
X-Forwarded-Encrypted: i=1; AJvYcCVE4IrvbpKUMMY78Obk167QQPtMGqw9TXzEV16VZD5DAkf1Vssaiuhj1W0YmDma6CD9WBsmxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7WwmQDA4DQTbrNpgEUTUu6sH7g+oW9hedTzxkQfW8OPmkKFww
	O5UZkdsePfHHTJItBb1KNRtG9S5tl+irG814ljJh8+fmrhrEb8Nb
X-Google-Smtp-Source: AGHT+IHiDPD5RuKVFF7mAaes5/kv8Ofzqhd+37iBeLG1Tx/crY06VSDQ+QBSi5kzkfUxASSlQlYYrA==
X-Received: by 2002:a05:6a21:3213:b0:1c4:a8a6:a85f with SMTP id adf61e73a8af0-1ced62a2b24mr6259929637.30.1725297603805;
        Mon, 02 Sep 2024 10:20:03 -0700 (PDT)
Received: from diogo-jahchan-ASUS-TUF-Gaming-A15-FA507RM-FA507RM.. ([200.4.98.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575c0a1sm7096907b3a.194.2024.09.02.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 10:20:03 -0700 (PDT)
From: Diogo Jahchan Koike <djahchankoike@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Diogo Jahchan Koike <djahchankoike@gmail.com>,
	syzbot+7f71f79bbfb4427b00e1@syzkaller.appspotmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: change to non-blocking allocation in ntfs_d_hash
Date: Mon,  2 Sep 2024 14:19:32 -0300
Message-ID: <20240902171945.79656-1-djahchankoike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

d_hash is done while under "rcu-walk" and should not sleep.
__get_name() allocates using GFP_KERNEL, having the possibility
to sleep when under memory pressure. Change the allocation to
GFP_NOWAIT.

Reported-by: syzbot+7f71f79bbfb4427b00e1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7f71f79bbfb4427b00e1
Fixes: d392e85fd1e8 ("fs/ntfs3: Fix the format of the "nocase" mount option")
Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
---
 fs/ntfs3/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index f16d318c4372..0a70c3658546 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -395,7 +395,7 @@ static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
 	/*
 	 * Try slow way with current upcase table
 	 */
-	uni = __getname();
+	uni = kmem_cache_alloc(names_cachep, GFP_NOWAIT);
 	if (!uni)
 		return -ENOMEM;
 
@@ -417,7 +417,7 @@ static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
 	err = 0;
 
 out:
-	__putname(uni);
+	kmem_cache_free(names_cachep, uni);
 	return err;
 }
 
-- 
2.43.0

