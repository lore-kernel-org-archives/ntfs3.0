Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864844;
	b=aVqsTpPmhwmDJ4ftY7rU6zWMam80MXw+uTQaSx5f2GVUEfgAPjLjOOXH/j60VBffGj/p
	 FRP908gpf7MdO8JsfZwkgfXHwQwVOrcAZf4CjMheJCSWHdbjutfn8GOl9pAG+OC7Q0R1s
	 7CXf9IGA/rRoSej3PfXAny6MahKPpGBlZfl3AgPMWORbp20NfBdlpCV5dFVLgBeuRqJfA
	 /NWQS6gU6646LRvWqtqJh2YFxOBcpyQg1DE68+2blYjaoP3UJyNb1rsSKt6ztW+K7rc/Y
	 ljzojW4L/hvofxLN1Wj3l8eeXyuZMX0ri8lB2aIWwwnWK2C4NG1tO2aNMtZkunvu0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2TeVFCjy4RlKepx+4eIyD8C2zGMENsVMz5Y2Ejee59s=;
	b=g2LkORaZGmPfN8p766oX+HOLdGV28e8uVkukwUb239aDF0U9bHGHLbMNnOjzqtGfTnoB
	 uEz9gNcw2SXUvN7MXgaL/wSjFUhEEY1f74rIxBOkWfY8OC4NPqpULxcwDazUSnHtRMziE
	 Bu85W67gmCSpG5kzYjlY6wZCubv1Ucj8NBc/zGIxI3FUYe2sCHzEUtpPqx8kqtIfkDMtz
	 9dM50MbqmEpEfZIGY01bNp4zYKHMZJclMCWGOLyvxGvHdCAS32PFuCNDalrdUXybpD1hD
	 EqX7og/s18JT7JDHxd769sdHNuUL/eKsmDxFBPkfgdhEv5kSqLkK2pJzgINbMaEiaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MA2mfSj7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACDB606A322
	for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 21:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACDB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MA2mfSj7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so11334515e9.0
        for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864842; x=1795469642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TeVFCjy4RlKepx+4eIyD8C2zGMENsVMz5Y2Ejee59s=;
        b=MA2mfSj7mDQrRrayL3XEy2qI3BfUAM9TrjF6MFASfn4ZHzFpOsZ2s5p72GX4+9F9LR
         1ZVBPnH7EOk+Yv9Qxhvsy0cfYxcnG6J13Dqv1BO5xDF5A2mEEMCmFEFjquIHUVp15pe7
         Z41TujG7sLllRROD5FZGc9ftey1bHJJsXSbdeDFygl5bHOqo1h8CeXx6axp+630hculF
         ylshFhP4+DOh2n7dyL0yjdTs1mn+27HyGB1q37etSqHXSebTgqoYqiHZbiCtrBZtLv0g
         1lKWOokAEuIDIdH5Uo0sw7h8leWeDSMvEZ0sBoxBCGbeh5gr5Pg0ZJTtQONQiMlgKwzp
         0IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864842; x=1795469642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TeVFCjy4RlKepx+4eIyD8C2zGMENsVMz5Y2Ejee59s=;
        b=AK0QBF7Ko2PeW74SncE+h/qOGyRAybq4UVl0/3Wu/piIJ3ymZ9z/5ZtBs+RCJ92K1q
         VkyMAzfi+MvlkWfpzVawrYPwciAixO4O71NaKDUapFpMJkqTnapHAtNYWlbbZE8RJXbo
         3dAV4+qIgRDzsJQtf7mJuvaCPagXBhQbAprNfTpHiL4wWPXZxpP6RSf2ZRNhjfB2ktBh
         WNiDmeSwkOt7xGUR2yLC4UC2q9gV0E49Ahc5y5z1/BjCKNsdk25ubBtnkqad0PdUko27
         eBbmvBavpmDFrPapDQ7EbNAjizDyTCWioPcG4oBM6HxPV62S2qbdZN8/VjaatbhDHlU9
         XiYQ==
X-Forwarded-Encrypted: i=1; AL+hErGooVrZnlxIfus2LXD6ON65kI+fpchc4xFtdxdYYrDdlwDYLNjVeBTH9q6xfuHK+kuV9lt77g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xKxxZ/lasL2ZyrEzeEaI7XuEd70FzQzeHKLY0ZxR3WkCiR1U1
	MRPvKDOQSoGTFAOa9Ib9JCNQCYiSJG2kseFY5Jvfh7J3niXMZRTzvg/C
