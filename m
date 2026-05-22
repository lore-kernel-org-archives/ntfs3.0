Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2111405C2B
	for <ntfs3@lists.linux.dev>; Fri, 22 May 2026 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457780; cv=none; b=HB1fAsQM5v7ibSrG2CAj/lqeWLrlEyUONWAIWX0pm1yTVL0TuwhlAOTN3scvAb03F3jwHs4X5RSfouTXdmt2BhgBQ3FolBcebN5QYyAkaRGer9+ilutfg2FEthN7/d6+ab6/nnl4S1UQb5B6tvRE3M5L4aSlBD1L9kSxxgMUjxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457780; c=relaxed/simple;
	bh=tiMZbQzWy9qxlk03UTxPZC4GFta1NK0dffPDsdG0uUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V50+yXH3Zi9khh9NRWhgsg0aOV61F8RjaFsivybH9VG/kQpWu31nYHjnNJARI2IODDlrdf0x9/N4WOtd6ChFl7HO+ApfXHVr8edNnc5/5MRx0Xmx/XX7/SYkIJ1MlduSbGqxiYmI9xm9SNuSaABUwtgpbuP20qoDdRY3AFgj7RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=N4dJUfVC; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="N4dJUfVC"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5B4AA1D3E;
	Fri, 22 May 2026 13:49:40 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=N4dJUfVC;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id CE6F72203;
	Fri, 22 May 2026 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779457776;
	bh=8WHb6Wr5Qqy96qLLxdH9U2bRaIQfSGLdnAkdvhaFsxY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N4dJUfVCeWDUwAkL2U4AuHDRPZ3EmXC81XzT1/iwmJg2a7E363Cp2dw2m2RpaybdE
	 nl0qvN8uGPYGs0URDtofAqSAYRGoF6YxlgrDXFVuVyHYd5u8VBxxSlhg3We9NwtB58
	 4n+0qEvZG1nPIq2kS9Ft/cop0Qz25W/gijs0CfvA=
Received: from [192.168.95.128] (172.30.20.156) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 22 May 2026 16:49:35 +0300
Message-ID: <48aecc55-eca1-4bcc-82cb-e24c7d03365f@paragon-software.com>
Date: Fri, 22 May 2026 15:49:34 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: preserve non-DOS attribute bits in
 system.dos_attrib
To: ZhengYuan Huang <gality369@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<baijiaju1990@gmail.com>, <r33s3n6@gmail.com>, <zzzccc427@gmail.com>
References: <20260427032418.2678198-1-gality369@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260427032418.2678198-1-gality369@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/27/26 05:24, ZhengYuan Huang wrote:

> [You don't often get email from gality369@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [BUG]
> A corrupted ntfs3 image can hit a NULL function pointer call in
> generic_perform_write() after toggling system.ntfs_attrib and then
> overwriting system.dos_attrib on the same file.
>
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> \#PF: supervisor instruction fetch in kernel mode
> \#PF: error_code(0x0010) - not-present page
> PGD bed5067 P4D bed5067 PUD 0
> Oops: Oops: 0010 [#1] SMP KASAN NOPTI
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> RSP: 0018:ffff88801025f988 EFLAGS: 00010246
> Call Trace:
>   generic_perform_write+0x409/0x8c0 mm/filemap.c:4255
>   __generic_file_write_iter+0x1bb/0x200 mm/filemap.c:4372
>   ntfs_file_write_iter+0xcd9/0x1c20 fs/ntfs3/file.c:1253
>   new_sync_write fs/read_write.c:593 [inline]
>   vfs_write+0x63b/0xf70 fs/read_write.c:686
>   ksys_write+0x133/0x250 fs/read_write.c:738
>   __do_sys_write fs/read_write.c:749 [inline]
>   __se_sys_write fs/read_write.c:746 [inline]
>   __x64_sys_write+0x77/0xc0 fs/read_write.c:746
>   ...
>
> [CAUSE]
> system.ntfs_attrib updates ATTR_DATA flags via ni_new_attr_flags()
> and switches i_mapping->a_ops to ntfs_aops_cmpr when
> FILE_ATTRIBUTE_COMPRESSED is set. system.dos_attrib then overwrites
> ni->std_fa from a one-byte DOS attribute value, clearing the compression
> bit without updating ATTR_DATA or the mapping operations.
>
> Old buffered writes use is_compressed(ni) to choose
> __generic_file_write_iter(). That leaves generic_perform_write() calling
> a NULL write_begin callback from ntfs_aops_cmpr.
>
> [FIX]
> Treat system.dos_attrib as a low-byte DOS attribute update and preserve the
> existing non-DOS attribute bits in ni->std_fa. This keeps compressed and
> sparse state consistent with ATTR_DATA and the mapping operations while
> keeping the existing DOS attribute semantics intact.
>
> Signed-off-by: ZhengYuan Huang <gality369@gmail.com>
> ---
>   fs/ntfs3/xattr.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9eeac0a..7e51182 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -867,7 +867,9 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>          if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
>                  if (sizeof(u8) != size)
>                          goto out;
> -               new_fa = cpu_to_le32(*(u8 *)value);
> +               /* system.dos_attrib only covers the low DOS attribute byte. */
> +               new_fa = (ni->std_fa & ~cpu_to_le32(0xff)) |
> +                        cpu_to_le32(*(u8 *)value);
>                  goto set_new_fa;
>          }
>
> --
> 2.43.0
>
Hello,

Sorry for the delay.
Queued for the next merge window, thank you.

Regards,
Konstantin

