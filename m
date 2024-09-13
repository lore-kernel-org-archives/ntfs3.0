Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A8A2AEFC
	for <ntfs3@lists.linux.dev>; Fri, 13 Sep 2024 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726194817; cv=none; b=cInJETGdZ7DlGFZxQiXXSwfUbRoEy/jEce8MHfNePj+4znunsFz5tnalTTGZhwAWEZdfnNHxDYrqQK8dyEiCA581JR0T69tk4L//2pek3bqe/WOs+FrDlMjWOe2wOlsbOl6etvkL5ZYvRaeU/Mjrt3Suu9m+iT0ohqPWZhbu7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726194817; c=relaxed/simple;
	bh=NdTkWnpysOIzWCxoeKLkto7GLif67/SO2119cg6rYqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7/QulluEYpn7F6KTqqKyqQJ/lKADbngyOeXj8A4J6qVeSK0t76S/HrBgxtExfS+AwQ8ib0i7gs7ltGV9rTNdulU6wOmPij3N1mLK04Qigikzuu9+DHpSoVqyG1Q1+vQxqHd9T1AcY4d9w6KosUD4qfhDrwFfNkxg4O83ktWlCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=b4AL+VWQ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="b4AL+VWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=U3C86QQWao7tuzRN4lIMwsjWiVhXXFRyJjitYGN9wdU=;
	b=b4AL+VWQp+Q+cDWfc5ADENzwYr4SRN6WKm92AiyxiizLVv9EXKAq7lLCC7BEOa
	X8MLdSU7yAoTPZf/eVsH5gR7VI0RWcmXInr5MbWBaI8C54mAPL7+g7z+I28Sh7WT
	1TOxO9MUFjkRWFc99hyIj4A/RPwFb+fawE1Er9se15Z58=
Received: from localhost (unknown [120.26.85.94])
	by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wB3_6l3pONmeXiNMg--.40278S2;
	Fri, 13 Sep 2024 10:33:27 +0800 (CST)
Date: Fri, 13 Sep 2024 10:33:27 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Remove the unnecessary 'if' statement
Message-ID: <ZuOkd8dMur08t0zo@iZbp1asjb3cy8ks0srf007Z>
References: <20240911015753.49513-1-qianqiang.liu@163.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911015753.49513-1-qianqiang.liu@163.com>
X-CM-TRANSID:_____wB3_6l3pONmeXiNMg--.40278S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF13Cw45ZrWkKFy8Jr1rCrg_yoW3urX_Ga
	yjka1rK3Z8Jw1v93Z5KrWYgrWqgFW8tFsYvw13tF95CF45tFZ5Za4vq395AFsFgrZ7ZFW7
	Gwn8CFW2ka4YyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbAR67UUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRRJZamXAo4kDXgABs3

Hi almaz,

On Wed, Sep 11, 2024 at 09:57:54AM +0800, Qianqiang Liu wrote:
> The 'asize' was already checked to be less than SIZEOF_RESIDENT.
> 
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>  fs/ntfs3/record.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
> index 427c71be0f08..0f400366231d 100644
> --- a/fs/ntfs3/record.c
> +++ b/fs/ntfs3/record.c
> @@ -268,10 +268,6 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
>  
>  	/* Check size of attribute. */
>  	if (!attr->non_res) {
> -		/* Check resident fields. */
> -		if (asize < SIZEOF_RESIDENT)
> -			return NULL;
> -
>  		t16 = le16_to_cpu(attr->res.data_off);
>  		if (t16 > asize)
>  			return NULL;
> -- 
> 2.39.2

Could you please review this patch?

-- 
Best,
Qianqiang Liu

