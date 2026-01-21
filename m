Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36229DB64
	for <ntfs3@lists.linux.dev>; Wed, 21 Jan 2026 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022012; cv=pass; b=JVqrulvsmYH36W+6XLc0aUinSPx57/8zPTydvfghzn+NQlan6fwRcFTKoE5rHtpCrbRXmB0e8Ih7ywuGtIzDNMKKcrpPGe0aQPc74efmiccoVXAFFcOkyhODfq7C2u1VBhaOX8toNSjyzANT1DMzIgbC6wPbULDcmO1s1yagAQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022012; c=relaxed/simple;
	bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pO72NGX6nTIj0joIH+3cAC+HRHD5OWjiU8dOol9xTsWvHBlZjlxJN6+pprjdJrNdcgr1FvtBw9eReq5DhQ+E/jMocmPEermLjjDfOQe4/M+6Vf8sb743issY3fkmP7xrx466RObw4CbMMtHyC+ZCYMZDc2o3EXtjq+Oj3VGdw9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMCoLL1b; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMCoLL1b"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so239421a12.1
        for <ntfs3@lists.linux.dev>; Wed, 21 Jan 2026 11:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769022008; cv=none;
        d=google.com; s=arc-20240605;
        b=j2aEqArx02+D/Mq8ppzegk1Lo6HlQ5Emp9NBbMSB3AiB8nZ3ewiqS0xcuF2TRxgw3X
         w1cdTsvOQoR65cWzaVIf+UcqDnBPLqsRzZnuaO7Q9v1hojNCUGX8hUNMF5GgLodNZxtV
         0A6VSDeeYiAS64q6R/y2Ji4VvZcBdjIp3x4KrcRcBNwfyaylvnpm+bKVNcuzvy43cvrn
         DEh+RSf6AAUttFKQOjeuKNV+N3OO4WDcCkTypQBLGlgS9hdkc7MI1BcPQBQJ968W8lOP
         HjTaY0tGyTDcVzR1VUWfSi8e3hfY4WfKlYwtYGwNLlAs9aCuX+MuzxX0ikPlRe8JnVRv
         +vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
        fh=UuFjTljKHer34onE3+06+TrQ/d1Utz4k5frdt2DC/sw=;
        b=Fd8Yjnypyi5pHCMkll5DcNqf4+MkhD+Ii97Ljizzlt1paJWXBVBBlMzhgsOHBX8FYC
         Dln9jE95vCIYWZiuPjAieqEMt4X1MwI5saaTQ6NMWBOADdCRAsERqgvPwPGYCxNVFBkk
         1wilAMu1FvnebZqLg5CueC4Dx5d9DRfpwlyqLCA+q6JcPG8YWLWVSxrpUmr8uyS3gBMM
         0BQrEwOYlQv6TkrgLuRfnGLF58IIBUu11VYGRiSBqz6mnYqUt+wf0mA2Vk9mvAsNL5f5
         9w0JcjNfcYU8FAmDtJ+UIffif/o6IDVmTJhSJuNQiXF3/vVBSNGPZdck7IOUekCh643B
         bFVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769022008; x=1769626808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
        b=QMCoLL1bZyvirhp5VUtAW32YQlHA8H6aM35P8tzB8e9oGbypmucqmMUe8tXuUIIa3x
         xym/FuYuisZn5R+BhywsaCxFTFSr4phX3n7wNSwTZ04wO1RlPn5HSCRMCNxuvdBlyh1S
         jsg0Xzn9huSi5IBqzaxT929Tv0/fMbpul3wXQgTLFc+wy3w9aFZ4K5bWQRmLzb9bNtOx
         HBc136DE9/ZpmLZE10p1gsOBcDdtvpClYklcdzsDe01K7AnUc+VRkoc/VHWXC05e0cHr
         E3rNbFdFhfi5lGuHpAdbFCa5MU/7j5NgoyK0wl59QDxtGQN8kzluwtHzvEu0aLgcRxVS
         Xkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769022008; x=1769626808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P50vKKEGRcti/ilk0zXXEyTeAkMnj2pLP0nOzx4jcho=;
        b=YEoatgrXSHVHKiBjI1mkj9M2QzSJ+zo1s1s9bCUSWWm15TstJlukQx1Q5T7kbfXvMU
         v6vIodroZI4+g0dhNnAe5eRNCGYj797ibuuTpSyzuZMFzsKMf0jU3BKU8dmF+qzpmdk0
         NOgFm3fdhKazpU8nGAHYaxkuhaksWZg955ijl/VV/+1zN378ON1Y6nFGqTOBWvBpyFAk
         6wNpJ4J++I9q3efaMaYAHItWZYZgjTywks4HbNwqi6S2GvlPuWccfY+0FUWjJSjiGDHa
         RMi3liGPdhUMTa2ECHO7J9/CxvR7d5X9PxAUmv7LGtV4a8FkvQCIt8rcUojDNU7NC+p0
         Q2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV3vDebacgGk/P3jOucIHZRIZl/wZ4tsx5XLMpLia0BhVGom6/Y0QTKyhq5EcJ/Z/OfmyVlDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj59KFbUMaQuJAhtGRvtSfmnzaOhNcP8bZrjCMeyncPnXXlIGF
	ddGqC2NJxBSCFAFaUz7Lz6Y+S66R9X0SrJDdwLlLKpQNc1Hvaj87gWk+dnSAPtWZhRJmryqNyMZ
	aCXhpKfArdejmZuXQRXMFRaqdQcc3BGc=
