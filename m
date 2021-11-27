Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00A68
	for <ntfs3@lists.linux.dev>; Sat, 27 Nov 2021 14:13:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id y26so31371223lfa.11
        for <ntfs3@lists.linux.dev>; Sat, 27 Nov 2021 06:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mGakPxRWbeDMfRplQY/zs09Z0GbStbewlPuFi7URiMs=;
        b=KUv2yq2M4MsgKDhTTxt5NiED3rG2s9c9hhFDafumApEkvPu31JtIhYFUfuWmJow8qI
         AlhleTnXZqaVBtFK50t1cZOq9bNIk4N2eUk1c76Ou9TG6/mHlWF9r50E/xCRg4SJh3WO
         bjS+2PGOBuf4d4RIYc0VKshh0dLI/18qLuBu/nz66dCPc8qOeHw+Sn4i1p64At6ytEJS
         S2Sj4Uz2hU5aFLBR9Vdzjp7otuhWzpkJl4tSXh/5OxNVcp6nbUxfBPyGLzERZ1i41eRZ
         6kxZHoUeRs6ZTg60OgjIkjc4oCnichP6KSCAEgpYMgQFxVWX+X9V5zVxIqeJf9cgKI8c
         Puxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mGakPxRWbeDMfRplQY/zs09Z0GbStbewlPuFi7URiMs=;
        b=xIev1J6uKt+n1CrKpruA70dLEeZC0SqxvqCzOjOSlcguKYZELYRcAo254hnpQon9nl
         ExeeLUxzgsWnuxcehSn0TvUK0AKHDli4fTYbaai23/5se1VdZ4Ci34TPy8ZcGIX5ub0E
         xPWOZkTDoTjtCMTy8PaOGByYCDge6d+B6EvCArWaqopShging7Mia7BdLP+/F0a8IOS/
         +zArEJFo1Q8GCuzsDOLXiRektcKXqeqDgVrkM4lNLtxtH7jtKQF9rQyu61nRwm9xbQKa
         COm8LBEl1CJ+WIFSQNz6t2atTv8/kiPBH44N0VFKBgQcB6p8ng0P7PLhtFVNxUD2qWeI
         yZSQ==
X-Gm-Message-State: AOAM5306lddKGvwKUpAnLNCTSglf5TVM+fYu9Nu8Qw1hfBvh086jLOTs
	B3e5pl9UL2Y+O0+PDj39t2217MZL7LcIt8PG2vM=
X-Google-Smtp-Source: ABdhPJwjSDyh86g4KztYXaiIFxLtpkp18tZH7CnObdy4xo0aXhsauFbKa6ArCfhYVEU1mUgE5r/tx+MpewdD+eAIc0A=
X-Received: by 2002:a05:6512:11cb:: with SMTP id h11mr37463586lfr.297.1638022396972;
 Sat, 27 Nov 2021 06:13:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mohan R <mohan43u@gmail.com>
Date: Sat, 27 Nov 2021 19:43:06 +0530
Message-ID: <CAFYqD2pe-sjPrHXGsNCHa2fcdECNm44UEZbEn4P5VgygFnrn7A@mail.gmail.com>
Subject: Re: Bug using new ntfs3 file system driver (5.15.2 on Arch Linux)
To: uwe.sauter.de@gmail.com
Cc: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	ntfs3@lists.linux.dev, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I confirm this issue. I tried to rsync between two ntfs3 mounts, but
rsync got killed unexpectedly.

