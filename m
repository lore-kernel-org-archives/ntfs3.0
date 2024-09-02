Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDA21C16F
	for <ntfs3@lists.linux.dev>; Mon,  2 Sep 2024 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287854; cv=none; b=Enq72mFZ/0PIxcS/95ANrtkHCU06e4w0mVklou41gCHLmxjozNshja3htUZcW/3weAguISlNn5waNMKm9z4kfISvQEg3LbEXNpXi1Yd+gVQcRx5BPtIi2GrbB7R6vfyQiD/hxsTmbkZgQWA3wrTbzCpYdqqp8FvQglmtXjgPzj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287854; c=relaxed/simple;
	bh=QlJUtfucbcB9eU4G1Pzz7EZrVBuytWidgoUWwmGGoxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZvSJrk8bLMUCLHE21mcslxsP38zZp1XbrLmIfpyFWRmY92jW6Ss24R7yJiAcwvOBlyQCFAzM0nVyFKx1ajmt8NZC/a/If9I9CZkpCES6CHMV0l6Yt4qHVks9JyhtDWLdJ8TPoI/WDmywoev6eKxA0ZipTYpgA1MnJ49gW2QRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/u3x3bl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/u3x3bl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8679f534c3so447162366b.0
        for <ntfs3@lists.linux.dev>; Mon, 02 Sep 2024 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725287849; x=1725892649; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksimq/X8z36n93auL3QzW0MCIhynenZ4+E4hepBpL4c=;
        b=m/u3x3blZW8Ar4w9JcdLWMzz/lWkG0t+MPSnvddNbGCq5GKLxftZHd60HB8wyWVUJ2
         x8/+/EDPh30zE5SBUvTEwt1kWOTYmEgTI5eLsOzN3wYaSurcPdDZJAWmn2EA7oq3+Zzn
         9ENzdIHJTs+QvUqXktZekrFOXVKqXucv1NIIeID9kMXFVS5J+rsjF+HIoMOy5XVTAlnm
         WaxLCDyIdbpYidUkxA3ZSSXcLzlexg5UxV+edgWpyrNnSKn+auLUeIiCT67UTXhpTVEN
         v+mIgZfUzBpm1shaoZ7cQtpo5jHNp6dC3IgVwcFNh4jGvQq90btbuZex5KOvdH/3dbHI
         Hqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725287849; x=1725892649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksimq/X8z36n93auL3QzW0MCIhynenZ4+E4hepBpL4c=;
        b=LfDgmcVnE5EJs70pJGeEcZe/8NXvHHWjMKA30L8ezWWiX2BfqBAFtqD5bGuS5zp5Fa
         7EzR3ZhcBN7xMig7ur8pJlP/7n9YfmXAIylHWDst5SLolseU4q3ww9zh6xDlEYPeCuHP
         srdj/GqF9R3DhJKr1+5d5rvIHPYo9fNaaeyqNnUjRw5mEcMdfQsowlIGzbCtIH4LtkUD
         Op/Wm8q/US+4MjNHPY5xckwa+P9VM6QPYgyRRACG5XmkXW35/zHYjvcv/R6+ZLTDEFSc
         GJ3lan3tfeg9au8PPyzFMo2ejyvMhBEXSnUXfqwqPr801JWbsovMMV/5DzpmoVzVCfuR
         Bx8g==
X-Forwarded-Encrypted: i=1; AJvYcCVQNB2lkPighM9C6h+7luYm2WGEjorImZb2U8H/g/fTfFyZasAqN6bfDt1kYfJ2rkOVi41xXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFIctAeumUdF0u65MeVy2x0gOQc+7BCqPKmJeKHpwEcwYFMiDQ
	AXvE8IXIurdP6iQhe3arqHIltrFuhDIHUuYXXslLxzY4zBGhke1uYseXZrrZFBVt8+qLrrDox/u
	t
X-Google-Smtp-Source: AGHT+IFN/BuiU/VQTETMCNCGYmY9dG4wN7RdxT/6udZdCaJHhUriHjg2+YKFMK55XW9pJnkO/V6Duw==
X-Received: by 2002:a17:907:7b92:b0:a7d:e98c:5bd1 with SMTP id a640c23a62f3a-a89d8782279mr554770666b.26.1725287849184;
        Mon, 02 Sep 2024 07:37:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891964e5sm570121066b.98.2024.09.02.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:37:28 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:37:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fs/ntfs3: Use swap() to improve code
Message-ID: <9212714c-7f75-47da-bc34-48d775925194@stanley.mountain>
References: <20240826103939.63548-2-thorsten.blum@toblux.com>
 <041F9CBB-17E9-4D6F-B981-BC861E1048CB@toblux.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <041F9CBB-17E9-4D6F-B981-BC861E1048CB@toblux.com>

On Mon, Sep 02, 2024 at 04:26:16PM +0200, Thorsten Blum wrote:
> On 26. Aug 2024, at 12:39, Thorsten Blum <thorsten.blum@toblux.com> wrote:
> > 
> > Use the swap() macro to simplify the code and improve its readability.
> > 
> > Fixes the following Coccinelle/coccicheck warning reported by
> > swap.cocci:
> > 
> >  WARNING opportunity for swap()
> > 
> > Compile-tested only.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> > ---
> > Changes in v2:
> > - Address kernel test robot feedback and assign match_offset as before
> > - Link to v1: https://lore.kernel.org/linux-kernel/20240731135403.80805-2-thorsten.blum@toblux.com/
> > ---
> > fs/ntfs3/lib/lzx_decompress.c | 3 +--
> > 1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fs/ntfs3/lib/lzx_decompress.c b/fs/ntfs3/lib/lzx_decompress.c
> > index 6b16f07073c1..4d5701024f83 100644
> > --- a/fs/ntfs3/lib/lzx_decompress.c
> > +++ b/fs/ntfs3/lib/lzx_decompress.c
> > @@ -512,8 +512,7 @@ static int lzx_decompress_block(const struct lzx_decompressor *d,
> > * the same code.  (For R0, the swap is a no-op.)
> > */
> > match_offset = recent_offsets[offset_slot];
> > - recent_offsets[offset_slot] = recent_offsets[0];
> > - recent_offsets[0] = match_offset;
> > + swap(recent_offsets[offset_slot], recent_offsets[0]);
> > } else {
> > /* Explicit offset  */
> > 
> > -- 
> > 2.46.0
> > 
> 
> Hi Konstantin,
> 
> I just noticed that v1 of this patch is already in next (commit 
> 7495ce846bbe4f38d7ea5e023e44ad864b6348ad), but v2 fixes a possible bug 
> reported by kernel test robot (match_offset is still used later).
> 
> Could you take another look at it and apply v2 if possible?

The kbuild-bot only complained after the code was already merged.  Here is the
bug report:

https://lore.kernel.org/all/38752402-3a41-45f0-97ba-4f208d17337b@stanley.mountain/

I don't know if ntfs3 git tree rebases, but generally the advice we would give
would be to assume it isn't and write a Fixes commit which can be applied on
top instead of a v2.  If it's a rebase tree, the maintainer will know how to
fold the two patches together.

Thanks for following up on this.

regards,
dan carpenter

