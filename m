Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A90672
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 15:36:07 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id y6so17245415lje.2
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lKjtChchih7HsFrFsp2Wwav0eUYrjghrLF4msDPDeS8=;
        b=Z7UIIsxIMIa8H6JfbbY6X99kkXuF2OoWO5QHpcFh7Ug5SqK7C/S12U5tnpRP42Fv67
         jHzdv0hU9cd1TUi4M9ndZWIwOum6YY8vs6Qxff0ky83Fq17lhSaYtsZsCFOHxIOuuz/C
         sweWUlzy4fZnluGYih2L5NzCIRkSnTSEoFUV7MPkY0NY4BD4AYyLZjq6eLwuix/B3l6Z
         9MS3RmNm/sIHFL8s3oh6qZB63njpW2w45UX9Cc8vKEknUUgpOoF/sPXfCruSMMSy8wZG
         4cTLETk0QXAMEJHALQK/SVkumFqzYMCauDlunt0Kmk3p6YXY3jkmrkIFBxWthgL7AXZE
         RODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lKjtChchih7HsFrFsp2Wwav0eUYrjghrLF4msDPDeS8=;
        b=kQN1EpdeQnDAnX2KBiRT9JIgopxfhlOHhwL3C7Z6XZJlfxnQ9IcuUaqXIJgB4Ze/fs
         2suK8QS0S/MvF8dDz7H94HkbeCXJAb6WQZoP9w95vVNCO31ZUS+MZN+3Z49xcAF6EXRq
         0eZJzHysqjzTy7FZH1tJnA5VBZWHVpSQHePiGEfNQ/iWRcs1yRkmLo8gKy5r70S25vLj
         NWBrCT1RV52rSJsQ46h2zU40elQBBvkY5vnATzEceoNdWKaw9xYiHJiheIZAFDxPUwnc
         qCYRbzaX4TvquuuZvn8IjsX745mF2zQC+u5y/sSHzpkZneaGbZJYmM1dVIl9AQ9O0xLI
         SNAA==
X-Gm-Message-State: AOAM533yQY+KYubhrZdkqHlLB+Uk3bSfnrhI2srsKNK+4wzxx3OxTOMN
	CPrgCBUO7ZSVMZuIlRaFQn0=
X-Google-Smtp-Source: ABdhPJzi0tr66ohoRxixztdIhOImTR4jiQLehhI/b3egXBqWdGH9cO59XCULIDxjmwHBvn10eDihYQ==
X-Received: by 2002:a2e:9011:: with SMTP id h17mr15315258ljg.255.1631028965440;
        Tue, 07 Sep 2021 08:36:05 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p14sm1484458lji.56.2021.09.07.08.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 08:36:04 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v4 0/9] fs/ntfs3: Use new mount api and change some opts
Date: Tue,  7 Sep 2021 18:35:48 +0300
Message-Id: <20210907153557.144391-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3 link:
lore.kernel.org/ntfs3/20210829095614.50021-1-kari.argillander@gmail.com

This series will delete unnecessary mount options and rename some.
Also this will convert ntfs3 to use new mount api. In my opinion we
should get this in 5.15 because after that basically we have to have
deprecated flag with new mount options. Let's try to avoid that if
possible.

v4:
	- Rebased top of the current ntfs3/master
	- Rename mount option (no)acs_rules -> (no)acsrules
	- Fix acs commit message acl -> acs (Thank Pali)
v3:
	- Add patch "Convert mount options to pointer in sbi"
	- Add patch "Init spi more in init_fs_context than fill_super"
	- Add patch "Show uid/gid always in show_options"
	- Patch "Use new api for mounting" has make over
	- NLS loading is not anymore possible when remounting
	- show_options() iocharset printing is fixed
	- Delete comment that testing should be done with other
	  mount options.
	- Add reviewed/acked-tags to 1,2,6,8 
	- Rewrite this cover
v2:
	- Rewrite this cover leter
	- Reorder noatime to first patch
	- NLS loading with string
	- Delete default_options function
	- Remove remount flags
	- Rename no_acl_rules mount option
	- Making code cleaner
	- Add comment that mount options should be tested

Kari Argillander (9):
  fs/ntfs3: Remove unnecesarry mount option noatime
  fs/ntfs3: Remove unnecesarry remount flag handling
  fs/ntfs3: Convert mount options to pointer in sbi
  fs/ntfs3: Use new api for mounting
  fs/ntfs3: Init spi more in init_fs_context than fill_super
  fs/ntfs3: Make mount option nohidden more universal
  fs/ntfs3: Add iocharset= mount option as alias for nls=
  fs/ntfs3: Rename mount option no_acs_rules > (no)acsrules
  fs/ntfs3: Show uid/gid always in show_options()

 Documentation/filesystems/ntfs3.rst |  10 +-
 fs/ntfs3/attrib.c                   |   2 +-
 fs/ntfs3/dir.c                      |   8 +-
 fs/ntfs3/file.c                     |   4 +-
 fs/ntfs3/inode.c                    |  12 +-
 fs/ntfs3/ntfs_fs.h                  |  26 +-
 fs/ntfs3/super.c                    | 498 +++++++++++++++-------------
 fs/ntfs3/xattr.c                    |   2 +-
 8 files changed, 290 insertions(+), 272 deletions(-)


base-commit: 2e3a51b59ea26544303e168de8a0479915f09aa3
-- 
2.25.1

