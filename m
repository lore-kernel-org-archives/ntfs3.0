Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442472
	for <ntfs3@lists.linux.dev>; Fri, 19 Nov 2021 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b/jzKu9LnpgkuCSmJ0bK6GJkr9WzxJc7AoIuzoQM4Mg=; b=qa5H14Dzxh+pRAFiuJS3Rqhio1
	2f4rN/aoYF0pl5OswqgF9V1k+uOjkvSvhuJFgs0q6f79KzZvuJN1BqhQEtYMXDfshbQaMB1/22wdc
	ParvJDQOn0oAbKTTLaAEwE4uebpKtiILYxBBwY5CNUUPrAdDMbrV7y1rG1UM+1JcFuRSs3BL8gKNW
	s4OdkzCOlzcJlbfIvadJWgmu5msbRP0RX0j7cr8v0K6dGRCes+nrApvkkyqwIl7Lh7hz5k44ducp2
	ynNS1ILlfbY+ROOkmiIATzvPMsenSKGfcZZ/ztYFEV3YaFzA80FO7Fj5LDQbRGtwSdsBtqaI0bkCx
	LHmYxfkA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo3hS-009VgX-Q7; Fri, 19 Nov 2021 13:13:06 +0000
Date: Fri, 19 Nov 2021 13:13:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Uwe Sauter <uwe.sauter.de@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: Bug using new ntfs3 file system driver (5.15.2 on Arch Linux)
Message-ID: <YZei4gn1zgIc32Ii@casper.infradead.org>
References: <aea2a926-8ce6-fcb0-cd60-03202c30cca1@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aea2a926-8ce6-fcb0-cd60-03202c30cca1@gmail.com>

On Fri, Nov 19, 2021 at 08:48:11AM +0100, Uwe Sauter wrote:
> [ 1132.645038] BUG: unable to handle page fault for address: 0000000000400000
> [ 1132.645045] #PF: supervisor instruction fetch in kernel mode
> [ 1132.645047] #PF: error_code(0x0010) - not-present page
> [ 1132.645050] PGD 0 P4D 0
> [ 1132.645053] Oops: 0010 [#1] PREEMPT SMP PTI
> [ 1132.645057] CPU: 7 PID: 429941 Comm: rsync Tainted: P           OE
> 5.15.2-arch1-1 #1 e3bfbeb633edc604ba956e06f24d5659e31c294f
> [ 1132.645061] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./C226 WS, BIOS P3.40 06/25/2018
> [ 1132.645063] RIP: 0010:0x400000

Your computer was trying to execute instructions at 0x400000.  This
smells very much like a single bit flip; ie there was a function
pointer which should have been NULL, but actually had one bit flip
and so the CPU jumped to somewhere that doesn't have any memory
backing it.

Can you run memtest86, or whatever the current flavour of memory testing
software is?

