Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D925A4A0C
	for <ntfs3@lists.linux.dev>; Tue,  9 Jul 2024 03:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720496900; cv=none; b=twI6TXoBaxYxIml7k66k1ffx23/OIn3XYeDsK4Cu90z/4mF/t3XRBw0CQ4R6Pq53NCNCk/xVuLyMH4SA8CwBV57ZpLzGqqVrW0uQIQmxBPLqRrEGcsFuQo/RYlIv8t0Kw5bQhFTfb7gGttj/BNQLXXf77y16SGyBYxUBCsCLSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720496900; c=relaxed/simple;
	bh=TnVpMrL125bKPIFET6ipPT0d2YnvfAPOKRnz7TfQyaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dC2PzI56ZtmEseyFaQbYl++xQnRUmiyZp5f8pkxzr14YOMI6uDb6JANzZbJgT7jilyh+7KfDbehg56mPtSGeJ0GDAznNidAROMgSNFJ9Jco/1m15Y/TakIsFzrTSjZ2cT0frqrYzK35yhhXq0XAj/XGHiyZXwM7drK8nUPHD/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBpAZBdL; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBpAZBdL"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e03a6196223so5119065276.3
        for <ntfs3@lists.linux.dev>; Mon, 08 Jul 2024 20:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720496898; x=1721101698; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPbXSBhKcfrC9SaQvXbw2tN+rgjNGjHgSYkWEhJQOK8=;
        b=RBpAZBdLGLIwTUaLH3Dm7BXLe6jIfmKKa9zVRYCrUPG1UyCqp9WZJL/vjYoNXiOcBS
         OdqTvmkq3RaxjdihAY5vS5OMh9Wq7ErIkivMGNJV4g1cGK9NTzKQTU+o8ozsaLNZoTnq
         +/8WNyTmtdT/C+c9Aat+/XCUP2JVkD3xq+uRsWakTuNdxdEZAxaLvG+Jbp4PfRGqXTlB
         OaHOxlQTkcW+GE3gXjxElzZLvNMB1SpyvS8ELZOrgvGWtb8J0e6HeL4NS0xrAAqpGlLA
         Ac9Qlt3Ag2AjuTzuUVUNXylqxi7xfnszUnNwo4TXRwmFTYGGPj/ZchwgEqiMMjUAVI6Y
         s51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720496898; x=1721101698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPbXSBhKcfrC9SaQvXbw2tN+rgjNGjHgSYkWEhJQOK8=;
        b=Jz+RKIlRjPIwljnB/ca8ly/FQLQZprWnZeEpkn47AeqKBpx6I4ZAq2U0weFQMBxdjt
         QEjT9jKYQdnzj8jsFivtBXgVZOUc3BrHWFhNAYbv81UHXa6L+gRE51jmQKjEa5nrL5Va
         vhdAD2yNX4DeiC28nvB2zRJ5iB9MMApV7DBIk+mIsYfTX6enWYYr7vjfIGCQBk8AMKbd
         Sm/pSQAq2r7wI4Fhgpm68HoTDhI91AoJT74FiiFg6y3tNg9Qa2KGxQw8eF478pQp3Swr
         BoQQJyc3Ol+mX3FrDBaMIUDenEWMmZj36yvAXytz/MWvBW6I/pRQBMf/Y7J+rrMS9FkD
         Fd+w==
X-Gm-Message-State: AOJu0YzqS1nc9lXB30uRJihUZGQPLi/7AHsJF0eDsqN/YhoQShuTfh4V
	Zn6c1RaGtWT1FE2K5RgjIoHSnQIubih+6zdyfd00cGhbxlLh5qJXPURc7S6W3QTt3jil5cmNAPA
	JjyTsX/LQa+CPXE+8KAISwRXRrI0=
X-Google-Smtp-Source: AGHT+IHt6yZEFMukniOGrOy/NP7wKG1Eaaw3jnOrPETYZ7sX0WBJGVgpVg0qOocbZoLoncSW49yaX4thedkCINlGIbE=
X-Received: by 2002:a25:ac4e:0:b0:e03:5ecb:9e6 with SMTP id
 3f1490d57ef6-e041b05c163mr1906132276.16.1720496897787; Mon, 08 Jul 2024
 20:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702021659.6583-1-llfamsec@gmail.com>
