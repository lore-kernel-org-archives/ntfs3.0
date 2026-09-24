Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3EC4A1E00
	for <ntfs3@lists.linux.dev>; Thu, 24 Sep 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264156; cv=none; b=MzkAmqfiEsArAyuZXHqLJM+jgvFAA43B3ErQzTNl5fn0YL7y6TEYwr5ZnbM7pCZZYDwzBOkuh8uuUNcI29vY7uOn3OuU1MauVztts3bDpWcKBpYHGEJHrnpmTXmN7IBC2N16Gn3Wt0ZOCRgUM5U8/508IPbHf0T3R4SRlIHwYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264156; c=relaxed/simple;
	bh=cmIetmbN8vQUyssS1uWTX+84U3HXuV8PEmJZ/GW1fAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c2Tr1Pd3KogT8VOc0tDqPkjZ/aniCwm98K+Q7KXtk2l1ewRSj+zirtAOWZ1o2VqYuQnfwgdJ6CFqS8kzaTwnzDc7T7frFhW6S1id1ce13TJCu5DlMthVDyXCHb/ni3T5D7UW/xfEZng6w2rZMxDa+39FYiGBkibAGY5C6FaZEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=fwEl9esU; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="fwEl9esU"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 39C6C1D78;
	Thu, 24 Sep 2026 15:36:47 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=fwEl9esU;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 106971D70;
	Thu, 24 Sep 2026 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1790264153;
	bh=IPR6Hc7UqWCCEIoOfqPbgJRHAJ4iq6EhBhn0pzNUKRI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fwEl9esU9DF85pEME3VY82TAdo3tQApisXQC7ToJ1u3hMwN74VP+odnxOjPVIvBxJ
	 w5mLf8GD9xba5kQtZyHAJupCON2hK0JCDCLGUeR8Ta6pQcrZadNFOh3G0zxQ/TmcNd
	 LEMcLOv1GqQinyBuo/odP5GRIc3ynMH5iOoLlNE4=
Received: from [192.168.95.128] (172.30.20.214) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 24 Sep 2026 18:35:52 +0300
Message-ID: <d676f554-5352-4a2e-897f-971cedf6cf67@paragon-software.com>
Date: Thu, 24 Sep 2026 17:35:50 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix resident attribute handling in run load paths
To: Yi Xie <xieyi@kylinos.cn>, <linkinjeon@kernel.org>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260707021444.57163-1-xieyi@kylinos.cn>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260707021444.57163-1-xieyi@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/7/26 04:14, Yi Xie wrote:

> [You don't often get email from xieyi@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Don't dereference nres unless attr->non_res is set.  ni_find_attr() can
> succeed with a resident record on a corrupted image, and run_unpack_ex()
> would mis-parse it as mapping pairs.
>
> Fix attr_load_runs(), attr_load_runs_vcn() and attr_set_size().
>
> Fixes: 5ec75546dc71 ("ntfs: fix WARN_ON for resident attribute in ntfs_map_runlist_nolock()")
> Signed-off-by: Yi Xie <xieyi@kylinos.cn>
> ---
>   fs/ntfs3/attrib.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index c621a4c582f9..248a6d68eac3 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -61,11 +61,16 @@ static int attr_load_runs(struct ATTRIB *attr, struct ntfs_inode *ni,
>                            struct runs_tree *run, const CLST *vcn)
>   {
>          int err;
> -       CLST svcn = le64_to_cpu(attr->nres.svcn);
> -       CLST evcn = le64_to_cpu(attr->nres.evcn);
> +       CLST svcn, evcn;
>          u32 asize;
>          u16 run_off;
>
> +       if (!attr->non_res)
> +               return -EIO;
> +
> +       svcn = le64_to_cpu(attr->nres.svcn);
> +       evcn = le64_to_cpu(attr->nres.evcn);
> +
>          if (svcn >= evcn + 1 || run_is_mapped_full(run, svcn, evcn))
>                  return 0;
>
> @@ -555,6 +560,10 @@ int attr_set_size_ex(struct ntfs_inode *ni, enum ATTR_TYPE type,
>                  }
>
>   next_le_1:
> +               if (!attr->non_res) {
> +                       err = -EIO;
> +                       goto out;
> +               }
>                  svcn = le64_to_cpu(attr->nres.svcn);
>                  evcn = le64_to_cpu(attr->nres.evcn);
>          }
> @@ -1444,6 +1453,9 @@ int attr_load_runs_vcn(struct ntfs_inode *ni, enum ATTR_TYPE type,
>                  return -ENOENT;
>          }
>
> +       if (!attr->non_res)
> +               return -EIO;
> +
>          svcn = le64_to_cpu(attr->nres.svcn);
>          evcn = le64_to_cpu(attr->nres.evcn);
>
> --
> 2.34.1

Hello,

Sorry for the delay.
Your patch was applied, thanks.

Regards,
Konstantin

