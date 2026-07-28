Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BF400969
	for <ntfs3@lists.linux.dev>; Tue, 28 Jul 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232406; cv=none; b=J0ncYIkP6LBh3nmZG/t5oVLIq0gSWKRNJK9XI/vtI5F7Og/ab+yT7liHnkDyMSV3ctIeYamhFqPm4MOk/Vgecr35sPYFIA02GZ25zX0iozNAVZ2M2gFKAwUl/xWl2eEDHzOuHFFXvgfnZtE4rR3hBGN2thG2iGu1spVG40+gvwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232406; c=relaxed/simple;
	bh=iGmBhhbi7mZycY7vp6CmShlRBAX+4vQyykfwBmHjEQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A1D86J8I4kGGhFcYq2b/Hl22MqgW5IJjN9W4GBlFzs8LG6I+pCiOshlwcCwUQWRI9iZsVrLgDlrSbIplzK/skZOOc1YUXjS2qxDYIdPRfxyecqjTA4OB43pZ0MJXyj43BpUZ1UIpV/EVs4BbELdwqeOVtGNT6vUJdZgD0/bkSbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Y9eV6xy3; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Y9eV6xy3"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 02FDC1D27;
	Tue, 28 Jul 2026 09:53:42 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Y9eV6xy3;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 17AEF21A9;
	Tue, 28 Jul 2026 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1785232397;
	bh=FvLnGtxR5TWNkshfIS3OwKTZcBwjJdEBI/lRxHziMh0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y9eV6xy3Y84Vlk5mCZOLYyJMZ04Pxzy8DXRS4v+MLc1gVEbglv28pfnbh4aGQo7Xl
	 C3ofncUvk6FfTyueLath21wHOdO8ZPWSNhkqIaJPqHITJ2tcCfAKkqJn4ciTt7KbHd
	 JytDsbHWhj91D7VgmJKxpPoeNoo6GB/z4E8WZkHE=
Received: from [192.168.95.128] (172.30.20.199) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 28 Jul 2026 12:53:16 +0300
Message-ID: <b73b306e-965f-4091-a27c-9a3b2af3c217@paragon-software.com>
Date: Tue, 28 Jul 2026 11:53:14 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix info-leak on partial LZNT decompress in
 ni_read_frame()
To: Samuel Page <sam@bynar.io>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260623190057.12351-1-sam@bynar.io>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260623190057.12351-1-sam@bynar.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/23/26 21:00, Samuel Page wrote:

> ni_read_frame() decompresses an LZNT $DATA frame into the vmapped target
> pages and then trusts decompress_lznt()'s return value:
>
>    unc_size = decompress_lznt(frame_ondisk, ondisk_size, frame_mem,
>                               frame_size);
>    if ((ssize_t)unc_size < 0)        err = unc_size;
>    else if (!unc_size || unc_size > frame_size)  err = -EINVAL;
>
> decompress_lznt() stops as soon as the compressed stream is exhausted
> (e.g. a zero chunk header) and returns the number of bytes it actually
> wrote, which may be far less than frame_size. The bytes between unc_size
> and frame_size are never written. The only memset() that follows zeroes
> the region beyond i_valid; when the frame lies entirely within the file's
> valid size that memset() does not run, so the gap retains whatever was in
> the just-vmapped pages. All pages are then marked uptodate and returned
> to userspace, disclosing uninitialized (recently-freed) kernel page
> memory. A crafted compressed file whose stream decompresses to only a few
> bytes leaks the remainder of every frame on a plain read(2), which is
> enough to recover kernel pointers and defeat KASLR.
>
> Zero the [unc_size, frame_size) tail immediately after a successful LZNT
> decompress so the remainder reads back as zero.
>
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> Cc: stable@vger.kernel.org
> Assisted-by: Bynario AI
> Signed-off-by: Samuel Page <sam@bynar.io>
> ---
> Reproduced on a non-KASAN, KASLR-enabled arm64 guest: a crafted file whose
> 64 KiB LZNT frames each decompress to 8 bytes leaks the [8, 65536) tail of
> every frame on a plain read(2) - up to ~3.3 MiB of uninitialized page memory,
> including kernel-text return addresses from freed VMAP_STACK pages, from
> which the KASLR base was recovered and verified vs /proc/kallsyms. With the
> patch the same read returns zeroes; a zeroed control image (valid_size
> truncated so the existing memset runs) leaks nothing, isolating the cause.
>
>   fs/ntfs3/frecord.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 7b035da63c12..cd11df75bdbc 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2443,6 +2443,15 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
>                          err = unc_size;
>                  else if (!unc_size || unc_size > frame_size)
>                          err = -EINVAL;
> +               else if (unc_size < frame_size) {
> +                       /*
> +                        * Partial decompress: zero the [unc_size, frame_size)
> +                        * tail.  decompress_lznt() leaves it untouched, so
> +                        * without this the freshly vmapped pages would expose
> +                        * uninitialized kernel memory to userspace.
> +                        */
> +                       memset(frame_mem + unc_size, 0, frame_size - unc_size);
> +               }
>          }
>          if (!err && valid_size < frame_vbo + frame_size) {
>                  size_t ok = valid_size - frame_vbo;
> --
> 2.54.0
>
Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

