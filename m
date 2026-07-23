Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8F4C956B
	for <ntfs3@lists.linux.dev>; Thu, 23 Jul 2026 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813682; cv=none; b=tC4r9mo8EDBldpVAyV7nix18w54+DK9GeaJA9fs7NPAWidua2ngyDfpNeb1q6leIxdXep8+MPU18Kk0atZJ9XJsT3epRRSLq0lP6VWD9S0+ngL42eZLbddTcxp9ymssix7iw5C86zQ45e7CRguQKXcoYVRTV7ILZ6+KFrCpueQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813682; c=relaxed/simple;
	bh=9FtWEIFpG6tgAt9b1D96McFiFcC5UkdGeZtbKvTQN/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIjZ3iuCqCRMFRqEHGFcFcO/TdYeIHmerhAQKbKtOFQKU3rxFbe7SEdrVJwj7bhzOSzrrm7MASAFJai0o2c+cYpGzDNlCVRj2sIGPeu/miH5rabSy5gX+TxeNbqMJbKBIHmS69zO7G8kBJZVkCsz+a6bS3kB/z2pb2S/E2uifGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=EbXbS1ck; arc=none smtp.client-ip=195.121.94.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="EbXbS1ck"
X-KPN-MessageId: 16cb8ce6-869b-11f1-b2a8-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 16cb8ce6-869b-11f1-b2a8-005056abbe64;
	Thu, 23 Jul 2026 15:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=KpSvR4S//zefD0DiSj6pXOmDH269uZ752U7/HQff830=;
	b=EbXbS1ckK77vWxJ5HZTDioRKFlI/ABX7kkQ7wFAraYoNi2COrQ8cZkiXhrCp44xQQPZn6FgUyu/ed
	 BiQlJXTMIQydBf5ZMOMJNHane9aa931OG/8SZ+ZB4r8pPGsgQj39vfEz2gytv8BBxEO86hklMgriLa
	 XbOCavhksDmWl3GdnXFCoP+yKK1gtP6vuFTRHs9qL6U4CWz6Rotev9m9DnNzBFPdSZzpQ08lJr5adw
	 5s8P6yQaM3BUclBwachqkNmZXxLq904snxJTM9Vi0xCaJy5l7qwPharpq75OvFvb6Wyb2O8r/d5CX+
	 URq4AqhzWswwKqbSCH7RNfW2sDe9FUA==
X-KPN-MID: 33|Qm6/PpGqQ6OPlQ8r2Gzj4JR448pMebRMmWIJiKdAYyDRIa0iO9s0WvKpu6NRhCw
 nGVHqBSoaxUAfTSzW0R2WcXzVgZAVM2HsJfOnKC0MrMo=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|MzMuqFopoN+46ZeGm+TkZbqyqnsOxOcc8IJUgXUqq//1sivcpbmryjrkv1s2DEB
 lDaYcCKx7PoPSAxkSprlx1A==
Received: from localhost (unknown [178.231.6.187])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1696ed04-869b-11f1-a8b6-005056ab7447;
	Thu, 23 Jul 2026 15:33:28 +0200 (CEST)
Date: Thu, 23 Jul 2026 15:34:55 +0200
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Vidhu Sarwal <vidhu.linux@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] fs/ntfs3: prevent positive E_NTFS_NONRESIDENT from
 reaching writeback error handling
Message-ID: <amIXogW-sKfOhuxO@daedalus>
References: <20260713084140.249515-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713084140.249515-1-vidhu.linux@gmail.com>

On Mon, Jul 13, 2026 at 02:11:40PM +0530, Vidhu Sarwal wrote:
> attr_data_write_resident() returns the internal positive status code
> E_NTFS_NONRESIDENT when the DATA attribute becomes non-resident.
> ntfs_writepages() propagates this value into generic writeback error
> handling, which expects a standard negative errno and triggers
> WARN_ON_ONCE(err > 0).
> 
> Translate positive E_NTFS_* status codes to -EIO before recording
> the writeback error. This prevents positive internal status codes from
> reaching generic writeback code while preserving the existing behaviour
> of treating this path as a writeback error.

Should attr_data_write_resident() be returning positive values on error?
If this is correct, and this is a matter of data corruption you can use
EFSCORRUPTED (EIO may also be fine if this is what NTFS uses in other
places).

Thanks,
Jori.

> 
> Reported-by: syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
> Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
> ---
> RFC:
> 
> I'd appreciate guidance on whether -EIO is the appropriate errno here.
> 
> E_NTFS_NONRESIDENT indicates that the DATA attribute became
> non-resident during writeback. Translating it to -EIO prevents the
> positive internal status code from reaching generic writeback code and
> preserves the existing behaviour of treating this path as a writeback
> error.
> 
> However, if the intended behaviour is to retry the write using the
> non-resident path instead of failing it, then the correct solution would
> be more than a simple errno translation. The proposed change assumes the
> current terminal-error behaviour is intentional.
>  fs/ntfs3/inode.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 0c9bd669117d..9458867c6b0b 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1019,6 +1019,15 @@ static int ntfs_writepages(struct address_space *mapping,
>  
>  			folio_unlock(folio);
>  			if (err2) {
> +				/*
> +				 * attr_data_write_resident() can return the
> +				 * positive internal code E_NTFS_NONRESIDENT;
> +				 * both mapping_set_error() and writeback_iter()
> +				 * need a negative errno and warn on a positive
> +				 * value.
> +				 */
> +				if (err2 > 0)
> +					err2 = -EIO;
>  				mapping_set_error(mapping, err2);
>  				if (!err)
>  					err = err2;
> 
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> -- 
> 2.53.0
> 
