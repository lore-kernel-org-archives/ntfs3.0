Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C372FAE
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 02:48:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q21so3439907ljj.6
        for <ntfs3@lists.linux.dev>; Sun, 15 Aug 2021 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ek7ku5pzAIW7bPVgrzyzxLQzx4qAfj45w3UfCpvp4ME=;
        b=Z3+Q5Wh28hwoZquCVOlPnqqEayj53MCAaun+CHrQmpaUcSeuQ6HPahzkA1ehgNkZEU
         elUH8JKQRedtvoSvntnl1ZGaYmklZ34ymRe5nsu213pOwWWToTqOgwiqg9D2iJyfV3+I
         SUpXk/1r8n7wy9hO6IdcNmkxokmuKf0ud+WYzHr99dedYFAlHbllb5uW6rSYrgV0Kg1f
         4OOjGDbuU5RUfQohLkSHsoxsx9spJANWLLFH42H2qGAFLKnmlbpuIRgdYjxgcmi/l90P
         VXje6nqKebD11U9j9urEL6hSzILH9XfCTMur/6uRcEnrgq4pMYKcP+jYpXcLxegjk6TV
         bvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ek7ku5pzAIW7bPVgrzyzxLQzx4qAfj45w3UfCpvp4ME=;
        b=J1rGA3vxygFAHS9Y9y8YTWk6/5lzvexLtY5iYQCrE7Kb1Pkmj/2NjI+/SzA6fts1CE
         GcAA5RFYzc72cltjpxP/lcnkgoROJx+Z6FTy7BJ2fNJbaivo6U+93+FClcK2X4Dn0Ji6
         n9+54PBV79+SOpwLQTccnDKTnjxZSL33vwag0Qj5/OP07pFB3EnpbEIY0C14I38XP4Aa
         H5223gMMyAv0t6P954NsXBL4vh1++jzQPbpN+cJVYgCm40L6EhWtRjtRIgjomsoQwRqS
         xXVf7g6ikiOZtqgQu4u7pjQLNJPlATr1pZVyMO1y8qsaXt0MMAxkd9bPDMfCyucIhBg0
         LXcg==
X-Gm-Message-State: AOAM532/Zyg0IPeE2mbfe4EkIAZe3jqdWbTzgmUCmBELETT3Dx/3jOIF
	43o51whUuo1BepCfUNHCfuM=
X-Google-Smtp-Source: ABdhPJyFZh1QCZx/JQlCBWRfNvOjXF3gHZGMYx2/0YB1v6Nt/3Fl9TI6zNovVKHrlnk2QZtWaHPwJQ==
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr11206844ljn.139.1629082094650;
        Sun, 15 Aug 2021 19:48:14 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id b12sm425392lfs.152.2021.08.15.19.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 19:48:14 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: 
Date: Mon, 16 Aug 2021 05:46:59 +0300
Message-Id: <20210816024703.107251-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Date: Mon, 16 Aug 2021 04:08:46 +0300
Subject: [RFC PATCH 0/4] fs/ntfs3: Use new mount api and change some opts

This series modify ntfs3 to use new mount api as Christoph Hellwig wish
for.
https://lore.kernel.org/linux-fsdevel/20210810090234.GA23732@lst.de/

It also modify mount options noatime (not needed) and make new alias
for nls because kernel is changing to use it as described in here
https://lore.kernel.org/linux-fsdevel/20210808162453.1653-1-pali@kernel.org/

I would like really like to get fsparam_flag_no also for no_acs_rules
but then we have to make new name for it. Other possibility is to
modify mount api so it mount option can be no/no_. I think that would
maybe be good change. 

I did not quite like how I did nls table loading because now it always
first load default table and if user give option then default table is
dropped and if reconfigure is happening and this was same as before then
it is dropped. I try to make loading in fill_super and fs_reconfigure
but that just look ugly. This is quite readible so I leave it like this.
We also do not mount/remount so often that this probebly does not
matter. It seems that if new mount api had possibility to give default
value for mount option then there is not this kind of problem.

I would hope that these will added top of the now going ntfs3 patch
series. I do not have so many contributions to kernel yet and I would
like to get my name going there so that in future it would be easier to
contribute kernel.

Kari Argillander (4):
  fs/ntfs3: Use new api for mounting
  fs/ntfs3: Remove unnecesarry mount option noatime
  fs/ntfs3: Make mount option nohidden more universal
  fs/ntfs3: Add iocharset= mount option as alias for nls=

 Documentation/filesystems/ntfs3.rst |   4 -
 fs/ntfs3/super.c                    | 391 ++++++++++++++--------------
 2 files changed, 196 insertions(+), 199 deletions(-)

-- 
2.25.1

