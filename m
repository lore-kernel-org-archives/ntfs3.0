Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E88835
	for <ntfs3@lists.linux.dev>; Thu, 30 Mar 2023 16:26:00 +0000 (UTC)
Received: by mail-il1-f208.google.com with SMTP id a9-20020a921a09000000b003264524481cso442354ila.7
        for <ntfs3@lists.linux.dev>; Thu, 30 Mar 2023 09:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680193559; x=1682785559;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T+dBOx95iSr24ri7d8wMa5srG3WWZaF8JUbwdum/RBY=;
        b=fu0r7R35ipP1tOANbmrLTzidD3X/WuX0EWFtQmhuXWf5YkE1/UkQz22FwQdVjazy05
         ZGywQQGaBjQ9MhirSYFNiYc+/TQYzV/iiOPmhu+gylJcer0rCYnRu3Nd4GBGEKaRuXxG
         vkXEq5JopvnRxoQcWa8pw0Nnm/yneG5k1rX3Akl0LNRdfl/i+rsxZ+8grjpyYymCVypv
         REldyGa0X7EzNUFsVzcagEb40zroeGcbpwh89AIUrkJiH0ov+xqKi+j+83YOxDNcC26+
         bk01UrBcgyV6BJEyVtj2qT3TMQe5MrefDlGiJP/wJ/nZ3rYyuoOsJNRCef7zU43pGChL
         cfDQ==
X-Gm-Message-State: AAQBX9fFhbEQkRShdRZoIyylKzIgfFLs5iT+y9niNMfnRjdnFSDyCo9E
	g6ogiOM/fHV0zy7F+a72zpe6f2PKarnvNI5xaxKronby8Era
X-Google-Smtp-Source: AKy350YpSMoQTsHL/4Yzsb0ybOReAZtTdnsOsaipsea6BE0mZJGFTyAVUssFbne9V7tMSA1ohsrw3Kxew1ed5hF5z9XH7KpHqWrM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:3343:0:b0:40b:466:4367 with SMTP id
 k3-20020a023343000000b0040b04664367mr1375618jak.3.1680193559698; Thu, 30 Mar
 2023 09:25:59 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:25:59 -0700
In-Reply-To: <000000000000030b7e05f7b9ac32@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047a22405f8208cf9@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in attr_data_get_block (2)
From: syzbot <syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    ffe78bbd5121 Merge tag 'xtensa-20230327' of https://github..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16237c0dc80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c35b3803e5ad668
dashboard link: https://syzkaller.appspot.com/bug?extid=a98f21ebda0a437b04d7
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139dca3ec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a55a35c80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/595cb07a344c/disk-ffe78bbd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/13a6464b8ace/vmlinux-ffe78bbd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/640bf4496398/bzImage-ffe78bbd.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/53cbcc1fd741/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5092 at fs/ntfs3/attrib.c:1060 attr_data_get_block+0x1926/0x2da0
Modules linked in:
CPU: 0 PID: 5092 Comm: syz-executor285 Not tainted 6.3.0-rc4-syzkaller-00039-gffe78bbd5121 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
RIP: 0010:attr_data_get_block+0x1926/0x2da0 fs/ntfs3/attrib.c:1060
Code: 80 e1 07 80 c1 03 38 c1 0f 8c 48 ff ff ff 48 8d bc 24 e0 01 00 00 e8 99 54 1b ff 48 8b 54 24 58 e9 31 ff ff ff e8 fa 9d c5 fe <0f> 0b bb ea ff ff ff e9 11 fa ff ff e8 e9 9d c5 fe e9 0f f9 ff ff
RSP: 0018:ffffc90003cb7ac0 EFLAGS: 00010293
RAX: ffffffff82c4b4f6 RBX: 00000000ffffffff RCX: ffff888076523a80
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 00000000ffffffff
RBP: ffffc90003cb7d28 R08: ffffffff82c4afcf R09: fffffbfff205c652
R10: 0000000000000000 R11: dffffc0000000001 R12: 1ffff92000796f78
R13: 0000000000000032 R14: ffff8880756043a0 R15: dffffc0000000000
FS:  00007f2d8728d700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2d8726c718 CR3: 000000007693d000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ntfs_fallocate+0xca4/0x1190 fs/ntfs3/file.c:614
 vfs_fallocate+0x54b/0x6b0 fs/open.c:324
 ksys_fallocate fs/open.c:347 [inline]
 __do_sys_fallocate fs/open.c:355 [inline]
 __se_sys_fallocate fs/open.c:353 [inline]
 __x64_sys_fallocate+0xbd/0x100 fs/open.c:353
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2d8f5027b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 71 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2d8728d308 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f2d8f5a67b8 RCX: 00007f2d8f5027b9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007f2d8f5a67b0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000ff8000 R11: 0000000000000246 R12: 00007f2d8f5a67bc
R13: 00007f2d8f5734ac R14: 0030656c69662f2e R15: 0000000000022000
 </TASK>

