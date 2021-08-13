Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C311168
	for <ntfs3@lists.linux.dev>; Fri, 13 Aug 2021 15:53:55 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id x7so16240644ljn.10
        for <ntfs3@lists.linux.dev>; Fri, 13 Aug 2021 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aMX+a6wP1iCii8UfZRNRB0ftn/+EsmPtpxrSR4YPCHE=;
        b=W9cMdo1w90Diw8YIJIySfXDhuAHRZl6bLlzMy7C/GZlgThteZ87DT6k5EUWIuabAlB
         tWt1TPSHNg3bXs7ax5kd/61lL5jmXO/MLvYPb/JLvZnqyVDQZvQm94gmr5qyThFmP+x2
         3wFXB4sG8RpIOCrplGiQkG2WJsXqOmzRET/iPhQQH1yHgWiMADGibwzGgVEWl1uYAQ+B
         /HwQ76FVke+ne4Mmafgmbgmr+J8vqnZEL0lKzCdukKFOBNU0Qd9MdJ7/63EqDtGva0p2
         JU6fQTQUTqfWd30QLLNwANN+cLyFzyiDrKcdkpiSyMawhwpxOvkLnaT+l0oVLfVA9wa5
         rkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aMX+a6wP1iCii8UfZRNRB0ftn/+EsmPtpxrSR4YPCHE=;
        b=eittXatHlMcUPpDl4L52axmgOIc8FM6PVftUu/QQCxz3xnjr1IbssADRXIxvrFTG0m
         /ebLnHCt1CbLcxKSEbyhxZTRUa6l8ra7BNuss8kHrHuUn/AwG4JgeLWwhngVoG7n0BDc
         SKXYonc1wXxxdy99pYdJbBmOWCjkAPosEABbZOPOoqOsAYja6Z3IGocfDl6GBb8OmNCQ
         m2xqXj3a2Xi520U0zEzFcpMTeavta23lHh4IMVGONot+1PBg7rNsfOpT7olj8EAbqcIp
         x+dNFPALGdPpkdZK7lLdyoYJ0+c2NkznDXDv+kgn2my4w4bGnqCcB19+euOwGeqX3cqT
         41Xg==
X-Gm-Message-State: AOAM531ywFxM6liVdrVFWHYyqHZWfQMaqG7/H7Kmrix8J/bud8bZ9jo6
	/zPg9HRaHCzjG34gyJuJ8NQ=
X-Google-Smtp-Source: ABdhPJxY3aZpHjI5xq9CX1t4DztTg0tQ+aaWxIsVh57v1CyenE1WGSs5BEGkZhD5t5ELqtbCF6HAsw==
X-Received: by 2002:a2e:8688:: with SMTP id l8mr2308140lji.157.1628870033611;
        Fri, 13 Aug 2021 08:53:53 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i23sm188939lfo.76.2021.08.13.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:53:52 -0700 (PDT)
Date: Fri, 13 Aug 2021 18:53:50 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
	ntfs3@lists.linux.dev, viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org, pali@kernel.org, dsterba@suse.cz,
	aaptel@suse.com, willy@infradead.org, rdunlap@infradead.org,
	joe@perches.com, mark@harmstone.com, nborisov@suse.com,
	linux-ntfs-dev@lists.sourceforge.net, anton@tuxera.com,
	dan.carpenter@oracle.com, hch@lst.de, ebiggers@kernel.org,
	andy.lavr@gmail.com, oleksandr@natalenko.name
Subject: Re: [PATCH v27 00/10] NTFS read-write driver GPL implementation by
 Paragon Software
Message-ID: <20210813155350.vcoxqtox2ezvybgb@kari-VirtualBox>
References: <20210729134943.778917-1-almaz.alexandrovich@paragon-software.com>
 <20210729162459.GA3601405@magnolia>
 <YQdlJM6ngxPoeq4U@mit.edu>
 <20210812170326.6szm7us5kfdte52u@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812170326.6szm7us5kfdte52u@kari-VirtualBox>

On Thu, Aug 12, 2021 at 08:03:26PM +0300, Kari Argillander wrote:
> On Sun, Aug 01, 2021 at 11:23:16PM -0400, Theodore Ts'o wrote:
> > On Thu, Jul 29, 2021 at 09:24:59AM -0700, Darrick J. Wong wrote:
> > > 
> > > I have the same (still unanswered) questions as last time:
> > > 
> > > 1. What happens when you run ntfs3 through fstests with '-g all'?  I get
> > > that the pass rate isn't going to be as high with ntfs3 as it is with
> > > ext4/xfs/btrfs, but fstests can be adapted (see the recent attempts to
> > > get exfat under test).
> > 
> > Indeed, it's not that hard at all.  I've included a patch to
> > xfstests-bld[1] so that you can just run "kvm-xfstests -c ntfs3 -g
> > auto".
> > 
> > Konstantin, I would *strongly* encourage you to try running fstests,
> > about 60 seconds into a run, we discover that generic/013 will trigger
> > locking problems that could lead to deadlocks.
> 
> It seems at least at my testing that if acl option is used then
> generic/013 will pass. I have tested this with old linux-next commit
> 5a4cee98ea757e1a2a1354b497afdf8fafc30a20 I have still some of my own
> code in it but I will test this tomorrow so I can be sure.
> 
> It also seems that acl support is broken. I also suspect ntfs-3g mkfs in
> some failure cases. So maybe ntfs-3g mkfs will give different result than
> Paragons mkfs. It would be nice to test with Paragons mkfs software or
> that Paragon will test with ntfs-3g.

I have made more testing and it was actually my code which cause 013 not
fail. It is still pretty strange. I have made code for new mount api (fs
context) and 013 still get deadlock but still test will pass. This only
happends if acl is on. Though this is intresting why this happends. I
will not use more time for this now. I will try to focus fs context
mount api for now.

