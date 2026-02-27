Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C222271A71
	for <ntfs3@lists.linux.dev>; Fri, 27 Feb 2026 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.139.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153100; cv=pass; b=YadQ11JIZlYxFajhtI85RCupNojhj7WgU/wuFZVFXbNNJxOvqxdN2/rdRLF+WEEYv287DTtHHvM/Bl+nd3v3LS3rpI8BKsOa8pNVkuV4c6qoalbBN+g74wmaEoZjGzqoSDgFFJOmCy8sGHSJHVdSixiIjq2izJoA7igxBKHLOTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153100; c=relaxed/simple;
	bh=O+HRxgiHT2z7n5ch0TYyL93nG95Cvo9LlcSt25e21Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mo1/wE1d2c7XZnrkAZa7Uk0YMf8IVKQ2JF8g/utK3VLTCl8wbJCy2wu0BxqEQqRYGlv4t/lCJr//rgvFB/6hWyeq4brhgZrmRzdNvHv2uDT3hCpn7mvdimgspwCJs+ebwXNTMRuhpyCiswtus33zPEGYYnQ6/S1UdW6c9XMVm4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=i1OndWU+; arc=pass smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="i1OndWU+"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R0QxrJ2552730
	for <ntfs3@lists.linux.dev>; Thu, 26 Feb 2026 19:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=X7pD
	kBpYJ27xEgY18ooGDGOhBD+yHFwQylYRdDgNI+M=; b=i1OndWU+3hVbPOhJLPdB
	3dZ4nSkztb1ikKbvdbatjVGkVMLfV8JFZoIoELwMzvOYxfwUR6nLGakr/qfu4h1Q
	GO8wKJ8wC4UazfM1LbiYLaf16jQ5TxOebgu7QRs3IVlvCrkOwzJVdNdZd6DNe2SA
	UyzFa/gtDwTBn+WHSFtqboptIKXNMRyDXiRy1/HJUeBhpCt4ysnry1Waeo2FSSbr
	T44fjXhU7o2QxsSczc0EG487y0F+MHbUzU5UXRAbhPw2wSNZ/rXct8p9OvNCLgVx
	J8CkKDZsIksblH1voMgwtFzQHi7YdkePQnLp9goufCO+S9tQvuISr4koC2RoM7Sx
	xw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4cjrj24mah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ntfs3@lists.linux.dev>; Thu, 26 Feb 2026 19:44:49 -0500 (EST)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7982c3b7da7so33903707b3.1
        for <ntfs3@lists.linux.dev>; Thu, 26 Feb 2026 16:44:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772153089; cv=none;
        d=google.com; s=arc-20240605;
        b=V6CFuLrD5Pkvg9UWZ8Vbv2xWarwgEg7QVF/2CYqU9CGebCAautS1UeTM09cb0v/503
         ebtuh0xle++QK7bcym+1MfDSi5qVJLL6vydGu4ncaNdq/nx5o9rqASS4sWiiO1Oy6E9J
         VSfZTgEkAj6JNQErc96/FJkA0rn6Uk3ZEaEzn1YMgQ/zR76I1i0xUJB8sxk19nYG3S4O
         dIVD+usdlJQ6wwS9T9uDrPVKTEzbzPiEgiL27xqnsvgHyIySPATuqlcO8Ncnhaip0Eey
         WsO4Us5dxjXNhpPJEsqHewSCUXHwK2gga3siqqplSNME3OeSCSBA8JurQvoIIYOWSfAO
         6Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=X7pDkBpYJ27xEgY18ooGDGOhBD+yHFwQylYRdDgNI+M=;
        fh=fF/8/V/Pb0YxmzQGhGTIoEmOJs4lxypY4UJWv5bwe5Q=;
        b=jD1Pj1MWtiHcNgY37ODr96nCM5jCbHLnRJTbpH0gJOfbjD6AntUX5sKzDj8kobqoaz
         4HKWnMAxX0NBtMylrwGk8425DsTSkD3ZOm/qaHUWeBkio8ipVf63/f5DdvaWJI5OdTZY
         hBTosNT6F1Zbem/mwGNQvBtAC5SDKf3Ccjzio1MQYaktaRJM6NafLyoldIEpxic4kw+h
         BeGWZ1RCTM/VTRs/oV7DvMcPcBiduRzlWONkSz9YQA6FMEcyhXlzYJY7VqjHs2jG3cyY
         l0vgqCI1un1dNVUTj3IufKY+/lMfxZik+MuQsYm+HkFm7ngw91lYwaKc34TqR8Pl1jj4
         GYzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772153089; x=1772757889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7pDkBpYJ27xEgY18ooGDGOhBD+yHFwQylYRdDgNI+M=;
        b=OBVsI+6ICaHvQzurApeN+Lg+76M2jW/HKcFr/L9S4Rirme7kIOEpSHe1ybVPmuwZi3
         vl86ad19WDuFs9As94JAivYbmiapE6TfbOBBWthuSq/M1rTdc3D3svl5dy032kL/cciz
         l5TmBUWF9GoZNFB/uaIAXc2QfLExr99RB3zDzjc79AXwQk2lhxgBPbQe45QnGm0asBNy
         rg2T47gUZ43XQiSxiZezK4bGdUYWAd8+Ihoduek/iLFpTdBPwEaI2kR/v6rsldlrDxll
         eg3qyq4dH0z5tO5ejq6kEOn7lHhMFwYEr41NjlCL/Z0oybeDTLG3PoTf+lreVEfXORB2
         UG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVNrgY0i2IB9CYwQf7VloEtaWnDSBp3rL+ru08AOJP66pdSy9CtzLPklnI5FqY6JQVeTB2Kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyugwt4jzGM3A/5fIwP5FERHxwSPdHrd0jSY7zzrwL2iQFlPAV1
	4eAVP+wkJKQzPJT2iyYBAfu2cWAnAMvGqXUfmNRpIUT15UC0k3Q1toPvK9yrxOjjN/qG5SRW/Ev
	SzHfBqRj1bNX/LJjNvcASOa4eHZNEAEVYpDtcXZYXoWlpkP9695MNZAbegVAQGQ6fMF/552zfgk
	T0ZGi00DfOSawlww7wpp9Fj2rsncI=
