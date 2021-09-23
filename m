Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B53FCB
	for <ntfs3@lists.linux.dev>; Thu, 23 Sep 2021 16:11:32 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E07CC1D40;
	Thu, 23 Sep 2021 19:11:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632413489;
	bh=8ye9Cx7G+0A6KCJSzmDTdmMy2k/YcvE7Qnx+pY0deQc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qBWaGzDFDSp/wTFs7O6KkRKNm3SPkKjk76KHeCX5eXt1li1xgvSRCBlh8J+3uDeIa
	 9Yws9za22AWmgnsqN3+4HAYLghC2TBeCz49PdPwrDWiQQUZSHZX1iZhQxjDYaVIqaW
	 yyAXt5hfVVxXQooGhNmNHQ16dcuT90J9H2Zb80u0=
Received: from [192.168.211.73] (192.168.211.73) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 23 Sep 2021 19:11:29 +0300
Message-ID: <fbc33faa-5eec-527c-3c78-4966a5480f44@paragon-software.com>
Date: Thu, 23 Sep 2021 19:11:29 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/2] fs/ntfs3: Remove a useless test in 'indx_find()'
Content-Language: en-US
To: Kari Argillander <kari.argillander@gmail.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
CC: <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
 <20210921213955.se7svkfr62xndnlc@kari-VirtualBox>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210921213955.se7svkfr62xndnlc@kari-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.73]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 22.09.2021 00:39, Kari Argillander wrote:
> On Sat, Sep 18, 2021 at 09:56:19PM +0200, Christophe JAILLET wrote:
>> 'fnd' has been dereferenced several time before, so testing it here is
>> pointless.
>> Moreover, all callers of 'indx_find()' already have some error handling
>> code that makes sure that no NULL 'fnd' is passed.
>>
>> So, remove the useless test.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Seems correct, thanks.
> 
> Reviewed-by: Kari Argillander <kari.argillander@gmail.com>
> 
>> ---
>>  fs/ntfs3/index.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
>> index 4f71a91f07d9..6f81e3a49abf 100644
>> --- a/fs/ntfs3/index.c
>> +++ b/fs/ntfs3/index.c
>> @@ -1072,9 +1072,7 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
>>  	if (!e)
>>  		return -EINVAL;
>>  
>> -	if (fnd)
>> -		fnd->root_de = e;
>> -
>> +	fnd->root_de = e;
>>  	err = 0;
>>  
>>  	for (;;) {
>> -- 
>> 2.30.2
>>

Thanks for work - applied!
