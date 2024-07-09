Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF32BD05
	for <ntfs3@lists.linux.dev>; Tue,  9 Jul 2024 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507487; cv=none; b=fxKXjUMB0gkLktuiW6/OumICjK6nw2qYWkCOv90QKE7Snu8e3KqOiSQxUfpLlf8IUb6OcwDYEq3czL/1wrh1zvs90CDIYBT3qhIQSFwQmlqy3p2uGF+z3BgBFu0RcdVqeEAGtN59Q6OzSur6SPohBRytat7olfqULj8aZjC1AtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507487; c=relaxed/simple;
	bh=IvBw2aIvOi1KuYVuj4LLUE9DoZsIptDjkb2HEWYHs+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwttD8tvgyi5X+iQtYIazJM5PXMHnrLz4qi1cDiKfaOJs//q2Z9MjCoRvLM2bsYsu9/iohKitL0hugQJDFSXuiCyBPSbKgL/K30gkD8fJjxXZSWN25TD3u0XohBh/RI4OCidwFVAwMvgAY013FuBbtRUjv8AWivVPrYfOMkiwE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdjMn5dr; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdjMn5dr"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e03618fc78bso4640305276.2
        for <ntfs3@lists.linux.dev>; Mon, 08 Jul 2024 23:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720507484; x=1721112284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDETBOVLVo5R0Ku8KoF4PoOYr/rj6dwudMNstd4V4x4=;
        b=EdjMn5drbvvniDph/Wj1QMs2FrgnoA/X7sPLJeI0TKMDaCUU0fRMNWD50oOKZnxit7
         2hXYrdQxTu7G2tzQNVpMLcDVkZ+zHU78BJulfJDCjxSrcOkw+OzeIuz7lb3EAsO1ILdb
         SncgVQfsFK/mbtXVtposSBeQgTav2Vde84dpcG/AJPJ1qW3hIl/XkZpgSV6jtefsEC3a
         3bKZJc8dJOfX6f2aCrjaNJRRfUdZd0R1h6nDIGAKqkyW5ukYynxD9Wa81D/bWXahUQUB
         XLWQ8ub1FS5aMSBmQ8nRJKXedW46vxLQjcTAFsaA11g75BsE8rCzKbVpUZy7IN3X1cKU
         ECCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720507484; x=1721112284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDETBOVLVo5R0Ku8KoF4PoOYr/rj6dwudMNstd4V4x4=;
        b=RSqJF6kLn42Xjy+qnoO1t99x2BDl5BKP94p1S+L+I94q7YLYk5glrc2OtO5faXxj+9
         EyvT5fmu1QeTeMP73TACEUW1yMF5pJqpjh7fLl+c3cTrjG8oSk509YoxzhcBjfhWUr5B
         KDNl0AwMmGMXQ6tppI7OS11+flRUtYYuic2ORBrx0S8MUCqMa9JNW0SoXSu1ZF0zaGpm
         fFGC4BOMzD56gcM4tBuz9bMU6m0rDbJU6gz2FmPra01Cji14cuvLrOVwRnifRt1kW7Jr
         LrdJOqg1c2h4H7YZzqrx64aSYsF/4WjklX+HINGHRQuyoQCEFIUg4JVCS0uhFXyngBaK
         gp2Q==
X-Gm-Message-State: AOJu0YwVXMdKrZf8V/Xf3tCnX1HuaEw9n2uIr2/mTIHpqDvySAme+ZP2
	f7cIST3AJrs0AYdSZ8hYbvfC5RzZNvrX7Ae5Pu1Ql64LGew6CCbpa3Yifm5oFYiQdpCZ1Fy9lD9
	c4IHekPo4oPWz4SgoxkQEtri68N/ttHm3I16KZok1
X-Google-Smtp-Source: AGHT+IHWRme0PWt9QZxahBofW4N+tCJuN9//Z1JKxkPmZwXlD0wy5i8bHza5irQSixboMLPNnqQSGBHTjkWQzBTFbCU=
X-Received: by 2002:a25:abf2:0:b0:e03:5188:591d with SMTP id
 3f1490d57ef6-e041b0398a5mr2198561276.4.1720507484397; Mon, 08 Jul 2024
 23:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702021659.6583-1-llfamsec@gmail.com> <CAEBF3_ZErWEj3HmfeqY0XPF-aHRjV-tCcNcTrcrFO4Zewu7aGQ@mail.gmail.com>