In-Reply-To: <20240702021659.6583-1-llfamsec@gmail.com>
From: lei lu <llfamsec@gmail.com>
Date: Tue, 9 Jul 2024 11:48:06 +0800
Message-ID: <CAEBF3_ZErWEj3HmfeqY0XPF-aHRjV-tCcNcTrcrFO4Zewu7aGQ@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: Add bounds checking to enum_rstbl()
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 10:17=E2=80=AFAM lei lu <llfamsec@gmail.com> wrote:
>
> Added bounds checking to make sure rsize is not less than the entry
> size and make sure the remaining bytes are large enough to hold an
> entry before accessing in the caller.
>
> Signed-off-by: lei lu <llfamsec@gmail.com>
> ---
>  fs/ntfs3/fslog.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 855519713bf7..75d31bc11567 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -609,12 +609,15 @@ static inline void add_client(struct CLIENT_REC *ca=
, u16 index, __le16 *head)
>         *head =3D cpu_to_le16(index);
>  }
>
> -static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
> +static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c, u16 esi=
ze)
>  {
>         __le32 *e;
>         u32 bprt;
>         u16 rsize =3D t ? le16_to_cpu(t->size) : 0;
>
> +       if (rsize < esize)
> +               return NULL;

There is a special scene here.
1) In label check_dirty_page_table, "while ((dp =3D enum_rstbl(dptbl,
dp)))" thinks
rsize is the size of DIR_PAGE_ENTRY_32 (esize1)
2) In label end_conv_1, "while ((dp =3D enum_rstbl(dptbl, dp)))" thinks
the same rsize
is the size of DIR_PAGE_ENTRY (esize2)

it seems that =E2=80=9Cesize2 + 4 =3D esize1=E2=80=9D. So if rsize >=3D esi=
ze1, also rsize
>=3D esize2.

