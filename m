Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0007339386
	for <ntfs3@lists.linux.dev>; Sat, 25 Jul 2026 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785003917; cv=none; b=d+bYD8VzxtQKMyvATOf/dr2aGT0B+yMMjUwHJXN+g99VWRsYcF8+zG0S2B4zEACbG+MLOSBungLBCRwyQF+77jsuDfBFFzCOJWxvNNenB+9HEZP33PWWkUGcat4KSVpqhyzkg1ZS5e7pmHQDuArMxpPYPvUw+1WUppxbC05R5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785003917; c=relaxed/simple;
	bh=P+xUPhmKoc6D3GMEdZVYLKx5KNHXvNgwLU8vxitnYuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRuQ3IrmlwBfyHpYlW+Q+TyzmGtoJSE8zVZ6sVyL27DDut8kK0CZQFyJMWC5oaTAOHegtDgTvQfkF1N9Ib+sf4qOym7FBi3hHLEjBA82snNMZil351NWus7q1MGqM7LMk8/koZnsFRiWF0LIcCxTHm9eVZe8GiYIYpurB4nuUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=YDD0YukD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="YDD0YukD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cea3004256so16411515ad.0
        for <ntfs3@lists.linux.dev>; Sat, 25 Jul 2026 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1785003916; x=1785608716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yEqULPTvgsDVfCC+5IwdXvQF8BpiZkzD9RJBIUZnmDc=;
        b=YDD0YukDsi4y1Z4P2dWysYAaSq/o4JD2rSeRFmiWrW/MZXZe6luablhdB7A/A8pke/
         5d7X7Dtz9bMxb2nFbk2mPNGQZYl+fDruJGulcRXkYHgKOBjV4Y+LBVDZvYC70SDq/l6a
         72XXttjTf5fj5KPqcgWIgRUsvwXwSR1Ew32Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785003916; x=1785608716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEqULPTvgsDVfCC+5IwdXvQF8BpiZkzD9RJBIUZnmDc=;
        b=AWSYxDL2QffPPXu6HYyNqlWfSdysRTmDu6ygkrSBz2IfAUzm8E3v1RKIPLGztjDzKM
         6anKPgvhnG2Tx51MV+YGZWVHxLeCyoNFrIJk7zoG5pQW6BmbNgFCSB29gQ+1scluxBjg
         vZOt/wZwuFt2PggOzkhoMp1isUtOHfdlDXIOxJ0K1j3S3p9YZNDTvI+g7RlgYAgLtI/G
         4zq4LDdVkTpvYQ9CjkBY+rMbODLWkOhwNBqU2d5faaGifFpEFOjJzM1Bp32Ktf43eSV2
         uSl+NLxWa1gEbz4GCUUNiwXsdoHsQx1FigVi8r9FdiHRoFDPWrSJoreg9gjrCadtY1fN
         m/Sw==
X-Gm-Message-State: AOJu0Yxd0QJP1+Jiu68qgvd6HWAmFr4be+uqGFqiGol52pLykDPUuH5x
	d5CgnsibBH2NQXAVa5+i0Tv3rVXqXo5Ihkoo3ATYIuAlEfmOKU8ToWbnLkDWeFJiH+w=
X-Gm-Gg: AR+sD10s3BrWUbXXK6hMefNAUj+sOfgqyAL3tWYLHCA8fjfIbryR6e/ngE8RFwlBI4J
	GmvScdpQOD06pvGwRatfMEt43OBKP7qWpl4TpYqTdvHXpHBPsljjd79ILHjcC7jiTOFtljVh6A/
	69QB3J8Z4YOJNeX4vuun1+BTU2OPtUGQuKbM30KYf7o8mL8rOLKQl2T0NHbOlL4avGanfTRjZJG
	7bNd1LmNrII5RYJVMp5Loy5s3iFjDQKAN7mW/s85+tVGMCpe4YTbzHJdSLnteGFGJUcQ5p954zk
	pytdArv8R+v4cLK0XwdU/D+av4kVVGw0gJJMTC+V2fnwNEQqbIHDmt6twEdZhirg0bl0qS91YQf
	HEG1l8mQvRBCUQ1YlvfPY+UlfDzf8pDbg/SRwEvi+iqELQ5k7V1u0Gk2ZUJeNchGcR1tOVKUH09
	pvA5t97YTXskNdE2bQFE/RxJ7jt9Of38ENb7iRxpEBLea+DbKQtUu0h8jnvgPrvoTlLXf8
X-Received: by 2002:a17:902:d491:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2cfde797028mr30650195ad.13.1785003916073;
        Sat, 25 Jul 2026 11:25:16 -0700 (PDT)
Received: from com-75606 ([104.241.0.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc584433sm11781009eec.23.2026.07.25.11.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:25:15 -0700 (PDT)
Date: Sat, 25 Jul 2026 11:25:13 -0700
From: Kyle Zeng <kylebot@openai.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: Re: [PATCH] fs/ntfs3: validate dirty page table entry sizes
Message-ID: <amT_iV4roArHh_Vx@com-75606>
References: <20260611213304.16654-1-kylebot@openai.com>
 <26836018-9333-440d-9c3b-ae626148bfae@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26836018-9333-440d-9c3b-ae626148bfae@paragon-software.com>

> Hello,
> 
> I didn't hit anything at first, but during internal testing journal
> replay now fails on one of our images.
> 
> I can provide an image where the problem reproduces if that helps.
> 
> Regards,
> Konstantin
> 

Hi,

Can you provide the image and the test that triggers the issue?
Preferrably if the test can be made minimal.

Thanks,
Kyle
