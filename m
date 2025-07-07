Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3571F17E8
	for <ntfs3@lists.linux.dev>; Mon,  7 Jul 2025 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751929377; cv=none; b=bclsGxepDPFuq8NvsENB65I/oItvxnXf+AIZzgd1yOmWFSCZklL5Ei0/e9mSiiJiwT52ME1XQwvUQk/w3xbkG9C3Y7iO6DqSrCO4A0D3tMD97anB2iv6x4hjsFzD+rzCe7A+fXFk/mYHW6F4YvNNC/IkaZWM2EnN7ULo1zijLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751929377; c=relaxed/simple;
	bh=venDfP4EzG2xqmDXVnH3VRXG5eR6DtQAF3gSkZjRBT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhG4+hcsJ2jd1wKTAwar0X2CsIuhGEax+QGPggXXPCyjqqXloIEl/737cYbyXe4+X9S6QOp7rpbmvxaxhpbvrH7AoTflHEobMLBWoSHsnkYhI/ddpkLPtHZvWirZ/MrXWgEEOKsfWldUUKDFt6Vyjph+cK3Cht7JVArYvGxt50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=AFf0g6Mh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="AFf0g6Mh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e1d710d8so49200805ad.1
        for <ntfs3@lists.linux.dev>; Mon, 07 Jul 2025 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1751929376; x=1752534176; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4pktmlF1vRQduNDQ1SA6N8TiSZQUsg3NAWNf5AHgsY=;
        b=AFf0g6MhejNLg7XWPL5gOqp6/CWtZTm0vnCdfiHBFbpq/hIKt99FP4CFb62eDwcA5O
         w/zZM0Ium/5wwmOu2E0MC/d429OlUNLApqgZupj4GYgL4aNcPul4JKxRb4l8aY85dkos
         kRrrfrK1QtOsloUY0EnUPtE6tM8bgiG2rv01rYnQ7dHWKvjgp5Mx/CfsRK4HpBphD8YK
         JkK5GVGSYjKw8aijiV2bK/mduF2m9mld9fBswSnAojXeU/DMrXqXX4mdc5tqgm6QzKV+
         POm9shTosdE6/HVEbq9pMuKCnQCdiBms+Ih22Ss00y18C1jKaNMglDeuoHEF6qEpp9wz
         yWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751929376; x=1752534176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4pktmlF1vRQduNDQ1SA6N8TiSZQUsg3NAWNf5AHgsY=;
        b=LiZv0uNTlbgYPoDwlSNIUbN5CfAr61Ek22AWa+ETrkB+WlVElQM/9AQcwKzqx7J3zK
         IjQcOcWfrfrf5QhxEsZnDBLDLtAamb7uTkzm1UTOISQjCuAh6Kdh1rBKz4wxIki9gzro
         fusDp/VdNi/q46pMtj7pqLEkwIDtXTYkeY4qBUsmvhwpOAzJx5httJQCb90q4Tyjixpc
         1/qUAt5TJ9VxBMNt6lID3vNVDYhjls8MY6gHjS5xtFysRJQ2IXoa5maty1L4WNwYs2B2
         XksOtQsOyWGf6THlErD8K0E8EuwCZMJ5nEeaXViKSwfOE10saGvAuLqlu7+533RaBobq
         goXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWph3T6U80/dFt7G/9kX4eBcWJ8kZ7le0bLhsFu6zOOJOaqiHafueleizCKe3rYRKMz8slC+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeHX6AMmQKKr6AAfcqbgzgGOtRpOepvMxG1iQlhIqdanauhSIX
	o1p3Acb29M11943haG5cZfOkHYwQfJfzTUYkzHksZXJ5LUb2KFNzKxpQqYxwEyuc7D0=
