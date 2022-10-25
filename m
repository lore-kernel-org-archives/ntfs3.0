Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF6D2578
	for <ntfs3@lists.linux.dev>; Tue, 25 Oct 2022 18:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B672AC433C1;
	Tue, 25 Oct 2022 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666723936;
	bh=TQdJlERfQEUABscmmDLT7Y2HrdNrXv8E1A8x0FSRGM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HXDjtzO+UBdc1yePh5W/WLyMc2oBVDdqLtEyJlyYfQFURF57pFKrqXSW+UPaZgfDe
	 /J5qfQ34amGSi1DcyeqPwJ2zcr9+kab5xk5EakePQ60CKJJ69OixTqZQNqlbPCadn1
	 BbtqO81A0cfshr4hly4SDb4WourJsd9sJqFAxtDwMnD9KBRfC5PxIYZj1H7kY7XMlC
	 dk7WpufcgTIuHAKKuRaY+n7swd4MfCATpj4+zGaPDHY0VwMjhkd0G9/vxZNmy5sOYn
	 8eGQGzXCeqeaekcSMnjCybgm1iXyUZ+WKQjx73kKf6ePmFxUT+B3zDoLmPWmYdi2KT
	 vJRF+9c8CHYoQ==
Date: Tue, 25 Oct 2022 11:52:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, ntfs3@lists.linux.dev, netdev@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master] BUILD SUCCESS WITH WARNING
 76cf65d1377f733af1e2a55233e3353ffa577f54
Message-ID: <20221025115214.26a12211@kernel.org>
In-Reply-To: <Y1eccygLSjEoPdHV@shell.armlinux.org.uk>
References: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
	<20221024145527.0eff7844@kernel.org>
	<Y1eccygLSjEoPdHV@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Oct 2022 09:21:07 +0100 Russell King (Oracle) wrote:
> Not me, Sean. My original implementation of phylink_validate_mask_caps()
> doesn't know anything about rate matching, so my version didn't have
> this issue.
> 
> Sean's version of my patch (which is what was submitted) added the
> dereference that causes this, so, it's up to Sean to figure out a fix -
> but he reading his follow up to the build bot's message, he seems to
> be passing it over to me to fix!
> 
> I've got other issues to be worked on right now, and have no time to
> spare to fix other people's mistakes. Sorry.
> 
> You can't always rely on the apparent author mentioned in the commit to
> be the actual person responsible for the changes in a patch.

Eh, confusing authorship trail, sorry.

I'll send a patch to drop the if (), if it's really needed we'll hear
about it sooner or later.
