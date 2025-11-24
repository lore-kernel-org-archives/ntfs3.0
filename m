Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E7C25BEF8
	for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974931; cv=none; b=DrKLQ/NpEX9hJj6mOoXBLkWetfuPpOPyKJ0Mi/7k3b5OkaHBkWcczs8FXFYgbKwjOVD8vTmcNiMcdGepDzbDi63cx2Fg42yXx8D9ItCnb3LicADF6bIGQFkiYDA3KECUDeGoCGac3/P6plxUOOe8nMS8TMzRkkSXP7FBsQsTneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974931; c=relaxed/simple;
	bh=Xa1HPglc2PcytFmjHYth2irvMtpP171yet/ys8HHA8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJRtwASJIYt+GGvI4cwytam4UdWDBZDZe0VUfUvWXBRHl3Anb843VI4Y7KTs0Cmen8kbZB9zXGsQuNBiklFWn2P2gVhG/WR4xv8YxoMOD+368ufAhyfjQrpuY7fozOwqtxM71wZdL/GU7TErqIxrPccwnQ2kg1z9Nt7qPDqhSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYm11/sw; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYm11/sw"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b735b89501fso448952466b.0
        for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 01:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763974926; x=1764579726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeeLGJj3APe810a7aF6oBE+tf5JgCCG3zWKhawimyWY=;
        b=MYm11/sw6gI+y4w/my2MEvU0aRCxE7vtQoRdjpQlYaS0xK2buSF/d9zH5LZ11N29xk
         I3YO4xID+I9pqVvmWf/AqVGcqIxFjFk6WrxWjD8p8SFXtcQNkf/baVWTwxfh7k2Di1Pk
         8l+/T8A9RFM18kjqYivUGYIR8x8IzV3lcIuE8Cf+dh/iGB58OsKDcqgflWJb3+Ihk/3l
         Lwz7LL9h+9chnY/0bFEKcU/dWiP84JuaVUu2aWlA8wyLID1uJdpb3M6ULSW7LAq9nVyt
         qr5SXiC+0oI4gVA+SSg9sw6OVMe+YpQXrWnZuBign8FB3OKAGB32y4aK7PFa+mc87L5h
         W8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763974926; x=1764579726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeeLGJj3APe810a7aF6oBE+tf5JgCCG3zWKhawimyWY=;
        b=wy+8QSlBv8XShZRYp95GOqhain3h1kBNR+sLy9LHx/Z1Y2vi2jlpx3E3XxsWycNOUw
         IxHJotAhEj3XnJd7lzkU2GTwzI9F3AO81uJu2apw3ueo3thFBBayMgqcpAHntBqQuOd1
         zagW40T4DuTKrKX6HV6lxCOBh4OJrgAvXpmt2UhTbY7R1A/jfaI8X/VwLFJX4M5NFCKO
         VpKm6ZkM891qG33IR5jvvjauayoDknaDWcg4rRsSYKkbWC6jGXUgplETuhp+QgzT9LC5
         ogSGMEeILnomAk2IJCn+Vec46uWJK9TCvU2J7n2zh3+l1Mppa4lAmpBSncwCug4GHn71
         wdng==
X-Forwarded-Encrypted: i=1; AJvYcCUiJgfPh67bLaYRhSCZ7B/eTGXQqlxvcHR6sIB6rwD/8qgw+WU0qQ7NounqrPaCxhcMbaYwqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFUELKDhoqFhirFrX4mcIcdzaz4dN86fR7xEcU6T+pQavuPGSV
	IpgFI4nF/WkwSlwP4iK7lRoKOardmrNX7wBVNcW9rbQZozGh5phnAgmgXmg/rus9m4nIO88F8Dk
	eA4/CG2UAo4oYyJdGV+U8vRLfsqr6DbU=
