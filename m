Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD132108
	for <ntfs3@lists.linux.dev>; Fri,  8 Sep 2023 11:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864D6C433C9;
	Fri,  8 Sep 2023 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694172479;
	bh=BtLelc3q2oPNmjzinHoYSpk7xou8GNDMnj0H2p2R/bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0RgsCkabn75V0qj7fvNKBuBlvweUo3msG5+LwJ1pNa1pGmonNqx8qZ0DWRI+7Kvg
	 mO2Oj7+OvoQa4gfcFrq/w1hmV2cpxdIpfrSe1aL9HpA+dkHJfXmquRe1Uv1AoxmSCg
	 S6TfMdPpQipyiNIYC5ZMqm5oZd7Jsr7+ZjHUXFt/QFhbwjuxzLoLwjU1G+KloWYfEB
	 bfZfVA0o2i6CNW9VsxZlFz6iFNoucSgCJuJDQVD3Xks/zS8JaaGrWDePy7aSqTMIbJ
	 boeIuxeNpAgHCwgrElrD2v1rV5rlJP+zJUBl0Ecb+uQo5j1Cdd+AYG//0ww9fvzMob
	 mHRgF3M+TvXAQ==
Date: Fri, 8 Sep 2023 13:27:54 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Kara <jack@suse.cz>,
	Guenter Roeck <linux@roeck-us.net>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev
Subject: Re: [PATCH] ntfs3: drop inode references in ntfs_put_super()
Message-ID: <20230908-grundlos-morgig-e055946fde44@brauner>
References: <20230907-vfs-ntfs3-kill_sb-v1-1-ef4397dd941d@kernel.org>
 <20230908081213.GA8240@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908081213.GA8240@lst.de>

On Fri, Sep 08, 2023 at 10:12:13AM +0200, Christoph Hellwig wrote:
> On Thu, Sep 07, 2023 at 06:03:40PM +0200, Christian Brauner wrote:
> > Recently we moved most cleanup from ntfs_put_super() into
> > ntfs3_kill_sb() as part of a bigger cleanup. This accidently also moved
> > dropping inode references stashed in ntfs3's sb->s_fs_info from
> > @sb->put_super() to @sb->kill_sb(). But generic_shutdown_super()
> > verifies that there are no busy inodes past sb->put_super(). Fix this
> > and disentangle dropping inode references from freeing @sb->s_fs_info.
> 
> Sorry for the delay, I've been travelling.  Wouldn't it make more
> sense to just free it in ->kill_sb before calling kill_block_super?

ntfs3 has ntfs_evict_inodes() which might depend on the info in
sbi->s_fs_info to be valid. So calling it before kill_block_super()
risks putting resources that ntfs_evict_inodes() might depend on. Doing
it in ntfs_put_super() will prevent this from becoming an issue without
having to wade through all callchains. And since we can't get rid of
ntfs_put_super() anyway why bother risking that.
