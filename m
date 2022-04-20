Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AAB1867
	for <ntfs3@lists.linux.dev>; Wed, 20 Apr 2022 17:42:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id w19so4271956lfu.11
        for <ntfs3@lists.linux.dev>; Wed, 20 Apr 2022 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stargateuniverse.net; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9ZtPmSwEAA6xfi4MdME3HgPJwzIMbi+JpH9r3t9jzAY=;
        b=aVTtXGZUtBM4jiqAAwAxuKw4ZESNfhYLgElsL8BBwyFgGAp5J2BZeTHBTyWrmd4Pnu
         Uqv0ooXZmVI5aEXY9/2qgcuVb2KvfhO09BqkDiHiq6Zi66TYioG9QFNQAzHbqLeHbPFI
         22OJMdqX95ksOBHaOTZwSNTVaejeAa50cYm7ksy9LneDuIHAtxuEBBhgH/sTt63R43lR
         nsb3NGPax9Po1yL75CNmKaXAQKCTgeiB1U5ZzqcWG5nAkzbFuDpCJAjbndLjuwXlQVnw
         C/UOP2g8HmEgMpCoUSM+R2UbAYhzuiIlo5q7KUV5sEFcJfpm7rR4MoOoFC92agGxo5EK
         T15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9ZtPmSwEAA6xfi4MdME3HgPJwzIMbi+JpH9r3t9jzAY=;
        b=jCaCXXARBw1UrKtDNVvzr2WrO93MdzA2lLPmxJ3nJFih7/7vRXqgUBeul7tzYCYxER
         CpRYipyot+9Mp/C72gy105brfBG/I0nI2waQqp3sWVuYLPu01jvu2Lh2z/H33+nWGp3K
         VAB0yvZKm4GY4xpR+FUkO6GCNI+WazX9bSFxo1JO1TDa+NNxMQvoW1h+hqebKANBTZVt
         pU0Oms4JopMF84gLmRT0LPJWywii/dUx8v5P4CXUxHEgA3MLWf7JH93d040gWEqna/cS
         57kCK7YMeKmE2tc/enCtrUYSj66Qi1rur56FW5BvyXpS98AR/l0QywhHgwm08sOiwNP4
         cAIg==
X-Gm-Message-State: AOAM530otUuOOjKfnqUPTHPmlVhyp0Axfudw8I4NvZFR/lJw4eEDqs/l
	K3mpUWX59QVvLUP7Bq11ZtfHtDyrRDSalJ+L
X-Google-Smtp-Source: ABdhPJwPGV24jAknH7tSun2mjOo9fsrAIzUfL/3NmzW7PA4Gonj5tTkP4QiZ0LoIlPVmRU1OjPrqnQ==
X-Received: by 2002:a19:ee05:0:b0:46e:2f8d:db76 with SMTP id g5-20020a19ee05000000b0046e2f8ddb76mr15434118lfb.321.1650476575679;
        Wed, 20 Apr 2022 10:42:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id n4-20020a196f44000000b0047195a0fd47sm927421lfk.5.2022.04.20.10.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 10:42:55 -0700 (PDT)
Message-ID: <b5eb5779-5dba-c266-4fa0-37d47b53614a@stargateuniverse.net>
Date: Wed, 20 Apr 2022 20:43:01 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC] ntfs3: Use the same order for acl pointer check in
 ntfs_init_acl
Content-Language: en-US
To: Yang Xu <xuyang2018.jy@fujitsu.com>,
 almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
References: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Kari Argillander <kari.argillander@stargateuniverse.net>
In-Reply-To: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I do not understand why this RFC and not a patch.

On 20.4.2022 11.48, Yang Xu wrote:
> Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
> style
> 
>         error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>         if (error)
>                  return error;
> 
>          if (default_acl) {
>                  error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
>                                         default_acl, XATTR_CREATE);
>                  posix_acl_release(default_acl);
>          } else {
>                  inode->i_default_acl = NULL;
>          }
>          if (acl) {
>                  if (!error)
>                          error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
>                                                 acl, XATTR_CREATE);
>                  posix_acl_release(acl);
>          } else {
>                  inode->i_acl = NULL;
>          }
> 	...
> 
> So for the readability and unity of the code, adjust this order.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>   fs/ntfs3/xattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index afd0ddad826f..64cefa869a61 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -642,13 +642,13 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
>   		inode->i_default_acl = NULL;
>   	}
>   
> -	if (!acl)
> -		inode->i_acl = NULL;
> -	else {
> +	if (acl) {
>   		if (!err)
>   			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
>   					      ACL_TYPE_ACCESS);
>   		posix_acl_release(acl);
> +	} else {
> +		inode->i_acl = NULL;
>   	}
>   
>   	return err;