X-Gm-Gg: ASbGncszxDeebm+vKu6nlbcpNsijYiCDyUBxqxf9RpjF4cu+vFybJnlmXU1edcrxqY0
	+bu/bFyKa2vnGZEEr+HYLyQlJxnDAWdr31S+/JVPteQIPMfB2Qvz9YqGvX3HlVIFkmJv+NAypoi
	4d2U1Beuk9aM7xVeme96bgTcx8x2hoR17fwcwpkPerAgjUsR7biofuiWAcyY/ldWoMB8nqD+KP/
	RTYuuGV1OXijE2N3N62KzNr69iQForInTihXp+VqHzBMJXAIVc3jNjJxwS2knWQdHCKXRYrz5lI
	V7dEWiGH6qh/OVRvpMHIeozOq/h2dDMIFuFL
X-Google-Smtp-Source: AGHT+IGQYqCXfhOnkVW5LV48WFaXI3Aas3wdL6BNbS2cmiEkz94292LrlE14eCDJ5kki8BuV6bjT41K3pJaLyedK4e0=
X-Received: by 2002:a17:906:dc89:b0:b73:6b85:1a9a with SMTP id
 a640c23a62f3a-b7671591ebemr1232341266b.21.1763974925546; Mon, 24 Nov 2025
 01:02:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <gyt53gbtarw75afmeswazv4dmmj6mc2lzlm2bycunphazisbyq@qrjumrerwox5>
 <6924057f.a70a0220.d98e3.007b.GAE@google.com> <wtgy54dfpiapekffjjkonkkhpnxiktfp24wdmwdzf4gslrtact@pongm7vm3l2y>
In-Reply-To: <wtgy54dfpiapekffjjkonkkhpnxiktfp24wdmwdzf4gslrtact@pongm7vm3l2y>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 24 Nov 2025 10:01:53 +0100
X-Gm-Features: AWmQ_blH6nBMAXXG5YWe0GFjJX6yhvvmvFgRsXFcH0PlqpOWOxvgxhbF_Zc3QuM
Message-ID: <CAGudoHHfGndcMwXMupOs82HM6c_ajMw8GETxPdkqzORrEq0btA@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] INFO: task hung in __start_renaming
To: brauner@kernel.org, neil@brown.name
Cc: agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, 
	dhowells@redhat.com, gfs2@lists.linux.dev, jack@suse.cz, 
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk, 
	syzbot+2fefb910d2c20c0698d8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sigh, so it *is* my patch, based on syzbot testing specifically on
directory locking vs inode branches, but I don't see why.

I take it the open() codepath took the rwsem, hence the rename is
sleeping. Given that all reproducers find it *on* cpu, it may be this
is busy looping for some reason.

I don't have time to dig more into it right now, so I think it would
be best to *drop* my patch for the time being. Once I figure it out
I'll send a v2.

