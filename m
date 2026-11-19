Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117028;
	b=M9asrrTnadSR8chBEV8H3TLkPs4LN49TUoC2aygrhzHVK4Lx8wo6eIqWcnXSRGDTSJ6t
	 M7EaRVQDrvezFPyY85S0xhHeGPSXBwLDtxNBqVpcLKZSCz0eN5gWmaOpQXeH3ZLQNAx+/
	 MbQwkAs9/+YWVXJlSxrZHj1m3yyoA4wnaDG0t3uXTyryALU+RVXu6wccu3HpYnXKUDjRR
	 LUUjN/9vtJTup+Gh2A2FQX704HEAym5Td/KUmPKKNYYGqbrjTdjqHhg/iSV3t88Hd8Dow
	 3r1leR4sQfZPLakuHSoXLHF7r43kJlBO1uyrSGryzBYBc03Q9godjp0j+M9d9yBKQQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
	b=f3uwOnru3+Es6cUZo2yI88axsdPLkc07vShULn5B0lk/iBtIQa7ka+ijkgexvljGctwe
	 ro+2ABWe9QhGYhFsGw6sapK/vqER9+fUEUjy5hpnH1bKUK4lEDaswBPAAQZH0t0ZSF9ki
	 gBJml24iFrtLnGxIFcckJk+KT4ft+51VOzzFXXp94iJ/5tS1BC3mQqgnyB3ZdDjYyLsKS
	 lWxvIaa3ozUrtVQ1gzGqH2dMsgUqKxYdmn4vx3jXi+B66TY4NqWvv6TftTtFvUuZ5KJPC
	 VZ6lQ/952N3d82XvF836lKNbYNyeNisJcoJFp8+O10DlXkpFYwFwgCr8+dBWQoNPZDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2Nrodnt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4944260A260E
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4944260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2Nrodnt
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso129239a12.1
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 11:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795117025; cv=none;
        d=google.com; s=arc-20260327;
        b=YawFvvAWkRUwtoNzEHvX0n/nRe2HCxhCxwFH1ktMVL+DmdQHQ74CjIvzVJGZ6AZYGO
         PBWXkDqFjGfToSwQRT3yFOCZl33pFd8NduBoMCL+qUIvicSZ2Qq8Gl+cHyUVN/h4BCIt
         5rEuLAuC/Sxw9O6JuobxULewm5CSBTPM74mh+HErHJL9NYiN8/2g2G600UHhd3w7x6HP
         Hlk+fLNOrsUdQMsWBxbuFEs/lQ5AWvsp/npSayY/fQuAIRG6ReQs5VuTo+6kop2jX+GN
         0+So4pAh1m7pixhVAOoGL/eav0McAEpGlbMg1jYPNSh6cS8ZC3Dryf82O8d6CcWD/RIj
         Z+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        fh=ji5sCZdbU2FLOiJWjzSJOjixIoedY/0xeq2DcAEDvio=;
        b=O4am0RPV3kmUYmH0rQzWkc3Z09xKRoeqKBdDnT/6UBt98xSku/pCJF55E5cpS66Bx3
         eMMoumHovlUKVNrkL5X8oQdgQ3WYabJJSOHCe/b3aO7vIgrIwZMmp6/nVsKA6xUk8pk6
         4LBPlNlYb1eVAvXsIoQh7WCUht7yOVegsRL8BTATZrH5CFD1UmjPYvNdiiGxyxN2Onku
         NQrrnweNZR9PDP911QQ4jTj+XpEO/753a9iglYdo65PtuVJk1j7JVvlrwfH62CdrmK8i
         Y9tZQZ/NFZRLU75L14Xnkbq7jHqhUdeuPr55lBYYTgJTM9jzDVuaCZDXOukCwautHN+R
         QjfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117025; x=1795721825; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        b=p2NrodntuWOa6cTexK9iPoH7+c8YHfxRLIy+Fni/wdurlmqI/laSifo7cW5cJ4kz/Y
         2pRKsDOu/WYaMjNJh3splHLFKTYk+nU5Xemja7sNoi3Z/N9gxZBFzkFk/Udj7vHJxHTg
         ErpCaJn8uyuWhwOuL/6a0aTI5YP0det0A9Lgyb2Ig7NQUPTUeKccyUKQ5Vyn6SH6FCaz
         oDJfGYOmvv6pbhWatpQgX1ntNJeKwX4kpXrlbwTSULjKtRk74aaIVDPYHO68vFQrIhMj
         CWVdYpRCSadufxWeZU3DZNb4R0aUF5mmLwlBA7ZKhoV13GUaIij9fN5SdHBJCXTG4lSJ
         ZpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117025; x=1795721825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        b=QTpnyX09goBCpRgKx6FZyiY4H5mG7JvH3bVL49uJpxUlzi/s4gsD4COkl59NidWU99
         +jX7zyNie9PEyDKKJ1nEhy/OrCnmyI/kQQjNVeigb39VNSp8NEULWfG1NL2Qw2wabMl6
         PJdB0E1AuZ+6idX6VxJ59s0sf7IXtqbePFXLHV0R4s7Awguwbn761LQrRjNfENWAjvmr
         gEREb5J9oKgj8CEi0nSbMjvkkVpduVSKzPiim07m3INRxQI86xqxy/GYRJETI5uPi361
         VuHkI0yZcNyyJTBOj0DoQvrmGIcPssyJn0N3xq/HYOpO5+D+wfRMwOKaXDkzA4uwq5et
         bR4A==
X-Forwarded-Encrypted: i=1; AL+hErFxGxuLhgnY8pz0rTvir9l50mhrDk9oQC73UrLayP7Aty1w9G/nnu4EbwgOzn2Acf/UVoipAg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/MDkP3UVErtR75BjcfJakgg9jpag3C7/kopNjm/bpF8R5LlsOj
	Eo4phx1dgxPN+Ig675rxEp8TgRN5oA2NJXaYqHak17HH++uz0EiTBzxshByW3nd91+F0ISsQsYl
	GRHziqDnYVHu55x0tfL/D+qmN1ytlqoc=
X-Gm-Gg: AYBFou1Uz7aY0GzWfZ6VkjKf7bM+tL2UGIJcKkDjx+yBTkQEnZPJv9zunubP60FfXpp
	/F10sVCMz3LvKH4SnwhvhrN8avnAtTOytnoob1o52ha6rRsQiufn6OnR5B9CQeM4j2x/8qs3K2c
	oH28l0JxPPvssxpchPXDIrWBHg4FUJ7fxnBDmtoPAiREkc4vNv7X9zBTIrY8Kr3d+nSWx5IyaNw
	p5UbogOS7UplKxYR54CRbYETZxLQWSc2kzWxXqdkrvfHaW9SbjOzWkIXyW7B+GDWy+vt6fRuu/p
	aj4mdNNr/OaTFJ60OHKmdTGkvm5eIiVylX9aOm0Uf/Gg45rc+ilc+Ml8/mSyvyBTpCfz/5WtKaC
	e1MXFQ0dc5M6Q69tT+beJPkJuD2dLVIYgNBCBEPS90uCx6MW2BDg71bICzF3AyF3sy6nwLBM=
X-Received: by 2002:a05:6402:897:b0:6b8:8328:8e66 with SMTP id
 4fb4d7f45d1cf-6ba37d62a2dmr239724a12.7.1795117025446; Thu, 19 Nov 2026
 11:37:05 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-3-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-3-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 20:36:52 +0100
X-Gm-Features: AclHuK-9kUyGBTzq0h8pZyp8mMZSXIXsu9pOi4Bu2Y5vLjqBJOsUk2EoN70jtkI
Message-ID: <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Add fileattr_has_fsx_mask() as a helper to let filesystems check for
> unsupported xflags while allowing supported ones. Can be used in the
> same way as fileattr_has_fsx().
>
> Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  include/linux/fileattr.h | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 42b92ccdc583..ba7ed3b387d8 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, =
struct fsxattr __user *ufa
>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
>
> +/**
> + * fileattr_has_fsx_mask - check for extended flags/attributes
> + * @fa:                                fileattr pointer
> + * @allowed_xflags_mask:       additional xflags permitted
> + *
> + * Return: true if any attributes are present that are not represented i=
n
> + * ->flags or @allowed_xflags_mask.
> + */
> +static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
> +                                        u32 allowed_xflags_mask)
> +{
> +       return fa->fsx_valid &&
> +               ((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_mas=
k)) ||
> +                fa->fsx_extsize !=3D 0 || fa->fsx_projid !=3D 0 ||
> +                fa->fsx_cowextsize !=3D 0);
> +}
> +

Every patch in your series did:

       if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
               return -EOPNOTSUPP;

       if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
               return -EOPNOTSUPP;

It looks like this helper is not as helpful as it could have been
and you have raised this question yourself in the cover letter.

Effectively every filesystem that supports fileattr_set() already has
a defined SUPPORTED mask, so I think it's better to do the negated
something like:

static inline bool fileattr_supported_fsx_mask(const struct file_kattr *fa,
                                               u32 supported)
{
        if (!fa->fsx_valid)
                return true;
        if ((fa->fsx_xflags | fa->fsx_xflags_mask) & ~supported)
                return false;
        if (fa->fsx_extsize &&
            !(supported & (FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT)))
                return false;
        if (fa->fsx_cowextsize && !(supported & FS_XFLAG_COWEXTSIZE))
                return false;
        if (fa->fsx_projid && !(supported & FS_XFLAG_PROJID))
                return false;
        return true;
}


...

       if (!fileattr_supported_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
               return -EOPNOTSUPP;


>  /**
>   * fileattr_has_fsx - check for extended flags/attributes
>   * @fa:                fileattr pointer
> @@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 fla=
gs);
>   */
>  static inline bool fileattr_has_fsx(const struct file_kattr *fa)
>  {
> -       return fa->fsx_valid &&
> -               ((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize !=
=3D 0 ||
> -                fa->fsx_projid !=3D 0 || fa->fsx_cowextsize !=3D 0);
> +       return fileattr_has_fsx_mask(fa, 0);

            return !fileattr_supported_fsx_mask(fa, FS_XFLAG_COMMON);

I hope I got this right.

Thanks,
Amir.
