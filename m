Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388507;
	b=B25ofiapk2cWN+st492r6pF/k7TpoVIm/qOGPMgiHq86ULzaS00oTahWIftGYbCa3krG
	 zX5kx2WXbVq5AF/Dv6Z35A9lXIQ7EC9XMG0MU79QUkyfXTGjJRbLRM8h5JaBrKm6oBxIX
	 n6EIklIuAa1d+A8P2hejDdDyEelGcgXoEF5aZu/8PwjwGSVZtRfgRNngShxxLbJgqU02L
	 8K2jaVv6CXSYF5BFAOKzKhC4O8ZnzcxW3V5tzRTqrEFCN5SFnTuQ9C5bZFvhdHeHAAnb8
	 fzALHbtn9r1FWjPCU0vhxcLmq3SZIFRr1gHchRd4g70cde2UUU1OEwfZnuUNk/wJdew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388507;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=0+CgbwybaiTL/onVXenjL9lJTFScjyLVLl+Z42tjuTM=;
	b=Icw5nzl3klkZJwGeBDRAS6O5HPjhFJD7eoeeTFYw6Cns47paJpcUtZIrESstCMr8WeDx
	 kDL4WpAoYz/B191n/z3JWSh+9U3RkXLfoG/FNLMKBXzYpuZtmfK+8JMJycBAXBZu1V2b6
	 dd29FCkYn72EPDQut9X2H316aWz0UqXo0YSYk5mmQ3CsopvqfR3F8XC67T4r0phwXF5VO
	 zTe6MbK2AMws/S1iZFb37mo94aXbd0LCVWQVfGyGcNcULcdb+VSZ80NJ4k4qgZd3qmVyx
	 7wp0ihMJNwYLNOfq13+MYggHV0W6w4EyAqmE7sDvzgc2Ra5Memb4qvoCYfoXTYmhhaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=nFjuETd7;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FEC606A33E
	for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 09:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FEC606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=nFjuETd7
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5AD021D28;
	Wed, 11 Nov 2026 09:15:49 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=nFjuETd7;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 8F800238A;
	Wed, 11 Nov 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1794388504;
	bh=0+CgbwybaiTL/onVXenjL9lJTFScjyLVLl+Z42tjuTM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nFjuETd7yrUkbrpX4qd5bLhlioecIpVTSBW1RNvpZi4jA5axmrmbtwBmm50Hs5nxf
	 SNLm3S52gC8fIQqK6ru7LuCki3plRrihFi/evQ1OP750h+eZF2aOVdkStmGRvjW58C
	 f+zY1mymUvYERypzM/qF/A08txJWxpqOwp03P5cs=
Received: from [192.168.95.128] (172.30.20.190) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Nov 2026 12:15:03 +0300
Message-ID: <c465cde4-727e-4ff5-bd2a-324f444c330a@paragon-software.com>
Date: Wed, 11 Nov 2026 10:15:01 +0100
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
Subject: Re: [PATCH] ntfs3: Update only the member values without replacing
 the opts pointer
To: Edward Adam Davis <eadavis@qq.com>,
	<syzbot+4c22f022eb39c86b9d19@syzkaller.appspotmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzkaller-bugs@googlegroups.com>
References: <6a778cc0.01d0871a.3a0d52.006c.GAE@google.com>
 <tencent_1C66CE3D8B3704962236124B067405761909@qq.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <tencent_1C66CE3D8B3704962236124B067405761909@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/9/26 08:07, Edward Adam Davis wrote:

> There is a potential race condition when accessing options during remount
> and read operations. This would trigger a uaf [1].
>
> CPU0: remount				CPU1: read options
> ==================================	==================
> do_remount()
> reconfigure_super()
>   ntfs_fs_reconfigure()
>    sbi->options = fc->fs_private
> put_fs_context()
>   ntfs_fs_free()
>    put_mount_options()			ntfs_show_options()
>     kfree(sbi->options)			 opts = sbi->options
> 				         opts->dmask //trigger uaf
>
> The fix involves not updating the sbi->options pointer during
> reconfiguration, but instead using fc->fs_private to update the
> corresponding member values.
>
> [1]
> BUG: KASAN: slab-use-after-free in ntfs_show_options+0x656/0x800 fs/ntfs3/super.c:762
> Call Trace:
>   ntfs_show_options+0x656/0x800 fs/ntfs3/super.c:762
>   show_vfsmnt+0x637/0x780 fs/proc_namespace.c:129
>   seq_read_iter+0x8d6/0xcb0 fs/seq_file.c:273
>   new_sync_read fs/read_write.c:493 [inline]
>   vfs_read+0x59e/0xa90 fs/read_write.c:574
>
> Allocated by task 6027:
>   ntfs_init_fs_context+0x55/0x570 fs/ntfs3/super.c:1862
>   alloc_fs_context+0x9a3/0xd00 fs/fs_context.c:295
>   do_remount fs/namespace.c:3392 [inline]
>   path_mount+0xc5e/0x1040 fs/namespace.c:4153
>   do_mount fs/namespace.c:4174 [inline]
>
> Freed by task 6026:
>   kfree+0x1c5/0x6c0 mm/slub.c:6692
>   put_fs_context+0x123/0xb00 fs/fs_context.c:498
>   do_remount fs/namespace.c:3419 [inline]
>   path_mount+0xef9/0x1040 fs/namespace.c:4153
>   do_mount fs/namespace.c:4174 [inline]
>
> Fixes: cd39981fb92a ("fs/ntfs3: Fix double free on remount")
> Reported-by: syzbot+4c22f022eb39c86b9d19@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4c22f022eb39c86b9d19
> Tested-by: syzbot+4c22f022eb39c86b9d19@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   fs/ntfs3/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 3305fe406cb2..58540491e68b 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -461,7 +461,7 @@ static int ntfs_fs_reconfigure(struct fs_context *fc)
>   	}
>   
>   	sync_filesystem(sb);
> -	swap(sbi->options, fc->fs_private);
> +	memcpy(sbi->options, fc->fs_private, sizeof(*sbi->options));
>   
>   	return 0;
>   }

Hello,

Sorry for the delay.

In the meantime commit 56c3824de56b ("ntfs3: free replaced mount
options after a grace period") went upstream. It addresses the same
root cause: sbi->options is replaced and the old options are now freed
after an RCU grace period instead of immediately. Since that approach
is already merged, I won't apply your patch.

Thanks for the work and the report.

Regards,
Konstantin

