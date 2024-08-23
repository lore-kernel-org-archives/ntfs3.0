Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D9187FEE
	for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420974; cv=none; b=oX6K4zNx5lPQT84cWh4MKwZwuqOyfKZaBqWZ7tZdEIS3k/b8r+1tUxcMVGYZnXIlsaedH2aor93xspQ4KOpaP4d94aAfLXD9vCLmAnd6jcciMpRg+IEJ0muIfxkMk/qwLReuaahMr6gGikE1A0de3sRC7QgRmnygCgQaUgfuJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420974; c=relaxed/simple;
	bh=UF91XnzIhdId96XFTNCn4pc0NyR17a+Z94QxjN7qIwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TIoiX6PLdppzpNu1MoxZFWYZ6qtggtzCrPxTZme6lJLNIAJAaOic+OGExuRhpljT+by1BdUkPpALL+IEx9LkPAlIUdZ2tkYRKI6CSObGC99D4cLLY2TViK50idvLl0tUN7PmjISkXKmZxH+j5zxvfvQHYn4kRwMw6ZFfHoKA76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+E3jvl2; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+E3jvl2"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so1639870b3a.3
        for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724420972; x=1725025772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UF91XnzIhdId96XFTNCn4pc0NyR17a+Z94QxjN7qIwg=;
        b=k+E3jvl2r9eXuPGwpUqdUR+j3j0+I5WKXGU34uTIwbcaR23n0xL9dsFn96zmllLPzz
         /2jTlBoLl0jXFG4y+07zKExZidz3b448bM5TshWW2n0qBm3TXhbf4cMudi0Fr1y81wKf
         RWpIZJGYFVRF1dQUEAzeD4hYO1BMrhjZXCcFpsEIbsG/uluL2kxSPH5V9LebYgNZuzCC
         /PGM1x5oIK4GXbyVSZboDdBq50xWh3KkV5uT6w5zb/uCE7zqZ+xRNEyFXyIWjpZbSl38
         vFimSmnauYQzGwwjhL6VJvy8kWQEsJRGafLHuxqVOO562TbcdG7p68UwBOLN1x95mfgd
         PGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420972; x=1725025772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UF91XnzIhdId96XFTNCn4pc0NyR17a+Z94QxjN7qIwg=;
        b=mn2tVRQsaEoZVkX2jdDne3yszFO/koH0aFB3uRh6/NzZ5hiwVRQID5i6v5IQ93SrOP
         B/5DTJgAlRxZHC5CywpxFk8E7KkRm6z5UCtCfKF7RUuqxk0qIMeKosygAnDcmjCkz4yU
         JNAJk7T9ikImgsOIS8p1nRUx80ozBoLUXhz4zCwIE+urB3s16wVtH2mTUtVYTUHS5m1H
         yuqXyzKKGHBo95Qd7hjsvDYPj68r/XJrBnlV4QUBNcDmyUCfSSUx2WIDfDNRvInzvS7T
         oHbfdKdNEKEkruUTuA3d6PnujVpaXNGKXc3vbjWliY8yRfKONduS3FGuZJ/sY8amvzh0
         ggLw==
X-Forwarded-Encrypted: i=1; AJvYcCWuoqYEo92iglxAxF35Exxn1CoYXLyIQbzpLZrzEfollxgHnQ6xwLpZ6Wn0Gi6vH1weVzpPMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHlEyRE14qf3B7CSlq4q8Dm2bk2rfzmVybWAqod00rIz517Iw6
	VzqL9I2UQwXDWGwWghhfeqH76R7DLdIyv6mG3bQj2aGwmN/V6mUJ
X-Google-Smtp-Source: AGHT+IHAqfeaLETCZy3AwjoeCp8tYq7cTWz6Q+xLtyJxclWB1vmYSTUAZp3w275R3heb2xrbpQbcjw==
X-Received: by 2002:a05:6a21:3a41:b0:1be:e265:81fa with SMTP id adf61e73a8af0-1cc89ee544dmr3001518637.35.1724420972039;
        Fri, 23 Aug 2024 06:49:32 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343403b1sm3026063b3a.211.2024.08.23.06.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:49:31 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: llfamsec@gmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	lizhi.xu@windriver.com,
	ntfs3@lists.linux.dev,
	syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] ntfs3: Add bounds checking to mi_enum_attr()
Date: Fri, 23 Aug 2024 21:49:11 +0800
Message-Id: <20240823134911.211897-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823130503.177723-1-llfamsec@gmail.com>
References: <20240823130503.177723-1-llfamsec@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch ignores the last attr is just 8 bytes and type field
is ATTR_END. I have already send V2.
