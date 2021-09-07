Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657B72
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 16:25:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id m4so17465917ljq.8
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Tg0EHKkItjWDiEA+fsZ1a2tx5JVSC+kcRVqQGEHCSHA=;
        b=j/bw1IZaL0/LtUVfO364susiJxdEyFn4BQ2MkKinL+gubHKsIQTF8Yp1iCaSWK5xrv
         vjp+mjTy7Ph+Bf/klgDHvUE8Mdrz80RNnpzhTWQOXB7Gwtr/GckvNwIQTpWcoHevFHUw
         wSmIEp0fuCo1jL92GszSd4ydlUkFov2EsJjsV92bomUw0LRHxicPWrcu+nrGIh3lunGL
         LxA+rwZuDaCYBTkRyhSYproUKZvUuaiIXpMyvmd/mBptanvn05wFM826WZwX9pj7ZQQa
         V1p07gWh6orm+/m7kyA33xKh6OsNilvWPcY/yY9D6UZHswyFtV2ER+pvai8fpS2/pyva
         906A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Tg0EHKkItjWDiEA+fsZ1a2tx5JVSC+kcRVqQGEHCSHA=;
        b=sHNkuuAmxrGYfKAkiRkX6vE6DnY6NnjnYw8KXNMlChS//kiXyGUVSWCQfp8K9FLDTD
         CkHePvKniMpkChS0tMjccPVe/0q6apL+ehdvos22t3AM0tIYf4RLYp+pctQQ1VnMJSOG
         tF5lJFPHzhb/akIWKVykAvF1+aSSWzjELrGdGFXNGjgENJywi6QMmKYSUptC1rGd48Lf
         uN0d3BN3dB+00bvYFFZOb95mEgaA28mmFEBhzcNc38KZyS1eIYwEa8TP/YddtNto9I43
         5PodrQXZZ+9G/GO4HYzhJKjwL/XQBU2t+OLDarSMqwNoMWfNmj9dH5RUaFYTFwWrivvA
         2Xog==
X-Gm-Message-State: AOAM532/BFgMvyfXaq8dIeTbDcyPtZM+9iuf7v9OCW4M+M6aYKo6PNL5
	9F0uJRtCryhPnvucGsRe8C0=
X-Google-Smtp-Source: ABdhPJx6Oc/Qs3swNhEPu+sVGZpxDFpHPcBUKJZxHPw8vmoR+DtOCDmWjKBZbVo8hfckSOg6TyqImg==
X-Received: by 2002:a2e:350e:: with SMTP id z14mr15475520ljz.183.1631031922358;
        Tue, 07 Sep 2021 09:25:22 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id e15sm1466391ljn.25.2021.09.07.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 09:25:21 -0700 (PDT)
Date: Tue, 7 Sep 2021 19:25:20 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Joe Perches <joe@perches.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] fs/ntfs3: Use consistent spacing around '+'
Message-ID: <20210907162520.pi6djmu32iajayme@kari-VirtualBox>
References: <20210831181505.1074767-1-kari.argillander@gmail.com>
 <20210831181505.1074767-3-kari.argillander@gmail.com>
 <1d303f4553e67abee4f0c4cdc32231813a4bcb3f.camel@perches.com>
 <20210902081020.g5hclc45zjng3ll2@kari-VirtualBox>
 <bb8fff4c-ae09-cab0-cd71-c34b872c9211@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb8fff4c-ae09-cab0-cd71-c34b872c9211@paragon-software.com>

On Tue, Sep 07, 2021 at 07:23:13PM +0300, Konstantin Komarov wrote:
> 
> 
> On 02.09.2021 11:10, Kari Argillander wrote:
> > On Wed, Sep 01, 2021 at 09:22:19PM -0700, Joe Perches wrote:
> >> On Tue, 2021-08-31 at 21:15 +0300, Kari Argillander wrote:
> >>> Use consistent spacing around '+' for better code reading. Checkpatch
> >>> will also be happy.
> >>
> >> I think you should remove the + instead
> > 
> > Konstantin can you look this as this was introduce by you just couple
> > days ago? 
> > 
> >>
> >>> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> >> []
> >>> @@ -1451,7 +1451,7 @@ int ni_insert_resident(struct ntfs_inode *ni, u32 data_size,
> >>>  		attr->res.flags = RESIDENT_FLAG_INDEXED;
> >>>  
> >>>
> >>>  		/* is_attr_indexed(attr)) == true */
> >>> -		le16_add_cpu(&ni->mi.mrec->hard_links, +1);
> >>> +		le16_add_cpu(&ni->mi.mrec->hard_links, + 1);
> >>
> >> 		le16_add_cpu(&ni->mi.mrec->hard_links, 1);
> >>
> >>
> 
> Hi, Kari, Joe!
> Yes, '+' can be removed, it was added for better visibility,
> but it's subjective. 
> After checking code - it's the only place with '+1', so let's remove it.

Already done in v2 [1].

[1]: lore.kernel.org/ntfs3/20210907083441.3212-1-kari.argillander@gmail.com
