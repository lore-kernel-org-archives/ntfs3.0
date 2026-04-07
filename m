Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2142833262F
	for <ntfs3@lists.linux.dev>; Tue,  7 Apr 2026 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582350; cv=none; b=qeVnbCUra1dtuOfphJikP7yWnYfdaYaMDHC2NGKjwUPfozsERffcJmmQQzCh5938t2uGjbmBpPxLoS8IqazjhWte5xayuorafWrxCE0S2WIF72IeTD7e3joTKhF+DJO57Nhdd1TH8CPFnYINY4ZotSadOe6ht8EvnQRocKTotx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582350; c=relaxed/simple;
	bh=iSoREZrSSvf7t9quK9w8zb39H1h9wiBd2snHsk65AME=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h1qaXO2W3vUm7yrlMPTVK8PEgGbxou6iJ1UwNFSR0mvObIoj0y2Qu44TEjYi4LZ/QbrQnK8LaHa/NF5iWhgmeILO6OnZR0BrsyG9D5isG2H8Y3Ntwhb28CPL0blu8GwziXOxS6vNevw4LXl8Lc2UZetnfGrVpQnuBFw9lQfktns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=KQBxhJpI; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="KQBxhJpI"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C196C1D43;
	Tue,  7 Apr 2026 17:19:19 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=KQBxhJpI;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 54097213F;
	Tue,  7 Apr 2026 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1775582347;
	bh=HL4TGNU7zTDVSKdhBdsK93zpQCOMvlmQROGAX70A3Es=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KQBxhJpIa9OsbEXAdeLdGa6oCv8Q0G0tU0lUceS9z11HZJH3nL72NY/EZJUR7y8Kd
	 PnvbFDkJf4/l7PFWLtvrfGEF3MOn0mLwkMUm9+62tU4Rqrw6/DaoKKKwbXXexbBVjT
	 y0ROKjPtRDA2Ha0FwKZbNjYP9Pg8uQyNKqOq5OP0=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Apr 2026 20:19:06 +0300
Message-ID: <f888b1b3-9bf7-4174-beef-3f954bafa175@paragon-software.com>
Date: Tue, 7 Apr 2026 19:19:04 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ntfs3: fix OOB read and integer overflow in
 run_unpack()
To: tobgaertner <tob.gaertner@me.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, <security@kernel.org>
References: <20260329111704.411449-1-tob.gaertner@me.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260329111704.411449-1-tob.gaertner@me.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/29/26 13:17, tobgaertner wrote:

> [You don't often get email from tob.gaertner@me.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Tobias Gaertner <tob.gaertner@me.com>
>
> Two bugs in run_unpack() found by fuzzing with a source-patched harness
> (LibAFL + QEMU ARM64 system-mode):
>
> Patch 1: run_unpack() checks `run_buf < run_last` at the loop top but
> then reads size_size and offset_size bytes via run_unpack_s64() without
> verifying they fit in the remaining buffer.  A crafted NTFS image with
> truncated run data triggers a heap OOB read of up to 15 bytes on mount.
>
> Patch 2: The volume boundary check `lcn + len > sbi->used.bitmap.nbits`
> uses raw addition that can wrap for large values, bypassing the
> validation.  CVE-2025-40068 added check_add_overflow() for adjacent
> arithmetic but missed this instance.
>
> Both bugs are present since NTFS3 was merged in 5.15.
>
> Could CVE IDs be assigned for these two issues?
>
> tobgaertner (2):
>    ntfs3: add buffer boundary checks to run_unpack()
>    ntfs3: fix integer overflow in run_unpack() volume boundary check
>
>   fs/ntfs3/run.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>
Hello,

Patches are queued for the next merge window, thanks.

Regards,
Konstantin

