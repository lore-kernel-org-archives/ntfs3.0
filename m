Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0003C1E
	for <ntfs3@lists.linux.dev>; Sat,  2 Sep 2023 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693674913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3rwdnX+8EZ4iBHiYpc5/Ea7123YR1lUghk+ZipZcao=;
	b=ExagjeH47BeE8LaM78O8Ecy8ZzuwnH/GBKag91xhmGjmRBqH/OXt7qdwpzu8LgksCyQBEk
	/DiOJhKwWiE4lltNmqeCFW7XDhCkzc6BuimrG+YY7192b3EZvNbv2i4lebCrRTPEEwGAdg
	c2C3ZbJKNbk+0gb17Gtw2DEKTPyKe7s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-4jP-0xMWPHeHYxRiOWblPw-1; Sat, 02 Sep 2023 13:15:09 -0400
X-MC-Unique: 4jP-0xMWPHeHYxRiOWblPw-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c0c3ccd3d6so1028335ad.1
        for <ntfs3@lists.linux.dev>; Sat, 02 Sep 2023 10:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693674908; x=1694279708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3rwdnX+8EZ4iBHiYpc5/Ea7123YR1lUghk+ZipZcao=;
        b=SPhb2rsISjQlpppOAILQymAQChMjmb5SdzHhKpFGKBfS7UJejzOI/peQhDKO3K0vJO
         KkDT7wmKPogYUnxwckQ3bJ44fq2yP2yVGVb5XF+Ti3TFsiLCoC0Ymq09q/4EPCaBgO/+
         J4H/OdgPTqeVl5I8t6/3mKG5bf7wnxJxiP5H+gHDZepYCpIDWfVx0wB6eLy0sfnqV6Ch
         fY6NurcWqtsv41p+vb54SWkqHnYpskrWtfJ0AGzPaZjSKKKIA3JYsqhmxau8njYaP9ik
         lYDjqvUjfZbRRwBgh1+MW1SZx1Wnp2RQ1n2FKzk7i92VXbmELXf16JTmvDPRg4L8PsMI
         EJGQ==
X-Gm-Message-State: AOJu0YwR0U+/NjbQrVhX1tObwDtVVFq4fyvP5DE2dTGue4IDXiV1sClB
	7tMun9muTMV2OLfRtS+oEzE0QLlnXQXuFPCe1LCRUNz8thi/u4DP/WShy/LCazbc10sxfCGdKNf
	9tP+DA5ADDo7P8GQ=
X-Received: by 2002:a17:902:d48f:b0:1bd:e64c:5c71 with SMTP id c15-20020a170902d48f00b001bde64c5c71mr6094315plg.21.1693674908657;
        Sat, 02 Sep 2023 10:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV+kHQJSiPr1V0gPMpOP/VEJoJGjTZsePWvjrleo29ncyzGxiqPnw6LtKQTRBk5IScMHgk4A==
X-Received: by 2002:a17:902:d48f:b0:1bd:e64c:5c71 with SMTP id c15-20020a170902d48f00b001bde64c5c71mr6094301plg.21.1693674908327;
        Sat, 02 Sep 2023 10:15:08 -0700 (PDT)
Received: from ?IPV6:240d:1a:c0d:9f00:64d6:da05:8423:9cd6? ([240d:1a:c0d:9f00:64d6:da05:8423:9cd6])
        by smtp.gmail.com with ESMTPSA id jg9-20020a17090326c900b001bde65894c8sm4845411plb.268.2023.09.02.10.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 10:15:07 -0700 (PDT)
Message-ID: <05e68275-3919-555e-f2df-016aa83b72e4@redhat.com>
Date: Sun, 3 Sep 2023 02:15:05 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fs/ntfs3: Fix potential use-after-free in
 ntfs_init_from_boot()
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230812154736.975753-1-syoshida@redhat.com>
From: Shigeru Yoshida <syoshida@redhat.com>
In-Reply-To: <20230812154736.975753-1-syoshida@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

ping?

On 8/13/23 00:47, Shigeru Yoshida wrote:
> KASAN found the following issue:
> 
> BUG: KASAN: use-after-free in memcmp+0x172/0x1c0
> Read of size 8 at addr ffff88802d88a002 by task repro/4557
> 
> CPU: 0 PID: 4557 Comm: repro Not tainted 6.5.0-rc5-00296-gf8de32cc060b-dirty #20
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-1.fc38 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xd3/0x1b0
>  print_report+0xc4/0x630
>  ? __virt_addr_valid+0x5e/0x2d0
>  ? __phys_addr+0xc6/0x140
>  kasan_report+0xda/0x110
>  ? memcmp+0x172/0x1c0
>  ? memcmp+0x172/0x1c0
>  memcmp+0x172/0x1c0
>  ? __bread_gfp+0x79/0x310
>  ntfs_fill_super+0x722/0x43a0
>  ? put_ntfs+0x330/0x330
>  ? vsprintf+0x30/0x30
>  ? set_blocksize+0x2c0/0x360
>  get_tree_bdev+0x43e/0x7d0
>  ? put_ntfs+0x330/0x330
>  vfs_get_tree+0x88/0x350
>  path_mount+0x69f/0x1ec0
>  ? kmem_cache_free+0xf0/0x4a0
>  ? finish_automount+0xa50/0xa50
>  ? putname+0x105/0x140
>  __x64_sys_mount+0x293/0x310
>  ? copy_mnt_ns+0xb60/0xb60
>  ? syscall_enter_from_user_mode+0x26/0x80
>  do_syscall_64+0x39/0xb0
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f2d6bf29eaa
> Code: 48 8b 0d 71 df 0a 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 c8
> RSP: 002b:00007ffcf8924638 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 0000000000423e00 RCX: 00007f2d6bf29eaa
> RDX: 0000000020000080 RSI: 00000000200000c0 RDI: 00007ffcf8924770
> RBP: 00007ffcf8924800 R08: 00007ffcf8924670 R09: 0000000000000000
> R10: 0000000000000040 R11: 0000000000000202 R12: 00007ffcf8924978
> R13: 00007ffcf8924988 R14: 0000000000402c65 R15: 00007f2d6c014a60
>  </TASK>
> 
> dev_size variable is used to calculate the LBO of the alternative boot
> in ntfs_init_from_boot().  dev_size is set to the number of bytes of
> the device, but it can be modified when the NTFS sector size and the
> media sector size are different.  So, using dev_size can cause the
> above issue in that case.
> 
> This patch fixes this issue by resetting dev_size to the actual number
> of bytes of the device before calculating the LBO of the alternative
> boot.
> 
> Fixes: 6a4cd3ea7d77 ("fs/ntfs3: Alternative boot if primary boot is corrupted")
> Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> ---
>  fs/ntfs3/super.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 1a02072b6b0e..43b698353840 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1067,7 +1067,10 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>  out:
>  	if (err == -EINVAL && !bh->b_blocknr && dev_size > PAGE_SHIFT) {
>  		u32 block_size = min_t(u32, sector_size, PAGE_SIZE);
> -		u64 lbo = dev_size - sizeof(*boot);
> +		u64 lbo;
> +
> +		dev_size = bdev_nr_bytes(sb->s_bdev);
> +		lbo = dev_size - sizeof(*boot);
>  
>  		/*
>  	 	 * Try alternative boot (last sector)

