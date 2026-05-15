Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47883E0244
	for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837293; cv=none; b=aMCyp3zy0jisHJuj6DcqhGF7GH6CayfYD+bivyxznEq5w8c4ftdu/gqZVSjNZ+t2Ye85FaIznfQO0v4WaRFuqy/3URcTzyckolh1XEKL7P6Y2CZ9NPiC+rKJnyjqMYZctA2iOuL4EBbwPPpGymU8f3z62JUkfezZYrh9OQE5+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837293; c=relaxed/simple;
	bh=3c6dmFF47YoYIdnJB4Vqg65dJ5erTxoXLqnf4zsENwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIIZJ789b9DIPC0ZxTxIInNtswyZcXCQyMy0n0oOxbUKM4XP+Pd2aUYdUVDABi3ilMRFVKZxKY1nvO2PFp1Ju3TNMX4aMtNk5emzqPxc7872yNt4v6nwT99eZywGEcVyiWlfdmu5jrSAts+o4DSI8WUnlqxnOEVGJobdslipG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC2KQAYF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC2KQAYF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-444826c16ffso7439776f8f.1
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778837290; x=1779442090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0RUESefHJBjw0XxP1BMz+QXpHyGbt/1AUqsv+mDzvQ=;
        b=aC2KQAYFdBUbvzk9VibjPBjqbwcUIxRCmDJB/yFvqg4bcrV3ahT020HpwyPmix38xt
         ry+l94JnyC9rZtobxmlCJWHnvsUf28zUPj1lBQOgoXvC5qGuRaHKcaZZ13fn18IPGOhR
         2DIHZjnaLECZWSfJjl3yH5ptHtU0QZ5DXTJWTjOg4lDxnXvBPSBoeNl9QxA6bbdNJQx2
         ODwLh2wXN/uOzFYiQjDfF9ln9MRoUd0VOQbjROrKYsWRoAPI0faml8xdBBoo13p5fanT
         uAJaRloeXoijGAbzjihovZ/nKsLc2J4DT8JOBnXBAG8UrR6UAa1EqjA+dvFOTR/yPCBF
         pQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837290; x=1779442090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0RUESefHJBjw0XxP1BMz+QXpHyGbt/1AUqsv+mDzvQ=;
        b=WU/T23XZj+Ur8mo2AUZDQG8MnrIpNryAM0NJx/lPRiBrMb9qrtxw59hG3g68IEbSrF
         uY5ufVXP9R+PBG9URoIV1g7t65ZjrO0iqAO9TWsWcYpXnLy/p/Th6E6VWaeBxecTloie
         YCrd3QNcTTtQsnA8ou5GfWwxlXGEtJpbLXi07fpPAxTIWEzGwb7nP1UBqyVcMq2wnU1n
         EuWC73ZWEkPopbDMhF/A8QSEisWRmjNBoPFoNhPle73hJY3vA7k9UZ+1NjrcyKjV4y/H
         IKlAjYJ0d5YREezq+6HUZaRlHW0/l6TC3olbrX1bpclNHMj7ukyw9yvPqf+REtauFl9n
         gKEg==
X-Forwarded-Encrypted: i=1; AFNElJ8RGQg5qzjWphQLUliRzgdRQjd/Q4IgdgIrNg4HTwB7h4eV3GKYUoyeTrEXpZo+bINtsdy0vA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ7hxFgtIQP3mVkXLdI9K9nQQ0enuFPIIuJKMuCaH4CwRBMRMa
	TPob84ABKJX/E/i/F0yq0Ytau2b8Bet70CQ/vgfCNQUF19Fv1hOYxuMI
