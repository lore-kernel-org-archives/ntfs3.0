Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B073C8705
	for <ntfs3@lists.linux.dev>; Wed,  7 Oct 2026 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408784; cv=none; b=g63pY8TNZNcjq9dA8RtEVxMdexH7g89wqOIK9yere4wpz+kQO17a5TE+QrjQGysbs7Z+Ys/i5KMU5yHWJy5lDKWY2WPhrJEgeTX6gn+h0VQRhHSv1ROix38kmHhcv4+lvxdEQidOvbG3sAIwktAOXXTDR9ni6OaihyGWIHWXB5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408784; c=relaxed/simple;
	bh=A9upQQba7HSY2Y6Zb4Ne44SmThcvV04sqM5MqtAVuho=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g9yPVuqEmBuHqRjn3hv9Cno3gDNTOB4EoZqISQCqn2gXIgi+uQv1LahXxfiu/ztMSjDgTrWS8/Nr6t8IZWWQK3Z+eqkE31l35AZ4+PyQ7GZUxB5zlH+XB6SiSsi0xzEvhpw3PYo20E5SunEkq/FESyiINxzTA+CYfvYgo0JK5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=NP4oDwTY; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="NP4oDwTY"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 1F67F1D60;
	Wed,  7 Oct 2026 21:33:53 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=NP4oDwTY;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6D66121D8;
	Wed,  7 Oct 2026 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1791408781;
	bh=V64ZQRRVQBpg4QTEv7w2hCl33w5ItsVgNtCC9dZzwmI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NP4oDwTY1DKrbseJbH0uzIMouRiLq1zSmpaylH0+Hr7OA1VeYYEMhdxzMVhfOpT6O
	 XuW3GomjAIRR+bqIylRXcz5PjwrN5r/n4TBpqf7ZDVFAuAIIdb8VA3mDRx8T4d5HRK
	 7sWSaJifQbpBCiS4ucnNqDKUf/d8G/Lf3eS9UsLY=
Received: from [192.168.95.128] (172.30.20.178) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 8 Oct 2026 00:33:00 +0300
Message-ID: <068c6433-159d-41a1-8709-6742b1735ebd@paragon-software.com>
Date: Wed, 7 Oct 2026 23:32:59 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: remove redundant if-block in check_attr()
To: Matvey Kovalev <matvey.kovalev@ispras.ru>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
References: <20260719202534.2942-1-matvey.kovalev@ispras.ru>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260719202534.2942-1-matvey.kovalev@ispras.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/19/26 22:25, Matvey Kovalev wrote:

> Condition of this if-block repeats another one from if-block above. So,
> condition is always false.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Matvey Kovalev <matvey.kovalev@ispras.ru>
> ---
>   fs/ntfs3/fslog.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index f038c799e7ac..7c40eff69959 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2753,9 +2753,6 @@ static inline bool check_attr(const struct MFT_REC *rec,
>                          return false;
>                  }
>
> -               if (run_off > asize)
> -                       return false;
> -
>                  if (run_unpack(NULL, sbi, 0, svcn, evcn, svcn,
>                                 Add2Ptr(attr, run_off), asize - run_off) < 0) {
>                          return false;
> --
> 2.54.0

Hello,

The patch was applied, thanks.

Regards,
Konstantin