In-Reply-To: <CAEBF3_ZErWEj3HmfeqY0XPF-aHRjV-tCcNcTrcrFO4Zewu7aGQ@mail.gmail.com>
From: lei lu <llfamsec@gmail.com>
Date: Tue, 9 Jul 2024 14:44:33 +0800
Message-ID: <CAEBF3_YagXQhuJ9K-w1mon_OKXs3VC==u=AAB32xMZQXdhv2OQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: Add bounds checking to enum_rstbl()
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 11:48=E2=80=AFAM lei lu <llfamsec@gmail.com> wrote:
>
> On Tue, Jul 2, 2024 at 10:17=E2=80=AFAM lei lu <llfamsec@gmail.com> wrote=
:
> >
> > Added bounds checking to make sure rsize is not less than the entry
> > size and make sure the remaining bytes are large enough to hold an
> > entry before accessing in the caller.
> >
> > Signed-off-by: lei lu <llfamsec@gmail.com>
> > ---
> >  fs/ntfs3/fslog.c | 33 +++++++++++++++++++--------------
> >  1 file changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> > index 855519713bf7..75d31bc11567 100644
> > --- a/fs/ntfs3/fslog.c
> > +++ b/fs/ntfs3/fslog.c
> > @@ -609,12 +609,15 @@ static inline void add_client(struct CLIENT_REC *=
ca, u16 index, __le16 *head)
> >         *head =3D cpu_to_le16(index);
> >  }
> >
> > -static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
> > +static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c, u16 e=
size)
> >  {
> >         __le32 *e;
> >         u32 bprt;
> >         u16 rsize =3D t ? le16_to_cpu(t->size) : 0;
> >
> > +       if (rsize < esize)
> > +               return NULL;
>
> There is a special scene here.
> 1) In label check_dirty_page_table, "while ((dp =3D enum_rstbl(dptbl,
> dp)))" thinks
> rsize is the size of DIR_PAGE_ENTRY_32 (esize1)
> 2) In label end_conv_1, "while ((dp =3D enum_rstbl(dptbl, dp)))" thinks
> the same rsize
> is the size of DIR_PAGE_ENTRY (esize2)
>
> it seems that =E2=80=9Cesize2 + 4 =3D esize1=E2=80=9D. So if rsize >=3D e=
size1, also rsize
> >=3D esize2.
>
> > +
> >         if (!c) {
> >                 if (!t || !t->total)
> >                         return NULL;
> > @@ -626,6 +629,8 @@ static inline void *enum_rstbl(struct RESTART_TABLE=
 *t, void *c)
> >         /* Loop until we hit the first one allocated, or the end of the=
 list. */
> >         for (bprt =3D bytes_per_rt(t); PtrOffset(t, e) < bprt;
> >              e =3D Add2Ptr(e, rsize)) {
> > +               if (PtrOffset(t, Add2Ptr(e, esize)) > bprt)
> > +                       return NULL;
> >                 if (*e =3D=3D RESTART_ENTRY_ALLOCATED_LE)
> >                         return e;
> >         }
> > @@ -641,7 +646,7 @@ static inline struct DIR_PAGE_ENTRY *find_dp(struct=
 RESTART_TABLE *dptbl,
> >         __le32 ta =3D cpu_to_le32(target_attr);
> >         struct DIR_PAGE_ENTRY *dp =3D NULL;
> >
> > -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> > +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
> >                 u64 dp_vcn =3D le64_to_cpu(dp->vcn);
> >
> >                 if (dp->target_attr =3D=3D ta && vcn >=3D dp_vcn &&
> > @@ -2950,7 +2955,7 @@ static struct OpenAttr *find_loaded_attr(struct n=
tfs_log *log,
> >  {
> >         struct OPEN_ATTR_ENRTY *oe =3D NULL;
> >
> > -       while ((oe =3D enum_rstbl(log->open_attr_tbl, oe))) {
> > +       while ((oe =3D enum_rstbl(log->open_attr_tbl, oe, sizeof(*oe)))=
) {
> >                 struct OpenAttr *op_attr;
> >
> >                 if (ino_get(&oe->ref) !=3D rno)
> > @@ -4182,7 +4187,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >                 goto end_conv_1;
> >
> >         dp =3D NULL;
> > -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> > +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
>
> The code should be modified to
> "while ((dp =3D enum_rstbl(dptbl, dp, sizeof(struct DIR_PAGE_ENTRY_32))))=
".
>
>
> >                 struct DIR_PAGE_ENTRY_32 *dp0 =3D (struct DIR_PAGE_ENTR=
Y_32 *)dp;
> >                 // NOTE: Danger. Check for of boundary.
> >                 memmove(&dp->vcn, &dp0->vcn_low,
> > @@ -4202,10 +4207,10 @@ int log_replay(struct ntfs_inode *ni, bool *ini=
tialized)
> >                 goto trace_dp_table;
> >
> >         dp =3D NULL;
> > -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> > +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
> >                 struct DIR_PAGE_ENTRY *next =3D dp;
> >
> > -               while ((next =3D enum_rstbl(dptbl, next))) {
> > +               while ((next =3D enum_rstbl(dptbl, next, sizeof(*next))=
)) {
> >                         if (next->target_attr =3D=3D dp->target_attr &&
> >                             next->vcn =3D=3D dp->vcn) {
> >                                 if (le64_to_cpu(next->oldest_lsn) <
> > @@ -4290,7 +4295,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >
> >         /* Clear all of the Attr pointers. */
> >         oe =3D NULL;
> > -       while ((oe =3D enum_rstbl(oatbl, oe))) {
> > +       while ((oe =3D enum_rstbl(oatbl, oe, sizeof(*oe)))) {

Same problem here. There are two possible values for entry size:
1) SIZEOF_OPENATTRIBUTEENTRY0
2) sizeof(struct OPEN_ATTR_ENRTY)

Hi, Konstantin,
Could you please take some time to review this patch?

Thanks,
LL

> >                 if (!rst->major_ver) {
> >                         struct OPEN_ATTR_ENRTY_32 oe0;
> >
> > @@ -4507,7 +4512,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >                         u64 lcn_e =3D lcn0 + le64_to_cpu(r->len) - 1;
> >
> >                         dp =3D NULL;
> > -                       while ((dp =3D enum_rstbl(dptbl, dp))) {
> > +                       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp=
)))) {
> >                                 u32 j;
> >
> >                                 t32 =3D le32_to_cpu(dp->lcns_follow);
> > @@ -4640,14 +4645,14 @@ int log_replay(struct ntfs_inode *ni, bool *ini=
tialized)
> >          * the lowest lsn, and return it as the Redo lsn.
> >          */
> >         dp =3D NULL;
> > -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> > +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
> >                 t64 =3D le64_to_cpu(dp->oldest_lsn);
> >                 if (t64 && t64 < rlsn)
> >                         rlsn =3D t64;
> >         }
> >
> >         tr =3D NULL;
> > -       while ((tr =3D enum_rstbl(trtbl, tr))) {
> > +       while ((tr =3D enum_rstbl(trtbl, tr, sizeof(*tr)))) {
> >                 t64 =3D le64_to_cpu(tr->first_lsn);
> >                 if (t64 && t64 < rlsn)
> >                         rlsn =3D t64;
> > @@ -4668,7 +4673,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >         oe =3D NULL;
> >  next_open_attribute:
> >
> > -       oe =3D enum_rstbl(oatbl, oe);
> > +       oe =3D enum_rstbl(oatbl, oe, sizeof(*oe));
> >         if (!oe) {
> >                 err =3D 0;
> >                 dp =3D NULL;
> > @@ -4770,7 +4775,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >          * Mapping that we have, and insert it into the appropriate run=
.
> >          */
> >  next_dirty_page:
> > -       dp =3D enum_rstbl(dptbl, dp);
> > +       dp =3D enum_rstbl(dptbl, dp, sizeof(*dp));
> >         if (!dp)
> >                 goto do_redo_1;
> >
> > @@ -4968,7 +4973,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >         /* Scan Transaction Table. */
> >         tr =3D NULL;
> >  transaction_table_next:
> > -       tr =3D enum_rstbl(trtbl, tr);
> > +       tr =3D enum_rstbl(trtbl, tr, sizeof(*tr));
> >         if (!tr)
> >                 goto undo_action_done;
> >
> > @@ -5142,7 +5147,7 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
> >          * the open attributes.
> >          */
> >         oe =3D NULL;
> > -       while ((oe =3D enum_rstbl(oatbl, oe))) {
> > +       while ((oe =3D enum_rstbl(oatbl, oe, sizeof(*oe)))) {
> >                 rno =3D ino_get(&oe->ref);
> >
> >                 if (oe->is_attr_name =3D=3D 1) {
> > --
> > 2.34.1
> >
