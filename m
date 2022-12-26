Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90D20F3
	for <ntfs3@lists.linux.dev>; Mon, 26 Dec 2022 15:46:02 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 6FB751B7;
	Mon, 26 Dec 2022 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1672069351;
	bh=B2DaB7WWHJqDDPT074JtcIYqB7GPsr9A6JYSY3UQo6U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KisxStYY6RKSCjV14OMqd1AN9M4b3jpleHIjMtPr3h29CgBn3f0X2HXXGEJq8nWJt
	 if0GrKCYq5FkJrJBDunwO2IPuOTvpj8bXpNTZwisTbeqZXXwHqEwrq2rSIT/mb9MlZ
	 +OesJkgYwfq10M8OILeN+tGiPJBznsAaSRcmrNrw=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C87941D33;
	Mon, 26 Dec 2022 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1672069560;
	bh=B2DaB7WWHJqDDPT074JtcIYqB7GPsr9A6JYSY3UQo6U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=srLL5s6WA8Db3RMquWKLg6OnexE9pPc8SUk1CPAhDg/PW+n+sCZJWAf6qCHIeIHz5
	 Jbxon/PRMqq8hv0wxvajo3z8YvuMaCGvUDARgSXOyMhuC5VbcPOGWwP1zD3kG2Bm6B
	 m5UCY2cH9bUBn+vR5xHkRumXIgJR9FKSDHNFCyRE=
Received: from [192.168.211.153] (192.168.211.153) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 26 Dec 2022 18:46:00 +0300
Message-ID: <d7805125-cd44-3dba-8f79-95c989844191@paragon-software.com>
Date: Mon, 26 Dec 2022 19:45:59 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fs/ntfs3: Fix slab-out-of-bounds in ntfs_trim_fs()
Content-Language: en-US
To: Shigeru Yoshida <syoshida@redhat.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20221130145705.488351-1-syoshida@redhat.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20221130145705.488351-1-syoshida@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.153]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 30.11.2022 18:57, Shigeru Yoshida wrote:
> ntfs_trim_fs() should loop with wnd->nwnd, not wnd->nbits.  KASAN
> detects this as an out-of-bounds access like below:
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
> Read of size 2 at addr ffff8881745b4f02 by task repro/19678
>
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-2.fc37 04/01/2014
> Call Trace:
>   <TASK>
> dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4))
> print_report (mm/kasan/report.c:285 mm/kasan/report.c:395)
> ? __virt_addr_valid (arch/x86/mm/physaddr.c:66)
> ? __phys_addr (arch/x86/mm/physaddr.c:32 (discriminator 4))
> ? ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
> ? ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
> kasan_report (mm/kasan/report.c:162 mm/kasan/report.c:497)
> ? ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
> ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
> ntfs_ioctl (fs/ntfs3/file.c:41 fs/ntfs3/file.c:57)
> ? ntfs_fiemap (fs/ntfs3/file.c:51)
> ? bpf_lsm_file_ioctl (./include/linux/lsm_hook_defs.h:165)
> ? ntfs_fiemap (fs/ntfs3/file.c:51)
> __x64_sys_ioctl (fs/ioctl.c:52 fs/ioctl.c:870 fs/ioctl.c:856 fs/ioctl.c:856)
> do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80)
> entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120)
>
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> ---
>   fs/ntfs3/bitmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index e92bbd754365..1930640be31a 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -1424,7 +1424,7 @@ int ntfs_trim_fs(struct ntfs_sb_info *sbi, struct fstrim_range *range)
>   
>   	down_read_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
>   
> -	for (; iw < wnd->nbits; iw++, wbit = 0) {
> +	for (; iw < wnd->nwnd; iw++, wbit = 0) {
>   		CLST lcn_wnd = iw * wbits;
>   		struct buffer_head *bh;
>   

Thanks for work, this bug has already been fixed:

https://lore.kernel.org/ntfs3/20221001070024.1366018-1-abdun.nihaal@gmail.com/

