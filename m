Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0AE2F5E
	for <ntfs3@lists.linux.dev>; Thu, 13 Oct 2022 13:41:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id bp11so2875411wrb.9
        for <ntfs3@lists.linux.dev>; Thu, 13 Oct 2022 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3c07vJu9MleTx0FO2FYKdcJ7U0JEh0AX+F17VGxRSZ0=;
        b=nFSahUpINIlv8N7joE+sCuWGp8l94HE86NAtPyhjz3HrpgqD6m/OMXC2Ri1dIczVuF
         j0RoXq5MLGGUdox5L7ekW2VmIFIBu+poV2PCrObT24Rubln9mnznIoBkkpuJevfCvPdq
         gsO3bHoa29N//4Kzb6XATHyli3MQ68/yhvJGsorWe8VQx3xb2Nyy+ks+Iob084fd0UZU
         Zfyy2+Idjsl22o9DYiRA2YfX0E6mKLx5rdFpE9aJZeN8HP22C5wMEZsuPJ5XCadJyA+6
         9Q3B1spgMESrtXC8vqWAQkK16PQAl+T7LIFQV5KlfiGuhIZc49l+tMDgCjQxfR0EsR8C
         /nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3c07vJu9MleTx0FO2FYKdcJ7U0JEh0AX+F17VGxRSZ0=;
        b=5WsRHc6gqzK5T5wxDavB53ui3v2aZMso6/6BOc2IZ8Zhi3CRz3IrO8gZb4qgFo7b2J
         PH31bprmOahhnlK+gbtxHpogcQtJxFaEBiZIL9kLYneUY79JxPXf4Ta0xgW0pEIKA7iU
         N8+cU+dvDvlWjVs+57ZRKOJjJtQSLJmXPwnSPKnQAS9X3SvKko68fhPd8XUrmkEFYkS/
         dFOMtkVh/dcXIwzGYZR4JHG8eYbM1NNoE8y+yd3qn//oSeOOYPIil3CSzJN6oUuMKX9K
         O6NBxriRhtWGeIsTGJW+bpkXrjMWYpbzPIHuaHrXGH0z7NGlv39SNMFFKmDl7Q4ONxWK
         dSnA==
X-Gm-Message-State: ACrzQf32aJlEuez/f+PPrk0VFQ1STGr7s8fQ5H0GsWpgFuVImmUq+5Op
	oPW2THxkJQ4dT9pmlbNRn4E=
X-Google-Smtp-Source: AMsMyM5AZ7lMxC2zPbhB2ubvYxLN6ZftzCHi1rbiBbuIl6BEMwdMytZGQ/RCkdPHn6yFMy+03CmYXw==
X-Received: by 2002:adf:e305:0:b0:22e:6b55:3ed9 with SMTP id b5-20020adfe305000000b0022e6b553ed9mr22300wrj.684.1665668473154;
        Thu, 13 Oct 2022 06:41:13 -0700 (PDT)
Received: from rivendell (static.167.156.21.65.clients.your-server.de. [65.21.156.167])
        by smtp.gmail.com with ESMTPSA id r5-20020a5d6945000000b0022cc0a2cbecsm2054921wrw.15.2022.10.13.06.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:41:12 -0700 (PDT)
Date: Thu, 13 Oct 2022 15:41:10 +0200 (CEST)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
cc: Matthew Wilcox <willy@infradead.org>, 
    syzbot <syzbot+cceb1394467dba9c62d9@syzkaller.appspotmail.com>, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk, 
    ntfs3@lists.linux.dev
Subject: Re: [syzbot] BUG: scheduling while atomic in
 exit_to_user_mode_loop
In-Reply-To: <b1f87233-58ae-0a41-8b0e-2e61cb9b70e1@paragon-software.com>
Message-ID: <733c69dc-835b-d6ac-e459-d063bf59a21f@gmail.com>
References: <00000000000006aa2405ea93b166@google.com> <Y0OWBChTBr86DdNv@casper.infradead.org> <b1f87233-58ae-0a41-8b0e-2e61cb9b70e1@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Will these tests be resumed after the fixes are merged?
I think they are really great in point out problems - and to this end I would like to say thank you to the syzkaller project developers.
And all involved parties for the work, the patience and continued effort in developing the VSF and all the filesystems.

Enrico


On Wed, 12 Oct 2022, Konstantin Komarov wrote:

