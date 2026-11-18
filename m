Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024254;
	b=eR7480C4xsLfLjXKfxteW5bxf8WPFMEmihthBbjTlNB+vjFyKZPFuKVa0Ja+pxNcq4b6
	 7zEhUxli9Qan5ABtpDw/rue57VZ9C/bMsYPqfErlj403DlkHiiZ1h2fBJ/ZGxtrx46Y8l
	 FAHEM9Au58fJ/4qrPHgPB+A0YFnCiaAhcnE12gF491T2GMuikUv+hMmoGCKa+tagZANmL
	 /LpozBSpsevBvU4JHSH9tqHNOJP5vr1N9xbngIDfAnKPtyL8FqdR6aVoCQKhNwobXmYLQ
	 kjcBkYEw+cMooediizElzfaiH+hp+h6AtTSIjk8QihLK76Y7F6hkj80k9vU1mrKvaPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
	b=NApK6H64N17eApgsW0rPL2nazhWa2eNqvpQCVCXuMyr/TDMlJDf1jZQC2AuCP7E47yuE
	 AqX9FQsyvVP9HNLHb4wxivHGZ04cC4Hq8xTMxi8osu51SyJqywxuRe3hwL15Qwj7RZjNG
	 OQtXQB4zHqHeoBllHcPkAbx6m/6UxyI8x5LItEq2FvCeV2ITawLfx3LH6T+rD/8u0QXD/
	 JI4Q5J9c5zfgISxGYO5aqSBZomRASLsyz6Ry20t4oO1giB6QRKDtcwaq5d4+kqydBVhqg
	 SHAr7GSOL32Gv3WB+e+Ck/JhWCSz5CczUJJA2g6fMMfAIZhWMpB2l7rdMhSND7/wSHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEkutrt2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A660A260B
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 17:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17A660A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEkutrt2
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so1993419a12.0
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 09:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024252; cv=none;
        d=google.com; s=arc-20260327;
        b=b8DJdDOeE0okD2RS0p00MaYGCr+EvHiP1m0nnG9es98FKk32EvYvpXp2ARmDg3inLC
         YBtmxLDQy3jOr0bxe3E049jUq24WsMjJPMbMa9e/VqGAH5WhnqUBDqYseubPecp5Vc4p
         cK7Xy50e2DnAuIaPbuonEJIDeKJUgs7lw8FbOYmn7EwZguk39tgE2n5vRO82mS3HmSi9
         I+TfwaEXHzZyBMH4kapyU+M+sK7iVwH1g3h+qV7mMbXS3D4IPc/b1YeUoCkksweORHId
         pTgN6Dsujz5BaKBBqAn21hkXS/wjR1yg55Wb8e1Xt63z14LwXznYUSP5Kcl/CNMh2B6U
         xqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        fh=l7FrJ3oIECpW/KvEepZ1jnoZolkH/b/zWPqzYi2CEI8=;
        b=GkElGN7Zbgh/5Sm2zStkY0Te0sPit0wO8FTMmJiTf/AGsryoVO44nrhTEneEaF83Mu
         o0UMJbWJIPD/PaT/4R5QTHyOWP0MNY73sEvLpOBAWvIPRlj3DNDHht9IcPg+RI008Rw3
         YJyV+1hWMuIzegbiLYVDEr9x0bBt3vcKprhhCFP1+B/x5NFt/35gkuiIDRmb2QDkq7fK
         RU5GFID7O1Yj4Ayy+DTPubjTbLIEb7Gjyj/Dr1fFndVVlE2K0DQlXUiQwc5WVfTRYDHD
         dVnC3kj0uvRV7Iac2PiRxhLS53LFZjo4CygJk6sGcwFLDb/x4fK78xxusJcU0yH2qZsk
         aZpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024252; x=1795629052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        b=mEkutrt2N983bbRJhg46nNatqRwYp3WvYXUeew0uLu3X9aWe3cyDxNeqS8FFTmf2QU
         l1tlVrlQOBz9zzXFDvWPpv+X3wuVDEt1VTe8QqzZPH0w7h1PT6/15KhNc51RSY8typ8z
         AgD61Z/BPgbCDIt7dVWP90yPonCqH4vnBjVEY0lcJ+n4gklq0RmejBLhvBon4dx0oX0d
         rM6LlHTC3wW/ti+m5idvwb25PIrs1FbaHsXoaOqYjskTgL8SHLVBHJzu3cWExEvn+kuh
         hgHK5H92k6Nce9rgzAveVUVl66DkVaRvfScvP1VNWZ/1q6aQRPm9EKw2JiQ+LA6yX4rm
         VGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024252; x=1795629052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        b=O+JUyLqHwQFn3G7kuzJ2NF0GUi+qCArhCJFsujMJn3yfQZVIa388HQvGeMG39LDzp/
         XJ+FupW+HQuFyro4EWwkdk8LBrfmz2eOjHAhFwsVtxJPiQcwF1sTabo+OjQI733suZo8
         N2K9gdI2dcAHiWI51XYaHxC1+NgtIQTiXu+Q9WFXXyZTuS1rvXd1MtBfTj24BQW48uMB
         AeC9c5xHgbgkR0CVX7iecvMzzFmYMqmgGOqhMFuVNpAGGRwws4bBNyzV/KWR9V5jiWXr
         nbZiQP1GB88SY+pMK6CHp7xhvH8n0NUWwMADI7XYhYpW2F/lK2SOTrhRTsAp0GCdNEPh
         yXPA==
