Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ED43EC820
	for <ntfs3@lists.linux.dev>; Mon, 14 Sep 2026 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371403; cv=none; b=BbraEWwFsrSkBiiWZECJ7x7khHPh00KgHyBbXMx0DSAyyrKaapY52bKLbSb/HdmzMtzO1S3D6tZ+0KvNbaSggUarMcGXqYr1BbiQmhQe0R7Eob4gDf7XlMJ11kqh6B0bYEVQ4fe68vrP6N1VGhcn3uGdP2E4Ps1V80luxk7kipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371403; c=relaxed/simple;
	bh=Kbh95j0aVQ144v/9ucCbKEQFFjpUP9M3C8pnH7RTJtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SpZHA9dtQpG8Vxq9wWNbe+eEVV27xM+iQKMdPj2/wU5vSfgz6yLCK9x52AQsX2RIcg8oq4KEss46bk+TSKoSPgfTbIN1f1vjYgErfsSGr4Ke0dREucX531rrgjiR24sK3XCBZbgzmuVuJjMvHM57tN4XeIOGZ8cE8uQGdmCcVeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=rxthllFK; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="rxthllFK"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 8482F1D26;
	Mon, 14 Sep 2026 07:37:35 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=rxthllFK;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 5664F219A;
	Mon, 14 Sep 2026 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789371399;
	bh=XxymRm+Sk4W+BeR7rQ12MWhgWPB7qjfSSPlb45IJhzc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rxthllFKMW7JVGUlyLzLRF7Yz6Q+umnvXmIqLMkXQdTfxexXXx7VRQMZWaFkIPyGy
	 cruVwTb6T0BfO4HVTIP5N0pQEYmDYwacoxAZgn+w3qpH6Lu81RPzG88oj9yogE+jgH
	 dEYdNHvxPc3v6izbALGX99pv1YKdROxx7npak8cw=
Received: from [192.168.95.128] (172.30.20.160) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 14 Sep 2026 10:36:38 +0300
Message-ID: <b4a2efef-922c-470d-aa52-94d22366e101@paragon-software.com>
Date: Mon, 14 Sep 2026 09:36:37 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ntfs3] fs/ntfs3: zero frame pages on read error
To: Weiming Shi <bestswngs@gmail.com>, <ntfs3@lists.linux.dev>
CC: Xiang Mei <xmei5@asu.edu>
References: <20260625085258.1579874-1-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260625085258.1579874-1-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/25/26 10:52, Weiming Shi wrote:

> ni_read_frame() marks every frame page uptodate at the 'out:' label
> regardless of the return value. The pages come from ntfs_lock_new_page()
> and are not zeroed, and several error paths reach 'out:' before anything
> is written to them (e.g. a failed decompress_lznt()/decompress_lzx_xpress()
> on a corrupted chunk, or an allocation failure).
>
> A page marked uptodate is served directly from the page cache, so a later
> read() of the file returns the uninitialized page contents to userspace.
> On a crafted compressed image this leaks kernel memory, including pointers.
>
> Zero each page on the error path before marking it uptodate. The success
> path is unchanged.
>
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/frecord.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 2b49bc077558..ca3b46a2c9c5 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2469,6 +2469,8 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
>   out:
>   	for (i = 0; i < pages_per_frame; i++) {
>   		pg = pages[i];
> +		if (err)
> +			clear_highpage(pg);
>   		SetPageUptodate(pg);
>   	}
>   

Hello,

Sorry for the delay.
The patch is applied, thank you.

Regards,
Konstantin