X-Gm-Gg: AYBFou3b1LLX8LzJW/vgRTsodrTPKC7XoKqJ/z8uBYyMp8pniLpE/aimK+qtKdT/J3y
	VDEmntl/hDh2lefGLha8vMucG/olVO3eJWljf/dNCsoPob0TjGRl3Plae3CNRpiiR1Eu+6ubp5R
	NPn1sBKBXEC6V0TDnNziERNTfkKukdcoOFJ557MpvzW1AqCbcpqXtal7ckZgqydEKNtnHRSq9yy
	6f2LTbn/d9XsvE5Y+HMmJkLrKdlazsWiXoWj6h1SL8VjDlN4A9zEPUVk1aFnXY1M7KOeATC5fgU
	M1rXkeKs0JLxU0GbwrHKxRBR2VmNighM9Mk++TEYotIPuElO65qXQfnevXVmDYyy6HUDu/MyC32
	vR/n16DPKYFmga0qH3E5CMNizWIT4nbflSDbgFJHsea3TrAKuqlxuBk6rDWE8ssyZyKdGw22XiK
	HIV3aHLj/4fwRWeOgoaou5QAA25Ufa8eJNu3Qb145t2Y92iHnnJxfp5DASk2qCP+6XRU1pb1Kj8
	zczXmEy40SOYKKvJ/GV17WDyQU2/pOJoUEXlrxOiFpOO3UnNq/r5NXzu4fm1L4qAYITBxjDPI10
	Rdcls96fDYFXUkIsClYKefOd
X-Received: by 2002:a05:600c:4e8a:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb6f771fe4mr103029385e9.21.1794864841835;
        Mon, 16 Nov 2026 13:34:01 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm28831315e9.3.2026.11.16.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:34:01 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH v2] ntfs3: fix negative timestamps corrupting stat output
Date: Mon, 16 Nov 2026 22:33:45 +0100
Message-ID: <20261116213345.858408-1-koray.fra@gmail.com>
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

When reading a timestamp before epoch with sub-second precision, ntfs3
converts it from on-disk NT format to Unix format without normalizing
it, leading to the nanoseconds field being used as a negative number.
This leads to a garbled stat command output and violates a struct
timespec64 invariant, as documented in the set_normalized_timespec64()
kernel-doc:
[...]
 * Note: The tv_nsec part is always in the range of 0 <= tv_nsec < NSEC_PER_SEC.
 * For negative values only the tv_sec field is negative !
 */

Reproducer, with /dev/loop0 formatted as NTFS and mounted at /mnt:

  mount -t ntfs3 /dev/loop0 /mnt
  touch -d "1969-07-20 20:17:40.123456789" /mnt/test.txt
  stat -c %y /mnt/test.txt
  # remount to evict caches
  umount /mnt
  mount -t ntfs3 /dev/loop0 /mnt
  stat -c %y /mnt/test.txt

which prints (stat output is garbled because of negative value):

  1969-07-20 20:17:40.123456700 +0000 (from cache)
  1969-07-20 20:17:41.()*+,--00 +0000 (from disk, after remount)

Fix this by using set_normalized_timespec64() in nt2kernel().

Fixes: 518013860432 ("fs/ntfs3: Support timestamps prior to epoch")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
v2 changes:
- fix uninitialized warning and resulting bug, because I had forgotten
  to test building it and didn't read with enough attention :(

Small bug found by sashiko[1] while implementing ptime[2].

Thanks.

[1]: https://sashiko.dev/#/message/20261115180343.576773-4-koray.fra%40gmail.com
[2]: https://lore.kernel.org/all/20261115180343.576773-1-koray.fra@gmail.com/T/#u
 fs/ntfs3/ntfs_fs.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f400cf94d05b..9c77a90566ba 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -1083,8 +1083,9 @@ static inline void nt2kernel(const __le64 tm, struct timespec64 *ts)
 	/* use signed 64 bit to support timestamps prior to epoch. xfstest 258. */
 	s64 t = le64_to_cpu(tm) - _100ns2seconds * SecondsToStartOf1970;
 
-	ts->tv_sec = div_s64_rem(t, _100ns2seconds, &t32);
-	ts->tv_nsec = t32 * 100;
+	s64 sec = div_s64_rem(t, _100ns2seconds, &t32);
+	s64 nsec = t32 * 100;
+	set_normalized_timespec64(ts, sec, nsec);
 }
 
 static inline struct ntfs_sb_info *ntfs_sb(struct super_block *sb)

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
-- 
2.56.0

