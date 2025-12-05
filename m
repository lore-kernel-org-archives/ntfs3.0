Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536432E413
	for <ntfs3@lists.linux.dev>; Fri,  5 Dec 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925031; cv=none; b=Bo7dHGCZgCRFi1iWyEgML5AIhQyPA4bNJVpnw+sPSHsOso6RPMdS6KlEvxnjIFy7Nlryj1cxBqmCMxrmYmgl48w6R4J40dMRgdV5JTTugciSlUqBRgKi7wG3wQq5SF2XQoclQ4Ojce6k2Bdz3Vo2zWFGcHFRb5V6gUvDuglbU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925031; c=relaxed/simple;
	bh=kI/BmZknfJEnMAoux6UNqNWZZavATt2Ci9CEQ2NFztc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/c6ViIBBFNnXO8FKldD8ui6t9gMBtQLJiBLpg9BhWCeM+WxyIYjFsDe4HuYXzM+hsdLtP2/LLlRyXPN5FZHRLMWCvXyxDTOMBokyHi6bXnm1QWb0nv9CH0ksb5Fau1rxP9PDXAkyu8aTG0xkD5E6zdHn4e9A0nujUZO3SYgoAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xlnz3tOy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xlnz3tOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764925022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kI/BmZknfJEnMAoux6UNqNWZZavATt2Ci9CEQ2NFztc=;
	b=Xlnz3tOyAvnzTEu5P5xXFQGUu8B4tZ+K3kVdrmQIrDEjMbzfP+WZ62DQRlKWZ8k9jgt13A
	GBW/4PrNYEaaS8eaA95OMcWzNb4bnB9Nwrd7gegUFJgQsh3mcB9kUT5Cmdh9j9z0MzdgB9
	8gR0B9N1u/1ZU83koUKjuA/d2oxwSxw=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-WU1JhwCmNryuZI2B1sywVQ-1; Fri, 05 Dec 2025 03:55:51 -0500
X-MC-Unique: WU1JhwCmNryuZI2B1sywVQ-1
X-Mimecast-MFC-AGG-ID: WU1JhwCmNryuZI2B1sywVQ_1764924951
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64203afd866so3081118d50.0
        for <ntfs3@lists.linux.dev>; Fri, 05 Dec 2025 00:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764924951; x=1765529751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kI/BmZknfJEnMAoux6UNqNWZZavATt2Ci9CEQ2NFztc=;
        b=QXaL5eZ/+JAp5LECMVA0hNn41dGp1wyklaw+gdNYSi/b7Dx8cmpn1V/NiMc+0S8B8S
         +231jTQlB5WeprspPb9HOs7tQPByoF9Xl1Oga9x+PHdB5M7vWP6duECmkfrL8Xgr6+QO
         Ip0Yz7Gs8wO00W79+HfwHsMR4jOwvJB9/U0+y8OgIs981XWQ4/pVksUl1DsIr7DYryiv
         JConR3yk1AIeMdzyvoxsQ5mki8tmbDQCbKhtaw8uqOhgIKt0C20RcG6xFHzoNXm/R/Qg
         gd6rxqpDP36vcmn3IHd9pb0eiTR++NrEyOz2q+lm2nFzlsr2+tE14qnQeSy9+ajmMttr
         0fYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqxaKYZXNxxTDm+1+OVTKSF3J8wBtbNUpsGBwG1CZwmYpbiywwI+lr/wRaLbz484MljwPA4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGgVRfIACHCSCHAfHG52lUW869g1+88L34bWznIbU5XHwUMxpx
	GK6ghIgTp3x/RdxvQanir/HpSOMrTVsQGr5AdpjTB0j9l5h8ohc75A35o+Mo1Ga40SojQ9UficZ
	2rBM/9BeYopQVdVyZHIAVM+cHQ/QRJu2XRP/2nuf4HQpgp8sWdsuoEfkpe/V0ZhZgc0zWJj5bWG
	1zo37jqG4rNX+Xj2mmY6XpTsNAbA2XCTc=
