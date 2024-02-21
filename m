Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380233A8C9
	for <ntfs3@lists.linux.dev>; Wed, 21 Feb 2024 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708504042; cv=none; b=FBlX8Tk8yPjofXGicOVITw8jTrZVmXK/V9uwWwneTBYIft/fNOFvdVAJ6c50QFNF9nQPDr8rKjAwQLV2aGAAAmjYLtHV5K3oGV4Lo0TDuxdfLPvgolL7g9qP5f9JkMsglR7X7AN5xWOByz1kLiufuo3NaL/+oZEYYgSRG/q1lvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708504042; c=relaxed/simple;
	bh=WShScRfKCAMbK9N+nYtjqbc7hhSfVv0GTSMuCGk1egc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JtCjIJhzgkkMKCK3J/j4CuNwtwRnTtsNJJgC9xVu6lfkbW0bA+taUQUcu6hobodFgu4JBIm48G3uIdTXHe4++Gn1ukdk04pJU7cwzYxUjf5Za6nTiGdAYisI1DAWFk8rglujWbh0xAAkrnCzqW1Tfel9n84q56JlFk8VdztBnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=MoJWwxox; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MoJWwxox"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41270d3ce26so9589685e9.2
        for <ntfs3@lists.linux.dev>; Wed, 21 Feb 2024 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708504037; x=1709108837; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDEMz9AvW6dwxDy0dCPi0/PDlhOWSUsnwtdsTxUMNW4=;
        b=MoJWwxoxB6Bf3UogMYwbcjQKF3F/Hu0o3MhEkqzG4c7X5mFt0JbNHj3DhSxqdMFvkY
         16dG1qiLPVoZa4y6NUFGfJP6wD0y7O0AUsufHU336khK4SECAPLE/C8OXPoAgy2TIHA5
         lGDwSTtVpKYT+m7N4kD4JqC2MAePwju2deQXVDlpcTXMPrgC+0BB16Rw/vuB65B+Vuzi
         DMkEGUD3G6g/h/Ia356T9VtSG7nk8vllxD9TDKfrOEKkX0tQgxqsNgxyBKWMunNJi9N+
         W/OVqJOLd8CTja7+YcFThZ9fzNBzxuJ/4tT1q2eexgD479kdM4wN4krbxE26zEv/XNhp
         HN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708504037; x=1709108837;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDEMz9AvW6dwxDy0dCPi0/PDlhOWSUsnwtdsTxUMNW4=;
        b=t6jhlzH+i+0DEKuFyHT++iPX6BCOg44UlOP67nSB6yCSmm7eGz1cyQlCKN93dbPrzx
         6nk4DjdyOBqdg5KvhVop33RpJcRIrWMg8anvnPLCg08hQNYXxb5a3MCIe6OiUan8kQ0V
         5vQUUvIScuH7ShNQyEBU74Objz26qD/rIjq6uu+qZolOm+I84aDBIPEImhecshTMVXdm
         PnI/1YLqTNVxgCD7teNQbSYWYh+6qKTW5UPTGLJ9HxqdZqZpQrCTBuqIT84N6CMes2SO
         U1MwtwMUpJl0gP3NrI1zEgjdtH6xNYEHoGN/8Boxnlz6EkIgXszK/C0q2x3L3dagRf5O
         jorw==
X-Gm-Message-State: AOJu0YyS/AIr1/VjsAevqcIKeEQfRylBrxE5Ylj5i9U2KDAISkHe8HzS
	QCpnCaeOaszGUomIYAaSHTgxGf+ft46l08EIzPpJ9pIC4sT9ORIG
X-Google-Smtp-Source: AGHT+IEYYfrFXg/ko+0JmsE0adl4AVug1KDi6YXpKG3r9GT/SbYMtc4YoDgpP/Dm2X9CGsdnN9VYNg==
X-Received: by 2002:a05:600c:3b9a:b0:411:50aa:1106 with SMTP id n26-20020a05600c3b9a00b0041150aa1106mr13101901wms.24.1708504037347;
        Wed, 21 Feb 2024 00:27:17 -0800 (PST)
Received: from [192.168.1.10] ([94.9.209.181])
        by smtp.googlemail.com with ESMTPSA id f8-20020a05600c4e8800b0040f0219c371sm17480318wmq.19.2024.02.21.00.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 00:27:16 -0800 (PST)
Message-ID: <0f3542a4-d558-447c-9dd7-cbb410c88e23@googlemail.com>
Date: Wed, 21 Feb 2024 08:27:13 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] fs/ntfs3: fix build without CONFIG_NTFS3_LZX_XPRESS
From: Chris Clayton <chris2553@googlemail.com>
To: Mark O'Donovan <shiftee@posteo.net>, linux-kernel@vger.kernel.org
Cc: ntfs3@lists.linux.dev, almaz.alexandrovich@paragon-software.com,
 regressions@leemhuis.in
References: <20240214224500.811609-1-shiftee@posteo.net>
 <89630027-f93c-4e1d-a9c0-a120b8f0bc9e@googlemail.com>
Content-Language: en-GB
In-Reply-To: <89630027-f93c-4e1d-a9c0-a120b8f0bc9e@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi

This build regression also shows up, along with other problems, in a report to the ntfs3 list by the kernel test robot.[1]

Also, as this patch seems not to have been picked up by the NTFS3 maintainer I've added Thorsten Leemhuis so he can
consider adding this egression to the tracker.

[1] https://lore.kernel.org/ntfs3/202402211322.4GbTCzp8-lkp@intel.com/T/#u

Chris



On 19/02/2024 07:21, Chris Clayton wrote:
> Hi.
> 
> On 14/02/2024 22:45, Mark O'Donovan wrote:
>> When CONFIG_NTFS3_LZX_XPRESS is not set then we get the following:
>> fs/ntfs3/frecord.c:2460:16: error: unused variable ‘i_size’
>>
>> Signed-off-by: Mark O'Donovan <shiftee@posteo.net>
>> ---
>>  fs/ntfs3/frecord.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
>> index 3b42938a9d3b..7f27382e0ce2 100644
>> --- a/fs/ntfs3/frecord.c
>> +++ b/fs/ntfs3/frecord.c
>> @@ -2457,7 +2457,6 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
>>  	struct ATTR_LIST_ENTRY *le = NULL;
>>  	struct runs_tree *run = &ni->file.run;
>>  	u64 valid_size = ni->i_valid;
>> -	loff_t i_size = i_size_read(&ni->vfs_inode);
>>  	u64 vbo_disk;
>>  	size_t unc_size;
>>  	u32 frame_size, i, npages_disk, ondisk_size;
>> @@ -2509,6 +2508,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
>>  		err = -EOPNOTSUPP;
>>  		goto out1;
>>  #else
>> +		loff_t i_size = i_size_read(&ni->vfs_inode);
>>  		u32 frame_bits = ni_ext_compress_bits(ni);
>>  		u64 frame64 = frame_vbo >> frame_bits;
>>  		u64 frames, vbo_data;
>>
>> base-commit: 7e90b5c295ec1e47c8ad865429f046970c549a66
> 
> Mark - Thanks for the patch.
> Alex - Fixes a build bug introduced by 4fd6c08a16d7f1ba10212c9ef7bc73218144b463.
> 
> Tested-by: Chris Clayton <chris2553@googlemail.com>
