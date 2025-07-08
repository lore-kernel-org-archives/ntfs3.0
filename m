Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A0A29826D
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962889; cv=none; b=A5RwGy1zsqqhokyv7DY/Q0HmiaOwLYk13Fz4u8r4ZvknCcmwJLuqM1l8C9JqMrXXICFT6GprM8BuO1a0l0L3MZA8NXaEJVp/3OX/HyaAkixFmuknY/rxzuE/vXNYyQ9XofzK6LSRb2wmdRyX4F9xJ/0+t+pVoYdJCiIp1L8p4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962889; c=relaxed/simple;
	bh=Xy4R0GhRm1zYDDsyPjU2OtW5JPlNlDToEyl8pSFTjfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNDyu8xJPZyvyVAhdcZcuitSXe4TzKS1Y/+5NGUC5tIhtUxjCEYXgJRxossQf6ZGzy/KmqpHpEIoGzdSHEV7DgHJnQ3i9NOubDOaxTGx00CA7cdlse7/bQM/nO/5zrdnNejXXhWb4fTTXSidXiFWngiTAqRWfah1lr5BDeWUeO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJ/QNkdx; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJ/QNkdx"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e8b3ec5c82eso2169389276.0
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751962886; x=1752567686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlUZ7cTn7Miy6X5K49jne0I7rymSIrF1XA+9YXuR8ZA=;
        b=mJ/QNkdxELcUkGGJ/rQKRSrEP51CCD0Eds8yGTF1V8KbXRd717sI3CM4ubNelxY6tQ
         BDwbuqdjL2VtJ+51TYMgKVifnpVqh6duC1dobWgnwiRN3CHdn2XfJZLYzJlgRWNkt+7H
         D1VmluOLsR63KqGHW30LTJUPy3+FxK55U2PGNe2iTTATsw09jSnkajBFF+FU7PBFC4IP
         z0wYR+k0mnNBcGTbSq1ichBXbv4eg/cApTU0ODhFJLHvD9A0LCm6kGesk3hoeefR9bcr
         Y0JDaASLZjMR406CTBv1iSJ2Ce8ecK2loPxFEZiTlT96PITvwIMrziSbarWXrT4TIyMJ
         1pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751962886; x=1752567686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlUZ7cTn7Miy6X5K49jne0I7rymSIrF1XA+9YXuR8ZA=;
        b=V9tZsW8+1cUGW0OmrXpCsQMMXWzkL3Wp0C3qodVxaxib66cvUYD/KXCua3tlies3Oh
         SU/73LWjF4E8oR2uY3jSkRCVB1XVFsvOT1tY70aVt0ThrJ6hCuHs7qLW19BZ2mx1UR4Q
         219h4p0ZOYomCPeP6OnB8e/4lmdtqH93QrdvaGAdgBnaSLEk5Tobctg3oynMRKmJRHsc
         22GkMWFUlHfseInFlB+zJDvJPWfVift0OXs+rCioXFfsaZT4fdvKBKH7BjvMMoCUkjQ2
         Bt5vFp8Li8eprYjOtWrOvJhlegV1LQdEKvIP8pbAN4Gt7iZTGhxaCzZZB7BQqZ1JFRf2
         qnbA==
X-Forwarded-Encrypted: i=1; AJvYcCXlmjKNVxQZ2h8TmOzqT31RF9yCfb30JI8mhTbiaZykln3v6cp8ZwfbKvQ9xjyfUuqrUcE5Xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMcQzkDT8HAAIU3Kp8v1HH0dV98NjWNEmYIvM0OubLTixYF4rU
	14dEjjnsGUP/iCu2IZMoTlapQR0xahgRcnRylGpK8O6RAyxPvfqT6h8d5nKVomSii3Imxsi5nVV
	fU7R6nHk2T/X/LP2mVBYDctQAt7KPWWA=
X-Gm-Gg: ASbGncsq8VBvhe06vX9sawp/2tVDAhAHG0F4vFAKiuo+dWd2J0htdIF2MQRkP8OGRSF
	Ye6M2FXO0mlDnI/T6gGzLGazcE4uXjLmuYEywY3uia3NSjHj7zmMbj6ISdKNe7c+hyf89mf/jVn
	F0xWBbsKm5eAaS2u7U7LYiEY53by6GMurwbvNdJcIdfxAYYUmbGztZCH4OJ9WhVQQ4i7/Z/Pzam
	vEj
X-Google-Smtp-Source: AGHT+IE7o7N6p5lYzVw7jZRITpHzaRZFTUS2zZhIsHrMv61tyEi0ajKRyAlCxBhYHY0rjm349jECiuSkkeT4NyHeF3E=
X-Received: by 2002:a05:690c:81c5:b0:711:6ea1:8d12 with SMTP id
 00721157ae682-717a06d33f8mr14337597b3.1.1751962886213; Tue, 08 Jul 2025
 01:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAF3JpA5n1Xb7h_RWG+y10zu_cbciPsppv8Pnetmxw6QXxi1D9A@mail.gmail.com>
 <686cd312.a00a0220.338033.0009.GAE@google.com>
