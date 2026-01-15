Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35E305962
	for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505224; cv=none; b=NOkAcFNPhcDmP79ZTtjmmaS/OzcEfu0ZpOBPBNZ2vkN6zr98W//37cR8O6emwQbj2RR1Y6pADqq3yytuDQsh8KnDMidEJ7e7ga42pUO2NfgJajis5q9G/gnKLzW/W0EEmedVGt8ukCUYRlQ4Iyswp/7mjeIvjYgfkHutsDbUu80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505224; c=relaxed/simple;
	bh=UxolFbMwV2HRPaKQ37FO6EpPTEmN4gnY7UWNmQTK8QI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qePceQI4DKSTumsi/k6h21W/jdQeCej6YczY2DgN5o6Oaa2dlVjwnXXYC4dLgn2Mj0M+eU7CPQF2bU2bnPOJcH1HdVhq2Rq8SW2qNtFEgcYAlPM4GNmlffXIUFe83JrTcQ9keE/aX8Iul/2Gx7JrkKOD4Vebd+OCJ+7ch1F0oFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X12dmIsJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X12dmIsJ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so2506939a12.1
        for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505203; x=1769110003; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
        b=X12dmIsJ1RK5JqjUPZ8T5/4+11E/5d1PNZsWrjowfwQOGAcrkx9ElLPJJqhlaOS/jB
         /XF1vIU2fGCeuwwZuZEZ3nhBzxo9rPgmYBMvMPSU8doRGxPNAMa3oc2MDPfp3ACdgf8G
         s4sd/bG20aXIWNwhc184Avk5SDVLNDbn82DSK0fco6IV2C4dCBJrjEnMD3FLFlGh+78I
         Z1hIpbfd7i9Y0JZYktppXtqrW6ODrIsD3OqMWxVSAPYm/58mflcGzAJUypCscEjWn7Iy
         p5gAzW8FSJRJAvUYdkfTGIfz5vZYo6FZQddhsBTtthfPugaqITOwcIGHqT5/NAwB1Ruh
         RAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505203; x=1769110003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDUsn+SB7H7nYSne5YCtxozzRNZ3DAEsXPNjynL2NCs=;
        b=BS4H1d/fJMroHUlmk+HG89Qjhj7+nki8FwikSkEdByW6/y9ovb08lqHZlqwpGTVhvb
         uPtvIItq7o4PrqOPsh9QjEiJ01JTyGOoPo53YLjpnaEkCbnDHOVc9DiGFjU+6kANIzer
         PMQrHTkFFoWt4/aYxwZlZ/9cQjQmZ9VWNxM2B0cTBXqqGpZ/bWdAmcL3D3oFCvP5i7Jm
         myko3lG1mmTiG0SmSnvct/zgesvmeuOidTSJNu8oqMWoh6AfHhGxY/xXsExNvcT4v/UZ
         8XDHbYh6d/RYYR8hka4XcvOkf50ImWg1cgYhxSvAiDeV738mE+S9+rkJjt8cAkObfh2x
         BGIA==
X-Forwarded-Encrypted: i=1; AJvYcCXauzmud9lC5DOdNDn5LwMs70aFy6/nWdlpvKohQhbsrv4wNvbrpK3xowpI8jj/omW5Qgr1sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/HZPREO2nQFd/u+EapWKBzaQn4wyUBln9ra04a5AAJYujTnO4
	yXtX2A925E6yRUoWPrMQRQA5+0Ns6AUMv1FJiZMeL9JU6jj1erBKgQTbCatdFdyAr4QiNj/GM1N
	HVj5om3WWxZn+tfMLbRDmmedD1y8GjmE=
X-Gm-Gg: AY/fxX4kEIHnlk2DHk7vwBlqyY9kljyan6ASQ2aPsIDul9FaaZOOmDUGnT5wSHFe/QN
	hfqcIVZ9t88JVvb2kJDSJHP59E9disIPkk95vJctwOYjFYPylFBbXnU79Tt+i50NbqtRzJePqlP
	m5iPAnki3/gQ1xFRJMxczgi7VH74Qqm55bH/l48C1phPgH/bU9Ftu/wSsE4cNGXfVugNf1svydX
	bYi0h0TKVMeHE7zuns9FzUUCpJ1TeZY8h2GDvw/OjZVzv9l8eypIpfPOK68wFo5nIgvOdrvmEft
	z5FbnPsAchBcYd4MDhJDFjg9IDlPsg==
X-Received: by 2002:a05:6402:4402:b0:64b:4540:6edb with SMTP id
 4fb4d7f45d1cf-65452ad0f58mr442903a12.22.1768505202965; Thu, 15 Jan 2026
 11:26:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-15-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:26:31 +0100
X-Gm-Features: AZwV_QgHlhd5AJtx9A_oESS7w6U6eCWyUuqrhH3MyU474xj2Kq62KuhGZ4o-aoc
Message-ID: <CAOQ4uxiTE+8r+F-e91cg9wZY-fjZfSHHOeLk3RWb+2JQQZvbvA@mail.gmail.com>
Subject: Re: [PATCH 15/29] smb/client: add EXPORT_OP_STABLE_HANDLES flag to
 export operations
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

On Thu, Jan 15, 2026 at 6:49=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to cifs export operations to indica=
te
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/smb/client/export.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/smb/client/export.c b/fs/smb/client/export.c
> index d606e8cbcb7db2b4026675bd9cbc264834687807..c1c23e21bfe610f1b5bf8d0ee=
a64ab49e2c6ee3a 100644
> --- a/fs/smb/client/export.c
> +++ b/fs/smb/client/export.c
> @@ -47,6 +47,7 @@ const struct export_operations cifs_export_ops =3D {
>   * Following export operations are mandatory for NFS export support:
>   *     .fh_to_dentry =3D
>   */
> +       .flags =3D EXPORT_OP_STABLE_HANDLES,

Kind of odd to have this here after the comment out of NFS export.
Maybe add it inside the comment...

Thanks,
Amir.
