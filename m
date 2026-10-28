Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173217;
	b=0fZ5ii1BkejZlX1C/m1FVCJ0pW0Y31jeIh25IlGSNmv0IRgxk3fLI34q48qau6qODWCm
	 35eoc/ylBIHSoCDAOkPGD+htzOlSTab2AWSrMwbsOTzRfTElr+cBzN0MdhCzl+qiPV78s
	 RnYMge0NYscnPTNLx4NR4K4KwKHmkHHsAY2kZNOfzB8vM0h78ZqySGmJciFHVic6SVqfR
	 N1D08c+YTM1XuIKqJLh6vfaaqXYasX9oym1JJhHb00xf4ogwcEI+al+Xvt/VCOek4ZnBO
	 Dqp/OjFZTBbmwg/qMVRKOzx6+zQMF/JrJ5m8i03Ji3h/H1mF8eOG4R4Nkq5UXUNfnsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173217;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=Bkq3KKgk1UDWj5HUSb5RnpmLfHpybAznAxoeESK/0zI=;
	b=a+9tZgiOOyR9qrdaeLhWtVzwY8ZLFGMJD+m6uB2a+KMEdcO6Nq7qk1xDud/EtEEGlUWb
	 bRhup5+awtyZhECQ79V07Gq/uIGt5CVHd+aqCuYkP3xrtUz0V5oCt5hO3hhRtgNc8RyYt
	 fGIpUF6pPO0NkBLDfdoXorsTlt0nU6RjorP3Xt8R0Ctbvzs/Dx20wfTq55dFrUF7W139a
	 gP0xaTQJ1W72nITM4lx/4W7qhncVf3TLTEBeigbeK1FJxcAi4G1UKP54JOzLBk4DxQcVO
	 pdUeL38RSPCav/YwcVw7K8djYWOx2IrVG+srx3EvEdv63fMeQMyHlxksKH2FHkCww/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=GQUxsp7H;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C200606A31D
	for <ntfs3@lists.linux.dev>; Wed, 28 Oct 2026 07:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C200606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=GQUxsp7H
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id DDB1D1D15;
	Wed, 28 Oct 2026 07:41:01 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=GQUxsp7H;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 56E12D9;
	Wed, 28 Oct 2026 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1793173214;
	bh=Bkq3KKgk1UDWj5HUSb5RnpmLfHpybAznAxoeESK/0zI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GQUxsp7HCByZY1c2QjSn89awZ4q/dSASImo2Ncg4tkS6SZDzezuOdKsc8HEMNmhEd
	 df/hqCNrJxIq9AIR8ZXA+fNZU8Bx49j84CGv4yV4QRMX9De4MuJRzZJQNgG4y4J3YP
	 4G8GVvgh29qhVripRPb+NPoYpaiXV8VJO2qJuDY8=
Received: from [192.168.95.128] (172.30.20.183) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 28 Oct 2026 10:40:13 +0300
Message-ID: <5593517a-a75e-4e03-b74e-0399069c03c5@paragon-software.com>
Date: Wed, 28 Oct 2026 08:40:11 +0100
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
Subject: Re: [PATCH] fs/ntfs3: validate the EA value length in ntfs_read_ea()
To: Yuejie Shi <syjcnss@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260803043432.94886-1-syjcnss@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260803043432.94886-1-syjcnss@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/3/26 06:34, Yuejie Shi wrote:

