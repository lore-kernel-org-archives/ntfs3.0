Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF45136B
	for <ntfs3@lists.linux.dev>; Wed,  5 Oct 2022 12:17:51 +0000 (UTC)
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 295CHdLq036834;
	Wed, 5 Oct 2022 21:17:39 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Wed, 05 Oct 2022 21:17:39 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 295CHckI036828
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 5 Oct 2022 21:17:39 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2d338022-410f-c7ee-840d-2698a71152ef@I-love.SAKURA.ne.jp>
Date: Wed, 5 Oct 2022 21:17:38 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [syzbot] WARNING in wnd_init
Content-Language: en-US
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        syzbot <syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev,
        Kari Argillander <kari.argillander@gmail.com>
References: <000000000000c2333105e9cc7b1c@google.com>
 <771ac308-6a55-77b4-8335-b68cde369aae@I-love.SAKURA.ne.jp>
 <d4dd5bd0-9f9c-a132-342f-c5a3b000c19f@gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <d4dd5bd0-9f9c-a132-342f-c5a3b000c19f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/10/03 1:04, Enrico Mioso wrote:
> Hello all!
> 
> Is this the expected fix for the issue?
> Shouldn't the value be sanitized somehow?
> This is intended to be an "honest" question - I am not an experienced kernel nor filesystem programmer, just wondering...

Well, there would be two approaches.
One is to limit values in u32 range, as attempted by Kari Argillander.
The other is to handle values in u64 range, as attempted by me.

A crafted filesystem image used by this reproducer has

  inode->i_size=18446743966335434752 sbi->record_bits=10 tt=18446744073604694080

before calling

  err = wnd_init(&sbi->mft.bitmap, sb, tt);

in ntfs_fill_super().

Then, passing such value to wnd_init() makes

  nbits=18446744073604694080 bitmap_size(nbits)=2305843009200586760
  sb->s_blocksize=4096 sb->s_blocksize_bits=12
  wnd->nwnd=562949953418113

which attempts 1023TB memory allocation.

If bitmap_size() were truncated to u32, wnd_init() gets

  nbits=18446744073604694080 bitmap_size(nbits)=4281860104
  sb->s_blocksize=4096 sb->s_blocksize_bits=12
  wnd->nwnd=1045377

which attempts 2MB memory allocation.

Although we need to be careful with u64 overflow inside bitmap_size()
and bytes_to_block(), I guess that handling all values as 64bits is
a preferred approach.

If you want to go with limiting to "u32", please add explanation to
Kari's https://syzkaller.appspot.com/text?tag=Patch&x=16c34f22880000 that
u32 truncation is needed for avoiding too large memory allocation.
A mismatch between function's return value "size_t == u64" and return
statement's "u32" casting looks buggy without clear explanation.
Well, bitmap_size() should not depend on size_t which can be "u32"?

But after all, a patch for "WARNING in ntfs_fill_super" case at
https://lkml.kernel.org/r/2405d6f0-3b1a-6405-610f-fd2efab86bdd@I-love.SAKURA.ne.jp
cannot be replaced by Kari's patch, for bitmap_size() is not called in this case.

>> filesystem can become wnd->nwnd close to UINT_MAX. Add __GFP_NOWARN in

Debug printk() showed that wnd->nwnd was far beyond UINT_MAX due to 64bits.
I should update this part if we go with handle "u64" values approach.

>> order to avoid too large allocation warning, than exhausting memory by
>> using kvcalloc().

