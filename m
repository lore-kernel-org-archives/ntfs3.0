Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4072
	for <ntfs3@lists.linux.dev>; Mon, 30 Aug 2021 17:13:18 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id i28so27132303ljm.7
        for <ntfs3@lists.linux.dev>; Mon, 30 Aug 2021 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OUPwfutq3p7gRWJvfB60/NPXvXQ2A50TJJGc7tlQfuw=;
        b=JJT9ce0mfNp3+ygIakwtMiwX+OOwlY3n374crFaEkg5Ussedn1qSooGZCaIky4uC1s
         13bCBCEiwYukyD0Po6kQ7Q4RDPkYe+3BTbcucXlFu783+EFZ5ytc/FQFtalitcZcIwfu
         CK5gpdxfb4+rup74dxxFWBI5KURKN0AoXjSFjw2iFZFqsjoRLDTaENp4CFUgGyNRg9Kj
         nZ8tNl7UGL01OqB2irasylknj2ek8HESvZFx+NGeyP7mhdTbRqNSB1F6xZD00dNVFZlM
         d8aEZLrqy3yAs3RofEur4SKeNKkIlhT/yKfsk+brXoaCAilvXuTSQw+1bEE32mOBnxxI
         m+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OUPwfutq3p7gRWJvfB60/NPXvXQ2A50TJJGc7tlQfuw=;
        b=r5pFO2VC03Rln70QSKa3VmfmAJ+qFYUnsIgtnyq5htKMp+t+9/pOZ42MWWNBG81W63
         iPCteDvK1x3M2r/DtYl1HGeBNZIv3YGZZnT3dl6P1r+dY/DWDPtqW550t3zndCM9XYdH
         HeQNMFNKGwmyNli6oHlR7+sRhWQvM47HJk6sKeI1jXgtqWS3lQvsnob/phWqufVkEsC2
         vNt5BQ11y5tqUtIE0XKDpKmQVk57jQLoKmGaKAiD0JsQUClbObofCa70J0CvulMO3p7A
         7GItZpG+NGFV7KCyy4nORbhM/4TLIvuBdHnmUJBkVxmRNLaQj9xkL+HfyLmg+9mDozMf
         5ItQ==
X-Gm-Message-State: AOAM532SkuNiaMSliq6/dGuqnv3SNkWUv41ABFTist7CrbWtwLAnRpxD
	GvTdEQSGsh+VkXS4fgpGwc8=
X-Google-Smtp-Source: ABdhPJymPs3gpej4uKd2UGNXGH7ZX8Tj+PkEwiRTJBibfw29wJu3rmodCV/735hhtIK83N/esjv7KA==
X-Received: by 2002:a2e:1514:: with SMTP id s20mr21972764ljd.34.1630343597104;
        Mon, 30 Aug 2021 10:13:17 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i5sm1908829ljm.33.2021.08.30.10.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 10:13:16 -0700 (PDT)
Date: Mon, 30 Aug 2021 20:13:14 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	joe@perches.com, dan.carpenter@oracle.com, willy@infradead.org,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH] Restyle comments to better align with kernel-doc
Message-ID: <20210830171314.hya2vn3vyohcn4dk@kari-VirtualBox>
References: <20210729134943.778917-1-almaz.alexandrovich@paragon-software.com>
 <20210803115709.zd3gjmxw7oe6b4zk@kari-VirtualBox>
 <22f979ec-95e5-e95a-0d58-9eb43f2038aa@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f979ec-95e5-e95a-0d58-9eb43f2038aa@paragon-software.com>

On Mon, Aug 30, 2021 at 07:10:36PM +0300, Konstantin Komarov wrote:
> 
> 
> On 03.08.2021 14:57, Kari Argillander wrote:
> > Capitalize comments and end with period for better reading.
> > 
> > Also function comments are now little more kernel-doc style. This way we
> > can easily convert them to kernel-doc style if we want. Note that these
> > are not yet complete with this style. Example function comments start
> > with /* and in kernel-doc style they start /**.
> > 
> > Use imperative mood in function descriptions.
> > 
> > Change words like ntfs -> NTFS, linux -> Linux.
> > 
> > Use "we" not "I" when commenting code.
> > 
> > Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> > ---
> > Yes I know that this patch is quite monster. That's why I try to send this
> > now before patch series get merged. After that this patch probebly needs to
> > be splitted more and sended in patch series.
> > 
> > If someone thinks this should not be added now it is ok. I have try to read
> > what is kernel philosophy in case "patch to patch" but haven't found any
> > good information about it. It is no big deal to add later. In my own mind I
> > do not want to touch so much comments after code is in.
> > 
> > I also don't know how easy this kind of patch is apply top of the patch
> > series.
> 
> Thanks for the patch. I've applied it to create uniform style of comments.

There where probably lot of merge conflicts as this patch was made for
v27. Also lot of changes since v28 in the code base. You can always ask
submitter to rebase patch and resend. Also there where quite lot of nack
about this patch so I though this should be dropped, but maintainer
decision I guess.

> Also removed double line addition from patch:

Just ask and submitter will do it for you.

> 
> @@ -269,22 +260,28 @@ enum RECORD_FLAG {
>  	RECORD_FLAG_UNKNOWN	= cpu_to_le16(0x0008),
>  };
> 
> -/* MFT Record structure */
> +/* MFT Record structure, */
>  struct MFT_REC {
>  	struct NTFS_RECORD_HEADER rhdr; // 'FILE'
> 
> -	__le16 seq;		// 0x10: Sequence number for this record
> -	__le16 hard_links;	// 0x12: The number of hard links to record
> -	__le16 attr_off;	// 0x14: Offset to attributes
> -	__le16 flags;		// 0x16: See RECORD_FLAG
> -	__le32 used;		// 0x18: The size of used part
> -	__le32 total;		// 0x1C: Total record size
> +	__le16 seq;		// 0x10: Sequence number for this record.
> +	__le16 hard_links;	// 0x12: The number of hard links to record.
> +	__le16 attr_off;	// 0x14: Offset to attributes.
> +	__le16 flags;		// 0x16: See RECORD_FLAG.
> +	__le32 used;		// 0x18: The size of used part.
> +	__le32 total;		// 0x1C: Total record size.
> +
> +	struct MFT_REF parent_ref; // 0x20: Parent MFT record.
> +	__le16 next_attr_id;	// 0x28: The next attribute Id.
> 
> -	struct MFT_REF parent_ref; // 0x20: Parent MFT record
> -	__le16 next_attr_id;	// 0x28: The next attribute Id
> +	__le32 used;		// 0x18: The size of used part.
> +	__le32 total;		// 0x1C: Total record size.
> 
> -	__le16 res;		// 0x2A: High part of mft record?
> -	__le32 mft_record;	// 0x2C: Current mft record number
> +	struct MFT_REF parent_ref; // 0x20: Parent MFT record.
> +	__le16 next_attr_id;	// 0x28: The next attribute Id.
> +
> +	__le16 res;		// 0x2A: High part of MFT record?
> +	__le32 mft_record;	// 0x2C: Current MFT record number.
>  	__le16 fixups[];	// 0x30:
>  };
> 
