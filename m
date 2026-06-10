Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C97402B96
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088170; cv=none; b=WPl5BcfHDqhbIKBreoZThRVfQr4tK2aij8TZ92Z26rih1czuuvcy+doJmkKOQxY9mwlkAog7KDS6l98mPDgPQm+bHGBDgRa1+kPgadnA/c1Wsyxn9HXbhOUpiMfnMraqu/2YarhNeagSEQbN9LG0HnJhSC6FnfJv3vHr7T+/Yps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088170; c=relaxed/simple;
	bh=/ojnyA8zMv2FXADu9HUEkgyOtH29xHb9VQDsGnkKzwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F54QaVFXIqAPDutH7tN5lUcwCkmOt6faFB/T52DOYFcMfa+udu/Krp6HhYFm2iWskN35ST2ShFKvGPuLEZZ1lTYGNQ+NwXF03qSg8uRgOIsQynLhZOAWPAbEEQVbB/q4l0jY45a7MyPGhbMmVA66S0Kp4ptkaImkRRkLAThWmq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=VrzFQYj6; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="VrzFQYj6"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 93B6F1D44;
	Wed, 10 Jun 2026 10:42:36 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=VrzFQYj6;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B19211E0F;
	Wed, 10 Jun 2026 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1781088152;
	bh=4DNVFJKdEUULyP/x7BrDJy5Ao0lPnouyi/n9WfsGULI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VrzFQYj6YsjuROVbVk2iAyAoG3FXme0Qeb47C6HgOspJ/LPN/UQXCnF7q+SEvcbwg
	 LMUtg5NrAGvwramCx9/BjKD2RI++nfXX9uI0ig5GefGsaIFNo9JZoHMu5aWKfYPSja
	 VOQdgL8x9IQ2kPfWh0NG3uL/VLVD3e2V4Wt15Sgw=
Received: from [192.168.95.128] (172.30.20.172) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 10 Jun 2026 13:42:31 +0300
Message-ID: <c506bdba-5c76-4769-b2e5-17ee9fae490a@paragon-software.com>
Date: Wed, 10 Jun 2026 12:42:30 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: reject direct userspace writes to reserved $LX*
 xattrs
To: Zhen Yan <sdjasjbuaa@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <aiP-42fhOyMGK8Yg@1wt.eu>
 <20260607023339.6728-1-sdjasjbuaa@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260607023339.6728-1-sdjasjbuaa@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/7/26 04:33, Zhen Yan wrote:

> NTFS3 uses $LXUID, $LXGID, $LXMOD and $LXDEV as internal WSL
> permission metadata and reloads them into i_uid, i_gid and i_mode
> from ntfs_get_wsl_perm().
>
> Because the empty-prefix xattr handler also lets file owners call
> setxattr() on these names directly, an unprivileged writer on a
> writable ntfs3 mount can plant root ownership and S_ISUID on their own
> file and gain euid 0 after inode reload.
>
> Reject direct userspace writes to the reserved $LX* names. Internal
> ntfs3 metadata updates are unchanged because ntfs_save_wsl_perm()
> writes them via ntfs_set_ea() directly.
>
> Signed-off-by: Zhen Yan <sdjasjbuaa@gmail.com>
> ---
> Willy, thanks for the review. Replying to your points:
>
>   - Tested on v7.1-rc5: builds clean (W=1, no warnings), checkpatch
>     clean, and the original reproducer no longer triggers -- the
>     setxattr() calls now return -EPERM and uid/gid/mode survive an
>     inode reload. Internal WSL metadata is unaffected:
>     ntfs_save_wsl_perm() writes via ntfs_set_ea(), not ntfs_setxattr().
>   - Resent via git format-patch / git send-email so whitespace is no
>     longer mangled, with no PoC in the body and security@ dropped.
>
>   fs/ntfs3/xattr.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9eeac0ab2..0bc633025 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -851,6 +851,14 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>          return err;
>   }
>
> +static bool ntfs_is_reserved_lxattr(const char *name)
> +{
> +       return !strcmp(name, "$LXUID") ||
> +              !strcmp(name, "$LXGID") ||
> +              !strcmp(name, "$LXMOD") ||
> +              !strcmp(name, "$LXDEV");
> +}
> +
>   /*
>    * ntfs_setxattr - inode_operations::setxattr
>    */
> @@ -955,6 +963,11 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>                  goto out;
>          }
>
> +       if (ntfs_is_reserved_lxattr(name)) {
> +               err = -EPERM;
> +               goto out;
> +       }
> +
>          /* Deal with NTFS extended attribute. */
>          err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0,
>                            NULL);
> --
> 2.25.1
>
Hello,

Your patch was applied with small modifications - added a check on non
privileged users in if-statement. Thanks for the patch.

Regards,
Konstantin

