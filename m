Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EB17C8
	for <ntfs3@lists.linux.dev>; Wed, 19 Jul 2023 01:35:42 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b9bf0252f3so3756128a34.2
        for <ntfs3@lists.linux.dev>; Tue, 18 Jul 2023 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1689730541; x=1692322541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZssYNKocP7SJAjxckC3wBJ507CzulE9IvrMWjf3P+k=;
        b=5Slf0Wf1DkEOl9A1TiQUYv8SMKm8hpMZkE2pdlrBFVPzzvpLYuiVjUXLVmHCw57mm3
         QfMAXPNPanSdHmq5ZWXmuM6TgukKEbveLzpwksx2dw9ZklwdjhA52vimEHT2eirBfa+2
         IT2vnquxNaJm7BjHGdah8DmKJSIjdo0Yp6c26+N05rt7PzrzOKrn94s8yKsSInPTUfNp
         YfGoevKBsYDtPuhIbewKvY1jLvJ5fb914inI0h60wc0+K8b0g/S/UYKcw11+BXpzkI08
         6FecWUvMm8TYFIR2erayRFzaDHDt6sysMcKT2DfDdd2VqMiXCbsW5RRwMl7laE7GyBrL
         HnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689730542; x=1692322542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZssYNKocP7SJAjxckC3wBJ507CzulE9IvrMWjf3P+k=;
        b=c3BQvDj8OfK5w9GwzgXS4UH0ubMBfHYzztyH/oSyc51V6rL2vbBBQ7vafc19y2x1IU
         Ut186Or2oAQAHjBdhWVyoo67RvFAauNgDYHpomrwxaoZkLA7wbboE3FAMAynxTArGJci
         2+tJQTxLJo7bI9edt+QqNi3GAL2oK+U+GNwCgvUinTHNOmWpDQ7zWLaKjE9azyGCJpOI
         zpIXPWreWf5nb7vzLJhMd9MD1a9x4AypCaCdPObZj3KibluF8OaeSPeL/imUotqXq0+s
         xsaCYQUlKU6y/uFv4HNnkdWKkYTmxXWUNK3kgEefhQOZ2eUrzS7IEq/R/jRPwoejjRsK
         jHrA==
X-Gm-Message-State: ABy/qLa5EeiGJnRYrodQzyRQBqJOZiMLrKXQmgbglT3/IluETlmp1OWM
	jlLi0zOG/NIOOgDIOqvcqSmIPA==
X-Google-Smtp-Source: APBJJlHb4gEwJfD+TL2icCrXL1rPSO1/If2sqk52+FC1gSV2ztjdma15fYoDbEqUpP5c7bsoFPcHEw==
X-Received: by 2002:a05:6870:96a6:b0:1b3:8d35:c85f with SMTP id o38-20020a05687096a600b001b38d35c85fmr1011777oaq.1.1689730541592;
        Tue, 18 Jul 2023 18:35:41 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au. [49.186.119.116])
        by smtp.gmail.com with ESMTPSA id 201-20020a6301d2000000b005633311c70dsm2343100pgb.32.2023.07.18.18.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 18:35:40 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qLw6L-007mcz-1V;
	Wed, 19 Jul 2023 11:35:37 +1000
Date: Wed, 19 Jul 2023 11:35:37 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
	Tyler Hicks <code@tyhicks.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>, Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@kernel.org>, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
	ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v5 6/8] xfs: switch to multigrain timestamps
Message-ID: <ZLc96V2Yo72sthsi@dread.disaster.area>
References: <20230713-mgctime-v5-0-9eb795d2ae37@kernel.org>
 <20230713-mgctime-v5-6-9eb795d2ae37@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713-mgctime-v5-6-9eb795d2ae37@kernel.org>

On Thu, Jul 13, 2023 at 07:00:55PM -0400, Jeff Layton wrote:
> Enable multigrain timestamps, which should ensure that there is an
> apparent change to the timestamp whenever it has been written after
> being actively observed via getattr.
> 
> Also, anytime the mtime changes, the ctime must also change, and those
> are now the only two options for xfs_trans_ichgtime. Have that function
> unconditionally bump the ctime, and warn if XFS_ICHGTIME_CHG is ever not
> set.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
>  fs/xfs/xfs_iops.c               | 4 ++--
>  fs/xfs/xfs_super.c              | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
> index 0c9df8df6d4a..86f5ffce2d89 100644
> --- a/fs/xfs/libxfs/xfs_trans_inode.c
> +++ b/fs/xfs/libxfs/xfs_trans_inode.c
> @@ -62,12 +62,12 @@ xfs_trans_ichgtime(
>  	ASSERT(tp);
>  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
>  
> -	tv = current_time(inode);
> +	/* If the mtime changes, then ctime must also change */
> +	WARN_ON_ONCE(!(flags & XFS_ICHGTIME_CHG));

Make that an ASSERT(flags & XFS_ICHGTIME_CHG), please. There's no
need to verify this at runtime on production kernels.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
