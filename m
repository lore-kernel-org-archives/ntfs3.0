Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E741F35A
	for <ntfs3@lists.linux.dev>; Fri, 24 Jul 2026 11:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892609; cv=none; b=jIiN96T8s24IVpOSo6MHV4VQFXbyjcA35yh8ZAh0oj3lruPNhbw8FFmxBODviXNspd0XgjnTEzYiFwt6TDEvn35a0UzNvpMgXHufVEfnY+1K7s/TFYiJwRD8tMuaXDR9GUWrcF2zlpWIiT4W2dt0xjfXWVgLr2qIRxMw3076HYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892609; c=relaxed/simple;
	bh=eUJDSzUZMvzFwgMPIjMDQVEOrJvhMgndS553ZxkLJJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tPHXCLzptwm2xLhtpk6esxQOBRyHab/HC/aVVKAdRC/m9z/H451NPTVrdliT4Fvb1JW3eTE8cxdedDyDAT8bNvmdEEhgBNliqb7n7PbY8jfP9xOijHtwklPVBPxzoEag7yPY5lssDabOOvrr4xRohlS1Itrjicun1Sh5WJIC9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=iG1DcgNk; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="iG1DcgNk"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D90F3241;
	Fri, 24 Jul 2026 11:30:25 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=iG1DcgNk;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6B2D237;
	Fri, 24 Jul 2026 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1784892605;
	bh=h/zfgooQ3OffomUvXBQo/0d5wQzmkbOhYDMO52mnwS4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iG1DcgNk0Ahd0bEQwBotp0avHz7qan3a3tpQECWa/EvutZrqlZSyMr/JhcrRvW5yz
	 1KlwTIPdTngoDGmexIQh331GbB4Si9Idhsb/4YaJiD2pWUK7657S3V3/SB5bc22x9q
	 ndcAdQYo0zTJpvYxFcwo+niH0IplarVZ+G6fjFOs=
Received: from [192.168.95.128] (172.30.20.208) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 24 Jul 2026 14:30:04 +0300
Message-ID: <26836018-9333-440d-9c3b-ae626148bfae@paragon-software.com>
Date: Fri, 24 Jul 2026 13:30:02 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: validate dirty page table entry sizes
To: Kyle Zeng <kylebot@openai.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <outbounddisclosures@openai.com>
References: <20260611213304.16654-1-kylebot@openai.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260611213304.16654-1-kylebot@openai.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/11/26 23:33, Kyle Zeng wrote:

