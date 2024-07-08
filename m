Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB77944C64
	for <ntfs3@lists.linux.dev>; Mon,  8 Jul 2024 07:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720424868; cv=none; b=RwgAKC1h878QDfMApBoArmZlufRJvH/gO5/CQPwxMcmmnT5GizsZrkz7bC2aGy9OHZ7DMV3l0CO3QyDX7zDGelumZ70Rtr4WtCgtvnHt3FrfB4bmYF8YuYm+j8RoBv4p42mRMPVVg9XFkD3qUQX1ElvDzQVgw5Y0pyahUJsMQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720424868; c=relaxed/simple;
	bh=O6IQKteLK3zcAaY1Y6XLXE+xA0dzekFE6Ivu46p0sQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uegScAcp61pa+EkBC5wzBD8024pVxyqCGowi/ScXTaYndShEsbCRdhOocaZ+eRVBuDi6bH9hqmeH014N16V9cx28jHGijFwqrRtzf04iEM0n7pNc69rl1gwdHPMF01eXsjHFwkEKWnMN0R3XgCn5qzbfs0wFbyaG+qrSuC2YMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WX9EMKWP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX9EMKWP"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so4325650e87.3
        for <ntfs3@lists.linux.dev>; Mon, 08 Jul 2024 00:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720424865; x=1721029665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6IQKteLK3zcAaY1Y6XLXE+xA0dzekFE6Ivu46p0sQ4=;
        b=WX9EMKWPBwtgMlzOJK4BXKkrIvswQxtI75vheE7mEOr+94/zIMQyLKoAp2zPqC0TsE
         OvGf8OIdx9hDI10X8Di55t9plmT1XC5A0AoL83nJ3R0nwEAlxR6BhfH9wkXGDElm4YUi
         J1LxlrYojNvRT6/7WrR/U2KLlA7zkbw+jtEvvIFdcbVnelSayYAukcGI9K8kDxX1y6H2
         uGWmvv/nqqNkWemmD0l67B7vlY8JY50f6lma6PtOt0V2OcIR4ZC7P0KxXrjaEiPKBRGJ
         Er6KmisEEwqUjnO2FRfjPkP/2pNuL0q7OzpqIieqJNQqg9ys2p34fe4FPnZ/kmkJ9cvE
         Wm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720424865; x=1721029665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6IQKteLK3zcAaY1Y6XLXE+xA0dzekFE6Ivu46p0sQ4=;
        b=lNYRLMt/2zsEsWeimirZtBGTVTM6pL7OsQqTi/eOBlCUdsUZ5L14NPz7YxCwcTj+wN
         9V2ZK/zNOkE1hnlWYrPHNMpvWYjgBXw+6YoyNHR9ptwptuKLme/eCKK7XxtYT3GTS9Jt
         dX3iDwaHXp1Ck20hkyaaJfvWVyP8K1IZwKy1lONvxFK2mzHimfw8vF8L1mRJPRr7WKl3
         rOpt3uGD0BZiO5IqUQrxDXFwjBTO3N19VWKfM2Z1SoHjFaosAD8wyTkSfgyvdTcXJAsW
         YQ+j6jczuX3zJws/6dmZjqjOhmdxmkm/+9j6UZNlxrZZ0ls14kcZWC/q7ImO5VFv4K2y
         30wg==
X-Gm-Message-State: AOJu0Yxfab4To7hcaYxgMbB+LmSubXaQLm+99lBXi3FKR7Sx8FfiS3xH
	5KhB/jeMulA/mmvoPQVX3PukDQ98XImWJtgWbscf5EistqxIuBUv
X-Google-Smtp-Source: AGHT+IHDJZ5/1hJK4/MDks4FVRAfean6W4tXygpbRCFsilnFwXctpe8+9pdR4/2J9fOtP+lUw6l1TQ==
X-Received: by 2002:ac2:5639:0:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-52ea06a6d0bmr8365373e87.50.1720424864517;
        Mon, 08 Jul 2024 00:47:44 -0700 (PDT)
Received: from rivendell ([2a01:4f9:c010:5d73::1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab10253sm3390946e87.87.2024.07.08.00.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:47:44 -0700 (PDT)
Date: Mon, 8 Jul 2024 09:47:42 +0200
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: Tom <tomasbortoli@gmail.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: Unreadable files on NTFS partition
Message-ID: <ZouZnklYj9vRzQAp@rivendell>
References: <CAAHj5qgoDCcUBiCKPBHCDjZraqiy1dmTrHFwQzLaowjUPdLTyw@mail.gmail.com>
 <ZoasH_ozBpADJBjl@rivendell>
 <CAAHj5qhZ-9dtyX6jcC4e9gUPq5aeimnNvw=2wFbL7nW9meVFvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAHj5qhZ-9dtyX6jcC4e9gUPq5aeimnNvw=2wFbL7nW9meVFvg@mail.gmail.com>

Hi!

i have no idea what's going on - still in doubt if it's not too hard, I would try a 6.9 kernel just in case.

Enrico
