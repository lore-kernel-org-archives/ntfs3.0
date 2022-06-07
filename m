Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19FE3D65
	for <ntfs3@lists.linux.dev>; Tue,  7 Jun 2022 23:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3604C3411C;
	Tue,  7 Jun 2022 23:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654643941;
	bh=ZzzuMYRQflijaLaBGfODgyjv11U3286DsATKWuFwpis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4tzwZKLfTJhFiZ6E6ehWQruktJF1G9RCR7xH9LzpMzFvIflKnHRv+NGoljYjEf/D
	 2GGR4p4XBrnLRyyQepbNS4pBZofypkhAC9PD4prF/CDDJOQb8Z/NvXRbHS7UUWCMHx
	 zcPrPNwfbvhDBQBpQhOUX2589ylWzHF3SBoE7srbHRiDoYZfHOh6KCGTrjWRwgRk1v
	 N58ZBwHrloJZYgCtaqQhb/rgiNH3flwfgsF1UJqXa3YWaKK5YH4JJNIneY5Phqupkc
	 saueSepJdmC3+kbeduzEfiDVE9LAAeBf3osntAYbeMgarOoV4bL5w2CkuysSb6UM7Z
	 FgnilzIcr5W0Q==
Date: Tue, 7 Jun 2022 16:18:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+2c93b863a7698df84bad@syzkaller.appspotmail.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com,
	willy@infradead.org, Stephen Brennan <stephen.s.brennan@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Subject: Re: [syzbot] WARNING: locking bug in truncate_inode_pages_final
Message-ID: <Yp/c4p4MSUyoFenY@sol.localdomain>
References: <0000000000000cf8be05e0d65e09@google.com>
 <20220607160020.c088f4d29929310f2a3c1c32@linux-foundation.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607160020.c088f4d29929310f2a3c1c32@linux-foundation.org>

On Tue, Jun 07, 2022 at 04:00:20PM -0700, Andrew Morton wrote:
> Lots of cc's added.
> 
> On Tue, 07 Jun 2022 00:16:29 -0700 syzbot <syzbot+2c93b863a7698df84bad@syzkaller.appspotmail.com> wrote:
> 
> > Hello,
> 
> Thanks.
> 
> > syzbot found the following issue on:
> 
> Oh dear.
> 
> > HEAD commit:    d1dc87763f40 assoc_array: Fix BUG_ON during garbage collect
> 
> I think this bisection is wrong.

It's not a bisection; if it was, the report would say so.  It's just the commit
that identifies the kernel version on which the problem was seen.

- Eric
