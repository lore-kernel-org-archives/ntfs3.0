Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94AF19D082;
	Tue, 22 Jul 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753206049; cv=none; b=E/ji8Pk0Woqw80JZ4NO2q1P2Z2olU8jLKVUeYPni/Ptf9kMx5X8avm1Y26sYPAxaaGgAlqMeX3fRG42R+9yYYEkptH0eNWIjvyVjIwIGrkP15UaojTJXt53tQzhKiuWXQkhcvCt1N3rgiOiub3NmcvJfj838ApyoSkmu31f/2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753206049; c=relaxed/simple;
	bh=WovQaQ9PikrY5uLmVbsHl3tpSSKbTT19zMVimO8nhF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m5MDeK27cCQN9ryFWvB2Qf5Jw2I+9+bqdMvTWAfWWxBDUTYnxR6A8I/rxs8mbmsRGNBgn7gxoR90HmiYmVTRx0hCbp2LKOHvQsLeoCcRLexr+5Q9Ydjs9DdVMR2UunE1pXBxGdULo+8H/3kQguVaeYfP0WsVpgQ9p10zVtlEFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSCaMbhU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSCaMbhU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748e63d4b05so3491634b3a.2;
        Tue, 22 Jul 2025 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753206046; x=1753810846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nTeLrKufhqWMbv8ZxgNZNY3CTIL94aICMXLX0urdhU=;
        b=nSCaMbhUyboWETq2vonAsL7VtC1JdMpPcrdYRNnb28YzsFkcMtCuSMKmBjeJtaIZuL
         sw7TZIwqbMP0y+kJfoRpw2o32g7iGjDY4xHYkzxi+mn2KtioL6lhVNDo8ISTun4LepES
         sAiov/4jlR8Q3r7BFp88nwIfwtaU8/l+kZJjLsjmXLzUy8W0cZn8MLKUGEs7N9JGqQjy
         2CDWqfYCa6o417d1mjUMooTcBm66dGYeyOLEaDDQPnTCLwIHpXy/LmM9w+xssvCP4Upa
         hUOuS3w0tWkSFGCwM0xCrAsrsMuTzrndz1UjCZoWolIDaiur+mBHtM9astwtosyNTyhg
         5maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753206046; x=1753810846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nTeLrKufhqWMbv8ZxgNZNY3CTIL94aICMXLX0urdhU=;
        b=Q4W7Gsmwy0KSmSiMByJa7t7DAedfAN54Oe8+x7Z3l6/CZ5CQWoAMGdVEz7KBRQlGc7
         9iUheyTevKwATqxflsebYRRKtaKz1im9Hubbd/BH+pzoY05gJO2D27HWJf/xB1Zhoynh
         HFQeFp7/NOGnESl65kY5GA0JQuzYO4RoXi0rdJp9UUsZiYxYKg67EcbyweeOZJQ0f3k4
         vN6MZPWAqqMgnu06aU89U/PkjaOPwYHAWnU4lzrglxOiYgxOJNm0GF4Lw/F6AgZEYwQe
         o+ltf9/8tKK4i1AY4A+ZarCIZbgNtUh1bR+5ayveGsLSDGT/MU8beOeCbZaU/aS38NxX
         UpYw==
X-Forwarded-Encrypted: i=1; AJvYcCVcVywa5R7lgGZTQ868/QRu+quTifMzuaPQwy4A8Dnm/WA1QD6Ww4W9ZcZpJK5zAEOHly8Wa5wDAWy/yyRX6CPzPHRxRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yww8yoqTAjPNDNwlJ6mBgvY8aPKw3ofeUAwfkU8CmYYchHDE0rX
	wmYTFzT3Stg+NVdEsBfvbj5WsSt7f/VvHAsIh+WZgpeCkVxEUqrVkMJg
X-Gm-Gg: ASbGncs+fQUe28Wl7BGrmuD+iPtQ572UpFkgT14KfIojZAe2MB5RWUNHYG0xUxdmifT
	6p9pGivOZFIzu2nTIs2yxeh0Ih9aHR9Dk1dhUtzAkaUKanGYU6ILjPl3v/pnUJfgUe9OlCDEql0
	V+ceT+eslqKpOhNbk5ZAtP6ZpDX+VeRIl3PnxDn6YhzS8ePdaJQeHgtpFRV7LtGvHE4iCrxEWRq
	IHHCUO1oV/2zoKu2VQrXkfdxmdqOBYnh13fEkOQzosuB8MGoQTQc0HNgKaWL+E0BXqiJ2mmDyT2
	ZTp4weZbR6/SH53OTvoeQZSDIK5hoR54V+vTH+HGNuJl+Qs/I/jBugQUnH/IwQ7+585nwDewJqk
	7A+zs9MlVsNCYpnFxhkWuf5TgMvVix1CP+a7se5f54d2aiY1ygAHz9hkYt63z5137ZetGWRYOX8
	XXx8xI
X-Google-Smtp-Source: AGHT+IHXofxaXAuzCTLZ52xYH7I3ZxslIzIjmJnqbJ8FLMUIdSLObu7TSKc0W/EqY0JYX1uN7V/HHg==
X-Received: by 2002:a05:6a21:6da3:b0:232:5977:bbfc with SMTP id adf61e73a8af0-2381225eb60mr44715347637.10.1753206046007;
        Tue, 22 Jul 2025 10:40:46 -0700 (PDT)
Received: from p920.moonheelee.internal (d173-180-147-14.bchsia.telus.net. [173.180.147.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2706sm7936159b3a.31.2025.07.22.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:40:45 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH RESEND] fs/ntfs3: reject index allocation if $BITMAP is empty but blocks exist
Date: Tue, 22 Jul 2025 10:40:16 -0700
Message-ID: <20250722174015.274146-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Index allocation requires at least one bit in the $BITMAP attribute to
track usage of index entries. If the bitmap is empty while index blocks
are already present, this reflects on-disk corruption.

syzbot triggered this condition using a malformed NTFS image. During a
rename() operation involving a long filename (which spans multiple
index entries), the empty bitmap allowed the name to be added without
valid tracking. Subsequent deletion of the original entry failed with
-ENOENT, due to unexpected index state.

Reject such cases by verifying that the bitmap is not empty when index
blocks exist.

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
Fixes: d99208b91933 ("fs/ntfs3: cancle set bad inode after removing name fails")
Tested-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 fs/ntfs3/index.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 1bf2a6593dec..6d1bf890929d 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1508,6 +1508,16 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 			bmp_size = bmp_size_v = le32_to_cpu(bmp->res.data_size);
 		}
 
+		/*
+		 * Index blocks exist, but $BITMAP has zero valid bits.
+		 * This implies an on-disk corruption and must be rejected.
+		 */
+		if (in->name == I30_NAME &&
+		    unlikely(bmp_size_v == 0 && indx->alloc_run.count)) {
+			err = -EINVAL;
+			goto out1;
+		}
+
 		bit = bmp_size << 3;
 	}
 
-- 
2.43.0

