Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F91AED50
	for <ntfs3@lists.linux.dev>; Thu,  4 Jul 2024 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720101924; cv=none; b=I/2j7LFtG8PYePuR8bjk5ysI9vUkquh57NJyhttORFPBlXYyyDJK6GBUKyruMdM8Qf03qWcdkwpj9+CnpAXjMtls13IpEvTan6M7HnbQx1xtfuS5BlgZjd14xL1JQPAV1/Aev++7+zvXZLJMUQY9GvAh4K1XZMSN3BxAOKaWfmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720101924; c=relaxed/simple;
	bh=Ayx0WLWW+9KL0gpuYdMOovcPLAzB9yRmH5mDo4ptY3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbSohcQTXvNGvU/kW4PoqWiBJh9BVDV5YZYYimlGfFjyyDb+Ol2/kidHRWPRg0kdJ3fxGYv0cqvj7wPEfKN10gd/uyWMxpf8kmgwP6cIzV6bGq1MpxLoowMnbWnBLDyaj6ty6W2LyACVgrqDcfTQQsG0MsKToJ90Pk7R+3T6GdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT6vnSXH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT6vnSXH"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ee90f56e31so3821921fa.0
        for <ntfs3@lists.linux.dev>; Thu, 04 Jul 2024 07:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720101921; x=1720706721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qMZgK9np1473SJ5xqx0XcxhQw5giPc4Iy7ytd0ErZ5Y=;
        b=RT6vnSXHsgqQHkDms7mmefYd6HJGKfPVO+Cj5GnqfDukBJ8TAYE4T/cuDtct+uIU8R
         PIF970Zh14NApZvLsaoDxVQYLJNmf0YlbJTt/YOVIg1ZZPBLDoZ5L6QrKV2b9FuuzcTx
         yvUjcFPdHPY7/qTXqtzY3HStpX6FrG3ld3CgDL/19NOMLTyuNKpw3IY5EiuQ4XU62aMe
         IrPAcP3RpUk+RTo4A4AWIc3mHmHhdceynMmmBK5+4KNyX4RtUXlYVupHNXgb9c6Mkd/B
         DFEeTgyz6LF5L8+pbRV/xZnBoe/NMYuR9tExp/ZyrsxNDThLvf9AZFRV83idBwYaylzc
         vNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720101921; x=1720706721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMZgK9np1473SJ5xqx0XcxhQw5giPc4Iy7ytd0ErZ5Y=;
        b=rQ996ApV5R4ZmNkL4bsvd/1Pzy+ZrrZW0GhuCy5V3INKm1nhNMJgDj6lYMIua/ged9
         M7tdgqs3ufmnigZ8PYFf8qTWF7q08JcGNoyxWf1uWu+AjfD8p565B/9FD7KRUZfyaeLw
         Bk+TJ+OLUuA1PQvPesBzoVSUiPqbqWZ2mKTyEJ6CYyC/LObPQq1/0wckjcF5hnW1Wycn
         pc5SfjX4m0z75i1/xVXrxVxfpcpSWumE+KLFWJ+xlQDJKwQJPEJvwtWWCUqBF50Y8dRZ
         H/VYRuUYfdbC0PUIQLoHqLyXyUo/ccBSK/eN1Fi3ClFqK2Kk79J+BKyQE3TcZ7d4Sg5j
         5PSA==
X-Gm-Message-State: AOJu0YymMZKTYCHUMcSK4k1H9+PIWmMhaJQ0jaDQmnnihGldEh8dDX7N
	ckExIJe5U2Gc7/5tFcJLGLjAFPvarEdC4iLKSO8L66TXew/UCCMl
X-Google-Smtp-Source: AGHT+IEdnisilTuMvINn3LD4cAC5sgd/az0yVKCFHsCOrS7kn8+XxYV2u0mBEvZmjZNJ6hXSHD+FDg==
X-Received: by 2002:a2e:8456:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2ee8ed42d0dmr12066611fa.20.1720101920643;
        Thu, 04 Jul 2024 07:05:20 -0700 (PDT)
Received: from rivendell ([2a01:4f9:c010:5d73::1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee81c79a73sm5351001fa.45.2024.07.04.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 07:05:20 -0700 (PDT)
Date: Thu, 4 Jul 2024 16:05:19 +0200
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: Tom <tomasbortoli@gmail.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: Unreadable files on NTFS partition
Message-ID: <ZoasH_ozBpADJBjl@rivendell>
References: <CAAHj5qgoDCcUBiCKPBHCDjZraqiy1dmTrHFwQzLaowjUPdLTyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAHj5qgoDCcUBiCKPBHCDjZraqiy1dmTrHFwQzLaowjUPdLTyw@mail.gmail.com>

Hello!

do you see any messages in the dmesg?
Do the files appear with something like a padlock icon?

Enrico

On Thu, Jul 04, 2024 at 03:48:24PM +0200, Tom wrote:
> Howdy,
> 
> I have an NTFS partition which contains a few files which are
> unreadable. All the other files are fine.
> 
> This seems weird as I can't even read them as root.  I do not believe
> the disk's physical blocks belonging to the files are damaged.
> 
> I did run from a Windows system 'chkdsk /f d:' to check the partition
> and try to fix it but no issue was detected.
> 
> I am running Linux 6.1.90 x86_64.
> 
> mount command excerpt:
> 
> /dev/sda2 on /media/tomas/DiskWithTheIssue type fuseblk
> (ro,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096,uhelper=udisks2)
> 
> ls command excerpt:
> 
> # ls -lh
> total 1.5G
> -rwxrwxrwx 1 tomas tomas 583M Nov 14  2014 TRE_8446.MOV
> -rwxrwxrwx 1 tomas tomas 581M Nov 14  2014 TRE_8447.MOV
> -rwxrwxrwx 1 tomas tomas 170M Nov 14  2014 TRE_8448.MOV
> -rwxrwxrwx 1 tomas tomas  19M Nov 14  2014 TRE_8449.MOV
> -rwxrwxrwx 1 tomas tomas  42M Nov 14  2014 TRE_8450.MOV
> -rwxrwxrwx 1 tomas tomas 116M Nov 14  2014 TRE_8452.MOV
> 
> 
> file command excerpt:
> 
> # file *
> TRE_8446.MOV: ERROR: cannot read `TRE_8446.MOV' (Permission denied)
> TRE_8447.MOV: ERROR: cannot read `TRE_8447.MOV' (Permission denied)
> TRE_8448.MOV: ERROR: cannot read `TRE_8448.MOV' (Permission denied)
> TRE_8449.MOV: ERROR: cannot read `TRE_8449.MOV' (Permission denied)
> TRE_8450.MOV: ERROR: cannot read `TRE_8450.MOV' (Permission denied)
> TRE_8452.MOV: ERROR: cannot read `TRE_8452.MOV' (Permission denied)
> 
> 
> Does anyone have an idea what's going on here? Is this due to some
> weird NTFS feature to encrypt files or something which is not
> implemented in the Linux driver? or what..?
> 
> 
> Thanks all a lot.
> 
