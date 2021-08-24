Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC93FC1
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 18:37:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id y34so47438880lfa.8
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cwbm0dtVbTskGDHM6fDYi7+zCShasPxmbKd2QwmHNI=;
        b=UBPam4ErsN9K2v4R2gZdSjQ6cNCfpfbMS1Nh+CViIHsg21KeFVKbDR5HaQuBfBxkVJ
         X5ocneg3CQVaQDYxiSlsxT0t5xNgnpc2DJybMxFHOe4XG4c2JOnPs7zQtl6CTyj/9LP1
         Tvo+zbzXuGLXYAnGk1jwxccvRikoQnt/g2QrAaTFiIe+y7uhVU1XwjCKmTXRMs5GO5g1
         wuUwZYRZ9kHp6rY2nG0QDOx6rkD18skJdle/C+d0Xc5ehIKKzrJ+NfJBxql/ZCLNEzLs
         kWWBnoL6WRaJGe0X+LCwuOCyT6Sl+9s1KgRSZCjgh4/Kl2PMedI9QCY6gNaFYPXFNO0B
         CFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cwbm0dtVbTskGDHM6fDYi7+zCShasPxmbKd2QwmHNI=;
        b=sXivu5vS946eSyhPp5WtewODoDPAzb4JAqOS9zgfhhf4HxwNYN5zyMuGldAJVrXSTB
         jIdcSeR6S9tEmJpfb4LgJTNcMDHvYcyKNufiEJwxgmrBAtPxfoldx8ZE/5/sTXUqlFNm
         Q0u8sLnBvO6U+Zb5s4ZLff1xR/V5v7J+6EW8cysV5grnWQ4pkzBeGBKxgiEEyVxr+1OR
         Ppq0I3vDtpn47SDS/LVhFMEgYkDXo56RWlFH5QAfGlskiqBL8mzA/co/vRz6Y/TW/Ptw
         DKfDXOdfNvmpUpBGRVtE08Grkkt6R4tLcR+QxT3gMb22WpUo/yOqAp0QROTegYMizKtL
         72wQ==
X-Gm-Message-State: AOAM532uQMvPsP4hAKHIiSysZP5fcGsgjfo08qvF2tYdgsuykLEEgO8t
	WSMPo8EfCEHq4f7QF5b1SLQaP/xPP6RN2A==
X-Google-Smtp-Source: ABdhPJzJAo3KMmDx+Ar7gi+3SNs2Lu5FPjuJg1/ruzsod3SLQKDSaGxJAgANpEvQ9t9IGbRmk6b+FQ==
X-Received: by 2002:ac2:5b9e:: with SMTP id o30mr4391440lfn.400.1629830234563;
        Tue, 24 Aug 2021 11:37:14 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id k13sm1826378lfm.168.2021.08.24.11.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:37:14 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v4 0/3] fs/ntfs3: Use kernel alloc wrappers and fix warnings
Date: Tue, 24 Aug 2021 21:37:05 +0300
Message-Id: <20210824183708.1008538-1-kari.argillander@gmail.com>
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
did not want to "break" patch 2/3. And because we are editing comment
then make whole comment block clean. So patch 1/3 address that. I did
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
v4:
 - Wrap whole comment block in patch 1/1 max 80 char. And restyle.
 	Thanks Christoph Hellwig for noting this
 - Add Reviewed-by: from Christoph Hellwig to patch 2 and 3

Kari Argillander (3):
  fs/ntfs3: Restyle comment block in ni_parse_reparse()
  fs/ntfs3: Do not use driver own alloc wrappers
  fs/ntfs3: Use kcalloc/kmalloc_array over kzalloc/kmalloc

 fs/ntfs3/attrib.c   |   6 +-
 fs/ntfs3/attrlist.c |  10 +--
 fs/ntfs3/bitmap.c   |   8 +--
 fs/ntfs3/debug.h    |   7 --
 fs/ntfs3/file.c     |   4 +-
 fs/ntfs3/frecord.c  |  42 ++++++-----
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
 16 files changed, 197 insertions(+), 200 deletions(-)

-- 
2.25.1

