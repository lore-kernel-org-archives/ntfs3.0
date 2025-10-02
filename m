Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1639FD9;
	Thu,  2 Oct 2025 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759368522; cv=none; b=eLZROFc0ZvtFfFPwPcT22XoNJjG2XL09lBbbRvITqLgJ/uqmZrs0aKLps3MpBS6nTkUp2TZBy5/JsV7R16F76oFuVWr0ot8T3S5VfjyyKHf1ipWY6ILHLp5at1rTXtwQKKQkl0/uOoLsjpWUe6GQUzB7QyzqXl6wv+8/W5psZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759368522; c=relaxed/simple;
	bh=GDw2hhC18B0vG17fcYodmwY3BvS34Tx45EDeiSEF3J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+7lOriL1ehSh0YCtBZcetvlyZhucpQbaDewwfVoMwE9og2BJLHn4c3xfJsbCGvWgyx08hQEJAFqtCDAqwhd9aLqBr7KlpAiLr8LN1ijMivndjFO3E/dtFrMW+eBuyUVHEtDoJJ9XpfFzn/7uzIyiMKTEzmZD/HjVR8u3D5zSJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mgDTtnKa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mgDTtnKa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GDw2hhC18B0vG17fcYodmwY3BvS34Tx45EDeiSEF3J8=; b=mgDTtnKaXu2XHTT4ekUgFIPVE5
	K3K+gsbUdIC2NhfRPB1RmvvMqFxgrXTdiPKnaOoFMDUE6Br4LPM3zpmh1ruZrHksjTFMLjhkT14k6
	9+gazCS6aDORwwmVj0hpiNzplxHZrhonpYWcwQVJx1jKvHZ/VN6D6sOH48PowwrKgY4fKbsRIQiLV
	zEudFdLdVf78P4SFixTOHG8I77HGEuLBa22VTOCJoIh2y8yGg/Hsxi5eS/hC81UmJWlSHWx+fz/Gs
	J3p7lk5xrrnvseZPp1QaX8zD/tzbW2poypeQPg/iRIQMOf6g5OOdU5VR3Kc3nZSHi4ByHo+MyQjGg
	0YGpmVZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v487Z-00000005Iat-36G8;
	Thu, 02 Oct 2025 01:28:37 +0000
Date: Thu, 2 Oct 2025 02:28:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: torvalds@linux-foundation.org, ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ntfs3: bugfixes for 6.18
Message-ID: <aN3VRbTc2v0kYS5v@casper.infradead.org>
References: <20250930130833.4866-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930130833.4866-1-almaz.alexandrovich@paragon-software.com>

On Tue, Sep 30, 2025 at 03:08:33PM +0200, Konstantin Komarov wrote:
> Please pull this branch containing ntfs3 code for 6.18.

What happened to
https://lore.kernel.org/linux-fsdevel/20250718195400.1966070-1-willy@infradead.org/
?

