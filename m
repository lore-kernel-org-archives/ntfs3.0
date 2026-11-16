Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870342;
	b=aQAfyqBSk933JGfoSDlQEfJFYRh5EsMtovTO34rS6KXUxHYMHkukS7e5MsOwOJavgcNO
	 /gBjGSapxSvFPt16T5hL/XV+hIzm2cjXcpffvSIf0cUhZp4b02n7kOVhGL3Q9yflCBsve
	 t3lMtTCUhve86rSykDca3zv22gKxL0ChgE771g0pCcI0c1ITvA+Uxk+f8KR70xbjrMucQ
	 SI64A+1ThUXzAVJ9Jw1s3THiD70GzdMJUyRmaEuOaR6/8e8hWlQQyqENj4Ulv/9q5G0c5
	 s4kJ24UWgsstKRjwxZiL9Y7/2U5O9+i1J4kMPGOcpvYEZPd9wyODPmVQafpu1yglpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PSS420+ZveM2uYmxbBh1j0bl8rEpgaKmjthRN6A2qTk=;
	b=5GqOFQfWevlzZOZ3SsYZXr7DxJa3sVAhCYlY0AtyARrcfU7JRoKTuk3M9x0atdowsnyS
	 my3X8jjaMu1YHi2Fjn4H2zzX+B6dH9aDh2CNOdDhIaaHPw2huZ0/nKy7tRvRstsNAtNY2
	 VWYXP/rgubxGP7iAQJEJQZGHFRU08NCRqBA5yG8GEo2RnzrQpKxMQiH0BhZoyipw4UxMY
	 OZ4mtQvVdNgwhB10jfpUTEA8rZXTQ2aXXJXqn6B5kP9ojubmPHXzqeM03X63b2kEm9GnK
	 e/UrIkF1x5WHOTmMlLZg2/+b/Ubmc6WKiEY46yyiTQoJ1H2dRtCzhKnM8Akjcgizsmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+mifPjr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9045606A323
	for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 23:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9045606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+mifPjr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so16485205e9.3
        for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 15:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870340; x=1795475140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSS420+ZveM2uYmxbBh1j0bl8rEpgaKmjthRN6A2qTk=;
        b=d+mifPjrvsq6aFfhFpvVXSOfVtF/TNoAW7bpuV2v41G8ml3IE63hwvJoBhJGgQ8i0L
         LgE/TGB5FbCu5pBzD/hUwtWROzTwO/tPtl0zIHxZlmcEH0u2f7DRh6yV/1RdPSecl+b0
         jGTWUW2Z7YEXvwlcDx+fCxSYfjEzZeJlRpXQDMXkU79whzs88foGwVXLO1KNbWl7ZNeU
         9oZYhhXAzbBtbsBsH5vaaNZn0mXGooYTuKmphRXm7MaAAs9ZTFW2A+P3h4WrfRxwRetr
         C1gMRDICtBNTqg81lgZKl0bSgPxXVCcC2/mQBbFTnhpUOJGzQ6bfl/o/m4u5SQTIzOnT
         5Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870340; x=1795475140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSS420+ZveM2uYmxbBh1j0bl8rEpgaKmjthRN6A2qTk=;
        b=tiQOWqV6Na5Q5iqBxLz9AAETkhwo3faJhVn3ssFTNl5rM6bbzJrYz6YoWQuBijfmKf
         a6g4BfDtsSWPkrONijX8RGrpku0qvfvJyVzfFZWxinISK9psziad4RJBZnVENTaCpWmn
         ZlTNsjOfrxV82nROiTdDDrUqVfKMYlZv9Z/vTDmYvGHHe8oNjxzI4CmKTz4mIUA1T9yc
         I/EFrbmFqA8e7V8FJmrmAT2zRpMOvIjad7embDF2MxL8EBqVrv+XtlwpeMqYV80TwBOJ
         22ELq6ixE85M6L4O8qm7Opr/oxvisWTXJY9KN9nXl5u0Sjx7FE+glDSaPm5sZ18yyiRr
         IjAA==
X-Forwarded-Encrypted: i=1; AL+hErHGSTGP86gyx2Z4S9Eht8ltS0TCpMoQFzi9bq1Mav37s6OqONAPx7bTDW8dVHqCtBroRQWVvw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8/6Aq3aWfXDY+u4M2dJOtznFHv5vIH9EiLxpXxTAu7sMqWbjfV
	MEvPG7kmC7hnOFDRBEPOR33+0W+v9iPoxA6Qi7Jmv2sdChnbT+KhTafK
