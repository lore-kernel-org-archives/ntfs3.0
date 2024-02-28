Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756A56EEE0
	for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709138793; cv=none; b=Wrp8+ehDhOURE2s+NnPwgQXPO2ilCMlef7lFQAQyEkjkxDWeNhCqRGJhECljB4YOtJzEAl3Uh/5B7V7U2MtaFkuBnA4fAILkrCr5pajmrMKFKJ0zc3KETs9hQMxyierAN45hGvpeh5uPj0MAQBrF6hmdcAG/ErHLc5mrcIvSJNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709138793; c=relaxed/simple;
	bh=V+Wes0yro1vaPybdAdIYTu58twkZIP8KrE4+vLrxbsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAVTuHGPaamHsK0bGU+4vl+g1+jSFYeRt5EfkX2Iskz3NK/l0EQgNiI47RaSBVL4hmNOpA7SeqEA6RnyqdSe5ExFuj3/DBms694rCGw+2+Z+Zs0mSzlygXLNN7srVeL8ozJ4mJJGvrwStEYReO0l2e+qiQ2tr8sD3bXDHZXyrVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgNIFPpC; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgNIFPpC"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso1006324276.0
        for <ntfs3@lists.linux.dev>; Wed, 28 Feb 2024 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709138791; x=1709743591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxwTMwCJVFMBDDvjxN0uaNIVMWBc/m50PoGk4vNalyY=;
        b=CgNIFPpCHfNk/02jQd3OcG9GtdFENvWnPACDUSj8w+RioILcvqbsIzQr9EbM0YUHeE
         QcToz1RlYmSjmZJXtwhwBvuiOGNeUg7GsbHz9MYSSc/bSo48L5WnlOJYYsXdE6H+EXXc
         j7revFDfXAOqwZ0gMMAC+4FudjlcqjQrpwllKbnLOsjaBhiy8JsTvSctCQEyAkcMsVCB
         LJe7Sm9+QJYwwhMKcQW9jpjFrpXMKEZOSrBnYuo55tQGfH7sRUWKH2Wb2O7ksmj8P2X8
         2+zqSTNHKCqYXd9U26DyuF00ZBiD1pSIDNYZ2RI8ZnZWp/q9CHrREEofNUMBl0bEuY5i
         vjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709138791; x=1709743591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxwTMwCJVFMBDDvjxN0uaNIVMWBc/m50PoGk4vNalyY=;
        b=rfJzF18YUR4SXO69XlC1tvFkXG4mvkw2drSDVGtj0UoTwXHM1NWsjtPQfcjEgoKI4f
         60yj+iCJAFSDD4v2Y21X+gic3OSszfohJX+IstftJaRtn8oYAqwGtQuXdt5oTlurJVq9
         YL3L626fBMSh0+yQKgqirYB71taD8IcE6BdF3xiOCgitiXgpOERAbCsYSMi7wyDYFJb6
         Ufm1AK+ZwnQbqIMtdNY7wh4RPv8Az073dI9lvj5J97NKcYIY/n2PMnQDuLDiQJzBDcVs
         RMDGrRZ0LQhY3n9CQaDVsxeiYvZe9yuw5rOERtshq92CBR+fMyX2COOLTrABUrXYGFdV
         ZXww==
X-Forwarded-Encrypted: i=1; AJvYcCXyU0wQzwAUBjcQS37Iv7t5X/6NDwmM51roGI/Az72zR+T6jdfNFW4fnFYe25Z4pH7upT3BNLNjx9QW7IfYOqumEWOv5+o=
X-Gm-Message-State: AOJu0YzSbTgbFNeEHkwcdESb+YhKNd1usonixNauMKpKAumwbY30Yt2L
	g6yOl0g8ZAyxLTPbfhbDKHWAN3RAbxMBFQ6G0/2BLHrY2RQ8IPLa
X-Google-Smtp-Source: AGHT+IG+T6i0Kg6hK0OXQQpUI7eVIpugJ4UsU/eSwtZUJTDnNAIjX3r6X/tjo8tk0qDTO98RF+EAJQ==
X-Received: by 2002:a25:72c1:0:b0:dc7:3362:4b2f with SMTP id n184-20020a2572c1000000b00dc733624b2fmr2053330ybc.13.1709138791147;
        Wed, 28 Feb 2024 08:46:31 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:2256:57ae:919c:373f])
        by smtp.gmail.com with ESMTPSA id t13-20020a25aa8d000000b00dcc620f4139sm2082379ybi.14.2024.02.28.08.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:46:30 -0800 (PST)
Date: Wed, 28 Feb 2024 08:46:29 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-s390@vger.kernel.org, ntfs3@lists.linux.dev,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Eric Dumazet <edumazet@google.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Alexander Potapenko <glider@google.com>,
	Simon Horman <horms@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-btrfs@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [Intel-wired-lan] [PATCH net-next v5 00/21] ice: add PFCP filter
 support
Message-ID: <Zd9jZZafcVyDGOTw@yury-ThinkPad>
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <c90e7c78-47e9-46d0-a4e5-cb4aca737d11@intel.com>
 <20240207070535.37223e13@kernel.org>
 <4f4f3d68-7978-44c4-a7d3-6446b88a1c8e@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f4f3d68-7978-44c4-a7d3-6446b88a1c8e@intel.com>

On Mon, Feb 12, 2024 at 12:35:38PM +0100, Alexander Lobakin wrote:
> From: Jakub Kicinski <kuba@kernel.org>
> Date: Wed, 7 Feb 2024 07:05:35 -0800
> 
> > On Tue, 6 Feb 2024 13:46:44 +0100 Alexander Lobakin wrote:
> >>> Add support for creating PFCP filters in switchdev mode. Add pfcp module
> >>> that allows to create a PFCP-type netdev. The netdev then can be passed to
> >>> tc when creating a filter to indicate that PFCP filter should be created.  
> >>
> >> I believe folks agreed that bitmap_{read,write}() should stay inline,
> >> ping then?
> > 
> > Well, Dave dropped this from PW, again. Can you ping people to give you
> 
> Why was it dropped? :D
> 
> > the acks and repost? What's your plan?
> 
> Ufff, I thought people read their emails...
> 
> Yury, Konstantin, s390 folks? Could you please give some missing acks? I
> don't want to ping everyone privately :z

Hi Alexander, Jakub,

I reviewed the series again and added my SOBs for bitmap-related
patches, and Acks or RBs for the rest, where appropriate.

Regarding the patch #17, I don't think that network-related tests
should be hosted in lib/test-bitmap. This is not a critical issue,
but Alexander, can you find a better place for the code?

The rest of the series is OK for me. I think Jakub wants to pull this
as a whole in his -net branch? If so please go ahead, if not - I can
pull bitmap-related part in bitmap-for-next.

Thanks,
Yury
