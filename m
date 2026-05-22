Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB447798C
	for <ntfs3@lists.linux.dev>; Fri, 22 May 2026 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463409; cv=none; b=gRpnaKQPPUP1BAtuMQfY0FdcQC02eImO3DADw8ZfwkpwR+KzBgyel4MYB12/BwN9LMqdYJJbvpibvh8eRwYemHfsFESY1F5RH1BHNsO374CJIaSDZXweAjvGqf/7+ufEg1R5Y0w+YoCzVXhcVneKVkHY6w343z7cmoq9uHutMEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463409; c=relaxed/simple;
	bh=RDAlz17LSt5k/Cbd697EG1ACB6q823cVCrb2aaNpdFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dx/Jo8YjSzoNmLFDmXZIJ6q3v8dTvtW6JUomutRr1Mch9hBefimIOI0B27iSsu1gK29F4gF6Z0XdUAmte0C1XSrRsSOyf3Sm7y3cIRvOqI6k1VcAynpjICipWlNAloJpTf7L1F15H/YYdYQDdplHuMND4QjUIeG3453s2IDPS+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Jnwuzxc4; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Jnwuzxc4"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 195CF1D3E;
	Fri, 22 May 2026 15:23:25 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Jnwuzxc4;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 8C13235D;
	Fri, 22 May 2026 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779463401;
	bh=kYejZ0oQykgev4nSmAtEDS3tuJ+Yl2Y0kD1D5b+1crY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Jnwuzxc41r3rNR5qEsLJtb4fbPipda0bObnhx8ctcbBixGZv9eq6zoKtVMXgGxt6X
	 zE/xLv1dbv5ZMYlx0xFqQzPuVoGw8SG+L4lww1DIhbuXT6HwUB1g+LJloiOQvnCQRI
	 pW9KDjbkyZTuEJ4MVfmwUdPmQkL5MCclmhY/UMUA=
Received: from [192.168.95.128] (172.30.20.156) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 22 May 2026 18:23:20 +0300
Message-ID: <2aa15e12-26ad-4580-9860-12ef6ba1342d@paragon-software.com>
Date: Fri, 22 May 2026 17:23:19 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: validate index entry key bounds
To: ZhengYuan Huang <gality369@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<baijiaju1990@gmail.com>, <r33s3n6@gmail.com>, <zzzccc427@gmail.com>
References: <20260424034736.1975025-1-gality369@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260424034736.1975025-1-gality369@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/24/26 05:47, ZhengYuan Huang wrote:

