Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117083210
	for <ntfs3@lists.linux.dev>; Thu,  9 Jun 2022 16:26:23 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 15A61244E;
	Thu,  9 Jun 2022 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654791943;
	bh=1oq5PnS23zjfxKNyen6WFUAFsQaQdy1UIReEvYOWGu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rMquLvceHExSB/F9QacBoFdi6go0hT2sC72d83Y5jtPmgSpFBHbQQuQ20JSiBfVu1
	 Ewwo3+OaEqgT3j9rVtzPJ2+rP59Iajsue8e40hHMpN+5GfHM9SBT91ye/6lteeVNEH
	 VCBLVrPwtn8CNzMEKh/I5vPOGshWk/2LkuRu5gjw=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C2FC61D30;
	Thu,  9 Jun 2022 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654791981;
	bh=1oq5PnS23zjfxKNyen6WFUAFsQaQdy1UIReEvYOWGu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=j8IudJYia01EGMroifuX9uDo569crSt+TZ9ut6U0jwZsNbm8CPXQpVGIup4f6Hfbk
	 ov+/VRFuUzZQSSyMQuEHFrb2UK0hcNcDums0WXfg5ahduF2wVclwoCIkYyb11c7BRZ
	 CNH23K5SYzqFi4YwKJqB1mLZjG0DABWSJP0UuPJE=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 9 Jun 2022 19:26:21 +0300
Message-ID: <a575ce72-cdf3-8f0c-06a2-cfd095374a62@paragon-software.com>
Date: Thu, 9 Jun 2022 19:26:21 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] fs: ntfs3: fix Using uninitialized value n when calling
 indx_read
Content-Language: en-US
To: yan <chinayanlei2002@163.com>, Kari Argillander
	<kari.argillander@gmail.com>
CC: <ntfs3@lists.linux.dev>, Yan Lei <yan_lei@dahuatech.com>
References: <20220410060929.4027-1-chinayanlei2002@163.com>
 <1fccbccb-b7d0-6f9f-e4c2-14d36e7c912c@gmail.com>
 <6a8bea15.34ed.1805067b0fb.Coremail.chinayanlei2002@163.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <6a8bea15.34ed.1805067b0fb.Coremail.chinayanlei2002@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 4/22/22 11:33, yan wrote:
> 
> 
> 
>     It's not a mistake, I can't send patchs with my company's email due to some security issues。
> 
>     The CWE bug were detected by a static code scanning tool called CodeS of my company（I don't kown its real name）.
>     The CodeS reports:
>     Use of an uninitialized variable(CWE-457)
>     Using uninitialized value "n" when calling indx_read.
> 
> 
>     commit messages is as below:
>     This CWE bug were detected by a static code scanning tool，
>     Fix using unitialized value n when calling indx_read
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> At 2022-04-21 01:50:27, "Kari Argillander" <kari.argillander@gmail.com> wrote:
>> This patch is sended from address chinayanlei2002@163.com you need to
>> send it from yan_lei@dahuatech.com this was probably mistake?
>>
>> Also please write commit message. Always good to write how did you spot
>> this and what message some analyzer showed to you. This way everyone
>> else will can verify and maybe even learn to use new tools. This also
>> looks like it really fix something so this needs fix tag so it can be
>> easily back ported to stable.
>>
>> On 10.4.2022 9.09, chinayanlei2002@163.com wrote:
>>> From: Yan Lei <yan_lei@dahuatech.com>
>>>
>>> Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
>>> ---
>>>    fs/ntfs3/index.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
>>> index 6f81e3a49..76ebea253 100644
>>> --- a/fs/ntfs3/index.c
>>> +++ b/fs/ntfs3/index.c
>>> @@ -1994,7 +1994,7 @@ static int indx_free_children(struct ntfs_index *indx, struct ntfs_inode *ni,
>>>    			      const struct NTFS_DE *e, bool trim)
>>>    {
>>>    	int err;
>>> -	struct indx_node *n;
>>> +	struct indx_node *n = NULL;
>>>    	struct INDEX_HDR *hdr;
>>>    	CLST vbn = de_get_vbn(e);
>>>    	size_t i;

I've changed author email to chinayanlei2002@163.com and applied patch.
Thanks for catching this!
