Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EE93C05
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 12:03:48 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 032A92174;
	Fri, 23 Sep 2022 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1663934173;
	bh=cYe/fQMBC9ndU97jjjkY7GYF7dVsw+gIRQLTNv3PJ2o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ioo1+Bu76+06O+/gTqCgffNsAffbq/3T04LMJTqFMF3h79nSeulnxF288jIkvtTVy
	 nU5Rnr9tlZKcKNXM4iB1/B93JDjwRkgvPJNh/zP9RzDmv5IAQ6f2udlR+proeRVXCI
	 Se71tGM3l4HPkR51qikKHlOlcTkVSs1mOcGIYLTg=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 23 Sep 2022 14:58:21 +0300
Message-ID: <1bf6d8ea-9e81-f65a-d7dc-6e94fa12da7b@paragon-software.com>
Date: Fri, 23 Sep 2022 14:58:21 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in
 true_sectors_per_clst()
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Tetsuo Handa
	<penguin-kernel@I-love.SAKURA.ne.jp>, Andrew Morton
	<akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, Shigeru
 Yoshida <syoshida@redhat.com>
CC: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <ntfs3@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
References: <000000000000f8b5ef05dd25b963@google.com>
 <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
 <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 9/23/22 03:38, Randy Dunlap wrote:
> Hi,
> 
> On 9/20/22 08:59, Tetsuo Handa wrote:
>> syzbot is reporting shift-out-of-bounds in true_sectors_per_clst() [1], for
>> commit a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
>> did not address that (0 - boot->sectors_per_clusters) < 0 because "u8" was
>> chosen for type of boot->sectors_per_clusters because 0x80 needs to be
>> positive in order to support 64K clusters. Use "s8" cast in order to make
>> sure that (0 - (s8) boot->sectors_per_clusters) > 0.
>>
>> Link: https://syzkaller.appspot.com/bug?extid=1631f09646bc214d2e76 [1]
>> Reported-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Tested-by: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>
>> Fixes: a3b774342fa752a5 ("fs/ntfs3: validate BOOT sectors_per_clusters")
>>
>> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
>> index 47012c9bf505..c7ffd21fb255 100644
>> --- a/fs/ntfs3/super.c
>> +++ b/fs/ntfs3/super.c
>> @@ -672,7 +672,7 @@ static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
>>   	if (boot->sectors_per_clusters <= 0x80)
>>   		return boot->sectors_per_clusters;
>>   	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
>> -		return 1U << (0 - boot->sectors_per_clusters);
>> +		return 1U << (0 - (s8) boot->sectors_per_clusters);
>>   	return -EINVAL;
>>   }
>>   
> 
> I slightly prefer the earlier patch:
> 
> https://lore.kernel.org/all/20220823144625.1627736-1-syoshida@redhat.com/
> 
> but it appears that the NTFS3 maintainer is MIA again. :(
> 

Hello

I've sent patches on 12.09, so I'm not MIA.
I plan to look at patches next week, there are quite a lot of them.
