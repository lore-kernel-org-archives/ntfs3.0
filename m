Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31A3988E6
	for <ntfs3@lists.linux.dev>; Tue, 24 Mar 2026 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374963; cv=none; b=FIZ81X6LPu7aJeg8mwCL3yX0IPyQ69pwijLTI40bTgFViy/PzPwmmU6L3eFDZJvU4pDyqMz4a2Gxw8YDjYjH5OR8IIk+bqZgW0QxxhjdaqvF1/w3rZeV2ycqMf6nGp9/dUfPSk3/Y8lHTpI2GdRh2tVx9ILerYAoDGePij6/Rmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374963; c=relaxed/simple;
	bh=CzHdBbHYCL0pbD6i+89aEkRuNdukbEvIxHFbbMcQj5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KBNHIXRvNgjnPNhKy32RQ0hc3EvN5M05x6LSPuK+TMt/4Vxh3NxNnN/6QqPl6HEc0U5eWhdKW+awrzW3zqyRGAmf9ubdGqKnXxacoIJd0dFTXu6bmk8Lue6IWwlZ1hGRSmB2DM7M5iFSHzoDxqYRcBfSf7BHvey6mmCcw3V0cv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=YGOj6M8u; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="YGOj6M8u"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 19074241;
	Tue, 24 Mar 2026 17:56:14 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=YGOj6M8u;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 7301D1A2;
	Tue, 24 Mar 2026 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1774374946;
	bh=palnvndUrn8asNEGf84KjRAaOPpUvzpAzK3z1skji8Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YGOj6M8uE595kBlA5WEr7ffufd4WXdM9nugnLTqv/HYVNvxODv+azTnUzpsJuXDQF
	 5oCIVJ4xfOqjQfTHUmOke24qdfjCzhgbINTk3X6UmVLRJYWUCazIuDX2tGgGNw5T8s
	 KRCpbnu0gJBqKyUlPPA0vQQwYOshg0JaqPea32Lw=
Received: from [192.168.95.128] (172.30.20.215) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 24 Mar 2026 20:55:45 +0300
Message-ID: <bb8b3fed-141e-4aa3-86a9-3628e052d5a2@paragon-software.com>
Date: Tue, 24 Mar 2026 18:55:43 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix missing run load for vcn0 in
 attr_data_get_block_locked()
To: Deepanshu Kartikey <kartikey406@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+c1e9aedbd913fadad617@syzkaller.appspotmail.com>
References: <20260319074546.1085187-1-kartikey406@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260319074546.1085187-1-kartikey406@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/19/26 08:45, Deepanshu Kartikey wrote:

> When a compressed or sparse attribute has its clusters frame-aligned,
> vcn is rounded down to the frame start using cmask, which can result
> in vcn != vcn0. In this case, vcn and vcn0 may reside in different
> attribute segments.
>
> The code already handles the case where vcn is in a different segment
> by loading its runs before allocation. However, it fails to load runs
> for vcn0 when vcn0 resides in a different segment than vcn. This causes
> run_lookup_entry() to return SPARSE_LCN for vcn0 since its segment was
> never loaded into the in-memory run list, triggering the WARN_ON(1).
>
> Fix this by adding a missing check for vcn0 after the existing vcn
> segment check. If vcn0 falls outside the current segment range
> [svcn, evcn1), find and load the attribute segment containing vcn0
> before performing the run lookup.
>
> The following scenario triggers the bug:
>    attr_data_get_block_locked()
>      vcn = vcn0 & cmask        <- vcn != vcn0 after frame alignment
>      load runs for vcn segment <- vcn0 segment not loaded!
>      attr_allocate_clusters()  <- allocation succeeds
>      run_lookup_entry(vcn0)    <- vcn0 not in run -> SPARSE_LCN
>      WARN_ON(1)                <- bug fires here!
>
> Reported-by: syzbot+c1e9aedbd913fadad617@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c1e9aedbd913fadad617
> Fixes: c380b52f6c57 ("fs/ntfs3: Change new sparse cluster processing")
> Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
> ---
>   fs/ntfs3/attrib.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index 6cb9bc5d605c..6ef7db82a35d 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1152,6 +1152,21 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
>   			if (err)
>   				goto out;
>   		}
> +
> +		if (vcn0 < svcn || evcn1 <= vcn0) {
> +			struct ATTRIB *attr2;
> +
> +			attr2 = ni_find_attr(ni, attr_b, &le_b, ATTR_DATA, NULL,
> +					       0, &vcn0, &mi);
> +			if (!attr2) {
> +				err = -EINVAL;
> +				goto out;
> +			}
> +			err = attr_load_runs(attr2, ni, run, NULL);
> +			if (err)
> +				goto out;
> +		}
> +
>   		da = false; /* no delalloc for compressed file. */
>   	}
>   

Hello,

Queued for the next merge window, thank you.

Regards,
Konstantin

