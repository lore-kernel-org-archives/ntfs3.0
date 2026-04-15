Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC830FC1F
	for <ntfs3@lists.linux.dev>; Wed, 15 Apr 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268843; cv=none; b=aLwb5TjtuljmxEq42JZQzDT5z9xj2uvftSmqPh8Tfpmk3bDsrHSsAtFC/1PMHfeZaMhATt0L+1vrW7qMu/VhKzx67+G1zp3G2tYXjPFLsFsdbp/IoC1+A+YCMAJfhamvPIPnUSSiSwhYQtH89Qr5Ds8LuozPb1j4EAH8EBKoDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268843; c=relaxed/simple;
	bh=iJ0UpLkmeG7hXu0wuL0rWBHSVJnVz/hLmItoBSa4xwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RmcCkkhaJ37PxQzWicmsKqQ0LTMhiWt8s0m6P99ZInukfbyI05KVQoVe2Ab4WVlUuzm/xQHaPoCQ7+SIHI7ZGQJLpEjB09iswzxd2Of/7LKlu007U9k9gYxQrYfsu4WympBz7UUNBGcvuP+eT7sdpsw4yPDZ9zB3tscvcK6MkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=RM4bz+Ex; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="RM4bz+Ex"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 7A6DC241;
	Wed, 15 Apr 2026 16:00:51 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=RM4bz+Ex;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 86A0E216B;
	Wed, 15 Apr 2026 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1776268840;
	bh=G7MkMKlw/Tx00hkOFYTWXCDXqsRiyj94Mm+6mqp8sBo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RM4bz+ExQ5ifZuIXSDvM+dejUKKrIPfV3+f6VbeTLuvP2fxf6G8I1gptXKL00mKQ1
	 qvFt1xB/2+a66cQ14Sdl3ohAn6lmk2DA7wtJbkkKRvfAWB7Av0rbe9wB3qYzFuYTKP
	 xrzpxCQALIgK7bQBbbefwZDMKoQbYqlwYSMtcT0c=
Received: from [192.168.95.128] (172.30.20.171) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Apr 2026 19:00:39 +0300
Message-ID: <bef2feea-86fe-4bb3-b749-4b65956ff865@paragon-software.com>
Date: Wed, 15 Apr 2026 18:00:38 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] fs/ntfs3: Add attrib operations
To: Dan Carpenter <error27@gmail.com>
CC: <ntfs3@lists.linux.dev>
References: <adjNvTr_3bZmmPfJ@stanley.mountain>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <adjNvTr_3bZmmPfJ@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/10/26 12:15, Dan Carpenter wrote:

> Hello Konstantin Komarov,
>
> Commit be71b5cba2e6 ("fs/ntfs3: Add attrib operations") from Aug 13,
> 2021 (linux-next), leads to the following Smatch static checker
> warning:
>
> 	fs/ntfs3/attrib.c:176 attr_allocate_clusters()
> 	error: we previously assumed 'pre_alloc' could be null (see line 167)
>
> fs/ntfs3/attrib.c
>      160 int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
>      161                            struct runs_tree *run_da, CLST vcn, CLST lcn,
>      162                            CLST len, CLST *pre_alloc, enum ALLOCATE_OPT opt,
>      163                            CLST *alen, const size_t fr, CLST *new_lcn,
>      164                            CLST *new_len)
>      165 {
>      166         int err;
>      167         CLST flen, vcn0 = vcn, pre = pre_alloc ? *pre_alloc : 0;
>      168         size_t cnt = run->count;
>      169
>      170         for (;;) {
>      171                 err = ntfs_look_for_free_space(sbi, lcn, len + pre, &lcn, &flen,
>      172                                                opt);
>      173
>      174                 if (err == -ENOSPC && pre) {
>      175                         pre = 0;
> --> 176                         if (*pre_alloc)
>
> I'm not sure why warnings from 2021 are showing up as new warnings but
> presumably this should be:
>
> 	if (pre_alloc)
> 		*pre_alloc = 0;
>
>      177                                 *pre_alloc = 0;
>      178                         continue;
>      179                 }
>      180
>      181                 if (err == -ENOSPC && new_len && vcn - vcn0) {
>      182                         /* Keep already allocated clusters. */
>      183                         *alen = vcn - vcn0;
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter

Hello,

Thanks. The warning was fixed in the patch:
https://lore.kernel.org/ntfs3/20260415155413.26884-1-almaz.alexandrovich@paragon-software.com/

Regards,
Konstantin

