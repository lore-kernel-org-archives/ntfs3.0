Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837181;
	b=lD3ZG+OrXwPxjM/VN7QZn7SmOyHZhyhVexVq6oP0w28TkGwFaVlUDa4rW2COAcKgc+o9
	 5i0jEwohG2GWHm970vxKJcNF7Z5i8Hi1ptVlIK6xYZKom94IRTZ4Tcz8oToQKTSXEX/dZ
	 4++V6JodNZeaFzsVtGftSRxGS+K7ezaSUVVGWW5JzDriZPkglNQzFAnLxhhXxnCKXGBwV
	 4zFLP3kkYvCdn2AC1h88k1k+z8bGwsADh8nJWFeollxPCy1kdQg9cCGUtHZJ1ryP4mQtE
	 293OPUXJHzL6AwlQwdAc9f3X031lk7i7BZrkjQOishLKvAVVad9ovwDCSIlYyLhj1Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yjMfJPlhmwgFldHvOAN6a+VpaF8LquFmHlpLZaL46tQ=;
	b=jNKX+S/87UCobvR1YTTDLBwEideXF0qDPiamF9fCvuZVPDlcEtvYXU/CZzDH0fTrHCQa
	 fDf4xpr7/tMF9N0AzC+rjivk7cfnu/Lvgi8lFOFoL5GyVL9W/7+3CW9FHmB/TmU2m7ubc
	 Fd9yKHayCM4RTiw6Y+jyeIfhaf4rymLpfcb9nEL2T/+GK8FmvqP/WAvbrJZXYqYWavkvm
	 fVGVIBTZI4NXZQmixOVUKyTbKAKhpV6zi8PxxTNG5okGgE32l9D+8rjgib6jcyxITB6Ar
	 Rdh/oauQNmHwtph6nfQJ8EXcP1JXsVK8iGXC00kb/jKlXUBlbIV871JACMQBY1Z8Weg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oyOf/PuS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A8606A32F
	for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 13:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6A8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyOf/PuS
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so5146265a12.3
        for <ntfs3@lists.linux.dev>; Mon, 16 Nov 2026 05:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794837179; cv=none;
        d=google.com; s=arc-20260327;
        b=W4QNg8Docu6viT3RLBOjEuq+t/LNgW6/dCBd74m/wvYn/lRNFBAMA1Qf0IJcMZ1uvx
         TtE+k5cMsUYl7yJ3IS5m2jl8063jJpc3xYHayVI911DjCNQ5tK5EqCbdDKl0UOyB7062
         Of9dVZDZB60C5/TqEvTcfctbzOH3p+Ku0vxSpc8cw6zZxSDUEqQqFdjv2QYfXJR12U96
         0YO09R6jKtB6B68dTOvwRysVJ8DkGUkdo02yxtI2R/h7mVHb0A8bAP5klFsZKlDFmAAq
         KlJy8B/E3pmSZIk1BM8IfH0XCFvBSiv2Wx3plkstpqjuG8lB2oD+KbPDC/pDSy41Ly1E
         4T4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yjMfJPlhmwgFldHvOAN6a+VpaF8LquFmHlpLZaL46tQ=;
        fh=6GWyHdECHhynOrDX2tSzq06Z9KIluTEUd2IOW4UN8TE=;
        b=dOBD1AJkZBxX8cohvwE2SOKA0t+kK+zlssQIfCUn4k77h6XjmfA0XUfr5+DU5bIPYb
         VXQsefX7USDB6WOeq9AYIQHmQiZYAq5a9/yTKL67MPaxpAu0N97dViwjkoW4r7WVmgy9
         kEuflLG6+G31/zLTYd6ONdzR4sMZjmRhuwmYLD9CNdYvm0X7uBrKxIDWyhygr+2IFJAS
         vZudyHoscy92kaEvvsH91MONLT+nAViDYl4w4KtkhdgwzpZYKr1BJeUjWmqDJYL93yKM
         26VGaEP3G9ZHodJac84D79yJBQpbV4tE+GV37VfR8/Soe7VgXyaxMwyUpPkPCmLK9yV3
         dXVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794837179; x=1795441979; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjMfJPlhmwgFldHvOAN6a+VpaF8LquFmHlpLZaL46tQ=;
        b=oyOf/PuS/a2SsV5CVAIvTzgOFvWJdFYRzpeZjJLZS2LSoVD6jW7nyUMnkkQnWT9QBQ
         hSqX0Zhb0HM5JIjCtSPMYT9qUEcsZW2u28NUS6AnNG+/t+A6Q9Hp7fjs3UwbZtyBSqeU
         m8v+l7pIG8AuMtIwEp/Bf9uMzrD6OzKkIk18/RQ06xvvJmaJY4mMkU2PyIXI+INOw179
         WW/lfC2PpvwRN+O+7Lm9pKYzXTU1c5h7f3nXFtwvgtZgU3kYn/Rgn6UIh7ZKYkgsFs8T
         TpjabvkNIPC4trSbW3fKG2eX/sN3cjQUCNL90k+ioVNPZpzEVoJSxDp3XhLLi8k+PYd5
         +fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837179; x=1795441979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjMfJPlhmwgFldHvOAN6a+VpaF8LquFmHlpLZaL46tQ=;
        b=15FtQDGmnnWskQc4oJOcZGMMS4WEM/ft0yFr2hS6fPeSl4YqzfDlq3ODQuI/vJ99k8
         T1RPFBKdgramM6RMszq6bPOchALOsTD9K4xSxrDoey5BnANMy3h9kju7cQ8JUGCozZyS
         eC+yt6M/inaqOnX9BmFGY+DPJapHl7oGp26kiRrfeZQ/1WOU/nqi+HlYdnVvhSBSOyL9
         Shq2Hu/mlx2y+H06JvLWgsFW1ipBRANLmLJLTeq73BRSLKwUXwNu1ZQZe8MgdUzX6HVQ
         xHg4H62jvO3cgCsZv6mlKlM0zlmdzZqyOwkoQwXHGXefNUf3Lqjb5RRlElLAHtFAXG16
         CTEw==
