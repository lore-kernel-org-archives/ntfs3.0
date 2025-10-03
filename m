Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1F267729
	for <ntfs3@lists.linux.dev>; Fri,  3 Oct 2025 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759506053; cv=none; b=Qh8yZCWd77qoyHKXB03KzdNp/nzklEESrimr8inU1eAvvrADHFqFwnM8TAGvoiGrR30dd7nGeRgupZr7Me3DC9wZTgRajUXWh+S0vfPpdwSaPZs+Y6Izod4Mmat2NALbP/pAtjQa8q6upKNVqlv7qmkd5BFCG1EgwUFxoVD57sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759506053; c=relaxed/simple;
	bh=LOg4T94ipRq8J347hgnTWV0pMK8tjjOpCc0XTauE/Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdodFKI3ZKj1LFRwkPStchihlXhJnNX8ZN5sG34UG5Ijz2U0ZyXKDJ0G4EYm2//eKPTFdSTXXwaB71jf13l1uyUw1w7qkhq2b7XVkSpr3dgZfwb0eVAGqHCelO4tEU+W5DjQzZ3eSzcJMOOtYVmM3a2ZgO/aPcLVFosXFufyf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cd+7aGiB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd+7aGiB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781010ff051so1856564b3a.0
        for <ntfs3@lists.linux.dev>; Fri, 03 Oct 2025 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759506051; x=1760110851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7r9cq9P/21nnwhqpNX1hAPkeXOwTrBQce9AVDcYHDc=;
        b=Cd+7aGiBZGvnlZ4FYG6UxVVs6BoWqJ3xsh3C8ftfrDErIIrlgyq4MvoIHGBHVfCx6k
         OC5Yp8ZHcvZQt+lH1IMp3OOdtERa2ppUU4EVF3UzVo1/QPdfmPQdHY/sdOGtfetWju/o
         ml13CEDRhiyePZcJsdvWMM4uzLXseiEjFJ0VYjXRnZnqCB5y+84vPXlmzodJOVzfOoA7
         n5j4KQU+nFNjv+A0wurpsPLFueAWbdVKKYCVNYa+frNxniFzBezXD/pWCgHqthepRcoN
         +qTPOASMNAyuhp5SasoiULHFrm1HcDjkUdbjYTX+3qoxdtqkl4eqPhZBCAz4TL4ltBMZ
         b3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506051; x=1760110851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7r9cq9P/21nnwhqpNX1hAPkeXOwTrBQce9AVDcYHDc=;
        b=KUniNL+rhhqY3MqJeywaJNUnFN8Dcza55gF0XpcYHxpPlsyx404jJdLhhcZAn59T9q
         Ms0w6jkOTDpwylzs9Vj/0rPuRMzYA6o72wWL5Ujlh1GZtKV3TcRA5/WrQG+6ZA7Whtym
         NKLHqAiRwhjKwKmTZWt4P1i/6vgcWzCVbu8D349j0IOK/BBj+i1dlTVC70ry1NfSxLjI
         ukjiqK9Tdgf7gzefFKxuSPKUztdR70S4Eo/wbKnlec5FGFdhTHLV2KMqPBjsrIHWZ+u0
         HcS4JWLoVD/DCWD2uaXM9s/K63Xmgb3f7gRsFdaeB2XJ9RVHOXh8N78laa5S88V4Oc1p
         wniQ==
X-Gm-Message-State: AOJu0Yyljt3SiMU0R9/eOIv+D1RXs+80jFxZMV3jAzStKw3Pyub4CuGH
	ml3J6ZQyBFNKTIbmtRJ8nkbFsNrzl/GQIO7pSIUn4h874IB22mZWY6x0
X-Gm-Gg: ASbGnctWjPZhRg9siXlKzOgDNRKpmKrAxWlJpwYI5xQZVMdvpKxUZ6cKwvWlKqWYe06
	DbMXdt8XetWvTVkWdmqdlddKoRScb4/U7w7QRGUgNnfQ0rBeGBzH8PJeKtEA4cqvXkB43kwR/Si
	c1aGmC+006pQNiGmfos2Z86OH6XWG6C9k395FX8jezMJtj2M0YGiQ4AEnWPjKkYIiBOFBrp8/IH
	vw24rdB5Xx6sziXxhtV8Pe9DfLpuRVObkGajdul2AcrodNNAR1p7vD9ikQ6LNRqUNaY9TwDJbmm
	g0Zq8ww76A+JFieBVknHPxZbW058cQAhoLfeOVDdsvltWQwC9XlA5XS3mfHsoQYEJh/AEcJxl2b
	HnQxn82qeuq48CO/HJhn+bOFAkIzrj8VFjtmHJbZozBWhbhtMvrcZu6hNjl/Od4hQYpvhXDaIhp
	YiuM1pfP1CVg==
X-Google-Smtp-Source: AGHT+IHSOuHphbmG3g6A0WPDYkpmRmaUeSt/uHAeUHBHPqJHLyn8M8hem8ooNEv/cPxzBc6Dfir51w==
X-Received: by 2002:a05:6a21:9989:b0:2ec:65c:c25 with SMTP id adf61e73a8af0-32b61dfb914mr4385705637.8.1759506051178;
        Fri, 03 Oct 2025 08:40:51 -0700 (PDT)
Received: from weg-ThinkPad-P16v-Gen-2.. ([2804:30c:166c:ce00:17a8:586a:f651:fcd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f7ab4fsm4946496a12.44.2025.10.03.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:40:50 -0700 (PDT)
From: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	syzbot+f4f84b57a01d6b8364ad@syzkaller.appspotmail.com
Subject: [PATCH] ntfs: set dummy blocksize to read boot_block when mounting
Date: Fri,  3 Oct 2025 12:38:50 -0300
Message-ID: <20251003153850.55643-1-pedrodemargomes@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mounting, sb->s_blocksize is used to read the boot_block without
being defined or validated. Set a dummy blocksize before attempting to
read the boot_block.

The issue can be triggered with the following syz reproducer:

  mkdirat(0xffffffffffffff9c, &(0x7f0000000080)='./file1\x00', 0x0)
  r4 = openat$nullb(0xffffffffffffff9c, &(0x7f0000000040), 0x121403, 0x0)
  ioctl$FS_IOC_SETFLAGS(r4, 0x40081271, &(0x7f0000000980)=0x4000)
  mount(&(0x7f0000000140)=@nullb, &(0x7f0000000040)='./cgroup\x00',
        &(0x7f0000000000)='ntfs3\x00', 0x2208004, 0x0)
  syz_clone(0x88200200, 0x0, 0x0, 0x0, 0x0, 0x0)

Here, the ioctl sets the bdev block size to 16384. During mount,
get_tree_bdev_flags() calls sb_set_blocksize(sb, block_size(bdev)),
but since block_size(bdev) > PAGE_SIZE, sb_set_blocksize() leaves
sb->s_blocksize at zero.

Later, ntfs_init_from_boot() attempts to read the boot_block while
sb->s_blocksize is still zero, which triggers the bug.

Reported-by: syzbot+f4f84b57a01d6b8364ad@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f4f84b57a01d6b8364ad
Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
---
 fs/ntfs3/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index ddff94c091b8..7648663d70c9 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -933,6 +933,9 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 
 	sbi->volume.blocks = dev_size >> PAGE_SHIFT;
 
+	// Set dummy blocksize to read boot_block
+	sb_min_blocksize(sb, PAGE_SIZE);
+
 read_boot:
 	bh = ntfs_bread(sb, boot_block);
 	if (!bh)
-- 
2.43.0

