Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC462C83
	for <ntfs3@lists.linux.dev>; Thu,  7 Oct 2021 20:34:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m22so22931972wrb.0
        for <ntfs3@lists.linux.dev>; Thu, 07 Oct 2021 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oRHLMXqM2mOHKQkvAS6+tYUY5LlYB8LRMPXHWuw9B8E=;
        b=aG64N/jQuE34ZKMSNShRa+Ja4JVAiPYFIz95sBcNyloZBgIQpf3sYKN8eDTazJLVku
         2QVO1Pq6Asb1QqrY6+RNty76uCLVhwdUfuqMqePqFbJJhiHcc6kFUT1/iN3fcfOXCJUW
         PUPeJhL9TonpGsViBNxFv46TUI6mbBy/9i5j3WfIb3mQKo45/Ob4kIzCtrRNriwAI7qW
         85tODJJcA7oukJ3sUMNnEz51wlRKIUnqNke/cfVJc0QUrtHsayRHJnU/Ds/Kv1mMJ5ha
         6txVSyRNj215S3IawSRpRld+kwqBy2kLT8U5AH4danmgkLxddyuN0SN49DLA7WYFLZVj
         Rn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oRHLMXqM2mOHKQkvAS6+tYUY5LlYB8LRMPXHWuw9B8E=;
        b=p+XVDTKCulwVid65sbBcipUtxkw4nyIK4DhVy3Mep+Vij/vadsM0ZOm4aeHCwUhA7z
         bAlDMqFGb47l5j+p6L99v5FlA6iGjnrDUMWqYXZe7CZLh4Oy8dQQfvInhoS7rWQRBEHo
         HJ3UqvDgMWKgLmgZNd52/iqgPBLuG93WAgilwVEniL5rVHqIM50DAJ1sSYW0YT2+hKGW
         QcuSr2iaAKTKLflsLmkZa+B5yGAU2KOUIIMSDwkpzDk+wSR+4JU8z9lOmdo/de+a1wqd
         L5fd2IQ2Q0btawYpKyxJllTnFP8D4nyKhAmmTVHgI7LemXbV1ILlt+xN6qC+YvI3MbQ7
         VjwA==
X-Gm-Message-State: AOAM531VSljc6Hw57p0jCVU6FySddYaYRlxcYNeRazKeneB2d2ApmVj7
	OG1WhZZnqMf+li0NgRhfHjk=
X-Google-Smtp-Source: ABdhPJzoZEQ2+bVfQIYt1OJ/JKny5uKSCEirMBRqqFEhWInh3ZdCHScFCglbqqbrG+rGSQ+5CfFesw==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr18163078wmi.77.1633638845394;
        Thu, 07 Oct 2021 13:34:05 -0700 (PDT)
Received: from ?IPV6:2a02:8010:64ea:0:fad1:11ff:fead:57db? ([2a02:8010:64ea:0:fad1:11ff:fead:57db])
        by smtp.googlemail.com with UTF8SMTPSA id h15sm384794wrt.0.2021.10.07.13.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 13:34:04 -0700 (PDT)
Sender: Mark Harmstone <mark.harmstone@gmail.com>
Message-ID: <ae5c8b89-5bcf-7ad5-c7b8-d54dd229e5f6@harmstone.com>
Date: Thu, 7 Oct 2021 21:34:02 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
 <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
 <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
 <14130f55-f61f-fb39-c653-02b4dd39bc6b@paragon-software.com>
 <1068834b-5c16-84e4-2692-938dd4e91121@harmstone.com>
 <20211007201231.ald2tfljtuidcimz@kari-VirtualBox>
From: Mark Harmstone <mark@harmstone.com>
In-Reply-To: <20211007201231.ald2tfljtuidcimz@kari-VirtualBox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/21 21:12, Kari Argillander wrote:
> NTFS is case-sensitive filesystem which Windows treats with tricks like
> case-insentive.

This is a distinction without a difference. It's not by default case-sensitive,
but it is case-preserving.

>> Your driver lets me create a file called foo.txt and one called FOO.TXT in a
>> normal directory, and when I double-click on one in Windows the wrong file gets
>> opened. That's 100% a bug.
> 
> I disagree. NTFS point of view no bug at all. I agree that it maybe
> Windows point view might be a bug. I agree that it might be good thing
> to add mount option flag to control this behavier. Maybe nicest thing
> would be that if we save other file which match case sensitive we just
> raise flag for this folder and atleast never Windows will be able handle
> those correctly. What do you think about this Konstantin?

Very dangerous. If you did this in System32 say, you could very easily nuke
your boot because Windows was looking for NTOSKRNL.EXE rather than ntoskrnl.exe -
even if that's not the file you were using.

>> It's worth pointing out that the Linux vfat driver handles case-sensitivity on
>> Microsoft's other filesystem correctly.

Question: do you disagree with the approach the vfat writers took? And if not,
what's the difference between FAT and NTFS in this regard?

Quite apart from anything else, the principle of least astonishment says that
Linux should follow what the reference implementation does. By all means add
a mount option to force case-sensitivity throughout, but this shouldn't be
the default.

