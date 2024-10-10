Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692551C2457
	for <ntfs3@lists.linux.dev>; Thu, 10 Oct 2024 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728558033; cv=none; b=VDe1IZibBS7ZyrW4ksN2RXr9uBCcqxApRW+jngiF1dS8GOEa5/6K6jcf3klxUAvCFuDpMuGZdYd9pF1lPXLLzekMBq3ZwQcwwlN4ue/4+0XU528CH2vJdfzfjoUL5bj0a3TQcvCG3+fJ+6X0zNY2rn9i5GRlcmwjTdxr2KfR4g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728558033; c=relaxed/simple;
	bh=f6kBOvXqEEvA0RSqMTbMkrWDSbziBuOzQ1mA4xkEcrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bXuZemd0nRQ0hiDs4uIlioEvJjUqq7x7XXN4MP+pZGg2GhXKtCirqLPvrITaivWPAtySo0YRH8k1AUxi4V6ncHILBbDqhq7IzsWyIHG5/n2md7gDk3IFWuT9Kf8vEfaV1y66/qTEba5rLAjvzR9obv0PTW6qFWorDGBVuRxVVHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAnfVxEL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAnfVxEL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71df468496fso783616b3a.1
        for <ntfs3@lists.linux.dev>; Thu, 10 Oct 2024 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728558031; x=1729162831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6kBOvXqEEvA0RSqMTbMkrWDSbziBuOzQ1mA4xkEcrI=;
        b=aAnfVxEL3ZOdiyWYzAmWEHZr2xY9HDLez3APXGwiJ/bUwJOWRJmPZyC7eve9ZuOMj2
         JRMr3N55nu88KKai3/61mwAEV5Tieke1npu1trFwZghqqw2zohBXl6A+ylRWQnZT2t5N
         /pzqYlwV4UvupjoPC9yyMCbrLZn2cTv1iIMNnsd3iUIgPiKzsYF1ACaJ57TKwhiaIrnN
         xmMNq5sU3mnPg8a3ofA/B9OxVMFjqdaR704Me3P6ZmF3DJG/YyAJ9e/zrrFsvs1FFEUL
         jCVlYeGpJpu8HQ00i/u1WwMEk2hNWBgL94meMg4hlpNnkeI6WqyIajkRzJNERAfpvZl2
         v1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728558031; x=1729162831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6kBOvXqEEvA0RSqMTbMkrWDSbziBuOzQ1mA4xkEcrI=;
        b=mWew+SaDfX3Hu5vFu18qtgL5510HTPltkGETtSXTqO6wucYlDVo8kdBEZMojmTRqVF
         nGO5Tf0M/3GHnWwIli8+79eEwcaRsqzolzCgSQ/yux1phjRrDkRqdIIbrfYDxSz0gjmu
         gKGG5v57AkPr2XF9e42qIaIgePc2ljykezz4Dd2rvU7NmmFUvydqzfgd5eKlEnsPupsQ
         n4QKgCle9GPzzjeZMGldxjXTKUaBKd34oG3BmqE3+5Y4Ynm9v4TrPi6rFVcKVRwhkSkg
         TX/XPpfoGBHhG/w4EqnAWmHSMq9oxnBcWCSqmBOuRbcfSbpUK3vH6ekNCQD9HrKsN7ad
         s4tg==
X-Forwarded-Encrypted: i=1; AJvYcCUvusFGOxqkCne39iQ6dCjkHHHImHLap1nyaPXNJtDaUsL95pflyzOq261ZJquCXiPRtypwEA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8OtZLZ1QBkfLAP8a00rFTRvYTglKTTg6S+muepx4sCM37VVXe
	q0yza1CXsMiPmPWn68+WP8HinYYwYf7Z+tD/7HfbZeJCEd71oX3v
X-Google-Smtp-Source: AGHT+IFlu5uf1Qiom8RsM+Bq8DEd5QG73nk7g1rcmg6YkaP8ggiuvYyIBezZvNEv3/eWA8PBix4Qug==
X-Received: by 2002:a05:6a00:2e8f:b0:71e:9a8:2b9d with SMTP id d2e1a72fcca58-71e1dbce0c4mr9978027b3a.23.1728558030276;
        Thu, 10 Oct 2024 04:00:30 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aafd100sm805625b3a.190.2024.10.10.04.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 04:00:29 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH 3/6] fs/ntfs3: Sequential field availability check in mi_enum_attr()
Date: Thu, 10 Oct 2024 19:00:05 +0800
Message-Id: <20241010110005.42792-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001090104.15313-4-almaz.alexandrovich@paragon-software.com>
References: <20241001090104.15313-4-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Konstantin,

Refer to: https://lore.kernel.org/ntfs3/20240820105342.79788-1-llfamsec@gmail.com/T/#t.

In https://github.com/Paragon-Software-Group/linux-ntfs3/blob/master/fs/ntfs3/record.c#L267.
The code did not check the 'non_res' field. If asize is just 8 bytes, it still trigger OOB.
So I added "if (asize < SIZEOF_RESIDENT)" before accessing the 'non_res'. Because
SIZEOF_RESIDENT is smaller than SIZEOF_NONRESIDENT which seems to be the minimum size of
attr. Or maybe we can use "if (off + 9 > used)" directly.

Thanks,
LL