X-Forwarded-Encrypted: i=1; AL+hErHTr2QLvDvC6CYKKi5a1gk/QBJe8gThWxlfjIuNLlU4yOaqs0TRxXdHFpkvXcLKP73Dqy5oLw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/TRkE9vV4rt9KGt3f1+wxwoHk/b/vvk5NfInuWssrVF7blCuGl
	UwVxDnBhphSXRWseYgu0bRekSQKuXyN2sIKaRiF7C1TZ1MDsIaiVuwDImfAIJKl2nQU5A7fJrSu
	3TEJNulnUWYSJg4JmURMKa9bZ7geGD0E=
X-Gm-Gg: AYBFou3LPOtIBRURthxku1rHmOqun+46DwI1UmoSEf0mMVrSW5jvY9jPVoe8jCuFYOV
	g3mr9h7egqUkOk8IIwcaaT9kAW6vv6uQuBISmNRQllE1KU7JqJYtN9DwKA5Unwk6zoJryL9dVZC
	dALXhYJT9Bwn2SDOH0D8hgrP+3n0o3viQlRC278FVR61WHcHKTycL0xWaATRrlr9BxZ94uQkpxk
	4rcheSGW/lTsC1UN3vmsLE9gtoN7i8rLpJg8S8peWmlWxpnDktTCmIhpBbKD1SfiEwuEGFKSso2
	28DIuBLc1ccd/en+xZL22V6V1aZ+P8ic/8gdbnm2gwKCCNuHocJsqybtz6lilbaRxI3OeT80S1T
	4JpVOdYAfB2Smh0MRKjUwk7Qxp6jiudasae7APtgbvZPWzrDe/j6jS0ZsBWZpEHLTWflsETupKe
	PXgQAGcC9QuHMm3QE=
X-Received: by 2002:a05:6402:1948:b0:6b7:a180:61da with SMTP id
 4fb4d7f45d1cf-6b7c0c6fc36mr8419375a12.28.1794837178579; Mon, 16 Nov 2026
 05:52:58 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-7-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-7-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 14:52:46 +0100
