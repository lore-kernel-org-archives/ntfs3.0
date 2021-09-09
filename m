Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE503FF0
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:09:53 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id h1so4351562ljl.9
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AB61zsK+RFLEdyaoe9KR+20N8SgtCfi8JZyiKRinXAk=;
        b=dm0TfN8BgHSqqqVA8lnL7eqFLdStV9hpOtUIENtwBaPaJelVeQD8FrsxB9iMnYGjay
         yyC9P0aLvs1AmIQk6ynvwj4vi5wI9v1MmaGxdKX4R4oeOF2JEI9p1uNjqRzyhzhmo9n/
         U71eXCqRgRDVzs382aOmBOVdJkYmCnnGGkS5opNXKdixs5Q3A4+Vwj9WmUKwEwhG4HQP
         QVGPMwSW14j5LxrZJsPFj+wGlQiSVYpl8dYq92kLL0GgvQD3Tsh7AdIGMCEEGHu48A2h
         rxZOOUSO1TSpRzjcvpRDY/sZZI0dzZBKyeiijvbDPK5SEYTVNHWPqBqeRCjcB+0u81Ud
         whMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AB61zsK+RFLEdyaoe9KR+20N8SgtCfi8JZyiKRinXAk=;
        b=J2pKV6cuhaKDz1oRR1aoQ8HaJJN4a7eZbjeVu1VXsPxMVbI5GmeyZGcZnpi+6O16kU
         ndKy7ux7mjoqEUye53JefWCIYv8ng+vRt/KzY+NvSOB3E6dlZ5T1We+Y0eLPLqnemqYR
         GtYJbqxgz2pwIbGXwA0eIS0newQCUn+urilqz/l3WV9KHAny9AjD98mDApJO2CG4yzUM
         bHGH1cz8QB6MIk3i7p4SyzuTEX/YWYWoB/lKfIySFvjOM9ZkeyL99NV3CjsyZhqTQ7T7
         Lbg/HwfE8jXnctrTUHbMOYGnBupKnvfwi22LqnBftRZXtfkgMeNLMac1+WropR3VXmcn
         BVuw==
X-Gm-Message-State: AOAM532wtrBBFjuewhxI7Qp5GqGlaKzK7vf1zqiH4NLGO/JWUXOwbeTn
	WBtx6vZjfyAwEomyn24sXm0=
X-Google-Smtp-Source: ABdhPJxBD7xsOHwsxthzYDI7T7Q63R6eQMvs8VSCRs4tvENHKqkwTtMJJPEMiLg9XN4JtUX2CD7zFQ==
X-Received: by 2002:a2e:a903:: with SMTP id j3mr911508ljq.347.1631210991177;
        Thu, 09 Sep 2021 11:09:51 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:09:50 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 00/11] fs/ntfs3: Refactor fill_super
Date: Thu,  9 Sep 2021 21:09:31 +0300
Message-Id: <20210909180942.8634-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two first ones are only ones that fix something. Everything else
just take off dead code or make it little bit cleaner. They should
be pretty trivial.

As promise to Christian, 10/11 makes one section cleaner as he
wanted [1].

[1]: lore.kernel.org/ntfs3/20210824113217.ncuwc3zs452mdgec@wittgenstein

Kari Argillander (11):
  fs/ntfs3: Fix wrong error message $Logfile -> $UpCase
  fs/ntfs3: Change EINVAL to ENOMEM when d_make_root fails
  fs/ntfs3: Remove impossible fault condition in fill_super
  fs/ntfs3: Return straight without goto in fill_super
  fs/ntfs3: Remove unnecessary variable loading in fill_super
  fs/ntfs3: Use sb instead of sbi->sb in fill_super
  fs/ntfs3: Remove tmp var is_ro in ntfs_fill_super
  fs/ntfs3: Remove tmp pointer bd_inode in fill_super
  fs/ntfs3: Remove tmp pointer upcase in fill_super
  fs/ntfs3: Initialize pointer before use place in fill_super
  fs/ntfs3: Initiliaze sb blocksize only in one place + refactor

 fs/ntfs3/super.c | 121 +++++++++++++----------------------------------
 1 file changed, 33 insertions(+), 88 deletions(-)


base-commit: 15b2ae776044ac52cddda8a3e6c9fecd15226b8c
-- 
2.25.1

