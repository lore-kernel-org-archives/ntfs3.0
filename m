Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBFD3BAD9C
	for <ntfs3@lists.linux.dev>; Thu, 20 Aug 2026 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254589; cv=none; b=tcQGjw7PggUgE2pniA2tarJ/3A5SXsKWUDPfdWSIt1XjZdDG8A6xsX85pOmUcnug816k4zv8jhkPNDd3MXxkZde2CNC73FVRoeUBJUXm1byd9AOi0WLFV6fFdDbDO/41zT76Jgg4LUirkkmMhx8zqglcqtKM0g6KNm9ufh1/UPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254589; c=relaxed/simple;
	bh=NqtCt7tTXkI7IiVJN5UO1oCrux3916VNVcmvRkYd6IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EM8G8nuHtSozeV24Gq0s6BTHG9izZx4QIKoCeB4UlYkjLaVKjMa7n+sGTN5pcKy9Fc0PpgyXccPshfe3jgszpBztd6v9ZX7ADPyy9hHpp1uYE26GPuQW1KYpLb6alwI7W/xZsszzzVsmL5X2bnWQer1BcyJdSUG66Q2C7olkH8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JgAelrBf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JgAelrBf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso405264a12.1
        for <ntfs3@lists.linux.dev>; Thu, 20 Aug 2026 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787254585; x=1787859385; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwKU+8hQ/jzVRueQ7P7JAPyUHB9wlZKPojFGbqXXjhk=;
        b=JgAelrBfc4zwk+rwP8bJwf2yfekyM6lFYo+EsJ9aSWUxuYsBUqoQsShKulDEqQcSR1
         89YyIPAE/gcDsG0JizsYlZt1qY50XEBpEuO4jBs2/HBl3KdMgBjWgpJlBD/2H+Y78Y1r
         P/H3UQCN4UeI4OpftUzyPXUWU/uV2WCuhPbN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787254585; x=1787859385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dwKU+8hQ/jzVRueQ7P7JAPyUHB9wlZKPojFGbqXXjhk=;
        b=l0HLJOUUiJzAfjY383hcLIxCLYmZxcbeVX7Hol4wT6U4FDuz6Mn6faf/AGqD47DTcK
         CaLZ/x88SVwmsYm29buXyWP1+/WlwqMc6u99H0A800rjyV/nUCNdi3gRzvgm4kTIO1er
         eB3+MESLT6X1Rw2TCQEUTRwvbC9BpK0el6DHc841AvOn6/0i3dGFvgwzjZ22nX0giWd6
         rkJUHR1XMbMSj3HGNnG4g7tCZ/aas39bamnnOM72LGmvUyhfV49y+nsyZNXcD/k28wTJ
         iEfHFscC29ulIdBCeYTmjfzrCPJmRiIMCPTWgX3YAhEiyyVSSXrSQiHV1PMAFUvHkDuD
         3htw==
X-Gm-Message-State: AFuF++k23B3mgW8mHr0Z6Qy6m61CZtUG8GZo2m9bGiTmUdH2p0bckKTu
	m8hA477/QYj4hXgcTUifHuWy+tuKc3EzzBl2vVflbO8Chxh3CDvMgAE0irpd1agLwjUHrLHZjd2
	HeGdYmUU=
X-Gm-Gg: AR+sD1319JpB3DcNVOFB7vsUaSEqivJdoS0tFRFX95XPf3Ay0oS8t6PeKNC1Nw72syT
	X415aEPz0URNNOB3nH3xk+17tyzWa6kWHEWda0rHcugWb+v/k/nIqixNAixx9qXJr1to3r2T1jN
	TY001JcbqfwpAUi9SBNaWvN5Qpc9HIIXT5LKweR71Don3INvAY7yvO+h/XdEldVwChBRg6bxWja
	vrvEIBybne/135TNDcnzLRN8PLbDgCRnnSxBD2DhxvL5+vTQVQr6UUOxVGlejsUV6+OEwtK65x4
	3eMe7RmFgUvCbUsc6BmnNsRCYYy4nXcprziYsIkTBafw2zZuwf+WB9otK4zu8TOPU69M5OWN8Du
	B6htMVSL87ilEcl+p/ZO+ReC9BX+OCAf1ilooSevez/Qo1SVd7rRGWzdB4rByEIWdKkXCSDWKD2
	/8kh2eP2aXPbA1z2j8wGunxaL9+rYBmm97cjTeeyAvweLJuqFhz+Ruor5J5CiR4xlGGM9Nho96/
	D/cDB4CkEnTpwL/kxOU+qxr34Op8QFAW7o0+w==
X-Received: by 2002:a05:6402:52d5:b0:6a3:691a:9d69 with SMTP id 4fb4d7f45d1cf-6a42f16595amr768303a12.4.1787254585412;
        Thu, 20 Aug 2026 12:36:25 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff156811sm2468647a12.19.2026.08.20.12.36.23
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 12:36:23 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15f020a223so33937866b.1
        for <ntfs3@lists.linux.dev>; Thu, 20 Aug 2026 12:36:23 -0700 (PDT)
X-Received: by 2002:a17:907:3d0a:b0:c20:74db:50c7 with SMTP id
 a640c23a62f3a-c246a697ac4mr83093666b.13.1787254582846; Thu, 20 Aug 2026
 12:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818122105.24094-1-almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260818122105.24094-1-almaz.alexandrovich@paragon-software.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Aug 2026 12:36:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjN68GNSK+Pz4ZPSYHhcQjURkoOZ+4ndiamnGSbptocQ@mail.gmail.com>
X-Gm-Features: AcwNN1XcPmEshjPw9BTcH6FCDKMwwlDL0rRFFQfx65fk1d7wMtPMsWnz4a9Gvho
Message-ID: <CAHk-=wgjN68GNSK+Pz4ZPSYHhcQjURkoOZ+4ndiamnGSbptocQ@mail.gmail.com>
Subject: Re: [GIT PULL] ntfs3: changes for 7.3
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?SEUgV0VJ77yI44Ku44Kr44Kv77yJ?= <skyexpoc@gmail.com>, 
	Kyle Zeng <kylebot@openai.com>, Ruoyu Wang <ruoyuw560@gmail.com>, Samuel Page <sam@bynar.io>, 
	Senjin <senjin@hatchling.org>, Weiming Shi <bestswngs@gmail.com>, 
	Weiming Wu <weiming3@asu.edu>, Xiang Mei <xmei5@asu.edu>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 05:21, Konstantin Komarov
<almaz.alexandrovich@paragon-software.com> wrote:
>
> Added:
>     load ATTR_BITMAP run extents from $MFT extension records
 [..]

Please try to write some overview summary of that the noticeable
issues are. This "just list the commits" isn't useful for outsiders.

I've taken it as-is, but I'd really like these merges to have some
useful "these are the bigger issues" explanations for people who don't
know the code intimately (ie me, but pretty much everybody else too)

            Linus
