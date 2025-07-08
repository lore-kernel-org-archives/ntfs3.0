Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B75383
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 05:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751951142; cv=none; b=RAijkZ4F/+R6eAVBJruaE/T8PYOcQqkDljcucd8ZUg2ZHmG1EErpQ7MCROD8GGihda3hy/KdnpCjkfsoHIZngnDEU33ApiHs7EcfjDScuYPbC0qjQltT+hWiu/aL7dt4g0lrHzwZT+dr7PRYkv5bfVhpyfhLElqbKHWfhqm+o0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751951142; c=relaxed/simple;
	bh=XbHthtLjeMxvpEsokUL5L6zTC/GYu6YVUUjUxh0xdYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8lXvbAkXVYzQbykAEVrB25aVNR3QrsH0mYNffAXOS+94+hPzIdBXJh1HY37JmCqVSrbJzyMAWfG+7OsBk0v0cCO+xNpHG/eMKukYr8GxrP3fXoDWNxbAYULSSjkoEyNRb4RvR6EjPx4588JlPy8e52egiKa6NUI4Slabv7QJYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=05H68dO+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="05H68dO+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7494999de5cso2388414b3a.3
        for <ntfs3@lists.linux.dev>; Mon, 07 Jul 2025 22:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1751951140; x=1752555940; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Omo6LLgJyVULzloJLyFZcLDr3jdzW0nRsKBFp8OqSOU=;
        b=05H68dO+gYqP14TU2XR0hxdD1+BNE3+bjp0i796CGTGPmft8x+faR04bwWWRJIm7WE
         wbd2DCKt3as++AtJlcz73tQlX+VxERHeLEnV6zQ2odeZO6E0SauvWaUg6dQuBTBBOiDI
         IFA7TEfwJmR3R2U/0tJvkfdOFC5gdasFvg7Co3ADcUg8je8WmWYGRrk2Sv0jaxEKllHK
         ebrAOQYlXmZjct8c1aavTxaaICDcTRHhXzLXUGGCQ/7pRHAFb2T08dyHituVQRDfNLXK
         E7KWYoZDnno3SvCT/BpPHjInvcMFMXaO3uV31CVtlLHU0fMB74PDJgBDzJJqCL19awmN
         DEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751951140; x=1752555940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Omo6LLgJyVULzloJLyFZcLDr3jdzW0nRsKBFp8OqSOU=;
        b=ELAB1CtSE6T1Fr5xhbQkNnJLGCArl9swlmv0kYvBafWl1LLQpXzPDUTtz7kn6QD466
         SLBQiCvVR1tkarNPHtoKMNZujE59/qM7vJWGZAgXukJtH3wtN0IL2ThNPnzgEy7EJ4nl
         wQ6npGTBKwlgZ+DVIFQb+1XZd7VPmdb9kqcRz/0HL+4YRjPQRaTNNVBW80ER5Y0gpr5P
         a2KR72wLy79etqKZeZM1qktAmYKcxGKgfn7wT2Mf7hfcsAmqMd0+Gx99Rn/mHnZeBzUA
         36IGA0xwq8+YOVcHrCg3cpWi+4iPfTO7bcJleTADI9AyuIhoya3GK+JC43SgBCYPlqo6
         AR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtMMDgpkC8+tqhNU57O1SJY0mw2f7ieQm7GTN+Z4UQNnYIVaw/FbHU0lOTLhlLSIKvAjzHWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEAm/98Ah70XEUhHFQ2ctDb6eV8wZZ7qsQN6lXo12RH/9wcy07
	pLWN1v7mLQdmetkcPXHAIbLp1Ep8Nf26/wSOXLVYZDDwWyjMQ8BZLcBegYx1QYES9R7hiRD0yhm
	kIfWX
