Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2383321AB
	for <ntfs3@lists.linux.dev>; Tue,  9 Dec 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287726; cv=none; b=LuMvKvH6La0FaVmoZnZMBKnO/pqbFUUEN34SpVhRve9r9OizHMbewoXA0j7U4eJL9NFAKMqSeeJbI1MeYXTFLMrzYqCOWbbEsl+Z8GcXZG8g3pJgZO7ZHfeqMk00GfPNNfd7ADqCW3b+ca+lurf5ezNFfI00k4ELAor2C3YDh8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287726; c=relaxed/simple;
	bh=rPo6nNg4rEQ0QX1AsxMqq6HeIPC8ED+0gzuBryrI54I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=filY+ZklDgqiPKTuJXuvZwFQP/GV7UrJOFQEJw3BUGM4r2rLFlzi65uKEPuH13iwHWrAJIve2MxCtXSdTmhAS4nN0buDF9B1sMshAtVQeP3JBbgCEa9mLPBeRyHgTZ78uBiC59KWMZiXds1bq7rKNPVzz9QyMZuRdRBQbr9Ht5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Ae+CXjks; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Ae+CXjks"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3EC8F1D42;
	Tue,  9 Dec 2025 13:38:30 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Ae+CXjks;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 2EFCF2416;
	Tue,  9 Dec 2025 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1765287723;
	bh=ZJYD3vPf6mnO2wevAHidluh43RvyIo/vkPbf9qfDBQ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ae+CXjks5xDg8Yf9Y9cL5BnFRho5B04ULDf9Fb/57QAD25TmwxTjDH/FTeKSV/24z
	 Hkdd2Nm0Mv7bRA8CDFST1pLhkBbWywmdHLXKyYjgWzPaMxc7Mefm9UhQk0Vtrsgz2i
	 E89o9o1AcfgpQWU65oAtdsB787AvXPElGzG5tHuE=
Received: from [192.168.95.128] (172.30.20.141) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 9 Dec 2025 16:42:01 +0300
Message-ID: <b66104c4-e256-4ed0-88dd-476415c5f0a1@paragon-software.com>
Date: Tue, 9 Dec 2025 14:42:00 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: ntfs3: fix infinite loop in attr_load_runs_range on
 inconsistent metadata
To: Jaehun Gou <p22gone@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Seunghun Han
	<kkamagui@gmail.com>, Jihoon Kwon <kjh010315@gmail.com>
References: <20251202110109.1885939-1-p22gone@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251202110109.1885939-1-p22gone@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 12/2/25 12:01, Jaehun Gou wrote:

> We found an infinite loop bug in the ntfs3 file system that can lead to a
> Denial-of-Service (DoS) condition.
>
> A malformed NTFS image can cause an infinite loop when an attribute header
> indicates an empty run list, while directory entries reference it as
> containing actual data. In NTFS, setting evcn=-1 with svcn=0 is a valid way
> to represent an empty run list, and run_unpack() correctly handles this by
> checking if evcn + 1 equals svcn and returning early without parsing any run
> data. However, this creates a problem when there is metadata inconsistency,
> where the attribute header claims to be empty (evcn=-1) but the caller
> expects to read actual data. When run_unpack() immediately returns success
> upon seeing this condition, it leaves the runs_tree uninitialized with
> run->runs as a NULL. The calling function attr_load_runs_range() assumes
> that a successful return means that the runs were loaded and sets clen to 0,
> expecting the next run_lookup_entry() call to succeed. Because runs_tree
> remains uninitialized, run_lookup_entry() continues to fail, and the loop
> increments vcn by zero (vcn += 0), leading to an infinite loop.
>
> This patch adds a retry counter to detect when run_lookup_entry() fails
> consecutively after attr_load_runs_vcn(). If the run is still not found on
> the second attempt, it indicates corrupted metadata and returns -EINVAL,
> preventing the Denial-of-Service (DoS) vulnerability.
>
> Co-developed-by: Seunghun Han <kkamagui@gmail.com>
> Signed-off-by: Seunghun Han <kkamagui@gmail.com>
> Co-developed-by: Jihoon Kwon <kjh010315@gmail.com>
> Signed-off-by: Jihoon Kwon <kjh010315@gmail.com>
> Signed-off-by: Jaehun Gou <p22gone@gmail.com>
> ---
>   fs/ntfs3/attrib.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index eced9013a881..f0ff85b7d76d 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1354,19 +1354,28 @@ int attr_load_runs_range(struct ntfs_inode *ni, enum ATTR_TYPE type,
>   	CLST vcn;
>   	CLST vcn_last = (to - 1) >> cluster_bits;
>   	CLST lcn, clen;
> -	int err;
> +	int err = 0;
> +	int retry = 0;
>   
>   	for (vcn = from >> cluster_bits; vcn <= vcn_last; vcn += clen) {
>   		if (!run_lookup_entry(run, vcn, &lcn, &clen, NULL)) {
> +			if (retry != 0) { /* Next run_lookup_entry(vcn) also failed. */
> +				err = -EINVAL;
> +				break;
> +			}
>   			err = attr_load_runs_vcn(ni, type, name, name_len, run,
>   						 vcn);
>   			if (err)
> -				return err;
> +				break;
> +
>   			clen = 0; /* Next run_lookup_entry(vcn) must be success. */
> +			retry++;
>   		}
> +		else
> +			retry = 0;
>   	}
>   
> -	return 0;
> +	return err;
>   }
>   
>   #ifdef CONFIG_NTFS3_LZX_XPRESS

Applied, will be sent in the next pull request.

Regards,
Konstantin

