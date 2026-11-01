Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498242;
	b=tk4oW7XVf1HejCIb4EWwMuIy6TFYhxHbQNyW9SCkqJJyACtFHXko76E0A2d4aRzxAJVT
	 6mRm0rlKC/3UYQJzRHiflK9vBd0C/9JPtWs1Kdi+39tcHOhDT63ryk4IwjjKJXpK73fC2
	 xo2S5STrXfxUj3yjdb/wUt1S2oKGzl5ezps46JFp7gjH/oFE4CqAkJJU4CKU9zYMk4nNp
	 bVkKYjGuWA9U737yw6mCaYxWZ3Pb3c46qt6usjf2Gv7EpzimmDlckYCWNuLw6RWQxJHV5
	 7eHtvs+zDgwDPeQEi6YV3Frh5GecSpF62EkuDLGWxyfqVA2FeQDLpQisccIqA9QNmtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ldhDDTtZAE/3brSKAhksuwsG1IPpe3NESKnYVMmoFBE=;
	b=iQcnMMl6OF40qugBlg+QUzB4urLRvowOrj8BElqWDy9ovLed2uV9NcR1KASbPvHlsf4J
	 exZBhDGYBXGhHafAngdZo7F+FN8UIuPOBKxT3FJPTLi7zZzKn8w3+tzvD4Nl1S1Rq1BW1
	 FsP3FkCMTF5wCUlBJRHkzkKjC0Jk/4avrDaSW9AGzr/38SoP+XHKWM0hQAHE3ezaBwect
	 vhlzlRYwwmzxkiE+edvU9ujRqQ8VRVxHHVWUcRyFWHyPNdLH6ddnaWm+qBrgGovIe5Kci
	 q4W0V5Oe/EkcxxYowe0QR8AO8q2u2jGbGbdJilu2Q0pbTsV7HzpxQfDGgcL0wLbADSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xj7u5GNp;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37081606A325
	for <ntfs3@lists.linux.dev>; Sun,  1 Nov 2026 01:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37081606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xj7u5GNp
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so911629f8f.0
        for <ntfs3@lists.linux.dev>; Sat, 31 Oct 2026 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498240; x=1794103040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldhDDTtZAE/3brSKAhksuwsG1IPpe3NESKnYVMmoFBE=;
        b=Xj7u5GNpcKCX5qA/JkGtkAFDct40tMr6Xp0yTT1GLC0/Bm3LPiexMzEdEWics/YrHp
         zBDWUEcmWnxcesEUYZ9INBUiwgLXjXOZHrSxlBnGHEmj7XvYHsY/H+bdmAkMYtH7o1P7
         xHQ/fOEVoVZSIdjhkatGcbcJfd/ohRUREy4HkOTLKOsyo8AQ9OpaA0PnfiHvhV+scY2R
         rNxveOpaj4CLAFhGAV4JEuHjGj6M4g9XN5qr3GxbrLtY0pWuoA5krpOndZ3J2AyqhSj0
         UQl9Tj1FLMVmmrbMp+WT9Qk1UDemaYKPJrRKze/hWQd5BjTZI1D3CgAImaVojtMWXM8A
         1G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498240; x=1794103040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldhDDTtZAE/3brSKAhksuwsG1IPpe3NESKnYVMmoFBE=;
        b=Ac5knM4m7jer/FDNoRKnBEoFW5QyCFdaVbIpvoLtcSpsv5QvHZwkbrsJP5oNLOYI2T
         UnYnDP9/q0xSpuqHTpuDtMce6r0ZwgzwLbI4ECzWtycYCiheN8t3tvDiAikJ1XD3iEcP
         BYDK/yC3TEbz+d1cBGWwZ43vwEq6uOT6hs6Kpwt8SHQKPqbfMlyfIX/b8UMXGHXFycEa
         zJ9/gbvWLx67E8S4cvhmjXCv52w0600TK8gEWiVvx+yssp487eSaJqH2PS7gK0irY/75
         JeGw2FpwHsxTkMf6849z9gsksKZUXwOpdhJ6mCRiCl9JCt1FGSNxT7rbCDNGffCTKbgy
         6qOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdRVi24CB98T6LngcX2TQH60KweTPHvJSqXB1cXXTt4XX33vqAuxXFDQzV5+N5IYVznx0rEg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0zn4F1iaD2k2Z/gFxy1y/KBMbO1VrBAFK5aTPWBjmssc7ysIb
	gaH0cbc/1ryMMsSVZJE5Z7aqJFwNl+xbZBu5LlYYL+AbdKKryZ/sbtXC
X-Gm-Gg: AYBFou2uxHBFO97zVdn92+KWKwerpQqdgdAyiXwJqaC/el+C0RMYxC9pdGcTzcXFFE2
	Gwthz3o0klA6bmv49TgaOTMNVy/GCiyTk8dH/U4t/D4yT8Mhm55vwWyMJGDTVDMGd5nnuhkTsZT
	5fm8JNDY84tqQpxTvPfC6VkfROhlomdsDhM7KkHOO57pYrNqL0vysXOImJPI9JIpX5RQoSd23uK
	HwSdXlU1qhjy6wUeiuqlvN5MJgHDGjjRqRwi967I3S8q7XFwR5tQo9viH39mjDJxq6lGvFYpW9Y
	GpVSgzID70oCyHCCNfmLz8rMylW/A/Z6df+OMQ0sXMjAuI14MjvsI1m1/R0D/sQxJph4cfuQ7j9
	rad/OZQnin/H6kA+pSPTMO6uwcj7Dl8zRj9EinPIQfCcP6QemrCjlm9gbN4+VhQbueUQdVKs1j1
	mZSSMBMLQlCjzrkAoSkmJCBYdld22pmDsH5FuAQ4Am5y1IBF872TJoIdkTccTDRoIUwfrPebwuk
	dASvP+HJw7bSxLrSGnoS4C+4yU6fT0EkA5aW71lf7P8k9GDE3cg6iA55RGVhIFNhY+1goQNHf0O
	0euZkJQrSZW7m2Iq7ACjFM/0
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr31193005e9.35.1793498240391;
        Sat, 31 Oct 2026 18:57:20 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:19 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 0/5] add provenance time (ptime)
