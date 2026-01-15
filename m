Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E173D1CA2
	for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503272; cv=none; b=KmlJ57Qfp+iquk0DLbQdrnEC3hcTzs2zqUfmLRoSAGhDElUbrUIxOr3r0APbzlrdiR0WB13tffkL2CDgc50Og25Krd3eytO457ViCtNHb3tzwefSqCIjPQI0pvopDcAgMIbmQVJvDNEemb/Ep1Wc7AgFS3mswlnnIOW8ANCxB2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503272; c=relaxed/simple;
	bh=AgB8BlDrSqCt2vWmdgQdkVNbgorviCbIMxtlMVxqyDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vh3gw2nhLp9pWMt5mDqgvC5bRApsl7ajSCCIIBb6d7Aih00Wwd8lIBdXZpn1S4lJ7FfvJOrF8eMFLrH9grrpOJkSQeLQo2L2OKgBW+chOLG2qxCFRJRBzATZrZNtLzwKRwq6jUMs8fzJ8WD6ctpEqaYNwFkf8DBiCtLEaHXMNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keA0UF//; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keA0UF//"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d28870ddso662997f8f.3
        for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 10:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503269; x=1769108069; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
        b=keA0UF//LoGcTcjLbnAo16BQWZbxuX9OQ/UlfT2s/yWzz4gT1A75fZLq0MvIxtvTRa
         KOBBFO2hT1j9itptCbAcitY6drTwmmiJq5fjIllYtLY3zM2aSo+dEvNLvOwJQL4IVd1O
         8W/qQ36e2PVpD6uKWxTwUiDDwKtwCgbgoN0xmgA+q00Vyk5Y+Pf99biNxm7TNp3BfigU
         jtlsHfHkmETd6OHaTIryoFOVfYcJyWe478pRxEmDRZhG6P3LQddz4NlvyjU7YUqu3wKf
         SEj3IgnGyxal3GEUEgUCj14qWhUnc04YBKZgN9yhUUsvIievOl9qtrQAnft2SVcK+w73
         FlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503269; x=1769108069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/pIR9g5xBWqOZmQj/jDCO8xKQONNisoQQHHakrcMdk=;
        b=Udr+8UD0RfT4DbZWIl6tFVl76MNIhFhHgQfLd/zJN4GKM8/bZH17AN+Sx1foTqqCAQ
         BioNRcBJ24/4q1dTMModrOd5mfe+0NPwBdYIqaYJQUGp3Gp/JeWZXpXRCt1qqssSR7Ro
         w+J95Ykk3gep9JV9mGPV7AbFiU4DGbjgdeHUrhTz6y3s8ob/SAbvZvZEZnyLHPSo2dyT
         VlZAxDQc0fxmKWgLH7s/01jvLQ9Ika9bGT6JWoJI1q7NQfRcAZClF6XGKDI3ZgILMuQL
         6CnE9HgDZhb6yokAc6aO8CTo3csidOxJkSwUcnUGO6oB/p17rsnmuglXcXXPCPDvzoXL
         y6vg==
X-Forwarded-Encrypted: i=1; AJvYcCV3vGMZKxqQbMbnXMVwH27UR7Cql/+GAi2jGC2yy8Vb2pSCtCnpMU1AOqnmOOj59xQTSQBISw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLf2a/MgLoBcNOGtqsdlZtIjsaVMXngjU0J1vldOWsOrH1pzbV
	PMzGdI1cTrGiDKmnvLYGPqr0WMAb/Gj8qwxBtLBonclgsBPRkfYsPn5WwBPyK7FwcJeKXuM4bJ9
	fDOCJZKo11LtF7VYmNvqskYX5k/9mt7U=
X-Gm-Gg: AY/fxX5fb5/cBJ8eHRZWCUaP4mGSR0/9Vx32dX+HFWDdnolxGbPgwgHD98UCKvNql3p
	nCdZvHllXY7/+kR5F9pDhF8g0dMgbNqZTm5fNH4QPKa7kFDodnmbeCtuqFs7e1f3pbSvZyDo+sC
	7cnKRIVqxyi9XUeXNdYAb0fLUHLvoXODZk0hsH74zSdLDeIOb0vRvw9qMw/VFXBZuqSjKjO5ZO/
	B0vF8Jg475u69GZqMN6VrF87oRBdlAnNndLxHx/bu2S9wLq3atk6ZgCCuOLL/AMp6HTDGqBJ3ja
	jYCDVS18iPQoAZin4lnucV9uqUpP0Q==
X-Received: by 2002:a05:6000:2313:b0:432:5c43:76 with SMTP id
 ffacd0b85a97d-43569bc17ebmr434376f8f.39.1768503268480; Thu, 15 Jan 2026
 10:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-26-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:54:17 +0100
X-Gm-Features: AZwV_QgNgqINU2MW0ct-_EKOImgQ1uAwJfq7nKBHPoIgHpyzlMCSNbXGV-6zTEg
Message-ID: <CAOQ4uxh4VaVL9PD7-_Op9Xs-z5Qrx8g6x2x5FccujQX-Cw9RqQ@mail.gmail.com>
Subject: Re: [PATCH 26/29] fuse: add EXPORT_OP_STABLE_HANDLES flag to export operations
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

On Thu, Jan 15, 2026 at 6:50=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to fuse export operations to indica=
te
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/fuse/inode.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 819e50d666224a6201cfc7f450e0bd37bfe32810..1652a98db639fd75e8201b681=
a29c68b4eab093c 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1208,6 +1208,7 @@ static struct dentry *fuse_get_parent(struct dentry=
 *child)
>  /* only for fid encoding; no support for file handle */
>  static const struct export_operations fuse_export_fid_operations =3D {
>         .encode_fh      =3D fuse_encode_fh,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };

These are used when the server declares FUSE_NO_EXPORT_SUPPORT
so do not opt in for NFS export.

The sad thing w.r.t FUSE is that in most likelihood server does not provide
persistent handles also when it does not declare FUSE_NO_EXPORT_SUPPORT
but we are stuck with that.

Thanks,
Amir.
