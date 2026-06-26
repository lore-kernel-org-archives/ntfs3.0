Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E10282F2C
	for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485495; cv=pass; b=Wmln8EfuR4vJ9EGXndAKBIWkJL0woSo4GYFVHlViidTIfRBmCC/yZe0+oY9l6tLGvTYqWMt1FHgPAVjJky2IXpyW0y3YmvEbrTUnDMqxJkUTCda5GOA3ccOZ5LNdWEOuRlMyAndyuUP4RW70cuYhSgCFtuRhcSxwOWOaF0Sv3kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485495; c=relaxed/simple;
	bh=F/vTTa+gFZE1/PfB4U5xRpdZYv0DcxHltEmaOMRgRKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGRPKdkTbs+GWncm0kaNkoKKU3WBkYAXcMv5GYlMSqH7G2ZTCP7BJnlO/i8kWALr69CgROHu+rsHQE2oTdfNJsPBE+vRpNoPj/c2yfolpkCJ+M57Vq5hIpPGk9+Kv8ZxICuBDR9z7/nNw+VPtlOcmCNCxlTpqwe6uRWe+j+KV40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TE/sSLn9; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TE/sSLn9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46caaa805b2so677523f8f.0
        for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 07:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782485491; cv=none;
        d=google.com; s=arc-20260327;
        b=spOmJsEY0s72Kr72tWSQo2uak0YjJQFXDG3EM7d6fs0SIUAv+8w5A21+A06Fz0ilwb
         y+eOr48uvMHILlKc1MwhoN7/eL0g1E77NWp74RhlZAf+qGnZo6oe0mXV8jEP+ea21p9V
         0EeaPZsFnCwIpM3m6HZCoamYbkioWPf0EVjwswRbf3K7n+piIJyc/x4s0okfePdU8k2R
         seJYO/R4Z6ilyJ+bHAi9TedHp1mneaWV8oNGYRixE2WOavbk6ZDn9qTpzlQ1bWLDjojq
         DVObvJYg1f8NZzXBPmrlhnRDyYPeagZ4Z4hBFqss5DmHo18UCFV/qcI0Ost04qUCw3hG
         9U3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEFu/GsLUdYzJ5HEI3yfKh2VsiakBP97CsT9SHwpvI8=;
        fh=f+X2w/irc+AXWpjv1f3X/34hskqnFkH0AmlPXerYpy4=;
        b=Q/xPi/OlQ3mFKSaRZXoZoRte0N3kalNAqfM5PumxEO0TnHdHMA3swb3pAYEAYy8YeV
         TP+6vEKp9oKcDoQ9/4iP32vAKVlBbNs374NXiZKQbP/imjFDmzYqyFWux/nPgEeQ2Q/d
         kGcTGxKwCN07406rDUIrrRN5tsNdKGlbfjvzJbOlSogVXTLig9BEyWBe/gDOSjaHJy+Y
         p9jXGpypzdpXcXvtALb1VzQMsZLj+clYPMoWo2SY8XuJf/gkKJwgekJpV1uYdfMloam8
         gOkB2E7K8x71NK6GgS8He+QJ6VF6SQxbhqIt7tKHcCcWv5Vs6mUi6vFf6a7/U0FRxyoo
         9GHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782485491; x=1783090291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEFu/GsLUdYzJ5HEI3yfKh2VsiakBP97CsT9SHwpvI8=;
        b=TE/sSLn9rhUsmECMVsJbwYP4y3lNLdSg2+jKJUm7n48Surz1PjGQVbQCoOuHzmncE+
         fZixXoJVekOw4+/crlWnoyCKz6Y62+FxGcAtlbmonJw1xJ6T28PJYP/ETb/vRDTbDKRl
         go5DxYEXe1bWEBRXyEo+AOVLtnp4iBuTBTDY2JWHvfqvj0YjSTmc2nCbP+AJ+HT1e8TJ
         se8pjOq6sl24mH8lZsfM20W4X1CAhU449zXh111Lt6t55m4pv2lPlE67p8Jd2WrnYz4L
         i3/FgFt6ouhrIWstd/YfUGA9HShmNEpXexjwczuolfV5gCad0xsb7/VizkjY991vwPQt
         eDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782485491; x=1783090291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEFu/GsLUdYzJ5HEI3yfKh2VsiakBP97CsT9SHwpvI8=;
        b=hKLU/HVqGBg2ndah2NmzCEu1RPE/XtApvgd2HH8k/dAghghyaSJGRkbsf3DNTsmMW7
         /FxJMVvmibbvezr6up9J6TGeGcg8bLcJvgYvXVRbECb/Omc8PTyA0tcbBkawctCNYOIc
         lg9N0FTA+023m1J15aUylsUCQbKPd1rID9qbPLqwhBqolfyF8N9jXfjS+ax5iYk62iDF
         415gSft4ZGRuA4J1Af3mLj1DpRySOsvtbiHIO4xSz5csFB5JEXAWJkskLgDvUnC9Gbmi
         7WP4tWRwSKzpL31dCtoaW/eouoUYWaexqGMzVFFCdw0/8cXf7LPhitjDWzHDY5l3buRn
         EoWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbBYkyH4OmPE3p5yBI1yZuPfW8Gwi0mZFJkDETwp4hIzVeiFG+ULEej+QLY3iVnCGV8a7XCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws2pJuyj9tzNSvaV5edMeKFVfVPBCITRvXP5MQpYtgD19MFfZW
	wf3YXtDvPyinmF4+OYZ5rcueP+wXyvOyAmzWlo5GzjTAYV3iqr06kGBQtLJpZRP0gMgD3QNTQrz
	q9sJFISSkQ6nM8hS/fncfPCTuUlVcQpM=
