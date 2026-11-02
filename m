Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628048;
	b=1YYzStY/eR+/s+/IMHs4vlgxJzLjlD4o3CCkOQBcNa0tPUOzGuHPwRXU/UOWO6WIRtMh
	 kh2H67tTP3pceQjuNJPK04+KMAj7Lhlff4Yli7vcIJ4B0jFyvToIFI1JyVwy5CQOb6/JO
	 puBjTfijEP2Dbv9jEs0myFF/NFivNyUbHh+LsQB4MWUMvVb1Wd9pltbwf2hq9CDgaM6g9
	 SLLmGXN5ipvWD/BzCZ3jOi+7lEZH4DNCTzkGXtSNbr1Q6yTGF3ydHhk+yrcMFOL6NpfRz
	 2V11SD3aj26Kw8Qg9HyzVEPQw+a3B5Evx1bI20Z2RI+j9YkKzG4EqRlEdiCZCxJahfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
	b=jeOvB8u/bxaFylLkkjOTkWBoeCSSiGnPn48ODKSDPiv4Jm6CUIkA7+aO+wGSv8x0IhGr
	 aCneUPgVmdCWmjguQaECpF4AWxb6C2xSOznBQ1xWRC5MGRxKIrGzR//ebdluXfdPYxkR1
	 m1+Xx7si5/VmX5lpjMsko34SCh+6JMy/FHQQT98sxUNNmVNv7lPAzCeD06FceU3lppisK
	 RE5Xq3Dze873KlrpYKxUzU6jU2kTamyGSMsP1Old2cAsFXFXtVy4/oA3tCl20p+GolH8+
	 2T/IBsrvjUFN3YDZzwP2dEgaSRegCYFkax10ttz7SbO5jWKWzC8sDpMG2/fdDvRgMFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628C960A2636
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 14:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628C960A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so488624966b.3
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 06:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628042; cv=none;
        d=google.com; s=arc-20260327;
        b=NqB3C7HhaKRUMy8itz+p8KJOl4ijn4+I5C2/H5HsH/T+cO14beB5R9TaKic3oWA6eq
         9lO3tGmqh4IosoOZ/vcw8qxUQYWjUv4TN/Ury4udr8efh0S5QBwUtwubRtHsu9+5cGHf
         bD+k61d1AKY6gA17pSSfYPVnrDWi/ywu5KCS8oujrhKpK084g3WV63cLMhdXPnQdtkcZ
         Kxo4hffYlLpPEmIFeRMVegvti6v7mFmrSgi0skpl7PGTaitwYblhJGiAKdCh2XdH/XQI
         mee8NjmtM29jmQC2kPCXxpVyhlb+PEQBRmgLQlO9McXfLmceeNfirU9WYm9z0FNoRkmb
         ITzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        fh=mD4nLcBRhtxdPBFNGrhgjgefp4jypUnFYyFwPsNDDvU=;
        b=oIuMiC6ojLnZZ0DBy2OMmSe44pb1ZVr7HSXQz3TLNBDJ5pzga5ktIJybmp78wNYLpP
         vpaaj6wPd8nTA/qPzEukTdTLZVx9kTk8m98SyqjLYrCSP/IU/PMSw8OGsLQPiIegrRrF
         FteOUBrVzUdIWbOjPRnH9o6FAVc1PJ3m1XqECpR6vSV16Z0Nuvw0D9a7lp1g0OYzVoGE
         7dFAAl8oC5Nn10TonAFsI3ANOcYxm8hzTdMFJlKY6lO1Lv9OKPmo/rwdn3qZnwW9Sbdh
         anH1cV52/xMQrgy4KpkUKdqq4AydThPzx0r/D3ZjKSlU4BreXI5E9YOCXDo1kkFXHYtj
         yRfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628042; x=1794232842; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        b=cHgSMpBwtlzDeUSJVncSojDt4Z8dPmCcpdxzKZY6Zej1HDqFJ0f/XC540nCsl+dXIH
         V4vgS5ZPpp9zfRnZvV9SYEFtLnFFmMB4sNpOaTLXMJaamAwRIMHbC0twOW4hB+AZfiRU
         D5wOmWFcJ3mwZkYoVcL9Ig59H6YS7jO2FUIExUL3LGtFmVj92uIeyNDgXlKw4gPKdra4
         ukWOIJr14HWFkk868QdHgXwk63nUp7UNrthE2UKeDGMdzwsz2pO8MxlP9A42R1qNyNkZ
         ayBpAysuseDSjoza67frjoJZfsRcpURrmD/MosUI0Sn1dGiQaYYkVw5hPpSocpWdXjMg
         2azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628042; x=1794232842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        b=Rfv+nhACjYnde7ODSijqFS6kGe3oXnwyTIAB5LBHPtyAUAGt+K7Tb/TG9A1Uye4KUG
         C8LFP85JXrsSI6Re1VDu2jP1yohASpZfaFan/AnFj9e9PECWT6unxEdbMnuvNJw4cjIp
         V0xAcPfVgEdqXyoRKY6LV95PZyeZ/dp85jpoRDHDRgPbdgYYbHluFrR7o3i6ZBBcVOxh
         clrM3Aey2Sg2JMHiDSH6YzKJ6g+FoQnM/5QN7KCasT71ynFcRyOFC/mTGZNLdu0kQmMl
         Xfx3XkNZ2Ks99RFXDM9Yya3Zj8kfdF8FZNORdrRFdJfIPyfYX1vgiS69oXvZM4rM3fF8
         lf8A==
