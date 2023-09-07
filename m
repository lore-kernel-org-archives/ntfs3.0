Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911F28E1
	for <ntfs3@lists.linux.dev>; Thu,  7 Sep 2023 15:23:12 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c1f8aaab9aso9249535ad.1
        for <ntfs3@lists.linux.dev>; Thu, 07 Sep 2023 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694100192; x=1694704992; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ0CpUOcPuxcuBRABu/k9kg3Q8DjApWrdkW9McQp5wM=;
        b=Mxf4paO9ZLBjORNTtHfeA8JRwv1ybAzvbzj8M7IihvGXUIAef8cSSVlExFia5inuy4
         H7kEDCY/OYpLJD3hjXUKJ3zIcoo3MHu871BKl4MGeWwe40JLNOekOmxWSjHsWevuEm7t
         H5ycsCplNB9OOT20B2BFis/nkMy4T9hn459UxR584Yo5QCnSrwwDED4+Nx6uadCVYzRX
         lc+O26c2SPxhf4osmP4b13IZYwuOo0Y+ZlwD2RLSKq+s/dCID/iBSaGtwOAv+Etr6f2b
         SfZ4Y9RtitSB/W8uQa2ECGAbAgu+qzpgXBCtkujzExDCjm22SEZR83vYr1+rjxpcOPt0
         sR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100192; x=1694704992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ0CpUOcPuxcuBRABu/k9kg3Q8DjApWrdkW9McQp5wM=;
        b=BhwVG4Q/AR5oYGR4MIs7ZXg5yMzdBk18QKCB1Pw0y9HFe9Kto+4wCVW7zQCaaSc4Fd
         EV7B2dcfz/pW93WuQ/KY9m2RcZGdTXkjGOdviNyZqB+GU2Ajxr6Ywu1GL98BQX3Qasch
         twH/eWdDqascBxmWK7eDktfBFEJ1gegLHLYxOlE7dtsk6TnLDmk9XlskkCvFxVT6d7BJ
         rqQxyBNKs+tG4t9GuKh3TT10lGWFadA8RgAc2IxmDIn7Bajo0yiTv/WffYUKve1h2OOl
         9XWrHE0PU/jGhmjR+CqMk8EXAxN681s+IVvi68bb31vMsxvrbOgpaepqQ7Ygc/cBEMtN
         gr0Q==
X-Gm-Message-State: AOJu0Ywx7Vz1mp45iSBD+/aKbfGWxOJkcMNVf8Uoyy6iJKdjb47Agloh
	Kq/7WkBdmAgkieHTTSsnkSs=
X-Google-Smtp-Source: AGHT+IFwNcs9Ljydqg3D8vQKhkC795cu5TrIekXRsrD/qAZOZq6eizQDLVHH9eoXr/ABjeBeoLRMHw==
X-Received: by 2002:a17:90a:5d0b:b0:273:4944:2eba with SMTP id s11-20020a17090a5d0b00b0027349442ebamr17410965pji.40.1694100192395;
        Thu, 07 Sep 2023 08:23:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ga18-20020a17090b039200b00262eb0d141esm1611029pjb.28.2023.09.07.08.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 08:23:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dc4b7b2c-89c0-d16f-43e2-0aec5c9b8e1b@roeck-us.net>
Date: Thu, 7 Sep 2023 08:23:09 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/13] ntfs3: free the sbi in ->kill_sb
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
References: <20230809220545.1308228-1-hch@lst.de>
 <20230809220545.1308228-14-hch@lst.de>
 <56f72849-178a-4cb7-b2e1-b7fc6695a6ef@roeck-us.net>
 <20230907-lektion-organismus-f223e15828d9@brauner>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230907-lektion-organismus-f223e15828d9@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/23 06:54, Christian Brauner wrote:
> On Thu, Sep 07, 2023 at 06:05:40AM -0700, Guenter Roeck wrote:
>> On Wed, Aug 09, 2023 at 03:05:45PM -0700, Christoph Hellwig wrote:
>>> As a rule of thumb everything allocated to the fs_context and moved into
>>> the super_block should be freed by ->kill_sb so that the teardown
>>> handling doesn't need to be duplicated between the fill_super error
>>> path and put_super.  Implement an ntfs3-specific kill_sb method to do
>>> that.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> Reviewed-by: Christian Brauner <brauner@kernel.org>
>>
>> This patch results in:
> 
> The appended patch should fix this. Are you able to test it?
> I will as well.

Yes, this patch restores the previous behavior (no more backtrace or crash).

Tested-by: Guenter Roeck <linux@roeck-us.net>

I say "restore previous behavior" because my simple "recursive copy; partially
remove copied files" test still fails. That problem apparently existed since
ntfs3 has been introduced (I see it as far back as v5.15).

Thanks,
Guenter