X-Gm-Gg: ASbGnctk8nyROlFwzthRk5oH8TKXYjn4KeZbQzQViZOBHiescjHXx9Cv8B/4GYTP3D4
	uV/6P8HHAv+KcQ79YYO3wyQSqJ6zZg+ONjpvSNJbv4hOfzGe1LcaJ+HDYG39yWCte8WtKWWJP6e
	bTeDNPohdXHemaznpCv6zFF64lq7Fb1m9JhUTe1w05MAzvIVl5eSHnHkdUx35IeFxA5jLjH/ka9
	oZ5Y72hrW1G+9s80mSgSYMVuP7vGG1ba4vhW6GsYIMFffydc0E2PbLY97wTMRZdVNi4sJEfC+tb
	/Vz3TX8cidbIHz30mFaMN76g4B7KAbU32aIC+CD56ayM7cKDmFdMI8G71EYdbJpeZu0Yjcn7RYu
	dS57QHLWYKA+mEyMqiTnPIw71VMVfYSoSqqQ99A==
X-Google-Smtp-Source: AGHT+IGsHUT6Bi+76saZTNBr04hdGSYcx5107pQyHdDmPfUk8q23TTXe1KfcBJmRM20GAyE10VbqJw==
X-Received: by 2002:a05:6a20:728b:b0:1f5:8c05:e8f8 with SMTP id adf61e73a8af0-22b4449d668mr3073800637.25.1751951140491;
        Mon, 07 Jul 2025 22:05:40 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3918d81a3fsm4275006a12.15.2025.07.07.22.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:05:39 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uZ0WP-00000008J2c-0q8k;
	Tue, 08 Jul 2025 15:05:37 +1000
Date: Tue, 8 Jul 2025 15:05:37 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 1/6] fs: enhance and rename shutdown() callback to
 remove_bdev()
Message-ID: <aGynIewLL-05fuoJ@dread.disaster.area>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <02584a40-a2c0-4565-ab46-50c1a4100b21@gmx.com>
 <bdce1e62-c6dd-4f40-b207-cfaf4c5e25e4@gmx.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdce1e62-c6dd-4f40-b207-cfaf4c5e25e4@gmx.com>

On Tue, Jul 08, 2025 at 12:36:48PM +0930, Qu Wenruo wrote:
> 在 2025/7/8 11:39, Qu Wenruo 写道:
> > 在 2025/7/8 10:15, Darrick J. Wong 写道:
> > > > Yes, the naming is not perfect and mixing cause and action, but the end
> > > > result is still a more generic and less duplicated code base.
> > > 
> > > I think dchinner makes a good point that if your filesystem can do
> > > something clever on device removal, it should provide its own block
> > > device holder ops instead of using fs_holder_ops.
> > 
> > Then re-implement a lot of things like bdev_super_lock()?

IDGI. Simply add:

EXPORT_SYMBOL_GPL(get_bdev_super);

And the problem is solved.

> > I'd prefer not.
> > 
> > 
> > fs_holder_ops solves a lot of things like handling mounting/inactive
> > fses, and pushing it back again to the fs code is just causing more
> > duplication.

This is all encapsulated in get_bdev_super(), so btrfs doesn't need
to implement any of this. get_bdev_super/deactivate_super is the API
you should be using with the blk_holder_ops methods.

> > Not really worthy if we only want a single different behavior.

This is the *3rd* different behaviour for ->mark_dead. We
have the generic behaviour, the bcachefs behaviour, and now the
btrfs behaviour (whatever that may be).

> > Thus I strongly prefer to do with the existing fs_holder_ops, no matter
> > if it's using/renaming the shutdown() callback, or a new callback.
> 
> Previously Christoph is against a new ->remove_bdev() callback, as it is
> conflicting with the existing ->shutdown().
> 
> So what about a new ->handle_bdev_remove() callback, that we do something
> like this inside fs_bdev_mark_dead():
> 
> {
> 	bdev_super_lock();
> 	if (!surprise)
> 		sync_filesystem();
> 
> 	if (s_op->handle_bdev_remove) {
> 		ret = s_op->handle_bdev_remove();
> 		if (!ret) {
> 			super_unlock_shared();
> 			return;
> 		}
> 	}
> 	shrink_dcache_sb();
> 	evict_inodes();
> 	if (s_op->shutdown)
> 		s_op->shutdown();
> }
> 
> So that the new ->handle_bdev_remove() is not conflicting with
> ->shutdown() but an optional one.
> 
> And if the fs can not handle the removal, just let
> ->handle_bdev_remove() return an error so that we fallback to the existing
> shutdown routine.
> 
> Would this be more acceptable?

No.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
