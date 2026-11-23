Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434123;
	b=Jy0yfA7s2PUy2+Xk+TKXo2SrewiP+mBU6EWZyKO6ZHHl3uOvWVzTdbZhGryX/pj0E81g
	 12l2v7uTonRpulTI35scj7yGQHrl/1WWBU2K/1r0QHQWr55PTGFJaxlF8/1zBtlczLfwq
	 N4d3+7eZ86XwpN1ilCRQ616V6T8IFAGDrNWpCoR+cPzapUc9+O0/txf5wI6P9/cIM5K9i
	 1QGqrJwbJUyiLSiDA2xiWqHAwPx92NMAt6LvG1rqSWN1uiAhZu2dbjZdaaYZjfFdFWIET
	 0kypkPIGVv2+uNkoa/dXcjoudj2iv+xPSY0SuQtnZFSvA0tG5+/SNjhmDKaaYsXXKYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434123;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=RV5KC3iZ1ej2HaOJpSpPN88tsmvHdspNBiKJQsIda+E=;
	b=ox9dN2XLYdDY/Dqn8p5hVyd8BKJdlVBrTehw5p5Xk1IefEADuhtw6GWVJ/MAsZNIVA/8
	 lazSp7uUCCxlzPn1NuTk+0UGo1sctfgMMwQ0MkvFZuWxTzvi8GVgRgKG6GTLsaYe3blWG
	 BoANXftfy3PkBPL/hQGyyl0tk6WUMR9OsrxY95kSkUFGMdGlmCpB9AmQqg11CZdjSMF/R
	 l+Kt/HaH1UcDGTODn7lMwlxflC163LX0U6vJYxvnYQWXeHl0M3qCl6nPcv9NukTh2kmuZ
	 5VdskLTnFomHhkaci+BOBTbm+P9xjjkj4JmF4bRL+YDJWxACAigcnxJPO65kZhn+Keg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=D2HBlXwI;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897E606A31A
	for <ntfs3@lists.linux.dev>; Mon, 23 Nov 2026 11:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2897E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=D2HBlXwI
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B9E071D4D;
	Mon, 23 Nov 2026 11:42:42 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=D2HBlXwI;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 4759BF7;
	Mon, 23 Nov 2026 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795434120;
	bh=RV5KC3iZ1ej2HaOJpSpPN88tsmvHdspNBiKJQsIda+E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D2HBlXwI9cI2y3DOnEN1nUVLJYEMv5kHMRgdGdoP9yLK70r8BMaM5PP1fczpQyXvr
	 LGq1x6rwTeS9TSbaemXADoNAn1iKmjfMRXm07J/8MwfKNNiJUDEA6/51079JFCY6sX
	 vJ1y+NIwyocXLZ9cVEI1ceQOya7PzHrR1tRPNsQk=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 23 Nov 2026 14:41:58 +0300
Message-ID: <4c3c3e35-81b7-4879-bc7f-e1a5437b816a@paragon-software.com>
Date: Mon, 23 Nov 2026 12:41:56 +0100
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
Subject: Re: [PATCH] fs/ntfs3: fix slab-out-of-bounds write in
 ntfs_create_inode
To: "Cen Zhang (Microsoft Security FORGE Labs)" <cenzhang@linux.microsoft.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, <AutonomousCodeSecurity@microsoft.com>,
	<xmei5@asu.edu>, <tgopinath@linux.microsoft.com>, <kys@microsoft.com>
References: <20260901175834.8557-1-cenzhang@linux.microsoft.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260901175834.8557-1-cenzhang@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/1/26 19:58, Cen Zhang (Microsoft Security FORGE Labs) wrote:

> ntfs_create_inode() sizes the non-resident reparse run list as
> record_size - offset - SIZEOF_NONRESIDENT, then sets the attribute size
> to SIZEOF_NONRESIDENT + ALIGN(run_pack(), 8). It does not reserve space
> for the trailing ATTR_END, so a maximally packed run list places that
> 4-byte sentinel just past the allocated MFT record.
>
> BUG: KASAN: slab-out-of-bounds in ntfs_create_inode+0x4390/0x5220
>    ntfs_create_inode+0x4390/0x5220 fs/ntfs3/inode.c:1796
>    ntfs_symlink+0x108/0x170 fs/ntfs3/namei.c:224
>    vfs_symlink+0x137/0x420
>    filename_symlinkat+0x326/0x460
>    __x64_sys_symlink+0x79/0xb0
>
> After packing the run list, check that the 8-byte ATTR_END slot still
> fits in the MFT record. Return -EINVAL if the aligned run list would
> place it past the buffer.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> Cc: AutonomousCodeSecurity@microsoft.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <cenzhang@linux.microsoft.com>
> ---
>   fs/ntfs3/inode.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 56b4f6469a28..d6e4b4b3154d 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1769,6 +1769,11 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
>                          }
>
>                          asize = SIZEOF_NONRESIDENT + ALIGN(err, 8);
> +                       if (asize + PtrOffset(rec, attr) + 8 >
> +                           sbi->record_size) {
> +                               err = -EINVAL;
> +                               goto out5;
> +                       }
>                          /* Write non resident data. */
>                          err = ntfs_sb_write_run(sbi, &ni->file.run, 0, rp,
>                                                  nsize, 0);
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.55.0

Hello,

Your patch is applied, thanks.

Regards,
Konstantin

