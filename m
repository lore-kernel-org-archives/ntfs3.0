Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7233FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 10:49:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id k5so44557141lfu.4
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H7OJeH8ploDa57Lv/PjYEWeeoHBmMt14HYzSTZRo4DQ=;
        b=hY3KKHjg+9s39HEVIo7CNA1/wxS1zAXkAcFBNkxCcFPhKLyoRJw7RU5n4jYIv8jU83
         746JL3zOECeH05ybXiYorKsH/9uwztg8XzWdE6g5Qy7xzrbwIDJHcMrz5dgl8x482N0g
         +Tx23JvSPCtfZmkNI1gWtacpl5XC1FUugE8Z7bU6YyuKyHiVgOPGpn3niBh7B5NoDTv3
         YhcftxF1I6CCi9QdkeT7AzKK1a2IWxzskGdN9VQSGxcJb/NKG/4AcnvL6pfEGntMuv+E
         XLma85HRooEXFEghpe+bHZu9vOrULA9fFLKW2ndnoY9jjsJbamuDguUGfKkt48OGobqF
         CAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H7OJeH8ploDa57Lv/PjYEWeeoHBmMt14HYzSTZRo4DQ=;
        b=Ru09vFtoKuFSy3zpgAqns1+qSRO1k4T9hPzYr8FrJMbdNo/g3fxiSCdLJNAdserRmf
         iBc9Th7BsA5xp2Dqywsjp1GJfzr2SZnw4SNEgviO61jts6Swu1iISWHtxBpn6LLEaJ1+
         auwGVY+jgWlShLkgK7QTSWqeXXUqhDA/c2+9Ix7EE/+Ex6xRcbCqvG2/gzrOuz+wza0e
         KIrJP2vNsowwkdNbB4h9WuLZGVln+Z+apT4H2YAhzDNwLkNXEhsg0ce4lW5PFZT/mdvn
         Xq3bJOB5NKEfoAimDGrkJaUNkVNlZrdXMkNIkSDFNuiPdg02zHXN/xMLMqSQB4INd/0u
         d8Jg==
X-Gm-Message-State: AOAM532ZsBp79HM4dREp+J4sbeQ9U0uRvZOTcWTivF67pebxMgKp4s6c
	Fi9xJJmUKp1xX0QM27fdSXk=
X-Google-Smtp-Source: ABdhPJzP6eyHTxz061uFy2YTWnx1eCwVJEaejw7YdmJqE7XDGfsOZ6bdyeoYkNSqbZVcRQiR612xkg==
X-Received: by 2002:ac2:5e76:: with SMTP id a22mr28555704lfr.275.1629802153175;
        Tue, 24 Aug 2021 03:49:13 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id x26sm1708163lfu.206.2021.08.24.03.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 03:49:12 -0700 (PDT)
Date: Tue, 24 Aug 2021 13:49:10 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [bug report] fs/ntfs3: Add attrib operations
Message-ID: <20210824104910.v3mvpw5zb2jqmvbo@kari-VirtualBox>
References: <20210824094249.GA22644@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824094249.GA22644@kili>

On Tue, Aug 24, 2021 at 12:42:49PM +0300, Dan Carpenter wrote:
> Hello Konstantin Komarov,
> 
> The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
> 13, 2021, leads to the following
> Smatch static checker warning:
> 
> 	fs/ntfs3/attrib.c:383 attr_set_size_res()
> 	warn: was expecting a 64 bit value instead of '~7'
> 
> fs/ntfs3/attrib.c
>     370 static int attr_set_size_res(struct ntfs_inode *ni, struct ATTRIB *attr,
>     371 			     struct ATTR_LIST_ENTRY *le, struct mft_inode *mi,
>     372 			     u64 new_size, struct runs_tree *run,
>     373 			     struct ATTRIB **ins_attr)
>     374 {
>     375 	struct ntfs_sb_info *sbi = mi->sbi;
>     376 	struct MFT_REC *rec = mi->mrec;
>     377 	u32 used = le32_to_cpu(rec->used);
>     378 	u32 asize = le32_to_cpu(attr->size);
>     379 	u32 aoff = PtrOffset(rec, attr);
>     380 	u32 rsize = le32_to_cpu(attr->res.data_size);
>     381 	u32 tail = used - aoff - asize;
>     382 	char *next = Add2Ptr(attr, asize);
> --> 383 	s64 dsize = QuadAlign(new_size) - QuadAlign(rsize);
>                             ^^^^^^^^^^^^^^^^^^
> QuadAlign() is a bad name.

Agreed. I will make patch to this someday if nobody else haven't done it
already by then. These kind of macros can confuse checkpatch and
coccinelle so that is one good reason to get away from them.

> 
> The ntfs3 code has a bunch of bad macros like ntfs_malloc() which will
> need to be removed hopefully?  I haven't seen this code before today but
> presumably everyone has mentioned this already.

ntfs_malloc has already been addressed and patch is made.

lore.kernel.org/ntfs3/20210818010649.412912-1-kari.argillander@gmail.com/

> 
> Anyway, new_size is a u64 and QuadAlign() truncates it to u32.  Use the
> normal ALIGN() macro.
> 
>     384 
>     385 	if (dsize < 0) {
>     386 		memmove(next + dsize, next, tail);
>     387 	} else if (dsize > 0) {
>     388 		if (used + dsize > sbi->max_bytes_per_attr)
>     389 			return attr_make_nonresident(ni, attr, le, mi, new_size,
>     390 						     run, ins_attr, NULL);
>     391 
>     392 		memmove(next + dsize, next, tail);
>     393 		memset(next, 0, dsize);
>     394 	}
>     395 
>     396 	if (new_size > rsize)
>     397 		memset(Add2Ptr(resident_data(attr), rsize), 0,
>     398 		       new_size - rsize);
>     399 
>     400 	rec->used = cpu_to_le32(used + dsize);
>     401 	attr->size = cpu_to_le32(asize + dsize);
>     402 	attr->res.data_size = cpu_to_le32(new_size);
>     403 	mi->dirty = true;
>     404 	*ins_attr = attr;
>     405 
>     406 	return 0;
>     407 }
> 
> regards,
> dan carpenter
> 
