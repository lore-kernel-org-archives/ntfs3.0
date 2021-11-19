Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8572
	for <ntfs3@lists.linux.dev>; Fri, 19 Nov 2021 14:19:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u18so18447308wrg.5
        for <ntfs3@lists.linux.dev>; Fri, 19 Nov 2021 06:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CcexMjZBNLCEwb0isvMRBl9q6LjY9wKO6CSmQ4SxqKs=;
        b=GSsT3LJ+VfwVLEkUAJ3qQq4FADKWRSDFklZAp0yWg2NNMGyGvPr1C9+40upDU7iUXB
         72UbR7LMKFxCNerQVP8K8NMSsBEJI9h7GsO4zj3+WSafi7hEr0IrQZdIiw5cmSfFJZu1
         7g7vX94n43eG47tY+0VykjPWLFzvy1oqNp9w+0D/d//nVhOnZfw0rDYjKQb3XqmsFoNV
         du3hQo63b+kAFBWG4KDuEPvy7uFentDQT/6D1up5Tc923gJSeomNmM+BxCLiXTc2S6DA
         ydb0VIEn2oliCcTSzySpBpL7E+YVS8TqJ5OwnAYlPuR+DSZF9W3uc1uVXhhhKgJGYaaB
         YClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CcexMjZBNLCEwb0isvMRBl9q6LjY9wKO6CSmQ4SxqKs=;
        b=EXY1b6gTG1bDoW9mMUv50XYV+U3aBE7UyacNyn1P5xyU2kLz7JOTCAYW/XtV76w2Bq
         m2ArawlISM+q3u51iJenULji5hU6dU1FBnLw/sL69JYk0L/6bJ2wtOSaC1U+mWjoywZu
         q6oy30rduPImTNBODbJE+zTAed6BNBnITI2euHiIyS+8Zops4y/zgc2tUCFP3xaM3pzQ
         JrMXlKzaeWgjMeG4JMVd8Xip28tNzyAsUwWY1wb5WIsNE2zAtDaYOD0DEjw01GFNP49M
         nLt/p56BvjMZGDGHcfAWuOh9Ynrrrhz1q4P3K/LHmDyW+cQGVZYTDdHkGSLpgAp1AY/j
         iRYA==
X-Gm-Message-State: AOAM530tuyyQOhp7091cNgFga9zpb/eu2O9+JNLBqg7YFbtTitqhJY9K
	0Hx6UndZVFLcq56pHslGvP0=
X-Google-Smtp-Source: ABdhPJzpuUEXW+pjwKeq+mxHngWCA4ASsBXWhd0rHOfoPKCoXSFm37D7Ea0GCxP1u6e4nMn8XOvFaA==
X-Received: by 2002:a05:6000:1a45:: with SMTP id t5mr7773017wry.306.1637331571339;
        Fri, 19 Nov 2021 06:19:31 -0800 (PST)
Received: from ?IPV6:2a02:8070:a2a8:1a00:815a:3ed0:1912:b9b7? ([2a02:8070:a2a8:1a00:815a:3ed0:1912:b9b7])
        by smtp.googlemail.com with ESMTPSA id f15sm3918494wmg.30.2021.11.19.06.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 06:19:30 -0800 (PST)
Message-ID: <b708eff4-4e2f-42a9-c2b2-22522f72ebe0@gmail.com>
Date: Fri, 19 Nov 2021 15:19:29 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Reply-To: uwe.sauter.de@gmail.com
Subject: Re: Bug using new ntfs3 file system driver (5.15.2 on Arch Linux)
Content-Language: de-DE
To: Matthew Wilcox <willy@infradead.org>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
References: <aea2a926-8ce6-fcb0-cd60-03202c30cca1@gmail.com>
 <YZei4gn1zgIc32Ii@casper.infradead.org>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
In-Reply-To: <YZei4gn1zgIc32Ii@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 19.11.21 um 14:13 schrieb Matthew Wilcox:
> On Fri, Nov 19, 2021 at 08:48:11AM +0100, Uwe Sauter wrote:
>> [ 1132.645038] BUG: unable to handle page fault for address: 0000000000400000
>> [ 1132.645045] #PF: supervisor instruction fetch in kernel mode
>> [ 1132.645047] #PF: error_code(0x0010) - not-present page
>> [ 1132.645050] PGD 0 P4D 0
>> [ 1132.645053] Oops: 0010 [#1] PREEMPT SMP PTI
>> [ 1132.645057] CPU: 7 PID: 429941 Comm: rsync Tainted: P           OE
>> 5.15.2-arch1-1 #1 e3bfbeb633edc604ba956e06f24d5659e31c294f
>> [ 1132.645061] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./C226 WS, BIOS P3.40 06/25/2018
>> [ 1132.645063] RIP: 0010:0x400000
> 
> Your computer was trying to execute instructions at 0x400000.  This
> smells very much like a single bit flip; ie there was a function
> pointer which should have been NULL, but actually had one bit flip
> and so the CPU jumped to somewhere that doesn't have any memory
> backing it.
> 
> Can you run memtest86, or whatever the current flavour of memory testing
> software is?
> 

As I mentioned in the description the host is equipped with ECC memory. dmesg didn't show any sign of memory error that 
I would expect from a bit flip inside RAM.

The hardware is
* ASRock Rack C226 WS mainboard
* Intel Xeon E3-1245 v3
* 4x Kingston 9965525-055.A00LF 8GB ECC memory.

Also the host has been running fine after the bug triggered for 1.5h and today again for 7h.