In-Reply-To: <686cd312.a00a0220.338033.0009.GAE@google.com>
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
Date: Tue, 8 Jul 2025 01:21:15 -0700
X-Gm-Features: Ac12FXx7ZPBMQAGIWLIpLEUKoik5r2uqfizhYZQfmd0OoNDvRK99L94I1TQAi9g
Message-ID: <CAF3JpA5ZaFem=oPLQbuE4ThT0wpmkw-y-hSvypWu1-evpx8TrA@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
To: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz test

---
 fs/ntfs3/index.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 1bf2a6593dec..15f3a711ea0a 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -478,6 +478,7 @@ static int indx_find_free(struct ntfs_index *indx,
struct ntfs_inode *ni,
        struct ATTR_LIST_ENTRY *le =3D NULL;
        const struct INDEX_NAMES *in =3D &s_index_names[indx->type];
        int err;
+       u64 bm_size;

        b =3D ni_find_attr(ni, NULL, &le, ATTR_BITMAP, in->name, in->name_l=
en,
                         NULL, NULL);
@@ -488,6 +489,17 @@ static int indx_find_free(struct ntfs_index
*indx, struct ntfs_inode *ni,
        *bitmap =3D b;
        *bit =3D MINUS_ONE_T;

+       bm_size =3D b->non_res ? le64_to_cpu(b->nres.valid_size) :
+                              le32_to_cpu(b->res.data_size);
+
+       /*
+        * Allocated index blocks require $BITMAP to contain at least
+        * one bit for usage tracking. A zero-length bitmap in this
+        * case indicates a malformed on-disk structure and cannot be used.
+        */
+       if (unlikely(bm_size =3D=3D 0 && indx->alloc_run.count))
+               return -EINVAL;
+
        if (!b->non_res) {
                u32 nbits =3D 8 * le32_to_cpu(b->res.data_size);
                size_t pos =3D find_next_zero_bit_le(resident_data(b), nbit=
s, 0);
--=20


On Tue, Jul 8, 2025 at 1:13=E2=80=AFAM syzbot
<syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggeri=
ng an issue:
> WARNING in ni_rename
>
> loop0: detected capacity change from 0 to 4096
> ------------[ cut here ]------------
> WARNING: fs/ntfs3/frecord.c:3030 at ni_rename+0xee/0x100 fs/ntfs3/frecord=
.c:3029, CPU#1: syz.0.16/6620
> Modules linked in:
> CPU: 1 UID: 0 PID: 6620 Comm: syz.0.16 Not tainted 6.16.0-rc4-next-202507=
04-syzkaller-07381-g26ffb3d6f02c-dirty #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 05/07/2025
> RIP: 0010:ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029
> Code: 8b 05 b6 5d 9a 0f 48 3b 44 24 10 75 22 44 89 e0 48 83 c4 18 5b 41 5=
c 41 5d 41 5e 41 5f 5d e9 d9 a6 6c 08 cc e8 f3 7d b9 fe 90 <0f> 0b 90 eb c5=
 e8 68 cc 69 08 0f 1f 84 00 00 00 00 00 90 90 90 90
> RSP: 0018:ffffc900033e7ab8 EFLAGS: 00010293
> RAX: ffffffff8306228d RBX: 00000000fffffffe RCX: ffff888021723c00
> RDX: 0000000000000000 RSI: 00000000fffffffe RDI: 0000000000000000
> RBP: 00000000fffffffe R08: ffffffff8fa18a37 R09: 1ffffffff1f43146
> R10: dffffc0000000000 R11: fffffbfff1f43147 R12: 0000000000000000
> R13: ffff88802f30d500 R14: ffff88806d04d0c8 R15: ffff88806d04b368
> FS:  00007f1edd33f6c0(0000) GS:ffff888125d18000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000200000001060 CR3: 000000007c546000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  ntfs_rename+0x6e2/0xb40 fs/ntfs3/namei.c:316
>  vfs_rename+0xbd7/0xf00 fs/namei.c:5129
>  do_renameat2+0x6ce/0xa80 fs/namei.c:5278
>  __do_sys_rename fs/namei.c:5325 [inline]
>  __se_sys_rename fs/namei.c:5323 [inline]
>  __x64_sys_rename+0x82/0x90 fs/namei.c:5323
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1edc58e929
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f1edd33f038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
> RAX: ffffffffffffffda RBX: 00007f1edc7b5fa0 RCX: 00007f1edc58e929
> RDX: 0000000000000000 RSI: 0000200000001040 RDI: 0000200000000280
> RBP: 00007f1edc610b39 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 00007f1edc7b5fa0 R15: 00007ffcb3616c48
>  </TASK>
>
>
> Tested on:
>
> commit:         26ffb3d6 Add linux-next specific files for 20250704
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16c9558258000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D59817f9ef5997=
26c
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Db0373017f711c06=
ada64
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f604=
9-1~exp1~20250616065826.132), Debian LLD 20.1.7
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D175edf7058=
0000
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/686cd312.a00a0220.338033.0009.GAE%40google.com.
