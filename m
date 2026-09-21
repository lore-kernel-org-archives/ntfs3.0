Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6F8483BC3
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988035; cv=none; b=BtF8uWCBs3JzDojeAdYAQG4CCEOpE20ChU5lNNCvJue47VAP/Ry8TGsOH1ip/fRHNyoeSaIgEt+hiSnjeCPCytjxlWh4FZI0hW+2XjaW58T7dGhnWxo/8/ojrP0tq920kZEe5mmNS1oGN701gUstA6tWdXici0Qcbdtd9mHtrxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988035; c=relaxed/simple;
	bh=n6q145E0iuZKGuubHLhBBe/iefq7+kpIO6nP1x/J9VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IacoGmMoclz7LSlUMWPlBE+9aGxKYdsSviyBBrdPSB3MnVZo+Ieb1uyDANZ4kpzIonQi3sEdOJxIxswUWftR11yqGoiuMMG93iIxHYRjaPxmDBiDLG5boFC0EVgsZFf9I3J621HCPrr8+PlSZKDorjgDhwRBEynHBEbJXBiQhq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=IP8SRrW0; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="IP8SRrW0"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9366D1D09;
	Mon, 21 Sep 2026 10:54:41 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=IP8SRrW0;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id BCC852135;
	Mon, 21 Sep 2026 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789988026;
	bh=1RDSDTdNsqbk8n4z1CYDEC+fDzXuKUymmd9KJ760G6I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IP8SRrW0sbOsr9ttZ83zNu6CL+F5ISwq3Ja0WhAb0njYSggMAf3K6CzolO80YSGHE
	 7WJn/+urF1D4aeyuYlvGsCRjGLWecEElY+ZxGb1PuN4ifDb4piUI45iEJJZD1gmSze
	 0rR7W/ReoXWcRuAekfOAy1Gqwink/msD8zL28VyE=
Received: from [192.168.95.128] (172.30.20.147) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 21 Sep 2026 13:53:45 +0300
Message-ID: <10202d17-fd49-43f8-a530-6292ee5fe7b8@paragon-software.com>
Date: Mon, 21 Sep 2026 12:53:43 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix valid_size not being updated in
 attr_allocate_frame()
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>
References: <20260701061451.385659-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260701061451.385659-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/1/26 08:14, Zhan Xusheng wrote:

> At the end of attr_allocate_frame() the on-disk valid_size is meant to be
> updated to the value passed in via @new_valid:
>
>          valid_size = le64_to_cpu(attr_b->nres.valid_size);
>          if (new_valid != valid_size) {
>                  attr_b->nres.valid_size = cpu_to_le64(valid_size);
>                  mi_b->dirty = true;
>          }
>
> but it writes back the old valid_size that was just read instead of
> new_valid, so the field is never actually changed even though the record
> is marked dirty -- the intended update is a no-op.
>
> In practice ni_update_parent(), called from ni_write_inode(), re-derives
> nres.valid_size from ni->i_valid on inode write-back, which normally masks
> this, so the visible impact is limited.  The assignment here is still
> wrong though; store @new_valid as intended.
>
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>   fs/ntfs3/attrib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index c621a4c582f9..d6801482feb2 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1977,7 +1977,7 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
>   
>   		valid_size = le64_to_cpu(attr_b->nres.valid_size);
>   		if (new_valid != valid_size) {
> -			attr_b->nres.valid_size = cpu_to_le64(valid_size);
> +			attr_b->nres.valid_size = cpu_to_le64(new_valid);
>   			mi_b->dirty = true;
>   		}
>   	}

Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

