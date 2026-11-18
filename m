Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020436;
	b=X5yDBxca3TipobEQC5NNjmnQj9B0PsnCy2kv3i00rIVlZI05yuEUvVtn8Fh6R4M6D7Nz
	 /Vbo8e22sHtXGdz581i2+h2GqtU/OLI5KdOUzeZsP2SsKDHKEFlnu0SLaoLJEgKL7+drY
	 bDgYYzcK8ZKZyy+2KLjHIDRJQ80p9ITcMVcCHHFQpGR1wlKxkXG1ynwYszaNXsTavJFy/
	 kqgwZu87gx4yY41ta8I3qdE+c5LIWGNFObuWMIgGiU1J999LkorTCVMxuSm1Rb9/Rt2xl
	 yEZUWHBsA0bz0lbE+0w4iwH6ZQT4a3IxepwN3fpIE44HfEpD6OBopKQ/5oVfBZ6oZPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020436;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=m7HJPKZjOaKBrKE2FvJlU85AYyo3fRGYNdlW0jrYWVM=;
	b=XPWnuvNw8Nsezv2volCz1/hpLZXMZQ30T9u0vKf3neEcoAp2YCqx/xO6d/0H7svpoyva
	 Y0wMvo+u/srX2TS/EZr2QheOUoug46IyXvBJt64cq0mCg0nYKZWnMYu/B8MkojUkdipso
	 go60n7GHeT3lWTx0TCpi3QPMf4IhETgBnZeJZH7xDamAWIXTaHX6gZDecuIe7dfvgoqY4
	 Y9d1btk/NSd+E4Ycl6AHV3nCq6NWvflBQzerSVTF8ZZxWtBixa/JBsc+RGt4apKVkpSsm
	 pNLp0gsFM4aKTXUINQwaIRdykfBBHpq7vKMWkEVlSgSayD3bjFKstUwZsYJBOfRuBAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=TNEZDqRA;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB7606A31C
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 16:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=TNEZDqRA
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 409BE1D38;
	Wed, 18 Nov 2026 16:47:51 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=TNEZDqRA;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C86CE217F;
	Wed, 18 Nov 2026 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795020427;
	bh=m7HJPKZjOaKBrKE2FvJlU85AYyo3fRGYNdlW0jrYWVM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TNEZDqRANCiCAcKHl5I+BGAVQrD0DQQhNFLkpSapLGxvvlOJiX3XXpoQgzZQilvAv
	 EyTrDv3EnnU4Heagz4li9Pk+CQVz85i895TtHkt4bcGe3YR9OKwHI5dY/IyVr2jdrx
	 bFJFlSvvCtwZ1OFYXXO14tXo6eWrmK1v5IMUZd7c=
Received: from [192.168.95.128] (172.30.20.220) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 18 Nov 2026 19:47:06 +0300
Message-ID: <869e98bb-1650-4b7e-9bd1-f7d60fac0a78@paragon-software.com>
Date: Wed, 18 Nov 2026 17:47:04 +0100
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
Subject: Re: [PATCH] ntfs3: add permission checks for NTFS system attributes
To: Hongling Zeng <zenghongling@kylinos.cn>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhongling0719@126.com>, <stable@vger.kernel.org>
References: <20260820085526.169144-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260820085526.169144-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/20/26 10:55, Hongling Zeng wrote:

> ntfs3_setxattr() allows system.dos_attrib, system.ntfs_attrib, and
> system.ntfs_attrib_be to update NTFS file attributes without permission
> checks. These attributes affect the inode mode because the READONLY flag
> is mapped to write permission bits, allowing unprivileged users to bypass
> file access controls.
>
> system.ntfs_security allows modifying NTFS security descriptors which
> control access control. Similar to POSIX ACLs where file owners can
> modify access permissions, require inode owner or CAP_FOWNER for these
> NTFS system attributes.
>
> Fixes: 4534a70b7056 ("fs/ntfs3: Add headers and misc files")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   fs/ntfs3/xattr.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 7a81369a1173..4e41aca0d5c7 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -868,6 +868,22 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>   	struct ntfs_inode *ni = ntfs_i(inode);
>   	enum FILE_ATTRIBUTE new_fa;
>   
> +	/*
> +	 * system.dos_attrib and system.ntfs_attrib affect file permissions
> +	 * because the READONLY flag is mapped to write permission bits.
> +	 * system.ntfs_security controls NTFS security descriptors.
> +	 *
> +	 * Require the caller to own the inode or hold CAP_FOWNER before allowing
> +	 * these NTFS system attributes to be changed.
> +	 */
> +	if (!strcmp(name, SYSTEM_DOS_ATTRIB) ||
> +	    !strcmp(name, SYSTEM_NTFS_ATTRIB) ||
> +	    !strcmp(name, SYSTEM_NTFS_ATTRIB_BE) ||
> +	    !strcmp(name, SYSTEM_NTFS_SECURITY)) {
> +		if (!inode_owner_or_capable(idmap, inode))
> +			return -EPERM;
> +	}
> +
>   	/* Dispatch request. */
>   	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
>   		if (sizeof(u8) != size)

Hello,

Your patch is applied, thank you.

Regards,
Konstantin

