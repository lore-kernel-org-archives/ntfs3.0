Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B53C05
	for <ntfs3@lists.linux.dev>; Mon, 31 Oct 2022 18:18:38 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id l190so11322224vsc.10
        for <ntfs3@lists.linux.dev>; Mon, 31 Oct 2022 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xd9F09Tc5953FDmAhIMnVAVjWEOicg+NegCZR3eZuX8=;
        b=pNQMnSeahCYnxAYJTOQLlmujySqfumMOioMVC0+SSj0ww4sdg/IeacLqXb8cjB+Rev
         ZreM+QYq2XGYfW8YWQUndpdFX7Xghm0+oo1GbSH0kG8KOO6QjlF0PGQMfjcdLmO4xvFg
         nOGH2lY6BOiEcdYwu3om77bFE3OLlTEqIGAceV2PC+q8mPgDQ3Y/IpJojtfUwIVFeoLS
         5eu/pszXI01mMxtIMbrdPcAHW2axw2mMLyyZtxRwGe5JSrtNPmqMBf11R0AfTFBZdZLG
         FCAfjvC07QfRgQI//jU015jZK82yBxsPEETEewKs4p5RhQTNKXiewA7tWghQ+OPr0uT1
         Ct0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd9F09Tc5953FDmAhIMnVAVjWEOicg+NegCZR3eZuX8=;
        b=exiFbYXaq4GAiLA6HyP81eZGW16kLeB/fOAWBmu5ayJDnyXVH1OO1ccbo6L1M+rK4K
         77SDu8ZCD7qv1pIU4YvLx8akdHRdWSAGD8PNxOyDaby8//3+7eRvtpWhatSnDbuFSYAf
         gLnPVAWVk9jWPaHrgraRcyyjPrepwMhlyNQLEc7bRUoaf7oc/eVTMb9iIKJeIKCWbDaI
         VCzQ+popnZTsd4lcCqK3adViQmXNjTGYZsTbTHOSzDnWqKDTExZkjohbCeZxAp3708s3
         sI8pTcOOLtPBwltp2jlYNvNrxk4gFUPh1H/7aeNHvrmF+BztwHnue9MqQpLAKu8sChW1
         04tw==
X-Gm-Message-State: ACrzQf0n6mPhrJHZT+9W9iJyloxdhU6eqY7DgKJVtvX/rEEwm9+8opCE
	2/YrUSyij7yaOAudnwZXoe6TVQRL4CNBbh0iyZQ=
X-Google-Smtp-Source: AMsMyM7k7elkLVc/gxPgAjJvvUxTfqOrw+6n1UX8x/PYNKGnyD5AbZBiEhAFyXEoJKxrip2VSx9MJLEamNR0sdhREL8=
X-Received: by 2002:a67:edc9:0:b0:3a9:ee9c:f9c4 with SMTP id
 e9-20020a67edc9000000b003a9ee9cf9c4mr5288346vsp.71.1667240317390; Mon, 31 Oct
 2022 11:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000008b529305ec20dacc@google.com> <20221031175050.xmhub66b6d4dvpcb@quack3>
In-Reply-To: <20221031175050.xmhub66b6d4dvpcb@quack3>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Oct 2022 20:18:25 +0200
Message-ID: <CAOQ4uxiOLZ=symqS3VWiz35DrECGrGhBwUnqZV-1Y+wqNA-OOQ@mail.gmail.com>
Subject: Re: [syzbot] kernel BUG in dnotify_free_mark
To: Jan Kara <jack@suse.cz>
Cc: syzbot <syzbot+06cc05ddc896f12b7ec5@syzkaller.appspotmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022 at 7:50 PM Jan Kara <jack@suse.cz> wrote:
>
> Hello!
>
> [added some CCs to gather more ideas]
>
> On Fri 28-10-22 16:45:33, syzbot wrote:
> > syzbot found the following issue on:
> >
> > HEAD commit:    247f34f7b803 Linux 6.1-rc2
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=157f594a880000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=1d3548a4365ba17d
> > dashboard link: https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
> > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15585936880000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14ec85ba880000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/a5f39164dea4/disk-247f34f7.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/8d1b92f5a01f/vmlinux-247f34f7.xz
> > mounted in repro: https://storage.googleapis.com/syzbot-assets/1a4d2943796c/mount_0.gz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+06cc05ddc896f12b7ec5@syzkaller.appspotmail.com
> >
> > ------------[ cut here ]------------
> > kernel BUG at fs/notify/dnotify/dnotify.c:136!
>
> OK, I've tracked this down to the problem in ntfs3 driver or maybe more
> exactly in bad inode handling. What the reproducer does is that it mounts
> ntfs3 image, places dnotify mark on filesystem's /, then accesses something
> which finds that / is corrupted.  This calls ntfs_bad_inode() which calls
> make_bad_inode() which sets inode->i_mode to S_IFREG. So when the file
> descriptor is closed, dnotify doesn't get properly shutdown because it
> works only on directories. Now calling make_bad_inode() on live inode is
> problematic because it can change inode type (e.g. from directory to
> regular file) and that tends to confuse things - dnotify in this case.
>
> Now it is easy to blame filesystem driver for calling make_bad_inode() on
> live inode but given it seems to be relatively widespread maybe
> make_bad_inode() should be more careful not to screw VFS? What do other
> people think?

Do you know why make_bad_inode() sets inode->i_mode to S_IFREG?
If it did not do that, would it solve the dnotify issue?

Thanks,
Amir.
