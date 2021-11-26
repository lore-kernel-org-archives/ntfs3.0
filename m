Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD5F68
	for <ntfs3@lists.linux.dev>; Fri, 26 Nov 2021 12:04:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id t26so23702639lfk.9
        for <ntfs3@lists.linux.dev>; Fri, 26 Nov 2021 04:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YxyZ9gdTy9bhgmKGDvjt1OqsoU5QbnhRgr31B5lxsQ8=;
        b=G/tfhH+seqpe5eRIgzKUvqQ4ZdYppqLO3iLy9LlLgBdKJHL/BGK6ZEkyTTDvDU43ow
         htrjx6y+CcFzoP/nAy+MditxFrouT+uASzE6paGbvJCMtmgOsrOnfYi+kvVLX6VPZiKc
         PsytU2gvBEGjYs5KVotRLsw+joP8nxHiFLy86m08ZNkAYwdy8PVKhs5n3jjpODButjJb
         58kMDzPrDxhWa6PQ3w3blM6LsaOEJE+yHQEudj8BJSlTgJquEcPk7Tv3uk49uvtBBPUF
         iVY7oKaUmoaJchr7HW9Ya2es8j0BJcRmKjcBWfEcv9XIN+76Pa0YPcxlL+6J9Ac+KHIg
         BrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YxyZ9gdTy9bhgmKGDvjt1OqsoU5QbnhRgr31B5lxsQ8=;
        b=LwzPqRYZnUqv28Vdv3+pAG7EbJ5JhTmB+OUeKbImqhn8oxiFZAWAWAhr3NiWZvU0ua
         vAw0k3uIU/Um0jDigkcnQ/ukCKkB9TwsZO/qQvMXVBCJCc5tLhxSSMQ2seUyTJLxd0X0
         SbRkrizoRcp5OWwNm0pyjBhAw3OYlFs4A8MY0G5+WOm8dgp7b+od6o6FLiCmtAnJRpTE
         HS/mb29sIzFmHCuH21N8MG8SxdlrBz6ydE6yYikZHspPMdR7QnTFPVMFwZGktefMDJio
         zCG/GnnDJeRKvcwZLKR+aYDM36NC0IGEM9+yCKUTKhSOyYcBIALbWJHpFqx+0clTsJpB
         b7oA==
X-Gm-Message-State: AOAM530WgdxPiDTH054P2N02rEFhnfUree2+TabpCVgM2qB1spv7x6D3
	+9AJN65bVhpKvfabXau09PA=
X-Google-Smtp-Source: ABdhPJw8VxjE3Fvmjm8u7IyTUqEqxN3gTr6eseY4RcO3oLy4+sb8778tWbRpveYqFJLx8khfKf2w0w==
X-Received: by 2002:ac2:5dc2:: with SMTP id x2mr29641912lfq.228.1637928267102;
        Fri, 26 Nov 2021 04:04:27 -0800 (PST)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id a25sm559301lfm.250.2021.11.26.04.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 04:04:26 -0800 (PST)
Date: Fri, 26 Nov 2021 14:04:25 +0200
From: Kari Argillander <kari.argillander@gmail.com>
To: Enrico Mioso <mrkiko.rs@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH 1/2] fs/ntfs3: clarify why $Extend init is being skipped
Message-ID: <20211126120425.hp6gc3crovp4ez5o@kari-VirtualBox>
References: <20211026205435.126133-1-mrkiko.rs@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026205435.126133-1-mrkiko.rs@gmail.com>

On Tue, Oct 26, 2021 at 10:54:35PM +0200, Enrico Mioso wrote:
> $Extend init may be skipped due to NTFS version lower than 3. Be more
> clear on this.
> 
> Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/fsntfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 4de9acb16968..abe74dc9ce31 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -189,7 +189,7 @@ int ntfs_extend_init(struct ntfs_sb_info *sbi)
>  	struct MFT_REF ref;
>  
>  	if (sbi->volume.major_ver < 3) {
> -		ntfs_notice(sb, "Skip $Extend 'cause NTFS version");
> +		ntfs_notice(sb, "Skipping $Extend init due to NTFS version lower than 3");
>  		return 0;
>  	}
>  
> -- 
> 2.33.1
> 
> 
