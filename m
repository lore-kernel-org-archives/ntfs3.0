Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9F23A8
	for <ntfs3@lists.linux.dev>; Tue, 17 Jan 2023 12:05:46 +0000 (UTC)
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 30HBBeeB053962;
	Tue, 17 Jan 2023 20:11:40 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Tue, 17 Jan 2023 20:11:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.20] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 30HBBe92053959
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Jan 2023 20:11:40 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <518d5b42-be63-28ad-f28e-0f1d5d992230@I-love.SAKURA.ne.jp>
Date: Tue, 17 Jan 2023 20:11:38 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] fs/ntfs3: Use __GFP_NOWARN allocation at
 ntfs_load_attr_list()
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
        syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com, linux-mm <linux-mm@kvack.org>,
        Michal Hocko <mhocko@suse.com>
References: <00000000000027524405f1452ea8@google.com>
 <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
 <Y7M8bwYAzyuYbmP3@dhcp22.suse.cz>
 <38352801-b4ae-0cdc-17ba-06b363da3aa6@I-love.SAKURA.ne.jp>
 <Y7Pg3RtxjA8uTcfu@dhcp22.suse.cz> <Y7PjkN+2lhlO8/kK@dhcp22.suse.cz>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Y7PjkN+2lhlO8/kK@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin, what is the expected max size?
Can this allocation for legitimate filesystem become large enough to try vmalloc() ?

On 2023/01/03 17:13, Michal Hocko wrote:
> On Tue 03-01-23 09:01:34, Michal Hocko wrote:
>> On Tue 03-01-23 09:49:22, Tetsuo Handa wrote:
>>> On 2023/01/03 5:19, Michal Hocko wrote:
>>>>> @@ -52,7 +52,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
>>>>>  
>>>>>  	if (!attr->non_res) {
>>>>>  		lsize = le32_to_cpu(attr->res.data_size);
>>>>> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
>>>>> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
>>>>
>>>> This looks like a bad idea in general. The allocator merely says that
>>>> something is wrong and you are silencing that. The calling code should
>>>> check the size for reasonable range and if larger size. Moreover, if
>>>> lsize can be really more than PAGE_SIZE this should be kvmalloc instead.
>>>
>>> There are already similar commits.
>>>
>>>   commit 0d0f659bf713 ("fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()")
>>>   commit 59bfd7a483da ("fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()")
>>
>> Bad examples to follow.
>>
>>> Is KMALLOC_MAX_SIZE intended to be used by callers like
>>>
>>>   https://linux.googlesource.com/linux/kernel/git/torvalds/linux/+/a5a1e1f249db4e0a35d3deca0b9916b11cc1f02b%5E!
>>>
>>> ?
>>
>> Nope, this doesn't look right either. This all is about inhibiting the
>> warning much more than actually fixing the underlying problem which
>> would be either check against a _specification_ based or _reasonable_
>> expectation based range or using kvmalloc instead if the range is not
>> well defined.
> 
> Let me clarify some more because there are two things happening here.
> 
> kvmalloc (or its variants) should be used whenever there is a risk the
> allocation request size is large (>>PAGE_SIZE) sounds like reasonable
> rule of thumb because those allocations shouldn't put an additional
> pressure on a fragmented system.
> 
> Any user input, and that applies to potentially crafted fs images,
> should be checked for runaway values. If there is specification in
> place then this is no brainer. If the value is not well specified then
> there should be reasonable defensive checking done. KMALLOC_MAX_SIZE
> doesn't sound like a good fit for the check as that is an internal
> implementation specific constant for a particular memory allocator.
> vmalloc allows much larger allocations and sometime that is a reasonable
> thing to allow. So those checks should be domain specific.
> 