> The generic restart table check only verifies the table header and
> free-list shape.  Dirty Page Table entries also carry an entry-local
> LCN array whose length is controlled by lcns_follow, and replay later
> trusts that value when converting version-0 entries and when copying
> LCNs from log records.
>
> A malformed $LogFile can provide a Dirty Page Table dump whose generic
> restart table is valid but whose entry is too small for the declared
> lcns_follow count.  log_replay() can then run the version-0 conversion
> memmove() past the kmemdup() allocation, or later copy/read past
> dp->page_lcns when a log record spans beyond the matched DPT entry.
>
> Add Dirty Page Table-specific validation before copying the table:
> require entries to be large enough for the typed DPT layout, require
> the old version-0 source layout to fit before conversion, and require
> lcns_follow to fit within the restart table entry.  Also validate each
> log record's LCN span against the matched DPT entry before touching
> dp->page_lcns.
>
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Kyle Zeng <kylebot@openai.com>
> ---
>   fs/ntfs3/fslog.c | 61 +++++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 55 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index acfa18b84401..1fc9d04806b5 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -647,6 +647,23 @@ static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
>          return NULL;
>   }
>
> +static inline bool dptbl_lcns_in_range(const struct DIR_PAGE_ENTRY *dp,
> +                                      u64 vcn, u16 lcns_follow)
> +{
> +       u64 dp_vcn = le64_to_cpu(dp->vcn);
> +       u32 dp_lcns = le32_to_cpu(dp->lcns_follow);
> +       u64 off;
> +
> +       if (vcn < dp_vcn)
> +               return false;
> +
> +       off = vcn - dp_vcn;
> +       if (off > dp_lcns)
> +               return false;
> +
> +       return lcns_follow <= dp_lcns - (u32)off;
> +}
> +
>   /*
>    * find_dp - Search for a @vcn in Dirty Page Table.
>    */
> @@ -657,12 +674,8 @@ static inline struct DIR_PAGE_ENTRY *find_dp(struct RESTART_TABLE *dptbl,
>          struct DIR_PAGE_ENTRY *dp = NULL;
>
>          while ((dp = enum_rstbl(dptbl, dp))) {
> -               u64 dp_vcn = le64_to_cpu(dp->vcn);
> -
> -               if (dp->target_attr == ta && vcn >= dp_vcn &&
> -                   vcn < dp_vcn + le32_to_cpu(dp->lcns_follow)) {
> +               if (dp->target_attr == ta && dptbl_lcns_in_range(dp, vcn, 1))
>                          return dp;
> -               }
>          }
>          return NULL;
>   }
> @@ -778,6 +791,37 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
>          return true;
>   }
>
> +static bool check_dptbl(const struct RESTART_TABLE *rt, bool is_restart_v0)
> +{
> +       u16 rsize = le16_to_cpu(rt->size);
> +       struct DIR_PAGE_ENTRY *dp = NULL;
> +
> +       if (rsize < sizeof(struct DIR_PAGE_ENTRY))
> +               return false;
> +
> +       if (is_restart_v0 && rsize < sizeof(struct DIR_PAGE_ENTRY_32))
> +               return false;
> +
> +       while ((dp = enum_rstbl((struct RESTART_TABLE *)rt, dp))) {
> +               u32 lcns_follow = le32_to_cpu(dp->lcns_follow);
> +               size_t bytes;
> +
> +               bytes = struct_size(dp, page_lcns, lcns_follow);
> +               if (bytes > rsize)
> +                       return false;
> +
> +               if (!is_restart_v0)
> +                       continue;
> +
> +               bytes = size_add(offsetof(struct DIR_PAGE_ENTRY_32, page_lcns_low),
> +                                array_size(lcns_follow, sizeof(u64)));
> +               if (bytes > rsize)
> +                       return false;
> +       }
> +
> +       return true;
> +}
> +
>   /*
>    * free_rsttbl_idx - Free a previously allocated index a Restart Table.
>    */
> @@ -4204,7 +4248,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
>          t32 = rec_len - t16;
>
>          /* Now check that this is a valid restart table. */
> -       if (!check_rstbl(rt, t32)) {
> +       if (!check_rstbl(rt, t32) || !check_dptbl(rt, !rst->major_ver)) {
>                  err = -EINVAL;
>                  goto out;
>          }
> @@ -4547,9 +4591,13 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
>                   * whole routine a loop, case Lcns do not fit below.
>                   */
>                  t16 = le16_to_cpu(lrh->lcns_follow);
> +               if (!dptbl_lcns_in_range(dp, t64, t16)) {
> +                       err = -EINVAL;
> +                       goto out;
> +               }
> +
>                  for (i = 0; i < t16; i++) {
> -                       size_t j = (size_t)(le64_to_cpu(lrh->target_vcn) -
> -                                           le64_to_cpu(dp->vcn));
> +                       size_t j = (size_t)(t64 - le64_to_cpu(dp->vcn));
>                          dp->page_lcns[j + i] = lrh->page_lcns[i];
>                  }
>
> @@ -4928,6 +4976,12 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
>          if (!dp)
>                  goto read_next_log_do_action;
>
> +       t16 = le16_to_cpu(lrh->lcns_follow);
> +       if (!dptbl_lcns_in_range(dp, t64, t16)) {
> +               err = -EINVAL;
> +               goto out;
> +       }
> +
>          if (rec_lsn < le64_to_cpu(dp->oldest_lsn))
>                  goto read_next_log_do_action;
>
> --
> 2.43.0

Hello,

I didn't hit anything at first, but during internal testing journal
replay now fails on one of our images.

I can provide an image where the problem reproduces if that helps.

Regards,
Konstantin