X-Forwarded-Encrypted: i=1; AL+hErGNLoBO4vooCOEy261ykVpcuLrKPPw4WguEKKxSEFBWQR4teZ+jyhmEikgkxnRON94W/0s3TA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yDio7lDJKXHf5kRuJjWJrjNVaS1b7Q3nOjn4/M4mCc09OstRg
	3lUkbk3a+L4ql1sygvxc5XirzTVOyAlorrPDOSXWyi+3ztEKqWryWmD/s+W4N0H0iQYXOAW2x9U
	AJ6ICC9BCbk5L8OqZIZJHiZF8B76YcN4=
X-Gm-Gg: AYBFou1aZUKHdeY7aJ5rsZ4D7+9j7KjXFCdeIoTD64DyhuP6LcFvu9mvH18Olx2qSS2
	j+bYI3NIQ4dJj8ZSaBGTaS1KwGG0bwcSTKnIn5goS3/u0bv5Tm1GroJlsSYSz7bJnurQ8/qRa6C
	mNe1c8pVT1JAMFdr91ZXCfgZTfP7Gab9pIKrSiWpB3AtFj8ile7Ajhp2CG5kbKziW/RdCiq0RVS
	ZBcyQOhF1PtT3yr4u/04n2zyTyjV5zdE2KtktdL23stfQ+5MI4dhJAzMvGipdoeE80dnYKKNAo1
	SJhPJNysp8P8o8Cduensg1ligSYoSwVLitVGeQ0HDFepdcTl/9c70V2qFonR5ClbO399ncGgSBP
	8BLe62pozJp1q7sIFRBz6AMmeWxp4RSUxA+0rpFnGzt71qCEpLRMQgMPK82HfZoq8fMP7H/LxhL
	+Sv03GjBQ5FJW/0gE=
X-Received: by 2002:a05:6402:5411:b0:6b7:df0c:18d0 with SMTP id
 4fb4d7f45d1cf-6b8a2e6d881mr1966295a12.11.1795024252167; Wed, 18 Nov 2026
 09:50:52 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261118142613.be3r3s6kobkkxnz4@pali>
 <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com> <20261118151605.lqtn5fz423kuswk5@pali>
 <DMYHPLWKPSH3.MUM1IIZZIWNR@gmail.com> <CAOQ4uxiwpdC-fKkqS5kiZ515q9MenC0jX4USV1idN7h2njx45Q@mail.gmail.com>
 <7126bdd0ff59e9ea9bc58702af2ecb38096330e8.camel@kernel.org>
In-Reply-To: <7126bdd0ff59e9ea9bc58702af2ecb38096330e8.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:50:40 +0100
X-Gm-Features: AclHuK8-cETfcc5mQcfuFgReFzNL3uUqtJJFv8XHOum7KdV27M9jJ90gtN64MvU
Message-ID: <CAOQ4uxidYWNVmoPgxKrxesXTxpMB-JqUZx9p6xXZWD5m+hJ+JA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
To: Jeff Layton <jlayton@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2026-11-18 at 18:28 +0100, Amir Goldstein wrote:
...
> > Guys,
> >
> > Let's take a step back.
> >
> > If this discussion is proving anything is that the btime/ptime
> > duality is a big headache and it's going to be a source of confusion to=
 users
> > even if we come up with some smart pants consistent semantics.
> >
> > As Jeff writes, I think we should consider making btime mutable
> > be a per-fs choice and not an API limitation.
> >
> > A filesystem can even decide to store both the forensics btime
> > alongside the user settable crtime.
> >
> > There are some precedents in xfs with settable UUID which is
> > a different field then the origin UUID from mkfs.
> >
> > Fs that have immutable btime have a few choices:
> > 1. Keep it immutable
> > 2. Start making it muttbale (like the Win fs)
> > 3. Start making the user visible btime (STATX_BTIME) mutable
> >     but keep the forensics btime on-disk for, well, forensics
> >
> > If btime becomes settable via options 2 or 3, this could require
> > admin opt-in (e.g. tune2fs -O crtime).
> >
> > With option 3 the crtime feature would be ROCOMPAT
> > With option 2, it could probably be COMPAT. Maybe.
> >
> > If we accept this story and the major fs maintainers are
> > in agreement with this plan, then I think the missing piece
> > is making the "settable mask" visible to users via the new API.
> >
> > IOW, we need to somehow export FS_XFLAG_RDONLY_MASK
> > to userspace instead of only exporting the supported mask.
> > And then with the addition of xflags_mask, we could also
> > -EINVAL on users trying to set readonly flags/values.
> >
> > Perhaps a single xflags_settable_mask is enough.
> >
> > For file_setattr(), xflags_mask is anyway a set-those mask.
> > For file_getattr(), does it matter if we get an answer
> > Filesystem does not support casefold on this file
> > OR
> > Filesystem does not have casefold on this file and
> > you cannot set casefold on this file
> >
> > It's kind of the same, isn't it?
> >
> > What do you say?
> >
> > Shall we drop PTIME in favor of "is BTIME settable?" API?
> > Leaving STATX_BTIME exactly as is.
> >
> >
>
> +1
>
> I think this is the better approach.
>
> Looking over some of the earlier discussions around this since 2010
> (!?!): I think some of the XFS devs objected to making it settable for
> forensic reasons. So, on XFS you might need to rev the on-disk format
> if you want to do it there to preserve the "historical" btime, and
> maybe some xfs userland work to make it accessible for forensics.

XFS_IOC_FSBULKSTAT will likely continue to publish the original bs_btime.
if a mutable field is added it could be published as bs_crtime.

For forensics this should be enough.

>
> For the record, the statx manpage documents the btime field very
> sparsely:
>
>        stx_btime
>               The file's creation timestamp.
>
> There is no documented guarantee that this will be immutable, AFAICT.

Yes, and it really isn't immutable for cifs already.
It's just that we don't have a standard API to change it.

Thanks,
Amir.
