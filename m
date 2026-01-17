Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A89475
	for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768668629; cv=none; b=qPQjXHEy5JIZh2Kq3XmsWm5Uy6WpUnBnChdDk7INLBVm6+w4UPUK2fEo3mvKeW0J8ua/eJY2i7xir36vXMfFHlfhonX2wYwv2vaUTDVzNylusm6ShTeUbx9lDHmbyZkHmB4wiNHuiw+GrMz76N7RH2SmRNkS6yi2cM9JRxTf/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768668629; c=relaxed/simple;
	bh=haRwb/gJXuLBkWW4peMKulg8+vFPEgplZ1pBTMkHHi0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rWpxKxo+BgoHFAqaGTMEH4sie9c85IdzgFxSslkqK542JwXeonAhP+ReF+RCHAioNwXRmr5SqBpqn3R1dohRaMItdLuK2f8po8YYFmXzhQgvI03MzlQqxqwYW7HX2AghEhXu1o7xiVun4ofzl+EO2AKSfFwFkhognMGI7sRgXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZWMadHv; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZWMadHv"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45c7f550f46so1876115b6e.3
        for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768668627; x=1769273427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSpCwACUwyOTmwdXYS74+KrtRzA6U66naHoZjyStwxs=;
        b=MZWMadHvq7Mo8QHzy8S/cWzURlmKBhjwRxW0USlbSmBNtYojlXJ65afl9GVFm/kkC1
         e4uF7Y629tRe7P1mQvPDMEDcFNkl4Oa8fE1NuOozYnzxKQ8soWLuI8OToOYMpFBCNyEA
         KTTMACbHEoVXtHDiA3dBvFPTSbVBqN24V9jtJoLzdzCB9zDF0q3ZxxCevsGnOnAYsYmk
         +hruaZLHU79Nm2TNjHtJbmzPXauyq0PNwcbqI6eFwiMZdClOXohmMT4RW5UQKkE78CV9
         4LiGHL41G64eRS5SNSzKjk3fOFot1WXZHdPB6WlOtQO1KePLtS4dsjZN9AxAItK6jAn1
         TOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768668627; x=1769273427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSpCwACUwyOTmwdXYS74+KrtRzA6U66naHoZjyStwxs=;
        b=tkR5b8ZQFmz4ypePE5DDy0KafDk7E+WxYR7iGal8GuU48GWLoEwweveI/QyOEdDYnH
         KMqNols5uAOOyzqQTAErx8AaAXbTwgfaYcBBypN6GszwePnN8xZpcQ1KP1EJIeGdBSdp
         xkL649nZJeOFJ/5QarXmMrU02w4ZxYXb9Xn/JgUHf3G7a4jpdBsLwoYlBBjuITfwmpCy
         2SaWMD1Oe6XYPP30hFKYJv9kExyG4fAdIQmpduSVVSvtesBWvk4GgTLDGvFIgwFIjUNk
         578wuMl4djvKLw0Ze3EJiCM8k0N0E/jI1xPK1G7cHtZ6vKBRmiTZ/30OC9/xNYNbt6jR
         XefQ==
X-Gm-Message-State: AOJu0YzKVCBRdGAk4iZFEpxo75Gk1bK7Cc1BcF+Q/sQsmWyR4eHmKMSY
	ZcB/5HW9Yw1bvJvnCtES7UH3hW6yvApqQlgobpiUXCNmlzMsB1ABmVyvxvduUg==
X-Gm-Gg: AY/fxX6KoqPwUGf4XZmjTEQDQctPptVsV7YCv7pCN9T88ogXhnZ12MF8VBFWihFRW9p
	iKN69jkjm708If9BQERqrj36+MJla4z5/J2SmuVJPrnP3tHwYHpgyizR6m3i7GHmF8pYcdXh35t
	LIjvpjTocPzFr8Ja/XhwkHg809PLmniyW5wHh/p6d2gn2OFshnUZoeZ6WEVkta4yYdQOVX7hFLQ
	yfP0M72Dlczb41+2J8+/3aMoiVBBdr5e2QmAO5HgZ2ZE88G3n2Lof3Yzq1XnT0aj0ZdZQWHI9EG
	iZkl2dixugIKWs4+PftUypN2X9d3E+FKEG9V3DPMVSEAnPQSs6yLzAfED8fIuplhBiq6CUID4F/
	G1M0QvrNQ6mJvgrS3ZhtlD6M5kUFBmcusMOQaXF996d8Lfl2icKwouqfa47PHsRrKVzb7cBRAV+
	ApeMwtb7icuE/rU++iINs6XlOz3zPdA1pX
X-Received: by 2002:a05:6808:650a:b0:45c:8d9d:8db4 with SMTP id 5614622812f47-45c9c0c3149mr2871930b6e.55.1768668627423;
        Sat, 17 Jan 2026 08:50:27 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bda221asm3720247fac.20.2026.01.17.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 08:50:26 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-kernel@vger.kernel.org
Cc: ntfs3@lists.linux.dev,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntryRoot
Date: Sat, 17 Jan 2026 16:50:24 +0000
Message-Id: <20260117165024.32827-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the 'DeleteIndexEntryRoot' case of the 'do_action' function, the
entry size ('esize') is retrieved from the log record without adequate
bounds checking.

Specifically, the code calculates the end of the entry ('e2') using:
    e2 = Add2Ptr(e1, esize);

It then calculates the size for memmove using 'PtrOffset(e2, ...)',
which subtracts the end pointer from the buffer limit. If 'esize' is
maliciously large, 'e2' exceeds the used buffer size. This results in
a negative offset which, when cast to size_t for memmove, interprets
as a massive unsigned integer, leading to a heap buffer overflow.

This commit adds a check to ensure that the entry size ('esize') strictly
fits within the remaining used space of the index header before performing
memory operations.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 fs/ntfs3/fslog.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 38934e6978ec..28bd611f580d 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3429,6 +3429,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e1 = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		esize = le16_to_cpu(e1->size);
+		if (PtrOffset(e1, Add2Ptr(hdr, used)) < esize)
+			goto dirty_vol;
+
 		e2 = Add2Ptr(e1, esize);
 
 		memmove(e1, e2, PtrOffset(e2, Add2Ptr(hdr, used)));
-- 
2.25.1

