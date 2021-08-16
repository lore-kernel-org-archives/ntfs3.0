Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB172FAD
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 21:56:26 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id t9so37344303lfc.6
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 14:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INSZ2rU66F9gi18DmsqmtRCqv+cghRc4CXBXIsZask4=;
        b=Gn5ex9v2S3646sbEM7aF/fOdxwaguZ+V2nQywtRGmVOVYZ6c3qlRDJM71uKO1vTJPu
         y81B09nw2MadMAyYgGWfSLkPbO41LlZageOeRmQHRzelWUqXRnFiNTiqTZpvbWtDnnKC
         +6qNvDBu8iOhWleTkRlEo/hGpBwMvF+dCuMWUgxnfbtq6kjs5q7L4ZQjWXyZ02ti+pJi
         rzEdTzJRp4V49opprFPfO4jxIgdY1KUN8Y4uqTlgWgHo67TSorkxSEbI4Kv5YpSPjo1P
         exFa5ieZJ1NVEuAKz+rbbXPDNZOeGMGmnkzx/l9TA8hw9XAVH10hpZzL0xSGHTAQWYs0
         NzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INSZ2rU66F9gi18DmsqmtRCqv+cghRc4CXBXIsZask4=;
        b=Ir0nWsxpKZz4D5Ryd1Ktgq194ZlUWU7n5q6Sc+6RbSzOO/sl87bdDqOsK2NhU2xOhS
         ZcBik+7juR3F0C7UvTFvtHfOlrdbhGGCiUMVgPyPNiGB7vJkI6hcNClZrttzbDEkW++Z
         AWBh4gZSWBzxP/++MnG9IQNr78Hpkh0WNvRSE0gGDfKcnQBEUOe1heFkswdwRAU5HDtD
         9F2Y/1NnjTK5CFd1KehByNO0hbuzZt1B2IG1x1o3Y/6Tb+V/C+cdeeE7TFzguSFY9x2/
         /JJZT8udscs/DVkLhpNkqUvb3tU4xgdgAay2jpwmn0olfgnfklKELxPd8xsNefYeoFO8
         5AIw==
X-Gm-Message-State: AOAM530teREE3EWKL543ZeemCVtCWB1UZyNQsOWzDj9FEz8zll7nsy/Q
	aKmUkVaji+GH9VF0tREIAt4Sag91GILHUDMrqcqOCQ==
X-Google-Smtp-Source: ABdhPJzax+5D3ev/waix9QN4hf331/mD4fvHlfJ0jMfZ79tDnytRVRhhw+Fw+KUFwyaiHrUKp27ZQVd3RERUOJg1n7c=
X-Received: by 2002:a19:7603:: with SMTP id c3mr310360lff.543.1629150983095;
 Mon, 16 Aug 2021 14:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210816193041.1164125-1-nathan@kernel.org>
In-Reply-To: <20210816193041.1164125-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Aug 2021 14:56:11 -0700
Message-ID: <CAKwvOdnKnBPhvVM3CAf7im3TS5eSV+myQqd_X9oUN74o3NOu7Q@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: Remove unused variable cnt in ntfs_security_init()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 16, 2021 at 12:30 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> fs/ntfs3/fsntfs.c:1874:9: warning: variable 'cnt' set but not used
> [-Wunused-but-set-variable]
>         size_t cnt, off;
>                ^
> 1 warning generated.
>
> It is indeed unused so remove it.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")

I went back to the original patches to see if this was ever used;
since v2 (when the ntfs3 driver was split up) it was not. I triple
checked the v1 as well.
v2: https://lore.kernel.org/lkml/caddbe41eaef4622aab8bac24934eed1@paragon-software.com/
v1: https://dl.paragon-software.com/ntfs3/ntfs3.patch
I don't think there's a logic error here.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  fs/ntfs3/fsntfs.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 92140050fb6c..c6599c514acf 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -1871,7 +1871,7 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>         struct ATTRIB *attr;
>         struct ATTR_LIST_ENTRY *le;
>         u64 sds_size;
> -       size_t cnt, off;
> +       size_t off;
>         struct NTFS_DE *ne;
>         struct NTFS_DE_SII *sii_e;
>         struct ntfs_fnd *fnd_sii = NULL;
> @@ -1946,7 +1946,6 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>         sbi->security.next_off =
>                 Quad2Align(sds_size - SecurityDescriptorsBlockSize);
>
> -       cnt = 0;
>         off = 0;
>         ne = NULL;
>
> @@ -1964,8 +1963,6 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>                 next_id = le32_to_cpu(sii_e->sec_id) + 1;
>                 if (next_id >= sbi->security.next_id)
>                         sbi->security.next_id = next_id;
> -
> -               cnt += 1;
>         }
>
>         sbi->security.ni = ni;
>
> base-commit: 96b18047a7172037ff4206720f4e889670030b41
> --
> 2.33.0.rc2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210816193041.1164125-1-nathan%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
