Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489727A123
	for <ntfs3@lists.linux.dev>; Sat, 11 Apr 2026 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775885018; cv=pass; b=mvy0VeHt6F3Xvwuy9mPHRJlK3WlarPgtMtP0FDmMquE/kq857G1kuVxHw5+amVUD1N0CQcsVZyzYr8qCqTjO3q8vIi3gfwnQ5Bs7VyulMKX7lvkxIEvpOQlFCGPuItMU3hInScRIAUcirh1SMNygkEJVkiGLXJj5T2gwzzuD8uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775885018; c=relaxed/simple;
	bh=Lo+2GA/uQIyjQAxhYTMZi050jp6falMFjCEcZgCg2To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L48vKSk1B4ThnvWaShebpNNs7tgF5gaEfbxxxX1Y28vzuHuGmvqVNVnWvkY6qvsOVGpcuKMj6phygh5viHsPopu0QsDhDxRlsjvaw6+EN4aXYhhJBoY9jkKNCuKC9HRBs+4uZrW7xw3Ioe5ye2Z1xMDtzyWh7ymHRt/uoMT357M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAsLJcFs; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAsLJcFs"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79ab3e26cceso27175937b3.3
        for <ntfs3@lists.linux.dev>; Fri, 10 Apr 2026 22:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775885016; cv=none;
        d=google.com; s=arc-20240605;
        b=X+BzcEgVPou0+rrNzdop9EiB67EtntcefcxGozHXj7C2L4W+6moaBRPMDQ93s8Nw4A
         lr8QDeW4euCRpNduhE1kDwzmI8eSqscnMTnZr8TOD8VIeB2/WkmqrE7534TqT4mK+OgG
         oyWJBAni3PdaksVH4+piXpWH998DqQEJo3OU+VNAXttDseGv1Trv+sqbAG19KIu9bpaL
         7g9+E8yz7/45wCx/uFLGyQt5wjF9DzCCGBeGcMlyF070TuWU/Yx/DsZWDeLK3O3O3Hrv
         7Q5zqeAUs1mxxCZ6unJDXe30Ncxn3m4EKuGzbLCRyLj96E3+0GAUuA9f/pLEpIe3hXLh
         z0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8SZ4oUkNp8WAjJbG/dIWyJhIm/Zmr4q/EjqXuxcT9qQ=;
        fh=M6XUUFH3lEF8HGjA0dGmtDjMapfhsvAYcdHhbMwJTEk=;
        b=d5HOunpsIGmjlSmdaOIs+4RUsWd3ul3wlTJnUgI1KHEJTM5iwK0iVMZL+TtJ3n1NL8
         Ab1Eg7yaPyErg0Xu8jM8gZwPoBOMx7o81OgLSbHFTsoO0gsClBphrtEEgZDKGLSKx5wV
         GGOnNPaNpPByHJhRq6DVwAbOfKCrqjDFvklvo/7s9ub/hGLapIOxOl2KydQ2oKyS624g
         P2UepYXXvgyZv8LH3t8LfCcbSdXT0Pp9WEQtef5eqwENXs0cFySq/jeCW0qaOjlMAyg4
         dQM3YukMXTbCzlOg421HOeI1D9WOsetofJspPntnc5hwYMAeU/0NCFSaIJB076sxKdeU
         0ofQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775885016; x=1776489816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SZ4oUkNp8WAjJbG/dIWyJhIm/Zmr4q/EjqXuxcT9qQ=;
        b=XAsLJcFsnwESEZyALHWW1niO4dZaz+moSV+dxht3bEwv93JZiIhzHSWkO9LS0/Ou6A
         Gi6Lo2POdUMjgQG5CfquiIoPvpxamn03TKjlSYzx8uSXvy/ryO07LKQ7FSaZUTyQtjxa
         37JJn84OOPzkZkwje2znQaY50BpAiFfQrR19Cu809iiMaJrdBNT0/9MBNyZJ6scAnRgP
         4QbXMnhJcfUrKkVRkfTMBBbJLz6IjDqqq3qqqeojO1uciOonyEDT85o84Zhn5SboeFuw
         VEa1o4sBy6RoCqve8cpCTpaP6XePKuyrgvvnz7TcLTyj61QD+DADA+H7n+WN6sx5U78O
         i3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775885016; x=1776489816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SZ4oUkNp8WAjJbG/dIWyJhIm/Zmr4q/EjqXuxcT9qQ=;
        b=RAwFBxn0BC6pDHQbQ8O3SJjSqsT2wFRrOLTT866YtKqtmM6MI+Oy+St4/IBQ3pbEQI
         7wAgA7d0CZG4wfCKUFVB2p5hgc/vGSUrES9IpxzY7edaq4liQuKXcaoBQ0uuzdtt/f7n
         bR+UrnOGV+1Acwnw6QwRnO+pC/xxo65zqjs29tYV+ZLnpwpx4mwkkY98eInSCmosc/h9
         GR/Z0KUUpenxXGVhs2zLiY0OyW9xEI1sBBNrv6JTiUaCcD24f6lreFrsOBwcSi4KBLDV
         oeGBQzYOQvyt+sA7WAhQmqvRMajWvWue1qOVFzwwS7+cc3+fbXQwzOgkeE/VN0IXVJG/
         hnjw==
