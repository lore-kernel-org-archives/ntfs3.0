Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30223A4
	for <ntfs3@lists.linux.dev>; Fri, 22 Apr 2022 08:51:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id h27so12839915lfj.13
        for <ntfs3@lists.linux.dev>; Fri, 22 Apr 2022 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0qrl7VfFdydVs4dilnimskLHm3Pr4FcqtJFxCKtM1Yg=;
        b=Y6zo+EzR9UelJqrjklp1jAhhye+mC0qKPF5pldTeGkf71BhUnUTlUznfQMRte7P2uL
         YZqu4KctqFBu/ipi4IpKGrMWGeudTynFrgplFHnSUfztfgscSOza1MwuK6inA+zfqOQO
         Q+oY7O7mNoyflAi7UVp64o71ehhK1psfRngwAGaGIHXbtXVH0rp37GnW2LB6QPG0OWrE
         Ed8g4ptcw3MjRJBZgdQmn3gZ2sNJ7J2jUIxC3dLoHpAx25rd7szKoXYV8/TiT2jJf3Mo
         jvprGssZXQUgK/0vSz0p8BeatQIYKcCJXnUpmHaV9LUJZPlGbmUNcWZcpqgrWhA01t3U
         IeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0qrl7VfFdydVs4dilnimskLHm3Pr4FcqtJFxCKtM1Yg=;
        b=mgJnBvAo6nV06I0hXMZqLPtSoW4sZhx0I766Ny8IJ2OkRUo9KvwDZXPqNKbxEtUsZv
         9lnoMcB0O2ziRsLBXfrUDe/gadfqY93Qt9Pa4wxaa1Vz2xMostajvDAT68tTGxihfCud
         tbBRkoXm7zd/GgP+TMORMj/oglYhN+qa0K1Mtbnwt2gSs9vxQiszKcyZr1hGGVWyyrRL
         Un3Mi8KNIo1EzT5sMoPetKn5/SpXfXuU8xmF8sY/0LD74dUd9RPkVTeihxTFVJT7eBhB
         MUNDpSo78MzG3JIeV4ZltAW44UphbYmCE/nHTZTTVR2x5YcMfiTIJQ/8pod5uNVWXaQl
         6FWw==
X-Gm-Message-State: AOAM530Gr4gfmQfuUaBIkBXPfofgpEx2VK8P66nmlJeBa+62Eb+9PODa
	Uiwg/jR/LvEg1JxM+iOhR6E=
X-Google-Smtp-Source: ABdhPJxKfKWW/QkeRE1xunvvraYvDWln3MqvqyYwgJqOkSNvbE+uFKppRibCs90aGcTmbrdeMCNyoA==
X-Received: by 2002:a05:6512:169e:b0:470:2124:63fb with SMTP id bu30-20020a056512169e00b00470212463fbmr2471028lfb.616.1650617497779;
        Fri, 22 Apr 2022 01:51:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id z14-20020a2e7e0e000000b0024ac33571fbsm143835ljc.62.2022.04.22.01.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 01:51:37 -0700 (PDT)
Message-ID: <6a5cf7da-9ff3-e0dd-19d9-63aa82e6d06a@gmail.com>
Date: Fri, 22 Apr 2022 11:51:42 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fs: ntfs3: fix Using uninitialized value n when calling
 indx_read
Content-Language: en-US
To: yan <chinayanlei2002@163.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
 Yan Lei <yan_lei@dahuatech.com>
References: <20220410060929.4027-1-chinayanlei2002@163.com>
 <1fccbccb-b7d0-6f9f-e4c2-14d36e7c912c@gmail.com>
 <6a8bea15.34ed.1805067b0fb.Coremail.chinayanlei2002@163.com>
From: Kari Argillander <kari.argillander@gmail.com>
In-Reply-To: <6a8bea15.34ed.1805067b0fb.Coremail.chinayanlei2002@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Do not top post.

On 22.4.2022 11.33, yan wrote:
> 
>     It's not a mistake, I can't send patchs with my company's email due 
> to some security issues。

Then patch cannot be accepted. If you tag patch with email which does
not work how do people message to you if needed. Also how we can know
that it is your email if you event can't use it. That company security
policy goes too far if you can't even use your email address.

>     The CWE bug were detected by a static code scanning tool called 
> CodeS of my company（I don't kown its real name）.
>     The CodeS reports:
>     Use of an uninitialized variable(CWE-457)
>     Using uninitialized value "n" when calling indx_read.
> 
>     commit messages is as below:
>     This CWE bug were detected by a static code scanning tool，
>     Fix using unitialized value n when calling indx_read

You need to send v2.

> At 2022-04-21 01:50:27, "Kari Argillander" <kari.argillander@gmail.com> wrote:
>>This patch is sended from address chinayanlei2002@163.com you need to 
>>send it from yan_lei@dahuatech.com this was probably mistake?
>>
>>Also please write commit message. Always good to write how did you spot 
>>this and what message some analyzer showed to you. This way everyone 
>>else will can verify and maybe even learn to use new tools. This also 
>>looks like it really fix something so this needs fix tag so it can be 
>>easily back ported to stable.
>>
>>On 10.4.2022 9.09, chinayanlei2002@163.com wrote:
>>> From: Yan Lei <yan_lei@dahuatech.com>
>>> 
>>> Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
>>> ---
>>>   fs/ntfs3/index.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
>>> index 6f81e3a49..76ebea253 100644
>>> --- a/fs/ntfs3/index.c
>>> +++ b/fs/ntfs3/index.c
>>> @@ -1994,7 +1994,7 @@ static int indx_free_children(struct ntfs_index *indx, struct ntfs_inode *ni,
>>>   			      const struct NTFS_DE *e, bool trim)
>>>   {
>>>   	int err;
>>> -	struct indx_node *n;
>>> +	struct indx_node *n = NULL;
>>>   	struct INDEX_HDR *hdr;
>>>   	CLST vbn = de_get_vbn(e);
>>>   	size_t i;
> 
> 
> 
