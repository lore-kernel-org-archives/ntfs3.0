Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A455660
	for <ntfs3@lists.linux.dev>; Wed, 12 Apr 2023 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jhnbfZZJmRmZ+IEFhR2VhfrX2b5999A1n8AJ1gD5lxM=; b=fuJmWaypLyPsm8wmSwakd4AtLJ
	0ylp0YlkyNAIfNlutNxX3yTN8vLYyE9fuyJQsWNtD649gEuZSj8PWaRVUgM/dcyOmzhffiS93i4Cy
	vEUBETP/sVTGRA1NtfVaZgQeV4neTcIsIdyH32yDMXTvdM6uYnP9eNxRJQPL/T5sIBeDDzFJNZB8+
	B3GRn7z9e+1vk7uY4FD8kgdb/uYhD8E5nhDhX13W+Fkpqxesk9GfStsGntLvXnung9qudYGGCSleI
	T3ViyMdxrfjVpVzzsMViUXD4QDeqZe9IGmpYpREkkq8kzO4YGpWVNxNBRoXkv0mOo06eFwJRz5sQ7
	sypV+wow==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pmaIG-006tKO-VN; Wed, 12 Apr 2023 13:13:49 +0000
Date: Wed, 12 Apr 2023 14:13:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: syzbot <syzbot+96cee7d33ca3f87eee86@syzkaller.appspotmail.com>,
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Hillf Danton <hdanton@sina.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>, trix@redhat.com,
	ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH] fs/ntfs3: disable page fault during ntfs_fiemap()
Message-ID: <ZDaujCO3Azv92JxX@casper.infradead.org>
References: <000000000000e2102c05eeaf9113@google.com>
 <00000000000031b80705ef5d33d1@google.com>
 <f649c9c0-6c0c-dd0d-e3c9-f0c580a11cd9@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f649c9c0-6c0c-dd0d-e3c9-f0c580a11cd9@I-love.SAKURA.ne.jp>

On Wed, Apr 12, 2023 at 10:11:08PM +0900, Tetsuo Handa wrote:
> syzbot is reporting circular locking dependency between ntfs_file_mmap()
> (which has mm->mmap_lock => ni->ni_lock dependency) and ntfs_fiemap()
> (which has ni->ni_lock => mm->mmap_lock dependency).
> 
> Since ni_fiemap() is called by ioctl(FS_IOC_FIEMAP) via optional
> "struct inode_operations"->fiemap callback, I assume that importance of
> ni_fiemap() is lower than ntfs_file_mmap().
> 
> Also, since Documentation/filesystems/fiemap.rst says that "If an error
> is encountered while copying the extent to user memory, -EFAULT will be
> returned.", I assume that ioctl(FS_IOC_FIEMAP) users can handle -EFAULT
> error.

What?  No, that doesn't mean "You can return -EFAULT because random luck".
That means "If you pass it an invalid address, you'll get -EFAULT back".

NACK.
