Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3FA7B
	for <ntfs3@lists.linux.dev>; Tue, 25 Oct 2022 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EtmojnUqnCVKWOh8C7J92DZrsq9/z0GK3KV0rT9mLpw=; b=BiKMTB/c8/919DvH6LZjZyf2T7
	Lk+Oc0WQgSHrU043Y+cnUTrcCAWFFIRwbP/gwShZJOH7Ph6ZjNkE4YzQLwl+rZ6FQMYOZVZ1KaAAv
	JrHnpzzBk58E6Bw1q1q6MogLgb0j7g2H4c3zZg9FWX17eaRq/RM83PQCbfJMvNXNS9KzKq0aINVsM
	KaygbGcRwn6F39U9DxcVpgeF99Nlne7F879RubTg63DmK7uq37EnDvG5KYZFfCKozoHb2sgk7eO4l
	lwO6xacAFy+7uJjlKmYCqjbyjVIn9IsBwGV8SHQv4hpDF3zC3DsR7nT9nOHu1R4lpXKIo3O5UJycU
	fdMcQzOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34940)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1onFBQ-0004Dt-7i; Tue, 25 Oct 2022 09:21:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1onFBL-0007xV-IX; Tue, 25 Oct 2022 09:21:07 +0100
Date: Tue, 25 Oct 2022 09:21:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master] BUILD SUCCESS WITH WARNING
 76cf65d1377f733af1e2a55233e3353ffa577f54
Message-ID: <Y1eccygLSjEoPdHV@shell.armlinux.org.uk>
References: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
 <20221024145527.0eff7844@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024145527.0eff7844@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 24, 2022 at 02:55:27PM -0700, Jakub Kicinski wrote:
> On Tue, 25 Oct 2022 00:58:57 +0800 kernel test robot wrote:
> > drivers/net/phy/phylink.c:588 phylink_validate_mask_caps() warn: variable dereferenced before check 'state' (see line 583)
> 
> Hi Russell, I think the warning is semi-legit. Your commit f392a1846489
> ("net: phylink: provide phylink_validate_mask_caps() helper") added an 
> if (state) before defer'ing state but it's already deref'ed higher up
> so can't be null.

Not me, Sean. My original implementation of phylink_validate_mask_caps()
doesn't know anything about rate matching, so my version didn't have
this issue.

Sean's version of my patch (which is what was submitted) added the
dereference that causes this, so, it's up to Sean to figure out a fix -
but he reading his follow up to the build bot's message, he seems to
be passing it over to me to fix!

I've got other issues to be worked on right now, and have no time to
spare to fix other people's mistakes. Sorry.

You can't always rely on the apparent author mentioned in the commit to
be the actual person responsible for the changes in a patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
