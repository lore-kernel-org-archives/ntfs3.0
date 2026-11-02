Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632194;
	b=pyrd8Qr6b70gbwDqfN7rCFe/wIeCNSt9qmdp2jt9jOzYkvlKLCXm7zQwU59XneH7J1PV
	 clEc88nsqHIBz3fnliVjerocfik2SP9SzMezYFktcrh0yo7IqbEJLjeDAt5hQjGfVVH7s
	 Yg3f9NuUl0yohFrwrXG422sGZpGxiTPAC+RG3jqeFCTNXOH4ROO1etmIyKoKvHpnK+zvO
	 Gvi8vl1HHBEuy/5iIV7PGZ5sZ65VGeZkHzHtpqvGP0SbbefHf2HSTABYDPVoQTdJm+FPK
	 7r63EIlqDnNt6sbRQXPlcieeB3JvaGCIhGOlSCqMHGTEbDp9wFmg2lYoBbR3Ti5FP+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
	b=eEBx2rOswjAsLjV9u1a3OVokTW+856XjNU6iBXrKwmDpk/rPat+liaoihQyfLGBR6/oO
	 mMMHBTQCfJek+ClsrZ+MhOkKLnTqnEe1Hgw8S77dgswB6CAnKQHmOl5/PF+0Kl2NFXKK8
	 keW1Th/FThH9E+7IvUmt5wF0Mbm4ZnvR/B11Ar4nYjecN6HwY5PL3OSTQnSdWHKgQNWyy
	 Bx6S8M7Xvu6ojp/NOfBMp6oQmRu0hrAkw/cst3RkPBTkYF29IKs4r/qoN6wHwLWcOoHZT
	 SGEsS4XSZAabLvwfr9dI6mgnRJ/iKCwk+g061Pn3VhzJZ3Cxa+pnYv0mW630fR4TahQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTr2bU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2AA606B1CE
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 15:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2AA606B1CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTr2bU
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so3011290a12.0
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 07:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632193; cv=none;
        d=google.com; s=arc-20260327;
        b=gRZb1zuiwoQPDFsNyhe3ZRp2inYUBKNE5jUqVgRUxCxx7b1K582G6N4iHjeJUtCF0m
         c8s4osLz/HlCx5JZD/96VrjhfvJwFRD+QiiT9kawTJlUTQnDnsTVsVIauvrpRPGum1oN
         c9CxA1hrkO+GXWbLmJscdEWNc3VbD6lGFA5xEITng9xXsfTNDjvum8T5EhEhuY+050Jt
         6rxIgyiUeAJWIf1cJRP00T01p3w3KlnHXXYFWsfs1LeufHWaejXHA7A8d548xwf83aJo
         TeVAEhVE3fSHMVyyBizexF9Thh4I3ltWKYTbXcSOVB44hN4v4ACxUty82qEf7fvvh0xW
         sL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        fh=caFtzQT1xwHx8BGl4lLULnpRVloR+9v+31n0/8QgkxQ=;
        b=gL0+fRFyDWUgN96kbehf352D3rrR23J2sa1jg5PBIbvsovhrQvS/vnUoLUBurWm/tY
         oVpQI18UCU3QRx4rWNjO1wJCBVP5uPbk1n5+5B8efKKfXKTzTXbT5LW7jRZ910wTZx5I
         2pX8nHzF9WrIzFlKlhxnvveApgepbB0WNisT6jHSsLJjtgs8ptBBccVElNC1YhQ+i4cx
         yHbhl8VcmMwF4lCZOuxEvitsFQydPvr8jUKTbGaVyEFyQa6P+ApYmCIkN2I5sJHG9zYt
         8Vj2I18cqV3RJ4ylwiim1rwpKiJMiPGUcVtwBDuoqibf+YfpXXfJh7uKuOa7pMx+Qw/T
         hcfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632193; x=1794236993; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        b=WKvTr2bUKjEZBLIJp7Z7t++W/J7wcqAT5KISXdyZdJmAVshVP8gwy6eHXmemIx7I7a
         LZWpYARboxh+zsQhzSC5L9hh+aS7U/4MCDoMB0MEpJKKnJoR3G/F5Wx6JPa7Fn9nckI1
         wk9SwMEMs8yfxwRUl0lLbrzVOgROsEq//wf1PBmCe4Uos1KmW5tFZix6C4wNb0Dsg7GI
         55T3JD+5h3P6cPdcs1gNQXFtJLbJjAEyn53hRVsfY9yYFkDk021jpGNVMrLUyjODnZLa
         lfq2+Hqk8ouRMEqCGdRCP2DrAWJ+H/YdDas6Hc8w6i1lXppKrdPWwGKA8h31Soe+NTu6
         X3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632193; x=1794236993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        b=UhRBwkGnbNJoixiMUq1yV2JOzFvknzUUAj6+C8FNiccnBtHJevNDOf4JO6tEgdfwF+
         mlEz83cD4N9wxmuKJ0O5HbDJyVAixwexim6NQjyXmr+MrVjbezpaX4zG29gWXzL1PVks
         2mc/WM0sjrJrAneoNToD+AYOi0sMfzT5UnQIrzyJggDivLbwxtLLhSenV0dfGG687uW3
         glaD8Z2fmIcEExG12R3GNbVf+zQagpPbbxtzcTSQbiN7VrtvwzcOqoMGLrIJY/+IbZOc
         EntA5Sez6c4sppLrbyhC1ADE9qjecl+bqfh23nmly9ipYc8CwutLC/8HJfqEMBebJfRA
         1Y/w==
