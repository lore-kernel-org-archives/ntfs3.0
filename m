Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE9A7E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:50:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r13so16620830wrj.11
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AV5pUwiXA+PA3Jd/giIxumbszKFu5s2N0TiGrAZugtw=;
        b=d44BYDTufJs42ogPANgNIKRTei3bJOR/4RS3XD0EeYj25A2X6WLpRAPGd3AA98o8OJ
         VnVdqyjJHLmNPw9NM+xFRHhAPD/kDyuDksF/FvDehSL3Hv9rvg4Pv1tSv725eBmZPlXp
         Or7hhMtR3jE5AA8F8/g3kbnIuOCqqgnDFfuDz2/BlOY1xdsgA8vCERkArbHZ20Pg4ZuI
         DYKJizPdobqGsjjajWr3kjORzznaQWhRO58vwTEduzxGXgYPVTZw++u9Uy2LPkSKoH/x
         u9Nl0A08EpuZglLjY5ibAlITvx8HLfJ/8jW6JChQBNgL3SurOcH5tVjB2URh/7v9DObh
         kJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AV5pUwiXA+PA3Jd/giIxumbszKFu5s2N0TiGrAZugtw=;
        b=hz+BlHdH/VJNagba1FWzTJNZ/PsYyfJNZwT0BD1Jplc1zKZbsViHVnlSn/JhTCKWsA
         YNugUetsL7TccOKbl2HHblbTdfafqG9qhDLw/A/0Po/QriDnIS8V/GbZaC6//LNNR6tk
         5METrSqE4yQWS7LpOFMZgCn9BgayYxUZccvyE0CMTffXHO+nbJKNAno8/q7NaAtnu4VM
         TQ8VN7oNevbJAy/8VgeXovRgB4yUZP0+Ery9mJIZ9JIFiZRWR7JrezQ69M5BsLQ+7mAC
         Qgnc3ZPsPyCZFvHmFK1Ffv+2TK9IN795J58gHwKw1tOElUW7gLbgeobt3MoYuSETyiUZ
         1NYQ==
X-Gm-Message-State: ACrzQf24f8rdbIgI5U4T3ckz40a2oGEMiXjaWpPASgTN9djLD3Y53VT1
	dP5LmS68vLHONBG0CXAGE04=
X-Google-Smtp-Source: AMsMyM4xRBN4MZsrdGwinGZRaEM70/3RYMhGzkKcAD3VtJxeVyY5G0Lf1ViHWa+4wBiXVCFdvHR9LA==
X-Received: by 2002:a05:6000:1244:b0:22e:4d39:a0e3 with SMTP id j4-20020a056000124400b0022e4d39a0e3mr10745854wrx.509.1665402643675;
        Mon, 10 Oct 2022 04:50:43 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id m4-20020adfe0c4000000b0022cdf2179b2sm8889001wri.68.2022.10.10.04.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:50:43 -0700 (PDT)
Message-ID: <d67639e4-565f-e30a-eef8-da28fc5bca8d@gmail.com>
Date: Mon, 10 Oct 2022 12:50:42 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/4] fs/ntfs3: Fix and rename hidedotfiles mount option
Content-Language: pt-PT
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
 <CAKBF=ps4CUA3crkzUUn8J-0WC-6bGb3Z9PPugzebTajGJ+=rSA@mail.gmail.com>
From: Daniel Pinto <danielpinto52@gmail.com>
In-Reply-To: <CAKBF=ps4CUA3crkzUUn8J-0WC-6bGb3Z9PPugzebTajGJ+=rSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Às 09:08 de 09/10/22, Kari Argillander escreveu:
> On Fri, 7 Oct 2022 at 15:32, Daniel Pinto <danielpinto52@gmail.com> wrote:
>>
>> The current implementation of the hidedotfiles has some problems, namely:
>>  - there is a bug where enabling it actually disables it and vice versa
>>  - it only works when creating files, not when moving or renaming them
>>  - is is not listed in the enabled options list by the mount command
>>  - its name differs from the equivalent hide_dot_files mount option
>>    used by NTFS-3G, making it incompatible with it for no reason
>>
>> This series of patches tries to fix those problems.
> 
> While you are fixing this can you also make patch to add documentation
> for this mount option. I also think we really should not make new mount
> option names so I would vote hide_dot_files name as you did. We still have
> time for this change as this is not yet in upstream.
> 

I have submitted a v2 of the patch which includes a commit with the
documentation.

>> Daniel Pinto (4):
>>   fs/ntfs3: fix hidedotfiles mount option by reversing behaviour
>>   fs/ntfs3: make hidedotfiles mount option work when renaming files
>>   fs/ntfs3: add hidedotfiles to the list of enabled mount options
>>   fs/ntfs3: rename hidedotfiles mount option to hide_dot_files
>>
>>  fs/ntfs3/frecord.c | 9 +++++++++
>>  fs/ntfs3/inode.c   | 2 +-
>>  fs/ntfs3/super.c   | 6 ++++--
>>  3 files changed, 14 insertions(+), 3 deletions(-)
>>
> 