X-Forwarded-Encrypted: i=1; AKwUvBy559PALxxMPXWs7lXPpmSi79h1gjjiw9e2h57c2q2yzG33UstMv2fECt6z9lc6bVpL5jatTQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+IoHI16bD/rKf55DjUkTh3vuEChVVCdg+oXOJhsZ57Ff0/IkDS
	lq7QqidxJgisPcj7Mpan5I3h97R8iD/xZK3zPixtn19RuK9xxoq66p4HMws92VfNn4ZFQhNMKB7
	GL9+1tWxCztJiOoawfHL+nfHHVSfjwBw=
X-Gm-Gg: AYBFou04FqNzfdUF7qQZHh0ZquwXHPJgu9evdDkbKhR24pySmF/1tYbDSa7Hc/6yaRK
	j3l9zgMb9FoKmfYITeqB0xgEa01OpXxmiYPmz7USHsFUbkk7vxb4fvUs631YKBiTena5XLg6dAM
	A7eratL58jQPZkS+Os1N8kvMdOkDQGf5HYaC8wOBRhhQLvhYg8ciksxvim7qtlaBCI3DoVBn3rs
	dh+J5tgyMKe2k0xNBlAJ3JzPN5jp/y2oFuaPMGmCR3DcNWw3LN8+oBWiSia3akoxLbfEfRuZBqE
	RQW8DsDvEVCF8LLFg9qJes9rgV3sC9IqhZ8C5j4ewpiHhDVsw2BejhQZNkhRTN42RD6r7+IoVeX
	f0ECO147749cnrHrdI4//4T6GYxsQyUyI1HIGCqcOn8r+8GunTIu07vbjlJeqx+pqqlp4Sw==
X-Received: by 2002:a17:906:9f87:b0:c33:9fab:5f61 with SMTP id
 a640c23a62f3a-c4ca7a80dfcmr888696766b.29.1793628041476; Mon, 02 Nov 2026
 06:00:41 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-2-koray.fra@gmail.com>
In-Reply-To: <20261101015551.786044-2-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 15:00:29 +0100
X-Gm-Features: AclHuK8C6KXo0yGTK4G9AdpXOF6ch7dlD0GPHOdparCBMVqSIwGLvVGFGi1BG64
Message-ID: <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> wro=
te:
>
> Add provenance time (ptime), indicating the time when a file or
> directory was created. This is user-settable via file_setattr() and
> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>
> The semantics of when to preserve this new timestamp are the same as
> mtime, the idea being that there is a correspondence like this:
>
> ctime <-> btime
> mtime <-> ptime
>
> so every operation (copying, moving, ...) that currently preserves mtime
> should also preserve ptime.
>
> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
> allow ptime to be used with the file_setattr()/file_getattr() syscalls.
>
> [ This is a re-implementation of the initial patch[1] by Sean Smith
>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
>   utimensat() ]
>
> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmai=
l.com
> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>  fs/stat.c                 |  2 ++
>  include/linux/fileattr.h  |  5 +++++
>  include/linux/stat.h      |  1 +
>  include/uapi/linux/fs.h   |  8 +++++++-
>  include/uapi/linux/stat.h |  7 ++++++-
>  6 files changed, 52 insertions(+), 4 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 833e03810b24..c0645cb22bf3 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>                                   struct file_attr *fattr)
>  {
> -       __u32 mask =3D FS_XFLAGS_MASK;
> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>
>         memset(fattr, 0, sizeof(struct file_attr));
>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_k=
attr *fa,
>         fattr->fa_nextents =3D fa->fsx_nextents;
>         fattr->fa_projid =3D fa->fsx_projid;
>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>  }
>
>  /**
> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>                                  struct file_kattr *fa)
>  {
> -       __u64 mask =3D FS_XFLAGS_MASK;
> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;

That is not the correct way to extend this API.
This fixed mask was added as a placeholder for
"We intend to add support for more xflags to selective filesystems":
https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il@gma=
il.com/

Please see this POC patch for filesystems to publish their supported
xflags mask:
https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il@gma=
il.com/

This will allow callers of file_getattr() to know if the filesystem
supports ptime
without trying to set it and failing.

Thanks,
Amir.
