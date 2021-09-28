Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED332F80
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 22:07:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u18so2043381lfd.12
        for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 15:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nu0M98UVqY88vsCYKGIMtrGkVcnQeCcutmGcWJYHcYw=;
        b=qnJFrjIc6ciRpxDFYfcEPFJjOIt1yOxna0RyqPuCEOOOZ3nR0c82HbL65x++e/tT1c
         +YskyvT6zlw3DbOfhyJKytexTRm7TX3fJMNfLTZ1rxye3aWMemh1okoCjcxvbl/2s6Q1
         33448FoNunyCdhlxsxgDpD9dsXvP6hLDLmMRO3UEC4IYlmPrrrDDXJCbNNPr/T1SF2eI
         knXgbxzg139ncvpvxNNkQxHX07WruDxE5TCl89TPtww8uDxArbeEX2ZYFHQp1PagJIQL
         o7IIy7DmaAuiLMtu51lGGQBDEE9l6COLN2hEd7v4OnaAK4DxgCsZDmwdzXXmnJxowyYE
         0hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nu0M98UVqY88vsCYKGIMtrGkVcnQeCcutmGcWJYHcYw=;
        b=gvsmKjEgZM1b5cOWC6fK5AaHTnKEtd/PdZfh/1PW3MpTQHX9PTPvSd48d6w8/DOUs6
         HluUyOQZttEjf9/pqsaR9fviUks2glMvICvIRghrUcjp5GHb1cDbUCiM4zOoGPzDcpEz
         meNpKUC7TAAF/DJNNQMjjhb4/Bs3mjtFfig6+IhpVg2nj7Am86qjpPUvg9foMzhc4ExX
         XNnTSyj+o5kpmUEoMtSjjsXVpo18Dz895QJ1/YZipMjMpGFRl8Fcin/WYjpz7tJrGQCW
         R8R5TmlkAaNQiyXoKgLICfXusNJpRagL/ZUJk6aZepNY1KyiT1bqHt1UKVENBRqXgI+8
         Ioag==
X-Gm-Message-State: AOAM532SBpYMVTb5RCU85D5u+VUKPcjDGY5y9izvSgitU+hW/5/Kj+6F
	E3OqHtfGGYmhbfPy74v9oaM=
X-Google-Smtp-Source: ABdhPJypqpd7HPYxMfN1gg3KcISmSFh8tkYidRfDc3KWb3iqWMvkhCX5LPTcpSNaJrr4uC95u4u+DA==
X-Received: by 2002:a2e:5c88:: with SMTP id q130mr2444278ljb.170.1632866840453;
        Tue, 28 Sep 2021 15:07:20 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w26sm44272ljo.33.2021.09.28.15.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 15:07:19 -0700 (PDT)
Date: Wed, 29 Sep 2021 01:07:18 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Message-ID: <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
References: <20210928183300.12946-1-mark@harmstone.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928183300.12946-1-mark@harmstone.com>

On Tue, Sep 28, 2021 at 07:33:00PM +0100, Mark Harmstone wrote:
> I'm not quite sure what was intended by the logic in ntfs_cmp_names_cpu,
> but it was broken when comparing case-insensitively. If the strings
> matched but differ in case, diff1 would be non-zero, meaning that the
> function would always return a non-zero value.

So I have checked this now. Yes function will always return non-zero
value if we use bothcase and this is intended behavier. But if 
bothcase is false and upcase is not NULL then function can return zero
value.

Do you have some problems? There could be that in some place this or
other cmp function is called with wrong parameters. Example with
bothcase true when only case_insentive is needed. 

I admit that this was not clenest way of implementing this. Maybe we
should make bothcase enum with three values. Example CASE_SENSITIVE,
CASE_INSENTIVE, CASE_BOTH. I do not like name BOTH so if anyone know
any better please tell.

  Argillander
> 
> Signed-off-by: Mark Harmstone <mark@harmstone.com>
> ---
>  fs/ntfs3/upcase.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ntfs3/upcase.c b/fs/ntfs3/upcase.c
> index b5e8256fd710..dd28c2133a4c 100644
> --- a/fs/ntfs3/upcase.c
> +++ b/fs/ntfs3/upcase.c
> @@ -74,31 +74,29 @@ int ntfs_cmp_names_cpu(const struct cpu_str *uni1, const struct le_str *uni2,
>  	size_t l1 = uni1->len;
>  	size_t l2 = uni2->len;
>  	size_t len = min(l1, l2);
> -	int diff1 = 0;
> -	int diff2;
> +	int diff;
>  
>  	if (!bothcase && upcase)
>  		goto case_insentive;
>  
>  	for (; len; s1++, s2++, len--) {
> -		diff1 = *s1 - le16_to_cpu(*s2);
> -		if (diff1) {
> +		diff = *s1 - le16_to_cpu(*s2);
> +		if (diff) {
>  			if (bothcase && upcase)
>  				goto case_insentive;
>  
> -			return diff1;
> +			return diff;
>  		}
>  	}
>  	return l1 - l2;
>  
>  case_insentive:
>  	for (; len; s1++, s2++, len--) {
> -		diff2 = upcase_unicode_char(upcase, *s1) -
> +		diff = upcase_unicode_char(upcase, *s1) -
>  			upcase_unicode_char(upcase, le16_to_cpu(*s2));
> -		if (diff2)
> -			return diff2;
> +		if (diff)
> +			return diff;
>  	}
>  
> -	diff2 = l1 - l2;
> -	return diff2 ? diff2 : diff1;
> +	return l1 - l2;
>  }
> -- 
> 2.31.1
> 
> 
