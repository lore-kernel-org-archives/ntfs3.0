Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D889188
	for <ntfs3@lists.linux.dev>; Fri, 29 Sep 2023 00:19:23 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so13597267a12.3
        for <ntfs3@lists.linux.dev>; Thu, 28 Sep 2023 17:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1695946762; x=1696551562; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvzvBt54YKz6rxhAovyc5UddK2JDmyrig02MAqmRW1o=;
        b=hB6Y1mrPycAEycW5z/NEtqii1VLMB+sE9yxX7veVsbIW+HP95ZkZ4CzPEb9S0FqMbN
         35j5da4MdPXKAhKdEy0EghSv74ORRasWkO+OeHo95Eq47E17VRoHg/0j4y3iLEzRtnRf
         28rSCN51nYnimEbBWkaZlXy+2p8Y5OYtvLyaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946762; x=1696551562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvzvBt54YKz6rxhAovyc5UddK2JDmyrig02MAqmRW1o=;
        b=SZhMK6uNX+aAGHIZOJ7/IxpEGkiDI5I6dkbbQC/J3ucI2bbXHmNNey0gqK6DrxFUma
         3Y5F1iaKxF/THF5rxaKtkG4wb6GBPDFqyqJXxqwnwdEaNd9TjizBWUEeEpm44dfhRi4/
         EK0sy9mqfQBmp+RaubRqWMYrJ2wQ8RZPBoIhfAcmK4oYJvSfuXvfv/lPajnTNMYdK5Gu
         niOMiJOnjVjYH2RqBUgAZb7AnQETiW+WNPMjvGsABx2iznJQDw6mCYAF/ktbLCXOndOj
         jari3QQRwEdtsv2IRCJkogwPKpvMNsPZEEnqsBDudPirrsoe3kmk023PEwILluX+oyob
         7k2A==
X-Gm-Message-State: AOJu0YzkB8RRlLWXQJmHlzFyAQDcd4JjecVY+bIKNAdBw/htKSn8wnGv
	DLfePGg97KdodmPBMxNc7BhM2TtzKiXBhbAQfZUBpPQp+CA=
X-Google-Smtp-Source: AGHT+IHkSSKdPElME+pZBHn2fe+9lfzPIgKOpxexZ0W6qWk3cAEXJoEs/ntwhWJmJB7ZliQGrdVOuQ==
X-Received: by 2002:a05:6402:1490:b0:527:ab3f:4350 with SMTP id e16-20020a056402149000b00527ab3f4350mr2528178edv.38.1695946762253;
        Thu, 28 Sep 2023 17:19:22 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402064b00b0053120f313cbsm10328382edx.39.2023.09.28.17.19.20
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 17:19:21 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9b281a2aa94so1185586166b.2
        for <ntfs3@lists.linux.dev>; Thu, 28 Sep 2023 17:19:20 -0700 (PDT)
X-Received: by 2002:aa7:d807:0:b0:530:52d2:f656 with SMTP id
 v7-20020aa7d807000000b0053052d2f656mr2404674edq.21.1695946739584; Thu, 28 Sep
 2023 17:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org> <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com> <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs> <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <20230928212656.GC189345@mit.edu>
In-Reply-To: <20230928212656.GC189345@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 28 Sep 2023 17:18:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTynK9BdGbi+8eShU77nkPvipFwRxEd1TSBrw2+LiuDg@mail.gmail.com>
Message-ID: <CAHk-=wjTynK9BdGbi+8eShU77nkPvipFwRxEd1TSBrw2+LiuDg@mail.gmail.com>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete integers
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Jeff Layton <jlayton@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	David Sterba <dsterba@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Mattia Dongili <malattia@linux.it>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Brad Warrum <bwarrum@linux.ibm.com>, 
	Ritu Agarwal <rituagar@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Gross <markgross@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
	David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
	Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Christoph Hellwig <hch@infradead.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Mike Kravetz <mike.kravetz@oracle.com>, 
	Muchun Song <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>, 
	David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, 
	Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Evgeniy Dushistov <dushistov@mail.ru>, 
	Chandan Babu R <chandan.babu@oracle.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-afs@lists.infradead.org, autofs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	codalist@telemann.coda.cs.cmu.edu, linux-efi@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev, 
	linux-um@lists.infradead.org, linux-mtd@lists.infradead.org, 
	jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
	ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
	linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org, 
	linux-unionfs@vger.kernel.org, linux-hardening@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-trace-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, bpf@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Sept 2023 at 14:28, Theodore Ts'o <tytso@mit.edu> wrote:
>
> I don't think anyone will complain about breaking the userspace API
> --- especially since if, say, the CIA was using this for their spies'
> drop boxes, they probably wouldn't want to admit it.  :-)

Well, you will find that real apps do kind of of care.

Just to take a very real example, "git" will very much notice time
granularity issues and care - because git will cache the 'stat' times
in the index.

So if you get a different stat time (because the vfs layer has changed
some granularity), git will then have to check the files carefully
again and update the index.

You can simulate this "re-check all files" with something like this:

    $ time git diff

    real 0m0.040s
    user 0m0.035s
    sys 0m0.264s

    $ rm .git/index && git read-tree HEAD

    $ time git diff

    real 0m9.595s
    user 0m7.287s
    sys 0m2.810s

so the difference between just doing a "look, index information
matches current 'stat' information" and "oops, index does not have the
stat data" is "40 milliseconds" vs "10 seconds".

That's a big difference, and you'd see that each time the granularity
changes. But then once the index file has been updated, it's back to
the good case.

So yes, real programs to cache stat information, and it matters for performance.

But I don't think any actual reasonable program will have
*correctness* issues, though - because there are certainly filesystems
out there that don't do nanosecond resolution (and other operations
like copying trees around will obviously also change times).

Anybody doing steganography in the timestamps is already not going to
have a great time, really.

                 Linus
