Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134863F8248
	for <ntfs3@lists.linux.dev>; Tue, 14 Jul 2026 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047545; cv=none; b=l/pEiGzVAD10T2Bhj3hEX71VwKAYPBj667ctcpiyFQZuzj3k8tPXpSNUwGpWrk71h7hIciwn7V76PqZzItGIKy9lUnb1tDD4LhqFbbEwJLnYyqxGjhH1FaV3aQo0PatZV+HtON4mHzpM9FC0AMxPq1R6ZmRtV0QmSGCgxktXXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047545; c=relaxed/simple;
	bh=efpbSyG0NyrLSTRz926yeJcz1qPp9KZezke74dVe5B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ufKqKk2IYA1a+EPhHu3jWSLFQ9Zxs0m5f0BqBaAIa4ANdsefcWzb3k8qgrhC6yvNH1R1609USbYNv9sVMWccXD2i55M/BgAojJcsAVkPeVaNh18BwS4AUQcwiIOzUbEW4KehbVUa+AsP4hJq/P44SmRzEg7C2i4Aov/SCRJtQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=sNBQhRuH; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="sNBQhRuH"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3C72F1D37;
	Tue, 14 Jul 2026 16:45:50 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=sNBQhRuH;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D70071F9F;
	Tue, 14 Jul 2026 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784047537;
	bh=0abzpD4Fb6bhJoimnNd3PoNfYVDnVNd3lKNKmnGuwc4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sNBQhRuHMNGEBANYxNIQb+pNCw9xzaLvMS4dDx6gw9BA/js/VqbvUcf4vhSVzrtrj
	 5UpyXqMuWw16Nw0cNm/lDpmuNnNfndRD+s4clhRNgQLy1DIRAoEgWu/73uuDbQjtdd
	 oCkQU/9BtaiRLI0XY6BtPwuscAFAI19QrR+QTQvw=
Received: from [192.168.95.128] (172.30.20.173) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 14 Jul 2026 19:45:36 +0300
Message-ID: <63f2065c-1a16-4b6c-91df-5900efcf5abd@paragon-software.com>
Date: Tue, 14 Jul 2026 18:45:35 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix slab-out-of-bounds write in
 ni_create_attr_list()
To: hewei-gikaku <skyexpoc@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>
References: <20260610002929.51765-1-skyexpoc@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260610002929.51765-1-skyexpoc@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/10/26 02:29, hewei-gikaku wrote:

> From: HE WEI（ギカク） <skyexpoc@gmail.com>
>
> ni_create_attr_list() allocates a fixed buffer of al_aligned(record_size)
> (== record_size) bytes and then walks every attribute of the primary MFT
> record, writing one ATTR_LIST_ENTRY per attribute and advancing the cursor
> by le_size(name_len), with no check against the end of the buffer; the
> total size is only computed after the loop.
>
> A minimum-size resident attribute occupies SIZEOF_RESIDENT (0x18 = 24)
> bytes on disk, but an unnamed attribute expands to le_size(0) (0x20 = 32)
> bytes in the list.  Because the number of attributes in a record is not
> bounded (mi_enum_attr() accepts arbitrarily many equal-type, nameless
> minimum-size attributes), a crafted record packed with such attributes
> produces a list larger than record_size and overflows the heap buffer.
>
> This is reachable from a crafted, loop-mounted NTFS image: opening the file
> and adding an attribute (e.g. via setxattr) drives ntfs_set_ea() ->
> ni_insert_resident() -> ni_insert_attr() -> ni_ins_attr_ext() ->
> ni_create_attr_list().
>
>    BUG: KASAN: slab-out-of-bounds in ni_create_attr_list+0xc48/0x1058
>    Write of size 4 at addr ffff000008984c00 by task setfattr/345
>     ni_create_attr_list+0xc48/0x1058
>     ni_ins_attr_ext+0x510/0x7c0
>     ni_insert_attr+0x3f8/0x70c
>     ni_insert_resident+0xc8/0x3b0
>     ntfs_set_ea+0x66c/0xd28
>     ntfs_setxattr+0x4d8/0x5b0
>     __arm64_sys_setxattr+0xa4/0x124
>    Allocated by task 345:
>     ni_create_attr_list+0x188/0x1058
>    The buggy address belongs to the cache kmalloc-1k of size 1024
>    (the write lands at object+1024).
>
> Size the buffer from the actual attributes instead of assuming a single
> record_size is always enough.
>
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> Reported-by: HE WEI（ギカク） <skyexpoc@gmail.com>
> Signed-off-by: HE WEI（ギカク） <skyexpoc@gmail.com>
> ---
>   fs/ntfs3/frecord.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 2e901d073fe9..6488d7a415c0 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -768,10 +768,23 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>          rs = sbi->record_size;
>
>          /*
> -        * Skip estimating exact memory requirement.
> -        * Looks like one record_size is always enough.
> +        * Compute the exact size of the attribute list.  Each attribute in the
> +        * record yields one ATTR_LIST_ENTRY of le_size(name_len) bytes.  The
> +        * minimum on-disk attribute is SIZEOF_RESIDENT (0x18) bytes, but an
> +        * unnamed one expands to le_size(0) (0x20) here, so a record crafted
> +        * with many such attributes needs more than a single record_size; the
> +        * previous fixed kzalloc(record_size) could therefore be overflowed by
> +        * an attacker-controlled record.
>           */
> -       le = kzalloc(al_aligned(rs), GFP_NOFS);
> +       lsize = 0;
> +       attr = NULL;
> +       while ((attr = mi_enum_attr(ni, &ni->mi, attr)))
> +               lsize += le_size(attr->name_len);
> +
> +       if (!lsize)
> +               return -EINVAL;
> +
> +       le = kzalloc(al_aligned(lsize), GFP_NOFS);
>          if (!le)
>                  return -ENOMEM;
>
> @@ -781,7 +794,6 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>          attr = NULL;
>          nb = 0;
>          free_b = 0;
> -       attr = NULL;
>
>          for (; (attr = mi_enum_attr(ni, &ni->mi, attr)); le = Add2Ptr(le, sz)) {
>                  sz = le_size(attr->name_len);
> --
> 2.43.0

Hello,

Very sorry for the delay.
The patch was applied, thank you.

Regards,
Konstantin

