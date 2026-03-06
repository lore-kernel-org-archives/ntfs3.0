Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A136AB7E
	for <ntfs3@lists.linux.dev>; Fri,  6 Mar 2026 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766569; cv=pass; b=UvilyOSysQ+sYvmIeW+WvrjD0xfteNKk6nk5G1f4dI2cBK5LGwamCldjTk1TTYpxIsle1hxhqnIfWxWawyU8QYVvoJx20gs5MQWo5AiHfvYG3omU7rdr5YoTLKned2c6L6ccPf8WjmxXbMgGnLi1G3LZIfF0u6T7YR1MxkeHxKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766569; c=relaxed/simple;
	bh=bviOEAiclB40zHgWtMns3qOTI6tH10B4GOXwr6aNFqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NObUJn+H+iwKdadKmQKVRPn5QqyboyZwBoayThy/v9u6mNxwsBEaybWF7XgZyRYQOwrLdDg7vn7Gx4UoUsYSJQaltMQGqXF4UQ1NMQoCnmDYyQjnOW6K6L6lpBIoUWdsxscnU8FOhcbD28Hntl/+XfOjqlPrNs/bPIuNqRHV9KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=DCVWqTbV; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="DCVWqTbV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-358ed696623so3630446a91.0
        for <ntfs3@lists.linux.dev>; Thu, 05 Mar 2026 19:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772766565; cv=none;
        d=google.com; s=arc-20240605;
        b=JOQsDS4DT43HHhl5qc2PmV6OwaZOu0+ixMpVUhiPyZGPRiAtChI3SCA+Krt8Jr/STV
         lBg8bqLiLFhSxgk9mf5fSwPIWwzM6ANjS8NChZBuxTsIA3ZumlcXpE2/M29UL84qdVJ5
         su+j3rTPSSH7yr7YCVT+4jSVUptVXHro52WF5Bi2LMI8eYptY0nPAictZpIgdNKRdnbv
         bwsXMtVjhPNvEgXqRneeSS/DXbBvCiprdct02RzSLLTwuriQgMlJBQGwXfUR+Z4Efv9A
         6cDbYe+wPF4ZBzmFWD0DTa3GdB8dUCSzVbrTS722uOPFTdjWg8JDxWAd3iPG7Mb0rd7T
         Ekvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        fh=JW7pgCIJwQLnQQGdlALvMpOvmBRCNEpAhiELrOXwrgI=;
        b=XSAyaMvk69JOS/Z3DkHXmswAUSwtBCqWzgtAAm0eO6AAPGb11xQBmgDGhZEC3A2/LK
         HzNZdS5h0mdJiZql+IPo2HPqROQANgj9WZpT2JCFgJ8KHVtOsMXYY3IFzDywUiFWse/7
         5XjfxOnuh0pSSi08AIEMAxkEDpD3TL8AkWVRnUBTq4yrwq3IOlhFojPfydvPkCxbpyiY
         SmEhGUD+bxISm0nAFuVCuj/uNvvC1FOZik3kPcAq+GbyvaUBF7aJ9jVExFQ4X01+l83S
         T2iuSoNTk9jhxwRsrrPW8PWkUXVbiPClsmBIHd1+EGokdlDc+ID140y5by5WGqhrFpfF
         pixg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772766565; x=1773371365; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        b=DCVWqTbVnMa1lchxcHm2Cb6rw+d+bLffjO8vDLaM7ad/g48OYmLGjtgh0DhXe/KBzP
         KkVqmG0GGmZmxCGKFw1ADR7movzd6MvaAmAFie2Ai8i85YiIjd4o/PJEC6FXFo4OJfKc
         Ht3j5PFBW99gxYeOsYhboH8BAIWmKCmYUeKwtSNo1Wav0NcIZLVTk3jSjFR5RMZ+IbhL
         BFW1MGPVhudihxshTHInB4iRWxCvhzv+i0r3NlNF/9H0/lrNdjJx9hUl44mcX8IhuEgn
         2np7/itAwVLk+Oys8jyf+hY9SEAsmf2E/ADRTSv9xnfjIH8OHjHdbQFDeNvdwsevDpPN
         PzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772766565; x=1773371365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        b=P8IWXV34cZ5Wyz2G2LfyDibT0mEmSj7j639aGCDKo7NxxSX4KJMmm4PQRVtZnNRLt9
         NEtgOZXh0e07h9jGUpoQpdnBQ9+ZX6uE/KKM4gVwCzvS5x/a6oiRczdIJcoCg1+T4Gqg
         mRxwHEjz2nJKaLWhaOfBGwCzpS9baJtezyUuj4kgRtEuE1uifTnDlAm3/IsdWaPmjnPu
         XVy/AhkVvT0C1UJl3WClg+tF0ykTXk/RhhKU1QaFJ0wR9Mj+d8ckwdzQ6xikwaM55+U0
         n4f87297XR7XCxqpuL5spOfvQl3xxtQaeeQd3J0/S86m5KE7xgUu+bxj6EVcCFjciINr
         qDlg==
