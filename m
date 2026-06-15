Received: from libero.it (smtp-17.italiaonline.it [213.209.10.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D930B3BFAF2
	for <ntfs3@lists.linux.dev>; Mon, 15 Jun 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.209.10.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511823; cv=none; b=KiWOIf4ytFWN6yjfQ7yqmZuFanJrG+TopdU4asffS6ejAPm5zqqCZW1ulIasZIKW9DgkvDWa6URjQuoZoI4qjmda7/UqYe8lFH2X5lkN2ZSaQYYkM1vavY21bKQS/QWJyfGs+SGzg7b3D/wYVaGZ/IECJV6knbrqHe7CaScwLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511823; c=relaxed/simple;
	bh=JtLOY+R7sgJ7JpPIhG90Gmbe/+zE4+GWe9E18ac/+SU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=pG1nC5nMJlDbJgmHXVYgY7qzL/TNb1gUYRFwywsDEODisC1elLkuCEN9japVF9Ht+g/wnzRsw49uIhnuhrRfQjun5CmF6TpXSHtlWP/7gSPJu6+Z8M3na3Ob/c8yS6+JsyegNpGsSnHPjsu6dxvWGthNAV5B73kuPLJfrMx3omw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it; spf=pass smtp.mailfrom=libero.it; dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b=jQFuJr/l; arc=none smtp.client-ip=213.209.10.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=libero.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b="jQFuJr/l"
Received: from oxapps-33-147.iol.local ([10.101.8.193])
	by smtp-17.iol.local with ESMTPA
	id Z2Z4w3IK3DxRGZ2Z4wIPyj; Mon, 15 Jun 2026 10:21:03 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
	t=1781511663; bh=Suna0Gp9nTPkvM063rl4tr6cw+V8Y9unXkZocMQou0g=;
	h=From;
	b=jQFuJr/lMyLfxM0hp+wXcw4I4OSsPah9QIe4yag6AKVIx35lQ8Xd2jIugf7rX7qao
	 CCBdFyneOi5siK+WIOWBWAz9HnEU/bjdz7uDuDnVLKhlBrXx+cWmet1KoLQ6/AfwmU
	 kWMQSoPz0kRBNbk4F4u+cMgPaIs/AP7bqN43IlO25pklFu/coieLH3w5//WToa0fg+
	 8sXheOrFQ9t899Q7rxeVTtrtl4VT1TWYwzFW7RgQFglwdqhdRpoaR8zLI7KWSfQO28
	 RIg+x3n9BN7V/x6+K/Y3SrFaBXmsAmcKUxowxSEgJnBSMRWPZu5aTG5sDa0hS0iKsF
	 YJxMsfwUfZByA==
X-CNFS-Analysis: v=2.4 cv=JoLBas4C c=1 sm=1 tr=0 ts=6a2fb5ef cx=a_exe
 a=vzpMTk4oe8B86+hI6mE1Jg==:117 a=j6NflhPgxWoA:10 a=IkcTkHD0fZMA:10
 a=GFCt93a2AAAA:8 a=NQ3AX_1mPBHL7o3MFk4A:9 a=QEXdDO2ut3YA:10
 a=pnEVf3y3OfjpgmdsDARm:22 a=0UNspqPZPZo5crgNHNjb:22
Date: Mon, 15 Jun 2026 10:21:02 +0200 (CEST)
From: saarthal@libero.it
To: 2020820791.1843094.1777717495048@mail1.libero.it,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Ntfs3 <ntfs3@lists.linux.dev>
Message-ID: <1793072274.389678.1781511662762@mail1.libero.it>
In-Reply-To: <75b58d74-24c8-41bc-8e20-7704ee287f08@paragon-software.com>
References: <75b58d74-24c8-41bc-8e20-7704ee287f08@paragon-software.com>
Subject: Re: File operations on NTFS drives causes kernel BUG at
 fs/iomap/buffered-io.c:1061
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev87
X-Originating-Client: open-xchange-appsuite
x-libjamsun: TsWL6WnLD+2S8+RfCtvlaGhQe+vE4jBZ
x-libjamv: GIh2ObQrco4=
X-CMAE-Envelope: MS4xfFWd0wd4LMYkx/uID+kHBsXVQ82yFL/5ST8sfiIyBOlztcLoj/ibnDdY3Hz/J5u4GMcb7UUBzzE8Ipyxf9PNJL0axyWAGVAmXijy/vHjUR7Wq+yPClkS
 CmaSRkOdP3OCxga/Z8RXngybZrRzw9Q4lMBa7CeFIq7XD5/W/dWWr2sVIWOI+gc0ZimPDp9XI51/5SwEJ/rC3LdT6Dty1Ng2EJPUN5ESsZrFl8ll+jRH57Qp
 zQ1iDAStuJqQmlwJHxHSydh9IFV/lkbB7W5a/Havt3Wz3J1CMGbjBl/VMFZFWPF/TlZQB8ntF0IqgH4mDOTytjYtQB7I/XURkt9IqsMiKE4=

Hello Konstantin,

with kernel 7.1 I've been unable to reproduce the bug for several days, so I think it's fixed.

Thanks,

raoul

> Il 02/06/2026 16:32 CEST Konstantin Komarov <almaz.alexandrovich@paragon-software.com> ha scritto:
> 
>  
> Hello,
> 
> Thanks for the report. ntfs3 has had several changes in the buffered-write
> path recently - one of those may already address this. The changes aren't
> in mainline yet, but they're queued for the 7.2 merge window. Could you try
> 7.2-rc1 once it's out and follow up on whether the problem still reproduces?
> 
> Regards,
> Konstantin
