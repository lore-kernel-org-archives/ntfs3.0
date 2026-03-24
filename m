Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551CD3988E6
	for <ntfs3@lists.linux.dev>; Tue, 24 Mar 2026 17:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374899; cv=none; b=nVWJIInmtKNIC4QJF8bChP4QX8R0wKqOFO/lvXtsZriX7snty+xIg2tiGZN2VDNZZrI1s2+U14ViBmuxX4RIo3osWREo1iN3c1mNLT3wS87/FLVMKu569mc+ZzfNN/UgMXaU4+L2iMC+zdjKWRHcOs3/M4a0+5JUac7/9/xbZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374899; c=relaxed/simple;
	bh=DyRpV+hEG+7ntpfiKpSn90TEc6SjrKX8CMNasF/014w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uLLqSshYw9o2VWZ73UKXXaDgsvgdMLDkKJYdUuS6ciSYzDLbxB5hKq/mLZW9/1YHG4IckVtAUj1l/0e6QSgmFfqFmgVdaWMEC98tMhULLMKD523nLSAx5T4h0TJhHZeCagaxLqELYjOa5bdaz5xqLAsa3OhO4/HFYUbVg+D9ocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Mt7sK/ZN; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Mt7sK/ZN"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 386A4241;
	Tue, 24 Mar 2026 17:55:05 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Mt7sK/ZN;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 870811A2;
	Tue, 24 Mar 2026 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1774374890;
	bh=fq8KAyFRsqQ9dH8tgdhgWP6npTya4JLuqPTT1TZL3WQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Mt7sK/ZNrgoXsoYGyPW3D//pa5dbs2x3BkLtHhb/RhVF50j0IL2Mu3DXhkyd5xMEm
	 VE5cQ+goOKrCHnbWlydeHHc42jHUjo+KsuAIHkASlM76IFFh713Q/j8wM+lXXCzTnh
	 16mmjf9hUJSZQLwnej/vwrHzZoe2bLzbt71AicEc=
Received: from [192.168.95.128] (172.30.20.215) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 24 Mar 2026 20:54:49 +0300
Message-ID: <f4541308-7233-46dc-aa9a-3c05f4d0ba25@paragon-software.com>
Date: Tue, 24 Mar 2026 18:54:47 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: work around false-postive -Wmaybe-uninitialized
 warnings
To: Arnd Bergmann <arnd@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Raphael Pinsonneault-Thibeault
	<rpthibeault@gmail.com>, Lalit Shankar Chowdhury <lalitshankarch@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260312164939.946523-1-arnd@kernel.org>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260312164939.946523-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/12/26 17:49, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc sometimes fails to analyse how two local variables in ntfs_write_bh()
> are initialized, as the initialization happens only in the first pass
> through the main loop:
>
> fs/ntfs3/fsntfs.c: In function 'ntfs_write_bh':
> fs/ntfs3/fsntfs.c:1443:17: error: 'fixup' may be used uninitialized [-Werror=maybe-uninitialized]
>   1443 |         __le16 *fixup;
>        |                 ^~~~~
> fs/ntfs3/fsntfs.c:1443:17: note: 'fixup' was declared here
>   1443 |         __le16 *fixup;
>        |                 ^~~~~
> fs/ntfs3/fsntfs.c:1487:30: error: 'sample' may be used uninitialized [-Werror=maybe-uninitialized]
>   1487 |                         *ptr = sample;
>        |                         ~~~~~^~~~~~~~
> fs/ntfs3/fsntfs.c:1444:16: note: 'sample' was declared here
>   1444 |         __le16 sample;
>
> Initializing the two variables to bogus values shuts up the warning and
> makes it clear that those cannot be used. I tried rearranging the loop to
> move the initialization in front of it, but couldn't quite figure it out.
>
> Fixes: 48d9b57b169f ("fs/ntfs3: add a subset of W=1 warnings for stricter checks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I don't know how the set of warnings for ntfs3 was picked, this seems to
> be based on what W=1 used to do many years ago. -Wmaybe-uninitialized is
> no longer part of it, and some of the other warnings enabled here are
> turned on by default now.
> ---
>   fs/ntfs3/fsntfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 0df2aa81d884..d0434756029b 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -1440,8 +1440,8 @@ int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
>   	u16 fo = le16_to_cpu(rhdr->fix_off);
>   	u16 fn = le16_to_cpu(rhdr->fix_num);
>   	u32 idx;
> -	__le16 *fixup;
> -	__le16 sample;
> +	__le16 *fixup = NULL;
> +	__le16 sample = cpu_to_le16(-1u);
>   
>   	if ((fo & 1) || fo + fn * sizeof(short) > SECTOR_SIZE || !fn-- ||
>   	    fn * SECTOR_SIZE > bytes) {

Hello,

Thanks for the patch, applied.

Regards,
Konstantin

