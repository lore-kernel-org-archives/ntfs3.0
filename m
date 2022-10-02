Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30627B
	for <ntfs3@lists.linux.dev>; Sun,  2 Oct 2022 16:04:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f11so10951569wrm.6
        for <ntfs3@lists.linux.dev>; Sun, 02 Oct 2022 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date;
        bh=UMAeiMssM3GbzixmstMNowGdBxo669SztuRbBSKh5Tw=;
        b=Lj2eZZ5IoNa9y3cEVaASZks5+6qlHFu+GuVER2W0sSmxlza7+iOXfPbvYMLb+sFTEm
         MqeWU4KM0KsZ1waah43G/Wwi/94s/4TN0Pq6YDhXyOL8RY/XXmRXA5XFX54sbd9bHgRb
         SE7K9NqehtP9+gyRgH+5kkgVQsf5Kl13xFkkUYw0wiqvRxlIBiTOYVXT6q/XSB39Ivkm
         ryALJPTy1X+9o+fQeoa/ANW1fvulvgewK+3ZFren4vnj2Env6rRvLZm5ZncegcIuZitN
         FEWDnTc4BWKjYA4KkNveBlptudLsLFrjVxQCA9v/m/jZO5YW3xa/78R+9z7JGQkK0DLh
         64Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=UMAeiMssM3GbzixmstMNowGdBxo669SztuRbBSKh5Tw=;
        b=d6WjkfBkDlOLee4uHZRQwrsqFpkdZbvyYIhpqE5KruXHmFZFF1A05Is9qRy+tG67Lm
         y4pddviqh5DOrbakjI0y/g7ToBcIQrvfpghi01vuuv4wLIyOOEo3O/PnQIXe+MVjp7Kp
         jyUKta4NaIiTXgTeaIBdBh90dfb1NjfGN/crQnKTIEwQfVfKA8xuGipWFOPCspMRjeVL
         42BTBF8ug0F8g+6GGAaH1pHDhp055Xi8JQF5NB7WwrRzkrAd5K9uzk37V1EvWl42wW7l
         32PlUqMWx7yFiU3xGwqV4Zcq+GWUKmphLZNtNcktFV/yRdriR1iZ/X+5m52UHUooyLuP
         o/eQ==
X-Gm-Message-State: ACrzQf09H4HeYjRiA4H/L5vPKsUG2N6ffOcAJ8I7qtd0NgPis6eDe9jT
	oLCAB+Ae6+EnYzqZ9bpOl+U=
X-Google-Smtp-Source: AMsMyM5Im6CBn9ufas8OM4F4thQer2205r92njMFuCftFVHIqg8gWtTMQaUxwDUlAp1+OnIZbw9Y/g==
X-Received: by 2002:a5d:65c2:0:b0:228:68b7:e7b2 with SMTP id e2-20020a5d65c2000000b0022868b7e7b2mr10675117wrw.440.1664726686872;
        Sun, 02 Oct 2022 09:04:46 -0700 (PDT)
Received: from rivendell (static.167.156.21.65.clients.your-server.de. [65.21.156.167])
        by smtp.gmail.com with ESMTPSA id n31-20020a05600c501f00b003a844885f88sm9048114wmr.22.2022.10.02.09.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 09:04:46 -0700 (PDT)
Date: Sun, 2 Oct 2022 18:04:45 +0200 (CEST)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
    syzbot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>, 
    syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev, 
    Kari Argillander <kari.argillander@gmail.com>
Subject: Re: [syzbot] WARNING in wnd_init
In-Reply-To: <771ac308-6a55-77b4-8335-b68cde369aae@I-love.SAKURA.ne.jp>
Message-ID: <d4dd5bd0-9f9c-a132-342f-c5a3b000c19f@gmail.com>
References: <000000000000c2333105e9cc7b1c@google.com> <771ac308-6a55-77b4-8335-b68cde369aae@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hello all!

Is this the expected fix for the issue?
Shouldn't the value be sanitized somehow?
This is intended to be an "honest" question - I am not an experienced kernel nor filesystem programmer, just wondering...

Enrico


On Sun, 2 Oct 2022, Tetsuo Handa wrote:

> Date: Sun, 2 Oct 2022 16:37:34
> From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Cc: syzbot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>,
>     syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev,
>     Kari Argillander <kari.argillander@gmail.com>
> Subject: Re: [syzbot] WARNING in wnd_init
> 
> syzbot is reporting too large allocation at wnd_init() [1], for a crafted
> filesystem can become wnd->nwnd close to UINT_MAX. Add __GFP_NOWARN in
> order to avoid too large allocation warning, than exhausting memory by
> using kvcalloc().
>
> Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963 [1]
> Reported-by: syzot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> fs/ntfs3/bitmap.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index 5d44ceac855b..90f3c4e84856 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -661,7 +661,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
> 	if (!wnd->bits_last)
> 		wnd->bits_last = wbits;
>
> -	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS);
> +	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS | __GFP_NOWARN);
> 	if (!wnd->free_bits)
> 		return -ENOMEM;
>
> -- 
> 2.34.1
>
>
>
