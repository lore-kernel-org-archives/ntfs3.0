Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378B33314B7
	for <ntfs3@lists.linux.dev>; Tue,  7 Apr 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775582296; cv=none; b=XNTctUBrXbZS2egWap01iA76632fl54GQOjLFrVhCe+M5Q7yrAO3y2MDzV25m+MCRJHL5ydHwAn7aq4NRt5ZMjfWQHdBl598i/18I+/7IV/BkFn13YcGYEM9Y03gEqSrxlUer4ZlV24s33lOojgNufrbqefijoJBzDkAy/Jk4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775582296; c=relaxed/simple;
	bh=vN0Rrd2fnoooDujEYNyhcv/Er932/ncDdpE3tfp81Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CYIHyFt4M7wgmAkAIJdBX074GwuCOW/dEG2xIjR3MY9Wxua4IeU716m5cQtDLlXOeLeuluB21pLbmLepgNYJVQZbuUhVOzTSwnEr92QR2Wrc4HNSr3QbwNnw0OkjaaJxCdU+Vh9Kyp++MYjWy6HXnuYrbgBqLEwLN6TBC2jj1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=MTdWnd9E; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="MTdWnd9E"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B14201D43;
	Tue,  7 Apr 2026 17:18:25 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=MTdWnd9E;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 43D83213F;
	Tue,  7 Apr 2026 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1775582293;
	bh=e1jDR4s5JL6fhycF2lXUhRvk+HB22SUuI3nkNzmFmlE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MTdWnd9EqXfz0Zk5NzkETLxUPCYqhNKgvdsheKNOI5zBQ20Yde3kIGcEhmYz6NxZq
	 BiDQJdk7aevPCgEeNSZJT9+gKQ+uzF7WL7hgtHHPu4LPPZEpaxRW2Qjwf5zwf5oGOH
	 1w39mMGMp2mqhzM0NT2vrM9XaoWIUU3defvB1z+c=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Apr 2026 20:18:12 +0300
Message-ID: <8e2cf2c8-7d4e-4036-a050-f0c084503661@paragon-software.com>
Date: Tue, 7 Apr 2026 19:18:10 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix mount failure on volumes with fragmented MFT
 bitmap
To: Ruslan Elishev <relishev@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>
References: <20260328105308.786150-1-relishev@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260328105308.786150-1-relishev@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 3/28/26 11:53, Ruslan Elishev wrote:

> [You don't often get email from relishev@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> When the $MFT's $BITMAP attribute is fragmented across multiple MFT
> records (base record + extent records), ntfs_fill_super() fails with
> -ENOENT during wnd_init() because the MFT bitmap's run list only
> contains runs from the base MFT record.
>
> The issue is that wnd_init() (which calls wnd_rescan()) is invoked
> before ni_load_all_mi(), so the extent MFT records containing
> additional $BITMAP runs have not been loaded yet. When wnd_rescan()
> tries to look up a VCN beyond the base record's runs, run_lookup_entry()
> fails and returns -ENOENT.
>
> This affects NTFS volumes with a large or heavily fragmented MFT, which
> is common on long-used Windows systems where the MFT bitmap's run list
> doesn't fit in the base MFT record and spills into extent records.
>
> Fix this by:
> 1. Moving ni_load_all_mi() before wnd_init() so all extent records
>     are available.
> 2. After ni_load_all_mi(), iterating through the attribute list to
>     find any $BITMAP extent attributes and unpacking their runs into
>     sbi->mft.bitmap.run before wnd_init() is called.
>
> Tested on a 664GB NTFS volume with 86 MFT bitmap runs spanning
> records 0 (VCN 0-105) and 17 (VCN 106-165). Before the fix, mount
> fails with -ENOENT. After the fix, mount succeeds and all read/write
> operations work correctly. Stress-tested with 8 test categories
> (large file integrity, 10K small files, copy, move, delete/recreate
> cycles, concurrent writes, deep directories, overwrite persistence).
>
> Signed-off-by: Ruslan Elishev <relishev@gmail.com>
> ---
>   fs/ntfs3/super.c | 39 +++++++++++++++++++++++++++++++++------
>   1 file changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index abcdef..123456 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1364,16 +1364,43 @@
>          tt = inode->i_size >> sbi->record_bits;
>          sbi->mft.next_free = MFT_REC_USER;
>
> -       err = wnd_init(&sbi->mft.bitmap, sb, tt);
> -       if (err)
> -               goto put_inode_out;
> -
>          err = ni_load_all_mi(ni);
>          if (err) {
>                  ntfs_err(sb, "Failed to load $MFT's subrecords (%d).", err);
>                  goto put_inode_out;
>          }
>
> +       /* Merge MFT bitmap runs from extent records loaded by ni_load_all_mi. */
> +       {
> +               struct ATTRIB *a = NULL;
> +               struct ATTR_LIST_ENTRY *le = NULL;
> +
> +               while ((a = ni_enum_attr_ex(ni, a, &le, NULL))) {
> +                       CLST svcn, evcn;
> +                       u16 roff;
> +
> +                       if (a->type != ATTR_BITMAP || !a->non_res)
> +                               continue;
> +
> +                       svcn = le64_to_cpu(a->nres.svcn);
> +                       if (!svcn)
> +                               continue; /* Base record runs already loaded. */
> +
> +                       evcn = le64_to_cpu(a->nres.evcn);
> +                       roff = le16_to_cpu(a->nres.run_off);
> +
> +                       err = run_unpack_ex(&sbi->mft.bitmap.run, sbi,
> +                                           MFT_REC_MFT, svcn, evcn, svcn,
> +                                           Add2Ptr(a, roff),
> +                                           le32_to_cpu(a->size) - roff);
> +                       if (err < 0) {
> +                               ntfs_err(sb, "Failed to unpack $MFT bitmap extent (%d).", err);
> +                               goto put_inode_out;
> +                       }
> +                       err = 0;
> +               }
> +       }
> +
> +       err = wnd_init(&sbi->mft.bitmap, sb, tt);
> +       if (err)
> +               goto put_inode_out;
> +
>          sbi->mft.ni = ni;
>
>          /* Load $Bitmap. */
> --
> 2.43.0

Hello,

I've failed to apply your patch as it is. Git produced an error.
But I've taken your changes unmodified. Thanks for the patch.

Regards,
Konstantin

