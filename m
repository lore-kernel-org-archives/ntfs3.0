Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A626ADB
	for <ntfs3@lists.linux.dev>; Mon, 24 Oct 2022 21:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866F9C433D6;
	Mon, 24 Oct 2022 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666648529;
	bh=oQ9KNEH5p9KGrsnEcH5S1RduBGb6wJ0EGUHoylNIUA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=owCi5MX6mT/TF8uDWZXk/zB9Mvqn4fHQ+Z09FxiZbMlhfGo/km40JdiQRn+Th/D/h
	 qo2T9XR3Wqhn+6FfAQv3Flhg/LYkRHu+Tjjd3RsVi4/9bgOiUYS9dedx1JEPH8K7+W
	 7Oqu6Et9S70kCC+V2cR/eHwe69kMssr3xbUFZ6432fsDgrk9FfPjyYkdZicN0BVUMa
	 EXfZY9NRnItX/1zYXfzyj8nC4kYB0LXrXC377Av1LnRfYDokrgTNOqRpe3I9SEBsEf
	 2QkV1CUUnJ3GnbpWNXWNhSaMDF401o5mxDxG/xI20wA0k0iS4d3qwTHoq6Q8kukfZt
	 lLoBNP6hs8E0g==
Date: Mon, 24 Oct 2022 14:55:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>, Russell King
 <rmk+kernel@armlinux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master] BUILD SUCCESS WITH WARNING
 76cf65d1377f733af1e2a55233e3353ffa577f54
Message-ID: <20221024145527.0eff7844@kernel.org>
In-Reply-To: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
References: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Oct 2022 00:58:57 +0800 kernel test robot wrote:
> drivers/net/phy/phylink.c:588 phylink_validate_mask_caps() warn: variable dereferenced before check 'state' (see line 583)

Hi Russell, I think the warning is semi-legit. Your commit f392a1846489
("net: phylink: provide phylink_validate_mask_caps() helper") added an 
if (state) before defer'ing state but it's already deref'ed higher up
so can't be null.