> [BUG]
> A malformed NTFS directory index entry can advertise a key_size larger
> than the bytes actually present in its NTFS_DE payload. Directory lookup
> then passes that malformed key to cmp_fnames(), which can read past the
> end of the kmalloc'ed index buffer.
>
> BUG: KASAN: slab-out-of-bounds in fname_full_size fs/ntfs3/ntfs.h:590 [inline]
> BUG: KASAN: slab-out-of-bounds in cmp_fnames+0x1ea/0x230 fs/ntfs3/index.c:46
> Read of size 1 at addr ffff88801c313018 by task syz.6.3365/9279
>
> Call Trace:
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0xbe/0x130 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0xd1/0x650 mm/kasan/report.c:482
>   kasan_report+0xfb/0x140 mm/kasan/report.c:595
>   __asan_report_load1_noabort+0x14/0x30 mm/kasan/report_generic.c:378
>   fname_full_size fs/ntfs3/ntfs.h:590 [inline]
>   cmp_fnames+0x1ea/0x230 fs/ntfs3/index.c:46
>   hdr_find_e.isra.0+0x3ed/0x670 fs/ntfs3/index.c:762
>   indx_find+0x4b5/0x900 fs/ntfs3/index.c:1186
>   dir_search_u+0x2c0/0x460 fs/ntfs3/dir.c:254
>   ntfs_lookup+0x1cc/0x2a0 fs/ntfs3/namei.c:85
>   __lookup_slow+0x241/0x450 fs/namei.c:1816
>   lookup_slow fs/namei.c:1833 [inline]
>   walk_component+0x31c/0x570 fs/namei.c:2151
>   link_path_walk+0x592/0xd60 fs/namei.c:2519
>   path_lookupat+0x138/0x660 fs/namei.c:2675
>   filename_lookup+0x1f3/0x560 fs/namei.c:2705
>   filename_setxattr+0xad/0x1c0 fs/xattr.c:660
>   path_setxattrat+0x1d8/0x280 fs/xattr.c:713
>   __do_sys_lsetxattr fs/xattr.c:754 [inline]
>   __se_sys_lsetxattr fs/xattr.c:750 [inline]
>   __x64_sys_lsetxattr+0xd0/0x150 fs/xattr.c:750
>   ...
>
> Allocated by task 9279:
>   kasan_save_stack+0x39/0x70 mm/kasan/common.c:56
>   kasan_save_track+0x14/0x40 mm/kasan/common.c:77
>   kasan_save_alloc_info+0x37/0x60 mm/kasan/generic.c:573
>   poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
>   __kasan_kmalloc+0xc3/0xd0 mm/kasan/common.c:417
>   kasan_kmalloc include/linux/kasan.h:262 [inline]
>   __do_kmalloc_node mm/slub.c:5650 [inline]
>   __kmalloc_noprof+0x2bd/0x900 mm/slub.c:5662
>   kmalloc_noprof include/linux/slab.h:961 [inline]
>   indx_read+0x41d/0xad0 fs/ntfs3/index.c:1059
>   indx_find+0x447/0x900 fs/ntfs3/index.c:1179
>   dir_search_u+0x2c0/0x460 fs/ntfs3/dir.c:254
>   ntfs_lookup+0x1cc/0x2a0 fs/ntfs3/namei.c:85
>   __lookup_slow+0x241/0x450 fs/namei.c:1816
>   lookup_slow fs/namei.c:1833 [inline]
>   walk_component+0x31c/0x570 fs/namei.c:2151
>   link_path_walk+0x592/0xd60 fs/namei.c:2519
>   path_lookupat+0x138/0x660 fs/namei.c:2675
>   filename_lookup+0x1f3/0x560 fs/namei.c:2705
>   filename_setxattr+0xad/0x1c0 fs/xattr.c:660
>   path_setxattrat+0x1d8/0x280 fs/xattr.c:713
>   __do_sys_lsetxattr fs/xattr.c:754 [inline]
>   __se_sys_lsetxattr fs/xattr.c:750 [inline]
>   __x64_sys_lsetxattr+0xd0/0x150 fs/xattr.c:750
>   ...
>
> [CAUSE]
> The index-header validators only validated INDEX_HDR-level geometry.
> They did not walk each NTFS_DE to verify entry alignment, subnode
> layout, or that key_size fit inside the entry payload. They also
> allowed a last sentinel entry to carry a non-zero key_size.
>
> [FIX]
> Walk every NTFS_DE in ntfs3's index-header validators and reject
> entries with invalid layout, mismatched subnode state, oversized
> key_size, or non-zero sentinel keys before lookup or log replay can
> consume them.
>
> Signed-off-by: ZhengYuan Huang <gality369@gmail.com>
> ---
> fs/ntfs3/fslog.c | 26 ++++++++++++++++++++------
> fs/ntfs3/index.c | 37 ++++++++++++++++++++++++++++++++++++-
> 2 files changed, 56 insertions(+), 7 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index acfa18b84401..ff8e2a808d12 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2599,11 +2599,12 @@ static int read_next_log_rec(struct ntfs_log *log, struct lcb *lcb, u64 *lsn)
>
>   bool check_index_header(const struct INDEX_HDR *hdr, size_t bytes)
>   {
> +       const bool has_subnode = hdr_has_subnode(hdr);
>          __le16 mask;
>          u32 min_de, de_off, used, total;
>          const struct NTFS_DE *e;
>
> -       if (hdr_has_subnode(hdr)) {
> +       if (has_subnode) {
>                  min_de = sizeof(struct NTFS_DE) + sizeof(u64);
>                  mask = NTFS_IE_HAS_SUBNODES;
>          } else {
> @@ -2620,20 +2621,33 @@ bool check_index_header(const struct INDEX_HDR *hdr, size_t bytes)
>                  return false;
>          }
>
> -       e = Add2Ptr(hdr, de_off);
> +       e = (const struct NTFS_DE *)((const u8 *)hdr + de_off);
>          for (;;) {
>                  u16 esize = le16_to_cpu(e->size);
> -               struct NTFS_DE *next = Add2Ptr(e, esize);
> +               u16 key_size = le16_to_cpu(e->key_size);
> +               u16 data_size;
>
> -               if (esize < min_de || PtrOffset(hdr, next) > used ||
> +               if (!IS_ALIGNED(esize, 8) || esize < min_de ||
>                      (e->flags & NTFS_IE_HAS_SUBNODES) != mask) {
>                          return false;
>                  }
>
> -               if (de_is_last(e))
> +               if (size_add(de_off, esize) > used)
> +                       return false;
> +
> +               if (de_is_last(e)) {
> +                       if (key_size)
> +                               return false;
> +
>                          break;
> +               }
> +
> +               data_size = esize - min_de;
> +               if (key_size > data_size)
> +                       return false;
>
> -               e = next;
> +               de_off += esize;
> +               e = (const struct NTFS_DE *)((const u8 *)hdr + de_off);
>          }
>
>          return true;
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 5344b29b0577..faedfadf6335 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -611,16 +611,51 @@ static const struct NTFS_DE *hdr_insert_head(struct INDEX_HDR *hdr,
>    */
>   static bool index_hdr_check(const struct INDEX_HDR *hdr, u32 bytes)
>   {
> +       const bool has_subnode = hdr_has_subnode(hdr);
> +       const u16 min_size = sizeof(struct NTFS_DE) +
> +                            (has_subnode ? sizeof(u64) : 0);
>          u32 end = le32_to_cpu(hdr->used);
>          u32 tot = le32_to_cpu(hdr->total);
>          u32 off = le32_to_cpu(hdr->de_off);
> +       const struct NTFS_DE *e;
>
>          if (!IS_ALIGNED(off, 8) || tot > bytes || end > tot ||
> -           size_add(off, sizeof(struct NTFS_DE)) > end) {
> +           size_add(off, min_size) > end) {
>                  /* incorrect index buffer. */
>                  return false;
>          }
>
> +       /* Ensure every key stays inside its entry before lookup walks it. */
> +       e = (const struct NTFS_DE *)((const u8 *)hdr + off);
> +       for (;;) {
> +               u16 e_size = le16_to_cpu(e->size);
> +               u16 key_size = le16_to_cpu(e->key_size);
> +               u16 data_size;
> +
> +               if (!IS_ALIGNED(e_size, 8) || e_size < min_size ||
> +                   de_has_vcn(e) != has_subnode) {
> +                       /* incorrect index entry. */
> +                       return false;
> +               }
> +
> +               if (size_add(off, e_size) > end)
> +                       return false;
> +
> +               if (de_is_last(e)) {
> +                       if (key_size)
> +                               return false;
> +
> +                       break;
> +               }
> +
> +               data_size = e_size - min_size;
> +               if (key_size > data_size)
> +                       return false;
> +
> +               off += e_size;
> +               e = (const struct NTFS_DE *)((const u8 *)hdr + off);
> +       }
> +
>          return true;
>   }

Hello,

Sorry for the delay.
Your patch is applied, thanks.

Regards,
Konstantin