X-Forwarded-Encrypted: i=1; AKwUvBzbEn1htEd4nA7n/UCdP38OMz4vCqTWdEnWKJBrPEjWYIbLq3pdzw73R13WRPmdduQHjPTEJA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9oZc0Kk0WumGTbeB10yCK5GZgZcwue/mU2vK5NG999EbHkR+Eq
	oEJwfkZERxp7qS7RfPZLOuOjAvfx5JSkOc3u41lmhAF6dxv8Hlka8Alw9KPJ2LEo0VXuiOqGmKV
	b2k/NVPEcXajs7nXUZgLcX83OSMOcByY=
X-Gm-Gg: AYBFou2XZ7GGRfWVpt6qmcJyeoLB8evL1tXAcnj+tjt7iDLUHk+vwiOU01tHwxavT9H
	kITggP37jYVLbqW6MhuPKOa+NhA383gFQfGni9r1D3P0qBrpoFypzlNJaz8AagedzeXsi3qHN7/
	uR9jw90hcibsuUAbw7gkudX2T5AziRPxXYRPwxAIqI2oh4QTzinOFAP2ACB3LRuMkdLsbYPBL3K
	iFAdF5jhICgby2R/H5U1HaAjcyEg+MqyveU9YeMektljsYwUtdvbKhH55BPZEo5SmphdjcA0sij
	l/DP1IxlwGlXnTkqUiSFtjo9d6VSlwBzlUq5B1ttt9NBLxxbRbEjMYCH1aSU0B0eMwc0g1jWYE3
	K33W1288Bo7Z7iNPyGtJRuSFyYnsSCR6dMzSNcodFV94gj0vE39QclVPq9t0MqbtZoJGsyg==
X-Received: by 2002:a17:906:4fd5:b0:c46:7fa4:922c with SMTP id
 a640c23a62f3a-c4ca7b20e1fmr868205166b.24.1793632192478; Mon, 02 Nov 2026
 07:09:52 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-4-koray.fra@gmail.com>
 <20261102142452.d6jkitgdeuquy23i@pali>
In-Reply-To: <20261102142452.d6jkitgdeuquy23i@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 16:09:41 +0100
X-Gm-Features: AclHuK8kuq8eQ7yCdpsnJrZqU_PhMlxnY90gMXEz8lBNnkHZ5ogvsTJfHTXbOfo
Message-ID: <CAOQ4uxhQ3uhq6s+4deEJAQV5iy8QZoucojR58_dUNYrnjt_yvA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
>
> On Sunday 01 November 2026 02:55:49 koraynilay wrote:
> > @@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idma=
p, struct dentry *dentry,
> >       if (flags & FS_APPEND_FL)
> >               new_fl |=3D S_APPEND;
> >
> > +     if (fa->fsx_xflags & FS_XFLAG_PTIME) {
> > +             ni->i_crtime.tv_sec =3D fa->fsx_ptime.tv_sec;
> > +             ni->i_crtime.tv_nsec =3D fa->fsx_ptime.tv_nsec;
> > +     }
> > +
> >       inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
> >
> >       /* Save nodump flag to return in ntfs_getattr. */
> > @@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, con=
st struct path *path,
> >       if (unlikely(is_bad_ni(ni)))
> >               return -EINVAL;
> >
> > -     stat->result_mask |=3D STATX_BTIME;
> > +     stat->result_mask |=3D (STATX_BTIME | STATX_PTIME);
> >       stat->btime =3D ni->i_crtime;
> > +     stat->ptime =3D ni->i_crtime;
>
> For me this patch looks dangerous. Somehow I would expect that the
> "btime" will never change for existing inode.
>
> But because the ptime is mapped to i_crtime and ptime is settable from
> userspace, with this patch it is directly possible to change btime.
>
>
>
> I was thinking more about it... Is not this just misunderstanding of how
> the security model around the times is working on different systems?
> Because on NTFS there is stored just one field which says when the file
> was created. There are not two fields like "time set by user and time
> set by system".
>
> Windows security model allows anybody with WRITE_ATTRIBUTES access to
> change that create time. Linux security model does not allow to change it=
.
>
> NTFS in this view is just a filesystem like any other (ext4, btrfs, ...).
> In my opinion if the ext4 or btrfs filesystem is correctly implemented
> on Windows systems, then Windows security model should handle it in the
> same way like for NTFS or exFAT. So if something grants WRITE_ATTRIBUTES
> access, then Windows should allow to change also btime on ext4 or btrfs.
>
>
>
> On the other hand, I understand the use case to have two creation times.
> One time which would never be changed and could be used for any kind of
> atomic / synchronization by userspace application logic (this btime).
> And another time for human which can be changed at any time to any value
> which user wants (this ptime).
>
> In any case, I would suggest that filesystem driver would not report to
> userspace unsupported values and would not try to invent other values
> and lying about them.

But all those fs with mutable creation time already report it with STATX_BT=
IME
so what can we do about this?

If userspace requests both STATX_BTIME|STATX_PTIME in mask arg,
those fs could technically return only STATX_PTIME and it should not regres=
s
existing programs.

But this is still a bit surprising behavior is it not?

Thanks,
Amir.
