Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609ED145B27
	for <ntfs3@lists.linux.dev>; Sat, 26 Sep 2026 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430231; cv=none; b=f7oRqCjO36dBr3eCIFYvdIAQoOCWJq9HGCVsK6z78HzzwXhMh6NsG4fmxiA78Ncud6Pg8+xFJklDUhF0ww3DSaNv/Fb2wN7j7LD2FZw++2MFBKskDzIY0peEfdBgA2gzrDk6U+69GD1W8Mcgsk9mdMKBUg6Dtte/glyeujLmsOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430231; c=relaxed/simple;
	bh=7Bp7LBTc8yVH8ZU9J3yVkFWhoJolyTcB/LHKig653C0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKtowADQr3dxXmxRZblf5sZc7wc7D2+TKOqTCIHzCTUHZEvtomL2Z5QCymsWk1LaFgbkDXbfqyrJJMBGPdI0U7OxUfJPzGRbB07L+8tsjJH3W9xvfAX+DkRsq7cL3vgP9j6veRD/oQ4DccfC0KdiMQvjdpQtgRpT5cIgMtcOlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ek6fhKmR; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek6fhKmR"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so1067562f8f.1
        for <ntfs3@lists.linux.dev>; Sat, 26 Sep 2026 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430229; x=1791035029; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAhNw2BBzIiF8PFIH+O8m/y4aYCMQt+xp6nqV5oRqKk=;
        b=ek6fhKmRaP87+5MPVrmQmHLCJt7ks8FsTCc00xsk3ufS9LFvRTW/yGv9XcWFBkzUJT
         9+Vvx/Cl4yAIpI8uvhH/roYRRoISQ9JQFFPaLqAYMGElLHrtqhQ89ajyTzdStEr8QPB5
         2cIvlS6dgLA9vYOy9vn/Te+FFBTZ8vAE0mfgIiW1cBOS6B9lN8N6i+Ub6qEpoS8CP4MZ
         jD9C1mZbypKuHsaDRdARMY+GbnvIzJiljP1aK982KtRSoTmthakVJA5gZpknNjTlmulZ
         n/OXRyhscWgH9kl7Tog6WZpodb3ja3HzVG7faG8PYZwyRit4ck/y/0mXywCCuNa66tzc
         0REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430229; x=1791035029;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAhNw2BBzIiF8PFIH+O8m/y4aYCMQt+xp6nqV5oRqKk=;
        b=pHt6C1Bni1DP8PDVhg+a9+lbZEKY2Q5xfw/eIgkTbbbFXyIBfdvkSqB5677UPTwlZv
         RGA2G4hIvkwN6IHs/sfAymrwwDMFe6sr4Ez+Z8fbjqqAsShh1P2lowk1R4jrqrof8MIn
         9G+80kYkrr0JjHlLQpK0/GwQLtKikv+Y8/eFsGmLulAAil71xFIIPDXKzd5njbab0fFu
         HeHFdPXBD8pQdu0Cb07ld3SQeLok6xaXYub06IFe7yEqCLTvY/O4/QVLmwXVp9LlYVf6
         z+J3wSupmb3minMlH8UIeV/B9kC8dgASAgLDHaKK6nJK228gfUvrM83zBJsQHvamIGcT
         ONuQ==
X-Gm-Message-State: AFuF++k7WVbAkMxLv4fjNNB3HwhMaMQgn1arUxq9gtoY6WXhOmvMxQWq
	paSdtioc4SgthsQ5BkCNJUUAfTPdzI5BJG1vTmzkWedcuA1WpZ79NYDgFkOwFCtnIfRQtw==
X-Gm-Gg: AYBFou3yip3U/FqKAfJt2vxawKnpp+qGJ8bXPTGUDQp7kypWiHTIk9tnPkSp8mIQLp7
	psoW5jquqPn0FzxG7vG5rjgJJwqKl1zW3SvidOXeLxk9F64I0d2TqshhvE9OwVCL2ql0Krp+0a6
	xmkjCcy5IT7I8XcjGQKQmok9jCKHVmg2CTLsE9V9NFmoS7R83Nb1VAaFC4Td39bFAaGJIlKxhru
	oZRUkzwifko5+QyujWI6yw99T7vy+Lcpu0IRjElxSDRaxhlW+/6OyeZGFFy2eR9mG6Z6HrLni/u
	U1bKgZ356VK/3sQgYVsPN62MLjZ+k64Y1pPdDHdEC8xVjQFW76jNIyuCTzn5pWzzc+KPYhx3k0g
	L9yOjq4j8CnYRpfz6BcWMaI+kfxxxdgoNRC5sb9qagCP9EJOokqfvaJeoaztWQjUitLGfP/s3oL
	v6TxLOCv9ZwAtJ4Pj1fyECwDzt7bePif5S6DqWNRObVF5gSME9e3dBEUTOVfCuRGuFpH8=
X-Received: by 2002:a05:600c:4685:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-49ffd2d25bcmr25030915e9.27.1790430228608;
        Sat, 26 Sep 2026 06:43:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069d071sm161807295e9.5.2026.09.26.06.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:43:47 -0700 (PDT)
Date: Sat, 26 Sep 2026 16:43:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandro Calo <alexandro.calo@nozominetworks.com>
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Fix OOB write if ret == buf_len in
 ntfs_utf16_to_nls()
Message-ID: <arfMEEmsxD5mcZAd@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexandro Calo,

Commit eff11b5a1eac ("fs/ntfs3: Fix OOB write if ret == buf_len in
ntfs_utf16_to_nls()") from Jul 7, 2026 (linux-next), leads to the
following Smatch static checker warning:

	fs/ntfs3/dir.c:37 ntfs_utf16_to_nls()
	warn: inconsistent indenting

fs/ntfs3/dir.c
    19 int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
    20                       u8 *buf, int buf_len)
    21 {
    22         int ret, warn;
    23         u8 *op;
    24         struct nls_table *nls = sbi->options->nls;
    25 
    26         static_assert(sizeof(wchar_t) == sizeof(__le16));
    27 
    28         if (buf_len <= 0)
    29                 return -EINVAL;
    30 
    31         buf_len -= 1;

buf_len represents the sizeof buf - 1.

    32 
    33         if (!nls) {
    34                 /* UTF-16 -> UTF-8 */
    35                 ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
    36                                       buf, buf_len);
--> 37         if (ret >= buf_len) {
    38             ret = buf_len-1;
    39         }

So this is wrong because we're now putting a NULL in buf[len - 2].
This patch should just be reverted.  The original was correct and
the new code is buggy.

    40                 buf[ret] = '\0';
    41                 return ret;
    42         }
    43 
    44         op = buf;

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
