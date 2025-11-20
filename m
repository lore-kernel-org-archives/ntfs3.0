Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB9313298
	for <ntfs3@lists.linux.dev>; Thu, 20 Nov 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629865; cv=none; b=RCuwvTvkGzamyJ7zhKmb6HibFdbh5UxTvSNjNEfb7OuSBJCvKyP2L3qdt7uUHHtDKIzlChrAlnXd7huKAaC1YF3n3+zEiWWmsGHUwqPv1kRRqE4hEzTlpoBMhLejYxiWCm4jN+m5AvjprfpMV6HNIqQ2svkTLkMNJh4pRkCrLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629865; c=relaxed/simple;
	bh=WLHGt8biE1C8QIo3nB2tcL106SLo7/gAuCH2NiUPi1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HoY8mCfZT85fan4gWpjV9IC0A4NkpDDybxAVN8JV4e96xcS9DkZhW0KUCl2i0mYCObBaIAvUiiQCYm4nw6k9gE1jzKJRIk6l52jE3swuinXeD2xokBB5SRDYDG5dlA92N2o+1vXACB9YKtyWWPpeLbadIkeQZqr6uFlZ+Ybxo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=DaGB2qqZ; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="DaGB2qqZ"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 187D226;
	Thu, 20 Nov 2025 09:07:34 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=DaGB2qqZ;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 9B0B22471;
	Thu, 20 Nov 2025 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763629861;
	bh=nNPJWObMth0NW0dNyHjuJ9A/vn3B7N/DZ35zAyaYTrA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DaGB2qqZkS8Xqk/PpkNnc+A/PM2SU/2pjDZ5td4lVKtcwg0PPih4+vh1orcTEADFF
	 dJMFhCIzIenQIfAo1Ie0T1/OkwW5sMGs7ps4e1h2aLPoUrPQYO3+xht6r8gsUui33Y
	 OHQ2B6dg+I21b5lQ2niPp/dZPoIOKMLdBlCtOoPw=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 12:10:59 +0300
Message-ID: <bf9942b5-d71c-4940-a6a7-4bfe522dea66@paragon-software.com>
Date: Thu, 20 Nov 2025 10:10:58 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] ntfs3: fix double free of sbi->options->nls and
 clarify ownership of fc->fs_private
To: YangWen <anmuxixixi@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+cc433e4cd6d54736bf80@syzkaller.appspotmail.com>
References: <20251030162045.27813-1-anmuxixixi@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251030162045.27813-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10/30/25 17:20, YangWen wrote:

> commit 02f312754c87 ("ntfs3: fix use-after-free of sbi->options in cmp_fnames") introduced a use-after-free bug
> due to improper handling of sbi->options in error paths. This resulted in crashes when superblock cleanup
> is performed in ntfs_put_super.
>
> This patch ensures that the options structure and its subfields are properly freed, preventing the memory
> corruption and use-after-free errors.
>
> Reported-by: syzbot+cc433e4cd6d54736bf80@syzkaller.appspotmail.com
> Signed-off-by: YangWen <anmuxixixi@gmail.com>
> ---
>   fs/ntfs3/super.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index aae1f32f4dab..5d4ca4c10116 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -705,7 +705,7 @@ static void ntfs_put_super(struct super_block *sb)
>   
>   	if (sbi->options) {
>   		unload_nls(sbi->options->nls);
> -		kfree(sbi->options->nls);
> +		kfree(sbi->options->nls_name);
>   		kfree(sbi->options);
>   		sbi->options = NULL;
>   	}
> @@ -1246,6 +1246,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>   		}
>   	}
>   	sbi->options = options;
> +	fc->fs_private = NULL;
>   	sb->s_flags |= SB_NODIRATIME;
>   	sb->s_magic = 0x7366746e; // "ntfs"
>   	sb->s_op = &ntfs_sops;
> @@ -1671,7 +1672,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>   out:
>   	if (sbi && sbi->options) {
>   		unload_nls(sbi->options->nls);
> -		kfree(sbi->options->nls);
> +		kfree(sbi->options->nls_name);
>   		kfree(sbi->options);
>   		sbi->options = NULL;
>   	}

Applied to my tree with added "Fixes:" and "Closes:" tags, thanks for the
patch.

Regards,
Konstantin

