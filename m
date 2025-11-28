Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E126632ABDB
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764334696; cv=none; b=NYzJXkwc4xeHdDMsPEaUrSzpTW5mszeBVxPxpY2EU/9YhBkr1+ga+YmmS5IKZ4oacqh/FExKSdFSjXzuC2cGc/0tFn4nwINMipbFwtXxxUKqueWlToH5V8WbfoAHPCRZdp/cEv/ZMIpWFzVQKzBioP/m/JhPdZU14MMlce4W2cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764334696; c=relaxed/simple;
	bh=MuFoqSXPuLC7mZdpb7+pS1mI6Pzog4fHqbrI6/r2Fik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnjMOmKRxnSOzIvGyeTmYjKlzJRAPZ8yAbEp8HOKlGCWZVJUY/sfYiKG+GYQzXlUBztH03MDosDjlgMa1SsZVZhWJMmrYatZFVfP5bjub+wtWQZuRyRFJRpjhX9QTkb8oHvh9kxxQgLOqwgcUbOmxTAILPbc6yDBWmRbmGc5t34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJWYU+6u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJWYU+6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764334693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nNammxq+ggHJRHkPcyBw0qZgJjTAIfnPB/5V2CCXd5w=;
	b=XJWYU+6uD2TNlbVBS1FWSfq/vP8XVoyGeNQVA2MIuhO/W4T8uQBNHQgULFu1ufsrLZrJlY
	lFTx9xa+7BzUc6E0ZglUBSgSsLJ1mcbujDT0vhlLqJzytcH4lFSPmNaTFKhsd58bsoLE/y
	/U0BTvNl50SHvZA1e3jAbGdy75xr+Ms=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-cGAq5aK0OVSxpjGWCdIiZA-1; Fri, 28 Nov 2025 07:58:11 -0500
X-MC-Unique: cGAq5aK0OVSxpjGWCdIiZA-1
X-Mimecast-MFC-AGG-ID: cGAq5aK0OVSxpjGWCdIiZA_1764334691
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-787ee7b3ddfso22825307b3.1
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 04:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764334691; x=1764939491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNammxq+ggHJRHkPcyBw0qZgJjTAIfnPB/5V2CCXd5w=;
        b=si34/i6b+6DlZk7uIYVwOxDDAVMjVIg9eMsteSB7CEBWoY0R+Z7XSdv7pF8rlRu1O7
         JMnt+PiO3K66sA393eb/9rBIeuSrDiwCGpxH9VFkW7izf/51OFhIyk1bw3upAoD8kLz8
         vK4yCWCWgvl3yiHeuSjHKXMRmCTNNTJ4UwuAITlzZi4pteBz6BRHJLhv2iATcLKg8fTJ
         eLKdhWHROlmigfhR2RPQ3apZ7gC6HoL6dc9m163IJ0nniXnYlJ0isFplRBRs7eN6SmS7
         dOiiS4WZyU5GLzNpPaPmSPd5ahwM6SxE9F8Dwz9UK52PUedkd31l9YMVaJg86EJE11Nd
         z/+A==
X-Forwarded-Encrypted: i=1; AJvYcCUY04Iavz9vk2wC1ZxajlpOpaEgWhus/ivoDBmQwG3EG3ToYFaadh9lbOuGsrDUBndh2WImrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLjTfxhIKHEaBG5W1WbG539agVWSLJH0G+q8aKPudn9A+E1hvi
	DI5/An92KJGrVkLwFMca0lLQrInDqCB75tjfHp22DlKtZiObQ6W2QUWOGAc2ofSmoe4H3jDUTUQ
	cgvz+xSUTXrx592Okj4V95W0unbb6Wk6IEmaXgWUCDpUw+IGXlustSjEC0Wh3N12/tYQPAstEQm
	UUC4ZkvsMDRLRbXj4mvgr8N1nDE7zWrNc=
X-Gm-Gg: ASbGnct6szFLwFBPtqfspjZyKPLJdVIleGLlY3U921whpTG/9r38glxKOopMjTaMwc7
	Y/qAkdIWUGO7SASC584ODpWvcwutkp+9b6GTbGg5jWW1e2Air8dS311NbsjMGv45GBs4X9pZeq1
	d/DTnQ+hDTgBgzky4EQmN8/mLDfREeLeDg9WHh3+EnhTI/sAaf+PswwbbUfbFcLkcr
X-Received: by 2002:a05:690c:4c12:b0:786:68da:26d6 with SMTP id 00721157ae682-78a8b47f539mr225392617b3.2.1764334691011;
        Fri, 28 Nov 2025 04:58:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6o2vx3XDXGg+LlkIovRC1qPDpHivJwIyySPFZW+LOu2PT9QpULnJt3ZozP3PJjgQPuJtToIp2pCOkRf4ONwA=
X-Received: by 2002:a05:690c:4c12:b0:786:68da:26d6 with SMTP id
 00721157ae682-78a8b47f539mr225392307b3.2.1764334690627; Fri, 28 Nov 2025
 04:58:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn> <20251128083219.2332407-5-zhangshida@kylinos.cn>
In-Reply-To: <20251128083219.2332407-5-zhangshida@kylinos.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 28 Nov 2025 13:57:59 +0100
X-Gm-Features: AWmQ_bkpqINzOqnBww77x7L-xnpoIyN1fhsiEmRMn1madN6s7Ak0j6O_sI0bIl0
Message-ID: <CAHc6FU6dmK1udCgj9vMj1ew-4+bZOK7BA47kyEgONEwGg42veg@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] block: prohibit calls to bio_chain_endio
To: zhangshida <starzhangzsd@gmail.com>
Cc: Johannes.Thumshirn@wdc.com, hch@infradead.org, gruenba@redhat.com, 
	ming.lei@redhat.com, siangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org, 
	gfs2@lists.linux.dev, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zhangshida@kylinos.cn
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8_Y5BEjkXPC7W1UKcyfL6b6Y8fmHMkD7V_QsiU9kKe4_1764334691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 9:33=E2=80=AFAM zhangshida <starzhangzsd@gmail.com>=
 wrote:
> From: Shida Zhang <zhangshida@kylinos.cn>
>
> Now that all potential callers of bio_chain_endio have been
> eliminated, completely prohibit any future calls to this function.
>
> Suggested-by: Ming Lei <ming.lei@redhat.com>
> Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>  block/bio.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/block/bio.c b/block/bio.c
> index aa43435c15f..2473a2c0d2f 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -323,8 +323,13 @@ static struct bio *__bio_chain_endio(struct bio *bio=
)
>         return parent;
>  }
>
> +/**
> + * This function should only be used as a flag and must never be called.
> + * If execution reaches here, it indicates a serious programming error.
> + */
>  static void bio_chain_endio(struct bio *bio)
>  {
> +       BUG_ON(1);

The below call is dead code and should be removed. With that, nothing
remains of the first patch in this queue ("block: fix incorrect logic
in bio_chain_endio") and that patch can be dropped.

>         bio_endio(bio);
>  }
>
> --
> 2.34.1
>

Thanks,
Andreas

