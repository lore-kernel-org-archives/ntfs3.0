Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995A2C237C
	for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 20:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413450; cv=none; b=bqrRREdzuMUoEHgjLms/oLar8qnTYd2yTqnFzIwKUez78C/62dV4qBorZ+RHk7Fiob3BC9qvrq6uVyfrC6mhRxSfCzgEihyVpF4k9ekmMkJoXhTAgXQtpAnP+CK0HVV5uOZ8wwIeKMuM56m1Z+2FLe2UPSRlgy1KJv74Sp8vu8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413450; c=relaxed/simple;
	bh=eKyn8NXO5NCJnrd2nhmwYnVO8Mdw8+5kx8vCPpQpD2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lleehNlWTCHEkJbGKagtQDsr3GgTd5CAwoNPdtd0iMywuFK2PzVUy+YdlEqly5XObUPf/F0Res0PyRHWnqqkSjZrT/GOCvNehOX8+Re0Zb17hHsM0dylDiwVQFH10FYLjoI7Z/VxePg0rped+Tqh9N3flRxA+ER7xwzjnRR3tNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=F9+wW8Tq; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="F9+wW8Tq"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7f6f367a248so136202185a.3
        for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1756413448; x=1757018248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mH1moQqYEsSGxE3+UVMXsVz3NSOmj4LqAu+NnOGgb0=;
        b=F9+wW8TqVWXXD+adPA2JbfVrnwbKSj/8VIrp34egbwLa8oBmIlIHv2iZJa15+YauxQ
         x+aaEc9ERSz6pW1QujiisL+A0cVao/BacT3OyycY/uqLDRfLWbLQzRYBrWkvKlzRpwi+
         C3BM2nth2RZO5Yb+sFRadDF/tIKmRvDugbMRxweg+BfrJaQ+uWcXH2EjaySBj543PU5x
         2rb1h9Jerp4uEIEuwy41bRLhQkAkMykhAlGr3Z6puZT0WvGvVnLOrNAfh5yuu8dyQtUD
         JNX6uuZAJPq8DjWQd49tNgdI3t1mVKhxv4eFrhIenrUSu8KNtwhKTzVTvrfQIGIWYPY/
         OKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413448; x=1757018248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mH1moQqYEsSGxE3+UVMXsVz3NSOmj4LqAu+NnOGgb0=;
        b=CZUJGEQSWRK5tG6v9nnQiQDeGdI1CL1CYQ++WEzU8gHFj0d1HjjdTzAJJeTpdhiWpF
         n4rXR5CFPnxpLptvm5maX+n+lQ/fQnl/NUiUGbIo7ebSzUFRuBwMwKncLrrskHnLOg08
         kxNpeSwZ0bFTT+IMZCHS00WVxdyLPz0TsJWHXhdp81bFFHILEi5GF3DgFoC9IHQVH+r9
         Zlhiq3AtNi7ox5oTnyHshDzqUoQzVwUyJjjKE/OwbNEItS1D5s847urSSzpG64H4OJrh
         ZHR3B1I1O4bdRTQaOlt9C5ZTdqpj+++tPoUydQH8i9tak47NQfdDmYNgNAu6PzCnyovq
         3nDg==
X-Gm-Message-State: AOJu0Yy/HNNmaiGcavrTQ/dgqhAJR1WiU65i65G+GppXOmXQIA2GgYkJ
	miCHyER/AvBh9CX/qJmCaQeki65uqiFKoSeON+vMwQ+KxNshXR1FmpyUkucaNu7TrvGIKFzqWgA
	FQPO9
X-Gm-Gg: ASbGncujdQAk6vY7o0RBhB2OJpIuSTaDUnuxZz+oyYQk5U+qEHDb4YzKdcSSh1oB5jA
	rV4QZy3EP02Dxx/sen7vnn75t5+j7/B56smgBR6ePyPI1G2LpBNZhIjial4U8YQ0WXr9NWq6nsK
	8sUiNiK/h8hpXnCYpE9LI0lS4dNBc7TlGHGP4y/DC7hwtlg6Musys/KI1lHw2opj6Eho/d8pXzY
	pcjNy1l5OpnBhp5YrqD8Iv6n3zzZ+2gcl8Ra6nuq1Mi7ponhRcVgjwzEeZNYPk838ksDYUkuyZc
	mc4TYWcsixKE6Ctqj5hOBxDlqjEUC6zpdoIPpiJG949AJwM19ClaUGs+WJg5LYvR8EEVVHdVZA+
	adW+8vbb2ToXoch8gnrbCLlCjdfG1DpFxnJ2i7WnukxBGrBi3Jer5VIFY9w4=
X-Google-Smtp-Source: AGHT+IERVxha56qApbTM7KtcTfottUjnLoIFBt+FYBzEzeioMpqY/O4nfcNXgi1nY45nfmgmpUTZIw==
X-Received: by 2002:a05:620a:40cc:b0:7fb:423d:57ad with SMTP id af79cd13be357-7fb425bde6cmr282181785a.47.1756413447643;
        Thu, 28 Aug 2025 13:37:27 -0700 (PDT)
Received: from ethanf.zetier.com ([65.222.209.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc153de18asm45879585a.54.2025.08.28.13.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 13:37:27 -0700 (PDT)
From: Ethan Ferguson <ethan.ferguson@zetier.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: [PATCH 1/3] ntfs3: transition magic number to shared constant
Date: Thu, 28 Aug 2025 16:37:14 -0400
Message-Id: <20250828203716.468564-2-ethan.ferguson@zetier.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828203716.468564-1-ethan.ferguson@zetier.com>
References: <20250828203716.468564-1-ethan.ferguson@zetier.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the common FSLABEL_MAX constant instead of a hardcoded magic
constant of 256.

Signed-off-by: Ethan Ferguson <ethan.ferguson@zetier.com>

---
 fs/ntfs3/ntfs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 1296e6fcc779..630128716ea7 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -280,7 +280,7 @@ struct ntfs_sb_info {
 		__le16 flags; // Cached current VOLUME_INFO::flags, VOLUME_FLAG_DIRTY.
 		u8 major_ver;
 		u8 minor_ver;
-		char label[256];
+		char label[FSLABEL_MAX];
 		bool real_dirty; // Real fs state.
 	} volume;
 
-- 
2.34.1

