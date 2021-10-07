Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422E2C81
	for <ntfs3@lists.linux.dev>; Thu,  7 Oct 2021 14:33:41 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C26FA1E00;
	Thu,  7 Oct 2021 17:33:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1633617212;
	bh=vsX6icmv6TXycar9IX1Waq8BmgTCuk5oO8nNAGvl0X8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KZjSocfnhejR0hjuFU5FsoLJPbVo7ps3FQF2c2VD5XcAkM1WXcozqW3iaoBy1XLMd
	 oPyAVEMUZSt6X29evJvkeo20suMuMkCLlXVfoWia96XQK95zwYDrqZfuLYXXcKs8sD
	 32JspJfq4ksF0VKKD+QQNtxwQzZy7tMx4sKI9WsE=
Received: from [192.168.211.112] (192.168.211.112) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 7 Oct 2021 17:33:32 +0300
Message-ID: <14130f55-f61f-fb39-c653-02b4dd39bc6b@paragon-software.com>
Date: Thu, 7 Oct 2021 17:33:31 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Content-Language: en-US
To: Mark Harmstone <mark@harmstone.com>, Kari Argillander
	<kari.argillander@gmail.com>
CC: <ntfs3@lists.linux.dev>
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
 <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
 <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.112]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 06.10.2021 20:03, Mark Harmstone wrote:
> On 6/10/21 15:37, Konstantin Komarov wrote:
>> So it's expected for `ls WINDOWS` to fail.
> 
> I'm confused. If this deliberate, why does cmp_fnames pass the upcase pointer
> to ntfs_cmp_names_cpu? Or for that matter, why do you bother loading the
> upcase block at all?
> 

As I've said, it's expected, that ntfs3 case sensitive.
So it's expected for `ls WINDOWS` to fail.

About upcase block. How ntfs_cmp_names_cpu work:
First we compare case sensitive.
If we found something ( diff1 ), then we go to case insensitive loop
( that's where upcase is needed ).
There we compare case insensitive.
If we found something ( diff2 ), then we return it.
If not, then we return case sensitive result ( diff1 ).

Why such convoluted process?
This is optimized way of this algorithm ( from comment to ntfs_cmp_names ):
 * Straight way to compare names:
 * - Case insensitive
 * - If name equals and 'upcase' then
 * - Case sensitive

>> The same behavior you can see in
>> CreateFileA function with FILE_FLAG_POSIX_SEMANTICS [1]
>> or in NtSetInformationFile function with FileCaseSensitiveInformation [2].
> 
> Two different things. AIUI, FILE_FLAG_POSIX_SEMANTICS passes the
> SL_CASE_SENSITIVE flag through to the FS driver's IRP_MJ_CREATE function, doing
> a case-sensitive lookup on what would otherwise be a normal directory. The
> FileCaseSensitiveInformation flag is set on the inode and forces Windows 10 to
> always do case-sensitive lookups for that directory (i.e. it's the inverse of
> ext4's casefolding flag).
> 

Two different things from perspective of implementation.
From perspective of user they are similar: case sensitive lookup.

> This issue came to my attention because I've been doing a lot of research into
> NTFS recently, and want to add FileCaseSensitiveInformation support to your
> driver. But obviously this issue is a blocker for that.
> 
>> We must always compare filenames with bothcase == true.
> 
> You *really* need to rename this variable, it makes no sense at it is. As I
> said, as far as I can make out it means "assume that one of the strings is
> already uppercase".
> 

Yes, that's what I've meant by "There will be patch to fix this situation".
Patch fixes situation with bothcase variable.

>> There will be patch to fix this situation.
> 
> Not to be funny, but I've already provided you with one... You'll drive away
> potential contributors if you ignore their patches without a good reason.

As I've said previously right now ntfs3 is case sensitive.
Your patch will change it ( case sensitive result diff1 won't be returned ).
I've opened discussion on theme "should ntfs3 be case sensitive or case
insensitive" by writing "Should ntfs3 work with `ls WINDOWS`?".
I think, that ntfs3 need to be case sensitive.
And listed things, that I think support my opinion.
That's why I've mentioned that ntfs.sys is case sensitive.
That's why I've mentioned FILE_FLAG_POSIX_SEMANTICS and
FileCaseSensitiveInformation.
I don't think, that copying win32 api behavior is good,
when Microsoft makes steps to make ntfs work in posix way.
I'm sorry for not writing it more clear in previous letter.

Please don't think, that your work is disregarded.
You already found problem with bothcase.
I just can't accept patch, that will change default behavior of driver from
"case sensitive" to "case insensitive", without any discussion.

If I remember correctly, to make ntfs3 case insensitive you will need to provide
special functions d_hash and d_compare from struct dentry_operations
( examples: fs/fat and fs/exfat ).
Right now we use default versions, because they work with case sensitive fs.