X-Gm-Gg: ATEYQzx1UJWuupZBUOtKfby6OCLRJ9VHIxxx1iasvBdebg0m7fPc1O4U6sOEPq5MzgS
	bkPdsQoMgwuRtU1IKRORnmEb/upAPfYG7Lji/waBGS0pmsYI2821H1dxNuwUOQ8XCBwJsGZxEiU
	rC60RmWV9MMtYmN+5CHT7Mm35Y5Fyclx77Wvpq9mpBtNoqgUMle36jUw6T2kTJwmGuhfNZPxEXG
	Cxb4w==
X-Received: by 2002:a05:690c:f16:b0:798:6401:fd1f with SMTP id 00721157ae682-798854a7e4emr11636027b3.14.1772153089293;
        Thu, 26 Feb 2026 16:44:49 -0800 (PST)
X-Received: by 2002:a05:690c:f16:b0:798:6401:fd1f with SMTP id
 00721157ae682-798854a7e4emr11635807b3.14.1772153088806; Thu, 26 Feb 2026
 16:44:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
 <20260225-blk-dontcache-v2-2-70e7ac4f7108@columbia.edu> <aaDEEjVKBKrLxsht@infradead.org>
In-Reply-To: <aaDEEjVKBKrLxsht@infradead.org>
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 26 Feb 2026 19:44:38 -0500
X-Gm-Features: AaiRm52uN73WQ1q0q0Bsy0nLJ7MoTUQc88yWQcbleL3GQlPfTUc323g8dJKyM6s
Message-ID: <CAKha_sonOvAGriyromHtyRc-VY6Zyg3J3zd9UJPfBOAt1a522A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/2] block: enable RWF_DONTCACHE for block devices
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Bob Copeland <me@bobcopeland.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
        linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
        linux-karma-devel@lists.sourceforge.net, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: qsMt7cZ4jde-U7-1scgEZtvoygzzDwfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAwNCBTYWx0ZWRfX3mQMOuUN7fQq
 2l+FwN9yUo37zE/LwYX4wTaUicDfxlHFAZphBKF1mevTITRSpX5N6zJNCPxMqE9B3mVxMbD5qtT
 dOcuAtfhrjj2IvoJ13lPXAxjOCZOF1qq1FxgwTX4K2zbg2/JLWhvVhE6tt+fg6u91dF/YcrrbKd
 IuSiZ7mMb+yHflJ7Nuh+4NJ56glEtIayXFSe+dDhk4aNRloka+SaGfogxW/DQ4mvrn/DZE2lG7O
 7/JtQBG9gNTQ1i6zTG5q8qMSGO3sEgY0c/aMUx/0wQeL02XCmIlMH9kIpK841qzo1Ah21tlGH6D
 XlkHetu+XZqG/bGur3EqPEwskerpXVtRWSagn2sl+h99liuxdh3S9sfxlj1MCIObAmMxjsJoAl4
 NpkyJ2oj6/LFT+seN91t1h/oTAd3G1IgLe+nKNWpLRaJK1rw0RPtRpKIbw69g77czbYNQCemeg5
 +lzvUyBea3GDAg2d0pg==
X-Authority-Analysis: v=2.4 cv=Sbv6t/Ru c=1 sm=1 tr=0 ts=69a0e901 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=x7bEGLp0ZPQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=HpS3TJQ9O3Ob1ozEcmik:22 a=JfrnYn6hAAAA:8 a=lVyRQGvDAGr_LZokY8wA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: qsMt7cZ4jde-U7-1scgEZtvoygzzDwfR
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11713
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=10 lowpriorityscore=10 clxscore=1015
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270004

On Thu, Feb 26, 2026 at 5:07=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
> > --- a/fs/bfs/file.c
> > +++ b/fs/bfs/file.c
> > @@ -177,7 +177,7 @@ static int bfs_write_begin(const struct kiocb *iocb=
,
> >  {
> >   int ret;
> >
> > - ret =3D block_write_begin(mapping, pos, len, foliop, bfs_get_block);
> > + ret =3D block_write_begin(iocb, mapping, pos, len, foliop, bfs_get_bl=
ock);
>
> Please don't change the prototoype for block_write_begin and thus
> cause churn for all these legacy file systems.  Add a new
> block_write_begin_iocb, and use that in the block code and to implement
> block_write_begin.
>
> And avoid the overly long line there to keep the code readable.

Will do.

>
> Note that you also need to cover the !CONFIG_BUFFER_HEAD case.
>

I don't think there is a !CONFIG_BUFFER_HEAD case. The only user of
block_write_begin_iocb() would be blkdev_write_begin(), which is only
defined under CONFIG_BUFFER_HEAD. !CONFIG_BUFFER_HEAD paths use iomap which
doesn't use it. And buffer.c is only compiled for CONFIG_BUFFER_HEAD. Unles=
s
I'm missing something?

Thanks,
Tal
