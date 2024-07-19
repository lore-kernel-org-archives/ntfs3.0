Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962831494D6
	for <ntfs3@lists.linux.dev>; Fri, 19 Jul 2024 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433103; cv=none; b=R0i4HptqnQACCY12cDHfvwEUdgYDVi56djwZ0Ybrtem3w8IA7ra19rhQQOXLdXWrmUIyYqxaqO2BDhIsXFXutN43RYYxYbhFaMvJJrfnDF4PptQWscVVY3nAxSoH3EkOYtkAkYuN4mKV35UJX3qhsvtXpWCHeDGa1peOn8fmx8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433103; c=relaxed/simple;
	bh=naFm5TvHXgqUwFoHmqSUZAykEB9A6IS1a5cPpdMknpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDWN+bvKS1il7hdN7Kc9QKvI6VDJS0jMCmbIppDaYcQFstpEl1EpMDOuiflz1Vq/pQ+B5WwpZw9p891Q66HvAoF9Trifwxyu+quUBI6KFowPTOGhvThVYI+dXcGhovHKcjkqh8WRSBqeEXMPn1ftSZatdms3HRNv3t2rgIuCl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFiNVUE+; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFiNVUE+"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ce739c2650so1325686eaf.1
        for <ntfs3@lists.linux.dev>; Fri, 19 Jul 2024 16:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433101; x=1722037901; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcwzpxps+JjRXmI4DQCoUJayMPXI5OBJ2G7XND1/vcI=;
        b=DFiNVUE+/hcp4s4jdURmgkL+Ownu53nNWzCZkFvC4U9LW35hYez1h75Avbz0J8W4f2
         0Au+a5A6S8GcJxeDLARqOCkXNmkn/ZVo0clUpbc2y//s9ksMT57oGZ1URDaAPn9Jyw76
         wAyKnY9vfcam+O/eQOPqrwpj8xrg8Y326x+NaoKjL0IoFiYg5ucoNODdNZGycbY+LsAK
         Ox+NqAZ7DwR5mfAidPbiDgGZWnwxD65HmVpts77SG2hpHgoUwrg2amAip42kiF6FFGHA
         P9+GmV2arenC2akJajNQEjrmT+PKqrmWln/GQbo6MtKSu2RugHxR67NIVdw6ZGK12eeU
         qbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433101; x=1722037901;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcwzpxps+JjRXmI4DQCoUJayMPXI5OBJ2G7XND1/vcI=;
        b=LCSHVZpH+5iW7f0JyAa/6CcHigA0K80fg4hQxQdMyKpax9kalX00iI8yx3iQuGGiTw
         96FdgWxMHEGldMrmt73wYYML2KtDrubREkz/KznD0t3O1G6CAnAjwHOr2J2NWS2sFKqM
         oePmUyt3h3aR/gN4BUzm0jbFIKPZU8xxvKG2ImZx43B/eypdevfSwqW1tKvjIEFN3lFV
         v7teYe1NYpU3c1mN3yWTm0/QL5rRwo3wrX0FahS6t4nHUa2CsYCbnS8QWCzZauGhtTRh
         RDHLB/6ZHlwoJtfdiLnd2bWjduVFu3kIMyHpsAd8kotbziRXvs1aaIbM+4DdONhWnUPw
         Teqg==
X-Gm-Message-State: AOJu0YzHX0y0qd+Z6jkOJ0pww/qmlGcr492Tmlp+PGmWB19gum+sAjX/
	S5B4yOUn5duwG6QAD304SCEtOzCvjMyuDXY6r1RF6edaAM7Mx4WrFvLIcsBlAG9tF+Xm+s0iGJc
	l
X-Google-Smtp-Source: AGHT+IH+wx3SbRiZO7JM/9dH5ICnc3W2R+6rK03AcVG8OA4IviojAJxli3pgugFA3ivLcMzqJPRgbA==
X-Received: by 2002:a05:6820:c8b:b0:5c4:144b:1ff9 with SMTP id 006d021491bc7-5d564faa2ddmr1572731eaf.5.1721433100768;
        Fri, 19 Jul 2024 16:51:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d55a7fa3a6sm426097eaf.9.2024.07.19.16.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:51:40 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:51:37 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add NTFS journal
Message-ID: <e8f61a71-1356-4eb6-ae94-426bc3da3eb5@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konstantin Komarov,

Commit b46acd6a6a62 ("fs/ntfs3: Add NTFS journal") from Aug 13, 2021
(linux-next), leads to the following Smatch static checker warning:

	fs/ntfs3/fslog.c:627 enum_rstbl()
	error: we previously assumed 't' could be null (see line 616)

fs/ntfs3/fslog.c
    612 static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
    613 {
    614         __le32 *e;
    615         u32 bprt;
    616         u16 rsize = t ? le16_to_cpu(t->size) : 0;
                            ^
If t is NULL this function will either return NULL or crash.  Can t be NULL?
If so, why not add a check for that at the beginning?

	if (!t)
		return NULL;

	rsize = le16_to_cpu(t->size);

    617 
    618         if (!c) {
    619                 if (!t || !t->total)
    620                         return NULL;
    621                 e = Add2Ptr(t, sizeof(struct RESTART_TABLE));
    622         } else {
    623                 e = Add2Ptr(c, rsize);
    624         }
    625 
    626         /* Loop until we hit the first one allocated, or the end of the list. */
--> 627         for (bprt = bytes_per_rt(t); PtrOffset(t, e) < bprt;
                                         ^
NULL dereference

    628              e = Add2Ptr(e, rsize)) {
    629                 if (*e == RESTART_ENTRY_ALLOCATED_LE)
    630                         return e;
    631         }
    632         return NULL;
    633 }

regards,
dan carpenter