Nov 27 19:21:53 mohanlaptop0 kernel: BUG: unable to handle page fault
for address: ffffb9c24fb74000
Nov 27 19:21:53 mohanlaptop0 kernel: #PF: supervisor read access in kernel mode
Nov 27 19:21:53 mohanlaptop0 kernel: #PF: error_code(0x0000) - not-present page
Nov 27 19:21:53 mohanlaptop0 kernel: PGD 100000067 P4D 100000067 PUD
1001bd067 PMD 10460a067 PTE 0
Nov 27 19:21:53 mohanlaptop0 kernel: Oops: 0000 [#2] PREEMPT SMP NOPTI
Nov 27 19:21:53 mohanlaptop0 kernel: CPU: 5 PID: 144039 Comm: rsync
Not tainted 5.15.5-arch1-1 #1 f0168f793e3f707b46715a62fafabd6a40826924
Nov 27 19:21:53 mohanlaptop0 kernel: Hardware name: Dell Inc. Inspiron
14 5410/0CKN95, BIOS 2.2.1 07/27/2021
Nov 27 19:21:53 mohanlaptop0 kernel: RIP: 0010:show_trace_log_lvl+0x1a4/0x32d
Nov 27 19:21:53 mohanlaptop0 kernel: Code: c7 14 60 a5 86 e8 0f be 00
00 4d 85 ed 74 41 0f b6 95 37 ff ff ff 4c 89 f1 4c 89 ee 48 8d bd 50
ff ff ff e8 dc fd ff ff eb 26 <4c> 8b 3b 48 8d bd 70 ff ff ff e8 2e 4e
52 ff 4c 89 ff 48 89 85 28
Nov 27 19:21:53 mohanlaptop0 kernel: RSP: 0018:ffffb9c24fb738d8 EFLAGS: 00010012
Nov 27 19:21:53 mohanlaptop0 kernel: RAX: 0000000000000000 RBX:
ffffb9c24fb73fff RCX: 0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: RDX: 0000000000000000 RSI:
0000000000000000 RDI: 0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: RBP: ffffb9c24fb739b8 R08:
0000000000000000 R09: 0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: R10: 0000000000000000 R11:
0000000000000000 R12: ffff949c432b0000
Nov 27 19:21:53 mohanlaptop0 kernel: R13: 0000000000000000 R14:
ffffffff86a7d25f R15: 0000000000002b00
Nov 27 19:21:53 mohanlaptop0 kernel: FS:  00007f40259b8580(0000)
GS:ffff949dc7740000(0000) knlGS:0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 27 19:21:53 mohanlaptop0 kernel: CR2: ffffb9c24fb74000 CR3:
00000001b114c005 CR4: 0000000000770ee0
Nov 27 19:21:53 mohanlaptop0 kernel: PKRU: 55555554
Nov 27 19:21:53 mohanlaptop0 kernel: Call Trace:
Nov 27 19:21:53 mohanlaptop0 kernel:  <TASK>
Nov 27 19:21:53 mohanlaptop0 kernel:  __die_body.cold+0x1a/0x1f
Nov 27 19:21:53 mohanlaptop0 kernel:  page_fault_oops+0x19e/0x310
Nov 27 19:21:53 mohanlaptop0 kernel:  exc_page_fault+0xda/0x180
Nov 27 19:21:53 mohanlaptop0 kernel:  asm_exc_page_fault+0x1e/0x30
Nov 27 19:21:53 mohanlaptop0 kernel: RIP: 0010:0xffffff8586d685ff
Nov 27 19:21:53 mohanlaptop0 kernel: Code: Unable to access opcode
bytes at RIP 0xffffff8586d685d5.
Nov 27 19:21:53 mohanlaptop0 kernel: RSP: 0018:ffffb9c24fb73b4f EFLAGS: 00010246
Nov 27 19:21:53 mohanlaptop0 kernel: RAX: 0000000000000000 RBX:
0000000000001700 RCX: 0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: RDX: 0000000000000000 RSI:
0000000000000000 RDI: 0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: RBP: ffb9c24fb73c3800 R08:
0000000000000000 R09: 0000000000000000
Nov 27 19:21:53 mohanlaptop0 kernel: R10: 0000000000000000 R11:
0000000000000000 R12: ff949b43a8426800
Nov 27 19:21:53 mohanlaptop0 kernel: R13: 00000001112ccaff R14:
fff6a0c99d400000 R15: 00000000000056ff
Nov 27 19:21:53 mohanlaptop0 kernel:  ? page_cache_ra_unbounded+0x1c5/0x250
Nov 27 19:21:53 mohanlaptop0 kernel:  ? filemap_get_pages+0x269/0x730
Nov 27 19:21:53 mohanlaptop0 kernel:  ? filemap_read+0xb9/0x360
Nov 27 19:21:53 mohanlaptop0 kernel:  ? new_sync_read+0x156/0x1f0
Nov 27 19:21:53 mohanlaptop0 kernel:  ? vfs_read+0xff/0x1a0
Nov 27 19:21:53 mohanlaptop0 kernel:  ? ksys_read+0x67/0xf0
Nov 27 19:21:53 mohanlaptop0 kernel:  ? do_syscall_64+0x59/0x90
Nov 27 19:21:53 mohanlaptop0 kernel:  ? do_syscall_64+0x69/0x90
Nov 27 19:21:53 mohanlaptop0 kernel:  ? syscall_exit_to_user_mode+0x23/0x50
Nov 27 19:21:53 mohanlaptop0 kernel:  ? do_syscall_64+0x69/0x90
Nov 27 19:21:53 mohanlaptop0 kernel:  ? syscall_exit_to_user_mode+0x23/0x50
Nov 27 19:21:53 mohanlaptop0 kernel:  ? do_syscall_64+0x69/0x90
Nov 27 19:21:53 mohanlaptop0 kernel:  ? syscall_exit_to_user_mode+0x23/0x50
Nov 27 19:21:53 mohanlaptop0 kernel:  ? do_syscall_64+0x69/0x90
Nov 27 19:21:53 mohanlaptop0 kernel:  ? do_syscall_64+0x69/0x90
Nov 27 19:21:53 mohanlaptop0 kernel:  ? entry_SYSCALL_64_after_hwframe+0x44/0xae

Thanks,
Mohan R
