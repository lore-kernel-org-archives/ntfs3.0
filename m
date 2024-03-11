Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3954BCC
	for <ntfs3@lists.linux.dev>; Mon, 11 Mar 2024 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710183679; cv=none; b=dp4TnHN/AyD95EzuLy7aLoOaj7t22BDFW3kz0AUhrm3jxJ8tCHDRwBZegUaaFfLNlQA+LhqnM/M8xWUgKuSEhgxZhewhvjANIzlU7/nBJHx01UFZQtGjEgvVFtEO+wgjW58WVQlsXppNScnuQm9f0c/gth8Cx+7NM5jwHSpdLuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710183679; c=relaxed/simple;
	bh=ABrnR59EXiIp9yllD51+UosefIdej7Y6MVt+J8pZeT8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A249mVgwy7fIzmaq7TAvsfKysQEaGbMiYm01XroC/RXs6rvAg2pqnT6PxteUsvgXBZdzKS99GpNsVD9bWRDpHdk5OI3/Zn0bjhYVe6bCtIQr8pfHr1F52FCb5aleTTRHFHI2sr1n/zslR0GAtSDdo3Ve2vML2SPf0JvSG+kgRYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC/Yxxcy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC/Yxxcy"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a450bedffdfso619783466b.3
        for <ntfs3@lists.linux.dev>; Mon, 11 Mar 2024 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710183676; x=1710788476; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EuECgiC6YMc7b0Edc0Kt2KDyl4Um6oShzEC+/b9iZLE=;
        b=gC/YxxcysYzwScDPCdd+3g6Gh1Xr+PZIkGvnTGkE6eNu500vO/OqF3yFUeg1kBIS8C
         oSjbGQ/PrzIcaFJK1jkqvqDbWhUS8v6JzRbgEC+E61UE6yqcNMpqSI1ESoZbm7M9n7ol
         4peVU8wStg/WwIWoka+Vh1x50CZL2UUMmUjP3skij5LxrisHMSykCLaDj9PwpgcS4KPN
         +o2A22ABa+sRdX0HmYYnQWUwuxeHWlwB78cJMxCcsENpamGe86hlTFWqUgei4WOmdOdc
         H/1wab8c4Dm3RG8zXFW5lQRSF1fS/jtnuBg+VoIIQhBOtuTWDvUidfj73SXlIWzl2cys
         qzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710183676; x=1710788476;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuECgiC6YMc7b0Edc0Kt2KDyl4Um6oShzEC+/b9iZLE=;
        b=CiYj6l6VcxAQNHX8bwoqOlsaWFzwIzt+UagMT0sM8ICWV/Cp0g4+ra3xBw36v7MygP
         qkDIQ5u+Uaf0NYk8ac+DELMdVnr7+LuYiEpcetidyvnMWuUAGiu5ExUlZbi5N+t5NOAY
         0TcYUxmSa+REZQWIz94CApd8LVwJCjK6JmsIQRHjhl0ADVGLM2FbmAdBpugQ9nsJnTh7
         AQlWvkrKZdCbveAS//o5wssul8fGIXdlXbV96KQk6bRRhSFj5LEOzTn0ghvBkMtYfXAJ
         Xjfb7DjEihN5uC0ikc3shr/9HCaVnxYsn5mszJFghS4IboXknALQJU8GdfXvAi4ogNVt
         zz1A==
X-Forwarded-Encrypted: i=1; AJvYcCXlib705aZ5HzZn+v8krdz9eaovnr1iDe6Aa09GkznLukyyr4caiLcbXUZTt0wmaOHBeSbHdWxsqAkrBxM9IU/z59C2zVs=
X-Gm-Message-State: AOJu0Yws0btImGF2EhPW0kFQEghYH6fJz7tezowuPz4cJRLqYRlD16Nw
	rhqhsn0Zr2A9wzk1fkkgcclsr4zRqJwYcMTSABoFiq6QT8oXCXgDdAAID0wm7znHVVuGjGl9D6p
	gQegXmaVOzsNp4BYF9w6mogPdyWQ=
X-Google-Smtp-Source: AGHT+IHJ0O15Wf5Z2bUjYqjgmX08pg1z5eDQTDE216uygC9BNgkF8rcTIvSKcoh4XNj8NWUD8NKETARv77vkcti1LEc=
X-Received: by 2002:a17:906:52ca:b0:a43:6146:a4df with SMTP id
 w10-20020a17090652ca00b00a436146a4dfmr4237847ejn.21.1710183675559; Mon, 11
 Mar 2024 12:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6f02:f0d:b0:65:b649:35ec with HTTP; Mon, 11 Mar 2024
 12:01:14 -0700 (PDT)
In-Reply-To: <20240311184800.d7nuzahhz36rlxpg@quack3>
References: <000000000000c74d44060334d476@google.com> <000000000000f67b790613665d7a@google.com>
 <20240311184800.d7nuzahhz36rlxpg@quack3>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 11 Mar 2024 20:01:14 +0100
Message-ID: <CAGudoHGAzNkbgUsJwvTnmO2X5crtLfO47aaVmEMwZ=G2wWTQqA@mail.gmail.com>
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

On 3/11/24, Jan Kara <jack@suse.cz> wrote:
> On Mon 11-03-24 11:04:04, syzbot wrote:
>> syzbot suspects this issue was fixed by commit:
>>
>> commit 6f861765464f43a71462d52026fbddfc858239a5
>> Author: Jan Kara <jack@suse.cz>
>> Date:   Wed Nov 1 17:43:10 2023 +0000
>>
>>     fs: Block writes to mounted block devices
>>
>> bisection log:
>> https://syzkaller.appspot.com/x/bisect.txt?x=17e3f58e180000
>> start commit:   eb3479bc23fa Merge tag 'kbuild-fixes-v6.7' of
>> git://git.ke..
>> git tree:       upstream
>> kernel config:
>> https://syzkaller.appspot.com/x/.config?x=bdf178b2f20f99b0
>> dashboard link:
>> https://syzkaller.appspot.com/bug?extid=6ec38f7a8db3b3fb1002
>> syz repro:
>> https://syzkaller.appspot.com/x/repro.syz?x=15073fd4e80000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b20b8f680000
>>
>> If the result looks correct, please mark the issue as fixed by replying
>> with:
>
> #syz fix: fs: Block writes to mounted block devices
>

I don't think that's correct.

The bug is ntfs instantiating an inode with bogus type (based on an
intentionally corrupted filesystem), violating the api contract with
vfs, which in turn results in the warning way later.

It may be someone sorted out ntfs doing this in the meantime, I have
not checked.

With this in mind I don't believe your patch fixed it, at best it
happened to neuter the reproducer.

vfs could definitely be patched to catch this when I_NEW is getting
cleared (only when  running with debug), not in the spot which
generates the warn.

-- 
Mateusz Guzik <mjguzik gmail.com>
