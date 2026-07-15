Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607B42BC2C
	for <ntfs3@lists.linux.dev>; Wed, 15 Jul 2026 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135003; cv=none; b=amOp4/lsFTEsk24dktWCpzIw6e6qBbVxSadvp6BSSzvSlGvCMenmZaLmwtke3G8NgpullVVPE0OHZWElgtO7/fTdeofrGfavwdEAmTL2K5Atq9bHIggowQOkAmaXIhlxPVKSrCIxcr9Mbic1maO6mgxMcvLpzqwWqPoSKrz4Cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135003; c=relaxed/simple;
	bh=aoZY3ycGV/HGx5vKWxJ0j2B64PrtuGHJvMvHUzmlIag=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d1cLeKrsliRrjsOfp73L528QSC1512nPYgjV4n/WW2uj6ZNGlUynrosi3RZ/Yfdi+0T9hI8CdECJdnbnPxD+OYst5CQxcRtNEV9xqnAZW8p2hr/4D7f6nTwWEhqh6lJNDELdvXRDRDh41CugeoqYhhBHqS0KUuA0OvgDe5sTl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=aQ8ndE7f; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="aQ8ndE7f"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id A6A173AC;
	Wed, 15 Jul 2026 17:03:29 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=aQ8ndE7f;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 4A82E1D36;
	Wed, 15 Jul 2026 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784134999;
	bh=tgzAuJ4rKd9LgdVGOVRyVavXOvXWF0hlqemM72uvTJ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=aQ8ndE7fgnoC5CbiInxB1qQVzLEuMNFdctzga8re7YcHLkb7xMe+L4kTIcfBxROv8
	 l0i+tjkOVbOAWRUt5OgbNHhFq7xzB3LOzI+td522jfOgW7EAnErs5qcqhwGfkE5oPb
	 YNhjcyInfCgfDpJPoEnDhChurLm1AlKtI/cHL1Fk=
Received: from [192.168.95.128] (172.30.20.151) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Jul 2026 20:03:18 +0300
Message-ID: <c72be8fb-1ac5-497a-8d69-3619fbb8eff3@paragon-software.com>
Date: Wed, 15 Jul 2026 19:03:16 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix info-leak in ntfs_rename()
To: Dmitry Antipov <dmantipov@yandex.ru>, Al Viro <viro@zeniv.linux.org.uk>
CC: <ntfs3@lists.linux.dev>, <lvc-project@linuxtesting.org>,
	<syzbot+905d785c4923bea2c1db@syzkaller.appspotmail.com>
References: <20260609123618.712961-1-dmantipov@yandex.ru>
 <20260609201948.GK2636677@ZenIV> <20260609230842.GA3766471@ZenIV>
 <8c04f27f7572b4a5d675286de4878bf5b1612bfa.camel@yandex.ru>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <8c04f27f7572b4a5d675286de4878bf5b1612bfa.camel@yandex.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/10/26 13:12, Dmitry Antipov wrote:

> On Wed, 2026-06-10 at 00:08 +0100, Al Viro wrote:
>
>>  From the syzkaller spew it would appear that data (filename converted
>> to unicode, AFAICS) somehow gets returned by read(2).  If that is
>> accurate, I would suggest that the things are already FUBAR and zeroing
>> is not going to fix whatever underlying bug you've got there (metadata
>> bh left around after the corresponding on-disk block got freed and
>> reused for regular file, perhaps?)
> Hard to say about copy_to_user_iter(), but at least the first splat
> looks correct. At the end of fill_name_de(), data layout is:
>
> struct NTFS_DE *e = buf;
> ...
>
>      |<- data_size + sizeof(struct NTFS_DE) ->|<- XXX ->|
> buf |-----------------------------------------------------------
>      |<- ALIGN(data_size, 8) + sizeof(struct NTFS_DE) ->|   ;; e->size
>
> If 'buf' was allocated with kmalloc(), XXX remains uninitialized and
> passed as such to memcpy() called from hdr_insert_de().
>
> So using kzalloc() for all buffers passed to fill_name_de() looks
> the simplest and most safe solution. OTOH if someone would have
> said that an overhead of PAGE_SIZE'd memset() is too large, more
> fine-granted solution is to memset() XXX only, i.e.:
>
> diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> index b2af8f695e60..21e4a2a34389 100644
> --- a/fs/ntfs3/namei.c
> +++ b/fs/ntfs3/namei.c
> @@ -22,7 +22,7 @@ int fill_name_de(struct ntfs_sb_info *sbi, void *buf, const struct qstr *name,
>   {
>          int err;
>          struct NTFS_DE *e = buf;
> -       u16 data_size;
> +       u16 data_size, real_size, aligned_size;
>          struct ATTR_FILE_NAME *fname = (struct ATTR_FILE_NAME *)(e + 1);
>   
>   #ifndef CONFIG_NTFS3_64BIT_CLUSTER
> @@ -53,7 +53,12 @@ int fill_name_de(struct ntfs_sb_info *sbi, void *buf, const struct qstr *name,
>          fname->type = FILE_NAME_POSIX;
>          data_size = fname_full_size(fname);
>   
> -       e->size = cpu_to_le16(ALIGN(data_size, 8) + sizeof(struct NTFS_DE));
> +       real_size = data_size + sizeof(struct NTFS_DE);
> +       aligned_size = ALIGN(data_size, 8) + sizeof(struct NTFS_DE);
> +       if (aligned_size > real_size)
> +               memset((char *)buf + real_size, 0, aligned_size - real_size);
> +
> +       e->size = cpu_to_le16(aligned_size);
>          e->key_size = cpu_to_le16(data_size);
>          e->flags = 0;
>          e->res = 0;
>
> Dmitry

Hello,

Very sorry for the delay.
The patch is applied, thank you.

Regards,
Konstantin

