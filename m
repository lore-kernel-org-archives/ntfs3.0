Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63C3212
	for <ntfs3@lists.linux.dev>; Mon,  2 May 2022 20:49:20 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id l19so19814226ljb.7
        for <ntfs3@lists.linux.dev>; Mon, 02 May 2022 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wyghvMTo7vFmksOi8V5KVWhbKq4pzYFgl3fS2v1sDJ4=;
        b=Ko+uTyT9SZNay2z6ssGZBhQZKQoUTBxW0w7+D7SjbQpOxeUOIOg6kt1lVYUEXtAvyR
         PfeaidjKmGNEcECCoUzNhoSf6TSmESrs9cQEp3BkNMtra9BMpulqmNUzLdiTG1BUnYZ0
         85sH5ddWZ9EkPVZbJ+Mr8KAVzXSSOT4GaB5trrXPDDPA5D9Veo6dzYjdafyIxyucQDU2
         PzSY2oc2gaJuV74aU3FJMcl0M4Mac/p8u2a8BEQX+0PEr6hGLOJY6XF6L9VabQKWfSAL
         kbDsCFT59e7uof8HsSbNOnnVy4Fr5I6wY0igXSwT0d80VHBuAaQO7kWu6D3JB+PuCCqU
         n6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wyghvMTo7vFmksOi8V5KVWhbKq4pzYFgl3fS2v1sDJ4=;
        b=Y2+H5QMdJhmhn3F+ZyFH+Tlsx2wSWSk1MOJjg/N+wB3xKFO7ifqvlVP9YlJoBIYV/s
         7H2qSe7qURD6YCCTCxielMEQCrlSF+5/b0IY5NqERkAUk/JDiq8Kmh8wMZFpWqpG39oO
         pvZgvqiLipkPF+nZkPurbtt8lWUMNv2xwGiCpdDQaaKHFo3GV1oqzZ1WisB9CS/JzfIp
         FUw/USei1hbQjlgb4vHJmcFu3HhmLF+OCsWZo+xViMrYcY/KCiqftyvPQGEjeo18gFTk
         u6dKazzMMl2sMEGIpo8pKAmNUqNQ8pIH31AARYwQdCOvEtQ9Kb/upUo13ipVcnbs/ty6
         Yuuw==
X-Gm-Message-State: AOAM530m975Wg3OJ0bKf0t0cSNbA7sQiT9uU+xXvGYz3RnXA/Bq0hrK/
	KUKa49djYmtSnvNyo3sfrwU=
X-Google-Smtp-Source: ABdhPJyUeVgZGZnIyS9dQvNdX2YfSKhhZLckLdSF3ICNhcdjZDrYZFseDhIqhjPOUixsDfn+9W6uUQ==
X-Received: by 2002:a2e:b014:0:b0:23c:9593:f7 with SMTP id y20-20020a2eb014000000b0023c959300f7mr8434771ljk.209.1651524558467;
        Mon, 02 May 2022 13:49:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id b28-20020ac2563c000000b0047255d211b9sm792012lff.232.2022.05.02.13.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 13:49:17 -0700 (PDT)
Message-ID: <2433164a-4546-ca21-cdf2-441d3a492e0f@gmail.com>
Date: Mon, 2 May 2022 23:49:23 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: NTFS3 driver is orphan already. What we do?
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <da20d32b-5185-f40b-48b8-2986922d8b25@stargateuniverse.net>
 <CAHk-=wihuvzVTozzNLZT=uFzJH6uM7ZNKN7fYVpm0v2KkY6Jxg@mail.gmail.com>
 <0f48e2eb2b0740b1b85e3b8d910c4bd8@paragon-software.com>
From: Kari Argillander <kari.argillander@gmail.com>
In-Reply-To: <0f48e2eb2b0740b1b85e3b8d910c4bd8@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1.5.2022 20.13, Konstantin Komarov wrote:
>> From: Linus Torvalds <torvalds@linux-foundation.org>
>> Sent: Wednesday, April 27, 2022 7:47 PM
>> To: Kari Argillander <kari.argillander@stargateuniverse.net>
>> Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>; ntfs3@lists.linux.dev; Theodore Ts'o <tytso@mit.edu>;
>> Christoph Hellwig <hch@lst.de>; Matthew Wilcox <willy@infradead.org>; Eric Biggers <ebiggers@kernel.org>; Darrick J. Wong
>> <djwong@kernel.org>; Christian Brauner <christian.brauner@ubuntu.com>; Al Viro <viro@zeniv.linux.org.uk>; Linux Kernel Mailing
>> List <linux-kernel@vger.kernel.org>
>> Subject: Re: NTFS3 driver is orphan already. What we do?
>>
>> [ Sad state of affairs mostly edited out ]
>>
>> On Tue, Apr 26, 2022 at 2:22 AM Kari Argillander
>> <kari.argillander@stargateuniverse.net> wrote:
>>>
>>> I also did suggest that I could co maintain this driver to take burden from
>>> Konstantin, but haven't got any replay.
>>
>> If you are willing to maintain it (and maybe find other like-minded
>> people to help you), I think that would certainly be a thing to try.
>>
>> And if we can find *nobody* that ends up caring and maintaining, then
>> I guess we should remove it, rather than end up with *two* effectively
>> unmaintained copies of NTFS drivers.
>>
>> Not that two unmaintained filesystems are much worse than one :-p
>>
>>             Linus
> 
> Hello Linus, Kari and all.

Hello Konstantin and thanks for you answer. Happy to see that you are
still in.

> First and foremost I need to state that active work on NTFS3 driver has never stopped,
> and it was never decided to "orphan" NTFS3.  Currently we are still in the middle of the process
> of getting the Kernel.org account. We need to sign our PGP key to move forward, but
> the process is not so clear (will be grateful to get some process desciption), so it is going quite slow
> trying to unravel the topic.

Basically easiest route is some conference, but there is not so many as
we are kinda middle of covid still. You can try to search some Germany
kernel devs and contact them. Then you can meet them in person and
proof who you are and then they will sign you key. I'm same situation my
self right now and have meeting with some Finnish devs.

> As for now, we can prepare patches/pull requests through the github,
> and submit them right now (we have quite a bunch of fixes
> for new Kernels support, bugfixes and fstests fixes) -- if Linus approves this approach
> until we set up the proper git.kernel.org repo.

It should not be problem to continue using Github. Kernel.org is of
course nice in case example maintainership is transfer to others or
there is multiple maintainers.

> Also, to clarify this explicitly: in addition to the driver, we're working of ntfs3 utilities as well.

Nice to hear :)

> Overall, nevertheless the NTFS3 development pace has been slowed down a bit for previous couple
> of months, its state is still the same as before: it is fully maintained and being developed.

I have to disagree that it is fully maintained right now. Half year
radio silence is not "fully maintained". But we can work this out so
that this driver will be fully maintained.

But the offer is still that you do not have to maintain this fully by
yourself if this is too much work. There is many other subsystem where
there are multiple maintainers.

Also I would like to point once again that we really need to check that
stable gets fixes also. But those are just what are fixes not new
features. Also only merge window should be new code. Every other should
should only contain fixes. This is why usually couple different branch
is needed. If you have any questions please feel to always ask me or
from mailing list.

     Argillander

> And finally, we apologize for late reply; I allowed me short vacation after most restrictions because
> of covid ended up this month in Germany.
> 
> Thanks.