X-Gm-Message-State: AOJu0YwPiCr0yTqqYGoytU2FG8a4uyS0UAMPvvz1uxkbvXFSScym5TCt
	XG2DPKr3HQqVbA0tZ+Y0z1r9jrEAwGPTmJDvme+VIg+crWTk2ENODuYZ40tr67yD1Hmi3BEIvMP
	gC/1svQLeoCKECtBWRRE6XOjedXjBtD8=
X-Gm-Gg: AeBDietM/f90SqGxW6aN3AH3l4v3QCC3C3jW7AYUiRmufGaYgf9WmzUiPwddcIYGYDs
	GC1H7o5hgsYkxt3Cdn9DohNzKoCqWIJ03Nprqx7eQE/PJWR6XznRtx+sCM8tnvAJ1jMp0NwMa/f
	OsSZqU0nwuHqCoAtSGUDIA6SyoHc0zQxTiygzxEek4kU15SkDyZqdZmBuhPvY8BgGwX+cU94NjY
	/lNlS6aZwPu7ByDyrT4Lyc/HA5YgKjJIOpCdUhsqhQu1fv2DbY1bZSk7y4sOdsfq/ybfzfgkBo8
	/3u9YctMfKECz2O0l8QG898ZdStMhMK0qPYXQVmBZKi8b19C81o0MdfKiLubXX5mSjIPhRRw
X-Received: by 2002:a05:690c:dd4:b0:79f:3b8c:a7fc with SMTP id
 00721157ae682-7af7204386amr67162567b3.39.1775885015850; Fri, 10 Apr 2026
 22:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404153213.365836-1-kartikey406@gmail.com>
In-Reply-To: <20260404153213.365836-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 11 Apr 2026 10:53:24 +0530
X-Gm-Features: AQROBzBEiJ_dvh-3y9ryJTjTjHx81o7oYO1A_z698rZF7_pMsBoqjck0LHYNtm0
Message-ID: <CADhLXY7xWU5+QSAR1r2KfSyTm2v05hyVxeU5SH9FoHC2H4QgZA@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: fix deadlock in ntfs_force_shutdown
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 9:02=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> ntfs_force_shutdown() calls bdev_freeze() which internally calls
> freeze_super(). freeze_super() calls sb_wait_write() which waits
> for all active sb_writers holders to finish.
>
> However active writers (ntfs_compress_write) can be stuck waiting
> for ni->file.run_lock while holding the sb_writers read lock
> acquired via file_start_write() in the VFS layer. This creates
> a deadlock where freeze_super() waits for writers that can never
> complete because they are blocked on run_lock contention.
>
> Fix by removing bdev_freeze/bdev_thaw entirely. The shutdown bit
> NTFS_FLAGS_SHUTDOWN_BIT is already checked at entry of all ntfs3
> write paths (file.c, inode.c, namei.c, frecord.c, fsntfs.c,
> super.c, xattr.c) and causes them to return errors immediately,
> making further writes impossible without risking a deadlock.
>
> Reported-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D5f6ca38579a76e303c1c
> Tested-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
> Fixes: ae91dfe38966 ("fs/ntfs3: implement NTFS3_IOC_SHUTDOWN ioctl")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  fs/ntfs3/file.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 7eecf1e01f74..cbbc7d81875f 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -118,18 +118,12 @@ static int ntfs_ioctl_set_volume_label(struct ntfs_=
sb_info *sbi, u8 __user *buf)
>   */
>  static int ntfs_force_shutdown(struct super_block *sb, u32 flags)
>  {
> -       int err;
>         struct ntfs_sb_info *sbi =3D sb->s_fs_info;
>
>         if (unlikely(ntfs3_forced_shutdown(sb)))
>                 return 0;
>
> -       /* No additional options yet (flags). */
> -       err =3D bdev_freeze(sb->s_bdev);
> -       if (err)
> -               return err;
>         set_bit(NTFS_FLAGS_SHUTDOWN_BIT, &sbi->flags);
> -       bdev_thaw(sb->s_bdev);
>         return 0;
>  }
>
> --
> 2.43.0
>

Gentle ping on this patch. Please let me know the status of this patch.

Thanks

Deepanshu
