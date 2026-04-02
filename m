Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F0C355803
	for <ntfs3@lists.linux.dev>; Thu,  2 Apr 2026 18:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154329; cv=none; b=e1D+EciFEL7oA/ihRjqsBmFzVnmubnu507xU8DNXdPWs9S7JSbrCkn5VzJFgXDyUBdZX7aZGMSS26jJHTGIgg6Jl8KOhf7klyKBN+JC+CGFjy/+cph+juFRA8DHe9P4VVzC1UrYVomu4IYGYFpeKuj8Jp0aydGKugypgxL4no1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154329; c=relaxed/simple;
	bh=UQ9GkkUuNRHkhV6s4IvliYTnue1Bjrh+PSmzddD1Bdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QszZQQbHn0gLmGbzgi8up7I04SMrkNeYn3ksNygJVyASJyH0ipndxDZ76UiFSip38mwp726N2Fe2SKjJEdNBZA5ZhEIpBgQd5zS0ujideyvDwkHSI6o/J0xUBjCW0bcBQ+2zNA7BthT6J0IRDYnkXsnGf6c/xPtLIxQQqfq03Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=UKOqv2hQ; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="UKOqv2hQ"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 6C6A01D3F;
	Thu,  2 Apr 2026 18:25:33 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=UKOqv2hQ;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 318CF2133;
	Thu,  2 Apr 2026 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1775154320;
	bh=nDlLx9xUOZrT8RRhuJu12M/UinbbBvfLLkTsyTOJNBg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UKOqv2hQwAhxcKcUvoCBX0SgBCySK4Ray238ULt61I1p2f6+XkSn97fge9rpG8RP7
	 cbqJiiKJ+LvMsAZfN854d/huMLahnQrCgjBueXvfwN0Pemd9ySKBWvSGXjtRhqQdB3
	 5kclkuWqqvUukelMsK3XwR0LlCLLQG97nE0fidg8=
Received: from [192.168.95.128] (172.30.20.173) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 2 Apr 2026 21:25:19 +0300
Message-ID: <f70fe5da-d4f6-4b8f-ad6e-74a9328614ec@paragon-software.com>
Date: Thu, 2 Apr 2026 20:25:17 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix memory leak in indx_create_allocate()
To: Deepanshu Kartikey <kartikey406@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com>
References: <20260323052148.1239035-1-kartikey406@gmail.com>
 <CADhLXY7ZbABcd35Br7u4MGz9VmbWSmbTG0fhj_PU1W3VQkbKQg@mail.gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <CADhLXY7ZbABcd35Br7u4MGz9VmbWSmbTG0fhj_PU1W3VQkbKQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/31/26 10:49, Deepanshu Kartikey wrote:

> On Mon, Mar 23, 2026 at 10:51 AM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
>> When indx_create_allocate() fails after
>> attr_allocate_clusters() succeeds, run_deallocate()
>> frees the disk clusters but never frees the memory
>> allocated by run_add_entry() via kvmalloc() for the
>> runs_tree structure.
>>
>> Fix this by adding run_close() at the out: label to
>> free the run.runs memory on all error paths. The
>> success path is unaffected as it returns 0 directly
>> without going through out:, transferring ownership
>> of the run memory to indx->alloc_run via memcpy().
>>
>> Reported-by: syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=7adcddaeeb860e5d3f2f
>> Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
>> ---
>>   fs/ntfs3/index.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
>> index 97f06c26fe1a..11f59d7b9ea4 100644
>> --- a/fs/ntfs3/index.c
>> +++ b/fs/ntfs3/index.c
>> @@ -1481,6 +1481,7 @@ static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>>          run_deallocate(sbi, &run, false);
>>
>>   out:
>> +       run_close(&run);
>>          return err;
>>   }
>>
>> --
>> 2.43.0
>>
> Hi Almaz,
>
> Gentle ping on this patch . I have submitted this patch on 23 March
> 2026 and this patch has been tested by sysbot.
>
> Please let me know if anything else required
>
> Thanks

Hello,

Your patch is applied, thanks for your work.

Regards,
Konstantin

