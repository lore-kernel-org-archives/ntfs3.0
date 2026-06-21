Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CFAEEBA
	for <ntfs3@lists.linux.dev>; Sun, 21 Jun 2026 00:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782002815; cv=none; b=TlK/PVdrAGyuLYoCkTh1SdWP7bEHHjWUuWbRlgZq97TcIoQA3ZF4W8gyJt6biWh/aybw+aEyIf/iN/mlJe+i8CUfRQt3bFrOymGp2OyrKHMSTR7UjQ8mapKMDae/IoWVsOXqkSkHO+lzJKdC79Zi20e8Y5XgBOjPDOGPt6/YJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782002815; c=relaxed/simple;
	bh=2anTGcwlmWUC0uRj7EqW+xi1b3FeSRGPvHyMQrzm+Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8S1dpGw0FgdH/SebyjwrkjBltcbbqGvnuAkcJQrB4wFt46/pn5a+4maJSdVPjOXDt0u0AfmeYF4DMQWAe8px64+i4aTrPwDXdXItBv/TCtfb8FbwJmBcOAKbEhhlaW8UyUijwtXRJCI9ET1e0vyca7h98ttpdV5VYCsVZapwxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KYyNx1+r; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KYyNx1+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782002809; bh=Skc9inRiPUzWrFaqohM6t+s9+TKZ/VuWhxP3dydFw60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KYyNx1+rx87+32ZI1tUOU85pT+LtDHsNzD38d5tb4aOgSyQQfxJsMyKICAEQkkH/l
	 m06lmaSHQMwYLkiDfIxdDNst5Gkm0lRUsg9gu127P8QE67r3COcuszP+i6UMkoIz20
	 lsWKC0oEA/EXwA4VA7ZxynOlypBQCaJWE3WXWADA=
Received: from [192.168.1.100] ([183.94.22.181])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id BAF2A27D; Sun, 21 Jun 2026 08:46:47 +0800
X-QQ-mid: xmsmtpt1782002807t7ufg3yhr
Message-ID: <tencent_C6D9F07A27C722772072C0593442A06C940A@qq.com>
X-QQ-XMAILINFO: MnyA3vAndR/VSpAz3+29ljOzzkIrCUQU/RTQe/MAVP/7WxuP+61E9uxoWYTL9V
	 S0oFekrQwZgjVkC402khH22EQxzp0JmY6hEs7/wtlUN+uTOSuDl3JVOaBzQwn0lsud3rAW4IMCAM
	 XkurEaUTb02a9u1VSNpSXScmOY5CD7DavuROH66tCZDmhUAcsLSSCj2e61Fk1q8rbNS5C3+Hvi4n
	 KD+skJlrGwi48lvqtrPht4CawHE3pZLGCa/dkc98MGH1B3dyVQhzohFqTj8Nko8dVXqyhTV3FBYF
	 ezbKC47qawJm1OpOqvLPtHDGM5F2QMMf8sqnKQJnkiq4+o3bgyodctMG0O/ojA2ZWe+LDGFJxxB+
	 cYex6FGqTapFSYgg/bfwO4uacZFFWNOq/F7052TLKg9AgieRx6oRPYJyRdGAo1tmcg5m7luEKRUf
	 1/CaDSL61s19r1mV8soHE9RFIgdGtmQVY1yf8fA8eTQBz/k1Ybsq+oRRfg9i0Cg6wpYm5kJonk3r
	 M+agClnfvgjKAiIu+64uW4+tyrgMyJZRDMv2bBftq2q9xtSjXRKHqDkAD/82f/mnAKokCZe4R+Wb
	 D1g6Y79R5uImv+4348cdSo2qBPKPXqJK9X0mFCJCnF5wC/ih6ujVzOe4vfBIBMO9EzTX+9Wg/BSY
	 WwHiJpniN/A/5rvr5Hgs6kSv4GoY7lmpbYAldc1eHRsFkZykABLM5L3QGZ5EEWAcA4Cfp4TtWSDX
	 kwcsTpCTBptwTURTRF5mKwcA1bWiATwNK4IR274OEYEhX4XPaW5Y7pZVRF+6EMDdNKRoB8oqmYs+
	 nUJmpP2T2H+I263QI0t9EXzLpofbChvikSeq6r4GD1Juy2/WLnTTfs2n78fIuQj8E9nlG48mYMdw
	 g/o0SDD/emppJ+mp6VVqnby6Dtdwxky+fXMsd+0wjd7IywSFEvzwq72pFaql8J5/B/C4j2nGNjwx
	 7r5zQo2EeT955Ul52uSFy18SfIXWYE7ZNhH//Bib0Zk9P936uYQgM6TSLT5VHZR7kUdm1yOxQfcW
	 XlbTqAWawWMKg2/y8n+nOkmncGwt07vMYc2F7L+QA5vujf9vU+4w3pPI++ouQKPB+UJkjldWEs87
	 cKjBuzpXHTXZcdUKfq0vYStMYSmfspsCap4Gey/FcDaAxj0FA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-OQ-MSGID: <2f88625f-ac90-4022-a94f-ebe2c51ac577@qq.com>
