Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B21FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 20:46:33 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id he28so4553738qtb.13
        for <ntfs3@lists.linux.dev>; Sat, 02 Jul 2022 13:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N+mq0Y7evuA/KRdL0BLthRO/Vn35FRdsKAND75BcEFY=;
        b=AUGeP9V+3E+lVbQ2IzhyK/D4WNZkXavbzjY+Vd9/o6cdIGFuf4vcfb5wBpIpPSD2U+
         nB/wM3DN8N6S4hFtfE+BlD2dXzMMWEAbJdOtoGORev06lsu2Dhhn+K25qPzmExM6suqk
         6VfONdRiHt5xou98e4Ln/rToVubtO2beeZ4zCzT8W2i8rws9MDya+fFXt31otZQ6PqfE
         RdEK4yjOmj51FeqFO/r2bNsLiliJaPqtmfvsL1K7T8aTNHum07O8b/xmEAIug6XyD27D
         CLDQmwnEYkiNJCk6ml2l8gLqUP+VB7q7NByfsX1m+aAPt39AheEr/8Yo/I7W/ahE5JgP
         sIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N+mq0Y7evuA/KRdL0BLthRO/Vn35FRdsKAND75BcEFY=;
        b=rUqDgFTZBq1ERlH1XgKNVjjx0p8CgQaIrwWGOHTyFe2aWapWmF7FvR/HRjUaGVOd4x
         f2DiLy7h9VuV4YNTYvwJs8w3aIWYA2lmqd8wZSpvswlXpLCbsVKzAsElU1wP8rl1PgVd
         cE+TsIDa1cXIvEWeN87WfuEPigbewPBgenpANK4HrWN6zJs3/jmUIq8HudesDYWYo66Q
         ztZYRQf3IE2z8qjHneWmmE0dU5x1lv0zBz8/n8NShOnRD1lOiDhxCzUPzVXU81ZRNeLf
         T4s8Mz7T0qC4WXF2GBCOJijw5ktRrHY78JAdDMX3EEVh0lNslXT2mIv/21As83jjzZGA
         f6Tw==
X-Gm-Message-State: AJIora/bA3GEtDTaUJlki+9PWIorf8LBqL1aX2CBRkDnvwvXytihsiVG
	svH0sCOAzOuTd8ZuzY/Ey4MNDImNRQc=
X-Google-Smtp-Source: AGRyM1vjFgjitLBuQOeSuo/OKde0C2zCG2i7rCQmnsS9b/7NGq3EkHHEPjctpLsqsrGPdIjCur6S0A==
X-Received: by 2002:a05:6214:19cb:b0:470:8fae:eb90 with SMTP id j11-20020a05621419cb00b004708faeeb90mr21566832qvc.92.1656794792059;
        Sat, 02 Jul 2022 13:46:32 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:e838:b1c2:b125:986a])
        by smtp.gmail.com with ESMTPSA id r132-20020a37a88a000000b006af373cec2csm12713874qke.70.2022.07.02.13.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 13:46:31 -0700 (PDT)
Date: Sat, 2 Jul 2022 13:46:31 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
	vneethv@linux.ibm.com, oberpar@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	almaz.alexandrovich@paragon-software.com,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	linux-s390@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/4] s390/cio: Rename bitmap_size() as idset_bitmap_size()
Message-ID: <YsCup7Kjzm9QWeZ5@yury-laptop>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>

On Sat, Jul 02, 2022 at 08:29:09PM +0200, Christophe JAILLET wrote:
> In order to introduce a bitmap_size() function in the bitmap API, we have
> to rename functions with a similar name.
> 
> Add a "idset_" prefix and change bitmap_size() into idset_bitmap_size().
> 
> No functional change.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/s390/cio/idset.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/s390/cio/idset.c b/drivers/s390/cio/idset.c
> index 45f9c0736be4..e1e77fe080bf 100644
> --- a/drivers/s390/cio/idset.c
> +++ b/drivers/s390/cio/idset.c
> @@ -16,7 +16,7 @@ struct idset {
>  	unsigned long bitmap[];
>  };
>  
> -static inline unsigned long bitmap_size(int num_ssid, int num_id)
> +static inline unsigned long idset_bitmap_size(int num_ssid, int num_id)
>  {
>  	return BITS_TO_LONGS(num_ssid * num_id) * sizeof(unsigned long);
>  }
> @@ -25,11 +25,11 @@ static struct idset *idset_new(int num_ssid, int num_id)
>  {
>  	struct idset *set;
>  
> -	set = vmalloc(sizeof(struct idset) + bitmap_size(num_ssid, num_id));
> +	set = vmalloc(sizeof(struct idset) + idset_bitmap_size(num_ssid, num_id));
>  	if (set) {
>  		set->num_ssid = num_ssid;
>  		set->num_id = num_id;
> -		memset(set->bitmap, 0, bitmap_size(num_ssid, num_id));
> +		memset(set->bitmap, 0, idset_bitmap_size(num_ssid, num_id));

We don't need bitmap_size() here, we need to replace memset() with
bitmap_zero().

>  	}
>  	return set;
>  }
> @@ -41,7 +41,7 @@ void idset_free(struct idset *set)
>  
>  void idset_fill(struct idset *set)
>  {
> -	memset(set->bitmap, 0xff, bitmap_size(set->num_ssid, set->num_id));
> +	memset(set->bitmap, 0xff, idset_bitmap_size(set->num_ssid, set->num_id));

Same, but bitmap_fill().

>  }
>  
>  static inline void idset_add(struct idset *set, int ssid, int id)
> -- 
> 2.34.1
