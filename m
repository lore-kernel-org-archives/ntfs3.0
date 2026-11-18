Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020462;
	b=LhxMSbamE+YEJD6gudzNFY1eWy2u/Moe9VOi8Y199YcNCxfEMq8/NAcgRhv9+2yVEnr0
	 MJtSMfaZUGesHBop/8SVjXHpb7mKv5j25uOtX3d9z5AVs5bqPLZesFupL1eCDRqhXVvQC
	 FgFiSVj7cb3Auucps+X/i6/if/BqIfcEZa8+n6GmyzStJ0tIwcdWJ9h6mUKrvNMEcIrCF
	 7uojUVFfi5fsxSIiD+ERW1WZdP7ASTjmx/12DfdY4bQlcfWm3WD0ahnnRl8tQP/mgKfMv
	 0RRK5SvnPSsrO6Fp4hOGlreie5Ovmg0xupFJWmto32tt9nFtQIvSS2iGmVoqKJHKhWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020462;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=5cYW0TR9tV134qZctJYpMdsgw91sglysq8a2/DPv0JE=;
	b=I0H57AIalRcnTWSFb9iLDOsihusUOgG4vUqDGK+veh7tebCluHMDl+sRErGolqF7c2tA
	 NDV/e39QUjaqF8+Ork5KuDJxebwZveanj907pmnGfL/9eqaYQ+40CvQTpjKpSg/wF69YT
	 k5BE9EFp2dF2iJ3l0OOZ0RKB4c9crqT05LqFrQMkNBJkP+QMGlnA0TFoNfkpakO7Uh7+W
	 hkD/GWv77mpC1efdsqYy1akNyX47q20L7jIbFX6y77vZg5hoWjchaycCcl57Ev7zd1K6a
	 jjWoQNJRGw1bDnzSmmcydAvR1XhCx1osrbhL7c+T7hKFMiJRt7y1c9pKmtWlIuMJtgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=dBS6KRKv;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900E1606A330
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=dBS6KRKv
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 1AACE1D42;
	Wed, 18 Nov 2026 16:48:23 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=dBS6KRKv;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id AE3DB217F;
	Wed, 18 Nov 2026 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795020459;
	bh=5cYW0TR9tV134qZctJYpMdsgw91sglysq8a2/DPv0JE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dBS6KRKv+UmEpl9O3r6L6/3oFdBJzJWpmN4GIWomQtrXIVwAmq4z87hUlnooidyXh
	 PlQZUixN+UBKBiSMgQ3sbfv47EeaYb7uwjtdJM18P68EF5xk7xPA0KcgAzQ7silQdh
	 1qyRLDJEgJJ3Hwd4YUCZszXrPFOKcZMqGlOJn7FE=
Received: from [192.168.95.128] (172.30.20.220) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 18 Nov 2026 19:47:38 +0300
Message-ID: <82a1d7b1-5eb9-43c9-a432-5c4054de330e@paragon-software.com>
Date: Wed, 18 Nov 2026 17:47:36 +0100
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
Subject: Re: [PATCH] ntfs3: fix INSERT_RANGE for resident data
To: <shakevsky@berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>
References: <20260830-ntfs3-submission-v1-v1-1-08f61d390cd2@berkeley.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260830-ntfs3-submission-v1-v1-1-08f61d390cd2@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/30/26 10:59, Alon Shakevsky via B4 Relay wrote:

