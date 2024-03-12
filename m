Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB427A121
	for <ntfs3@lists.linux.dev>; Tue, 12 Mar 2024 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710247453; cv=none; b=FGzyZcBp7hC8gN42rzyZEDNc89Z3GsoVziAntKAaCOogCNWJ1LAI9ozvlWwzCN1lhnteNtRD+v7VMPb2tsmqDagL7ULW9KunAa/CHhCEEM9kQZNFrgIoZQur62+4SsfVfNLt6a9sdB4lqGvuFNNGC6KbdEVVfUAGJysoM+7QrYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710247453; c=relaxed/simple;
	bh=MH+RmzJqqEIBVXo90i5vM3YiEiBivhNjk5yTuw80LFM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKu+8UIx+z2YmS1mn8mdtnK6wFi5tGUkL9RFUf+0AZbWsLnPFjtLSqeqnhUcNpl5YL2kfIx/Z5hPlgzO4KfkqXtczvwc9wTa9HnPNPN5+doKyeuiIs8bPmNYHrOdN1wDW/Qwro69TghJbPR0P0VEyLuxWQ8cVY/oQ0ZSep55D+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R13gAUxA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R13gAUxA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso3630268a12.2
        for <ntfs3@lists.linux.dev>; Tue, 12 Mar 2024 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710247448; x=1710852248; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qGx1SAuuMtMPbkqKhMFRhqHlJUlfDVpupNqFcCtt0Xg=;
        b=R13gAUxAc/gQZOBhkMIqvZdROowJ8eX85JgHGcdHwbq/OLQHfiJzzMD22ffj3yrHps
         EJXxwzsj1LPu75BAStJwI1lDvApNwLndC0FGMYBe0QK6oSd1RWkCKjJ+nO3p8fr8jOoF
         Ipuyka6Mqi5Dnlazn50+OQYwPx9U/kOwle2ANKvAq317xbz4lsDS9UozZmylcjDtp9WB
         m2R2eyCRvpNIro+KpU/gDeWJcaP3roOR1HBebvcbzunf02n8wiTya/R2vxW0/E+jBDHv
         5Nfg1FMuBvo9n1YGm4GHGux0UU9sWbuXBeh2jwiZXK4wtmd66H0g3rNMLKL/DWpfTv9/
         gupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247448; x=1710852248;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGx1SAuuMtMPbkqKhMFRhqHlJUlfDVpupNqFcCtt0Xg=;
        b=UbH6wP5D5UNgYGt1KrCMm3JlVX7k5995qUObZ8zSpVwVNFSTr0cZly5Vvu8jDq/Tts
         bLu+2JnWbT/X0fr88jWuaDkQupTTzxE9vFpu7KoD43WDl1i0utGXIX5d7jYDBZ67Csys
         x7OogOJ7mAED0OvMHyVrH8s8Zw3ifADhqspjht//AFRizo0lIv/emUCa8k17phKSFYMN
         krNqyjtUAK6s2YUqtnE75KUVmkiXRvOlKLXJ6XPUqjoqtPs8o1T2L6jww7wiBRPKkWV6
         t01l+9s4yDpaOvDh0abgEC3IOiKlwIy6adIimb3UBOvwees3lPlN00TtoumpePfiKYV2
         mCDA==
X-Forwarded-Encrypted: i=1; AJvYcCXghwmqlsZzl41Ox6p6fhNFtMXN+8FPmb5GTiPQlMaWMLwEQbCVWFIA5CxXQkyZXXTQzb6vvdSxOdvAMw1UWQVU9E8Vr5g=
X-Gm-Message-State: AOJu0YzhyO/KBGr/eRfm3cmYn5555wNZuSSaYg3FtY5gG7tKuHAWd8AE
	FtwWvqwru7ks93bJOOOrYtXZOgMaAlgQOVlHCeX9LzctKjUAeqK3jGBXZ2AQ9GssIIiJsDJLbXu
	RZ6nJx4iHM1bnMwYKjDofx/5RYWI=
