Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519D1946DA
	for <ntfs3@lists.linux.dev>; Sat, 16 May 2026 04:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778906674; cv=pass; b=Kk50aBjXg0BjVOyUu1f0LLNc+fpx/MPhxhmBM/GPtOtZ7f4f/T5kTQPesjvZ8PNb0zIeME3HMXJHl3jK5ISq0swe24KPVv01b5EsAGQ+PMuGnjSNF7IvztzFDfCswL3RqrWIMBOObvr+2g4n2jU1YUrfqU7yDqkm7oA5tZumL+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778906674; c=relaxed/simple;
	bh=4QBQXNc/n+kRCp4DXOoFL6yVIhrRoM0TndDU3LEXdII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3rmDHnwmCUTwlFMQJvLWYuNx1YNG7aNriWwW4ULSFFL9AtqX0GW/UCkdn2e+c6Rtrbcgq5+PFNS47rzCiM5Hrvhd4e7la/qprNeBExYWeRqg85Dkz+waZb2sLkQClwHHelAr2kq6zk9kzeuYfrHpeGfjgnNHGouM4RWYpwoHbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdH9Q4te; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdH9Q4te"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95fd2a4eb9aso6789241.1
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 21:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778906672; cv=none;
        d=google.com; s=arc-20240605;
        b=PheqoSPG5pvP1q5n/PkZMrmK1FKUpU9K3BcC3Xj02BDMG/H4MRzhO3yBD7tk4Zejjj
         4JYPUMrlbA8Y8JLZ+PEgqS5FcLgNjnsx09C3lcCTwav0s+uj5PTXwkp6AEdoD5h+hdL3
         m948pNJV+hRwXgglohq3g360BT/XNygWjMRZyUNcS8uP1D7tiIdIXocCBCLtYJ2EykdG
         JuBq3hdJjZ0BDfEqTzSYa7keKLGoWTGV5XQl3sofhUXtgiINbcjciNmd+W0hIE1OAuaA
         oj9VKcxxh3/yufXiSifVXk8zXskq5vQMabOZgZxE9NeK+rhD+JsZ2O2U0OKNbcp3ynsW
         tW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DYDSXLhOHj1s+deQAJ+TXvpGa9Fd2DyDL2SVrwFSgpM=;
        fh=ubWe9kmW3cxk4dOpfDF20Rqyj74+RBs4M+DRgcmNXWA=;
        b=aUEKLuhFYwKjJlLOTWZlyXHbw+9lcB0JIjuiR9FlgRRcPrMsnCBzqvbYy5l7Ar6cEg
         uZO5I0jmG1fA9Lkf+V/kvbnbeCMrucKxi+FZ2m8sS/Q6Xkqjcv/kfZ0ssCHNtBVrq1QV
         XylgFnUj4ICVC7N/vVaeqThVYDTZiISpj/2lasdfgRmHsSavBaAHJ7yfDSOaEIWgnJ70
         f3KHksYpEvZ90MhhTIf9VqtGENCD4vMx1yVGI4j43LleCc+JEVZgfTEf4K2xWu+dZaV5
         bXFg+ZU4gvzKwv/vMHwc0zJvaluEHnXljyIvhI1nw8LlJh0xxShngvGCE+0qJtdZzEko
         ZKEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778906672; x=1779511472; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DYDSXLhOHj1s+deQAJ+TXvpGa9Fd2DyDL2SVrwFSgpM=;
        b=CdH9Q4tedZQxLbso0QzEX81f7vdiaFEonsZ9LlOqpbSJtgLSIseUxL9IrWfdRZmQVz
         viDqiBvSjjJcupeSQSDSv9a1A2WbxNGbPvfZURGOJTqXmOx8Qzl8AdFDugY8cSBKtiNl
         wL2hl0ToMjSiceaYknSWhMWk25T/FZDDfi8FUQTE78n1ldujKTv0rKKFSgxPuke03zim
         U1oxHIXa2YyA8cl4Pz7oYyeNrQVAayNxadMaVDPikA+LMI53Mwonax40zjC9M/GiIses
         IcPt4BeiilOGve10xfXcvaiOEFFesxnQjafSnN0NMMM3X51q74aSNq3UkwUsDR6m63Lp
         wlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778906672; x=1779511472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYDSXLhOHj1s+deQAJ+TXvpGa9Fd2DyDL2SVrwFSgpM=;
        b=S8ROza4Vk7QrS/50Qg7k73XTEtX9fjIMSut7Awb82qKWnZ5rAo+OgrXItP0QsVmIra
         UWtEnS2RlapBaOUpIn6dY52RDXQu6ipjq3c3xWT+r65xvnevg34KubukuNbx2NThA7dI
         W7dGwZ33J0BPEBQJf8TGX6QOoatJP2f3LGc7S1Sfm+cUaoqLoeSnryqQzAWuCDkMzWHj
         4hNC3JMGphjrohC6dZCBykbxSNltCmR14+w8BJYkELw0FaSiTcldHRQ8j9uoRywk+Cjx
         h1nPwpRU7tagH+i+yXkDDn45PXDoukBuXbI4kEi5UeuyuTdBjFZPEQ0uhMGcAteWHPm2
         PMEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9r49UKMTQiUTlVHXcR506m8MzgvmAUS0OYlkTmbgzsHayf5v5TmlOs4/8lbSVS0t6ia08+Pw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9VEUWDzh38nsBgtwFYvhuCLOZ9lm/YLKnxpE7EKrEDWqyEPAr
	IZCvtZNWHp6LJ8fFNujFd/El4/52eNJtMA+Fe3uxs0DCHxR/5kuTSBrrK9cZKd3M1cBU8fq3oMQ
	eQPw99SIej9FFKi3+sIQQJMUNLbNINTs=
