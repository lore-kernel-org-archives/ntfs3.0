Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA6944E
	for <ntfs3@lists.linux.dev>; Thu, 20 Apr 2023 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pcN/Tje2VmvMcbOA3u2ULY9TMWv0DmyhFS+rCdsBMdY=; b=C3rLQWwm26lG8focs02Dr77541
	qKa9auoTft3gRjxu+e9uf7gRiWZFKcaqe/0g8MKCXsHnlMDBf1TvZ73gSeHHz6sKmmak5tTkWx7hA
	CVc2UKefk9fJHmyg16d7nMt4KGA+wv8HevPa3nArFGUlrXJouUl/oc/bNH5nBEPFWRhEQQQCGnDNE
	klDC8/Fu5CWhHE9xy/AUgRCd7Z9/a5yKtZn55cXzxQcGZt2vAE/Jfgw7BGfsDBC+SeWyI+aqFb7+L
	POiherrsI6JelMF+eZunNtT/vTtewnsYlvugxRd76Y+UDTKr9it/EYAGO7bxjIVsue/Lhr1imAeYg
	hHgaLVBw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1ppbOX-00AxUn-0l;
	Thu, 20 Apr 2023 21:00:45 +0000
Date: Thu, 20 Apr 2023 22:00:45 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: syzbot <syzbot+96cee7d33ca3f87eee86@syzkaller.appspotmail.com>,
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com,
	Mark Fasheh <mark@fasheh.com>,
	Christian Brauner <brauner@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Hillf Danton <hdanton@sina.com>, linux-mm <linux-mm@kvack.org>,
	trix@redhat.com, ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH] vfs: allow using kernel buffer during fiemap operation
Message-ID: <20230420210045.GP3390869@ZenIV>
References: <000000000000e2102c05eeaf9113@google.com>
 <00000000000031b80705ef5d33d1@google.com>
 <f649c9c0-6c0c-dd0d-e3c9-f0c580a11cd9@I-love.SAKURA.ne.jp>
 <bc30483b-7f9b-df4e-7143-8646aeb4b5a2@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc30483b-7f9b-df4e-7143-8646aeb4b5a2@I-love.SAKURA.ne.jp>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Apr 17, 2023 at 11:03:26PM +0900, Tetsuo Handa wrote:
> syzbot is reporting circular locking dependency between ntfs_file_mmap()
> (which has mm->mmap_lock => ni->ni_lock => ni->file.run_lock dependency)
> and ntfs_fiemap() (which has ni->ni_lock => ni->file.run_lock =>
> mm->mmap_lock dependency), for commit c4b929b85bdb ("vfs: vfs-level fiemap
> interface") implemented fiemap_fill_next_extent() using copy_to_user()
> where direct mm->mmap_lock dependency is inevitable.
> 
> Since ntfs3 does not want to release ni->ni_lock and/or ni->file.run_lock
> in order to make sure that "struct ATTRIB" does not change during
> ioctl(FS_IOC_FIEMAP) request, let's make it possible to call
> fiemap_fill_next_extent() with filesystem locks held.
> 
> This patch adds fiemap_fill_next_kernel_extent() which spools
> "struct fiemap_extent" to dynamically allocated kernel buffer, and
> fiemap_copy_kernel_extent() which copies spooled "struct fiemap_extent"
> to userspace buffer after filesystem locks are released.

Ugh...  I'm pretty certain that this is a wrong approach.  What is going
on in ntfs_file_mmap() that requires that kind of locking?

AFAICS, that's the part that looks odd...  Details, please.