X-Gm-Gg: ASbGncs+oRnB4bAzDdZ5cCm5tMvdTKQLVSANbZEVXMC++6c4KUht83jLEu9ofQaCW6Z
	Ml/FbqpJglQjsYN/+TKrImusOjh1XaLt5RBrUxToz/suFhJZuWjSYHulM51UUy3ujw9tvhuAxzw
	hImIKXhRsbEHCPeUbU/yZOizlXfocDridm6m2jyKAEDcNrqaJHo187yCaVi00v6suqBvzNJATdE
	5Z34CI4uaecsvSnxZGbZduOrJ8DDOl7MxP5fqheE7ib+zlvAYAB/lMRv9GkZBz7HuSnZ3VW5VNy
	H+OCrMDYUV07gVLhRCVdCV2LVlj6ZWbz/7O/xmXjRN9vIoxJd7KnB3BLvQGMzMrVfnrKi2tAvsd
	yYvqnZd2fNpLpYgmaAnWkoMZ4HFpXElQAxIIb88hHf2XJnNk3
X-Google-Smtp-Source: AGHT+IEmTi6zrkNyOcS4BN99ZoRqMQGa5CBIfG1MgDs1BPtD4rrI5GMD5dIJM6aSPlLP7bK+loeCfw==
X-Received: by 2002:a17:902:ce10:b0:234:8ec1:4ad3 with SMTP id d9443c01a7336-23dd1d5cc19mr6352555ad.40.1751929375710;
        Mon, 07 Jul 2025 16:02:55 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1f0sm102785765ad.32.2025.07.07.16.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:02:55 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uYurM-00000008CeO-1qLV;
	Tue, 08 Jul 2025 09:02:52 +1000
Date: Tue, 8 Jul 2025 09:02:52 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 1/6] fs: enhance and rename shutdown() callback to
 remove_bdev()
Message-ID: <aGxSHKeyldrR1Q0T@dread.disaster.area>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>

On Fri, Jul 04, 2025 at 10:12:29AM +0930, Qu Wenruo wrote:
> Currently all the filesystems implementing the
> super_opearations::shutdown() callback can not afford losing a device.
> 
> Thus fs_bdev_mark_dead() will just call the shutdown() callback for the
> involved filesystem.
> 
> But it will no longer be the case, with multi-device filesystems like
> btrfs and bcachefs the filesystem can handle certain device loss without
> shutting down the whole filesystem.
> 
> To allow those multi-device filesystems to be integrated to use
> fs_holder_ops:
> 
> - Replace super_opearation::shutdown() with
>   super_opearations::remove_bdev()
>   To better describe when the callback is called.

This conflates cause with action.

The shutdown callout is an action that the filesystem must execute,
whilst "remove bdev" is a cause notification that might require an
action to be take.

Yes, the cause could be someone doing hot-unplug of the block
device, but it could also be something going wrong in software
layers below the filesystem. e.g. dm-thinp having an unrecoverable
corruption or ENOSPC errors.

We already have a "cause" notification: blk_holder_ops->mark_dead().

The generic fs action that is taken by this notification is
fs_bdev_mark_dead().  That action is to invalidate caches and shut
down the filesystem.

btrfs needs to do something different to a blk_holder_ops->mark_dead
notification. i.e. it needs an action that is different to
fs_bdev_mark_dead().

Indeed, this is how bcachefs already handles "single device
died" events for multi-device filesystems - see
bch2_fs_bdev_mark_dead().

Hence Btrfs should be doing the same thing as bcachefs. The
bdev_handle_ops structure exists precisly because it allows the
filesystem to handle block device events in the exact manner they
require....

> - Add a new @bdev parameter to remove_bdev() callback
>   To allow the fs to determine which device is missing, and do the
>   proper handling when needed.
> 
> For the existing shutdown callback users, the change is minimal.

Except for the change in API semantics. ->shutdown is an external
shutdown trigger for the filesystem, not a generic "block device
removed" notification.

Hooking blk_holder_ops->mark_dead means that btrfs can also provide
a ->shutdown implementation for when something external other than a
block device removal needs to shut down the filesystem....

-Dave.
-- 
Dave Chinner
david@fromorbit.com
