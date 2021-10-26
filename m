Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DEB2C9F
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 18:03:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id p16so633456lfa.2
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2GGvL3OyX4u2pk0BhtC79RMN/yPyLpo0WvmOYK7d5c0=;
        b=ReKdnRifiWjSsGSKbFMqxcb8x6jm8BmbmgexrUp6de0kSObYAMHpX8Y40HBqCd3oWU
         wc7pbOBcVBG6DAHfsp0fPx+y8eYT4kzuH8IIVGKc0Gjf/TdsbTP9wcCJXdoUpjri1kUa
         qTBVJYLRV7Uyrbzu9r7mxPJxky7ulya5wYaQgqKUGHDgUaQ5G8Op1U3GsBwJmKcTMPra
         4fIqOh+xRixvM8wYyn+LH1r4pkfRL81zrzEgxLIraWW632UcNyvcEr4b60cD0B0WdDjX
         n/FPwk8C/7iY/eUt1leSLybqWIV7YbYIhuBp2pIpIZYIV3LlsIImqKYS2cNprkXRscU+
         kBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2GGvL3OyX4u2pk0BhtC79RMN/yPyLpo0WvmOYK7d5c0=;
        b=mpSAcFTr2W2V1n/RaPQtxsPhfugQC+a4n2uRKzvweOrPkvBwH0EIWlnPCtRlEaALHv
         MZ218D1MEr1T1rIJBeAA8Zcq4OfUUjDwNyo/ZzqTtaYFYjlvRQqPipQfamNvV4w961bM
         Tawzy/QfX+CAftZgNnrxCbiPmc75HTYzoTG96+NuNpKz9nyoZx80BNXSkzClcjEJYXpC
         leOvt2VDc+DZJ5SeIz03xixkeALBuUh9ihyrdFVYly9aS5hPOu1aX/rahbi+8o3ga2Wt
         Gw32G/xTG8NCDYn8Cc6q/GWsa+yhQe0OuNTxlfRMUrdbihpAE73Fedq88hfqm4UrUvKY
         KpVg==
X-Gm-Message-State: AOAM5339t9975/6oZe6Be3aR+qDtWh8KsUvg2IW5aVWiy05RZbutHooQ
	dPCJl7sWFKGzEqPEurEsBgs=
X-Google-Smtp-Source: ABdhPJwPtrFOXuTzjezlNuB7srbgtsTwyN67HwmnyLhMfbuqdfxVKL2XU9CNIfJ8KRKFKLMfKKymhA==
X-Received: by 2002:a05:6512:3c97:: with SMTP id h23mr5618424lfv.640.1635271412288;
        Tue, 26 Oct 2021 11:03:32 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id f8sm1232868lfu.5.2021.10.26.11.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:03:31 -0700 (PDT)
Date: Tue, 26 Oct 2021 21:03:29 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: (very low importance) NTFS version message
Message-ID: <20211026180329.gduktdbsu4loo3nr@kari-VirtualBox>
References: <c3cb4ca3-5c5a-626c-8fbb-41fdd5ecfff@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3cb4ca3-5c5a-626c-8fbb-41fdd5ecfff@gmail.com>

On Tue, Oct 26, 2021 at 07:44:04PM +0200, Enrico Mioso wrote:
> Hello folks!!
> 
> in ntfs_extend_ini I would be more explicit when NTFS version is lower than 3.
> 
> I would replace
> ntfs_notice(sb, "Skip $Extend 'cause NTFS version");
> with
> ntfs_notice(sb, "Skip $Extend initialization due to NTFS version lower than 3");
> or something like that.
> What do you think?

Seems resonable at least for me. Wanna send patch or is this just
suggestion?

  Argillander

> 
> Enrico
> 