Date: Sun,  1 Nov 2026 02:55:46 +0100
Message-ID: <20261101015551.786044-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an initial implementation of a new timestamp to indicate the
time when a file/directory was initially created.

This patch series takes inspiration from the one by Sean Smith
<defendthedisabled@gmail.com> [1], but using
file_setattr()/file_getattr() as suggested by Darrick J. Wong
<djwong@kernel.org> in [2].

The semantics of this new timestamp should be at least these:
- it should be the same as btime on a newly created file
- it's user-settable, so it can be preserved for backups, filesystem
  conversions, archives and any similar operation
- it should be preserved every time mtime gets preserved

and the correspondence with the other timestamps is as follows:

ctime <-> btime
mtime <-> ptime

Examples:
1) a .zsh_history file created in 2019, then after a few years the user
   decides to switch to another filesystem, copying the .zsh_history to
   the new home, in that case btime would have the timestamp of the copy
   and ptime would have the 2019 timestamp (just like mtime would have
   been preserved)
2) a symlink created in 2020 from the home directory to a /path going
   through the same process as the .zsh_history, in this case it would
   also make sense to sync the ptime to the 2020 timestamp instead of
   keeping only the btime (so the inode creation time).

The proof-of-concept code (for testing) for stat(1) and cp(1) is
available at https://github.com/koraynilay/coreutils (master branch)
(Note: these coreutils code changes are a prototype and won't be
submitted upstream as-is, but they work as expected in simple stat and
cp -a/--preserve=ptime tests)

Lastly, the name "provenance" and "ptime" are not final, I personally
don't have a strong opinion on any name, but while testing with stat(1)
I noticed that "Provenance" is definitely too long for the normal
output, so another option which would fit well is "Origin time",
abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
conflict with btrfs' internal naming and create confusion.

v2 changes:
- fix permission bypass leading to ptime update on immutable and
  append-only files (found by sashiko[3])
- normalize ptime timestamp as done in fs/attr.c:notify_change() (found
  by sashiko[3])
- fix wording in vfs patch to be like the cover-letter

v3 changes:
- vfs: reject setting ptime with -EOPNOTSUPP on filesystems that do not
  support it instead of silently ignoring it (found by sashiko[4])
- vfs: fix not being able to clear immutable and append-only on files
  with ptime, and allow updating immutable/append-only atomically along
  with ptime (found by sashiko[4])
- btrfs: validate on-disk ptime nanoseconds and reset to otime if
  invalid (found by sashiko[4])
- btrfs: avoid re-assigning ptime on unrelated chattr calls (found by
  sashiko[4])
- add ntfs3 and exfat support as suggested by Amir Goldstein[5], but no
  vfat, smb, or nfs4 yet as they are a bit more complex
- move the introduction of fileattr_has_fsx_mask() from the btrfs patch
  to a standalone patch in the series
- btrfs: add fileattr_[gs]et to symlink and special file operations

Thanks.

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
[3]: https://sashiko.dev/#/patchset/20261027220532.736352-1-koray.fra%40gmail.com
[4]: https://sashiko.dev/#/patchset/20261028134728.294127-1-koray.fra%40gmail.com
[5]: https://lore.kernel.org/linux-btrfs/CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6MZ8z8WdLjyQM_zA@mail.gmail.com/

koraynilay (5):
  vfs: add provenance time (ptime)
  vfs: add fileattr_has_fsx_mask()
  ntfs3: make crtime user-settable using ptime
  exfat: make crtime user-settable using ptime
  btrfs: add provenance time (ptime)

 fs/btrfs/btrfs_inode.h          |  4 ++++
 fs/btrfs/delayed-inode.c        |  6 ++++++
 fs/btrfs/inode.c                | 29 +++++++++++++++++++++++++-
 fs/btrfs/ioctl.c                | 12 ++++++++++-
 fs/btrfs/print-tree.c           |  1 +
 fs/btrfs/tree-log.c             |  3 +++
 fs/exfat/exfat_fs.h             |  2 ++
 fs/exfat/file.c                 | 36 ++++++++++++++++++++++++++++++++-
 fs/exfat/namei.c                |  1 +
 fs/file_attr.c                  | 33 ++++++++++++++++++++++++++++--
 fs/ntfs3/file.c                 | 14 +++++++++++--
 fs/ntfs3/frecord.c              |  8 +++++++-
 fs/stat.c                       |  2 ++
 include/linux/fileattr.h        | 26 +++++++++++++++++++++---
 include/linux/stat.h            |  1 +
 include/uapi/linux/btrfs_tree.h |  3 ++-
 include/uapi/linux/fs.h         |  8 +++++++-
 include/uapi/linux/stat.h       |  7 ++++++-
 18 files changed, 182 insertions(+), 14 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.56.0

