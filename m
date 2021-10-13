Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120742C83
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 21:14:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A689561175
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634159685;
	bh=SlbEmP0SftpYg5Qzgl+3uhbNwtKN42MS1eJbqRVvz8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hiKscGct16rhTAVFUvB8ulUGFNYX0XJpF+2YqPKF0No0/OTxa8B+FbCYvPeznM3IT
	 o7+9DVjPYoKAxa50QdWsJ1gL4J+4wBU1jNZrm6P/FvNKQ8G7E2qrXO9VM2GBzVJvw8
	 S/gFZjYpmMou1VruRE19i94wuylZi24lJbQ6yAN6OeRqXntYIE5B0JYh+T/uz9ctke
	 L86OtKTf7XCkJxLOyXfeIFv5kZLrR3s6zlWx8Mcxq8cYKDBsASwSQxb8GUZPcnzqgT
	 VFHmPHbz4NrsEHQ/qmk1iEmYL+m9W0ImnKdxKKKAOXKE+hMXaoTAVCJomjq0s1kTjo
	 7pgsY+NMeWiSg==
Received: by mail-lf1-f50.google.com with SMTP id t9so17456323lfd.1
        for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 14:14:45 -0700 (PDT)
X-Gm-Message-State: AOAM531rXfs18hScl1JxntKIygquKzBw3brCjSMmFPKEKfoHtm7z39D2
	dEiUGVGp0iXm4FJ5qZq6EdfpDZvuJ0IUWIx+4wo=
X-Google-Smtp-Source: ABdhPJy4PwudaFsA5k7zIKbmlSW7M8/j3iWHJKEthDYdjnMO754KPa3JLlK+wmXJkye7TEJ2vXHzCCixulymuZnDiqk=
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr1736234ljc.527.1634159683768;
 Wed, 13 Oct 2021 14:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013051042.1065752-1-hch@lst.de> <20211013051042.1065752-5-hch@lst.de>
 <202110122311.B43459E21@keescook>
In-Reply-To: <202110122311.B43459E21@keescook>
From: Song Liu <song@kernel.org>
Date: Wed, 13 Oct 2021 14:14:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6MFRmKfpUxLL3=TRAgNTuTMFySc=_-NA7YOWDAvYAxyQ@mail.gmail.com>
Message-ID: <CAPhsuW6MFRmKfpUxLL3=TRAgNTuTMFySc=_-NA7YOWDAvYAxyQ@mail.gmail.com>
Subject: Re: [PATCH 04/29] md: use bdev_nr_sectors instead of open coding it
To: Kees Cook <keescook@chromium.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>, 
	Mike Snitzer <snitzer@redhat.com>, David Sterba <dsterba@suse.com>, 
	Josef Bacik <josef@toxicpanda.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Dave Kleikamp <shaggy@kernel.org>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>, linux-block@vger.kernel.org, 
	dm-devel@redhat.com, drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
	ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 11:12 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Oct 13, 2021 at 07:10:17AM +0200, Christoph Hellwig wrote:
> > Use the proper helper to read the block device size.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> I think it might make sense, as you suggest earlier, to add a "bytes"
> helper. This is the first user in the series needing:
>
>         bdev_nr_sectors(...bdev) << SECTOR_SHIFT
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Acked-by: Song Liu <song@kernel.org>
