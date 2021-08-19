Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66FB6D1B
	for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 11:05:17 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u22so11973872lfq.13
        for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dwNmdQpLJD7B+msYQhGKkmB2rXBh0sZ7boDUuFMKREc=;
        b=VHrkkTsg+SZWiv/iXZ6ryn/LWRC9qlLL3CrXx2Zduz1l8d+IulS6BzZVT6lZbKLWRc
         kI/dVT59/Ll9tg/KZiN6tKXWMcZuIkFTPQF22qlVQ0AfBhV573YmTcKhSMleWfJpxq3H
         WnAotFYdjULuaIAE2kTy81wHqn713ztZNo0esKNNmn9uy5pO8KLZeUKkUvpR/IvA08H7
         kByRggkdEdOSgXmN+m6CpDLXNRTCyh+3xYIby8tLAMYM8fhzhDa3P3uLk1qKJpFY2tc9
         4cEtWzJZp313bw+e6o2ld95QS3nZNGncEwlAV4OcbZnoLNO2rDUf74qdMfsEi/s8aWUP
         ygrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dwNmdQpLJD7B+msYQhGKkmB2rXBh0sZ7boDUuFMKREc=;
        b=N3A0B6sdlJ79FClofC0XkhmPre2uc/mBjNj9C4DdAsESApk446/15J/BReiawshV96
         WKtgYWuzIL3zU0P2Nc4YebPXJsgaW3NKbn5XOfnCy0dJyIOCuIGCUejwh6tkFRNAY+Jn
         yXLvWu9RjmKQF8B2FRmxK4GAsMMLDs8JnM/Vt9huTmxJ61dV6xwDzORJg0qERGJqKhea
         svgXya+le4URqhSURWIRSPiMWZwylriZgl9Ho0z2TYiLw5YcgCmNjUeJ2xXdLW2qdxeF
         GJ+8tnRyQRW6w8Vy/3yeiRtZdTLN6/Wjn+nOr7+OmrtsdDN8P3jAv5lwPuPLX/2qVSFD
         mk6A==
X-Gm-Message-State: AOAM532r52yqVLlritQz45QbMMfBDbzQ9JRfeWsxvOhnpYw3xG66dZYl
	CreLIzsshfk2qtdzsw2/lLo=
X-Google-Smtp-Source: ABdhPJzstQPsh+acMze1ytayn7jedZsnrRa37ObK3H8IBRO1hHIC6fDDqltqS1wBql6oRiSEcmodOQ==
X-Received: by 2002:ac2:58d4:: with SMTP id u20mr9822418lfo.157.1629371116056;
        Thu, 19 Aug 2021 04:05:16 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id d4sm270087lfg.261.2021.08.19.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:05:15 -0700 (PDT)
Date: Thu, 19 Aug 2021 14:05:13 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: almaz.alexandrovich@paragon-software.com, nathan@kernel.org,
	ndesaulniers@google.com, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] fs/ntfs3: Remove unused including <linux/version.h>
Message-ID: <20210819110513.wdyry5rp7orw3s36@kari-VirtualBox>
References: <1629361417-94657-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629361417-94657-1-git-send-email-jiapeng.chong@linux.alibaba.com>

On Thu, Aug 19, 2021 at 04:23:37PM +0800, Jiapeng Chong wrote:
> Eliminate the follow versioncheck warning:
> 
> ./fs/ntfs3/inode.c: 16 linux/version.h not needed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/inode.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index bf51e29..bb01f1b 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -13,7 +13,6 @@
>  #include <linux/namei.h>
>  #include <linux/nls.h>
>  #include <linux/uio.h>
> -#include <linux/version.h>
>  #include <linux/writeback.h>
>  
>  #include "debug.h"
> -- 
> 1.8.3.1
> 
