Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662924C81
	for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 18:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501070; cv=pass; b=qV5A3cPtPEcH1cFxrJU++SD7lgeSFbqidEmPHW/W7WEXiGjq5Kt3SWl8RkVOzpWoxmWpktCQi2cYStDYULMC4Ks9++Dr0g0z/kGD9qrRCWwk77xOZc5fTGKrawnFF3JKR4uqEmQFrzIWQf7xUL/fsGISu+nd9gOUpgu9q8FBsrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501070; c=relaxed/simple;
	bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2lwoU82V071XbC7vbtit8lye8o4ELPpNcWxh1CBkvSZO75elLWZ3qRMfwqSFCvgAFxj9Uan1TByqewt8VlAUFTdK99SaE9nD/iXLslg+t0UMLixNMOi9wL6kFURI3fQziVqmdgBBAxXDaOCeP02JKM+PPWKGaErvAKRm9hPU44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLi6yUR1; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLi6yUR1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so1674492a12.1
        for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 10:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768501067; cv=none;
        d=google.com; s=arc-20240605;
        b=i9lltKBDR96Ym2A7qxx1Kbr7MRp442anMSy3t2LR+0zoxvHGGtQH4EARu8w4AHyJze
         hmvjylJ8bgrssLlMstF/Y75Vj952uG0Q8duQZG+8Q4p/+Q+iu8V1nLJ4keRvtB8QoHYA
         zLDTalk4K235zCG0Jo9Ibj/ULPpQRMzBE3/dke5H5TgxU0OR5OOGal8fc6f3gAkRicQF
         1JL0/wqTi/+Y/Ga8zidsQEs5Vtd1Kx/Fc15gevo00fUMrP7FesP2TwtO+KMB0BRPnTwp
         yQGyhwFxC31qMRCnUr+fo2Jt2aIvgbqDmOSmemTGwiOHTpFyohogqV7wiwKNxuT5W8yn
         iF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
        fh=oJFuK9Ot7lOeGGDLHCRCygKHgRdKK7h6KzM8BCQ5bFo=;
        b=Q0fSI15sJUVy1ckGwlPghGy209QeCTIeGEtGOMxHQtVFmc7GfdUy3hm2UrECPoTLxQ
         U+E0kIhU9nmXLqmV/qNU05ElfPssyu5MJyRg7chCZcIvPhqYtJOUiBTNMQVbt8wYkFDr
         YojFmDXOCWpDpv6qYO7ew1/FDsu/SLr0F2VbepR/VoLS5QgtJBameSHPelWkywBWfZF+
         Lr4cyXoQYQ1w14KGh8voCZ2P3JVqLmMqW3T9Q8Bq4wnGPnoQaY+ryE++8WeYQglJwtGx
         UBIVzeyyEwqr/IULxJkPFBeKDXDUkEwphM10zaolB3V6qgbg3NO6p1l+3Nt4rWgqmhGN
         F3/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768501067; x=1769105867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
        b=gLi6yUR12i3npVpyhbKivi+F2vYd3B2E52Xxgw12yhsRxVXZBeORK5T/lny77S+bl/
         EeXxBqLyA/HuJAlr0qWn6Qbv9GYP7Bsii89kGGvLPQsQtOn6gmpMe67doQpGqSHNhJGK
         6m3RaH11JF5qjdeKb8JXVVjYmoMSjVjVn3gC98ENUK71xWUV2CNl1TKmRVG6u0VnlqKS
         7e0EllwSPUpjztmTAxP8tZFHLk313rddgqvHykz3VCL2P8vRJkSb1Sa1Xey0s3UglKx+
         A/AhHr4RKiXcwTgEx/lT+G+pipaPwlxacr99319gy0uh3L+w3y3AS5ll5bhOszL6YL7L
         5EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768501067; x=1769105867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrPbqnzgCOvE5NgsFSOuHcaOEuIUQeGDqGbHFIodw8A=;
        b=FiTCn/1gZsE8s3LCs+jV13k+0ausIPYWYMQH747jJM1Wh5Vo0SuwQQeRn3KM1Z6oHi
         KUmibjfaClV56aeY9rF6hWdbkJefXADp3SgHqJm09Twl7DDRTJsdIMz42fTdmnAlJg3i
         RZKCdmvf2njM4c6cCumlS6cgLJojNGzjNCB4fof3jAtLWgKew3fGHVuRYkKh0mrlCkuN
         6fyBm00smsx4M3cvMcl8dvTe/VvPomRo2NMPGKadl+4ngVi+SHQ8RQjd8k74MszFON2y
         bP0P2t+aU/OnBRI0vpNvw0Umo2F/ZrejjBd1vlASqBUQP/I4sP9kXEUWjOy5ZF47G+yt
         C+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGZ9LAN+YkHP/lL3tvCJEz1rxYzTIeAMdLKH1VnTyHTnh1b4bNDtm9a9cfBFuH2NKLF3aWXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+XOH50AXS6zM6O+GvYw+CTSuSPVjvFhrW3oIsROBhMr90JaBb
	Es0ERfVGNegEhHsdgRBrodQWEdUXZv3QAML/oLGMmnWu7MZCMgzNCJOUPfCUrvoD1s/4qNyfsDy
	uPd/Vyf6KI3uCqOs1hhUNmf6MPg/npWA=
X-Gm-Gg: AY/fxX4VRLlbFIZFIL+AdVrSnVwehpT2EsCwkXTihbn4rI/vRNSOM/awBv5TYE2t1KD
	DuZdDgMGBV8KjA6LKz/2KMuxndpLwGV0+0zujvJMemQQFT8FtxLaMz7dcn5xj5igEq3oiYS+uk9
	308MvL5A5a/XBfI+yl8dmq9vk2R0DZ5qbh9Vl2da2+XMx+6qFmjGGsEWzFKsJ/OVs2ECHZHF9hW
	3/OsAQXQ+Nc+wigPyqv9CO5chzMarVQiceeXHx4t4AztC4sEpwA4AUoFjUCchGKW4LYCMml9tvl
	dzuefAkHuMt/mN64Qw8KgQlTrFQpFQ==
X-Received: by 2002:a05:6402:510f:b0:64b:7eba:39ed with SMTP id
 4fb4d7f45d1cf-654525ccad4mr346097a12.13.1768501066374; Thu, 15 Jan 2026
 10:17:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:17:35 +0100
X-Gm-Features: AZwV_QjhT3ZtgvkbHJB7796GEklGCbcNDL5CeRwrn_YYeN3X8FqPO-3_iRnRORw
Message-ID: <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Carlos Maiolino <cem@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, 
	devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> In recent years, a number of filesystems that can't present stable
> filehandles have grown struct export_operations. They've mostly done
> this for local use-cases (enabling open_by_handle_at() and the like).
> Unfortunately, having export_operations is generally sufficient to make
> a filesystem be considered exportable via nfsd, but that requires that
> the server present stable filehandles.

Where does the term "stable file handles" come from? and what does it mean?
Why not "persistent handles", which is described in NFS and SMB specs?

Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
by both Christoph and Christian:

https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-12018e93c0=
0c@brauner/

Am I missing anything?

Thanks,
Amir.
