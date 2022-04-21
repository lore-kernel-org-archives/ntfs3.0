Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CB46B0
	for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 09:05:45 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id bf11so4955256ljb.7
        for <ntfs3@lists.linux.dev>; Thu, 21 Apr 2022 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JO+97LmndPyQ1Thx7oPnFlG7Yx3/payY/8BbczBjJ5g=;
        b=OCoSMAi2WFK9EaMgZWjpDtTWuv9HeyFzEr8SB+nH5zvzMU8Jz3PnYZHPhLYEFuFsJ3
         +REsgaR/Z2yweWnmJnW7ukouTSfxWcHFKJdMQjAgZzZBIVnFJXf1wVGAnUIJWBDbknv7
         +EWL8Re48pibj0zqBzWbg/OuRVb7T26oLYzUAcVz0kzwVISScLwoPkbhDPSQN0pZ6BpQ
         lZBj/sYvRWiFMiBNaUcKEMbCqVTfEVLi1E7CSsdbl5hdCv7WS7Hazq8PHDLAm5/qRz/3
         kgj4kYx+8f50GrGsgLGX+BKcbgI+8fTTf5+n8oxlZ401dkQ1ggmXrQOKnQhQ96YKF+mI
         SWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JO+97LmndPyQ1Thx7oPnFlG7Yx3/payY/8BbczBjJ5g=;
        b=yOpfIU3gYqUsQhBNvgqlPN1TZErs5NlM4Ima04+Seua+z8rOJ4IP97tRvkk7GeoZiH
         MeyLXOh1701dSD8Uw61ItUkKrXUtoTfuwY4kYTasWsEPJkPcPxWZiAeKyHp+GoSHMLyF
         LePBQVGs+U7ILtkzF07aqPXYMxKzjxmv5PMkfpT3XprMe2WipCYOPSQJDVv6fWuRN9cG
         EOV7Azu5ENAf7NIVUM4KKLl0VPLRpfsdUntsOz6dnwgRnrwC9Cw8PKTPfJ3NMAF84rVs
         CYYlKPQvBOLy7IzrBf2nhMvsKpb+rFJrwJNqMjjThfIlavOJFTIOtfFJlnp1Kau+gHJG
         /P8Q==
X-Gm-Message-State: AOAM530yNRShVFzX+HUILUqroLouXmcx0c8CNkXcu7Q5ry1F/Gpr3nW4
	xU+jmPobjJmRYeTJMET/nHA=
X-Google-Smtp-Source: ABdhPJzo2Tkn3kc96zKN4+3aE4sWzC7ioRWQ94ia4vOnotmz7yZK6Ja6Frgpsoszi0mgXN9Ikvjfqg==
X-Received: by 2002:a2e:2f14:0:b0:24a:e877:7f19 with SMTP id v20-20020a2e2f14000000b0024ae8777f19mr15447116ljv.379.1650531943007;
        Thu, 21 Apr 2022 02:05:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id b21-20020a2e8955000000b0024da19039a8sm2014810ljk.81.2022.04.21.02.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:05:42 -0700 (PDT)
Message-ID: <ad6d9ad3-1b9d-5e18-6d80-039680c5bede@gmail.com>
Date: Thu, 21 Apr 2022 12:05:48 +0300
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
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Cc: "almaz.alexandrovich@paragon-software.com"
 <almaz.alexandrovich@paragon-software.com>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
References: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <b5eb5779-5dba-c266-4fa0-37d47b53614a@stargateuniverse.net>
 <6260C881.9000404@fujitsu.com>
From: Kari Argillander <kari.argillander@gmail.com>
In-Reply-To: <6260C881.9000404@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.4.2022 4.57, xuyang2018.jy@fujitsu.com wrote:
> on 2022/4/21 1:43, Kari Argillander wrote:
>> I do not understand why this RFC and not a patch.
> I don't sure whether this small nit is a problem and can be accepted by
> nfs3 group. So When generate a patch, I add RFC subject for it.

RFC means request for comments. Usually this means that patch needs more
work but I would like to discuss this topic before I continue this work.
This was small nit and is no problem, but I just wanted to point that
out.

   Argillander

>> On 20.4.2022 11.48, Yang Xu wrote:
>>> Like ext4 and other use ${fs}_init_acl filesystem, they all used the
>>> following
>>> style
>>>
>>> error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
>>> if (error)
>>> return error;
>>>
>>> if (default_acl) {
>>> error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
>>> default_acl, XATTR_CREATE);
>>> posix_acl_release(default_acl);
>>> } else {
>>> inode->i_default_acl = NULL;
>>> }
>>> if (acl) {
>>> if (!error)
>>> error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
>>> acl, XATTR_CREATE);
>>> posix_acl_release(acl);
>>> } else {
>>> inode->i_acl = NULL;
>>> }
>>> ...
>>>
>>> So for the readability and unity of the code, adjust this order.
>>>
>>> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>> Reviewed-by: Kari Argillander <kari.argillander@gmail.com>
>>
>>> ---
>>> fs/ntfs3/xattr.c | 6 +++---
>>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
>>> index afd0ddad826f..64cefa869a61 100644
>>> --- a/fs/ntfs3/xattr.c
>>> +++ b/fs/ntfs3/xattr.c
>>> @@ -642,13 +642,13 @@ int ntfs_init_acl(struct user_namespace
>>> *mnt_userns, struct inode *inode,
>>> inode->i_default_acl = NULL;
>>> }
>>> - if (!acl)
>>> - inode->i_acl = NULL;
>>> - else {
>>> + if (acl) {
>>> if (!err)
>>> err = ntfs_set_acl_ex(mnt_userns, inode, acl,
>>> ACL_TYPE_ACCESS);
>>> posix_acl_release(acl);
>>> + } else {
>>> + inode->i_acl = NULL;
>>> }
>>> return err;
