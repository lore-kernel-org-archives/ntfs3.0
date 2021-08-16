Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDF62FAE
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 03:03:52 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id g13so31544909lfj.12
        for <ntfs3@lists.linux.dev>; Sun, 15 Aug 2021 20:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UagkBO5dswM1A7N/GzHlKRMWthTHW5ve4NkRn5WU5fM=;
        b=OJVfAWKUqcnkopr/6j3qy9w8O6+JfjlMVq/VBqZGvI/h17ShVWEu8o6VqJeZR6NgAq
         WRZuxkOEZrSgsI2xafwHgriZseIAezM2oHHrsjMpqLZHW5MgtZDWZnYcNwHqngEwSjP9
         ZqKgN2UBFKXBYovxwcmF1BDfSDhnraPs8CokzYX47wQ6Qh8UMjsO9G0dINgxnoPokb/6
         PvoDdhNKpEnW/G1yBNo6hjkfDQkHrovCAnnzASLHQQbMpXUO94WAM1pFVIicNNnBi4LP
         6t1erJru6F8Stb9aFbMuYRG7KRjicPUIILihO7ZVzg8Z9iGNaWQaDDRpujpWw8QJ+XrK
         GZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UagkBO5dswM1A7N/GzHlKRMWthTHW5ve4NkRn5WU5fM=;
        b=eGcTs43lPfRXTiSckXAAARxzcTPUgo5uE311ggn8UIJ/LA410XQLPG5IriAlqP4BvN
         zO6wqDbogv+4KwyN0YSmoOs2f62tW5ah9iP8YTEoUEYlwPLUGVBIzcg/E1BQ8DpHfSMv
         m/Bvgo8M3yd6mTpLohq+7RNreO3t1Rc7S3hicx5fAQzqyj/y164jvK+WSPI4Po1rfA4l
         BAhqWk+cvRuzVKYUNLBQrLd8Dm+8oDA6pCgO/Ab2xQ/3dVrWkaW920e3Io/DQUvlymOa
         dA35FZ3VetflY6nDsQ6SwnLQUwiCok2z/fVr/NFkILB441PqJXmzGSjDZZnadVyI+lLV
         c72Q==
X-Gm-Message-State: AOAM530IUTKaJdO2vfi14aWRZfkvpIM9vBXUkYTIwH/uPE1//AQ55yT3
	ltO8h41fvYFCnJvhpyJqqqo=
X-Google-Smtp-Source: ABdhPJylRB53Yr/AWRJ9H48QfdHep+FldPT22PKddb4Evv1U/zWMpElywPYtV+fT3wLGvz2tqRptZw==
X-Received: by 2002:ac2:505a:: with SMTP id a26mr1701151lfm.56.1629083030632;
        Sun, 15 Aug 2021 20:03:50 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m4sm1019379ljq.96.2021.08.15.20.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 20:03:50 -0700 (PDT)
Date: Mon, 16 Aug 2021 06:03:48 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 0/4] fs/ntfs3: Use new mount api and change some opts
Message-ID: <20210816030348.tjws4ce3uvn6qben@kari-VirtualBox>
References: <20210816024703.107251-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816024703.107251-1-kari.argillander@gmail.com>

As I screw up subject with this one I resend this with replay.

On Mon, Aug 16, 2021 at 05:46:59AM +0300, Kari Argillander wrote:
> This series modify ntfs3 to use new mount api as Christoph Hellwig wish
> for.
> https://lore.kernel.org/linux-fsdevel/20210810090234.GA23732@lst.de/
> 
> It also modify mount options noatime (not needed) and make new alias
> for nls because kernel is changing to use it as described in here
> https://lore.kernel.org/linux-fsdevel/20210808162453.1653-1-pali@kernel.org/
> 
> I would like really like to get fsparam_flag_no also for no_acs_rules
> but then we have to make new name for it. Other possibility is to
> modify mount api so it mount option can be no/no_. I think that would
> maybe be good change. 
> 
> I did not quite like how I did nls table loading because now it always
> first load default table and if user give option then default table is
> dropped and if reconfigure is happening and this was same as before then
> it is dropped. I try to make loading in fill_super and fs_reconfigure
> but that just look ugly. This is quite readible so I leave it like this.
> We also do not mount/remount so often that this probebly does not
> matter. It seems that if new mount api had possibility to give default
> value for mount option then there is not this kind of problem.
> 
> I would hope that these will added top of the now going ntfs3 patch
> series. I do not have so many contributions to kernel yet and I would
> like to get my name going there so that in future it would be easier to
> contribute kernel.
> 
> Kari Argillander (4):
>   fs/ntfs3: Use new api for mounting
>   fs/ntfs3: Remove unnecesarry mount option noatime
>   fs/ntfs3: Make mount option nohidden more universal
>   fs/ntfs3: Add iocharset= mount option as alias for nls=
> 
>  Documentation/filesystems/ntfs3.rst |   4 -
>  fs/ntfs3/super.c                    | 391 ++++++++++++++--------------
>  2 files changed, 196 insertions(+), 199 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
