Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE473FDE
	for <ntfs3@lists.linux.dev>; Mon,  4 Oct 2021 20:39:50 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id g10so10183564edj.1
        for <ntfs3@lists.linux.dev>; Mon, 04 Oct 2021 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZN0FZqiP/tSKJWvjzWYzmirjI6tOAf0Xm/PBKsW4sfw=;
        b=h2cfSXzFHnOs2RG1zFw4/Hbm0AsiK7htA4HPaBZzTiqOkkC3SsuOxhfpfYgJdjbeZZ
         0Rx/ZMcFwwk02BW2clsVJqhOz0cOddt9jLQ+/H1AU9jww3pndDE9YCmK84V9/ovlU2VV
         NNb5TIYvTmQkmMTX3nHQaNC6jXKk66GtEEOLoPxrOYnlMwWgT8slfN7L+zzUlqDhaTxq
         VO6TfJTfIAfpEI9ZccJnv4D9hAJspWOuPcD3ry7gmxB6GOzNigj2JhEemV8o3bnHeH6n
         70mVCV1ABHlu+RK/LKv39BFz0GYBZltup8FMu4Lj01acOYR/kH8/7bsmW5KbJntRmUp/
         /HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZN0FZqiP/tSKJWvjzWYzmirjI6tOAf0Xm/PBKsW4sfw=;
        b=kmQxvPqcMp4APG+uU1kniWLVUWpeAFU/B7MXXOGK9gy9+CRASH7lGw4qjZr6NmNi6q
         Ie0MMdpjTMzJAA9+klDufN+/EObaGEY56BCazWcj3/R0qQU7507dSbGpwyCa4rW+rVE3
         0GwtW0QKGWyIVZIGLGH9kz4G1JNxH4WK+vHhjDRfo8XmGRNGt+mw18j5NFRLjREhMjBK
         3FGBEijTcwi4f4MUsBuXwjjdoYrb9TAU6Yy9PlOvI8QVWhM/nPpZZQ3rCvbWfUXN4Nwg
         kB0iOEpBiS4+Qn/xmBrV6tfvl+bvXTV0gaznIqxLlYHxc1AZs+P2GN8+x7DaDs9cnHdo
         UKHw==
X-Gm-Message-State: AOAM530hrBvit62rQBuH/jLlIb9RrfMOZ47b/W4fxu32F3RfBouo6xnZ
	CgRuGuL1BRjK5qVLsZ7B4TY=
X-Google-Smtp-Source: ABdhPJwZYA4EE+PMu0+hSaaxzWRZvxH2qJ1DMJkDue1lDN5kb4rMvrSJsvb4b5GwxG9ohUGTYwoOMg==
X-Received: by 2002:a17:906:7ce:: with SMTP id m14mr19702350ejc.192.1633379988142;
        Mon, 04 Oct 2021 13:39:48 -0700 (PDT)
Received: from [192.168.0.163] ([37.239.218.18])
        by smtp.gmail.com with ESMTPSA id dn10sm7559243edb.84.2021.10.04.13.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 13:39:47 -0700 (PDT)
Message-ID: <c892016c-3e50-739b-38d2-010f02d52019@gmail.com>
Date: Mon, 4 Oct 2021 23:39:44 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] fs/ntfs3: Check for NULL if ATTR_EA_INFO is incorrect
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <227c13e3-5a22-0cba-41eb-fcaf41940711@paragon-software.com>
 <20211003175036.ly4m3lw2bjoippsh@kari-VirtualBox>
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
In-Reply-To: <20211003175036.ly4m3lw2bjoippsh@kari-VirtualBox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/3/21 20:50, Kari Argillander wrote:
> On Wed, Sep 29, 2021 at 07:35:43PM +0300, Konstantin Komarov wrote:
>> This can be reason for reported panic.
>> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> I see that you have include this to devel branch but you did not send V2
> [1]. I also included Mohammad Rasim to this thread. Maybe they can test
> this patch. Rasim can you test [2] if your problem will be fixed with
> this tree. Or just test this patch if you prefer that way.
>
> [1]: github.com/Paragon-Software-Group/linux-ntfs3/commit/35afb70dcfe4eb445060dd955e5b67d962869ce5
> [2]: github.com/Paragon-Software-Group/linux-ntfs3/tree/devel

Yeah unfortunately the problem still exist, moving the buildroot git 
tree from my nvme ext4 partition to my wd ntfs partition still causes 
the panic.

Note that i used the master branch if that matters but it contains the 
same commit


Regards

>> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
>> ---
>>   fs/ntfs3/frecord.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
>> index 9a53f809576d..007602badd90 100644
>> --- a/fs/ntfs3/frecord.c
>> +++ b/fs/ntfs3/frecord.c
>> @@ -3080,7 +3080,9 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
>>                          const struct EA_INFO *info;
>>   
>>                          info = resident_data_ex(attr, sizeof(struct EA_INFO));
>> -                       dup->ea_size = info->size_pack;
>> +                       /* If ATTR_EA_INFO exists 'info' can't be NULL. */
>> +                       if (info)
>> +                               dup->ea_size = info->size_pack;
>>                  }
>>          }
>>   
>> -- 
>> 2.33.0
>>
