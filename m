Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCBE72
	for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 19:38:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id h17so551105ljh.13
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 12:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K/HCxfApfrksSFOOQOfIVwX9Z2BpX2DzBv8+t71Si6M=;
        b=Eld/o6n0HFOBb7Ds+i7p9hSVe7nmy+eXlzRYC47xmheal6g8VOSy7qeiCI2x7tUMd9
         MqzeZx1DYIiwbARNBWC4cXrz3Q2thwYn1ZABYkMGW23tR1hZWdS424lmB/PbzLUF7Bgj
         qtZpRo+/qbXep9PKE1nkNIav/dBWvqtMtWq/hOEC6N2yVicgiTknxeIeft2H3oXFSPrg
         oTscvjoA8Jun7nFvhot/bgaP6P5AR6RzAKlahkKUQMN7NqAzQJxov/FlNdolcXX4XuRG
         ACZ/X8WCJBXnxJ9ZGMKeL1J4Knspq3+alUBgcaClu4bF5Dt+z2IsQoYLqjUYmPyd7bGN
         1GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K/HCxfApfrksSFOOQOfIVwX9Z2BpX2DzBv8+t71Si6M=;
        b=JpxIc8Xu3rM7d0QkTSPa3YWtgoTDaEfI+LU2vNl+dkE/LRYGElrbkHFKz0XVPN1F8I
         AeEeN6bWiOS9tOLWxLvwpbHZZNFrNfuaa6f80OTfYLzJ/zDraXLOwnn6cqovVDMRoISy
         WAfCeseyF+Ako/VWem2gBRWhxWZdmYXjxSCK5bF+Fm7BO8ARxtriDH3/jglYgxbTZHOF
         alsYKyGijwYFwPzpEvi/2tq1oJD/8aHK+dPZqBqY+s7GcE74RyExViEjCC71x9p2db8l
         36JepnWax0Wy4Mme3goRUJjBoA3O9Cz7T2g1VvahSkDW9aqk/P0skKXz3/4IgqI2V6ay
         iFsQ==
X-Gm-Message-State: AOAM533/zNCv1+8HkuLUm6KZ3QM7Dm/+WvPVao370BmlLMDN5yGGLQjs
	6fLnqwE+QFQ3JCRnkxYn1xE=
X-Google-Smtp-Source: ABdhPJw+xYyUw+C0Js4HHisXu0jweb5yYZ29U1zLss2ookmzZkmXWoPOC4zp7AOUGRa8PXjbMj5CNw==
X-Received: by 2002:a2e:711c:: with SMTP id m28mr4512742ljc.247.1629229132458;
        Tue, 17 Aug 2021 12:38:52 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id o28sm99697lfg.238.2021.08.17.12.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 12:38:51 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Use kernel alloc wrappers and fix wargings
Date: Tue, 17 Aug 2021 22:38:12 +0300
Message-Id: <20210817193815.307182-1-kari.argillander@gmail.com>
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
did not want to "break" patch 2/3. So patch 1/3 address that.

v2:
 - Add patch 1/3 because I found broken utf8 char in source file
 - Add another patch 2/2 which will fix allocation warnings
 - Rewrite some of commit message from first patch

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

