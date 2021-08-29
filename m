Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2A472
	for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 09:56:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id m4so20067153ljq.8
        for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7dy64JCm4INpSzM1TYkFxB4+j6CWHYLWvpVuPYin1b4=;
        b=RtWjFJVSa5qOrZW9iG2JrOrwqnCEKjZu+fBipcNcPQFfxKmoeS/SpkUe6kz3mgChEL
         MUxEjZ0RMYbl5aheIyjbh/GYtZoY9Yu6Y6JgZ2iWoZVB9fRaLwCIdMbD+uRtVit4oHtJ
         zQgMdxsyG+qQqztBuLo5mcf2HCKuoTX2aUV8AqVqXGmI1lNgLRk2kkXGCxoWQufESVYf
         1lIbkYH53XdHS3/1ZgOCWosto56zqZyf8974NL14xa27sAQr3E3gs8cTOgl/G1/u7BSi
         ZDDRSrJZZlkwuUIF39q5kJ0C9dskPeSc6xubhfmHm3EYRge44xX6/JlYWD/Y3zlrIIjs
         0uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7dy64JCm4INpSzM1TYkFxB4+j6CWHYLWvpVuPYin1b4=;
        b=MFlMvKSonGddNcPeF6aCs7TYndfkw+2MOF/VOFDX3CLh5LBn5VYNZgnjCb/pFOFvwA
         dpARRZHHlWigCC5mHTGN9HpGR9csnUr00BLPUKXJyl436TjxXooF0YIFZHRZlDoh+my9
         rYbuKdq0AK5M0cYlHnZkJjs6xhb2oayKZl0UomtUA8nou7ejxHpXy5mdh7Ii9anmct8K
         1addWUx7oE32z26P6fXpuZrRs9Xenum5x2VJDMBvfHZPKhQWQln3XHqcJDVBs+zgbVBa
         2gaZTsAHC6awx96Ulo8RKKRYx/pLgQZFOGykmjnZ4UGMZpfRL+O4Z2TNYnNnPRyfRgLv
         Pg6Q==
X-Gm-Message-State: AOAM531Mb2SxteW/X6128Hk2Qzz8hAbhHVizsezKLWME1VrL3nKEOBoV
	0lswrnZLSTPFDrqKa1Z36Og=
X-Google-Smtp-Source: ABdhPJxKmCxSQAzOdeFdxNjx4kUhgBUQ1ddvBNDA8SnKZlaTSMKkuvvbtlJ6JP7kxoaS3gMPKnqNyw==
X-Received: by 2002:a05:651c:113b:: with SMTP id e27mr11513416ljo.6.1630230989518;
        Sun, 29 Aug 2021 02:56:29 -0700 (PDT)
Received: from localhost.localdomain (37-33-245-172.bb.dnainternet.fi. [37.33.245.172])
        by smtp.gmail.com with ESMTPSA id d6sm1090521lfi.57.2021.08.29.02.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:56:29 -0700 (PDT)
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
Subject: [PATCH v3 0/9] fs/ntfs3: Use new mount api and change some opts
Date: Sun, 29 Aug 2021 12:56:05 +0300
Message-Id: <20210829095614.50021-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See V2 if you want:
lore.kernel.org/ntfs3/20210819002633.689831-1-kari.argillander@gmail.com

NLS change is now blocked when remounting. Christoph also suggest that
we block all other mount options, but I have tested a couple and they
seem to work. I wish that we do not block any other than NLS because
in theory they should work. Also Konstantin can comment about this.

I have not include reviewed/acked to patch "Use new api for mounting"
because it change so much. I have also included three new patch to this
series:
	- Convert mount options to pointer in sbi
		So that we do not need to initiliaze whole spi in 
		remount.
	- Init spi more in init_fs_context than fill_super
		This is just refactoring. (Series does not depend on this)
	- Show uid/gid always in show_options()
		Christian Brauner kinda ask this. (Series does not depend
		on this)

Series is ones again tested with kvm-xfstests. Every commit is build
tested.

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
  fs/ntfs3: Rename mount option no_acl_rules > (no)acl_rules
  fs/ntfs3: Show uid/gid always in show_options()

 Documentation/filesystems/ntfs3.rst |  10 +-
 fs/ntfs3/attrib.c                   |   2 +-
 fs/ntfs3/dir.c                      |   8 +-
 fs/ntfs3/file.c                     |   4 +-
 fs/ntfs3/inode.c                    |  12 +-
 fs/ntfs3/ntfs_fs.h                  |  26 +-
 fs/ntfs3/super.c                    | 486 +++++++++++++++-------------
 fs/ntfs3/xattr.c                    |   2 +-
 8 files changed, 284 insertions(+), 266 deletions(-)

-- 
2.25.1