X-Gm-Gg: ASbGncsECPqWCMe9TRYIPSDj6pb0SpKNjrp5fOC1CBqlff4hJTxYoHQKuFJoQOgIiEM
	oCWM+UsneDHXXiLi7zyV19h8bWJ29wJhShdnrA9BKsv2oX3UfbnyGKfRXWE6qvNeLX3S+65o128
	S0RmrrBGAXNHec1o6F2+a9elmekyaXo6VaRozkAXlUtx+9fqBGB/IGiuScIP7p+UH4
X-Received: by 2002:a05:690e:11c7:b0:63f:a876:ae58 with SMTP id 956f58d0204a3-6443d6e683bmr5035623d50.9.1764924951053;
        Fri, 05 Dec 2025 00:55:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH06t5ScTL3/41cXQ9/KNdNBUKke6bRZRDIIsDOJI/s90MmtU+OELXMsXOy8CKQ41Y5BIrK12B8cMtyqGUq3aU=
X-Received: by 2002:a05:690e:11c7:b0:63f:a876:ae58 with SMTP id
 956f58d0204a3-6443d6e683bmr5035612d50.9.1764924950709; Fri, 05 Dec 2025
 00:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn>
 <20251128083219.2332407-7-zhangshida@kylinos.cn> <CANubcdUtncH7OxYg0+4ax0v9OmbuV337AM5DQHOpsBVa-A1cbA@mail.gmail.com>
 <CAHc6FU5DAhrRKyYjuZ+qF84rCsUDiPo3iPoZ67NvN-pbunJH4A@mail.gmail.com>
 <CAHc6FU57xqs1CTSOd-oho_m52aCTorRVJQKKyVAGJ=rbfh5VxQ@mail.gmail.com> <CANubcdVuRNfygyGwnXQpsb2GsHy4=yrzcLC06paUbAMS60+qyA@mail.gmail.com>
In-Reply-To: <CANubcdVuRNfygyGwnXQpsb2GsHy4=yrzcLC06paUbAMS60+qyA@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 5 Dec 2025 09:55:39 +0100
X-Gm-Features: AWmQ_bn5nYIfNoOVXdPvu9TIQvwvBK4TRvGDwrtrakvgOSxNJSsbjWkIZFSXMho
Message-ID: <CAHc6FU4G+5QnSgXoMN726DOTF9R-d88-CrfYMof0kME6P_o-7w@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] gfs2: Replace the repetitive bio chaining code patterns
To: Stephen Zhang <starzhangzsd@gmail.com>
Cc: Johannes.Thumshirn@wdc.com, hch@infradead.org, ming.lei@redhat.com, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, linux-block@vger.kernel.org, 
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org, 
	gfs2@lists.linux.dev, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zhangshida@kylinos.cn
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PxyeCSYJcRx32tv5pWwm5BR-7cIgnVAbH4eJBPlSIFo_1764924951
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 8:46=E2=80=AFAM Stephen Zhang <starzhangzsd@gmail.co=
m> wrote:
> Andreas Gruenbacher <agruenba@redhat.com> =E4=BA=8E2025=E5=B9=B412=E6=9C=
=884=E6=97=A5=E5=91=A8=E5=9B=9B 17:37=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Mon, Dec 1, 2025 at 11:31=E2=80=AFAM Andreas Gruenbacher <agruenba@r=
edhat.com> wrote:
> > > On Sat, Nov 29, 2025 at 3:48=E2=80=AFAM Stephen Zhang <starzhangzsd@g=
mail.com> wrote:
> > > > This one should also be dropped because the 'prev' and 'new' are in
> > > > the wrong order.
> > >
> > > Ouch. Thanks for pointing this out.
> >
> > Linus has merged the fix for this bug now, so this patch can be
> > updated / re-added.
> >
>
> Thank you for the update. I'm not clear on what specifically has been
> merged or how to verify it.
> Could you please clarify which fix was merged,

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D8a157e0a0aa5
"gfs2: Fix use of bio_chain"


> and if I should now resubmit the cleanup patches?
>
> Thanks,
> Shida
>
> > Thanks,
> > Andreas
> >
>

