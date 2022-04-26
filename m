Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE11439E
	for <ntfs3@lists.linux.dev>; Tue, 26 Apr 2022 09:22:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id x33so30839145lfu.1
        for <ntfs3@lists.linux.dev>; Tue, 26 Apr 2022 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stargateuniverse.net; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=PV73bocTIvCQn8NET1HiZ0/Dcwl7O5SOxSRVCwEBaag=;
        b=Wwph8JhPwKZsdLhcAKoOSuqPYggmwKqCOWc49/SwcAZ8Rrqz0Gl1G6Qm6XijWlBo4i
         KKYcE+AAt1gsZ0IX+d7EYnGBomeL/JbHbwd43Sa8AOlb4zqUnvu23d9dVNRQo5MASISP
         zi9Mlie0qdgOSV55KAdFSux+ZGc1dNPUmAJmo9/vP5O3jaz5amK45XrdqfqdyPwacQeJ
         9upZrcCozgMSCoSxRbHtfP8PJHEhA/IF6TVGxBFWQpzIuOIBFJSPVIhovAIsNCT3rKsS
         jCx8SlP6tXBujeJU0xeGdDcTybTq7ZHW4qpTs9py9cDUOLrlBPTWNmdXOL4c4RMWURAK
         wKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=PV73bocTIvCQn8NET1HiZ0/Dcwl7O5SOxSRVCwEBaag=;
        b=IL4ZXHwBWnN2Ja7PcHymChVbvS30vZYznduLoCjUhtHxyRQO6OXeQmXzWBFxrD+cBg
         8i2tHbUk53WyER4yD00yncvM7Rt8e/pOCh6M/Hvpz3XMTMwzfIJdiC8friDCnON6a3de
         hR82qeU9tg1SfiwSAmSrFTe76WAGr7LgQmeZyefQJcreXzb1HseRPjGa6R7OIGBObU30
         Z/qD4ZjxpsQEvdaHpHdqKaP2DzM4UFgcxHoz+GjiO1Vx2n58roBGSeQPMWw11Kn6cqme
         E8CXwCp1yAvv+uhqweeKBy15naWOJV1sP7P9SMAePfiGOPp/2joavMRsl3bZuOZEUx+U
         Dq3g==
X-Gm-Message-State: AOAM530w8HYprz2+ZgMIvRytFXdUL/whPTnd0ybAExI/PSrRHFIqbGSG
	T1EpgQReZ3IttB32xgfAb+bt1g==
X-Google-Smtp-Source: ABdhPJxSBRMAWS0WtSGmShYwUnDkCEAh6zAEBYDGvaksZzP+5MpOUj4e4+boT9v2H1geOww0rLUBPQ==
X-Received: by 2002:a05:6512:1585:b0:448:3936:a5a0 with SMTP id bp5-20020a056512158500b004483936a5a0mr16005888lfb.108.1650964920785;
        Tue, 26 Apr 2022 02:22:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:9cae:8c00:9682:e720:334f:2fac? (dxw3k4yf2tnxwyp6sg02y-3.rev.dnainternet.fi. [2001:14ba:9cae:8c00:9682:e720:334f:2fac])
        by smtp.gmail.com with ESMTPSA id h29-20020a19ca5d000000b0047052f6ed1esm1674942lfj.91.2022.04.26.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 02:22:00 -0700 (PDT)
Message-ID: <da20d32b-5185-f40b-48b8-2986922d8b25@stargateuniverse.net>
Date: Tue, 26 Apr 2022 12:22:02 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev
Cc: Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Kari Argillander <kari.argillander@stargateuniverse.net>
Subject: NTFS3 driver is orphan already. What we do?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

After ntfs3 got merged and 5.15 got released ntfs3 maintainer has kept total
radio silence. I have tried to contact him with personal mails with no 
luck. I
have chosen bunch of people to discuss what we should do this driver as 
this is
already orphan. Feel free to add more if you think it is necessary. There is
lot of bug reports which are ignored completely. Lot of patches which nobody
applies.

He did some work after 5.15, but has not send PR for those [1]. I did 
also ask
to use fix and next branches seperetly and tag stable fixes, but he did 
not do
that eater. I think Konstantin did not yet quite understand meaning of 
stable,
next and upstream and it is not ok to applied every patch to same tree 
for any
point.

Personally I did my best try to help Konstantin with maintainer things, 
but I
have to say that it was quite difficult as he mostly ignored emails and 
do many
things like he wanted. He did not suggest anything to anyone if someone send
patch. He just applied those or ignored. Also sometimes he just applied own
patch without sending it to review process. Of course new maintainer 
needs time
to learn things but just wanted to say these so everyone knows how 
things went
so far.

I also did suggest that I could co maintain this driver to take burden from
Konstantin, but haven't got any replay. I have worker towards better CI 
system
for myself for ntfs3 which of course will be public in some point if we 
solve
current situations. If we keep this driver we really need very good fstests
support. But we also do not have very good open source utilyes for ntfs.
Konstantin said that he will open source those as well, but here we are 
waiting
and we will probably have to wait long time.

Now is time to think what we should do. Should ntfs3 just be removed? As I
really wanted to see that ntfs3 will be big thing I have to say that I 
vote for
removing unless someone comes to rescue this catastrophe. Yes we break
userspace, but we might break it silently if nobody is maintaining this. 
I also
do not believe that if someone is just accepting patches that it is enough.
Ntfs3 is not so ready that we do not need some ntfs specialist to 
maintain it
imo. Really public CI might save something if we keep this in and I will 
work
towards that if we choose to keep this in.

And if Konstantin read this please come and join this conversation.

   Argillander

[1]: https://github.com/Paragon-Software-Group/linux-ntfs3/commits/devel
