Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04F83FC1
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:36 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q21so4566917ljj.6
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L2qC6irbQbtN+g0+v1wnhPSc9BwrkkXerk0d5qG4QOc=;
        b=I8+ZexOjMnWdmPQaRlQA/OHfiqAkzLoeBoQZBqAq40UtxhDNdiJ0RzK/0Uk7xQVuk4
         sUAXajs9EtiX7Jz+nIiPklFdc8mh1fzHxZDa5WojWgi6MI2mO69Z3TUoFaS+I6E8sdTA
         bYbQ5KrcwEZ85BPCG4zUlNPUtWEdkRxxrbCKJeme9QefIOS0jB/XXM8kMLNTMBhKfpQt
         bqK6Rrs6MNhKexRw4FhTE11SOxxfRbLr5r9h+oENapG2ABYbxPYgg9cn+FHruIbe86Zg
         QHSHtahDjYLByXE7lDRlgDdUupspyqxXeu6APpOoUqKAM29g6hyBnCbm5cvIrRXduAy1
         1E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L2qC6irbQbtN+g0+v1wnhPSc9BwrkkXerk0d5qG4QOc=;
        b=iaXKkm92UIdTFp7VTgt2kzgJGIQ2TDQHu8rD02ZJyu5iElDMlhh9RVhO6pmuOnxOy4
         LaAb3MDyY8nhiuKc9nzvr+0TWD7gY8h6ndZR1qRjGSbzOqDFpq6KOThiA6BBXKh0+RJf
         JDf0Xf2C2ekBP1X7ND7yKOku1rbAwjRzPSwXxdH27a9Xg+1SGTVt+8cZ7rX+pzRATQXb
         qpwg+e2TqXZHTWc/+2gn/BIN7JtXQXL8UoIoTDBN5r3Zmttu6rsPQp7PJsj/Ov36zvUB
         YQrfc98jiTEFR1iqsGBmmctNuk+sSYuvrcShVagyZ53AvAEs2N7lB/yTOOtqhKYt7wek
         JH6Q==
X-Gm-Message-State: AOAM531TzoKIY9kvMNFMXtRiqbrYpI4cISW1ebiAf08lzs/Ocyvrc2s5
	1ODBg/MuhtwIGT8MgmvpQQD21NB32J64aQ==
X-Google-Smtp-Source: ABdhPJzBuEQRUhVbd2nKi1QmDqdsN2U9cy82Wmv53cJKKdNhYQlOoIC2YmQLe1WZHnCYeLq5/JTzGA==
X-Received: by 2002:a05:651c:10a3:: with SMTP id k3mr3216248ljn.471.1630599334984;
        Thu, 02 Sep 2021 09:15:34 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:34 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] fs/ntfs3: Refactor header includes
Date: Thu,  2 Sep 2021 19:15:20 +0300
Message-Id: <20210902161528.6262-1-kari.argillander@gmail.com>
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

V2:
	Add missing first patch
	Rebase
	Use base-commit with format-patch

Kari Argillander (8):
  fs/ntfs3. Add forward declarations for structs to debug.h
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
 fs/ntfs3/debug.h                 |  3 +++
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
 23 files changed, 62 insertions(+), 57 deletions(-)


base-commit: d3624466b56dd5b1886c1dff500525b544c19c83
-- 
2.25.1

