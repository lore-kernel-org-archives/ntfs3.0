Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33B1C5F27
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 23:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259077; cv=none; b=NBfh/HUC0ZUmoylUDmR2S2DpfNJb3+V5VA9BxrrJzPIy334TLPaF/owkM0ANyDhzuSKNvmuILEnHFFSUN5V95i18zdCzCYKDrdwrZpqu3zd3IBirn8Ka442GBGW6+TltXDDrTNSweilEPL9xpjUy4/U1INH9pyjj9kILonikpYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259077; c=relaxed/simple;
	bh=KqGn8ILr8rivUMjbzc6Yupu72XeCvMJgyPbmPOCj0EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNpWN3SQo9z1/pQek2pB9ZIjprxIANUFIi9RnIKhLBt3WI3JM+xIAxq2airMyqDrVio1tGA7R+/fRd9yztbdiC/MvdrYKw7yZrfWmlYAuN/CFF6ZhcFFm9uHQ1TswzyJMyOh9sBPk4AC3GwEYVllfGlY8sDTVRhrsoy0Unc3D80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNsrka6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNsrka6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB881F000E9
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782259074;
	bh=vo3jkQBWmueCqXflda8hT63tzPuxvWggLYs1HwSrVm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TNsrka6jYQMLueD/PdSasDs+OjVGkeRSLwKwpfhI7Ix02RkrecnNvRB2Nhyi0eicc
	 NiY9OQO6xlDnlj2Z3HsYdZBLqRAJ8/cA1Fjd3YOmJAlv7+KL850tbn2Vi0rmiNog2O
	 dHpCe9cDf6OMbjE3pPD+XkTxyBIRJkfsR5LJZ9VXiZUPWNSi0ykS52jrP2QKLtzzXF
	 k48+AlWo/FsLD3jxA2JOLBh1lSJRhd3wLl6p8zumHUcrysJGzu4tAHJz1P9uBGniuY
	 kSrEJNzPNHQ7E17CWo2tM8WOPrXeIhG8su2u3MVTkx1I7QOdrwvNQyl69wO5Nua3jz
	 j7lfsBCz1ODXg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso750601a12.0
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 16:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ907uIruyIjfRdC2n5le8EMidrhY9S0RxzhLsXSOlGqYdZFo2lLhp259dlzEQgRleItOWob5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRzQ7phwjHHX/Z+NhirdCICdfJe8b8zMAsLYQQoWIsobTiHdRI
	dTbm13pf42ITZeqz5AVn2Hf+1zvuonuRLrNlmZG3NF0TCIVuhaTBE/N4ncU1semUsyTTBsANGlB
	YyUOYPMYGTSmLCPnynmvEVArteDTXKeE=
X-Received: by 2002:a17:907:db18:b0:c0d:a1e4:882a with SMTP id
 a640c23a62f3a-c119de5e576mr32644966b.5.1782259073275; Tue, 23 Jun 2026
 16:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623135208.1812933-1-hch@lst.de> <20260623135208.1812933-2-hch@lst.de>
In-Reply-To: <20260623135208.1812933-2-hch@lst.de>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 24 Jun 2026 08:57:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-egHG+EKwpOn1c5drMuuMiv_BNgNRtAZCjscShXwbofA@mail.gmail.com>
X-Gm-Features: AVVi8Cc6T1k2fn50nfPiKDEdqJoYNhysDxZSt3v-_fDgmbnKqkaZpC3l_SiSFfk
Message-ID: <CAKYAXd-egHG+EKwpOn1c5drMuuMiv_BNgNRtAZCjscShXwbofA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iomap: consolidate bio submission
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 10:52=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> Add a iomap_bio_submit_read_endio helper factored out of
> iomap_bio_submit_read to that all ->submit_read implementations for
> iomap_read_ops that use iomap_bio_read_folio_range can shared the
> logic.
>
> Right now that logic is mostly trivial, but already has a bug for XFS
> because the XFS version is too trivial:  file system integrity validation
> needs a workqueue context and thus can't happen from the default iomap
> bi_end_io I/O handler.  Unfortunately the iomap refactoring just before
> fs integrity landed moved code around here and the call go misplaced,
> meaning it never got called.  The PI information still is verified by
> the block layer, but the offloading is less efficient (and the future
> userspace interface can't get at it).
>
> Fixes: 0b10a370529c ("iomap: support T10 protection information")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
for ntfs, exfat part.
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
