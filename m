Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306FE3AF675
	for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 23:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738029; cv=none; b=eKsNvszgiajknz7xzugKku4m6muOKF0EtxA+ZqoDZ53Pog+NIqr3onwSVayabHrGfhgylTO4BfNdXniJufxFBtwLHBRGZWkJrCFq9pCB/DfTi2tPo1PBHVSHB1qcn2gVitQwCP66m/R2RQStSPbvVX+s6rqrkaaWO634gc4pgKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738029; c=relaxed/simple;
	bh=1BAQEyQYCCEmT4BOj6Yfctd5RnBJvevhmpx4WxHgbkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7fiHs/T+9QBg30Zs5/BK/CXnJ5BybSgPU6COrbqs88Mny5vM8lyIg5oZF8ddRDsOoZ5NDDmf3poTTVag4Id+scazgeZiNcuIBa5l2t0ER2m/RtspDEnpw4GrlaVfXU2sX2tcMcbI0mUXEL7m8rcFrd1lgtfT0gC0rNHiuRy6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Ptv+Joil; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Ptv+Joil"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845385adf4cso117872b3a.0
        for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 16:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1781738027; x=1782342827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KznoyYOaS0WsLEtkYpyaCWfeEY+JMwGvjMma6A5kRD4=;
        b=Ptv+JoilCF04XIpjx26nyM7Sfv/FX7+xQgzaCWHS8YNPpzLlU0Sh9AkGhqD2qKTeSW
         I5ASiK7Hgn3COW3yfeIXt1OrA7HEIECEkqTvZGsg3f3hmWXOtBubwflVFXJY+TX/CDwD
         Z77TzWBy//80v9xOudOVL+ku/MuMYluirgn9ABL31FYIN5vBlbP2EpA4gRLGnAgq+PFH
         Ei3S4mh5EgoDOP6kXLy107rMaTbhVakgRYlAFZt85PIRhXvm6sw1Os9G4RdpkOXxpgas
         3yJtumHkeJRsAMLgZyK633186Xq2SFfq9PNYhIGXDIjhZVdmsyHTopcpVZSiffIkdA5L
         uvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781738027; x=1782342827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KznoyYOaS0WsLEtkYpyaCWfeEY+JMwGvjMma6A5kRD4=;
        b=ZhQXbE4xF7Gc7WTvxR/eBxEf8kj77S4BRHRnLHmzHMJfJvDLsBkwK2BiJSzJh1RjJf
         JA8x5ZDqMAI/6K0X6L5yyEupuftClrm45eerlS5HJqDFn4HNR+C9ynRNFRpx/Swg8bP7
         XwxG6CbP/9qiurA+xNLwC+KMRQDOsUf4vFeHYSgdK6zJlexVP5Bhi7d1N8GdnU4Ooj9z
         e1yt7Zjho8Er/hGlCb/kEK+iYbD6q2/nPmGL6yXGBZBwpJcgmksHq2SBuHQOeG7jslPL
         ztk6eHgLapD2xo12KPUxEBgDkgX57xhWY+Yu4WHdZBor/GVtzUp4kKDoucrx9dTyxLvx
         4KYQ==
X-Gm-Message-State: AOJu0Yx5JPyKkJ/wMQPM49OLmxX+lYylh4b98kTVItGMMt6oA5dhS0h6
	kGt3n3YTVFPyNb9WyOrPIFBtg0cuXcqvKtYXNX6QcVyqvx/lUAdIlsyzAC1yjo71MQ==
