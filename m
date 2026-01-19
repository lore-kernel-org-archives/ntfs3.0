Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51119342CBB
	for <ntfs3@lists.linux.dev>; Mon, 19 Jan 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812024; cv=none; b=pwk006AtOWBhHMVZNorKOWEMxFV4JtiljW3psbvm4c2D9w/FC5xU1SyPv+gOQbOdFZHq9RW2qTyXMoo1GQ0cTAJAWROsV1oAo3APllfGkrdECR5TlKlkM5YD1pJGOG6PxGAs5eP/HSfw4Mu1uo+ZNtZzXrt4Z8wPSzavgJWu9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812024; c=relaxed/simple;
	bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBjjIy07xmQhFdLshjLY+CKjxsP8VarxTUj7RB9yo9NUKNETd6U6W6LojEgNuZxr/BtbRLHcQS/sNOs2DBoLcTCSAbMBr5fgxh1/GvN4lPdDdXQW1nmdH2RVxuCjzuY/+Y16qF1lCRxBZ8IrmsP0brzm8KSHkFGL5V5AIkoIxkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0yu9BhV; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0yu9BhV"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382fa663249so39093581fa.0
        for <ntfs3@lists.linux.dev>; Mon, 19 Jan 2026 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768812015; x=1769416815; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
        b=T0yu9BhV7cJYV5ZMBOxOYcKJP8eYui4sRtsWwxdL4fbSxIXOxesWMGO+YmyHjxkN8r
         hfLKgOTNMtvhyzx9fC/Nm1/hS26Zzmsm4y2udYPTVwS6AUxPg7IRttO+kvxCvUpGDjUd
         I1lpW3uOiN3SQLT3nkffDlg+78Ir/l6Ck1VcPBJ4oAgHN3KxTUTkIZ7QrjT8YN3HA/4t
         JnNhdGVoWyYMrLRAjNidDzVXkV8gsyb1Ldus2LL71hDQ/KfqwjIWlbErzdl6+4s2kklw
         KkCSIqkeAxPj9H3dtT2MKOJZGP2BWy5/RpH51X03IrCb9Pe6Y01m8ytzMbm2DLVvjlR8
         ABKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812015; x=1769416815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
        b=r7jcYmrEuk3yaNoAgxut3ErGCl99X/5wpGVzlRoPuRGflrpL9oJ2aPMVE1yQpQu6ec
         tf+kqr5G+1Kv0Jrvh5KDX7GNjs13RYMwTwlkycEG4xzrMiyxaaW58A2rgXyXWimiWI6X
         DuadVtlZsYB4/85EKPfcS4uEJsm6k43qVoV1i+kZamAX0diH14z1vnD+qWRjrfXugaqV
         4+A/Ir9ieFSWkVCqCrBPGEEdiQ0Nljy6FB0Mv907zTl9ddAZml1m4Cnt7Jz2sdZwlA/Q
         bBxUzhDe+8jbU7/fA6IA6KCm7CnYQ4BkY4bn5SseVAXvtKB30GYUAmaWpd2LuRwFzeNA
         Tr+A==
X-Forwarded-Encrypted: i=1; AJvYcCUkQGeaKO5AuBtmagd4P8uS80+MfC0mzf5RdqvwI7vKqYZz/jPD9PMOkwSNiakyoqeZZ0Kapg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3dIb5c3zfJtUS047WwTx0vfgp5l1rTRH80lasHVz6g5WGh6Cq
	BYQJmShIxGG1iuiveZFkFzZwiTSqnOIqZti6UPd+uoBZICtcvPlEyhZGKoNvuY2t9zgQVT2jK1e
	nTmLhibwalrd8yyyMlIG8SiQdxqayXt8=
X-Gm-Gg: AY/fxX6EtXqtj6WvUdfVG7Gc8m/jfFEG8ibDlmZ2EdhfZVLd8X2C8DYRCNREZaqTxdz
	fxlIq6HOgToDDU6FvDd1k+iZUFwMXLo235mIne6cyF3cKz4iomRi1c9BvKLxraMWUcFaLHMoqW7
	AnQuS1znGWNNWjka9whQdVrp2CS1mWImrs4ZPz7Sot49Q8pu49b+Nq4RC2zvj6q7Z7ERTlSi+OK
	ZIF5vZy9TOLg6VpL/MOVeqv8lQSr5/GWr6vEHqT5l/pDpTCPqhHY1s7xnB4zrhzHH4RVonx
X-Received: by 2002:a05:651c:31d3:b0:37b:9ab6:a071 with SMTP id
 38308e7fff4ca-383842a1f56mr38777111fa.28.1768812014411; Mon, 19 Jan 2026
 00:40:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 19 Jan 2026 17:39:57 +0900
X-Gm-Features: AZwV_QgvoiJk-4c_7XszNQLNhAbjR94vrEkk8toY4eDKXl6u9TqMllUY3n06aqo
Message-ID: <CAKFNMomS-8MMAjy8yuFwzuLBuQQA8r7gPJeJh1ci6RvVc9u4EA@mail.gmail.com>
Subject: Re: [PATCH 20/29] nilfs2: add EXPORT_OP_STABLE_HANDLES flag to export operations
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>, 
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
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
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

On Fri, Jan 16, 2026 at 2:50=E2=80=AFAM Jeff Layton wrote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to nilfs2 export operations to indi=
cate
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi
