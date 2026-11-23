Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434188;
	b=uoY2cpRuy+9XJ/xRxymzL3KM8DJl/2JM3Y3qoBY0cpXwDmftHUcyNukTheuRaxsap/5U
	 lp+k2RkNoJ6OMnzjkESZy266mu9HkarMwnQ4zY0OXnmMAcuODjTylfQIbc9lQBff1aHzF
	 qqPMrpyVianE1rNOkwzvOy/Ij5TdrvfuwhYpgUIsa81C8Jsi7+w2c/S1esp4nfS62G6ER
	 MZYRImmYbZm4q2kkE6I7pqCDRKr5XIC583hXPRyd2FeWg9n3hKWNn9fgA4e0KiDln3Wh8
	 4Hex9w/AdAZLmRQ6Ww8t7scbK0mIrnOT0s5VSUSIedVxXmj1o2u/m+dk0pE72sRF6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434188;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=RDQ856W/7vi9HVTZL/n2XMOw1KHEzTqEagKJuAEXnRs=;
	b=kxe/z+/HugbicBVV6FqSNXeAyhYvK0CTf31jolV9sGIxG/QLT/ToXEKcMnn2tAOrHbwm
	 b0MT6wZH2rC9mfVnG0hQjNaP3A6JrfL99i92LwQbDrtMbQChc5ImN8YNRM8MeJRI2wgvb
	 F11/Rc8V9XOMeHqHlPciAeTqgbSCvq0bH7xDXYVkLqgHlVF+kljmX5EwDSUJqxPAbUSER
	 0Z34xsg7ezS1DkLcFfYW2vmVJD2ecd6vUipE7kvEpXhJO3at1138U3QPWu0EO/yNNXjr+
	 EDj6p5/X5kIooPvy8ONyAMzqC3yPXv+V/a1Y8F05ShgXMoPMVLX3VxgcUZ1kL6eX9nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=JMKJiBBB;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD1606A330
	for <ntfs3@lists.linux.dev>; Mon, 23 Nov 2026 11:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CD1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=JMKJiBBB
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id AB2F21D4D;
	Mon, 23 Nov 2026 11:43:48 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=JMKJiBBB;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 1FE06F7;
	Mon, 23 Nov 2026 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795434184;
	bh=RDQ856W/7vi9HVTZL/n2XMOw1KHEzTqEagKJuAEXnRs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JMKJiBBBII7kXTvnmgmyN/hyzA+4TbvAhvxxFjYFw/Zm3u4KvhIGwLAm/+IHmz08L
	 f8AJwjSu2uWnA3jEfDdup1rVADpZj593Aac4YrOG/3RwFUN0wW4ZsUr7u1J0VA5sX0
	 BgJjZxi+qDVMZ3TcjeEokCKVfUMk/sY3SbSBU0VI=
Received: from [192.168.95.128] (172.30.20.204) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 23 Nov 2026 14:43:02 +0300
Message-ID: <f03f84d0-b90b-480f-923e-d9d3918b55b7@paragon-software.com>
Date: Mon, 23 Nov 2026 12:43:01 +0100
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
Subject: Re: [PATCH v2] fs/ntfs3: Refine the ni cleanup
To: Edward Adam Davis <eadavis@sina.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>
References: <20260827081556.168390-1-eadavis@sina.com>
 <20260827094340.174628-1-eadavis@sina.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260827094340.174628-1-eadavis@sina.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/27/26 11:43, Edward Adam Davis wrote:

> A failure to create a new inode triggered an issue [1] during inode
> reclamation because ni->base had not been initialized.
>
> Initialize ni->base earlier to ensure it can be reclaimed correctly.
>
> [1]
> KASAN: null-ptr-deref in range [0x0000000000000210-0x0000000000000217]
> RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
> Call Trace:
>   ni_clear+0x5d/0x630 fs/ntfs3/frecord.c:110
>   evict+0x624/0xb50 fs/inode.c:822
>   ntfs_new_inode+0x8c/0x120 fs/ntfs3/fsntfs.c:1719
>   ntfs_create_inode+0x6e7/0x3420 fs/ntfs3/inode.c:1520
>   ntfs_mkdir+0x37/0x50 fs/ntfs3/namei.c:234
>
> Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
> Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
> Tested-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
> v1 -> v2: unify email addresses
>
>   fs/ntfs3/fsntfs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 97c04ab2763a..e439ba59d999 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -1700,6 +1700,7 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
>   		return ERR_PTR(-ENOMEM);
>   
>   	ni = ntfs_i(inode);
> +	ni->base = ni;
>   
>   	err = mi_format_new(&ni->mi, sbi, rno, flag, false);
>   	if (err)
> @@ -1711,8 +1712,6 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
>   		goto out;
>   	}
>   
> -	ni->base = ni;
> -
>   out:
>   	if (err) {
>   		make_bad_inode(inode);

Hello,

Your patch is applied, thanks.

Regards,
Konstantin

