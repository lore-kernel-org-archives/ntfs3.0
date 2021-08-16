Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9392FAE
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 12:45:51 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id n6so26934927ljp.9
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ZT4eONejq0MjVzRHhlnf+5cG+diYvwCMZBalMlG6Nw=;
        b=aVhswyK9fWMq6U11Fa1V8OSkRGrnAfzIy//WZiOVa+I6m87IS9aRUsX0+4M/1AEwY1
         gh6gck1itzP3nc0b+sSNlq4gwArUlhptw9HKYkyAd24nJhQfG0JcMZHY0k1MOPbC3y4a
         /IzUwz14O8Oi1Z6fKWsssLsxPZalqCswcA0MJrvhOI1CwIx+m34CSQUvp5mOdX5yyia0
         vRTr+9uhxvSUFdzETAovz2W9p1iPB7OkhX/7Kpb8uQ4nqktklWwbi7pBNCdSnlaKIodv
         fZhsSgyNSpp6z2BFRwZn7d0pfdRAydzJZoj4pOeSCx9BwB9UaJKBO+w8r+gWi6Mf4FHV
         180A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ZT4eONejq0MjVzRHhlnf+5cG+diYvwCMZBalMlG6Nw=;
        b=d0AGIrddO7peiNQ+k3Uv9A1jRYjZuzhurrKphH/xAgGfg/MnElmaFQzbQcAKQ+wJWG
         +NRLj8+NYJUWx6pWn8wCLK5oYjWB6szHa0aN93fWqhmq6p/TyCpyg0dLXn162ss0hel1
         rEX4NUlVYBcLo3G/g0FTvrV7hogS2EAyMcINHG11Mi59PYzGkW4kM5zZc3wxvpU9vAAG
         8VspdYodrxAmQYSyZ2bnNrggv3QRLkAfq+Bn5aW+WTcfh2nWf7V0BMzn/oGoMUYlz/BS
         jvIDlpiN75p2RQvZ6PVSmS8bSQp6SsCz7G86Y50vjILMNpiK0BFXnnnZYnSTycL+WWeH
         Xm5g==
X-Gm-Message-State: AOAM533ZG62Xa3gLeT/nB774xkB9AyU9pbi6cVfA+aCGOYoBiJXAqc1V
	yOnNJQUSNa1GDE8F2tVBFhQ=
X-Google-Smtp-Source: ABdhPJxf49QYFanm5+rXyj4LkdrME/Ar2+RAAnbwL5QG9988Vu+hXnb4FWHfVkyS+kyl+m4nUo0ycg==
X-Received: by 2002:a2e:89c5:: with SMTP id c5mr12313583ljk.329.1629117949450;
        Mon, 16 Aug 2021 05:45:49 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w12sm294381lfq.277.2021.08.16.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 05:45:49 -0700 (PDT)
Date: Mon, 16 Aug 2021 15:45:47 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 2/4] fs/ntfs3: Remove unnecesarry mount option noatime
Message-ID: <20210816124547.avgxl7rf7uhluafd@kari-VirtualBox>
References: <20210816024703.107251-1-kari.argillander@gmail.com>
 <20210816024703.107251-3-kari.argillander@gmail.com>
 <20210816121818.GB16815@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816121818.GB16815@lst.de>

On Mon, Aug 16, 2021 at 02:18:18PM +0200, Christoph Hellwig wrote:
> On Mon, Aug 16, 2021 at 05:47:01AM +0300, Kari Argillander wrote:
> > Remove unnecesarry mount option noatime because this will be handled
> > by VFS. Our function ntfs_parse_param will never get opt like
> > this.
> 
> Looks good, but I'd move this to the front of your series.

I agree. I will do this.