> From: Alon Shakevsky <shakevsky@berkeley.edu>
>
> attr_insert_range() grows a resident data attribute before creating the
> hole. It then moves data with:
>
>    memmove(data + bytes, data, bytes);
>
> The move starts at offset zero and copies the insertion length. It should
> start at vbo and copy the bytes between vbo and the old end of the value. A
> valid insertion can therefore write past the MFT record allocation. KASAN
> reports a slab out-of-bounds write in attr_insert_range().
>
> attr_set_size() also sets i_size to the expanded size. The resident path
> adds the insertion length again after the copy. If attr_set_size() converts
> the value to nonresident storage, attr_insert_range() shifts the cluster
> mapping using the expanded size and then adds the length again. Both paths
> grow the file twice. The conversion path also leaves the original data at
> its old offset.
>
> An unprivileged user who can create files on a writable NTFS3 mount can
> reach the resident path by marking a file sparse while it is empty, writing
> resident data, and calling FALLOC_FL_INSERT_RANGE.
>
> Before resizing a resident value, check whether the expanded value will fit
> in its MFT record. If it fits, move the data from vbo, clear the new range,
> and keep the size set by attr_set_size(). Otherwise, return
> E_NTFS_NONRESIDENT so ntfs_fallocate() converts the original value before
> retrying the insertion.
>
> The new conversion path can fail while writing the cached data through its
> new mapping. Update i_blocks and mark the inode dirty in
> attr_force_nonresident() so the converted attribute does not leave stale
> inode accounting.
>
> Fixes: aa30eccb24e5 ("fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation")
> Cc: stable@vger.kernel.org
> Assisted-by: Antiproof:GPT-5.6-Sol
> Signed-off-by: Alon Shakevsky <shakevsky@berkeley.edu>
> ---
>   fs/ntfs3/attrib.c | 42 ++++++++++++++++++++++++------------------
>   fs/ntfs3/file.c   | 17 +++++++++++++++++
>   2 files changed, 41 insertions(+), 18 deletions(-)
>
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index b1c315206ffa..a16e0c259ab1 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -2589,35 +2589,37 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
>          down_write(&ni->file.run_lock);
>
>          if (!attr_b->non_res) {
> +               char *data;
> +               u32 used = le32_to_cpu(mi_b->mrec->used);
> +               u64 dsize;
> +
> +               dsize = ALIGN(data_size + bytes, 8) - ALIGN(data_size, 8);
> +               if (used + dsize > sbi->max_bytes_per_attr) {
> +                       err = E_NTFS_NONRESIDENT;
> +                       goto out;
> +               }
> +
>                  err = attr_set_size(ni, ATTR_DATA, ni->file.ads.name,
>                                      ni->file.ads.len, run, data_size + bytes,
>                                      NULL, false);
> +               if (err)
> +                       goto out;
>
>                  le_b = NULL;
>                  attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA,
>                                        ni->file.ads.name, ni->file.ads.len, NULL,
>                                        &mi_b);
> -               if (!attr_b) {
> +               if (!attr_b || attr_b->non_res) {
>                          err = -EINVAL;
>                          goto bad_inode;
>                  }
>
> -               if (err)
> -                       goto out;
> -
> -               if (!attr_b->non_res) {
> -                       /* Still resident. */
> -                       char *data = Add2Ptr(attr_b,
> -                                            le16_to_cpu(attr_b->res.data_off));
> -
> -                       memmove(data + bytes, data, bytes);
> -                       memset(data, 0, bytes);
> -                       goto done;
> -               }
> -
> -               /* Resident file becomes nonresident. */
> -               data_size = le64_to_cpu(attr_b->nres.data_size);
> -               alloc_size = le64_to_cpu(attr_b->nres.alloc_size);
> +               data = resident_data(attr_b);
> +               memmove(data + vbo + bytes, data + vbo, data_size - vbo);
> +               memset(data + vbo, 0, bytes);
> +               if (vbo <= ni->i_valid)
> +                       ni->i_valid += bytes;
> +               goto out;
>          }
>
>          /*
> @@ -2716,7 +2718,6 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
>                  attr_b->nres.valid_size = cpu_to_le64(ni->i_valid);
>          mi_b->dirty = true;
>
> -done:
>          i_size_write(&ni->vfs_inode, ni->vfs_inode.i_size + bytes);
>          ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
>          mark_inode_dirty(&ni->vfs_inode);
> @@ -2807,6 +2808,11 @@ int attr_force_nonresident(struct ntfs_inode *ni)
>                                      le32_to_cpu(attr->res.data_size),
>                                      &ni->file.run, &attr, NULL);
>          up_write(&ni->file.run_lock);
> +       if (!err) {
> +               inode_set_bytes(&ni->vfs_inode, attr_ondisk_size(attr));
> +               ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
> +               mark_inode_dirty(&ni->vfs_inode);
> +       }
>
>          return err;
>   }
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 2abf334bfa0c..e11b17f14087 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -617,6 +617,23 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
>                  ni_lock(ni);
>                  err = attr_insert_range(ni, vbo, len);
>                  ni_unlock(ni);
> +               if (err == E_NTFS_NONRESIDENT) {
> +                       ni_lock(ni);
> +                       err = attr_force_nonresident(ni);
> +                       ni_unlock(ni);
> +                       if (err)
> +                               goto out;
> +
> +                       err = filemap_write_and_wait_range(mapping, vbo_down,
> +                                                          LLONG_MAX);
> +                       if (err)
> +                               goto out;
> +                       truncate_pagecache(inode, vbo_down);
> +
> +                       ni_lock(ni);
> +                       err = attr_insert_range(ni, vbo, len);
> +                       ni_unlock(ni);
> +               }
>                  if (err)
>                          goto out;
>          } else {
>
> ---
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> change-id: 20260830-ntfs3-submission-v1-922a1af22503
>
> Best regards,
> --
> Alon Shakevsky <shakevsky@berkeley.edu>

Hello,

Sorry for the delay.
The patch was applied, thank you.

Regards,
Konstantin

