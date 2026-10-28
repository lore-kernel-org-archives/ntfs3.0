Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173181;
	b=1377knS6VfwLPsQx6HTlypMCcrf2eGFasbu2llpOwgOZ8tUts/HktN/QJjjAviXmbL+h
	 oujWfiwZ+3demRMKF0J7XyZ+r1Q6fOafy/Jxy7flyBJhgaUpWsMZ4jBVOKByijcA1EMD5
	 pyJ6CIkH8gr1gykPjqvWbSeuaZFKXxT4zbRCFWKB8Tqhydj4+WEVcKSAQExUf8CsUtFc6
	 l/wMuT1pnaT/xx9an7Lg1ffO8/qVe4VL8MpgfVcKdx8DiZGLG2ghXMDcEpkPYLGfvJqFp
	 Sx5XQFnu4q0Au8lyLPs3s3A+pQ/JsCiDBnFe59cY4w+4OnQQR801FA5EMhoMst+mpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173181;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=LNhIlErN1oXjXd9knzYqaC/KZ8Z+RHfqJ18LX9MgCBE=;
	b=ZM6bT27qVK1nmp4qla5C5Pf0bRwa1ePpRCegVksPoTGjNfJc3Vl4t3ecwhuNrU0r16MU
	 G2nE3RBsP0s+WytOBfg4bShdPwsjsb5548z46zuzY310cKw1RyDTp1IDHSyNEAE1yTTNn
	 esoLgteccfRRVTM9sK+O5BSH6lgfiZPJ0USRKP/vO4RgUrPzkhb8TGUylEfQU3FeHJARN
	 5/lSJjI5j5qaLolBsPmIculugovr+oOI7e231SbUzu6LgjiXP8jx7Hlwd87c8wqTKYCM1
	 WSB5wKNxXlt69ifJy/h11UM2rffa/1o54K/tv2lZs8nOVJS46nBEcUa07tKgHb4HhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=ktVO4yiz;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42397606A334
	for <ntfs3@lists.linux.dev>; Wed, 28 Oct 2026 07:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42397606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=ktVO4yiz
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id F05451D15;
	Wed, 28 Oct 2026 07:40:26 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=ktVO4yiz;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6A42BD9;
	Wed, 28 Oct 2026 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1793173179;
	bh=LNhIlErN1oXjXd9knzYqaC/KZ8Z+RHfqJ18LX9MgCBE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ktVO4yizer30PaxUPzTX5pKZ7vD9xpDiNgB32XW//4BsGwz9YsfvqBueMw8W70Ui3
	 /f1AQO6iyxKq8TqLqpzbZYnY2xjyDE7Y+Ms3Jo3JZgDmvvo0AGJOH7ap7uST9Dv6oB
	 sCDk0VAub8T/uGqiBoeJ8CKNSMEBfkf5iGf0ShAk=
Received: from [192.168.95.128] (172.30.20.183) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 28 Oct 2026 10:39:38 +0300
Message-ID: <a486f930-0107-4e28-a077-f70b734568ae@paragon-software.com>
Date: Wed, 28 Oct 2026 08:39:36 +0100
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix mapping pairs bounds check for alignment
To: Hongling Zeng <zenghongling@kylinos.cn>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhongling0719@126.com>, <stable@vger.kernel.org>
References: <20260805064559.53060-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260805064559.53060-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/5/26 08:45, Hongling Zeng wrote:

> In the UpdateMappingPairs action, the expansion check compares the
> unaligned new attribute size with the available record space. The new
> size is aligned to an 8-byte boundary before the mapping pairs are
> updated, so the check can underestimate the required space by up to
> seven bytes.
>
> Use the aligned size in the expansion check to ensure that the
> subsequent update cannot exceed the available record space.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs3/fslog.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index cc24c23e4db9..3440212ecb12 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3388,7 +3388,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>   
>   		if (!check_if_attr(rec, lrh) || !attr->non_res ||
>   		    aoff < le16_to_cpu(attr->nres.run_off) || aoff > asize ||
> -		    (nsize > asize && nsize - asize > record_size - used)) {
> +		    (nsize > asize &&
> +		     ALIGN(nsize, 8) - asize > record_size - used)) {
>   			goto dirty_vol;
>   		}
>   

Hello,

Your patch is applied, thanks.

Regards,
Konstantin

