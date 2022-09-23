Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729203FED
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 16:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iqSsnXDpXptQrZkze7xs7W/+99io3Asgz+HqUh6Hg/k=; b=DVT4w5QWUg8BsC3EjIToFklDTd
	wBmh6aLI6PGO0KVphGPMmq+m4SAFYPm90QTdMpZhH3ZNMCwQXJ+2rN/mc/s+1TOdDobhQ6firrZ0D
	kd4ql9cGrQCuuZv/uBluljdugvTbLgtUgLbq+yufKvbM3fEw7piHJ/grN2DcwQahHxlGJNzmd8ATl
	at0Uds4UaWb70rf0/KPy5iJsdGPuunjYQFAXy+NTK/wU/Nd9ZAsj4aF2Nqj56TAMA/eqNR0KykSWG
	drra2TRrxyXmRqcTwwwE2i/UJJLpWXhbkdVpCHUsJ54MD/XOWa415451U8OjGk8uRrXVCu028LYYX
	WKrZIb+A==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oblDX-004vLi-KA; Fri, 23 Sep 2022 16:07:55 +0000
Message-ID: <1e9159c8-48f5-cf1d-bc5a-e7e33ec0bf04@infradead.org>
Date: Fri, 23 Sep 2022 09:07:54 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in
 true_sectors_per_clst()
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Andrew Morton <akpm@linux-foundation.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Shigeru Yoshida <syoshida@redhat.com>
Cc: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <000000000000f8b5ef05dd25b963@google.com>
 <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
 <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
 <1bf6d8ea-9e81-f65a-d7dc-6e94fa12da7b@paragon-software.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1bf6d8ea-9e81-f65a-d7dc-6e94fa12da7b@paragon-software.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/23/22 04:58, Konstantin Komarov wrote:
> 
> 
> On 9/23/22 03:38, Randy Dunlap wrote:
>> Hi,
>>
>> On 9/20/22 08:59, Tetsuo Handa wrote:
>>> syzbot is reporting shift-out-of-bounds in true_sectors_per_clst() [1], for
>>> commit a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
>>> did not address that (0 - boot->sectors_per_clusters) < 0 because "u8" was
>>> chosen for type of boot->sectors_per_clusters because 0x80 needs to be
>>> positive in order to support 64K clusters. Use "s8" cast in order to make
>>> sure that (0 - (s8) boot->sectors_per_clusters) > 0.
>>>
>>> Link: https://syzkaller.appspot.com/bug?extid=1631f09646bc214d2e76 [1]
>>> Reported-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
>>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>>> Tested-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
>>> Fixes: a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
>>>
>>> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
>>> index 47012c9bf505..c7ffd21fb255 100644
>>> --- a/fs/ntfs3/super.c
>>> +++ b/fs/ntfs3/super.c
>>> @@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
>>>       if (boot->sectors_per_clusters <= 0x80)
>>>           return boot->sectors_per_clusters;
>>>       if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
>>> -        return 1U << (0 - boot->sectors_per_clusters);
>>> +        return 1U << (0 - (s8) boot->sectors_per_clusters);
>>>       return -EINVAL;
>>>   }
>>>   
>>
>> I slightly prefer the earlier patch:
>>
>> https://lore.kernel.org/all/20220823144625.1627736-1-syoshida@redhat.com/
>>
>> but it appears that the NTFS3 maintainer is MIA again. :(
>>
> 
> Hello
> 
> I've sent patches on 12.09, so I'm not MIA.
> I plan to look at patches next week, there are quite a lot of them.

OK, good news. Thanks.

-- 
~Randy