X-Gm-Gg: Acq92OEQivjA4o+TvqCo9a1t5w7P08OeqgokxYwhPY14wCDuP1ajUGiOOLPdQ9hd9MV
	/DgpLr5xD6V5jRcxGMZv5BfV7cYNSKkOMYpX4QAKzl23LlbOWeORhvC8z2xxwO+eWvc6V1QYzP8
	fAkqv2xwR3hS/y/gzA17yp1troMfAZzbAQ4s+7whye/uoLB1wugQX92vgHfYcXR/0DYeF66jEy4
	FmFo6PTXD1ZaIIjtD2ODHwDsZHxoJBnvWKfqmhpxkCd5qrCGXVILyBz2wLFHQOoKsPYI0q9cl/K
	+DmV5I/FiBd3OlO7m8MYpb3vegmRQShtnl69jCGaq5ozsoEXLMXRCjiH/NFvz2E9kjZK8Xq5W3L
	imYz6MDKeTXh6gebni9zqo/5LKmFKaxj4lEM0CE8T25W5Vgb+dvD7MHOLf7Ces1o3Q1EJnydhkQ
	==
X-Received: by 2002:a05:6a00:238c:b0:845:18b6:1154 with SMTP id d2e1a72fcca58-8453af39220mr965507b3a.8.1781738027571;
        Wed, 17 Jun 2026 16:13:47 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec29:4018:2b5d:3e92:f9ad:889c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf4b5csm21073427b3a.23.2026.06.17.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 16:13:47 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH v2 0/2] fs/ntfs3: fix out-of-bounds page_lcns[] access on log replay
Date: Wed, 17 Jun 2026 16:13:41 -0700
Message-ID: <20260617231343.403432-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While mounting a crafted NTFS image, log_replay() can index a dirty page
entry's page_lcns[] array out of bounds. The array length is the on-disk
lcns_follow field, which is never validated against the space actually
available, so several replay paths read and write past the entry. There are
two independent ways the index goes out of range, so the fix is split into
two patches:

  1/2 - The entry's own lcns_follow (from the on-disk dirty page table) is
        not bounded against the entry size. check_dp_table() rejects any
        such entry once, right after check_rstbl(), so every consumer can
        trust lcns_follow as the real capacity. This closes the HotFix store
        and the v0->v1 conversion memmove:

          BUG: KASAN: slab-use-after-free in log_replay+0x55be/0xbbd0
          Read of size 8 at addr ffff88800dbb28b8 by task mount
          Call Trace:
           kasan_report+0xce/0x100
           log_replay+0x55be/0xbbd0
           ntfs_loadlog_and_replay+0x4a4/0x5c0
           ntfs_fill_super+0x2252/0x4570
           get_tree_bdev_flags+0x373/0x5f0
           vfs_get_tree+0x91/0x360
           path_mount+0x75a/0x2120
           __x64_sys_mount+0x298/0x310

  2/2 - In the copy_lcns loop and the redo shorten loop the index is driven
        by the *log record's* lcns_follow, which is checked only against the
        record length, not the target entry. dp_range_ok() bounds the run
        against the entry before each loop:

          BUG: KASAN: slab-out-of-bounds in log_replay+0xb7e0/0xbbe0
          Write of size 8 at addr ffff88800fff1518 by task mount
          Call Trace:
           kasan_report+0xce/0x100
           log_replay+0xb7e0/0xbbe0
           ntfs_loadlog_and_replay+0x4a4/0x5c0
           ntfs_fill_super+0x2252/0x4570
           get_tree_bdev_flags+0x373/0x5f0
           vfs_get_tree+0x91/0x360
           path_mount+0x75a/0x2120
           __x64_sys_mount+0x298/0x310
          The buggy address is 0 bytes to the right of a kmalloc-2k object.

Both are present since ntfs3 was first added (v5.15) and are reachable from
an unprivileged mount of a removable device on systems that allow it.

The two patches address distinct untrusted inputs (entry capacity vs. log
record count): 1/2 alone does not cover the record-driven loops fixed in
2/2. Verified with two KASAN reproducers that mount a malformed image, one
per patch:

  reproducer   without fix   1/2 only   1/2 + 2/2
  ----------   -----------   --------   ---------
  hotfix       crash         fixed      fixed
  copy_lcns    crash         crash      fixed

The reproducers and crash logs will be sent as a follow up email.

Xiang Mei (2):
  fs/ntfs3: validate dirty page table on log replay
  fs/ntfs3: bound page_lcns[] index by the log record

 fs/ntfs3/fslog.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

-- 
2.43.0