> ntfs_read_ea() checks the $EA list for consistency, but it only
> recomputes the packed size of an entry when the entry's own size field is
> zero:
>
>          for (off = 0; off < size; off += ea_size) {
>                  const struct EA_FULL *ef = Add2Ptr(ea_p, off);
>                  u32 bytes = size - off;
>                  ...
>                  if (ef->size) {
>                          ea_size = le32_to_cpu(ef->size);
>                          if (ea_size > bytes)
>                                  goto out1;
>                          continue;              /* <- elength never checked */
>                  }
>                  ...
>                  ea_size = ALIGN(struct_size(ef, name,
>                                              1 + ef->name_len +
>                                                      le16_to_cpu(ef->elength)),
>                                  4);
>                  if (ea_size > bytes)
>                          goto out1;
>          }
>
> ef->size is non-zero for every entry except the last one, and it is what
> ntfs3 itself writes (ntfs_set_ea() stores exactly that aligned packed
> size), so in practice elength is not validated at all.  find_ea() then
> uses unpacked_ea_size(), which also prefers ea->size when it is set, so
> it agrees and hands the entry back.
>
> ntfs_get_ea() copies elength bytes with no further bound of its own:
>
>          len = le16_to_cpu(ea->elength);
>          ...
>          if (len > size) {              /* size is the *caller's* buffer */
>                  err = -ERANGE;
>                  ...
>          }
>          memcpy(buffer, ea->name + ea->name_len + 1, len);
>
> so a caller that supplies a large enough buffer receives up to 64 KiB of
> whatever follows the small $EA allocation -- straight to userspace via
> getxattr(2).
>
> Compute the packed size unconditionally and require it to fit in the
> entry.  Hoist the "bytes < offsetof(struct EA_FULL, name)" test above the
> ef->size branch as well: name_len and elength were being read there
> without it, which is itself a small over-read of the kmalloc'd buffer
> when fewer than 8 bytes are left.  The old "bytes < sizeof(ef->size)"
> test is subsumed by it.
>
>    # mkntfs image; create /mnt/ntfs/poc with user.ntfs6 set, then rewrite
>    # that EA_FULL's elength from 0xf to 0xff00 on the raw device
>    mount -t ntfs3 -o ro /dev/vda /mnt/ntfs
>    getxattr("/mnt/ntfs/poc", "user.ntfs6", buf, 128 * 1024);
>
>    BUG: KASAN: slab-out-of-bounds in ntfs_get_ea+0x294/0x3e0
>    Read of size 65280 at addr ffff0000cca53acf by task xattr_probe/142
>     __asan_memcpy+0x3c/0xa0
>     ntfs_get_ea+0x294/0x3e0
>     ntfs_getxattr+0x284/0x318
>     __vfs_getxattr+0x104/0x160
>     vfs_getxattr+0x1b4/0x1e0
>     do_getxattr+0xcc/0x230
>     path_getxattrat+0x184/0x270
>     __arm64_sys_getxattr+0x64/0x80
>    Allocated by task 142:
>     __kmalloc_noprof+0x294/0x668
>     ntfs_read_ea+0x1e4/0x420
>     ntfs_get_ea+0x2c8/0x3e0
>    The buggy address belongs to the object at ffff0000cca53a80
>     which belongs to the cache kmalloc-96 of size 96
>
> The object being over-read is the one ntfs_read_ea() just allocated, and
> it is 96 bytes.
>
> Entries written by ntfs3 and by Windows set size to the aligned packed
> size, so the new test does not reject anything a working filesystem
> produces.
>
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuejie Shi <syjcnss@gmail.com>
> ---
>   fs/ntfs3/xattr.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 04814dd29375..e67a1100d0cd 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -146,26 +146,31 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct
>          for (off = 0; off < size; off += ea_size) {
>                  const struct EA_FULL *ef = Add2Ptr(ea_p, off);
>                  u32 bytes = size - off;
> +               u32 packed_size;
>
> -               /* Check if we can use field ea->size. */
> -               if (bytes < sizeof(ef->size))
> +               /* Check if we can use fields ef->name_len and ef->elength. */
> +               if (bytes < offsetof(struct EA_FULL, name))
>                          goto out1;
>
> +               /*
> +                * The name and the value have to fit in the entry whether or
> +                * not ef->size is set, because ntfs_get_ea() copies elength
> +                * bytes out of this buffer and checks them only against the
> +                * caller supplied buffer size.
> +                */
> +               packed_size = ALIGN(struct_size(ef, name,
> +                                               1 + ef->name_len +
> +                                                       le16_to_cpu(ef->elength)),
> +                                   4);
> +
>                  if (ef->size) {
>                          ea_size = le32_to_cpu(ef->size);
> -                       if (ea_size > bytes)
> +                       if (ea_size > bytes || packed_size > ea_size)
>                                  goto out1;
>                          continue;
>                  }
>
> -               /* Check if we can use fields ef->name_len and ef->elength. */
> -               if (bytes < offsetof(struct EA_FULL, name))
> -                       goto out1;
> -
> -               ea_size = ALIGN(struct_size(ef, name,
> -                                           1 + ef->name_len +
> -                                                   le16_to_cpu(ef->elength)),
> -                               4);
> +               ea_size = packed_size;
>                  if (ea_size > bytes)
>                          goto out1;
>          }
> --
> 2.51.0

Hello,

The patch was applied, thank you.

Regards,
Konstantin

