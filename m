Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA072
	for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 01:07:09 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id f2so1981711ljn.1
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=No1ueEPq13uKyGqP0e28JzryE/lBIDaao/VGD9U1Tfo=;
        b=OlTYb1XQwh15N2yA6ZBIWwIiJIx/kZhBbsbCc5iPCB8+u2SuLEIf4xSrwIKojocvoO
         HrAdE3RumNFOC8DeVNFaiTn/elj5yD9O+Gl2fo3NAVKyKm02KvxlDxf+YpY23+WQyymE
         EoLQ+GGhuR+BFEMYD+MBznfi0+t/pKrCdStTmNL63owb9IVTXNW5CiYdWlwKr3ErjxsT
         os9uZ4XmFFSaDLgt9zsfJMVDPFH6VvYXYRO4pfWPeyY14kTW2J+dneAH0Ap4I/HR0pYJ
         WIDLTnhB3DHMZkRqnniznKZhLGX3omLdLZ8hNzervtwE7ypr+wT992ebHBgLUDVbDsml
         eNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=No1ueEPq13uKyGqP0e28JzryE/lBIDaao/VGD9U1Tfo=;
        b=IeC+Hd4MnKe583Dwn8Hp1LYX84tmGFcGO3WJafdLa89T3LuZ9HtwMBSYPxRfTT3FXd
         bRQrR7ixdKUU4ekPx47wYNmGfgSG09SyK+i31KZjEUZb1U5bA5w5bMZ85+q00yYo28Y+
         KDkKVkicx2GaQpn1Du0/+AQYFU4F/t9DDzbqHO/xiN3YG/5kpEBoCHhOfr3WovZ9HGoP
         t9ClYMo0PHZ7A1z9Rikwkaz0nAE7SyVSFDru1B03zIrXFimZ1Uf7Cm3fuJtpnBIAryQi
         XNyCy/zBha0qqfx9+q0/SatC5UeWOgFi+i2ZHbuKPWevc11tOR/UPq4c/O5O3HSwQtFa
         VNhg==
X-Gm-Message-State: AOAM530mreNeXrU9+4o+MIWhnjPRtl3yF5x4+CP7Izf8GPDMN8x/KkHE
	njOl6omFWbdbTNQkfGeiHq4=
X-Google-Smtp-Source: ABdhPJxJ0f8M0TON9cAH1rASqjGV0jYrBib6o6ptZhvjqR+FY4flUIoGvINCAR3wRc55ugQozp2XSw==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr5505544ljm.254.1629248828068;
        Tue, 17 Aug 2021 18:07:08 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id j4sm400245ljh.120.2021.08.17.18.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:07:07 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v3 0/3] fs/ntfs3: Use kernel alloc wrappers and fix warnings
Date: Wed, 18 Aug 2021 04:06:46 +0300
Message-Id: <20210818010649.412912-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ntfs3 driver there is allocation made like this ntfs_malloc().
Patch 2/3 will converter these to kernel ones like kmalloc(). After I
did this then checkpatch raise warnings about array allocations so I
fix these in patch 3/3.

I also notice when I made patch that there is broken utf8 char so I
wanted first fix that because it raised some warning in my editor and
did not want to "break" patch 2/3. So patch 1/3 address that. I did
try to apply this and it seem to work without issues.

v2:
 - Add patch 1/3 because I found broken utf8 char in source file
 - Add another patch 3/3 which will fix allocation warnings
 - Rewrite some of commit message from first patch
v3:
 - Patch series didn't have X/X numbers
 - Cover letter didn't have fs/ntfs3 in it
 - One kmalloc was converted to kcalloc insted of kmalloc_array
 	Thanks Joe Perches

Kari Argillander (3):
  fs/ntfs3: Fix one none utf8 char in source file
  fs/ntfs3: Do not use driver own alloc wrappers
  fs/ntfs3: Use kcalloc/kmalloc_array over kzalloc/kmalloc

 fs/ntfs3/attrib.c   |   6 +-
 fs/ntfs3/attrlist.c |  10 +--
 fs/ntfs3/bitmap.c   |   8 +--
 fs/ntfs3/debug.h    |   7 --
 fs/ntfs3/file.c     |   4 +-
 fs/ntfs3/frecord.c  |  28 ++++----
 fs/ntfs3/fslog.c    | 172 ++++++++++++++++++++++----------------------
 fs/ntfs3/fsntfs.c   |   8 +--
 fs/ntfs3/index.c    |  54 +++++++-------
 fs/ntfs3/inode.c    |  10 +--
 fs/ntfs3/lznt.c     |   4 +-
 fs/ntfs3/ntfs_fs.h  |  18 ++---
 fs/ntfs3/record.c   |   8 +--
 fs/ntfs3/run.c      |   8 +--
 fs/ntfs3/super.c    |  20 +++---
 fs/ntfs3/xattr.c    |  18 ++---
 16 files changed, 188 insertions(+), 195 deletions(-)

-- 
2.25.1

