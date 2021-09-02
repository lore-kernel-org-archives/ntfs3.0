Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA743FC1
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 08:10:24 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id j12so1982875ljg.10
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=V/B729z3GfSMViBmOQRhXkJF2dE/VetTFeIPDS8xMAk=;
        b=nNPOBa2NHrXxrWPG+s0D+7SVdwsvGrsKzmFU5+siTSZKuhNKVgeBsbXJ25MRNQ5lFX
         v7ZnL5ysq4EL2BK8xL6W3Ms1VPyCw8lFkboiIbfthjAtlj3fB641+lJgOHnzgPhHAw/L
         2xPYEPhpFg2uYmqFm9BjfMdhnvwNSZNddpIpf/bYTRA7VVol3LP0OHSU2//iaeuL2TW0
         PbOf6QaLJWfPbKN+QNDrHE0oFH8DI9VsyOlosjoSCbkfcMT+7xcuE0kZcSIfplhwJlA3
         3KEIiCk4qBjD6sjCoCDqwqmdKq/fVyzf7ALtHZHextITZu7tWjjsZn7qVnZNj0K8p4/N
         B0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=V/B729z3GfSMViBmOQRhXkJF2dE/VetTFeIPDS8xMAk=;
        b=LxCOfG9l+398AOqoiFtTabyND6hkGULkOQRxwxY2w6waFh9bXGJnZJ4/eTCIgQjHaA
         kskqZjzJZXjMBrrKG3mr9Bw6m3FAhjkTjuXVutUPFLtAS8yAzbTM4baoUX23i/lEwRY3
         YDB8ShsitvW6183aNNz1ZgUUfGv1xqtOrmHdRTWe6GBE0Z1oW9ZDr36Y3R0l7zba8v80
         2yj66H5wJOrCYXYierFh4CIHzTCprNWZR1FUra3LBoSHHAtMzFypwo0k2OD3mf+0skI0
         htyrF+a9rbxHcoafmrwNFpb7gpM+Yd+8343VcrAv7tNFrBWC1kV9MC3UgcVAD/rDvkn8
         k6Kw==
X-Gm-Message-State: AOAM530Iz/d9vO31Kjcol+fv9g5w8/caQjJMmYgCKjxET0PkSYpdo4PE
	9iqlpfGfv8itVOTz6prjrew=
X-Google-Smtp-Source: ABdhPJzKza2FO+ecYPOslUvddsKLjCd1AwSysOHdd4EMHMIUb5M3xUmeynHwXIRYWSceACX1LcrXtg==
X-Received: by 2002:a2e:509:: with SMTP id 9mr1459438ljf.453.1630570222948;
        Thu, 02 Sep 2021 01:10:22 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id p3sm125511lfa.228.2021.09.02.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 01:10:22 -0700 (PDT)
Date: Thu, 2 Sep 2021 11:10:20 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Joe Perches <joe@perches.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] fs/ntfs3: Use consistent spacing around '+'
Message-ID: <20210902081020.g5hclc45zjng3ll2@kari-VirtualBox>
References: <20210831181505.1074767-1-kari.argillander@gmail.com>
 <20210831181505.1074767-3-kari.argillander@gmail.com>
 <1d303f4553e67abee4f0c4cdc32231813a4bcb3f.camel@perches.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d303f4553e67abee4f0c4cdc32231813a4bcb3f.camel@perches.com>

On Wed, Sep 01, 2021 at 09:22:19PM -0700, Joe Perches wrote:
> On Tue, 2021-08-31 at 21:15 +0300, Kari Argillander wrote:
> > Use consistent spacing around '+' for better code reading. Checkpatch
> > will also be happy.
> 
> I think you should remove the + instead

Konstantin can you look this as this was introduce by you just couple
days ago? 

> 
> > diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> []
> > @@ -1451,7 +1451,7 @@ int ni_insert_resident(struct ntfs_inode *ni, u32 data_size,
> >  		attr->res.flags = RESIDENT_FLAG_INDEXED;
> >  
> > 
> >  		/* is_attr_indexed(attr)) == true */
> > -		le16_add_cpu(&ni->mi.mrec->hard_links, +1);
> > +		le16_add_cpu(&ni->mi.mrec->hard_links, + 1);
> 
> 		le16_add_cpu(&ni->mi.mrec->hard_links, 1);
> 
> 
