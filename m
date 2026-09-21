Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7318481238
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988128; cv=none; b=ifoCGOWKAv564AZ+aGldvvqLKtDsolHESAQLEQ1CdFrH5SKGmaubgFnh2tSS2cKgyqVkUtKJ++BLIhM1dfz3hXXP9X86WH/fmtdgZ04Eetcwe1XyklQMSIEGeCBg9I9Nu8xh6/LKsP6HWbjjc53Bt+gm9TDLrYBoCukX/UsN6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988128; c=relaxed/simple;
	bh=s5cmHaiP+c725pWs9K8HabYM5f7rZ8sldnF7whvKZnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CjkwsTxCTT1+EYsxXLdHkH/g6CdVWKTebymPpqH6QtwneSAFMnUGhMUBGd1vTuoGLRjuZzWbxWoE+urB1s7sTcbZuA9DXSCPVC3JaTC7RRnc6sLf1+dR6xlWGhFhlHArB38DK/P2b19iCxV7seTgq5Nbf1M79x3sTEGj1OG4Lkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=g0FqEh0j; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="g0FqEh0j"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D50301D09;
	Mon, 21 Sep 2026 10:56:19 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=g0FqEh0j;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 023F92135;
	Mon, 21 Sep 2026 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789988125;
	bh=7Lu8Tt4KmrI7x8rygslVMM2EIDyJkSCFHg6IgTzXuLU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=g0FqEh0j74/WJjrwhLzr6s3BPUOOpfHR9ryeK33KOkbN3Dig++LWVSxH5AT/xopWj
	 tTapwT2QGb2liz79tzBj4n3SAzRO9lM90TluSVV8OqTF3JmV1BvvtEQacUTTU7atZ4
	 4gcnOo3VnAjFFC/eykLbYzRZCoTRvS6vQkxOpGQ8=
Received: from [192.168.95.128] (172.30.20.147) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 21 Sep 2026 13:55:23 +0300
Message-ID: <58801f27-bf38-474e-be74-c74d3473d446@paragon-software.com>
Date: Mon, 21 Sep 2026 12:55:22 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: check INDEX_ROOT resident size before use in
 ntfs_read_mft()
To: "Xiang Mei (Microsoft)" <xmei5@asu.edu>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<AutonomousCodeSecurity@microsoft.com>, <tgopinath@linux.microsoft.com>,
	<kys@microsoft.com>
References: <20260707015440.3420673-1-xmei5@asu.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260707015440.3420673-1-xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/7/26 03:54, Xiang Mei (Microsoft) wrote:

> When ntfs_read_mft() parses an ATTR_ROOT attribute it computes
>
> 	root = Add2Ptr(attr, roff);
>
> using the on-disk resident data offset (roff = attr->res.data_off) and
> then dereferences root->type and root->rule, and later passes root on to
> indx_init(). Unlike the ATTR_STD and ATTR_NAME cases, which validate that
> the resident data is large enough (asize >= sizeof(struct X) + roff and
> rsize >= sizeof(struct X)) before accessing it, the ATTR_ROOT case has no
> such check.
>
> mi_enum_attr() only guarantees data_off + data_size <= attribute size, so
> a crafted image can set data_off such that root lands at (or past) the end
> of the MFT record's slab allocation while still passing that check (e.g.
> data_size == 0). The subsequent read of root->type is then a
> slab-out-of-bounds read, reported by KASAN when mounting the image:
>
>    BUG: KASAN: slab-out-of-bounds in ntfs_iget5 (fs/ntfs3/inode.c:283)
>    Read of size 4 at addr ffff88800c06a400 by task exploit/142
>    Call Trace:
>     ...  [KASAN report internals]
>     ntfs_iget5 (fs/ntfs3/inode.c:283 fs/ntfs3/inode.c:542)
>     ntfs_fill_super (fs/ntfs3/super.c:1690)
>     get_tree_bdev_flags (fs/super.c:1634)
>     vfs_get_tree (fs/super.c:1694)
>     fc_mount (fs/namespace.c:1198)
>     path_mount (fs/namespace.c:3765 ...)
>     __x64_sys_mount (fs/namespace.c:4174 ...)
>     do_syscall_64 (arch/x86/entry/syscall_64.c:63)
>     entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    The buggy address is located 0 bytes to the right of
>     allocated 1024-byte region [ffff88800c06a000, ffff88800c06a400)
>     which belongs to the cache kmalloc-1k of size 1024
>
> Validate the resident data size in the ATTR_ROOT case the same way the
> neighbouring cases do, so that a truncated or mis-offset INDEX_ROOT is
> rejected before root is dereferenced.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Reported-by: AutonomousCodeSecurity@microsoft.com
> Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> ---
>   fs/ntfs3/inode.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index c43101cc064d..efb6a855c5ad 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -271,7 +271,9 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   		break;
>   
>   	case ATTR_ROOT:
> -		if (attr->non_res)
> +		if (attr->non_res ||
> +		    asize < sizeof(struct INDEX_ROOT) + roff ||
> +		    rsize < sizeof(struct INDEX_ROOT))
>   			goto out;
>   
>   		root = Add2Ptr(attr, roff);

Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