X-Gm-Gg: AfdE7cmqmtmOXhJNQn1uOPNf58zjJSvCLqBDm12OpLSFH80+ex1ATKX1fhqzpYb5DjC
	aQCe9ejTtsHCsqp6so3MPPfprXNIun8mvvORaIArCBLOLnNcz2bqBIcUXzbHc2sCgzD35iqvr/I
	Xs/MIa2fCtdk7AD4muZ3GcVew38oXFV6SSmh7J/wV4P8RrJrsDY8//w31pkxpeF6LBISCQFBUJA
	2U/aveVDaUzjy/kyeol5w9py0Se843p8u5G66dS6ve5eiSLL1P7FXLZB46wXtmSDGTwRVx+5Nsv
	jX3q3F5ppFCO5YiYgHxKJu7ldiTn4nXh9Yz//fsWpLxXQsk7o0HQb5MVSQNqDmo=
X-Received: by 2002:a05:6000:4b1b:b0:469:3037:37d6 with SMTP id
 ffacd0b85a97d-46dbed361c5mr11889497f8f.2.1782485490511; Fri, 26 Jun 2026
 07:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625120803.2462291-1-hch@lst.de> <20260625120803.2462291-3-hch@lst.de>
 <20260625174758.GE6078@frogsfrogsfrogs> <CAJnrk1YFeirQ4g7qcVsda-8qPLeAtoiyW6ZBuJb2qDsGpxi-tg@mail.gmail.com>
 <20260626043319.GC8078@lst.de> <20260626061637.GA10337@lst.de>
In-Reply-To: <20260626061637.GA10337@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 26 Jun 2026 07:51:18 -0700
X-Gm-Features: AVVi8CdX3YEuehBm4GMevCFp3lRCSJHGYeePQFfRezoeBrVyeHAViWscCz8GoDk
Message-ID: <CAJnrk1aJbQ0092f=wcTu8v62rdxZ7-NxyF-1vp2e42oSEo6LBA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Christian Brauner <brauner@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 11:16=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
>
> On Fri, Jun 26, 2026 at 06:33:19AM +0200, Christoph Hellwig wrote:
> > On Thu, Jun 25, 2026 at 11:32:40AM -0700, Joanne Koong wrote:
> > > Yes, that works. I think that's a good idea. fuse only needs
> > > submit_read logic for readahead. The change would just be:
> >
> > A nice, I'll fold that in.
>
> Btw, can I get a signoff from you for this?  It looks like splitting
> this into a separate patch actually works better.  If you have a
> preferred commit log I'd take that as well instead of mine.
>
> This is what I'm currently testing:
>
> https://git.infradead.org/?p=3Dusers/hch/misc.git;a=3Dshortlog;h=3Drefs/h=
eads/iomap-read-submit-bio

The submit_read logic is only needed for readahead. We can remove the

+       if (data.ia)
+               fuse_send_readpages(data.ia, data.file, data.nr_bytes,
+                                   data.fc->async_read);

change to fuse_read_folio().

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne
