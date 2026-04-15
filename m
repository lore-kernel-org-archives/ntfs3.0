Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2A3D9DBC
	for <ntfs3@lists.linux.dev>; Wed, 15 Apr 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268779; cv=none; b=hCTd/5Iw3CJL0I/l7Zv2R85GSfVnUo3QM3WH1RWEeuUwDXV363vO7IJLazqehJ+2kSLkaXqBuxwC+/ZRkI1xIHX4+ICcsf4e42y32qECrReOT4U10SaImra870abr9SIR3IdskX1SEaxta6Gsj4hROtWkxNqKecBWHGrne7r6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268779; c=relaxed/simple;
	bh=CQdpMTVreezzkMhBq4Je3snBNy62eJaJgYki7U0+DdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jb2ncArmHyboWPdo+l+h241CmKgdHeb7tOnk4RJkyhmzb8E5WPitSRDmcBj9XMk+x4SIoznHx7JzGlqc7GctVOvofxwydh5y3/LC0dgLXekmBmHg2zleeFR66sXni0qcIFXmyfeUfYtdDKtC+NrMrTYJOJaBG3GWL02M6ZeUjxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=UbW35k02; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="UbW35k02"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D13D11D3B;
	Wed, 15 Apr 2026 15:59:46 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=UbW35k02;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 1BE602135;
	Wed, 15 Apr 2026 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1776268776;
	bh=zFDF6iZcTz7FKypxaeBW24DoTe3uZseMR2OytmXoAbw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UbW35k02XL7hN4jL6IKFX7sd78NcBuLwLaf0/DtwQJWFbt0k+hzMQVVtnjARBvJnQ
	 /qWM9x1MxkZFQWOvlYGmaIh5SffZ6TIQWbxyHEETAj7EFnte15hkeN1j3olWg5WnNR
	 cvD04nc+ll58CRlATIr6JmHLPszJqS1Tos44MHig=
Received: from [192.168.95.128] (172.30.20.171) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Apr 2026 18:59:35 +0300
Message-ID: <be2e2d0e-8ca6-4151-a78e-2b85f1bf1e93@paragon-software.com>
Date: Wed, 15 Apr 2026 17:59:33 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] fs/ntfs3: add delayed-allocation (delalloc) support
To: Dan Carpenter <error27@gmail.com>
CC: <ntfs3@lists.linux.dev>
References: <adiR_6B7IpUDjGSh@stanley.mountain>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <adiR_6B7IpUDjGSh@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/10/26 08:00, Dan Carpenter wrote:

> Hello Konstantin Komarov,
>
> Commit 10d7c95af043 ("fs/ntfs3: add delayed-allocation (delalloc)
> support") from Feb 16, 2026 (linux-next), leads to the following
> Smatch static checker warning:
>
> 	fs/ntfs3/frecord.c:3303 ni_allocate_da_blocks_locked()
> 	error: uninitialized symbol 'err'.
>
> fs/ntfs3/frecord.c
>      3268 int ni_allocate_da_blocks_locked(struct ntfs_inode *ni)
>      3269 {
>      3270         int err;
>      3271
>      3272         if (!ni->file.run_da.count)
>      3273                 return 0;
>      3274
>      3275         if (is_sparsed(ni)) {
>      3276                 CLST vcn, lcn, clen, alen;
>      3277                 bool new;
>      3278
>      3279                 /*
>      3280                  * Sparse file allocates clusters in 'attr_data_get_block_locked'
>      3281                  */
>      3282                 while (run_get_entry(&ni->file.run_da, 0, &vcn, &lcn, &clen)) {
>
> Do we always enter this loop for at least on iteration?  Otherwise ...
>
>      3283                         /* TODO: zero=true? */
>      3284                         err = attr_data_get_block_locked(ni, vcn, clen, &lcn,
>      3285                                                          &alen, &new, true,
>      3286                                                          NULL, true);
>      3287                         if (err)
>      3288                                 break;
>      3289                         if (!new) {
>      3290                                 err = -EINVAL;
>      3291                                 break;
>      3292                         }
>      3293                 }
>      3294         } else {
>      3295                 /*
>      3296                  * Normal file allocates clusters in 'attr_set_size'
>      3297                  */
>      3298                 err = attr_set_size_ex(ni, ATTR_DATA, NULL, 0, &ni->file.run,
>      3299                                        ni->vfs_inode.i_size, &ni->i_valid,
>      3300                                        false, NULL, true);
>      3301         }
>      3302
> --> 3303         return err;
>
> err would be uninitialized
>
>      3304 }
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter

Hello,

Thank you. The warning was fixed by the patch:
https://lore.kernel.org/ntfs3/20260415155413.26884-1-almaz.alexandrovich@paragon-software.com/

Regards,
Konstantin