X-Gm-Gg: AZuq6aKzmocyao0TyzwhrzpZgNw7RVrZg1Fo7kmjsrVJCtB1A0qJQuOtfuGep3QUxRG
	Lif94DrYpQNj3rdo3oUk7N/7YH0RUv61H2WuztWF/VKf2sg906FK2WbKtQ+7tsfehtigKjWbv1h
	pa/lV5QwJxknHX4Cb0olXIOFEzFeRMT7cjhVKG6rua4pdhkbKd3oW/XKd56LbNRStC6DsoVOmms
	/j68m2HzdpAYjjv79oc4ELZYM50tKTWe4elP150Oj/lnVGyWMlYdfq6zBiCD11TedDi6Rf8UeFD
	7udJ6C9Aj6Sdmrfoit/xz5AEu7I=
X-Received: by 2002:a17:906:6a13:b0:b87:206a:a23b with SMTP id
 a640c23a62f3a-b8792f79852mr1477117366b.34.1769022007470; Wed, 21 Jan 2026
 11:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>
 <aW3SAKIr_QsnEE5Q@infradead.org> <176880736225.16766.4203157325432990313@noble.neil.brown.name>
 <20260119-kanufahren-meerjungfrau-775048806544@brauner> <176885553525.16766.291581709413217562@noble.neil.brown.name>
 <20260120-entmilitarisieren-wanken-afd04b910897@brauner> <176890211061.16766.16354247063052030403@noble.neil.brown.name>
 <20260120-hacken-revision-88209121ac2c@brauner> <a35ac736d9ebc6c92a6e7d61aeb5198234102442.camel@kernel.org>
 <176896790525.16766.11792073987699294594@noble.neil.brown.name> <ccb32c576cc4ebf943d5ec35e3d7ba4ae8892acd.camel@kernel.org>
In-Reply-To: <ccb32c576cc4ebf943d5ec35e3d7ba4ae8892acd.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 Jan 2026 19:59:56 +0100
X-Gm-Features: AZwV_Qh050IhjThhArfxNo-53HjJR0uLCcITEQOtntS-75Lw875opD6ONQssxps
Message-ID: <CAOQ4uxg+dC1o+6V7Nvxf8UW3H=0OvsGjEe76LNY6q8ZcpGDDJw@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
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
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, devel@lists.orangefs.org, 
	ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 12:56=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
>
...
> > But if you really really want to set this new flag on almost every
> > export_operations, can I ask that you please set it on EVERY export
> > operations, then allow maintainers to remove it as they see fit.
> > I think that approach would be much easier to review.
> >
>
> We could probably do that, but I think the main ones that excludes it
> are kernfs, pidfs and nsfs. ovl and fuse also have export ops in
> certain modes that exclude NFS access, so the flag was left off of
> those as well.
>

For the record, my comments regarding fuse_export_fid_operations
and ovl_export_fid_operations variants were purely semantic -
it did not make sense to mark them as _STABLE_HANDLE, but
it does not matter if you set a flag on those ops, because they do
not implement ->fh_to_dentry(), on purpose, they are not
exportfs_can_decode_fh() by design.

Thanks,
Amir.
