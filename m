Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D591E86D
	for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Mg8dM7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e741123acso10251877e87.0
        for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 03:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705316911; x=1705921711; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n8zZPv16a04c2JrdAylXruCjxboLXHW/YtOK6cugPVg=;
        b=X4Mg8dM7tOQAB5p+xUnNuueYRcEzFz7MtakSXSw2M/3Nqne579c4zc3U6rGjVkJNF3
         J5tFnv0vCqAL4YrlHqKMJVrI8lTfugZoeReN5Chuf2WUAiP6Cr/7196alEl07M6HeueX
         oI2J1OsUS++SXy/OLFMzTqp1H+4n6jLWO0Q9L1Y66VsBSl9tpmPFSkFrB2jwlZwk8MUF
         hVXhNJzWCLkoJaU5BJ7X8c6XSTra+TXFh+fDKl57b/VZQHp9OynGtjS6WpkBgj6O25EO
         RCHa7wUSXQ9OBW2bdsumFCQrb93N/mtXWET9XdcSuT0Y7Osikr6N+1sIduRlZw06ktSt
         b/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705316911; x=1705921711;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8zZPv16a04c2JrdAylXruCjxboLXHW/YtOK6cugPVg=;
        b=Q4rToytkULLO574NZJD3AzJwipBU+LfQVYF0sEDQaOBtZKHFOfKRhATkYp0kDlPeza
         mqftELkXgbkSWazcAd3bODyojPqmW43vlOvJzVg4TydT0vbbMgAKYRI9kQZp8EvBXIWk
         NLUUkyHMg6S5goZm2JsCUEXVdYfWDMmveNt5393IEtoAEu5N8zMxH68rIfsImQ45Icy9
         3B7SJDHSiOQqT/XqJT56frxv4hfYqB8ehNDMBKeBxg4+udaHn1CY9uWptZGEiJ59ARIx
         ycgcBKf8iSfjyL3e2IOArDtptkt6szKMBGXbDxAD+kZDE5lompxOEWQX2HUwDzUuE8/m
         azwg==
X-Gm-Message-State: AOJu0YxWZDqJfdLkaJaTL5HwZwgn01H/zqCNl2OpdUvgFNO5d9YmUGr9
	tRaCUxXXEuWwtQ67ai5NkRs=
X-Google-Smtp-Source: AGHT+IGgAdKBX9EYgL2//c8WYkYqgwnBhB0dF1GytNx0iq9EFmXcKA0+uYVXLhqreQWLJzhUle94nQ==
X-Received: by 2002:ac2:5b1a:0:b0:50e:e1dc:9f20 with SMTP id v26-20020ac25b1a000000b0050ee1dc9f20mr2285955lfn.28.1705316910442;
        Mon, 15 Jan 2024 03:08:30 -0800 (PST)
Received: from rivendell (static.167.156.21.65.clients.your-server.de. [65.21.156.167])
        by smtp.gmail.com with ESMTPSA id dw13-20020a0565122c8d00b0050e7bc67cf7sm1444188lfb.138.2024.01.15.03.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:08:29 -0800 (PST)
Date: Mon, 15 Jan 2024 12:08:29 +0100 (CET)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: Anton Altaparmakov <anton@tuxera.com>
cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
    Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
    linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev, 
    Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH] fs: Remove NTFS classic
In-Reply-To: <8a5d4fcb-f6dc-4c7e-a26c-0b0e91430104@tuxera.com>
Message-ID: <00906203-9df2-ee5b-da37-b45073373ee0@gmail.com>
References: <20240115072025.2071931-1-willy@infradead.org> <8a5d4fcb-f6dc-4c7e-a26c-0b0e91430104@tuxera.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



On Mon, 15 Jan 2024, Anton Altaparmakov wrote:

> Date: Mon, 15 Jan 2024 12:00:35
> From: Anton Altaparmakov <anton@tuxera.com>
> To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
>     Christian Brauner <brauner@kernel.org>
> Cc: linux-fsdevel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
>     ntfs3@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
> Subject: Re: [PATCH] fs: Remove NTFS classic
> 
> Hi Matthew,
>
> On 15/01/2024 07:20, Matthew Wilcox (Oracle) wrote:
>> The replacement, NTFS3, was merged over two years ago.  It is now time to
>> remove the original from the tree as it is the last user of several APIs,
>> and it is not worth changing.
>
> It was my impression that people are complaining ntfs3 is causing a whole lot 
> of problems including corrupting people's data.  Also, it appears the 
> maintainer has basically disappeared after it got merged.

To be fair - it's more like "intermittent" maintenance rather than "no maintenance".
Konstantin - would it be OK for you to have a co-maintainer to help out?

Enrico

>
> Is it really such a good idea to remove the original ntfs driver which 
> actually works fine and does not cause any problems when the replacement is 
> so poor and unmaintained?
>
> Also, which APIs are you referring to?  I can take a look into those.
>
> Best regards,
>
> 	Anton
> -- 
> Anton Altaparmakov <anton at tuxera.com> (replace at with @)
> Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
> Linux NTFS maintainer
>
>
