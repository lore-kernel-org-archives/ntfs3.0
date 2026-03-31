Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1963E95BA
	for <ntfs3@lists.linux.dev>; Tue, 31 Mar 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946956; cv=pass; b=L1fltQED7TJC/59Lc/pHzTwGXJuMjDmvItmBzDaVUZga0TgIHd6NDdwYrFp2YJqYGb03o7sSm2y3E8XIg60IapOuaLjU2z+LWTwgyFB+JJWkyhoGhE4EVtW0DLvP/iqTdn70M4MrKfVM92ntLj7HfS9xtEfAmGwAO1vQ2XEeU8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946956; c=relaxed/simple;
	bh=ouryBeB3KAXHhYWVYbLgrMzTnrhu6h8qI9v2wnCPuUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEpjum1bzkGU8VcttrVOBtLL1F8Hz90h1NkjktoGBXBhpfokucqgLDqdxJULuXRhqGO37HKi8RcYsGq07ozPkrH8JzoVXYJTM641ul0eEEe8S6+tNwbxTaxIe1E4Hwt2jsEh/WHPMcnaikdlfAFh+fFOsrQ0CvizzLtFsxhXFb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChNigjgu; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChNigjgu"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-650221149e2so2901724d50.0
        for <ntfs3@lists.linux.dev>; Tue, 31 Mar 2026 01:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774946953; cv=none;
        d=google.com; s=arc-20240605;
        b=UOU2m/V4iyFNqaOEQuu+E3ZmYkbjrGrfECBN7RzXVSOS0s1I0o9zY63eckVu/wMuXl
         NWl2xDYMilXe6vGEDJcr20+HCV1K8eKgwq+4C90KkGqGCbLbq2cn6kHsA1fPK+97a/24
         3nWJAsawQscf1EQkBbJX6mkQ58dZeNm+0TP61KzClBspW/7H3Cm55C7lK1d8FNFJohPB
         Zog3jnC7LLh6nRSAwlZ+c0OS+kRroTD1WzqlK+rmVcSb2tYMTr1b/MbT9FfYdtD3DJ1C
         pTDXh/oe8NigUG8T2cbnbhZLkff1ZJZSOqxKXQs1m+VPAzgHOFu8nYp7slcmzA8X2HBQ
         z+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6P9vfHADIklWNp3JkEBJTNfHL5BGxpO+S0fLm+UVj6w=;
        fh=ot3K/jYA3Wc4PkH1to/v8DNj/xwav1b13L10d3iBcpQ=;
        b=PBvwqkgPHpzsaFn+VXyusNfbLQFGOir78XzP+yOJBLP8ZhFBGdSB4CjJZRZoSg3era
         x8ymEJdgyhyD+1HOonxv44FWoJnykn2zLeJG34hlVK56lrknTXMov4ZQNcXNNRp4saYK
         CqPncG5ca25qwth76PUyksX1uTSxpqE9Tx0q427xIbNF1N7HsT+VhuFiLQG8a8WCDkUy
         B3YzG5g5YUZnEEMBzZ03OwvVqI1pM43MaeJrx+enW/I9rn1+4GvalI2WRbBrxFM+Qply
         zweJUi7+ImDjCY+n93fvJC0nxbfkTB+0fLv+lZ/itHWUERvBWBlLsigfX3CjXRVIAg/V
         uTZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946953; x=1775551753; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P9vfHADIklWNp3JkEBJTNfHL5BGxpO+S0fLm+UVj6w=;
        b=ChNigjgubvkkGK9f6AdIRhl4UAmbHOtt3a9fVpDuQE4AXBO84hW9I9Igb+25g6uuvh
         9RzmpoOJsVyrinhDMOZBLeVSdeQRtffWvOZ/5L4uNhcuh4FLpxsq/ymnuUwz18SV7lxh
         uEKoNvMqGWrYgt3OESLMCCk4yOFPP6p5kPbnghTp1qHJnQXNHCkKeMUhi6XQCguKwW26
         bwIvSQjMbc0iIZTAFEJR+4K/Cs2kSTaGWOfLQh5WibFeFwxUjL64TdYY3kZSn6cVqfyX
         e2uRrV5cXhtyfWo4PIFVxKpOVOx3slx1+bbMhpsDvZldPprh/hjspNnz0iJTGEm1zH62
         7dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946953; x=1775551753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6P9vfHADIklWNp3JkEBJTNfHL5BGxpO+S0fLm+UVj6w=;
        b=JD+PvgRpK5g1pn1ZCyq4/7UTAmyew2hrQg+zx49gf/knsYPL2uq6j7mopGfd1h5UN3
         HBTuQQTn6ScRERUaziRNnh4BaS3xO+VDcbHJHOb8dFf4fjydjL5Ggqm764dsQfcXSjrS
         qQ/bbW8mL7B/1eTJUOHJQ7B/rljz0569UVOmu3KvJqeOxsYLjRsJODmS9ih3OPWIs98P
         lCWa9dn0lMCJ7/B5spLs3SmiK/ra0U+MPmpPF1PEEP+8ZX7Kh2ozVuVE69MW/UmtaIDY
         Nf+tVr6FMB4Z3ognAS/N1/hlyc4vBl3H0tJv+ewvKlJicbjTxzFZh/DIe6XmLOVCYcyr
         zelQ==
