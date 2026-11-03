Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.188.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730077;
	b=o3Txo+/f/FMJjwdZnlqbXLU9KFF7cEAsixO48i8H9C3GPZkwY6rbaoggVsr7JBUSghhT
	 fEK7pXnGvwQzvJ4kaprJDAI+2c9xpvNssr9rIuyYvs9XIEWWnS21T41fRJyA3OwCKBPiS
	 DnMPnJIm6ssqTm6FvgsHTzsSUdEIW8tac+dywNL6btZkdeaJmOvHwhJnPXeFluu5se6Ip
	 85zbRr3d1PioHtZoUNIlCiw1Osi2DFoFaM663oQ7E6oW6FztXtqjZf5jjoeSNgt4v2qAK
	 qHAZmytVXRj8iuOlIvrJb4FZq30vsCUBhMIV+spUWVfYlP17UiNl9phI3jJOTYa/STA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730077;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Get-Message-Sender-Via:
	 X-Authenticated-Sender:X-Source:X-Source-Args:X-Source-Dir;
	bh=ytUhEil0wlgsVUoCP0Yd74A/AIwBqr40dkibQ+gxCqs=;
	b=CS5zcpbQxsabFqan6Am6ZodG92KFzrjVrahmvXXGrrMBD5+aghwX5SpSH4X6Iipse8Qp
	 WSENbOR3hNO6r8yJHtlwQ/o35faNj6/QaTGw93E5w430jfs057QMHu4Z+k92N2Wddy4Mm
	 hCYrr6iXQXZPKRN7sOvYdkxXB/u5Gv7X5maa6Bl/wLAOaosl4pJIw6CcK2xf0RkORKRlD
	 Yg94zClll+XzYDaZMsUQqBImhb/pymmToT23K6FeYJD7eaqq677rTQBDRRVXSnYy+IPXf
	 a3lGOZOwylBUWRksfj5dXY+4R92ACGhi1yrO6nxZ4ID+xnt33f1cJi1cVGKfhMl1FgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cyber.gouv.fr;
	spf=pass smtp.mailfrom=oss.cyber.gouv.fr;
	dkim=pass header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=Yx9kYchn;
	arc=none smtp.remote-ip=51.159.188.251
Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF50606A328
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF50606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.a=rsa-sha256 header.s=default header.b=Yx9kYchn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ytUhEil0wlgsVUoCP0Yd74A/AIwBqr40dkibQ+gxCqs=; b=Yx9kYchnkLyzqx+G+jIs35+s0N
	TeqUwlJOnFBRDHIxoVeahtVbQVO+cKsTfVIsgDDJ0q1wpJGgFYRKpcNu4nLWiGKn8ciqq9VtaY9JW
	w12WWmyab5Wi+QQ+x0ZhhqxeRXBz5NonmDlsGoujJouQDHnrODNSTkELOAZDrdxzYRm2/I4bzIwgR
	r2BwLiuE2CQq0hs30x4V3uUl0a43qkt2xO4dbB+1G/8FhjVxWFZvWh1vctxp9eQcLmJF8bU/8I7dU
	0GegwYVnIoNB/qMVHH8dT7nQyKQTdLoZwBJMjXgiLNZZSJOLyuR015xxLtTKWo1WIbfiC08ahxjqH
	wE5mIgrQ==;
Received: from [::1] (port=52456 helo=pf-012.whm.fr-par.scw.cloud)
	by pf-012.whm.fr-par.scw.cloud with esmtpa (Exim 4.100.1)
	(envelope-from <jeremy.jean@oss.cyber.gouv.fr>)
	id 1xOJ8G-00000008iQi-3HiN;
	Tue, 03 Nov 2026 19:21:15 +0100
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 19:21:15 +0100
From: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <jeremy.jean@oss.cyber.gouv.fr>
To: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: validate log replay bitmap buffer spans
In-Reply-To: <20260817202941.1635505-2-Jeremy.Jean@oss.cyber.gouv.fr>
References: <20260817202941.1635505-2-Jeremy.Jean@oss.cyber.gouv.fr>
User-Agent: Roundcube Webmail/1.6.20
Message-ID: <3f1d3f776bfa0e8c705ae9bd264f13e9@oss.cyber.gouv.fr>
X-Sender: jeremy.jean@oss.cyber.gouv.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 2026-08-17 22:29, Jérémy Jean wrote:
> do_action() derives the read buffer size for bitmap replay records from
> lrh->lcns_follow in u64, then stores it in u32 bytes. A log record that
> covers more than U32_MAX bytes therefore allocates and reads only the
> truncated tail while the bitmap range checks still compare against the
> full u64 span. ntfs_bitmap_{set,clear}_le() can then access past
> buffer_le.
> 
> Keep the span in u64 until the read size has been validated against the
> u32 ntfs_read_run_nb() interface. Also validate bitmap ranges in u64 
> and
> reject lengths that cannot be represented by the helpers' int len
> parameter, so crafted bitmap_off/bits values cannot wrap the existing
> u32 arithmetic before the bounds check.

Hello,

Did anyone had time to check at this?
Current master branch is still unfixed.

Regards,
Jérémy
