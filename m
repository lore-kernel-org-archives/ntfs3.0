Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1D32C61
	for <ntfs3@lists.linux.dev>; Thu,  7 Dec 2023 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5d400779f16so3520007b3.0
        for <ntfs3@lists.linux.dev>; Thu, 07 Dec 2023 01:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701941525; x=1702546325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HITPOZ98TcxoeIJZrNjSo/OvrhbnTbF7gIrbNDfuq4=;
        b=Dkfrgcc30lkBUXLRVctcI5ktG2kh2HtIOawqxJsrISMgjxufgbRC6065SUrwFvH6t9
         INLF41pp2XWI38B1lKuRmcSaUok7TFcRMzZ8Wp59dQj2qkkaMVTQ7MurCoUbrCTSTwr3
         GcdbeipY1eMTzJ2XvOUIruENIJcJm/CzV0lC5kcCT4/QblAPOlsgagoV7lpwBaltrWXD
         MJWc8IWBmdF504qlbUzUvKmJ63btIgGOuzXnNOXSTjxJBLh9Gu+97zmMcvjBNiv/OvqN
         9J7HRoQxZmDxbV0GXtU/+wQViaNIZ9vCi8wkNbkMvM8bcMX4uCN0W/P08x9FlmlccFzE
         BO3A==
X-Gm-Message-State: AOJu0Yw0A+W318PRezSYT7GeEfRN6tiX3e0TQcnxSNH58hymDE6j8ndG
	Nso/EjVzr/8cJOn6PpRFcJo58NgmQsFkzpor
X-Google-Smtp-Source: AGHT+IGJ6mxwvInuGRXGgjczUh9DAPD/jQJanH3a1/zo1BRI7yJ6H1d8LOQYKOy4aKCcKZ2BmsQTWg==
X-Received: by 2002:a81:ad49:0:b0:5d7:e2b8:bcca with SMTP id l9-20020a81ad49000000b005d7e2b8bccamr1912985ywk.18.1701941525270;
        Thu, 07 Dec 2023 01:32:05 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id a2-20020a0df102000000b005c5c3bae1dfsm274707ywf.54.2023.12.07.01.32.04
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 01:32:04 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5d400779f16so3519887b3.0
        for <ntfs3@lists.linux.dev>; Thu, 07 Dec 2023 01:32:04 -0800 (PST)
X-Received: by 2002:a81:84c3:0:b0:5d6:bc5c:9770 with SMTP id
 u186-20020a8184c3000000b005d6bc5c9770mr3593778ywf.4.1701941524678; Thu, 07
 Dec 2023 01:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00fd1558-fda5-421b-be43-7de69e32cb4e@paragon-software.com> <61494224-68a8-431b-ba76-46b4812c241c@paragon-software.com>
In-Reply-To: <61494224-68a8-431b-ba76-46b4812c241c@paragon-software.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Dec 2023 10:31:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVu1xAHDo1UUsCKEX=pbiZWab0HwkO6hObwE6uB2yD4RQ@mail.gmail.com>
Message-ID: <CAMuHMdVu1xAHDo1UUsCKEX=pbiZWab0HwkO6hObwE6uB2yD4RQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] fs/ntfs3: Fix detected field-spanning write (size
 8) of single field "le->name"
To: Konstantin Komarovc <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Wed, Dec 6, 2023 at 4:12=E2=80=AFPM Konstantin Komarovc
<almaz.alexandrovich@paragon-software.com> wrote:
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.c=
om>

Thanks for your patch, which is now commit d155617006ebc172 ("fs/ntfs3:
Fix detected field-spanning write (size 8) of single field "le->name"")
in next-20231207.

> --- a/fs/ntfs3/ntfs.h
> +++ b/fs/ntfs3/ntfs.h
> @@ -523,7 +523,7 @@ struct ATTR_LIST_ENTRY {
>       __le64 vcn;        // 0x08: Starting VCN of this attribute.
>       struct MFT_REF ref;    // 0x10: MFT record number with attribute.
>       __le16 id;        // 0x18: struct ATTRIB ID.
> -    __le16 name[3];        // 0x1A: Just to align. To get real name can
> use bNameOffset.
> +    __le16 name[];        // 0x1A: Just to align. To get real name can
> use name_off.

noreply@ellerman.id.au reports for all m68k configs[1]:

include/linux/build_bug.h:78:41: error: static assertion failed:
"sizeof(struct ATTR_LIST_ENTRY) =3D=3D 0x20"

>
>   }; // sizeof(0x20)

Indeed, we now have a hole of 4 bytes at the end of the structure,
which shrinks the size of the structure on all architectures where
alignof(u64) < sizeof(u64).

So either the patch should be reverted, or explicit padding should
be added.  Your patch description is not very descriptive, so I
don't know which is the correct solution.

[1] http://kisskb.ellerman.id.au/kisskb/head/8e00ce02066e8f6f1ad5eab49a2ede=
7bf7a5ef64

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
