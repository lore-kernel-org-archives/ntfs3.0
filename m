Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2268
	for <ntfs3@lists.linux.dev>; Fri, 26 Nov 2021 11:52:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bu18so23794484lfb.0
        for <ntfs3@lists.linux.dev>; Fri, 26 Nov 2021 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FO4VBFnJmFurD2UzwMUBKDGtdPRzRFFL5pbgvr6OIHE=;
        b=KNnn4KLAPOrudXuGH603uhr8HkHMQuc/NZJJZjsg2JRzHZb0D0GxNm0hyj2PplChq3
         apwonvfPdXQqh5NvcO6Y2tVtP5TrAcca2ELU7BBIxoLadDuQr45DSUB2T8TXfvrqBbCp
         vBpAsJs2s4alIKcm2kio1ec0oFbPIR7aSbTxlHG+M8flMmmsJWDpTtlWQIc+O/L1/GKY
         D0tr/hrL5iZNdzfCNTL0P2o3LPPy73/RfMpeh6G77dgbbM9y3e9hITshizcOg08jRqn+
         41+/rqoBe49ltf3OJ53VI2wJU4eNZb0L8oRiUAGHRgnzaDl5sQHM2sI5vXYfZezvY3Oe
         OI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FO4VBFnJmFurD2UzwMUBKDGtdPRzRFFL5pbgvr6OIHE=;
        b=EQsPKnQoMBz/qesykti72zmXT96aWX2+kxF6ZpT0zpM7Vah1qmgplmvEFxvWGGNdTw
         9JA2HgiYAJBuG+8HfL8if4a3dp7k0C1Kr9z+I3ODuerhn6aicK8kWMGQugmwxO6zt1Gg
         768kHCRhcpm2SrmD2P0lpjg82vyXqHgFIyvpn3awyFA9yIyOLldClA3kEVvvGUcHL0Og
         VnqFjHbBwuNO6fzTqoQGTq3aDls2A/Qkzzi5TIwUbYc6xILATujWIM4fyhYk7t482mgm
         qZ86Neg/DsX8yuivkpofZkjArA23Zw2bDUw8S55l45o9Q4Y7oeP3yd5UUXaXmS1G8FZ9
         yT6g==
X-Gm-Message-State: AOAM5302/N5AGvichCJVb4FDbbeOYIrE1cQpstkLcGEiEQyPhegMokys
	IDUz8x7L0xCocd0aOeX4+z3EBUQjdmAkQw==
X-Google-Smtp-Source: ABdhPJxhuNo7zNlSNKnh6lK7cs0lfHFvVg9IF/LOx2XuqynLIf8ajSj4M4U52mAIelNciAxREQnHhg==
X-Received: by 2002:a19:f242:: with SMTP id d2mr29542032lfk.516.1637927530039;
        Fri, 26 Nov 2021 03:52:10 -0800 (PST)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id b13sm557874lfv.200.2021.11.26.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 03:52:09 -0800 (PST)
Date: Fri, 26 Nov 2021 13:52:07 +0200
From: Kari Argillander <kari.argillander@gmail.com>
To: Rushab Shah <rushabshah32@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>,
	ntfs3@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Doc/fs/ntfs3: Fix a trivial typo
Message-ID: <20211126115207.jgtmr2skapg5exzv@kari-VirtualBox>
References: <20211116193138.335050-1-rushabshah32@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116193138.335050-1-rushabshah32@gmail.com>

On Tue, Nov 16, 2021 at 11:31:38AM -0800, Rushab Shah wrote:
> Correct the typo effectice -> effective
> 
> Signed-off-by: Rushab Shah <rushabshah32@gmail.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  Documentation/filesystems/ntfs3.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
> index d67ccd22c63b..05e9c49b7400 100644
> --- a/Documentation/filesystems/ntfs3.rst
> +++ b/Documentation/filesystems/ntfs3.rst
> @@ -104,7 +104,7 @@ this table marked with no it means default is without **no**.
>  Todo list
>  =========
>  - Full journaling support over JBD. Currently journal replaying is supported
> -  which is not necessarily as effectice as JBD would be.
> +  which is not necessarily as effective as JBD would be.
>  
>  References
>  ==========
> -- 
> 2.34.0
> 
> 
