Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72133FBEAD
	for <ntfs3@lists.linux.dev>; Thu, 12 Mar 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334495; cv=none; b=GLUBxFXeUTeZT04i0Rv9Gk/zORAE94oHzO+SffrOZGIX12c+YpvdhuHgcI8oTzD2biIQXhsPVxVm0btRdbcdudNHY4gHsYdScXG/z6tLjx1jEBtbp8ocCTi2ps4/pRqW7/mknYcc3/BQ3TlxDR0I+hGZkHWfpMhwXKVjP/jMbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334495; c=relaxed/simple;
	bh=ENv0+4bH9YdpFLGeURNwJ3+rEUsnNn74RNCtOl26SEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw7xzWmzbU4e1BSqAP3f9KPmVNpZlSjt0nAvxcMf7cJmaH/c+8JjXmwGf16KZplDnRV7dRpn/IaJYC8yOrvNboR8xjhnun++VEjot5TpwXfHxhIpGIvBDwihcC3gC+Rrp6KxpjpF40MvZDyuOGcCWff8uydXVR59LTDm9GDhNZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XdvK8Dom; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XdvK8Dom"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-509006c070eso10771401cf.0
        for <ntfs3@lists.linux.dev>; Thu, 12 Mar 2026 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773334491; x=1773939291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQXCfPVu6b6dIVECzm0C8AUD7IL7VvpSkD5+M4S95sw=;
        b=XdvK8DomXzUZgO6AoDwb+gZ7o/ziIbnIXHeoewfKtBKE5xyNG2Zck6CmNzNDWec1SB
         l6itnkZH4V9Sxuv0dVfHojcx0ZpqqhGCu/CZ5lz2UxM0wQMexAGfjHJyeFboOcff/WPI
         JWK+J3NRN2leYxfwrsAMxhrjjfN+/EJv+9htug6y4h/ByTJ80eVLtuuGfD4FwFG/E8H4
         +uJdLGbU04IwX90inux/pY/ZLtJN3b61jhvP7qTFaBcM7pf3RlEjLXo6caO0csHVqAxz
         hJgxIdv6OCGWX2aaKuKGlaQjUc3E4H2ah716Fy2ZS8tSsepbC+HgAc1oQbQJOLyGhGnN
         nYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334491; x=1773939291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQXCfPVu6b6dIVECzm0C8AUD7IL7VvpSkD5+M4S95sw=;
        b=U34amryJOR52wped0rR8whkyBK4IoclUkCqcLx6aRX2jXwUk3TnUbzfBp36ONSPP53
         KHyG8ePQh2bbSbf3U008G+CNUGNSGc/Bgm6eTETeA5xfVUeSyMx+EqTJQ/SM5f05bR7j
         NLLiSMKMmPRYJogR5+SLmBlZx2/2lV5jkOlJkJWP5M/tlY1r3Oc+A3kwVaP+kH4ymFSm
         3rp5EG+tMbsBwL/3vKBYao5SaKRslzX63fkTGPy7qPGnThFDX0rz1tF5Guvjnvaf9jQN
         fHmx4ClAD6DkD0R3rMmU1mAgTl5wrCjb6eRfkXzSQCL2dLV+e+CtXlFNG0WEWigCRkeF
         gzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7lrB9IMP4Jd3ryX2M1tC71qIRNLmzHBY2DWbaKeINGFTS2GewEjbi6akrbOab+2+V8EeeSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMockq7Yl2oa5/BHum0h/+hxwrrRgbunCbR4stX18v1/RXDpYW
	aRjBfM23ABHkn++oRQV/WePXYInqBJX396bYZx9X6e3U0xJ2RKLZFjGJCS5xE6P+Gfw=
X-Gm-Gg: ATEYQzzmhvrKr0npeOsS/tDHabwMhwlPEKT/r9a+mAB5nA9m/ps9UsJxg18IA9ZspAq
	st/BURfvW7zT7j14G8An3xlcypOW+38uXJPuqMJKkVKGwPls57nwsi2i1qwzil/H+O5mU2rdtjk
	vk5/DX/qEYkWPvTgUM+FUeLJp+exlIRZ6RdqNuwjXFR4TvcWJq+6o34FwXYdimxD2mfbn+2z/rU
	de2vBGkohlJ6kmcDOU1hQBSA6U/M+9i6+wr1aCnkd4+dCUwvojfWX7XBUhQEdIx3Res/CI3KxVO
	jY6oI6NMW664pS8Vn1iNSw9P/stkuZ31mnF48YAXebFT7gApRrtQcrLjdp2SfEX3/Rve9daadJk
	dofk5M7uN35lR0gAPNOVmZoYYodQD/gGydyKS9mJnauqIbwEPv3EOjbk+7mr9HcdENVFnGDnCo1
	e9hMpZBvGsHs06ioDhKZEcti+qRDVI31q9TezkETIBrcYr++RBr0S7W8QlD1MwKLYkni3C1LJjY
	ju13DzjP0c+5Qanu6A=
X-Received: by 2002:a05:622a:289:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50957e10673mr1403911cf.52.1773334490530;
        Thu, 12 Mar 2026 09:54:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a119602sm36658181cf.28.2026.03.12.09.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:54:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0jJA-00000006i8N-40X9;
	Thu, 12 Mar 2026 13:54:48 -0300
Date: Thu, 12 Mar 2026 13:54:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Philipp Hahn <phahn-oss@avm.de>,
	amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev
Subject: Re: [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over manual NULL
 check - refactor
Message-ID: <20260312165448.GN1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com>
 <20260312125730.GI1469476@ziepe.ca>
 <f5688b895eaebabae6545a0d9baf8f1404e8454e.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5688b895eaebabae6545a0d9baf8f1404e8454e.camel@HansenPartnership.com>

On Thu, Mar 12, 2026 at 11:32:37AM -0400, James Bottomley wrote:
> On Thu, 2026-03-12 at 09:57 -0300, Jason Gunthorpe wrote:
> > On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:
> > 
> > > IMHO, the necessity of IS_ERR_OR_NULL() often highlights a
> > > confusing or flawed API design. It usually implies that the caller
> > > is unsure whether a failure results in an error pointer or a NULL
> > > pointer. 
> > 
> > +1
> > 
> > IS_ERR_OR_NULL() should always be looked on with suspicion. Very
> > little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
> > pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
> > implies ERR and NULL are semanticly the same, so fix the things to
> > always use ERR.
> 
> Not in any way supporting the original patch.  However, the pattern
> ERR, NULL, PTR is used extensively in the dentry code of filesystems. 
> See the try_lookup..() set of functions in fs/namei.c
> 
> The meaning is
> 
> PTR - I found it
> NULL - It definitely doesn't exist
> ERR - something went wrong during the lookup.
> 
> So I don't think you can blanket say this pattern is wrong.

Lots of places also would return ENOENT, I'd argue that is easier to
use..

But yes, I did use the word "suspicion" not blanket wrong :)

Jason
