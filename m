Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD3A27146A
	for <ntfs3@lists.linux.dev>; Fri, 16 Jan 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571119; cv=none; b=TVxxb81F7E1eRBv58adWA+alM8qqhh2zo1BLI622+3rTqujM1pIY1GIeayQzLQgXzDZ8+941COJ4VxnvpcS7F2q0gqLWdDTWD/4OgzqyO89XgiUXaOBoFeGN4QJGTCwn8TsXwn+u7U0FKUJ7yOxWNll/JlY/2IK+/Cd4C00bk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571119; c=relaxed/simple;
	bh=RseW70J5Z4IDNO3bTu+ORHLhqspWqu0T5eiKQgDiolU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hd4pqi9Do6bAjiSlZ3WjnAbJkj4ytfHUCvTikjqFtiZqxgqc175gD1fcaXINZi8GjcZUlaVxVftZq97jb/giK9I3SoRzmu1DMKBPu9AX2/h+hPQDy+LHcLXC8rJnHF2kbo7jyStxq5oaqSwmMkIxGXkjiXqgOXl3Un9WbSYTpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=UylcT6G8; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="UylcT6G8"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D34781D99;
	Fri, 16 Jan 2026 13:42:37 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=UylcT6G8;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 236B0219B;
	Fri, 16 Jan 2026 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1768571116;
	bh=higReOlP+XfT/r+N/ki+piQHFoNiH44BMP/Zo/Qse8E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UylcT6G8iHKXNVA2A7Fknkie0GUFDG1GVeCXbpvuad3WiULktCOvt9BandKUtv8Vz
	 +TX6sbDxF9tNiABHhe88wd1vLxL6GNZimlTCdAqiMOkW8zeyNi/DZbaznWdqOWBCsT
	 yeyvlZQ6AHnSugMczh1Ax+7EJhio6HsFVjbuViqY=
Received: from [192.168.95.128] (172.30.20.155) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 16 Jan 2026 16:45:15 +0300
Message-ID: <0e5028ea-7755-404a-bd21-26ff08b067a7@paragon-software.com>
Date: Fri, 16 Jan 2026 14:45:13 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ntfs3: Refactor duplicate kmemdup pattern in
 do_action()
To: Baolin Liu <liubaolin12138@163.com>
CC: <ntfs3@lists.linux.dev>, Baolin Liu <liubaolin@kylinos.cn>
References: <20260106063425.155939-1-liubaolin12138@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260106063425.155939-1-liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 1/6/26 07:34, Baolin Liu wrote:

> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Extract the repeated pattern of duplicating attribute and updating
> OpenAttr into a helper function to reduce code duplication and improve
> maintainability.
>
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/fslog.c | 54 ++++++++++++++++++++++++------------------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 38934e6978ec..d9d24e0cb0e3 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3028,6 +3028,26 @@ static struct ATTRIB *attr_create_nonres_log(struct ntfs_sb_info *sbi,
>   	return attr;
>   }
>   
> +/*
> + * update_oa_attr - Synchronize OpenAttr's attribute pointer with modified attribute
> + * @oa2: OpenAttr structure in memory that needs to be updated
> + * @attr: Modified attribute from MFT record to duplicate
> + *
> + * Returns true on success, false on allocation failure.
> + */
> +static bool update_oa_attr(struct OpenAttr *oa2, struct ATTRIB *attr)
> +{
> +	void *p2;
> +
> +	p2 = kmemdup(attr, le32_to_cpu(attr->size), GFP_NOFS);
> +	if (p2) {
> +		kfree(oa2->attr);
> +		oa2->attr = p2;
> +		return true;
> +	}
> +	return false;
> +}
> +
>   /*
>    * do_action - Common routine for the Redo and Undo Passes.
>    * @rlsn: If it is NULL then undo.
> @@ -3251,15 +3271,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>   			le16_add_cpu(&rec->hard_links, 1);
>   
>   		oa2 = find_loaded_attr(log, attr, rno_base);
> -		if (oa2) {
> -			void *p2 = kmemdup(attr, le32_to_cpu(attr->size),
> -					   GFP_NOFS);
> -			if (p2) {
> -				// run_close(oa2->run1);
> -				kfree(oa2->attr);
> -				oa2->attr = p2;
> -			}
> -		}
> +		if (oa2)
> +			update_oa_attr(oa2, attr);
>   
>   		mi->dirty = true;
>   		break;
> @@ -3318,16 +3331,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>   			memmove(Add2Ptr(attr, aoff), data, dlen);
>   
>   		oa2 = find_loaded_attr(log, attr, rno_base);
> -		if (oa2) {
> -			void *p2 = kmemdup(attr, le32_to_cpu(attr->size),
> -					   GFP_NOFS);
> -			if (p2) {
> -				// run_close(&oa2->run0);
> -				oa2->run1 = &oa2->run0;
> -				kfree(oa2->attr);
> -				oa2->attr = p2;
> -			}
> -		}
> +		if (oa2 && update_oa_attr(oa2, attr))
> +			oa2->run1 = &oa2->run0;
>   
>   		mi->dirty = true;
>   		break;
> @@ -3377,14 +3382,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>   			attr->nres.total_size = new_sz->total_size;
>   
>   		oa2 = find_loaded_attr(log, attr, rno_base);
> -		if (oa2) {
> -			void *p2 = kmemdup(attr, le32_to_cpu(attr->size),
> -					   GFP_NOFS);
> -			if (p2) {
> -				kfree(oa2->attr);
> -				oa2->attr = p2;
> -			}
> -		}
> +		if (oa2)
> +			update_oa_attr(oa2, attr);
> +
>   		mi->dirty = true;
>   		break;
>   

Patch looks good — applied. Thanks.

Regards,
Konstantin

