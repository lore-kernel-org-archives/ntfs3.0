Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386842;
	b=OS775coCs3vntxh5dzoDTi9m7MXl+BcnqV3yxyPUja5IeAew58dSIsEy0XL6hDnNvOuz
	 yG9Hj5Lxvy9k3h3CsWwJOJSH+p0JyNR5WSzTXCT4XQEwHEV0YjN7Gov8qp0wdEdxp6Owq
	 jyYVdCD+RzIM9br9h313rjTO9hVwbe26NaVq3Rj4l5lyYkPN5b+Q6sbR7N6sZLJoKR1+K
	 juC/Mq5G2swywmS0qo3BXdIl5KSBMB4R6i51wbywyIVGKWppVm9Jb/ALQRJ+7HMso0uZn
	 XXpakXscSkEQCttHTorAXK8q00D4013bssw0VnwneJoSYcGh5f7VzRIuMyqsxoAOfug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386842;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=AfMfIoBJN/WZwq0qQMcLlB6qFklRf9NEkBBNQCgCxME=;
	b=4TJOH3Vs7bqiHyficOYsEjC+vrjjtZq/2n683+CRUVCWuUuoNdUeh5z3g2UZpfDTNHed
	 BOp99qRcfsJ0nbmUpfSrvZ+zH3mpT4dwjBBtDpEWeE7NlvZhaHWskHN+QzizrAw/0t/lk
	 arQ5+lP9/jGMSgz1AiR0XPSAR9fJtwj9x8NrWbhP9bL2odosxNidzBJXu/OP2HY7fNVqM
	 fxfmYhuJ6rpqd9bfZ9IGrbc6ONLmzncY+keoRik4TFsthaxYh6ZpCg1x4jdK+EJICitA6
	 h6/pvIxtfttHaQ/9XNblvLdDLn2yRafFC5gRwnVcyLTEPEs4U+prg+ft9+515lw8L5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=GpQgJooP;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D69E606A321
	for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 08:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D69E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=GpQgJooP
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0B9111D28;
	Wed, 11 Nov 2026 08:48:04 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=GpQgJooP;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3A1B52389;
	Wed, 11 Nov 2026 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1794386839;
	bh=AfMfIoBJN/WZwq0qQMcLlB6qFklRf9NEkBBNQCgCxME=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GpQgJooPSh81/I5zM9kgRMn+5P7rl4bIWsubgmOAFLbh35UF4pkmYqPiK0/LDmLoB
	 yCssNO1ZiQlEtZ12jbxr+vXywBMUFb+NRtSBc9s73dEetemzBZG0110BJ9GxAQC6Lw
	 b7CjB28joPumy8Ws7mYXJlsu1hVFuwZ/AFFYu7FM=
Received: from [192.168.95.128] (172.30.20.190) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Nov 2026 11:47:17 +0300
Message-ID: <afbabf2e-0354-4165-ace8-4a7c0b65001d@paragon-software.com>
Date: Wed, 11 Nov 2026 09:47:16 +0100
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
Subject: Re: [PATCH] fs/ntfs3: prevent attribute-list pointer underflow
To: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<AutonomousCodeSecurity@microsoft.com>, <tgopinath@linux.microsoft.com>,
	<kys@microsoft.com>, "Xiang Mei (Microsoft)" <xmei5@asu.edu>
References: <20260816173713.28998-1-blbllhy@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260816173713.28998-1-blbllhy@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

> attr_set_size_ex() and attr_collapse_range() use the on-disk size of a
> removed ATTR_LIST_ENTRY to step a pointer backward. A crafted entry whose
> size exceeds its offset from the attribute-list buffer start underflows the
> pointer, and the next entry dereference reads outside the allocation.
>
> BUG: KASAN: slab-out-of-bounds in attr_set_size_ex
>    attr_set_size_ex fs/ntfs3/attrib.c:847
>    ntfs_file_release fs/ntfs3/file.c:1427
>    __fput fs/file_table.c:512
>    __x64_sys_close fs/open.c:1496
>
> Before each backward step, reject an entry whose on-disk size exceeds its
> offset from the attribute-list buffer start. This prevents pointer
> underflow in both the shrink and collapse-range paths while preserving
> their existing fail-stop error handling.
>
> Commit be71b5cba2e6 ("fs/ntfs3: Add attrib operations") introduced the
> vulnerable implementation. Commit 12dad495eaab ("fs/ntfs3: Add Kconfig,
> Makefile and doc") added the local build files. Commit 6e5be40d32fb
> ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile") wired them into
> the top-level build, making NTFS3 triggerable in standard kernels.
>
> Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")
> Reported-by: AutonomousCodeSecurity@microsoft.com
> Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> Reported-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
> Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
> ---
>   fs/ntfs3/attrib.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index c621a4c582f9..562bfcf3561f 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -779,12 +779,15 @@ int attr_set_size_ex(struct ntfs_inode *ni, enum ATTR_TYPE type,
>                          u16 le_sz = le16_to_cpu(le->size);
>
>                          /*
> -                        * NOTE: List entries for one attribute are always
> -                        * the same size. We deal with last entry (vcn==0)
> -                        * and it is not first in entries array
> -                        * (list entry for std attribute always first).
> -                        * So it is safe to step back.
> +                        * List entries for one attribute are expected to have
> +                        * the same size. Validate the on-disk size before using
> +                        * it to step back.
>                           */
> +                       if (le_sz > PtrOffset(ni->attr_list.le, le)) {
> +                               err = -EINVAL;
> +                               goto bad_inode;
> +                       }
> +
>                          mi_remove_attr(NULL, mi, attr);
>
>                          if (!al_remove_le(ni, le)) {
> @@ -2216,6 +2219,12 @@ int attr_collapse_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
>                                  }
>                                  continue;
>                          }
> +
> +                       if (le_sz > PtrOffset(ni->attr_list.le, le)) {
> +                               err = -EINVAL;
> +                               goto out;
> +                       }
> +
>                          le = (struct ATTR_LIST_ENTRY *)((u8 *)le - le_sz);
>                  }
>
> --
> 2.52.0

Hello,

Sorry for the delay.
The patch was applied, thank you.

Regards,
Konstantin

