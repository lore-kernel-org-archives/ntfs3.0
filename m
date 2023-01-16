Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA437B
	for <ntfs3@lists.linux.dev>; Mon, 16 Jan 2023 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6sWG3aTzb3qneiOC8BFIN1duLbCvmP2YqNnBs4u/mLI=; b=Hp34zlS+Mrd9+4qkzw5gZUw5ip
	Pu+Pk/+Y7tnA0DuYZ7cJ7OuwEQRxL7xAfRdnZOtP8z8eAqznQCkPggQyF4JE6edrzoeMbPikRXnNj
	EUJuO8m8WdgdOiSQTe11FtBjCJy7RXamu+ptQEEPp6dFXmXVN3K42n/CPaRiERicpztxSLTVQ3c7a
	mK0tKVegJnU6LzWWh0DTDiGGWjCdYOOHu32MmEYTZlBRMPWwridfCsuwC7wi7zCXWvuhHMzTS3Pyh
	KqlQA2mit67Ig5qCUFdnVUrAl5bf+eUhNIyN47IIXj5Mie7wy+1ipQyhWa0B4SrgiiWOAQ0jQ8F44
	gOQYD3EQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pHWBs-002ERe-2C;
	Mon, 16 Jan 2023 20:34:48 +0000
Date: Mon, 16 Jan 2023 20:34:48 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Peng Zhang <zhangpeng362@huawei.com>, kari.argillander@gmail.com,
	akpm@linux-foundation.org, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, sunnanyong@huawei.com,
	wangkefeng.wang@huawei.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next] fs/ntfs3: Fix potential NULL/IS_ERR bug in
 ntfs_lookup()
Message-ID: <Y8W06C8137iclvdl@ZenIV>
References: <20230112013248.2464556-1-zhangpeng362@huawei.com>
 <808288ae-bf1a-ccc6-ab37-d1b2022b44b5@paragon-software.com>
 <Y8Ww/48pwi8RbTIv@ZenIV>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Ww/48pwi8RbTIv@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jan 16, 2023 at 08:18:07PM +0000, Al Viro wrote:
> On Fri, Jan 13, 2023 at 02:05:56PM +0400, Konstantin Komarov wrote:
> 
> > Hello.
> > 
> > We have added a patch with this check just before the New Year. (here https://lore.kernel.org/lkml/ee705b24-865b-26ff-157d-4cb2a303a962@paragon-software.com/)
> 
> See upthread for the reasons why that's wrong.  Incidentally,
> mixing logical change with a pile of whitespace changes is
> bad idea - it's very easy for reviewers to miss...
> 
> Other observation from the cursory look through your namei.c:
> ntfs_create_inode() has no reason to return inode; the reference
> it creates goes into dentry.  Make it return int, the callers will
> be happier.  While we are at it, use d_instantiate_new() instead
> of d_instantiate() + unlock_new_inode() there.
> 
> Incidentally, control flow in there is harder to follow that it
> needs to be:
> 	* everything that reaches out{3,4,5,6,7} is guaranteed
> to have err != 0;
> 	* fallthrough into out2 is guaranteed to have err != 0;
> direct branch to it - err == 0.
> 	* direct branch to out1 is guaranteed to have err != 0.
> 
> I would suggest something along the lines of the following (completely
> untested) delta; the callers are clearly better off that way and
> failure paths are separated from the success one - they didn't share
> anywhere near enough to have it worth bothering.

While we are at it - what's the point passing the symlink body length
to ntfs_create_inode()?  We could calculate it there just as well -
it's used only for symlinks (unsurprisingly) and you've got uncomfortably
many arguments as it is...
