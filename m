Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C042FAF
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:14:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id x27so38902027lfu.5
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kd9hSFQF1FANNkmj2prEeUy+eH+yNiViZuvtA7HLfFU=;
        b=UJZPKprU1aE2FjXAdzOkeK0Rr5YVf3H7Py4YbXFgukwBaxx3a5YR8JMSWrWegs5sRE
         YQVd3Au4NT6LLBoCBDBuRXl4cYvS0Jefcaj/Dkl0wc7q9oB+/kxV04vHC01f7Ugje0Po
         l40tE/u8csAAlnJi/OizrgilY5i4Yvx84EYinufp+Svuu2VXn94SD0ecUWG+Qqo6BPu/
         4QcNoPLh79Uivr4JzP9OR+UFZUbIcr+vDN+657bsalnqR+XZYwqGDXLJvfVDC4LIgUg9
         wb+786zCr03DS3E5yxbAE8VOf2EONaxNjX/jjgrJtD4oZB4Hre6OJNi7fyZka0FX3YcA
         Qpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kd9hSFQF1FANNkmj2prEeUy+eH+yNiViZuvtA7HLfFU=;
        b=s4VqrdquYglbaF7hQE4gACtPRlK18MyACQWt10q9DvxEa8hyoZlNNxc7XPv6BYwhwQ
         QwzN8wxD1KyjaTPElVg0/5xj092DVhS58ZU4+LZsDN3+Na/6A6IEqeQFdFQiibKEjdWn
         /H0sDRAUj7F6C8LrGQepU9BC/uSU04gsosVXsv2og8NLOcrCCvg3Ea14sEYzrsNPpJwk
         4QzOlSwP8QA6FcvwGsCNdq+mADt3cGZ0ZqBusEjt0RVWmGn/eDJnoAbvd5QSSyk4w2IM
         pn9+zRzM34tz2+X2kxp1v1+i3y3d9P4H7DaqiP2ByWLuAxhAHgaEI67B+7GZSYJ775d9
         Rdog==
X-Gm-Message-State: AOAM531INuJiR/00l388ikH4g/QUDdVMtayC/0aU5O+U8Owjo4/y/XnM
	/VI0N+CdqZQaNDrksHdVnww=
X-Google-Smtp-Source: ABdhPJzB/X88QadQ8KYfQuHgh+2/QLwgm6t0jJpldIGyASZQeizCXOwiGGZAHRrPqzE5WbO4ey0nxg==
X-Received: by 2002:a19:5e0e:: with SMTP id s14mr22213942lfb.534.1630419295749;
        Tue, 31 Aug 2021 07:14:55 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:14:55 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] fs/ntfs3: Refactor header includes
Date: Tue, 31 Aug 2021 17:14:27 +0300
Message-Id: <20210831141434.975175-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now header includes are big mess with ntfs3 imo. We cannot example
include ntfs3 headers without need of punch of includes to source file.
This patch set try to address that. When this patch series is applied we
can include any header file without need of include anything else. This
does not mean source file should rely what header file includes. Instead
it should include them by self also if it needs them.

When some include is added I have write why this is needed to commit
message. Hopefully this will help when someone wants to correct them
again. I have also just delete unnecessary headers from some .c files
and not added what is needed. Usually deleted headers where there
because ntfs_fs.h need them not file itself. When file was simple enough
I added all necessary linux headers.

I did not add linux/headers to all files yet. That is big job. This is
good starting point. I did try to build every file itself so this will
build like it should.

Please do not hesitate to tell if there is something wrong with this
series or somethings could be done better.

Kari Argillander (7):
  fs/ntfs3: Add missing header files to ntfs.h
  fs/ntfs3: Add missing headers and forward declarations to ntfs_fs.h
  fs/ntfs3: Add missing header and guards to lib/ headers
  fs/ntfs3: Change right headers to bitfunc.c
  fs/ntfs3: Change right headers to upcase.c
  fs/ntfs3: Change right headers to lznt.c
  fs/ntfs3: Remove unneeded header files from c files

 fs/ntfs3/attrib.c                |  5 -----
 fs/ntfs3/attrlist.c              |  3 ---
 fs/ntfs3/bitfunc.c               |  7 +------
 fs/ntfs3/bitmap.c                |  3 ---
 fs/ntfs3/dir.c                   |  3 ---
 fs/ntfs3/file.c                  |  1 -
 fs/ntfs3/frecord.c               |  3 ---
 fs/ntfs3/fslog.c                 |  4 ----
 fs/ntfs3/fsntfs.c                |  1 -
 fs/ntfs3/index.c                 |  1 -
 fs/ntfs3/inode.c                 |  2 --
 fs/ntfs3/lib/decompress_common.h |  5 +++++
 fs/ntfs3/lib/lib.h               |  6 ++++++
 fs/ntfs3/lznt.c                  | 10 +++++-----
 fs/ntfs3/namei.c                 |  4 ----
 fs/ntfs3/ntfs.h                  |  9 +++++++++
 fs/ntfs3/ntfs_fs.h               | 31 +++++++++++++++++++++++++++++++
 fs/ntfs3/record.c                |  3 ---
 fs/ntfs3/run.c                   |  2 --
 fs/ntfs3/super.c                 |  2 --
 fs/ntfs3/upcase.c                |  8 ++------
 fs/ntfs3/xattr.c                 |  3 ---
 22 files changed, 59 insertions(+), 57 deletions(-)

-- 
2.25.1

