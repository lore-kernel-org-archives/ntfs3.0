Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E472
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 08:34:48 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id t19so18009193lfe.13
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N5jiyAdNFgY4dKiWyQrmXOrxD937CdW4dp/ur4Sj9c4=;
        b=BlQmzjVmTKLmSrVOnikqaOe0A/FKEnJM3rFhecCtOdgIKYpDjjEBh1zx+Jeq2jaHuy
         HEpndfDjUkP4Q/bwSlSuZfm6+jBjWWty1Aoa5/3PJ3DCTqxsShc5wmPWPdIsbLdUnXmT
         z5BbxjQkpk2CPbOwRH8N+FT6cSxCkvQr2jopktD4SXq+hwqmJUOqrzeI8DTngadcFAhR
         6LLGXeTPWB4cfp6bzbSX3ea+jFjLiwTjCU4SRbib2sdAJ9xYSl/yPQmWppe4wF8zcWvQ
         JSPtjw3PrJ4XZXg3bF8AFhJ+oGLXe91SRx4VeQXBxQLE4EYhAn0OHuoOeCmycHrGfWvU
         hAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N5jiyAdNFgY4dKiWyQrmXOrxD937CdW4dp/ur4Sj9c4=;
        b=bZYpXcavDJmiRQgT0KYB9uPKDz/pocB0MdsxtD/kl+DEdMjwdKfV7rYg3NN0aKZqeV
         qlHdrXAf2SubRsx5cClB0mdXSrP2KN+ot8jaTz3jdgqPCzpesNrcri9E/G9l5aqoZSrl
         Mge2y7+A2RAZzPY3ZvBafZsYMtrMnvl1szAb/cU9B38JPrlHcWAlCLFQlhVFzgxIfx7O
         foL/YXr2JVskFkFfC5j9/ADVgkCA/82dTrKWcWoYKzf2DcxxwVQP0T+T2fg9gFxBOwQN
         1MyjXX0OywYZKd4rgoa43yFKp0ZtbSsW/HvQSL6cTEST8+pNj9on+gTiuSEwR72Ax0UB
         quVw==
X-Gm-Message-State: AOAM531BDFVOR/U1D308GMREkbW14Cq9xVZ90WKtAma7rmINl/NeC42q
	iPD4z5Wp8wG62/rdOFc2JiI=
X-Google-Smtp-Source: ABdhPJzrMwAvsjOXzbEsId4NE3ssWmqDEu6qRo7UrT83m2EbLwX96UaOC3dYuA4wNMOgQTpvo4Fy1Q==
X-Received: by 2002:a05:6512:3da2:: with SMTP id k34mr12272632lfv.260.1631003686539;
        Tue, 07 Sep 2021 01:34:46 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id q30sm944771lfb.155.2021.09.07.01.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 01:34:45 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v2 0/4] fs/ntfs3: Fix various styling issues
Date: Tue,  7 Sep 2021 11:34:37 +0300
Message-Id: <20210907083441.3212-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various checkpatch warnings. There will still be some but they
will be addressed in different patch sets.

v2:
	- Remove + sign completly in 1/4 (Thanks Joe)
	- I dropped one patch as it addressed else were [1]. (Thanks Joe)
	- Drop newline in 3/4

[1]: lore.kernel.org/ntfs3/20210902154050.5075-1-kari.argillander@gmail.com

Kari Argillander (4):
  fs/ntfs3: Remove '+' before constant in ni_insert_resident()
  fs/ntfs3: Place Comparisons constant right side of the test
  fs/ntfs3: Remove braces from single statment block
  fs/ntfs3: Remove tabs before spaces from comment

 fs/ntfs3/frecord.c | 7 +++----
 fs/ntfs3/lznt.c    | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)


base-commit: d3624466b56dd5b1886c1dff500525b544c19c83
-- 
2.25.1