X-Google-Smtp-Source: AGHT+IHf5Mmnm9eokPIC+RAuWPaLLdKydE4R+EnGXpUBogywCJzE1P3gWMX/3a9TW1dhq8iJu2ZHc9ZPPPwwSNBRvz4=
X-Received: by 2002:a50:d71b:0:b0:567:504e:e779 with SMTP id
 t27-20020a50d71b000000b00567504ee779mr1210099edi.25.1710247448377; Tue, 12
 Mar 2024 05:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6f02:8506:b0:65:b649:35ec with HTTP; Tue, 12 Mar 2024
 05:44:07 -0700 (PDT)
In-Reply-To: <20240312120658.os72hvnk5jedwbaw@quack3>
References: <000000000000c74d44060334d476@google.com> <000000000000f67b790613665d7a@google.com>
 <20240311184800.d7nuzahhz36rlxpg@quack3> <CAGudoHGAzNkbgUsJwvTnmO2X5crtLfO47aaVmEMwZ=G2wWTQqA@mail.gmail.com>
 <20240312120658.os72hvnk5jedwbaw@quack3>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 12 Mar 2024 13:44:07 +0100
Message-ID: <CAGudoHGLLbXxxEyeOQxecL5Cj21rFgMo1QFGYntF+aNEKyJ=rQ@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in do_open_execat
To: Jan Kara <jack@suse.cz>
Cc: syzbot <syzbot+6ec38f7a8db3b3fb1002@syzkaller.appspotmail.com>, 
	almaz.alexandrovich@paragon-software.com, anton@tuxera.com, axboe@kernel.dk, 
	brauner@kernel.org, ebiederm@xmission.com, keescook@chromium.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ntfs-dev@lists.sourceforge.net, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, tytso@mit.edu, 
	viro@zeniv.linux.org.uk, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

On 3/12/24, Jan Kara <jack@suse.cz> wrote:
> On Mon 11-03-24 20:01:14, Mateusz Guzik wrote:
>> On 3/11/24, Jan Kara <jack@suse.cz> wrote:
>> > On Mon 11-03-24 11:04:04, syzbot wrote:
>> >> syzbot suspects this issue was fixed by commit:
>> >>
>> >> commit 6f861765464f43a71462d52026fbddfc858239a5
>> >> Author: Jan Kara <jack@suse.cz>
>> >> Date:   Wed Nov 1 17:43:10 2023 +0000
>> >>
>> >>     fs: Block writes to mounted block devices
>> >>
>> >> bisection log:
>> >> https://syzkaller.appspot.com/x/bisect.txt?x=17e3f58e180000
>> >> start commit:   eb3479bc23fa Merge tag 'kbuild-fixes-v6.7' of
>> >> git://git.ke..
>> >> git tree:       upstream
>> >> kernel config:
>> >> https://syzkaller.appspot.com/x/.config?x=bdf178b2f20f99b0
>> >> dashboard link:
>> >> https://syzkaller.appspot.com/bug?extid=6ec38f7a8db3b3fb1002
>> >> syz repro:
>> >> https://syzkaller.appspot.com/x/repro.syz?x=15073fd4e80000
>> >> C reproducer:
>> >> https://syzkaller.appspot.com/x/repro.c?x=17b20b8f680000
>> >>
>> >> If the result looks correct, please mark the issue as fixed by
>> >> replying
>> >> with:
>> >
>> > #syz fix: fs: Block writes to mounted block devices
>> >
>>
>> I don't think that's correct.
>>
>> The bug is ntfs instantiating an inode with bogus type (based on an
>> intentionally corrupted filesystem), violating the api contract with
>> vfs, which in turn results in the warning way later.
>>
>> It may be someone sorted out ntfs doing this in the meantime, I have
>> not checked.
>>
>> With this in mind I don't believe your patch fixed it, at best it
>> happened to neuter the reproducer.
>
> OK, I didn't dig deep into the bug. I've just seen there are no working
> reproducers and given this is ntfs3 which doesn't really have great
> maintenance effort put into it, I've opted for closing the bug. If there's
> a way to tickle the bug without writing to mounted block device, syzbot
> should eventually find it and create a new issue... But if you want to look
> into this feel free to :) Thanks for sharing the info.
>

Maybe I'll get around to future-proofing by adding validation before
the inode escapes the filesystem code, but I'm definitely NOT patching
ntfs. 8->

-- 
Mateusz Guzik <mjguzik gmail.com>
