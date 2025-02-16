Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7D154C05
	for <ntfs3@lists.linux.dev>; Sun, 16 Feb 2025 20:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739739139; cv=none; b=VudNQtE5Limi9N1LcI1IvysyPaEnq6YPK33KbjNWddYHO5rDLMwVf+aQg4YVtO4TqPcO1BLLOgs6S2BrcklRs3ZnwQBY/XB1OObckwGyvkHZmazT7Lb6pfmVf1ZlO6JMdfX0oKZzmDc5HlBQRhAY6lfcG7u4qHxKs64GYMtfpXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739739139; c=relaxed/simple;
	bh=aXs0vWAmuS0U8j3KJYwst5oPNJcMtkOfy6vx1+vPaD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxAFcRQqC8DFxTodviBLTHTQs7OgTam/KQs6DK8Cj7vlh/D5xcOX39UFvbQZ6LQHH2K2exPv2A22X6NRjwhV4/js+gaz1eGYZBOEJx7CV092o4QFpiXfesgLYmKgwAQpbGH4tc5tbOi6Bwq7oujHDPeT+NUCJihkLOKB0torKLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tyZmJH5r; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyZmJH5r"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so3038043a12.0
        for <ntfs3@lists.linux.dev>; Sun, 16 Feb 2025 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739739136; x=1740343936; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkyPg/crIfWv0Cn6JEGTdKe/XqmIlkAQmtesjInAumU=;
        b=tyZmJH5reRKpF9BPNxAIMsElhx94dYZrv4OS9p//JzhGKcOgfqTp5BRPCfMtjLiIRm
         lNFakd9ySCohH7RgfOLztWiN8kesqeIr+epEi3FQJJIfcfUY6+27+2CmEqjqhZDIQ/lF
         +wah/YEtYoAik0A+9M/YFZGMZ4fPVSxukwmNWl535Ug5r7tTIh5HpqmerQQO+sbU6cuT
         DWW+VArzQ6ds1yRHvRDgG6k3pgXJErKHA8WwqSZrN1F9Toie/QfpGBOXwIELuTjkuMvJ
         3JPascHKyDvosi9P42TCxorsCEmpScWv+clPFiAWNGKvvTABBnBwqx9gLDZDXrRHj8HZ
         xkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739739136; x=1740343936;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkyPg/crIfWv0Cn6JEGTdKe/XqmIlkAQmtesjInAumU=;
        b=ITAPfYZ2Re7+v+E3xdxYvR09SFPnTdPdGnNtvjSBINfpn8utRXakKwS4mooXS9tyNq
         hAwqp300/Ipvw1UfQXIWJRea5Z2v0dZIMCSSxvrgIiyRHrQ8v7UOxggS/XShsQMxZRyS
         ZMSl/qQSzhpzobIp0tRJFyApnDMoD++FfLRp57lOjDYfjeTK/9/gblbuKh7hcljE2veA
         qocbKxRb1RDaNM1Y1KBqpgfYxePW1OwcK6SOP/EC4XB5lNFi/r6kBHGZyQvimlxGGy+r
         kTuywclFTaRdiBHl8UtoFG1MyS2Ef5eu0IvycVctWSEt3uf+u/WcZomUlO9tVipdutj/
         W76Q==
X-Gm-Message-State: AOJu0YwpDv5yZwmxlcZVxpsARiYZaRRdMtqaf97lKX3R8Frwtxg4zCxX
	s0BZ58rZE/IYVx/HaJja5AW4etWy2TkbXzH6CVmxK4B+O5gu7ULvWHdI/CY44qA=
X-Gm-Gg: ASbGncsgrrie0Iq6CJySlmWvFTW0i7ys2NtGSRpBRLzEyIcXU/DguRbEcwiYB3H6I8B
	e2XvOmIeuwfJkBhoqnk/RYvzlfekZQ1QVuALO3YkXXMrXcouo6F6G/99mrnt5J/Xwv0Rv/gpIv2
	pstEhI9JvFfFPHlRROFO2DPQml7buNLdzrx2fHk19hOtHcLg6RQOZ8OnVnyOqac/HkMR/SgufhP
	avp/DrCBzhOsnXLBYHWxJtVFQfMR3OwZ9OCXbuUTizr9I9BYPeNRFH13dt2sXSEcyIUuF20v+Os
	qtSyiXR9fcBm3FOr4kyJ
X-Google-Smtp-Source: AGHT+IEMU++D2lnTLgi14JzxAcN1KpQU2iWjj9Zk4bircM7Q9WHx1vcmQHv39BJ+Q3JC4O7xeGXx3w==
X-Received: by 2002:a05:6402:42d2:b0:5e0:2996:72ff with SMTP id 4fb4d7f45d1cf-5e0360bdf15mr7424447a12.19.1739739136154;
        Sun, 16 Feb 2025 12:52:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1b4e99sm6273670a12.16.2025.02.16.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 12:52:15 -0800 (PST)
Date: Sun, 16 Feb 2025 23:52:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Prevent integer overflow in hdr_first_de()
Message-ID: <b78ff7ff-f260-4499-beaa-169f725abff9@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "de_off" and "used" variables come from the disk so they both need to
check.  The problem is that on 32bit systems if they're both greater than
UINT_MAX - 16 then the check does work as intended because of an integer
overflow.

Fixes: 60ce8dfde035 ("fs/ntfs3: Fix wrong if in hdr_first_de")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/ntfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 241f2ffdd920..44c99d35a59c 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -717,7 +717,7 @@ static inline struct NTFS_DE *hdr_first_de(const struct INDEX_HDR *hdr)
 	struct NTFS_DE *e;
 	u16 esize;
 
-	if (de_off >= used || de_off + sizeof(struct NTFS_DE) > used )
+	if (de_off >= used || size_add(de_off, sizeof(struct NTFS_DE)) > used)
 		return NULL;
 
 	e = Add2Ptr(hdr, de_off);
-- 
2.47.2

