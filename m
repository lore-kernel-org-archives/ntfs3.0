Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739213;
	b=nrXkjc2spdPW/X2lGutay8hTPPJ966qS4mLJmmNT/4f7hqqsN1OyyPc8ADa+XDWvVo9R
	 W1r96QBx7QHypj0sb8BcT9cURGHATNNHvLF1qtCTakfI5edr8iSetPnKtt8sEKF8e4K4n
	 oRLgCNW0+aXACELsRGgnH/PsDlJHnGP2Zfj7+Rf3oostk227BGwovAlIWv5DimmwqSygj
	 fEIVKEP2xL7GkoyvBdnjSRwwMYeegBeXj8ueQLxaD8h3XGsGQlpdsPtt0iMCf57PeiYuf
	 B74HIHIIm6IDsItSNux+ZhEBMukYHe6nNKq6izaOmDm62Mmuu7iYWtTtSyGAS5B57hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1er+HG2BILvztOapsYBpIy58le3UOu55avMYSXyvdec=;
	b=Ojl0oO95AM+5hqssmKy3/EdWxJWOQAshTzi9mLA4RILT/72RElkkOw04jpUY5gnhMBcX
	 wJyYvG03T5f4C4hZ2ypMxa0r2apLqSP7dK8f1VbboJl11jFJLE9m0dltpIWOGgMe58N5i
	 yHev2NzIlQkK4IjPo+XZtOKZ8H9tziTp/D+XaejWwmgx0wcmFggNTf82cfoaMg2oA73v3
	 ES9FlBWzdMYA09JkdGH/8PEC12eN/3L9CSfMEEUQf+0zzWWLP+LRpg9uq/GPi7rrNnPeh
	 TnbCH/fVcs3bG/XWZTjoBS9EDDBBHrMnMn9N3BYMocOPU2EKzFSk98gSjdxAGd9zNfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kK3AkFeT;
	arc=none smtp.remote-ip=74.125.82.68
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50A606A31A
	for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 10:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB50A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kK3AkFeT
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1438d9363fbso1167447c88.0
        for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 02:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739212; x=1795344012; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1er+HG2BILvztOapsYBpIy58le3UOu55avMYSXyvdec=;
        b=kK3AkFeTUNhpjJAzD6RgeORiFU8XgZFuQLhM9IW2YZQbYPThbOqM25NGG+/Iphtb7/
         Ni7k6qz2NEU11whrtssiiin+id9Z3CX7iUlnLc3OuFQR7qlt1IRvtUFBiYCuIgNqkxLK
         PJj1a566Idu58iu5PhUanIgtZoNNVzXP3bHy/PuHhA3eo10onSTm/SyX4y5kg4JZYeK9
         +P570qqCZFb560sAQaWVnxoofINvPDK1Tac9sBqGXkWWi2RsQwn1IWjYGBZUYaBFY6JW
         k6BO7uf5eufW56NKiHbKaIMT5Eb+RDRVZPbuQ5AJQ6/pHbzCF5JPLK156ZdM/RteIc+Y
         wGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739212; x=1795344012;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1er+HG2BILvztOapsYBpIy58le3UOu55avMYSXyvdec=;
        b=Z4Pdycwp9Xy6wqFxkcJFohKBB8bBNXnYsQSdQqo0U453GRHLpgHBPYwKeJvmBET18u
         Eo2j9ViDTue9FmMuWT6OW829ar5dt6YBisB1IJjZ4YCpxIi/SNcs6LLZMl0RZWXE3/n9
         EhoiTJsANPymJZiVEw/5z9EMMaGwhaekW0MuKBgOzpq9V0nSqyj7sTaMCVecMBDTwCPd
         xX5pDDvxfMqoTWT7ACgjSZNwlL1wudOALuTvcjKOVms0BdDFd/Z8bsJhsdf7sI0vtBpG
         3g6RbuNinR4K1y0JPgLlnC2vOr1Xz8gf1ZBPHbweb3JRHGFCbIMBcstk2/ukUXcnWg0l
         IbLg==
X-Gm-Message-State: APuU4Z8XkZ0ZqVXDzHvAYGKl9PvJ7ffnFeH2UhKCNiP9C8HB0+SQYtud
	tLz4eRHvHMJfGORXbw86vVCPHrRMhlvLm3mitGx2wSgtfbZaINlqaPdH
X-Gm-Gg: AYBFou3zOkT7k2YOT9BGlxcJTdPVGtS/RvfCsJJqNiohZoRIfePUT91Uo+HQG02qnkl
	/k/FsBDeK5+vqZjBOxDIjDtbuSj6vJ2madAjdT56wo7+3tB64c/reXP/Jl5JUz9xxwcphgUhgsG
	a5ltLnL/wzO2bFfTl0SmTS7YdI+JI/2fmz/M5my6tSIvf4xeC93Bhwynzb9B1GhptZKdkfGNNCt
	sDPT3DhxI4WNvRaAGYsu6ya67/igf9GYfvATf3CQoVBskElzCy98cLzSWS3rCxkD4+irXKDCWwW
	pkL/6Vs/d6BbNeH0ND+b5MBibtx/uqa50cUDlYgT2HV9W4PcWOS6mjOnjLZHhISiq+dbSrc4F/b
	G751e2AoYwqpryIw5kBw3cdLjy70v0ZM19mHDkOzuqu92J8Nnl/y0ma6vcwdH7sp4FbZIDB3Vig
	LBlREEMcIwEUGoMP4tB5JWPOwvL9pDCQLSCxDSBskHWQmtpgGRYKkueQDnEGqRO89QYVdS+ebVD
	qFmIr+s4Q/B+BHbWJZiBqFTfD+X1LVZg2DlNMLTH9lH8gtCpM8CZuNr+P/nzV75LrnNDEpgKVca
	UZuoQS8nyGzKKbb4ekUaCe/cW/IrKwqoOoyGDdgs5VrSK5SFpUuVveSI7CAQOmwRYTudzR/2oyQ
	mSh2YRcGAfziPtXFOQwkj1xelpbAn1CjTzOCRtQ==
X-Received: by 2002:a05:701b:4594:10b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b4f5f1f344mr9022632c88.4.1794739211963;
        Sun, 15 Nov 2026 02:40:11 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm21315758c88.15.2026.11.15.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:40:11 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com,
	=?UTF-8?q?Cl=C3=A9ment=20Smagghe?= <cle.smagghe@gmail.com>
Subject: [PATCH] fs/ntfs3: disable the 'ads' mount option by default
Date: Sun, 15 Nov 2026 10:38:45 +0000
Message-ID: <20261115103845.56074-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit be310476e886 ("fs/ntfs3: Add basic support for alternative
data streams") the 'ads' mount option is enabled by default, and
ntfs_nls_to_utf16() treats a ':' inside a name as the start of a stream
name. Existing files and directories whose names contain ':' are still
listed by readdir but can no longer be looked up, and such names can no
longer be created.

Make 'ads' opt-in, so that volumes mounted without it behave as before.

Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Reported-by: Clément Smagghe <cle.smagghe@gmail.com>
Closes: https://lore.kernel.org/all/CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..0c317cda836b 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1949,7 +1949,6 @@ static int ntfs_init_fs_context(struct fs_context *fc)
 	opts->fs_gid = current_gid();
 	opts->fs_fmask_inv = opts->fs_dmask_inv = ~current_umask();
 	opts->prealloc = 1;
-	opts->ads = 1;
 	opts->ugm = 1;
 
 #ifdef CONFIG_NTFS3_FS_POSIX_ACL
-- 
2.43.0
