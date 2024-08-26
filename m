Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16C5579F
	for <ntfs3@lists.linux.dev>; Mon, 26 Aug 2024 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655975; cv=none; b=ARZkUjy3jy2k5/Fe7h80wAbZK5+6qPFA6GStBBPnf0qckifJIQNKOpF5lsmLhT3mpY6ThPgx+YClVCko72dZuV/jWGasdfZj1PLzVbuoLuxUky+yFyLzh66jcbv8mbFFKsF6a5ryZbQQOp3FK6BHaondGa/aSYNsF6yVIxY2W4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655975; c=relaxed/simple;
	bh=ntgU/Gs1WPVWSjpTojS+cQHo7tmNVfSa0nGOVtUrG8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K+IC7QNYnQ+wo2X6xIQPb2wh0M2OOC/75OL7Aj2TpyQpFQu+/3xQP6hUIZACUarSObr4MlxRWAW+RMQIsaVEfImJYpmGk9wDmZbUUTKq02zZAGaYkOW9N2dhMn1D9DFjcX8wp8zT1RUqEJ9aVOAe9A3bh4kjfMuTMnshGLPwbQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=I/7k8ZGE; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="I/7k8ZGE"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 396C31D47;
	Mon, 26 Aug 2024 06:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724655491;
	bh=BJ5z7OC/g7vD1irB8WXwxKdjj7fORgoclEiUgkQtBN0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I/7k8ZGExtwduVHJKXYiwJSt4iQCplpxZ0J627+kFnyqf1z3+1LNOtUVIcv5VyTwz
	 xAvRk1ur8nM1sO+y7hjjg7ZtbQjTfxtTz0tzL/Admuq4Ct+2wcXQ0OlDO0XJ0gMXUW
	 CfK4UOU/ZBA7NEJGudMAzXjt3mzu3KeBkd3+aOHw=
Received: from [172.16.95.128] (192.168.211.194) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 26 Aug 2024 10:06:04 +0300
Message-ID: <83ef51d3-9eec-4b29-863b-1578917c633b@paragon-software.com>
Date: Mon, 26 Aug 2024 10:06:03 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs3: Add bounds checking to mi_enum_attr()
To: lei lu <llfamsec@gmail.com>, <ntfs3@lists.linux.dev>
CC: <lizhi.xu@windriver.com>,
	<syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>
References: <20240823133944.211852-1-llfamsec@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20240823133944.211852-1-llfamsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 23.08.2024 16:39, lei lu wrote:
> Added bounds checking to make sure that every attr don't stray beyond
> valid memory region.
>
> Signed-off-by: lei lu <llfamsec@gmail.com>
> ---
>   fs/ntfs3/record.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
> index 6aa3a9d44df1..973e2a371bc2 100644
> --- a/fs/ntfs3/record.c
> +++ b/fs/ntfs3/record.c
> @@ -223,28 +223,19 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
>   		prev_type = 0;
>   		attr = Add2Ptr(rec, off);
>   	} else {
> -		/* Check if input attr inside record. */
> +		/*
> +		 * We don't need to check previous attr here. There is
> +		 * a bounds checking in the previous round.
> +		 */
>   		off = PtrOffset(rec, attr);
> -		if (off >= used)
> -			return NULL;
>   
>   		asize = le32_to_cpu(attr->size);
> -		if (asize < SIZEOF_RESIDENT) {
> -			/* Impossible 'cause we should not return such attribute. */
> -			return NULL;
> -		}
> -
> -		/* Overflow check. */
> -		if (off + asize < off)
> -			return NULL;
>   
>   		prev_type = le32_to_cpu(attr->type);
>   		attr = Add2Ptr(attr, asize);
>   		off += asize;
>   	}
>   
> -	asize = le32_to_cpu(attr->size);
> -
>   	/* Can we use the first field (attr->type). */
>   	if (off + 8 > used) {
>   		static_assert(ALIGN(sizeof(enum ATTR_TYPE), 8) == 8);
> @@ -265,6 +256,12 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
>   	if (t32 < prev_type)
>   		return NULL;
>   
> +	asize = le32_to_cpu(attr->size);
> +	if (asize < SIZEOF_RESIDENT) {
> +		/* Impossible 'cause we should not return such attribute. */
> +		return NULL;
> +	}
> +
>   	/* Check overflow and boundary. */
>   	if (off + asize < off || off + asize > used)
>   		return NULL;
Hi Lei Lu,
I saw your patch and have started working on it, including checks and 
testing.

Regards, Konstantin


