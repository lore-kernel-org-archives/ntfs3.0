Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C4440B
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 19:37:55 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 7iwCoALuLgNxB7iwCosqC6; Sat, 02 Jul 2022 21:37:53 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 02 Jul 2022 21:37:53 +0200
X-ME-IP: 90.11.190.129
Message-ID: <39e65450-eea6-8498-1dcc-a40699b49457@wanadoo.fr>
Date: Sat, 2 Jul 2022 21:37:51 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] fs/ntfs3: Rename bitmap_size() as ntfs3_bitmap_size()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
 vneethv@linux.ibm.com, oberpar@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, almaz.alexandrovich@paragon-software.com,
 yury.norov@gmail.com, linux@rasmusvillemoes.dk, linux-s390@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel.janitors,gmane.linux.kernel.device-mapper.devel,gmane.linux.kernel
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <56a3cb896ec446ca24e4756042d9f0829afc671a.1656785856.git.christophe.jaillet@wanadoo.fr>
 <YsCVW5Dt3YcE3TLL@smile.fi.intel.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YsCVW5Dt3YcE3TLL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/07/2022 à 20:58, Andy Shevchenko a écrit :
> On Sat, Jul 02, 2022 at 08:29:27PM +0200, Christophe JAILLET wrote:
>> In order to introduce a bitmap_size() function in the bitmap API, we have
>> to rename functions with a similar name.
> 
> ...
> 
>>   /* NTFS uses quad aligned bitmaps. */
>> -static inline size_t bitmap_size(size_t bits)
>> +static inline size_t ntfs3_bitmap_size(size_t bits)
>>   {
>>   	return ALIGN((bits + 7) >> 3, 8);
> 
> It would be easier to understand in a way
> 
> 	return BITS_TO_BYTES(ALIGN(bits, 64));

This purpose of the patch was only to rename a function, not to modify 
the code itself, even if both version also looks equivalent to me.

So I'll leave it to you or anyone else to change it.

CJ

> 
>>   }
> 


