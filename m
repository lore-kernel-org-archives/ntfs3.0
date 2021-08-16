Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6B42FAE
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 12:48:50 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id x7so26982494ljn.10
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 05:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IAseUJzCEH3EGqR891+PdvwcBt5uEgyLMqq+opj8S3M=;
        b=CWHqECygy9DQCAIDNbOx5cSJT7oXu06wN1f6J4ZzT3BxRAOmR+JDHcEohf/xjXMDEZ
         tr++ZkV/+vnNEs4frOREIBmWE7GCvZPInjym1EClTRJddOiVWTDxv1r3p9sopMwPMBpk
         ny6Ydi28Cw34Uqkc6Njg0IbTl1N3a5bNYjKVhYAIZkjsh0WvgMQFBY/9IEBBk/2Ql4h3
         /fjGwz8QZSXLlsVhL7q63/G3JHbkG4rZXll7h+NjA025Ru2rhFlO2NwU+WNUw7AS9okm
         XZTXcvOkmxx1M77iJLlKwbmHerLS+Pkv+kyZK3sEvoZANVY+Z5iC95J6PQejwqSV+rCO
         9wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IAseUJzCEH3EGqR891+PdvwcBt5uEgyLMqq+opj8S3M=;
        b=OxcdVLIWyJI1IbJ0DMnaqMm4eEEIrWbhQH8TEQmKQ3dDXJAkSarjUJ86147ff65Csa
         tUmoZDVpKDUYiNcJT1/txo2IiKPWUGP1Ea7CApkbyDM0eNPWurUSSwRi2MXaigY04X22
         df2MUPHgHlI5uTxqWnIgSglVVhn3pd19LmDHu4F1P3omMY3cfjG8xVuylgxWvDGtNah+
         Bdrk1N8YFZ8siG2e0Xs/CrccoNk5dEkKzvhgYC2evECqSGNxEk0xpZ0ITEkvStNq0dU4
         vnyU8Ukq+DiXDDl0p0X9jwuN6aRiN27txNHljNHYsURwQzadhjgteA6XmgrThqTRLv5c
         g27g==
X-Gm-Message-State: AOAM530b5SJHHgO0QR2hcq/xas+/quHFr3vaYFyUZVEXsnuQVdjYjS8z
	YgVuZbDbdzsfCusgQW95ZBY=
X-Google-Smtp-Source: ABdhPJyokRtXOdYbc9fYHAFaKAkBRDUCseGttle5YbiP+rZH54yqMi8rEAeCFs1cVaLKFF3KsiIi1A==
X-Received: by 2002:a2e:a811:: with SMTP id l17mr11921981ljq.456.1629118128250;
        Mon, 16 Aug 2021 05:48:48 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id h1sm940645lfv.226.2021.08.16.05.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 05:48:47 -0700 (PDT)
Date: Mon, 16 Aug 2021 15:48:46 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 0/4] fs/ntfs3: Use new mount api and change some opts
Message-ID: <20210816124846.sp4topnxfyamc62y@kari-VirtualBox>
References: <20210816024703.107251-1-kari.argillander@gmail.com>
 <20210816122721.GA17355@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816122721.GA17355@lst.de>

On Mon, Aug 16, 2021 at 02:27:21PM +0200, Christoph Hellwig wrote:
> On Mon, Aug 16, 2021 at 05:46:59AM +0300, Kari Argillander wrote:
> > I would like really like to get fsparam_flag_no also for no_acs_rules
> > but then we have to make new name for it. Other possibility is to
> > modify mount api so it mount option can be no/no_. I think that would
> > maybe be good change. 
> 
> I don't think adding another no_ alias is a good idea.  I'd suggest
> to just rename the existing flag before the ntfs3 driver ever hits
> mainline.

Konstantin can suggest what should we call this.

