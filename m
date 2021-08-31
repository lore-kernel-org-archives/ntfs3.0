Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2BD72
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 18:15:16 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id i28so228864ljm.7
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HeW13tvhrL9w5gUzeL7/FrKd5rvLwTrOT4w/pqdAqYI=;
        b=gXGwAW3ph6ywIS8Sz5jE+FROTf5zxy9FLtAF8gdEQCU88x0F4zTKe6GmlfHoU+uqYL
         7bg9ATTsnSiC+2DcSi8q6dBnNfY0sJbTvPXohDhE7IcGz/nNL+zK2ELfa1UUaXksTMwu
         AXI9v49SXZPQlSwh3gY2g65C+VIPKJTWREAdZqBQ3mLW+F8IPttFsw/i72huSIuE9kD2
         b6wpnHPHRV8NCLdOjADGs59MaNeq3nB4law5rpgXyAyxK8R9sj7i4SLWOmIQ/n71gzZc
         4HrLEGrl2PGAf8O8xu5bTHzmuru3w8pmkcF7AEXKip4rhaKGFOcMncYI7XF/py6uHVxM
         lYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HeW13tvhrL9w5gUzeL7/FrKd5rvLwTrOT4w/pqdAqYI=;
        b=YdKi3siOAgVS0jl1WXiqwqotTIUpBj+AdTpMPR4+4hzpYqIVa5iqll6cAfingIc70S
         +phM5HqgGtZLRXrMC6Sg44tM909++OOuZRaA47fPhQ2NnnHe25d+pL5yODFqT8HfkmLr
         /usO6C6964mjiHHlW7goafUMEyaQ12Recto8JYLZ1g60zVn/nvFl1S1iPynblzhicr5Y
         X/xnI/OutW2rSD6wpGnlfbQq1L1y1K84l8lGDRKkgXNyqwbtG8O9XyEVRUpwwyrm0Udu
         5EM+huKb1/4P+tNKUi3/R63SWZ6seaNoN5NCygYYOp0frqyVF3jSn5rLMlK0ev1B2byD
         mBCw==
X-Gm-Message-State: AOAM530OHNFAev3NIupSSeHfCNbiwR1kUlckYWUvZelNdQH1NtN3nDFI
	88XhkUb0CNWIqMDYxav3xg0=
X-Google-Smtp-Source: ABdhPJxewjW9UZrju5EUVd3IeOVLtk2BregE54DcFplZw6qtPBzo0F7AYM26Qs/ppjaObvXxOZmm7A==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr25635516lji.165.1630433714811;
        Tue, 31 Aug 2021 11:15:14 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z11sm2270757ljn.114.2021.08.31.11.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:15:14 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] fs/ntfs3: Fix various styling issues
Date: Tue, 31 Aug 2021 21:15:00 +0300
Message-Id: <20210831181505.1074767-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many new checkpatch warnings have been introduce to ntfs3. These could
have been prevent if checkpatch is used. One thing that worrys me is
that Konstantin puts new code without code reviewing process to ntfs3.
Patch commit message says one thing, but one huge patch address that and
lot of just refactoring code.  Also with review process we can prevent
these kind of silly checkpatch mistakes.

Kmalloc_array was my fault for some reason checkpatch did not show
those. I have no idea how, but I just fix it now and be very ashamed.
You should also Konstantin use checkpatch always before push so you can
spot these things before hand. I will try to get CI going for patches.

Kari Argillander (5):
  fs/ntfs3: Use kmalloc_array over kmalloc with multiply
  fs/ntfs3: Use consistent spacing around '+'
  fs/ntfs3: Place Comparisons constant right side of the test
  fs/ntfs3: Remove braces from single statment block
  fs/ntfs3: Remove tabs before spaces from comment

 fs/ntfs3/bitmap.c  | 2 +-
 fs/ntfs3/frecord.c | 8 ++++----
 fs/ntfs3/index.c   | 4 ++--
 fs/ntfs3/lznt.c    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)


base-commit: d3624466b56dd5b1886c1dff500525b544c19c83
-- 
2.25.1