> Date: Wed, 12 Oct 2022 19:24:08
> From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> To: Matthew Wilcox <willy@infradead.org>,
>     syzbot <syzbot+cceb1394467dba9c62d9@syzkaller.appspotmail.com>
> Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
>     syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk,
>     ntfs3@lists.linux.dev
> Subject: Re: [syzbot] BUG: scheduling while atomic in exit_to_user_mode_loop
> 
>
>
> On 10/10/22 06:48, Matthew Wilcox wrote:
>> 
>> Yet another ntfs bug.  It's getting really noisy.  Maybe stop testing
>> ntfs until some more bugs get fixed?
>> 
>
> Hello
> I think, that we can stop testing ntfs3 because there are several fixes in
> development. Until they are pulled in kernel I think it is not necessary
> to run these tests.
>
>> On Sat, Oct 08, 2022 at 10:55:34PM -0700, syzbot wrote:
>>> Hello,
>>> 
>>> syzbot found the following issue on:
>>> 
>>> HEAD commit:    0326074ff465 Merge tag 'net-next-6.1' of 
>>> git://git.kernel...
>>> git tree:       upstream
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15b1382a880000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
>>> dashboard link: 
>>> https://syzkaller.appspot.com/bug?extid=cceb1394467dba9c62d9
>>> compiler:       Debian clang version 
>>> 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU 
>>> Binutils for Debian) 2.35.2
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1755e8b2880000
>>> 
>>> Downloadable assets:
>>> disk image: 
>>> https://storage.googleapis.com/syzbot-assets/c40d70ae7512/disk-0326074f.raw.xz
>>> vmlinux: 
>>> https://storage.googleapis.com/syzbot-assets/3603ce065271/vmlinux-0326074f.xz
>>> mounted in repro: 
>>> https://storage.googleapis.com/syzbot-assets/738016e3c6ba/mount_1.gz
>>> 
>>> IMPORTANT: if you fix the issue, please add the following tag to the 
>>> commit:
>>> Reported-by: syzbot+cceb1394467dba9c62d9@syzkaller.appspotmail.com
>>> 
>>> ntfs3: loop2: Different NTFS' sector size (1024) and media sector size 
>>> (512)
>>> BUG: scheduling while atomic: syz-executor.2/9901/0x00000002
>>> 2 locks held by syz-executor.2/9901:
>>>   #0: ffff888075f880e0 (&type->s_umount_key#47/1){+.+.}-{3:3}, at: 
>>> alloc_super+0x212/0x920 fs/super.c:228
>>>   #1: ffff8880678e78f0 (&sb->s_type->i_lock_key#33){+.+.}-{2:2}, at: 
>>> spin_lock include/linux/spinlock.h:349 [inline]
>>>   #1: ffff8880678e78f0 (&sb->s_type->i_lock_key#33){+.+.}-{2:2}, at: 
>>> _atomic_dec_and_lock+0x9d/0x110 lib/dec_and_lock.c:28
>>> Modules linked in:
>>> Preemption disabled at:
>>> [<0000000000000000>] 0x0
>>> Kernel panic - not syncing: scheduling while atomic
>>> CPU: 1 PID: 9901 Comm: syz-executor.2 Not tainted 
>>> 6.0.0-syzkaller-02734-g0326074ff465 #0
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS 
>>> Google 09/22/2022
>>> Call Trace:
>>>   <TASK>
>>>   __dump_stack lib/dump_stack.c:88 [inline]
>>>   dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
>>>   panic+0x2d6/0x715 kernel/panic.c:274
>>>   __schedule_bug+0x1ff/0x250 kernel/sched/core.c:5725
>>>   schedule_debug+0x1d3/0x3c0 kernel/sched/core.c:5754
>>>   __schedule+0xfb/0xdf0 kernel/sched/core.c:6389
>>>   schedule+0xcb/0x190 kernel/sched/core.c:6571
>>>   exit_to_user_mode_loop+0xe5/0x150 kernel/entry/common.c:157
>>>   exit_to_user_mode_prepare+0xb2/0x140 kernel/entry/common.c:201
>>>   irqentry_exit_to_user_mode+0x5/0x30 kernel/entry/common.c:307
>>>   asm_sysvec_apic_timer_interrupt+0x16/0x20 
>>> arch/x86/include/asm/idtentry.h:649
>>> RIP: 000f:lock_acquire+0x1e1/0x3c0
>>> RSP: 0018:ffffc9000563f900 EFLAGS: 00000206
>>> RAX: 1ffff92000ac7f28 RBX: 0000000000000001 RCX: ffff8880753be2f0
>>> RDX: dffffc0000000000 RSI: ffffffff8a8d9060 RDI: ffffffff8aecb5e0
>>> RBP: ffffc9000563fa28 R08: dffffc0000000000 R09: fffffbfff1fc4229
>>> R10: fffffbfff1fc4229 R11: 1ffffffff1fc4228 R12: dffffc0000000000
>>> R13: 1ffff92000ac7f24 R14: ffffc9000563f940 R15: 0000000000000246
>>>   </TASK>
>>> Kernel Offset: disabled
>>> Rebooting in 86400 seconds..
>>> 
>>> 
>>> ---
>>> This report is generated by a bot. It may contain errors.
>>> See https://goo.gl/tpsmEJ for more information about syzbot.
>>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>> 
>>> syzbot will keep track of this issue. See:
>>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>> syzbot can test patches for this issue, for details see:
>>> https://goo.gl/tpsmEJ#testing-patches
>
>
