Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E823A15AB
	for <ntfs3@lists.linux.dev>; Sun, 22 Jan 2023 13:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E05C433D2;
	Sun, 22 Jan 2023 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674395187;
	bh=mAScaMaqk3Vdx2xdKRJnI9bSd8fwGAJj6T7KUJE2A/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ftz29efdjZZVziwJ2eIMIHv3Szst+fjhOUQ3Yqyi0EPpHcNaqS2H2kVwtA2Qaz5iX
	 DusqQMByCiG5kbZ29aU0Ftw5f6mTNBlrQRLuneFynpZJRb1tNTJ2zg//RDa6626o1j
	 EaOUSI69c2f0sYZg4Y7sXvkNctl7E0OQ+u4c+His=
Date: Sun, 22 Jan 2023 14:46:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: Alon Zahavi <zahavi.alon@gmail.com>,
	almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, Tal Lossos <tallossos@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] ntfs3: Fix attr_punch_hole() null pointer derenference
Message-ID: <Y80+MZLA2sXyYf2J@kroah.com>
References: <20220815110712.36982-1-zahavi.alon@gmail.com>
 <20230117202136.116810-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117202136.116810-1-sj@kernel.org>

On Tue, Jan 17, 2023 at 08:21:36PM +0000, SeongJae Park wrote:
> Hello,
> 
> On Mon, 15 Aug 2022 14:07:12 +0300 Alon Zahavi <zahavi.alon@gmail.com> wrote:
> 
> > From: Alon Zahavi <zahavi.alon@gmail.com>
> > 
> > The bug occours due to a misuse of `attr` variable instead of `attr_b`.
> > `attr` is being initialized as NULL, then being derenfernced
> > as `attr->res.data_size`.
> > 
> > This bug causes a crash of the ntfs3 driver itself,
> > If compiled directly to the kernel, it crashes the whole system.
> > 
> > Signed-off-by: Alon Zahavi <zahavi.alon@gmail.com>
> > Co-developed-by: Tal Lossos <tallossos@gmail.com>
> > Signed-off-by: Tal Lossos <tallossos@gmail.com>
> 
> This patch has now merged in mainline as
> 6d5c9e79b726cc473d40e9cb60976dbe8e669624.  stable@, could you please merge this
> in stable kernels?
> 
> Fixes: be71b5cba2e64 ("fs/ntfs3: Add attrib operations") # 5.14
> 

Now queued up, thanks.

greg k-h
