Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34701851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 16:45:43 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id l19so11195730ljb.7
        for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stargateuniverse.net; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GdE7uxfylBXcKXRnbalSbzPRUlW4mM3vMMcpsmb6gf4=;
        b=CtzIcMYT5MNlqW4XD03LGBccJeLEF87y2+khbc6wC9VhaOX+eEK91GHhq8MnZiooXn
         2/tNBq5PE8HEREVqzCthyzDhyYLR2We+G/NHRVlxxNYpwtJd0Vf7euUmMv+YQrXP+aai
         i1IOsR60TL4oK2X5N3yZqk4vNER90Bv+hFiHll4GQUtXHtKP2eq2dZlchiOr8A9r9Szs
         tSt7R68vtoyLcywFczPVKuFyaMXPbvB2cuyxcG3Qb0kZLWIcWTb85L0aIpgzXSraoJ9u
         0jnPAQIb1InpSBgMYyQjes12uc1C4J4NfmsjlgbMkVwIiJYo79sB21Fg+ZNYVcX7tclT
         iagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GdE7uxfylBXcKXRnbalSbzPRUlW4mM3vMMcpsmb6gf4=;
        b=F7evG1v+j5jQ7eT8bVnOuu2lg6+2Oa3SoXEq0/M/DedL6K9Vy/rnsTp3Vl5ZG4JX9q
         u11uU/gBC31ulYy6cM+8nGbY7SQZaZUsdGyKFHfaMqAZhRbVM/xh4EYwQ/K+paXDTrid
         8TLifHGFPXEA4DRCrPMuEV2ycZSaPpFDme+LDoSWGO0XVKFyTyzF7XvPk5XT3MC0ponT
         9tahqRhrpJlRlXb5kc4HNQ48VhqDpkYtxIA2Jh3DBA/E9Jp/RwgIPD8Bw8Xl/r9jG3TG
         8hzViRNbqVewM7NSgy8ODsdbGjEZAUbXCszHIn/uxKvBHOET7m2sjpDdTpIPQ/djqYOP
         8WsA==
X-Gm-Message-State: AOAM530SXn2GI6ce4G0IT8rfbc1SrbKNdQeY65Q/lmQMyl7nvOTJO3XT
	YuYmQOV6dvrn8ik7XquVqxgHtA==
X-Google-Smtp-Source: ABdhPJzwAmysseFvxInlEq7Zvcqs6QEGDQdFtbvEXtgjMsucFYEvSYHPuXe2V7DF7bTD2VEtmrjRRg==
X-Received: by 2002:a2e:81d1:0:b0:24f:728:a16c with SMTP id s17-20020a2e81d1000000b0024f0728a16cmr55792ljg.333.1651250740304;
        Fri, 29 Apr 2022 09:45:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id z16-20020a2eb530000000b0024f3d1daeafsm317565ljm.55.2022.04.29.09.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 09:45:39 -0700 (PDT)
Message-ID: <0bf74850-fa56-9dbe-7b08-f66a9fcd39e2@stargateuniverse.net>
Date: Fri, 29 Apr 2022 19:45:42 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: NTFS3 driver is orphan already. What we do?
Content-Language: en-US
To: Namjae Jeon <linkinjeon@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>,
 Eric Biggers <ebiggers@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <da20d32b-5185-f40b-48b8-2986922d8b25@stargateuniverse.net>
 <CAHk-=wihuvzVTozzNLZT=uFzJH6uM7ZNKN7fYVpm0v2KkY6Jxg@mail.gmail.com>
 <CAKYAXd89Ypc09ZkuZT+w3TDscpB8_=wHY=JpZJb7LY1LDg+7Uw@mail.gmail.com>
From: Kari Argillander <kari.argillander@stargateuniverse.net>
In-Reply-To: <CAKYAXd89Ypc09ZkuZT+w3TDscpB8_=wHY=JpZJb7LY1LDg+7Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.4.2022 3.47, Namjae Jeon wrote:
> 2022-04-28 2:47 GMT+09:00, Linus Torvalds <torvalds@linux-foundation.org>:
>> [ Sad state of affairs mostly edited out ]
>>
>> On Tue, Apr 26, 2022 at 2:22 AM Kari Argillander
>> <kari.argillander@stargateuniverse.net> wrote:
>>>
>>> I also did suggest that I could co maintain this driver to take burden
>>> from
>>> Konstantin, but haven't got any replay.
>>
>> If you are willing to maintain it (and maybe find other like-minded
>> people to help you), I think that would certainly be a thing to try.
> I can help him.

We have now discuss with Namjae and we will start this and let's see
where it goes. I will get my PGP signed soon. I really want code to be
in kernel.org so that maintainership is easily transfer if necessary,
but let's hope long and steady route now on.

Hopefully we are ready to start by next merge window.

     Argillander