X-Gm-Message-State: AOJu0YxNpUCvFVRJqt4qqZYIWgtEmyWJLD7ng7ZGwCpiSIGg64+EyJVc
	HjpfpknevIYIeCcxh/midg01GuGZh+NQiDzMf0Qw7ELL86VLAervS6mZl0LoSKhsgeGVDI1S1VZ
	PMcyDtnXszJZq5x6cpcXpun6ae4Q5ZdA=
X-Gm-Gg: ATEYQzw2Ui3vF1BY3PNfkwClNxegV8rRpFe88SOUqFZEu0ncZOckMcyk+NBQ5WYW0Ta
	RLWuZPfDSD69duQNutuHBuJo05Y3clEFQA2ZapzFqFRDbRlPqRPq8VLXD8LYhi2hIIcogGit25H
	IlL7wS2yCUi6OWoSPNsOfB1KBADx1AIUAtQ0yRQGhID7Dw9XBudBd9MxVEfLBT2mX3riDVzDiYh
	h1mi1bUC70vUUj/Y14xTIDfg4lum3e+7kxXvU0p8BHJrdszVDo3tvNqcL2jP9FGSfyefHKoEke1
	MjOqxKZhGZU+DmDKsihuTYOleUvpg66uM3Drj67SJIf00b8MgPQElGZvYZq7IT0oVzm1VhAr
X-Received: by 2002:a05:690c:8e1a:b0:79a:daf7:c4e9 with SMTP id
 00721157ae682-79bde08333dmr122184927b3.49.1774946953496; Tue, 31 Mar 2026
 01:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323052148.1239035-1-kartikey406@gmail.com>
In-Reply-To: <20260323052148.1239035-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 31 Mar 2026 14:19:02 +0530
X-Gm-Features: AQROBzDVUPK9XJgCokQnR6C3O51Sys8sw4qxYDnZAa2JmXqSmh1obpSAbU-lxRA
Message-ID: <CADhLXY7ZbABcd35Br7u4MGz9VmbWSmbTG0fhj_PU1W3VQkbKQg@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: fix memory leak in indx_create_allocate()
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:51=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> When indx_create_allocate() fails after
> attr_allocate_clusters() succeeds, run_deallocate()
> frees the disk clusters but never frees the memory
> allocated by run_add_entry() via kvmalloc() for the
> runs_tree structure.
>
> Fix this by adding run_close() at the out: label to
> free the run.runs memory on all error paths. The
> success path is unaffected as it returns 0 directly
> without going through out:, transferring ownership
> of the run memory to indx->alloc_run via memcpy().
>
> Reported-by: syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D7adcddaeeb860e5d3f2f
> Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
> ---
>  fs/ntfs3/index.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 97f06c26fe1a..11f59d7b9ea4 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1481,6 +1481,7 @@ static int indx_create_allocate(struct ntfs_index *=
indx, struct ntfs_inode *ni,
>         run_deallocate(sbi, &run, false);
>
>  out:
> +       run_close(&run);
>         return err;
>  }
>
> --
> 2.43.0
>

Hi Almaz,

Gentle ping on this patch . I have submitted this patch on 23 March
2026 and this patch has been tested by sysbot.

Please let me know if anything else required

Thanks
