Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66592345CC2
	for <ntfs3@lists.linux.dev>; Wed,  1 Apr 2026 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068134; cv=none; b=GmkkTXlKYaHEje6Qm6l34i+z9daepN671r6mIf303NZFLHkzhk+35gz0tT4N/Qr3uV3o8S2dd0E+DCJclJ5Rjc7LpBKMINWH0jrZFHE2kC6CP0ULwl0yPhVnmXugZ89brtwHFb9asPMK5Fz1bciRbGJqM4xsFa6wxzxrCDdTcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068134; c=relaxed/simple;
	bh=oFW+MldjdLpVfuL6vfR5lnWV+8og8teh9WIj9n3RWy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vr+J8L49QZGAbh4egEIUifURS+5wIZJgHtUJeWn2av+Yxhn1wQ9t7sjbcPfXhnZavH/uXYjEaAOiVouyDT9P8Ducqb/9vYV4IQOf9uCBw5TvZQyjJuEMLDNvE0ZUEkPLnDQWkwragyKzUL8NzbsA3hKP6Sxz7NzluNy2jCFB+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=MoSrgYXe; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="MoSrgYXe"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 978D91D10;
	Wed,  1 Apr 2026 18:21:39 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=MoSrgYXe;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 2E9191FA3;
	Wed,  1 Apr 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1775067686;
	bh=abh4vBivr755GicTRiNKOXZ9LLeyfaxYfI+ceWpVgVQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MoSrgYXe6ewfvUAClssnygpjdv35A4e2ebnZmeJftdfVSU0a1+PckYDYG8TP490Iu
	 w7WlKY1vEpTZ5k2QOfLuCi9FaI2lSD7CQEDRrQmVTjlOuOYZ2z5foV2acbLdRIueBB
	 ym1nRPk+0SGy2i8I8b01H2nQiMPPuJHCKyiAIb+w=
Received: from [192.168.95.128] (172.30.20.154) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 1 Apr 2026 21:21:24 +0300
Message-ID: <57604e08-b0b4-4e47-aa31-fc22d35c1b12@paragon-software.com>
Date: Wed, 1 Apr 2026 20:21:16 +0200
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

Your patch is being tested internally. I’ll follow up with
feedback in the next few days.

Regards,
Konstantin