X-Gm-Gg: Acq92OF0qTnLYoWQ1vgPCu4LMaPHcv/fyAEp5Rs/TOJf6AQ1rOn0dwccizZCbq2ORTn
	55NE2lOmpKkLCGuUii0YWUdbttK6yOejKxgPvyUfRDc8tkMQ2lA6a9yX+gO0cUxiQ0W8JZW9XrR
	qaZHECezrY1sZTejjCYgjixoPVRK1zqOpLxGv4SDcLUA9rUSa+u1OjUQD91KFIrVCmsEWkzG2T2
	JvuHgHfznyjFLfgjXRCTNoPctiLxd8DxU5bvm8tNOnlGrdqzzRS+4P1RA2qvXTec7N9AWyV4gNg
	9ddKPQcrRSqumJf9/D7IXTupGFxXcP3KpyjL9T4=
X-Received: by 2002:a05:6102:116d:b0:631:267d:157b with SMTP id
 ada2fe7eead31-63a3f58f189mr1179218137.5.1778906671586; Fri, 15 May 2026
 21:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515163424.1575298-1-michael.bommarito@gmail.com>
In-Reply-To: <20260515163424.1575298-1-michael.bommarito@gmail.com>
From: Pavitra Jha <jhapavitra98@gmail.com>
Date: Sat, 16 May 2026 10:14:19 +0530
X-Gm-Features: AVHnY4JGJwyaJDa6wW1v8xk-c24D-8fldPvZ3sXcfC8Z3PVJ2ubMA72oRNfxato
Message-ID: <CALFbBicg4oz-MoQue-_MCYaROeWJMkDUySaMP1_Te9z5wP_1Jg@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: bound NTFS_DE view.data_off in UpdateRecordData{Root,Allocation}
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing this. Since you cited my original report as the
basis, would you mind adding:

Reported-by: Pavitra Jha <jhapavitra98@gmail.com>

to the patch tags?

On Fri, 15 May 2026 at 22:04, Michael Bommarito
<michael.bommarito@gmail.com> wrote:
>
> In do_action()'s UpdateRecordDataRoot (fslog.c:3489) and
> UpdateRecordDataAllocation (fslog.c:3697) cases, the memmove
> destination is `Add2Ptr(e, le16_to_cpu(e->view.data_off))`,
> where e->view.data_off comes from an on-disk NTFS_DE inside
> an INDEX_ROOT or INDEX_BUFFER.  Neither case validates
> view.data_off + dlen against e->size; the existing
> check_if_index_root / check_if_alloc_index helpers walk the
> entry chain and validate the entry's offset, but not its
> internal view fields.
>
> The neighbouring read sites (e.g., fs/ntfs3/index.c when
> iterating view entries) check view.data_off + view.data_size
> <= e->size.  Apply the same bound at the two memmove sites.
>
> Reproduced under UML+KASAN on mainline 8d90b09e6741 via
> pr_warn-only probe instrumentation: with view.data_off forced
> to 0xFFFC, the memmove writes 32 bytes past the end of the
> NTFS_DE.
>
> This is similar in shape to Pavitra Jha's 2026-05-02 patch
> "fs/ntfs3: prevent oob in case UpdateRecordDataRoot"
> (<20260502105008.21827-1-jhapavitra98@gmail.com>) which
> proposes calling ntfs3_bad_de_range(); that helper does not
> exist in mainline.  This patch uses inline checks.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> ---
>  fs/ntfs3/fslog.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index acfa18b84401e..127860fd2ab50 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3497,6 +3497,18 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>
>                 e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>
> +               /*
> +                * e->view.data_off and dlen come from the on-disk
> +                * INDEX_ROOT entry / LRH.  The neighbouring read sites
> +                * (e.g. fs/ntfs3/index.c) check that
> +                * view.data_off + view.data_size <= e->size; mirror that
> +                * bound here so the memmove cannot reach past the entry.
> +                */
> +               if (le16_to_cpu(e->view.data_off) > le16_to_cpu(e->size) ||
> +                   le16_to_cpu(e->view.data_off) + dlen >
> +                           le16_to_cpu(e->size))
> +                       goto dirty_vol;
> +
>                 memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
>
>                 mi->dirty = true;
> @@ -3689,6 +3701,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                         goto dirty_vol;
>                 }
>
> +               /* See UpdateRecordDataRoot for the rationale. */
> +               if (le16_to_cpu(e->view.data_off) > le16_to_cpu(e->size) ||
> +                   le16_to_cpu(e->view.data_off) + dlen >
> +                           le16_to_cpu(e->size))
> +                       goto dirty_vol;
> +
>                 memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
>
>                 a_dirty = true;
> --
> 2.53.0
>