X-Gm-Gg: AYBFou0X/ScA7uo5xsSPLhYAlZlvfnZShuw4onOtsYh+JmpyDVpLSBYQ7fYokWpAqr3
	nPNQRVP2CBY0zS4dY8jVJsBuWR5+7g8qrkGF1OIBvX+1j5ysAVW9mK1d/28jNPEcNSg10Vb0hV8
	Xo0mcDg8KmrdkYSXXskh5On7yQrSLMf/ew8dNXZE06bLvaMY+wefEjie7iqmVAykBQb2I5Odd+j
	luoxhaz1XPqlIK308zu9heEEIiybVsKlj6uqDG8xQ6DZ/w+13irCWYKvoMfrlVxvWPiGyXjL5MT
	kV602sOGAZ5tQ2xXZGHyEfqg2wj16z+ofzGuBHXiZ6kTaRGiQI1YyJtHr96gbensX4be2wposmc
	9Ej18xU+N7Cb1ft4COegSWeUb/VCcUZ93lKoWrKhQ9erx9r9hcyHXUg16PBWqku2MAup2RsYl5I
	26xZrPwmxBNXtbhBLRgrT6dBbpclJypYu+9ol1lpZfy36iFqwiB6pBZKvDb5cZoQYNvee8NzDXd
	zUkhzmJ3Cgv3pf6BkErDiT35W7rD92TxLcftLsqoEnbtcPaaNvMsrEMY2G3JL9nOeAdSJHDeRO4
	i1+KTj2jdDPiiF88mOYAXygo
X-Received: by 2002:a05:600c:3553:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb60b1448dmr209445495e9.19.1794870339869;
        Mon, 16 Nov 2026 15:05:39 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm20104945e9.14.2026.11.16.15.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:05:39 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] ntfs3: fix under/overflow in kernel2nt() due to unset sb->s_time_min/max
Date: Tue, 17 Nov 2026 00:05:26 +0100
Message-ID: <20261116230526.945330-1-koray.fra@gmail.com>
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

Because ntfs_fill_super() initializes sb->s_time_gran to NTFS_TIME_GRAN
(100 ns) without setting sb->s_time_min and sb->s_time_max, the superblock
bounds remain at their alloc_super() defaults of TIME64_MIN and TIME64_MAX.
When a user updates timestamps through notify_change(),
timestamp_truncate() does not clamp ts->tv_sec to the range representable
by 64-bit 100-nanosecond NTFS intervals.
When ni_write_inode() subsequently converts the unclamped inode
timestamps via kernel2nt(), multiplying by _100ns2seconds overflows or
underflows and wraps around, writing corrupted timestamps to the on-disk
MFT standard information and directory filename attributes and causing a
mismatch between in-memory and on-disk timestamps across inode eviction.

Fix this by setting sb->s_time_min and sb->s_time_max to the smallest
possible and largest possible values respectively using nt2kernel() like
other filesystems (e.g. CIFS) do.

Reproducer, with /dev/loop0 formatted as NTFS and mounted at /mnt:

  mount -t ntfs3 /dev/loop0 /mnt
  touch -d "@1000000000000" /mnt/test.txt
  stat -c 'in memory: %Y (%y)' /mnt/test.txt
  # remount to evict caches
  umount /mnt
  mount -t ntfs3 /dev/loop0 /mnt
  stat -c 'from disk: %Y (%y)' /mnt/test.txt

output before fix:

  in memory: 1000000000000 (33658-09-27 01:46:40.000000000 +0000)
  from disk: -844674407371 (-24797-05-02 20:10:29.044838400 +0000)

output after fix:

  in memory: 910692730085 (30828-09-14 02:48:05.000000000 +0000)
  from disk: 910692730085 (30828-09-14 02:48:05.000000000 +0000)

The reproducer for the underflow is the same, but with "@-1000000000000"
instead of "@1000000000000" in the touch command:

output before fix:

  in memory: -1000000000000 (-29719-04-05 22:13:20.000000000 +0000)
  from disk: 844674407370 (28736-09-01 03:49:30.955161600 +0000)

output after fix:

  in memory: -11644473600 (1601-01-01 00:00:00.000000000 +0000)
  from disk: -11644473600 (1601-01-01 00:00:00.000000000 +0000)

[ First paragraph of this commit message is by Sashiko, see Closes: tag ]

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-11bcb274-4eb7-4a14-af1a-ed7ab6b0b769
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/ntfs3/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..915722abef5d 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1325,6 +1325,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	struct ntfs_mount_options *options = NULL;
 	struct inode *inode;
 	struct ntfs_inode *ni;
+	struct timespec64 ts;
 	size_t i, tt, bad_len, bad_frags;
 	CLST vcn, lcn, len;
 	struct ATTRIB *attr;
@@ -1361,6 +1362,10 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_op = &ntfs_sops;
 	sb->s_export_op = &ntfs_export_ops;
 	sb->s_time_gran = NTFS_TIME_GRAN; // 100 nsec
+	nt2kernel(0, &ts);
+	sb->s_time_min = ts.tv_sec;
+	nt2kernel(cpu_to_le64(S64_MAX), &ts);
+	sb->s_time_max = ts.tv_sec;
 	sb->s_xattr = ntfs_xattr_handlers;
 	set_default_d_op(sb, options->nocase ? &ntfs_dentry_ops : NULL);
 

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
prerequisite-patch-id: 26605e50ebd4bbfcfd30aca746348b6f79bc83e0
-- 
2.56.0

