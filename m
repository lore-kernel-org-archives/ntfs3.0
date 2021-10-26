Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E82C9F
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 18:17:24 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id l2so310348lji.6
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CbkycfBpiPzNz9mU9kLDzsxQuKQ9vzT3rMC0AKEjNkk=;
        b=PNi4bZGi9qc5Fq5YyVp5QoxTeUJ4eSQu8LDldDiJBDWYN34lZPCOz3EeFMrhlenKim
         Fyy/EYZ293+ika4AtxlkXQ4GzvFfrza/RPydEgRtXmV4TDKYnDfTTNwVu3dO6vg5806s
         EtCO9NN7q75ENNFzuV/qwvS/iKLrwxNbWiQ5oVi2li3YdHqlqCNz+8JOJOdXR5b388D2
         jM2OW+v/KALLxr5fUHrpIh+Qmujjg56HdN23B/SC5Wg1VLtwiXXwkFbmM+ZwQxL+UEgg
         DhZO89R+lM/raMYq2nvZ/vQiV9njZ1JzlsG2Y2xpwcnLfjky/Tj5iXNJhN0qBT6mYjWF
         3PAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CbkycfBpiPzNz9mU9kLDzsxQuKQ9vzT3rMC0AKEjNkk=;
        b=Rs5lvQzmmkNl/T0qsKBVy6GBD9Q6nqBXL57kUl4bzEc+dFfXZAQ6C3nb9BBrp5foLn
         IQi5JCUb9mDOen0sYXchA2exqcp6l27HaYgvioXSI9e+RJZaaBNyodtspfVy0CTU+1x1
         GmLWYyUmaRqepJiGMH8GHeB46o2Tm7NuFYQhz+eRHhkfsSQjqnDcgr+j6wEzptSKaHaD
         Ia5LgZ2PUN9rY7sexOFHGxK79XxSoDs5FTgq+ukiRDum31Pq/9OpW2Bucu3evnTZYScR
         6w9ZzNZtNdpIf8teqxUJQrtCvQhjGvBzZtn3GFzMT9eySmoV8MKaryRxdE7bNIHGQdNU
         ZJPA==
X-Gm-Message-State: AOAM53239M9UDcU5ypQYThovA6dmg0lFKdEwoibWCYlC96+s88MNKt6U
	jUx9dBSt/URAeWfABrSPuLA=
X-Google-Smtp-Source: ABdhPJyhMoeGvZPoK9EvZlMCo7em/vPsOoZzfbj4/UKWBmt47d67dHTmk7KQO6SQKGVxSofl3miYrA==
X-Received: by 2002:a05:651c:617:: with SMTP id k23mr27312236lje.402.1635272243035;
        Tue, 26 Oct 2021 11:17:23 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id g18sm46711ljl.26.2021.10.26.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:17:22 -0700 (PDT)
Date: Tue, 26 Oct 2021 21:17:20 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Ganapathi Kamath <hgkamath@hotmail.com>
Subject: Re: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Message-ID: <20211026181720.46jaw46hn2vwtqgk@kari-VirtualBox>
References: <a57c1c49-4ef3-15ee-d2cd-d77fb4246b3c@paragon-software.com>
 <19b0fc31-a28f-69aa-27dc-e6514a10643e@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19b0fc31-a28f-69aa-27dc-e6514a10643e@paragon-software.com>

On Tue, Oct 26, 2021 at 07:40:57PM +0300, Konstantin Komarov wrote:
> If size of file was reduced, we still kept allocated blocks.
> This commit makes ntfs3 work as other fs like btrfs.
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=214719
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> 
> Reported-by: Ganapathi Kamath <hgkamath@hotmail.com>
> Tested-by: Ganapathi Kamath <hgkamath@hotmail.com>
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 43b1451bff53..3ac0482c6880 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -494,7 +494,7 @@ static int ntfs_truncate(struct inode *inode, loff_t new_size)
>  
>  	down_write(&ni->file.run_lock);
>  	err = attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run, new_size,
> -			    &new_valid, true, NULL);
> +			    &new_valid, ni->mi.sbi->options->prealloc, NULL);
>  	up_write(&ni->file.run_lock);
>  
>  	if (new_valid < ni->i_valid)
> -- 
> 2.33.0
> 
> 
