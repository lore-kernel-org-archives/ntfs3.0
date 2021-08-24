Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3993FC1
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 08:22:01 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id r9so43764317lfn.3
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 01:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zZwq+pN1VXh0KVPNvZvmvIYWYVH8kNxfn6jyHSUVlpI=;
        b=KFHgYjhqWZ+XExPs7OkTkgRUZWc184YLB3C7EPH0IRK4t3Vf27AIWDm4S3VsFdTgaL
         N/wbrR34Pq0GPen2jXaWbjO+1H7p6xGPNBj2dq1K4PXD/TfaqKDtA+nzxPTnVD2A369p
         iUtnacQVqYLsggBct+Haqoobg+JshRCTt2XHvVLfJF4G9Pn28KvMXO9Mj4CJ0v2Y80m3
         H91V8q17ghkFw7lXoujQb3//myxJ3FawLnsPjRdH9s9a1EcybLqwmVJENBty1+UJb4XU
         wcLx8rNYBvgY4o/XkM7cCcYWFY1/QZoa5ewTOkTcIjOgJyj7xEiYecbnBC9K1fFHcZ91
         r2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zZwq+pN1VXh0KVPNvZvmvIYWYVH8kNxfn6jyHSUVlpI=;
        b=OZ6aldJC++M1t4NYVEMMhGdXFayYSEWeTRYIsk1Rogia6/WxdFo/tRBrLpi2q2qn/l
         oMwIlOuJQBa+l9h1luCJPBNr/bJnOktVkn8JJeokHe1PryPCkeNkre6tuYWnd0paFHVq
         vKvXDRyT6bkWW0tlR3zREPEYCBo1PR7+yqHwjkv74TuEclfecpu7y/jIqzweQlqssOqR
         5WU1qswrcHtRuYRMhheYqccdgrTvpj9xSku5MmVm6KFP1o8jgFS7Ie3Q8BRVB+fF+JKu
         YtGTVK+rzHTEdsSzB8PajKU3IH64tzNC27Ngo4q9rM4jz0JaC7KBkjUINoeidxhlSdXg
         zo8w==
X-Gm-Message-State: AOAM531JarkL9FiRlF9rHB+IA0G8Z499WEcZBhflMehDCvQIoZXXSrhn
	O14XFloSb4dFsX9XXZG1XOs=
X-Google-Smtp-Source: ABdhPJyLyRhJ1eQfQW63C4umAP+Jx2W+GE/xefElm4Uk/uQgdb5S7TbW4Xbg2HhjaMyO4YIpldkMPg==
X-Received: by 2002:a19:4958:: with SMTP id l24mr27134681lfj.48.1629793319923;
        Tue, 24 Aug 2021 01:21:59 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id c10sm1705295ljr.134.2021.08.24.01.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 01:21:59 -0700 (PDT)
Date: Tue, 24 Aug 2021 11:21:57 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 3/6] fs/ntfs3: Use new api for mounting
Message-ID: <20210824082157.umppqksjl2vvyd53@kari-VirtualBox>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
 <20210819002633.689831-4-kari.argillander@gmail.com>
 <20210824080302.GC26733@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824080302.GC26733@lst.de>

On Tue, Aug 24, 2021 at 10:03:02AM +0200, Christoph Hellwig wrote:
> > +	/*
> > +	 * TODO: We should probably check some mount options does
> > +	 * they all work after remount. Example can we really change
> > +	 * nls. Remove this comment when all testing is done or
> > +	 * even better xfstest is made for it.
> > +	 */
> 
> Instead of the TODO I would suggest a prep patch to drop changing of
> any options in remount before this one and then only add them back
> as needed and tested.

This could be good option. I have actually tested nls and it will be
problem so we definitely drop that. I will wait what Konstantin has
to say about other.

> The mechanics of the conversion look good to me.

I have made quite few changes to make this series better and will
send v3 in the near future.

Main change is that we won't allocate sbi when remount. We can
allocate just options. Also won't let nls/iocharset change.

