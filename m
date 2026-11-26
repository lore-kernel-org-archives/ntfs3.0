Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706177;
	b=cSQcsHZP9xwxV6IXE5igcJKIXDGaCtGfK2opgEx4YaoTRUUoClUUSXTBgFBc2MeST927
	 yAR0tcFsu5+rMKEAW0l74dVtZKRzunsW0VhVPJ4w2Z1Yk+9zKUl/5Xj7Dnbe+40hbIq88
	 ts7rL4Ug3qwqofZMwV0/u2g3b758QaBtu4eUv7HIYWJLmiFxaCY7wCMy4Bu5XdLKQICbt
	 FZA/GpXQpFH2W/YjgOx2lOYYCF6ZjhDUSqMX1UZKi/HXtC3cE7Wk6JfJKxoK5fwPGgpuD
	 K2jl410pvFCgFWeXEzNdc4IMQPQYnTjxte9tJf1USJtnrSMiv5PAvqm4yWGh6u2jQpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706177;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=8Hlh0el6b76DVPPCih0A1ziKHvFdtHwFJVd3gkLvbCo=;
	b=Q99bOh2/pkRUTi7TkWRBmbcLbGxmaxOy8FDlTMiI5d11RPKxFUbc7WnhDavmXU8yDEtw
	 UoNBO47GKg+xdB2MW001gUk63IFFYdSBgJOphfdKQCeZaz97m1/ivBNzhmFWebLjcX7J3
	 RDKYXPv1zNKOCvNsOYWxVEWCs7Jo9UYnHlPSBQ1Fv9ygdqGLL+dauWQP8aNth+WpHoOfc
	 bvGlc2SeyPVYAWiICUfM5kX+lZ91NeO7nkBMR1jotgcfE3aNu2ix5fGFlxLaXc/2i4jJU
	 5jdBvDAy4rZod7GS3Um26MIuVVHOxEfzH1w5S5uA7vOCwb0lx87GWPhHViWChUXmMNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=YCpgWGZ5;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BD7606A31C
	for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 15:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BD7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=YCpgWGZ5
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 596061D38;
	Thu, 26 Nov 2026 15:16:57 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=YCpgWGZ5;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 8A96A2092;
	Thu, 26 Nov 2026 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795706175;
	bh=8Hlh0el6b76DVPPCih0A1ziKHvFdtHwFJVd3gkLvbCo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YCpgWGZ59cjZCR5jN3dG615kSVLYt4xC1U8D2oQmHJ0LqG5Yos95y4uDuktFS3bDU
	 04MwcHiTkr2029Ytp1SlfVFU8VJANpNkz9D4r55EEkTTY+LewbafH9ufwhYqG9QT3k
	 +3Gg36b4xSi4fB9QZkBsS8xTcrOai0EoTI4u7JfE=
Received: from [192.168.95.128] (172.30.20.193) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 26 Nov 2026 18:16:14 +0300
Message-ID: <9aa9b7b5-63d3-4b18-8342-96a639c07fcd@paragon-software.com>
Date: Thu, 26 Nov 2026 16:16:13 +0100
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
Subject: Re: [PATCH] fs/ntfs3: bound asize by SIZEOF_NONRESIDENT in
 check_attr()
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhanxusheng@xiaomi.com>, <stable@vger.kernel.org>
References: <20260904065437.957677-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260904065437.957677-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/4/26 08:54, Zhan Xusheng wrote:

> check_attr() validates a file record attribute during log replay.  Its
> non-resident branch reads through attr->nres.valid_size, which ends
> SIZEOF_NONRESIDENT bytes into the attribute, but only checks that the
> attribute fits the record, not that it is long enough to hold those
> fields.  check_file_record() admits an attribute starting as late as
> record_size - SIZEOF_RESIDENT, so one placed there with non_res set reads
> up to 40 bytes past mi->mrec, a kmalloc(record_size) buffer.  The later
> "run_off >= asize" rejection is too late: data_size, svcn, evcn and
> valid_size have already been read.  Nothing earlier covers it, mi_read()
> checks only rec->total, and do_action() gets here for the ordinary
> record-modifying operations, so a crafted volume reaches it through
> normal replay.
>
> Reject an attribute that leaves fewer than SIZEOF_NONRESIDENT bytes in the
> record, as mi_enum_attr() already does outside the log path.  A real
> non-resident attribute cannot be smaller than its own header, so nothing
> that mounts today is rejected.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> Reproduced with ASAN in a userspace replica of the layout and of
> check_attr()'s bounds: an attribute at record_size - SIZEOF_RESIDENT
> gives "READ of size 8 ... located 24 bytes after 1024-byte region",
> and is rejected once the guard is added.
>
> I did not craft a volume, so there is no mount-level reproducer and no
> KASAN splat from a real replay; the reachability above comes from
> reading do_action(), mi_read() and ntfs_fix_post_read().
>
>   fs/ntfs3/fslog.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index ed50c1d0c23e..034d72929ac0 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2772,6 +2772,9 @@ static inline bool check_attr(const struct MFT_REC *rec,
>   		break;
>   
>   	case 1:
> +		if (asize < SIZEOF_NONRESIDENT)
> +			return false;
> +
>   		dsize = le64_to_cpu(attr->nres.data_size);
>   		svcn = le64_to_cpu(attr->nres.svcn);
>   		evcn = le64_to_cpu(attr->nres.evcn);
>
> base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3

Hello,

The patch is applied, thanks.

Regards,
Konstantin