Date: Sun, 21 Jun 2026 08:46:46 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reserve NUL byte when converting UTF-16 names
To: Kyle Zeng <kylebot@openai.com>, ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 outbounddisclosures@openai.com
References: <20260611213331.16763-1-kylebot@openai.com>
From: XIAO WU <xiaowu.417@qq.com>
In-Reply-To: <20260611213331.16763-1-kylebot@openai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

From: XIAOWU <xiaowu.417@qq.com>
To: Kyle Zeng <kylebot@openai.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: reserve NUL byte when converting UTF-16 names
In-Reply-To: <20260611213331.16763-1-kylebot@openai.com>

Hi Kyle,

I came across a Sashiko AI code review [1] that flagged a potential
use-after-free in `ntfs_utf16_to_nls()` — specifically, the read of
`sbi->options->nls` without holding sb->s_umount, allowing a concurrent
remount to free the options structure while a directory iteration is in
progress.

I was able to reproduce this in QEMU with KASAN enabled.  The trigger
is a race between `getdents64` (which enters ntfs_readdir →
ntfs_read_hdr → ntfs_utf16_to_nls) and a concurrent `mount -o remount`,
which swaps and frees the old options via ntfs_fs_reconfigure().

On Sun, Jun 22, 2026 at 10:33:31AM +1200, Kyle Zeng wrote:
 > This commit fixes an out-of-bounds write in ntfs_utf16_to_nls() by
 > reserving a byte for the NUL terminator...
...
 > --- a/fs/ntfs3/dir.c
 > +++ b/fs/ntfs3/dir.c
 > @@ -25,6 +25,11 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi,
 >                       const __le16 *name, u32 len,
 >
 >      static_assert(sizeof(wchar_t) == sizeof(__le16));

At this point, `sbi->options->nls` is dereferenced without any lock
protecting it against concurrent modification:

```c
int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, ...)
{
     const struct nls_table *nls = sbi->options->nls;  // unprotected read
```

Meanwhile, a concurrent remount path does:

     swap(sbi->options, fc->fs_private);  // in ntfs_fs_reconfigure()
     ...
     put_mount_options(opts);             // kfree() the old options

If the free lands between the nls pointer being loaded and being
dereferenced, the directory iteration hits freed memory.

[Reproduction]

I set up an NTFS filesystem image and ran two threads in parallel:
one calling getdents64 in a loop, the other calling mount -o remount.
The race triggered a KASAN report within a few seconds.

[KASAN report — kernel 7.1.0-rc6+, CONFIG_KASAN=y]

   ==================================================================
   BUG: KASAN: slab-use-after-free in ntfs_utf16_to_nls+0x563/0x5f0
   Read of size 8 at addr ffff888026403028 by task poc/9531

   Call Trace:
    <TASK>
    dump_stack_lvl+0x116/0x1f0
    print_report+0xf4/0x600
    kasan_report+0xe0/0x110
    ntfs_utf16_to_nls+0x563/0x5f0
    ntfs_read_hdr+0x6a7/0xb60
    ntfs_readdir+0x6ef/0x10a0
    iterate_dir+0x336/0x560
    __do_sys_getdents64+0x1de/0x380
    do_syscall_64+0xcd/0xf80
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

   Allocated by task 9532:
    ntfs_init_fs_context+0x...      // remount allocates new options
    alloc_mount_options+0x...
    kfree+0x...

   Freed by task 9532:
    put_mount_options+0x...         // old options freed during remount
    ntfs_fs_free+0x...

The crash is a read of the freed `sbi->options->nls` pointer. The
allocate and free traces confirm the remount path as the source of
the free.

[1] 
https://sashiko.dev/#/patchset/20260611213331.16763-1-kylebot%40openai.com
     (Sashiko AI code review — "Use-After-Free", Severity: High)

Thanks,
XIAO


