Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E72466B4A
	for <ntfs3@lists.linux.dev>; Wed, 29 Jul 2026 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323362; cv=none; b=E8jdgH+w5rxLBELujig5BgCGKazyJKSqNKH7WtQ1C583HIG3qUl3sA2VtYPQbTbBfGByy89sbWX1/ULUT5rgI/a2YxIRPQVOl+iSFY0NtqbMrfvuM+Ep2b5xTNer+V7Nun6417ItYhPtcI2uLJVuLleiNyqujVdNBDLJ6Qc6Hzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323362; c=relaxed/simple;
	bh=oQoUIOQ7JhVA6M5jWd5Y03ToKxVbPEdy3bMCfHIdREU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p8derfAEnlWdJRSHalNNMkjCYGPoV0NpfvtEAEDG5FCsqW4H0qvgwu0znMpIBuhaAFzUw40s3njlzz3JapRAEW2JavghYal0UOHJC/+oia02TqR/VC1HwTF7V/FRAB1TY29zbVE6McVIFhQsTnpaGpxoX2sb6A70XAosCIT7Ry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=U2NE6sbn; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="U2NE6sbn"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id BED3B1D3A;
	Wed, 29 Jul 2026 11:09:43 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=U2NE6sbn;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 9F80C21D1;
	Wed, 29 Jul 2026 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1785323357;
	bh=EmwDtFYp2UfDYhMgW1J+Zed3I+8X/5EXsPDHIC8nc70=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U2NE6sbnjJVHyIllOAcRWH32F/W59IktqNbk+DS9qunoV9w6MvibuhYmQ+XGYES+k
	 7MHBsjQlpr/1Dwj/mgYgxYs1s5XFMysr7Sd0FM9r7ve0qglCEfvYXYe5QAR4JH4EIK
	 6q74YS1DtNyYcb1bOCw54fzeYInMp4s3PlzQQUhk=
Received: from [192.168.95.128] (172.30.20.211) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 29 Jul 2026 14:09:16 +0300
Message-ID: <180172de-9abd-43e3-83dd-170bf9596c7a@paragon-software.com>
Date: Wed, 29 Jul 2026 13:09:15 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] fs/ntfs3: fix out-of-bounds page_lcns[] access on
 log replay
To: Xiang Mei <xmei5@asu.edu>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Weiming Shi
	<bestswngs@gmail.com>
References: <20260617231343.403432-1-xmei5@asu.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260617231343.403432-1-xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/18/26 01:13, Xiang Mei wrote:

> While mounting a crafted NTFS image, log_replay() can index a dirty page
> entry's page_lcns[] array out of bounds. The array length is the on-disk
> lcns_follow field, which is never validated against the space actually
> available, so several replay paths read and write past the entry. There are
> two independent ways the index goes out of range, so the fix is split into
> two patches:
>
>    1/2 - The entry's own lcns_follow (from the on-disk dirty page table) is
>          not bounded against the entry size. check_dp_table() rejects any
>          such entry once, right after check_rstbl(), so every consumer can
>          trust lcns_follow as the real capacity. This closes the HotFix store
>          and the v0->v1 conversion memmove:
>
>            BUG: KASAN: slab-use-after-free in log_replay+0x55be/0xbbd0
>            Read of size 8 at addr ffff88800dbb28b8 by task mount
>            Call Trace:
>             kasan_report+0xce/0x100
>             log_replay+0x55be/0xbbd0
>             ntfs_loadlog_and_replay+0x4a4/0x5c0
>             ntfs_fill_super+0x2252/0x4570
>             get_tree_bdev_flags+0x373/0x5f0
>             vfs_get_tree+0x91/0x360
>             path_mount+0x75a/0x2120
>             __x64_sys_mount+0x298/0x310
>
>    2/2 - In the copy_lcns loop and the redo shorten loop the index is driven
>          by the *log record's* lcns_follow, which is checked only against the
>          record length, not the target entry. dp_range_ok() bounds the run
>          against the entry before each loop:
>
>            BUG: KASAN: slab-out-of-bounds in log_replay+0xb7e0/0xbbe0
>            Write of size 8 at addr ffff88800fff1518 by task mount
>            Call Trace:
>             kasan_report+0xce/0x100
>             log_replay+0xb7e0/0xbbe0
>             ntfs_loadlog_and_replay+0x4a4/0x5c0
>             ntfs_fill_super+0x2252/0x4570
>             get_tree_bdev_flags+0x373/0x5f0
>             vfs_get_tree+0x91/0x360
>             path_mount+0x75a/0x2120
>             __x64_sys_mount+0x298/0x310
>            The buggy address is 0 bytes to the right of a kmalloc-2k object.
>
> Both are present since ntfs3 was first added (v5.15) and are reachable from
> an unprivileged mount of a removable device on systems that allow it.
>
> The two patches address distinct untrusted inputs (entry capacity vs. log
> record count): 1/2 alone does not cover the record-driven loops fixed in
> 2/2. Verified with two KASAN reproducers that mount a malformed image, one
> per patch:
>
>    reproducer   without fix   1/2 only   1/2 + 2/2
>    ----------   -----------   --------   ---------
>    hotfix       crash         fixed      fixed
>    copy_lcns    crash         crash      fixed
>
> The reproducers and crash logs will be sent as a follow up email.
>
> Xiang Mei (2):
>    fs/ntfs3: validate dirty page table on log replay
>    fs/ntfs3: bound page_lcns[] index by the log record
>
>   fs/ntfs3/fslog.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 40 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
Hello,

Your patches were applied, thank you.

Regards,
Konstantin