> +
>         if (!c) {
>                 if (!t || !t->total)
>                         return NULL;
> @@ -626,6 +629,8 @@ static inline void *enum_rstbl(struct RESTART_TABLE *=
t, void *c)
>         /* Loop until we hit the first one allocated, or the end of the l=
ist. */
>         for (bprt =3D bytes_per_rt(t); PtrOffset(t, e) < bprt;
>              e =3D Add2Ptr(e, rsize)) {
> +               if (PtrOffset(t, Add2Ptr(e, esize)) > bprt)
> +                       return NULL;
>                 if (*e =3D=3D RESTART_ENTRY_ALLOCATED_LE)
>                         return e;
>         }
> @@ -641,7 +646,7 @@ static inline struct DIR_PAGE_ENTRY *find_dp(struct R=
ESTART_TABLE *dptbl,
>         __le32 ta =3D cpu_to_le32(target_attr);
>         struct DIR_PAGE_ENTRY *dp =3D NULL;
>
> -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
>                 u64 dp_vcn =3D le64_to_cpu(dp->vcn);
>
>                 if (dp->target_attr =3D=3D ta && vcn >=3D dp_vcn &&
> @@ -2950,7 +2955,7 @@ static struct OpenAttr *find_loaded_attr(struct ntf=
s_log *log,
>  {
>         struct OPEN_ATTR_ENRTY *oe =3D NULL;
>
> -       while ((oe =3D enum_rstbl(log->open_attr_tbl, oe))) {
> +       while ((oe =3D enum_rstbl(log->open_attr_tbl, oe, sizeof(*oe)))) =
{
>                 struct OpenAttr *op_attr;
>
>                 if (ino_get(&oe->ref) !=3D rno)
> @@ -4182,7 +4187,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>                 goto end_conv_1;
>
>         dp =3D NULL;
> -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {

The code should be modified to
"while ((dp =3D enum_rstbl(dptbl, dp, sizeof(struct DIR_PAGE_ENTRY_32))))".


>                 struct DIR_PAGE_ENTRY_32 *dp0 =3D (struct DIR_PAGE_ENTRY_=
32 *)dp;
>                 // NOTE: Danger. Check for of boundary.
>                 memmove(&dp->vcn, &dp0->vcn_low,
> @@ -4202,10 +4207,10 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
>                 goto trace_dp_table;
>
>         dp =3D NULL;
> -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
>                 struct DIR_PAGE_ENTRY *next =3D dp;
>
> -               while ((next =3D enum_rstbl(dptbl, next))) {
> +               while ((next =3D enum_rstbl(dptbl, next, sizeof(*next))))=
 {
>                         if (next->target_attr =3D=3D dp->target_attr &&
>                             next->vcn =3D=3D dp->vcn) {
>                                 if (le64_to_cpu(next->oldest_lsn) <
> @@ -4290,7 +4295,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>
>         /* Clear all of the Attr pointers. */
>         oe =3D NULL;
> -       while ((oe =3D enum_rstbl(oatbl, oe))) {
> +       while ((oe =3D enum_rstbl(oatbl, oe, sizeof(*oe)))) {
>                 if (!rst->major_ver) {
>                         struct OPEN_ATTR_ENRTY_32 oe0;
>
> @@ -4507,7 +4512,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>                         u64 lcn_e =3D lcn0 + le64_to_cpu(r->len) - 1;
>
>                         dp =3D NULL;
> -                       while ((dp =3D enum_rstbl(dptbl, dp))) {
> +                       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp))=
)) {
>                                 u32 j;
>
>                                 t32 =3D le32_to_cpu(dp->lcns_follow);
> @@ -4640,14 +4645,14 @@ int log_replay(struct ntfs_inode *ni, bool *initi=
alized)
>          * the lowest lsn, and return it as the Redo lsn.
>          */
>         dp =3D NULL;
> -       while ((dp =3D enum_rstbl(dptbl, dp))) {
> +       while ((dp =3D enum_rstbl(dptbl, dp, sizeof(*dp)))) {
>                 t64 =3D le64_to_cpu(dp->oldest_lsn);
>                 if (t64 && t64 < rlsn)
>                         rlsn =3D t64;
>         }
>
>         tr =3D NULL;
> -       while ((tr =3D enum_rstbl(trtbl, tr))) {
> +       while ((tr =3D enum_rstbl(trtbl, tr, sizeof(*tr)))) {
>                 t64 =3D le64_to_cpu(tr->first_lsn);
>                 if (t64 && t64 < rlsn)
>                         rlsn =3D t64;
> @@ -4668,7 +4673,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>         oe =3D NULL;
>  next_open_attribute:
>
> -       oe =3D enum_rstbl(oatbl, oe);
> +       oe =3D enum_rstbl(oatbl, oe, sizeof(*oe));
>         if (!oe) {
>                 err =3D 0;
>                 dp =3D NULL;
> @@ -4770,7 +4775,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>          * Mapping that we have, and insert it into the appropriate run.
>          */
>  next_dirty_page:
> -       dp =3D enum_rstbl(dptbl, dp);
> +       dp =3D enum_rstbl(dptbl, dp, sizeof(*dp));
>         if (!dp)
>                 goto do_redo_1;
>
> @@ -4968,7 +4973,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>         /* Scan Transaction Table. */
>         tr =3D NULL;
>  transaction_table_next:
> -       tr =3D enum_rstbl(trtbl, tr);
> +       tr =3D enum_rstbl(trtbl, tr, sizeof(*tr));
>         if (!tr)
>                 goto undo_action_done;
>
> @@ -5142,7 +5147,7 @@ int log_replay(struct ntfs_inode *ni, bool *initial=
ized)
>          * the open attributes.
>          */
>         oe =3D NULL;
> -       while ((oe =3D enum_rstbl(oatbl, oe))) {
> +       while ((oe =3D enum_rstbl(oatbl, oe, sizeof(*oe)))) {
>                 rno =3D ino_get(&oe->ref);
>
>                 if (oe->is_attr_name =3D=3D 1) {
> --
> 2.34.1
>