X-Gm-Gg: Acq92OEj2/2F8VGwkR0ZeA6EKA9UPED/67IZi/QGEe7AdIX1aNObRlqiMN8fSoBcmOk
	3lfqcKhtVz4v9Z5ZBiFiExU6vC+ImMXVVybfez2nfy4TbkC4KdtzIR2Ww933v7aOS1YDemN0Ykq
	gkJ2L+MheDlI0CMPM8sna69sr3UMbvMuj2aYJZSAqs1sUWfx2Gt2phSijc1FjG1sdlXbIw1pKzY
	tm4jpIAXqbgEQ4O0N9fOeJSNUYZNySc54DiwSzb8TpJI7sdBaUpXovjEjeUDTLO0EyR/PaMwT0a
	df5kxNCBYhS5TvhoqX5kYnqH+jLUt+C9Dv4d7f/n2snig70Z1ullopFCYyAzyHo4z5LEKdqnVq1
	LMmBT8p77R4K1hYiFTiN4OGdkqQ4H1M1GNJ2lSKj5jscvTFAwKoev9qt+ZS8QRCOgRiEWe8/d/o
	7nbjM6r8jji/8jraA4Do+73sioGrfDlruTCmKEoswetUbkoY0iueTugSpFhqn+
X-Received: by 2002:a05:6000:2507:b0:451:68e0:c978 with SMTP id ffacd0b85a97d-45e5c30891emr4443874f8f.0.1778837290129;
        Fri, 15 May 2026 02:28:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767ee0sm12598982f8f.1.2026.05.15.02.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:28:09 -0700 (PDT)
Date: Fri, 15 May 2026 10:28:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: fra-build <zhanxusheng1024@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v4] fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
Message-ID: <20260515102808.14134e02@pumpkin>
In-Reply-To: <20260515082305.54624-1-fra@build.local>
References: <20260427035025.38158-1-zhanxusheng@xiaomi.com>
	<20260515082305.54624-1-fra@build.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 16:23:05 +0800
fra-build <zhanxusheng1024@gmail.com> wrote:

> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> In mi_enum_attr(), the start/end VCN validation for non-resident
> attributes is:
> 
> 	if (svcn > evcn + 1) goto out;
> 
> When evcn is U64_MAX the "evcn + 1" expression wraps to 0 and any
> svcn passes the check.  For evcn values close to U64_MAX (but not
> equal to it) the right-hand side is still a meaningless near-wrap
> upper bound, so a malformed on-disk attribute with svcn == 0 and
> evcn near U64_MAX can pass mi_enum_attr() unrejected.
> 
> VCN (virtual cluster number) is a cluster index, so any valid evcn
> is bounded by the volume's total cluster count, which ntfs3 holds
> in sbi->used.bitmap.nbits (set up in ntfs_init_from_boot() before
> any caller of mi_enum_attr() runs).  Reject evcn values that fall
> outside this range; this rejects all out-of-range evcn values,
> not just U64_MAX, and as a side effect prevents the "evcn + 1"
> wraparound entirely.
> 
> Fixes: 013ff63b6494 ("fs/ntfs3: Add more attributes checks in mi_enum_attr()")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: David Laight <david.laight.linux@gmail.com>

> ---
>  fs/ntfs3/record.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
> index 32bdb034c2a3..4379446bcf96 100644
> --- a/fs/ntfs3/record.c
> +++ b/fs/ntfs3/record.c
> @@ -202,7 +202,7 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
>  	u32 used = le32_to_cpu(rec->used);
>  	u32 t32, off, asize, prev_type;
>  	u16 t16;
> -	u64 data_size, alloc_size, tot_size;
> +	u64 svcn, evcn, data_size, alloc_size, tot_size;
>  
>  	if (!attr) {
>  		u32 total = le32_to_cpu(rec->total);
> @@ -310,8 +310,17 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
>  	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
>  		goto out;
>  
> -	/* Check start/end vcn. */
> -	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
> +	/*
> +	 * Check start/end vcn.  evcn must be a valid cluster index, i.e.
> +	 * less than the volume's total cluster count (sbi->used.bitmap.nbits);
> +	 * rejecting it here also keeps "svcn > evcn + 1" meaningful, since
> +	 * evcn == U64_MAX would wrap "evcn + 1" to 0.  svcn does not need
> +	 * its own bound: once evcn < nbits, "svcn > evcn + 1" implies
> +	 * svcn <= nbits.
> +	 */
> +	svcn = le64_to_cpu(attr->nres.svcn);
> +	evcn = le64_to_cpu(attr->nres.evcn);
> +	if (evcn >= mi->sbi->used.bitmap.nbits || svcn > evcn + 1)
>  		goto out;
>  
>  	data_size = le64_to_cpu(attr->nres.data_size);

