Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34537193
	for <ntfs3@lists.linux.dev>; Mon,  8 May 2023 12:57:36 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3628421BF;
	Mon,  8 May 2023 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683550367;
	bh=HHZWgsJXNB3VUOHK0ASN7bDv1iCE+fapn/CG3Czr8FY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ln8Lw87Wu+H25bPgi6/TAjlCnEvEUBwtojZya3bMwCKeWy5lWTOzBd5CfgTcR3HuF
	 HiUYoeWReU01GycLoVDB+DTMlyC615fOSvFv7fc716FihfJkDIvm588j6ui4ZsO4y8
	 0KzDnh2cASqF3u/U4Q9vpQ2tPbjdWpVV9utpqagA=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id DB03E2D0;
	Mon,  8 May 2023 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683550653;
	bh=HHZWgsJXNB3VUOHK0ASN7bDv1iCE+fapn/CG3Czr8FY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XxG3I3Tmhd+iDwWbqhLDhg1YOB+p8qrMDH2YKWi06NfdOTiuwIXwwgmuDwqvL/Tx+
	 BUlL4iiDQWAAfXXIPgKAJyU+Fib6OBeX3qWAfwty5Q5AzX8u+1Pj1f9eg8y0IJJ3li
	 ghQZAwcsbU/H2ogDqScEAeXIWVRZfcEanmIF80KE=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 8 May 2023 15:57:33 +0300
Message-ID: <16b5bd2f-8098-0447-d3c9-0e764cf78d01@paragon-software.com>
Date: Mon, 8 May 2023 16:57:32 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] fs: ntfs3: Fix possible null-pointer dereferences in
 mi_read()
Content-Language: en-US
To: Jia-Ju Bai <baijiaju@buaa.edu.cn>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20230321132211.3103922-1-baijiaju@buaa.edu.cn>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20230321132211.3103922-1-baijiaju@buaa.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 21.03.2023 17:22, Jia-Ju Bai wrote:
> In a previous commit 2681631c2973 ("fs/ntfs3: Add null pointer check to
> attr_load_runs_vcn"), ni can be NULL in attr_load_runs_vcn(), and thus it
> should be checked before being used.
>
> However, in the call stack of this commit, mft_ni in mi_read() is
> aliased with ni in attr_load_runs_vcn(), and it is also used in
> mi_read() at two places:
>
> mi_read()
>    rw_lock = &mft_ni->file.run_lock -> No check
>    attr_load_runs_vcn(mft_ni, ...)
>      ni (namely mft_ni) is checked in the previous commit
>    attr_load_runs_vcn(..., &mft_ni->file.run) -> No check
>
> Thus, to avoid possible null-pointer dereferences, the related checks
> should be added.
>
> These bugs are reported by a static analysis tool implemented by myself,
> and they are found by extending a known bug fixed in the previous commit.
> Thus, they could be theoretical bugs.
>
> Signed-off-by: Jia-Ju Bai <baijiaju@buaa.edu.cn>
> ---
>   fs/ntfs3/record.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
> index defce6a5c8e1..dfa1fed9c0d9 100644
> --- a/fs/ntfs3/record.c
> +++ b/fs/ntfs3/record.c
> @@ -124,7 +124,7 @@ int mi_read(struct mft_inode *mi, bool is_mft)
>   	struct rw_semaphore *rw_lock = NULL;
>   
>   	if (is_mounted(sbi)) {
> -		if (!is_mft) {
> +		if (!is_mft && mft_ni) {
>   			rw_lock = &mft_ni->file.run_lock;
>   			down_read(rw_lock);
>   		}
> @@ -148,7 +148,7 @@ int mi_read(struct mft_inode *mi, bool is_mft)
>   		ni_lock(mft_ni);
>   		down_write(rw_lock);
>   	}
> -	err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, &mft_ni->file.run,
> +	err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, run,
>   				 vbo >> sbi->cluster_bits);
>   	if (rw_lock) {
>   		up_write(rw_lock);
Thanks, your patch has been applied.