X-Forwarded-Encrypted: i=1; AJvYcCVOdnd2GxlSgRwEhK7VprhGntCq61/ZsKxFUzsCy++lMHXTyPOOK3hw5H9MOJzzB6eEMwWw+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzygpPIyE0qBsvgKFrpv9bz3+nYeUHgiVqKyNL3FiIj5E8lT66w
	LNGyTgmhsxyc4nrkh49YpxPOMq/UzglWPXxXZm81duUV2mttI1ha0F1syU9oWSYFfzhbENB1Azo
	abQ0c80J52yfeopEBQeDy8kv7Dgr6GE3B0Wf9e9e8
X-Gm-Gg: ATEYQzy/1++s5SAwleIG2K0v5O7vZcLP0Li0iFz7tvL75SbO4giWhUUau1B8JZmkJhY
	c88tc6A6qr1t9KT8ijrXTJPf6CKLKPHV4rBEONL4RIhVsvvEvm8U0LZIdwgFEX6wpq5AF5FtS/I
	0Cjl22s0dUozMPWSDP/c9snnHz4+e8q2ErjpuWXCHVO3pYn+JBE/0ER67An/F86XhM0MTxAmtgN
	dPfQ6xdpRygRSURNg0WPbyA8t9w0atD84RkQceaVppw0IljzsBbaCG6NRYa2tE32/nav4v9FDlx
	UmpBXXQ=
X-Received: by 2002:a17:90b:390a:b0:34c:35ce:3c5f with SMTP id
 98e67ed59e1d1-359be28da81mr585228a91.5.1772766564424; Thu, 05 Mar 2026
 19:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org> <20260304-iino-u64-v3-2-2257ad83d372@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-2-2257ad83d372@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Mar 2026 22:09:12 -0500
X-Gm-Features: AaiRm51A9fGFpauPslQfX6LBJuSyutri4HG-shh7wAOHtGm4QDzvXC5jtThE_pI
Message-ID: <CAHC9VhQix8opxrX--w-pw5vEAiLaYX=kPhnm4x+dEFEwHiVnfQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
	David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
	Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, 
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
	John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, 
	v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, 
	ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, 
	ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
	jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
	linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, 
	linux-x25@vger.kernel.org, audit@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-sctp@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 10:33=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> inode->i_ino is being widened from unsigned long to u64. The audit
> subsystem uses unsigned long ino in struct fields, function parameters,
> and local variables that store inode numbers from arbitrary filesystems.
> On 32-bit platforms this truncates inode numbers that exceed 32 bits,
> which will cause incorrect audit log entries and broken watch/mark
> comparisons.
>
> Widen all audit ino fields, parameters, and locals to u64, and update
> the inode format string from %lu to %llu to match.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/audit.h   |  2 +-
>  kernel/audit.h          | 13 ++++++-------
>  kernel/audit_fsnotify.c |  4 ++--
>  kernel/audit_watch.c    | 12 ++++++------
>  kernel/auditsc.c        |  4 ++--
>  5 files changed, 17 insertions(+), 18 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