X-Gm-Features: AclHuK-FBjjEu-Z1sMzcEnpiCJ9rezp8HfxV_QrUdctxQDdJI-5IhWzN560a-40
Message-ID: <CAOQ4uxgm+JEu2MGnqQrJ00nTJ45S2ECQ7CBOC2QrgniOfkLYAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 06/10] vfs: add __vfs_fileattr_set_locked() for
 inode_lock()'d callers
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
> Currently there is no way for a caller to invoke vfs_fileattr_set()
> while holding an inode lock without having the kernel go into deadlock.
>
> Fix this by moving the vfs_fileattr_set() logic into
> __vfs_fileattr_set_locked() and making vfs_fileattr_set() a simple
> wrapper that only handles the inode lock.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c           | 139 +++++++++++++++++++++++----------------
>  include/linux/fileattr.h |   2 +
>  2 files changed, 86 insertions(+), 55 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 12610fb6a751..063c81fbfa6a 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -288,6 +288,89 @@ static int fileattr_set_prepare(struct inode *inode,
>         return 0;
>  }
>
> +/**
> + * __vfs_fileattr_set_locked - change miscellaneous file attributes whil=
e
> + * holding the inode lock
> + *
> + * @idmap:     idmap of the mount
> + * @dentry:    the object to change
> + * @fa:                fileattr pointer
> + *
> + * Same as vfs_fileattr_set(), but caller must hold the inode lock.
> + *
> + * Return: 0 on success, or a negative error on failure.
> + */
> +int __vfs_fileattr_set_locked(const struct mnt_idmap *idmap, struct dent=
ry *dentry,
> +                             struct file_kattr *fa)
> +{
> +       struct inode *inode =3D d_inode(dentry);
> +       struct file_kattr old_ma =3D {};
> +       int err;
> +
> +       if (!inode->i_op->fileattr_set)
> +               return -ENOIOCTLCMD;
> +
> +       if (!inode_owner_or_capable(idmap, inode))
> +               return -EPERM;
> +
> +       err =3D vfs_fileattr_get(dentry, &old_ma);
> +       if (err)
> +               return err;
> +
> +       /* initialize missing bits from old_ma */
> +       if (fa->flags_valid) {
> +               /* FS_IOC_SETFLAGS */
> +               fa->fsx_xflags |=3D (old_ma.fsx_xflags & FS_XFLAGS_MASK) =
&
> +                                 ~FS_XFLAG_COMMON;
> +               fa->fsx_extsize =3D old_ma.fsx_extsize;
> +               fa->fsx_nextents =3D old_ma.fsx_nextents;
> +               fa->fsx_projid =3D old_ma.fsx_projid;
> +               fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> +               fa->fsx_ptime =3D old_ma.fsx_ptime;
> +       } else {
> +               /*
> +                * Preserve unmasked xflags when running file_setattr()
> +                * with a mask, which doesn't need a read-modify-write
> +                * so these attributes would be set to 0.
> +                *
> +                * With FS_IOC_FSSETXATTR or mask =3D=3D 0 (legacy mode)
> +                * this is not needed as userspace does
> +                * read-modify-write already.
> +                */
> +               if (fa->fsx_xflags_mask) {
> +                       fa->fsx_xflags |=3D old_ma.fsx_xflags &
> +                                         ~fa->fsx_xflags_mask;
> +                       fileattr_fill_xflags(fa, fa->fsx_xflags &
> +                                            ~FS_XFLAG_RDONLY_MASK);
> +                       if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTSIZE))
> +                               fa->fsx_extsize =3D old_ma.fsx_extsize;
> +                       if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJID))
> +                               fa->fsx_projid =3D old_ma.fsx_projid;
> +                       if (!(fa->fsx_xflags_mask & FS_XFLAG_COWEXTSIZE))
> +                               fa->fsx_cowextsize =3D old_ma.fsx_cowexts=
ize;
> +               }
> +               fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> +
> +               /* xflags not present in fsxattr */
> +               if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
> +                       fa->fsx_ptime =3D old_ma.fsx_ptime;
> +       }
> +
> +       err =3D fileattr_set_prepare(inode, &old_ma, fa);
> +       if (err)
> +               return err;
> +       err =3D security_inode_file_setattr(dentry, fa);
> +       if (err)
> +               return err;
> +       err =3D inode->i_op->fileattr_set(idmap, dentry, fa);
> +       if (err)
> +               return err;
> +       fsnotify_xattr(dentry);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(__vfs_fileattr_set_locked);
> +
>  /**
>   * vfs_fileattr_set - change miscellaneous file attributes
>   * @idmap:     idmap of the mount
> @@ -308,7 +391,6 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, s=
truct dentry *dentry,
>                      struct file_kattr *fa)
>  {
>         struct inode *inode =3D d_inode(dentry);
> -       struct file_kattr old_ma =3D {};
>         int err;
>
>         if (!inode->i_op->fileattr_set)
> @@ -318,60 +400,7 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, =
struct dentry *dentry,
>                 return -EPERM;
>
>         inode_lock(inode);
> -       err =3D vfs_fileattr_get(dentry, &old_ma);
> -       if (!err) {
> -               /* initialize missing bits from old_ma */
> -               if (fa->flags_valid) {
> -                       /* FS_IOC_SETFLAGS */
> -                       fa->fsx_xflags |=3D (old_ma.fsx_xflags & FS_XFLAG=
S_MASK) &
> -                                         ~FS_XFLAG_COMMON;
> -                       fa->fsx_extsize =3D old_ma.fsx_extsize;
> -                       fa->fsx_nextents =3D old_ma.fsx_nextents;
> -                       fa->fsx_projid =3D old_ma.fsx_projid;
> -                       fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> -                       fa->fsx_ptime =3D old_ma.fsx_ptime;
> -               } else {
> -                       /*
> -                        * Preserve unmasked xflags when running file_set=
attr()
> -                        * with a mask, which doesn't need a read-modify-=
write
> -                        * so these attributes would be set to 0.
> -                        *
> -                        * With FS_IOC_FSSETXATTR or mask =3D=3D 0 (legac=
y mode)
> -                        * this is not needed as userspace does
> -                        * read-modify-write already.
> -                        */
> -                       if (fa->fsx_xflags_mask) {
> -                               fa->fsx_xflags |=3D old_ma.fsx_xflags &
> -                                                 ~fa->fsx_xflags_mask;
> -                               fileattr_fill_xflags(fa, fa->fsx_xflags &
> -                                                    ~FS_XFLAG_RDONLY_MAS=
K);
> -                               if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTS=
IZE))
> -                                       fa->fsx_extsize =3D old_ma.fsx_ex=
tsize;
> -                               if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJ=
ID))
> -                                       fa->fsx_projid =3D old_ma.fsx_pro=
jid;
> -                               if (!(fa->fsx_xflags_mask & FS_XFLAG_COWE=
XTSIZE))
> -                                       fa->fsx_cowextsize =3D old_ma.fsx=
_cowextsize;
> -                       }
> -                       fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> -
> -                       /* xflags not present in fsxattr */
> -                       if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
> -                               fa->fsx_ptime =3D old_ma.fsx_ptime;
> -               }
> -
> -               err =3D fileattr_set_prepare(inode, &old_ma, fa);
> -               if (err)
> -                       goto out;
> -               err =3D security_inode_file_setattr(dentry, fa);
> -               if (err)
> -                       goto out;
> -               err =3D inode->i_op->fileattr_set(idmap, dentry, fa);
> -               if (err)
> -                       goto out;
> -               fsnotify_xattr(dentry);
> -       }
> -
> -out:
> +       err =3D __vfs_fileattr_set_locked(idmap, dentry, fa);
>         inode_unlock(inode);
>         return err;
>  }
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index ba7ed3b387d8..7ff62ee27e58 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -97,6 +97,8 @@ static inline bool fileattr_has_fsx(const struct file_k=
attr *fa)
>  int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
>  int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentr=
y,
>                      struct file_kattr *fa);
> +int __vfs_fileattr_set_locked(const struct mnt_idmap *idmap, struct dent=
ry *dentry,
> +                             struct file_kattr *fa);

There is no reason for __ prefix here and I think it should be discouraged =
for
global scope if possible.

Thanks,
Amir.
