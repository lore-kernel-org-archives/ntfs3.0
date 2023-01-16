Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E3EC2
	for <ntfs3@lists.linux.dev>; Mon, 16 Jan 2023 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673857997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cmV/tOhk1p9sXTBFFd4XL3CHoY6/k6Ee8FzcZCIih3w=;
	b=DMj291ZH6vVq45S/+0ytL8+rmTGDiC9DO9fJ2BfYLutWxWGjRnPuQuqhkeNfuOLMRDxVuT
	ZSvkmJ72Yey3NlkgAuvBHJmwus4ggGE9fqoo4Cq/HG9SocFTJHSYh8npDw4uQ41IadYw9c
	UyqtpohVsl6K6o6QFuwEnjuZJZNoIQI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-qCE_E-XfOH-7ppsd2qE_Sg-1; Mon, 16 Jan 2023 03:33:15 -0500
X-MC-Unique: qCE_E-XfOH-7ppsd2qE_Sg-1
Received: by mail-pf1-f198.google.com with SMTP id j1-20020aa78001000000b0057d28e11cb6so12133813pfi.11
        for <ntfs3@lists.linux.dev>; Mon, 16 Jan 2023 00:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmV/tOhk1p9sXTBFFd4XL3CHoY6/k6Ee8FzcZCIih3w=;
        b=h0Pl3aGw1faGCQFmSKMNgJAuF1tH2pc5rfYI05/zIrtDoD1PlP4tc1HTtZhaJT4t74
         rG/p0Hcfql32LKyd07fNm/drQBncyF63bbuLsQ5QTzOS55viMQ8iSkakMjM6jh+y4gH/
         9dv1VGcUkbhZj/pTdq+KGHWeDU8PxitHzfvKcdJhQ4Hf/I2STLjr+KUa4HpH4dnaO55X
         CfOXX3c6WxnvRkrVoITwxU/OkOwpmM2Wvl4T76BF8h+qWV3uoRTDpGgsvNaCxsrLert+
         JxqJjIcBVqt7Fl5Ca0QUb4Gc1aE9jpiF52X8L22R4Dff1T3L9RC3/zUqUw+sQ1T5/TaI
         hxsA==
X-Gm-Message-State: AFqh2kpf/riq7rw7hVPaXKZkb3i8RQQckEVpD7kAqVkGfWKJkArHa+7U
	k4MAEtrF3Txd3N6In9Uq/bmKDt9O7FiBHcAB2T6c9qQEN2aDw6o+EJIIvAwkGoeRDRSlkyM2EVS
	FL7TbPhzA0IC5W9U=
X-Received: by 2002:a05:6a21:3a8b:b0:b8:9c66:cd66 with SMTP id zv11-20020a056a213a8b00b000b89c66cd66mr797122pzb.18.1673857994963;
        Mon, 16 Jan 2023 00:33:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsBW/iYBDAkVZlO7y7Rcp3EBSdUsSpj+rBDKBuXM+TTBzRL+KPGGwGnwO9CeXH45Jmu/Sj6EQ==
X-Received: by 2002:a05:6a21:3a8b:b0:b8:9c66:cd66 with SMTP id zv11-20020a056a213a8b00b000b89c66cd66mr797108pzb.18.1673857994750;
        Mon, 16 Jan 2023 00:33:14 -0800 (PST)
Received: from kernel-devel ([240d:1a:c0d:9f00:ca6:1aff:fead:cef4])
        by smtp.gmail.com with ESMTPSA id z4-20020a623304000000b0058215708d57sm946601pfz.141.2023.01.16.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 00:33:14 -0800 (PST)
Date: Mon, 16 Jan 2023 17:33:11 +0900
From: Shigeru Yoshida <syoshida@redhat.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Fix error handling in ntfs_new_inode()
Message-ID: <Y8ULxwOtdKWu/CzX@kernel-devel>
References: <20230104123902.978084-1-syoshida@redhat.com>
 <2f653f1c-161c-57d2-b3c7-f21ded261938@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2f653f1c-161c-57d2-b3c7-f21ded261938@paragon-software.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jan 13, 2023 at 01:44:48PM +0400, Konstantin Komarov wrote:
> On 04.01.2023 16:39, Shigeru Yoshida wrote:
> > When memory allocation for mi->mrec fails, ntfs_new_inode() calls
> > iput().  iput() calls ni_write_inode() indirectly, it references
> > uninitialized mi->mrec, and this causes the kernel crash.  This patch
> > fixes the issue by making the inode bad before calling iput().
> > 
> > Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
> > ---
> >   fs/ntfs3/fsntfs.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> > index 567563771bf8..7b93f2aeb6f6 100644
> > --- a/fs/ntfs3/fsntfs.c
> > +++ b/fs/ntfs3/fsntfs.c
> > @@ -1683,6 +1683,7 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno, bool dir)
> >   out:
> >   	if (err) {
> > +		_ntfs_bad_inode(inode);
> >   		iput(inode);
> >   		ni = ERR_PTR(err);
> >   	}
> 
> Hello.
> 
> This bug have been already fixed by Ye Bin (https://lore.kernel.org/lkml/20221117091912.3436127-1-yebin@huaweicloud.com/).

I've missed the fix you mentioned.
Thank you so much for your reply!

Shigeru

> 
>  * Thanks for your work.
> 