On Mon, Nov 24, 2025 at 8:54=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Sun, Nov 23, 2025 at 11:13:03PM -0800, syzbot wrote:
> > syzbot has tested the proposed patch but the reproducer is still trigge=
ring an issue:
> > INFO: task hung in __start_renaming
> >
> > INFO: task syz.0.17:6473 blocked for more than 143 seconds.
> >       Not tainted syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
> > task:syz.0.17        state:D stack:27936 pid:6473  tgid:6471  ppid:6352=
   task_flags:0x400040 flags:0x00080002
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5257 [inline]
> >  __schedule+0x14bc/0x5030 kernel/sched/core.c:6864
> >  __schedule_loop kernel/sched/core.c:6946 [inline]
> >  schedule+0x165/0x360 kernel/sched/core.c:6961
> >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7018
> >  rwsem_down_write_slowpath+0x872/0xfe0 kernel/locking/rwsem.c:1185
> >  __down_write_common kernel/locking/rwsem.c:1317 [inline]
> >  __down_write kernel/locking/rwsem.c:1326 [inline]
> >  down_write_nested+0x1b5/0x200 kernel/locking/rwsem.c:1707
> >  inode_lock_nested include/linux/fs.h:1072 [inline]
> >  lock_rename fs/namei.c:3681 [inline]
> >  __start_renaming+0x148/0x410 fs/namei.c:3777
> >  do_renameat2+0x399/0x8e0 fs/namei.c:5991
> >  __do_sys_rename fs/namei.c:6059 [inline]
> >  __se_sys_rename fs/namei.c:6057 [inline]
> >  __x64_sys_rename+0x82/0x90 fs/namei.c:6057
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > RIP: 0033:0x7f2425d8f749
> > RSP: 002b:00007f2426c44038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
> > RAX: ffffffffffffffda RBX: 00007f2425fe6090 RCX: 00007f2425d8f749
> > RDX: 0000000000000000 RSI: 0000200000000080 RDI: 0000200000000340
> > RBP: 00007f2425e13f91 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > R13: 00007f2425fe6128 R14: 00007f2425fe6090 R15: 00007ffcd5a91138
> >  </TASK>
> >
>
> So at the end of the day I think this erroneously bisected to my patch.
> While it may sound like famous last words, hear me out.
>
> The reproducer fails to trigger the problem on my test jig, thus I
> resorted to asking syzbot.
>
> First patch I sent for testing was merely a sanity check -- prior to my
> patch inode_unhashed() checks were *always* executing, with my patch
> they only happen if I_NEW was spotted. This patch "solved" the problem.
>
> Second patch added some asserts on inode_unhashed() and syzbot had some
> internal issues, ultimately it was not tested.
>
> Third patch added even *more* asserts and t0his time around things
> failed the previously reported way about half an hour of testing. But if
> the first patch indeed solved something, the BUG_ONs would have
> triggered instead.
>
> So that's for testing.
>
> In my first response I made a remark in my first reply that ntfs is at
> fault.  After a quick skim I spotted d_instantiate() instead of
> d_instantiate_new() and jumped to conclusions. It calls unlock_new_inode(=
)
> later which does the right thing, so it is fine AFAICS.
>
> So what about correctness of my patch?
>
> My patch lifted the go-to-sleep code from inode_wait_for_lru_isolating().
> In principle that can be buggy but is just used rarely enough that it
> went unnoticed. I don't see anything wrong with it though, including
> after comparing it with __wait_on_freeing_inode(). Notably both
> synchronize with the ->i_lock. No games played.
>
> I figure maybe there is something fucky going on with ordering on wakeup
> side:
>
> inode_state_clear(inode, I_NEW | I_CREATING);
> inode_wake_up_bit(inode, __I_NEW);
>
> Going through __wake_up_common_lock takes a spinlock, which on amd64
> would have a side effect of publishing that I_NEW store, even ignoring
> therest of the ordering.
>
> On going to sleep side to the flag is only ever tested with ->i_lock
> held anyway, so it can't be an ordering issue on that front. The thread
> could not have been missed from the sleepers list as going to sleep is
> again ->i_lock protected, with the lock only dropped around the call to
> schedule().
>
> So I don't see how this can be buggy.
>
> At the same time the traces report the thing off cpu is playing around
> with rwsems with the __start_renaming et al patchset, while the code for
> inode hash manipulation is decidedly *ON* cpu -- reported by NMIs, not
> hung test detector.
>
> In principle this still can be a thread hung waiting on I_NEW somewhere,
> but syzbot did not produce a collection of backtraces for other threads.
>
> However, given that the __start_renaming et al patchset is complicated
> *and* that syzbot could mistakenly report (or not) a bug I'm led to
> conclude the reproducer is highly unreliable and my commit landed as a
> random victim.
>
> All that said, I think the folk working on that patchset should take
> over.
>
> My patch is a minor optimization and can be skipped in this merge window
> at no real loss,
>
> My take is that the big patchset *should* be skipped in this merge
> window given the above, unless the problem is uickly identified.
