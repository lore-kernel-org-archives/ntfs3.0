Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930F3451CF
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 22:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.135.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059393; cv=pass; b=S02NjT6PRVN5SVANDJoo4ZFAo7kaon7x9VoR6H33tk4RAxOXdYCl+zw6/QRSqmE00xblJUDtbiTBaFAOWpcM11jdt7rbtHwR4nwlkisDZmLzlOjFuzkW6ljSlYWYNKzgrB/BxTB0gRN2fkjHdfw/SfHXD5BoVmDFotCrsen1vSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059393; c=relaxed/simple;
	bh=pDtBt1IUvockGTD9sAkNQUVYnZ2xavhQA7l7ZDVpiZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzwjqhoTBS3aFWBT9+cR1snhvxhb6+t+xpLK2LAjeG20+MhhAStp7H+0zFTveBC3ke06te23eWBhGRs4YEOFvmiLQSdSo5d123Xm5RGrZ7M+J2yPzhdS3KQTVp3xCkHKttw2MHWOYHxh2AEV35QLpPD7CkwI1Cq99yshQnR17LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nsrj0T6H; arc=pass smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nsrj0T6H"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PMg6jm1355312
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=pDtB
	t1IUvockGTD9sAkNQUVYnZ2xavhQA7l7ZDVpiZY=; b=nsrj0T6HCt6fbehQN3aM
	mCW3EK4O0E/cM/Qy7KmXDptiP9Si3inQNFYIQScWj2MSnIVqk1bh6Ulf2iHVeiyG
	jOkKvI97CiUm8nbFeOE8ZSU6uEg9o21CwOqyT0zDJZaulMCy+81avk/zmfLBGPpH
	8zS2au6AvembXSGV6xYbFUcUF5MKKn8LhyrXp7Sf7rQ/fIjdSv01VirEFwBfgwbZ
	WZtyfKQt0yCgnh9sFSfrI9pnPAcpLvFJNu3YOATmrfvTleq6h4woEObun258q4a+
	8GChmZaWdoX1h6JiicGPjWZ3UYKC3TK6vAzSf9/FhEcslwYYazjWijqQesgqf0ma
	CA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4cj116dc44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:43:12 -0500 (EST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-797dad61de0so2928437b3.0
        for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 14:43:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772059391; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCtnMuVMDe2f1s7qYuANgAwlF/Sf+QkffdcViiyyKaMpcbHS7gJbos+H4kWttSFloG
         jTpv03Cg4LuTDF2+NERrcQuUPooSznaT7MeuS7oUzvNN3QF96msgxQ4LijzQBIBaEtOh
         Pa4C1MGGTmRFd9gDVJIoALBY6VEZz1pLQsTdQJ+3Z9Xhpa2x5L0GtViLUEMRr3Pz3Ff7
         4QBlketWicCkyuPkcqeXWLEl7FB0/GRiC601KpZ5XQQ+aLYqimKfjmHiRGqbdWfpBigB
         gO8Xzz6zKPtdCJUjYTQ8VnwO/Tn1JoBH1dbZckOFotJ4Com0/y2WLjZWDItEnfgt92eT
         pinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=pDtBt1IUvockGTD9sAkNQUVYnZ2xavhQA7l7ZDVpiZY=;
        fh=OleQEONysVrU/u/3sPS6J8N0CyjAFwpy9/PD33Q6kQ0=;
        b=fhzVVlNKh1e7zoN9imFSxsEmlhbP/rjLehlsyx/8zXtzdTL6YAvmNtp7TxwlLp5oi2
         Pv3mSR6xf6nmpU/m0okgCBIj3S12AKaN/pVgjJ1M30k/+reIk4L+t6gJbIPpfZ3sgRGB
         3J4M9pVUQQKQFKoSFM4OSf0j1C76U3v15Gt60UKzT2s2lSaVM/riXo1Cjjcvc77rTc5s
         z1FYm3fIpR65+x/FZ3sbpt9jKWxEzR8KNF7gZCm8HsLI/+jbiFaa84BwAizJlo4on0Sp
         hCK7L1N3sxuX3t7zGF6aKEk1I28x/8udiqw9iBSGGSZSxKIUk8Ql9OPcGbpJYX5HE2fY
         sJIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059391; x=1772664191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDtBt1IUvockGTD9sAkNQUVYnZ2xavhQA7l7ZDVpiZY=;
        b=KhvoyxZcKg8hEXakKEs9EhKT2exuRrb5KTAe+Ei81H1OcozSCPk6DIf9F2PPWvqZLW
         s69H5tbZFarN6zRXb2Jc2nlFECHoLZ8OkLhlgOa/c3Xev5fcyLfZJUrjIyjJKv3Z64hb
         g6fGbOPz6KkVHre1FEIp8iOXku4MllV8l9FOMU0r4QzKE1TaPsN/RA5Ry+668oLUxBnn
         ldrx9RM0vx4oEIoc5BnT7gK8QXnkjgbVV5Cdz05+T5Jgye8PisBS0jaTHGXQV3jKCkHc
         ilooqjFIO8nx0VlrXSUcldb3l6dlQWYJCdi+ykE6DQaM5h6JEDF1SLMgNcMDD6slwZ1S
         MY1g==
X-Forwarded-Encrypted: i=1; AJvYcCX0ajqfeA1xWQ5XE88DR6434zV075JBYaqt7gNsWbdMtdEOaUKsDdl/0VJV1pQIZErMY7Qlyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy10VYU9VDPGgeC7IrGyOHlCYryQ36ilG0Aq3nRQyNzai7IQ/8h
	Jypba4pvNBcvW8fbjWVfq44O2fnRNGf1GxCD+gWqOyp+DYSlSWyCLZE1uGWaw3vRyxwh4Hmam8s
	OamPQHwMfbnhy2SgIrDih5U2CwHiFT14qCefIFBfKx+NVqTuB+iKnPqBiRTs2z0PqzWaL09oa3+
	QoBhonKtFY2B3OXPNo7yhX1O38s7E=
X-Gm-Gg: ATEYQzxn3y6fSXHZkAZjnTseILoiWCjA0kIDFdnEH0GhVUukFFysMIIQI6Y9OfrTTmB
	/tr8GV7zQ5VwybrLbGbEzdbSL5srPLziTEZZCWhsv8twzldL2XsZaRPlf6fb1ZOKkP7oTQat/vm
	dl3lYPnrmkfsOY90k49JIeYFGnHB3wPc6u39cqO3q+wgcNWFP8lb78yMjqqdcjgI/1Es4qRLntK
	xXwwNkX
X-Received: by 2002:a05:690c:4d8a:b0:794:e72a:f664 with SMTP id 00721157ae682-7986ff6368dmr23925797b3.60.1772059391045;
        Wed, 25 Feb 2026 14:43:11 -0800 (PST)
X-Received: by 2002:a05:690c:4d8a:b0:794:e72a:f664 with SMTP id
 00721157ae682-7986ff6368dmr23925517b3.60.1772059390662; Wed, 25 Feb 2026
 14:43:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218-blk-dontcache-v1-1-fad6675ef71f@columbia.edu> <35866783-2312-4e31-904d-3746510eaf56@kernel.dk>
In-Reply-To: <35866783-2312-4e31-904d-3746510eaf56@kernel.dk>
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 17:42:59 -0500
X-Gm-Features: AaiRm51munUdTrnZZ7c7FkAWOz4juVf_xR9vg2o7Xlz46s_YpnQLMylaXhWKvd8
Message-ID: <CAKha_so5z7S6vD-betDLr=GREewxnWxeK9qawhZq8yKt=TD2XA@mail.gmail.com>
Subject: Re: [PATCH RFC] block: enable RWF_DONTCACHE for block devices
To: Jens Axboe <axboe@kernel.dk>
Cc: "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Bob Copeland <me@bobcopeland.com>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
        linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
        linux-karma-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIxNyBTYWx0ZWRfX1UKv8kAXrhiP
 ufGytK0F3DlNDZ5DjttNVPeJcO0w9kKg84kzZwch/b6IyXJxnfPVUUB/E3/5dshb1FEBy2iCT9K
 mbUl/TvAGpA/8/I9BUU5+EeGW7wTrrZ2aTmcTR9v0lUdBaXU8pcZetWUiU+/eI9qQxcSg116P+H
 BkM49kEb2WQ+Nfg46kEqTcLEI6sSTWzIr/PSeAfyXwGXQnWJcZvKgFi5Mux9kiVhbMGCYtx0se+
 v+oNEN6QXM4vm0E4yIzy34WlkLo72EE+4KecOTDbZVGL5ulWNEy4o4Am+oyxmjEGjGK6eNxCRjh
 mU8+/wpGFlTYt5r2oT3JJ5/eELYDV2ajK+XDsZCWlRq060N+bq4eyerk6nbL7DCABfZ7EHBHvQ8
 u6U0G6d/iRl18aM1LRIYc6TTuCbQHdGVmQWGuh62kI5fabDjJlJVSoorfvDGbP5kn5ZHlJr32r0
 +6HvzdReW73nsbZoLmA==
X-Authority-Analysis: v=2.4 cv=cYjfb3DM c=1 sm=1 tr=0 ts=699f7b00 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=x7bEGLp0ZPQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=79PYxaXUQd1wl-QFWJnA:22 a=VwQbUJbxAAAA:8 a=VNoZ5ujv9kIkDPz7VAoA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: SdQVp3GXFaL4-abNIWW60OxGZ8-6t72p
X-Proofpoint-ORIG-GUID: SdQVp3GXFaL4-abNIWW60OxGZ8-6t72p
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=10
 impostorscore=10 adultscore=0 bulkscore=10 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250217

On Thu, Feb 19, 2026 at 10:24=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote=
:
> On 2/18/26 2:13 PM, Tal Zussman wrote:
> > Block device buffered reads and writes already pass through
> > filemap_read() and iomap_file_buffered_write() respectively, both of
> > which handle IOCB_DONTCACHE. Enable RWF_DONTCACHE for block device file=
s
> > by setting FOP_DONTCACHE in def_blk_fops.
> >
> > For CONFIG_BUFFER_HEAD paths, thread the kiocb through
> > block_write_begin() so that buffer_head-based I/O can use DONTCACHE
> > behavior as well. Callers without a kiocb context (e.g. nilfs2 recovery=
)
> > pass NULL, which preserves the existing behavior.
> >
> > This support is useful for databases that operate on raw block devices,
> > among other userspace applications.
>
> OOO right now so I'll take a real look when I'm back, but when I
> originally did this work, it's not the issue side that's the issue. It's
> the pruning done from completion context, and you need to ensure that's
> sane context for that (non-irq).

Thanks for taking a look! That was very helpful feedback.
I sent out a v2 hopefully addressing that here:
https://lore.kernel.org/lkml/20260225-blk-dontcache-v2-0-70e7ac4f7108@colum=
bia.edu/

> --
> Jens Axboe
