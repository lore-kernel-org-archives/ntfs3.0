Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0867F
	for <ntfs3@lists.linux.dev>; Tue,  3 Jan 2023 00:54:42 +0000 (UTC)
Received: from fsav114.sakura.ne.jp (fsav114.sakura.ne.jp [27.133.134.241])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 3030sWW5084481;
	Tue, 3 Jan 2023 09:54:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav114.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp);
 Tue, 03 Jan 2023 09:54:32 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp)
Received: from [192.168.1.20] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 3030nMHu083730
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 3 Jan 2023 09:49:22 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <38352801-b4ae-0cdc-17ba-06b363da3aa6@I-love.SAKURA.ne.jp>
Date: Tue, 3 Jan 2023 09:49:22 +0900
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
To: Michal Hocko <mhocko@suse.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
        syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com, linux-mm <linux-mm@kvack.org>
References: <00000000000027524405f1452ea8@google.com>
 <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
 <Y7M8bwYAzyuYbmP3@dhcp22.suse.cz>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Y7M8bwYAzyuYbmP3@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023/01/03 5:19, Michal Hocko wrote:
>> @@ -52,7 +52,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
>>  
>>  	if (!attr->non_res) {
>>  		lsize = le32_to_cpu(attr->res.data_size);
>> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
>> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
> 
> This looks like a bad idea in general. The allocator merely says that
> something is wrong and you are silencing that. The calling code should
> check the size for reasonable range and if larger size. Moreover, if
> lsize can be really more than PAGE_SIZE this should be kvmalloc instead.

There are already similar commits.

  commit 0d0f659bf713 ("fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()")
  commit 59bfd7a483da ("fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()")

Is KMALLOC_MAX_SIZE intended to be used by callers like

  https://linux.googlesource.com/linux/kernel/git/torvalds/linux/+/a5a1e1f249db4e0a35d3deca0b9916b11cc1f02b%5E!

? I think that, unless there is a known upper limit defined by specification,
checking for overflow and silence like

  https://lkml.kernel.org/r/6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp

is fine. These input are random values which do not need to succeed by using kvmalloc().

