Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65003FEA
	for <ntfs3@lists.linux.dev>; Sun,  3 Oct 2021 17:50:40 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b20so62059369lfv.3
        for <ntfs3@lists.linux.dev>; Sun, 03 Oct 2021 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2iMRuCjPLsINVQw+OgaPjcThJGWw/f8kcZvZZDA75bY=;
        b=Ti8jNCJp7ftb5ZrVviV6F0dR394sfOd1XZx5L3D1+TNsORPhLlnohkACLN6QDEcqqN
         HjcCqTf880v1TLqU6hh00Dq66wzYD3U2X9qFqG0hwAROrstAglfP/OtRvul76tmepjrx
         F6sceIh0NyBOMwMCnjGrUy/HmhKLCeCFJ6gAuWVobaYJZcOfLIwg6kN0WEESZt/xgzWF
         ub6Tcy+V5ug985Lz4UYzUuWwX98X+8OlgO7wUf/oX/q5QiKvTuOYATkOb9XkPf/4rtO1
         n4lUR6KZRUxx0NZ7zUcmFZzS5oI5B3LwSz5TEO7p3KQf7bcC5rKhsOAEVGqzUQNBBMok
         xlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2iMRuCjPLsINVQw+OgaPjcThJGWw/f8kcZvZZDA75bY=;
        b=njbhNapL3A8yOPKirHzo0me1jpZ4SyApnfwmO2hxV/cqfsoM7ZVvgSMONQOG2Bdcpt
         KMHDFkfDlcbKQOpaH615JotU19Zmf361noOma9migvBJB17LsJE/ONwYy1sgs9hUIPs0
         Tt3VH9HY5SRFIJWXE6A1cX9S9bJccSqoqktJhHE1bMAlkN9U25yr/7mVCgWKmTLNYoOZ
         kK5Va41vGYXRfU0sAaE4ZgYwc/JVyu2nD7HVFODouX4iE2XypPgBOShFWOJlZJwB2KKG
         L0PXa332OT6U8MVssuuq0c66WK0P9Ea9d/NTgBaoLAH1EuiXBXwZq4qWpt3IsGuecp4V
         jm3w==
X-Gm-Message-State: AOAM5301ckGZjn7rJegl1mw0iWWAkxuTlVXMmN6BTKf3OHS3FrHOscGu
	Uv6clbN7YHINGjlR5tWSGEA=
X-Google-Smtp-Source: ABdhPJyjNdjw/hVXJMP3xb/cyret3SIinnQDRSVfmMXQZrNMNEJ4VWnNvnUFjuirBrxoiwgbWVEKaA==
X-Received: by 2002:a05:6512:463:: with SMTP id x3mr9974290lfd.103.1633283438739;
        Sun, 03 Oct 2021 10:50:38 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id b22sm1378191lfv.286.2021.10.03.10.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 10:50:38 -0700 (PDT)
Date: Sun, 3 Oct 2021 20:50:36 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Check for NULL if ATTR_EA_INFO is incorrect
Message-ID: <20211003175036.ly4m3lw2bjoippsh@kari-VirtualBox>
References: <227c13e3-5a22-0cba-41eb-fcaf41940711@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227c13e3-5a22-0cba-41eb-fcaf41940711@paragon-software.com>

On Wed, Sep 29, 2021 at 07:35:43PM +0300, Konstantin Komarov wrote:
> This can be reason for reported panic.
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")

I see that you have include this to devel branch but you did not send V2
[1]. I also included Mohammad Rasim to this thread. Maybe they can test
this patch. Rasim can you test [2] if your problem will be fixed with
this tree. Or just test this patch if you prefer that way.

[1]: github.com/Paragon-Software-Group/linux-ntfs3/commit/35afb70dcfe4eb445060dd955e5b67d962869ce5
[2]: github.com/Paragon-Software-Group/linux-ntfs3/tree/devel

> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/frecord.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 9a53f809576d..007602badd90 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -3080,7 +3080,9 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
>                         const struct EA_INFO *info;
>  
>                         info = resident_data_ex(attr, sizeof(struct EA_INFO));
> -                       dup->ea_size = info->size_pack;
> +                       /* If ATTR_EA_INFO exists 'info' can't be NULL. */
> +                       if (info)
> +                               dup->ea_size = info->size_pack;
>                 }
>         }
>  
> -- 
> 2.33.0
> 
