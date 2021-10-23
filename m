Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F82C81
	for <ntfs3@lists.linux.dev>; Sat, 23 Oct 2021 09:40:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 204so5430477ljf.9
        for <ntfs3@lists.linux.dev>; Sat, 23 Oct 2021 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pT0uTKRS3mJTAOZ8+3JtVuSzB8Uv+VsNHlXjOV4iOi4=;
        b=KnpYQRwx7RC97GWh9T04A9uTAD8Ow3F99TO9rrM7D40Nq3haq6QCDxQa5U/XVEfkg9
         1rXO88dcRvaGMcgGsgS8Fbwg6Rmc3rzQlNfIwevF8HfWIieZ/11LzofJ3bWj5aPuNruo
         r8SDabG4Fk2s3LyMLivyjfTHKoknkhzqaazo8CqN1h9eQXRPRXY45H/Szia1ObIOyS1J
         0cnkpnznv6ZxhJgiwtU8KLjHE+tF+3JpEz3PTphHxNDYDAMp82C+WFPBOrHGIgude63z
         engPR8Ja7nCFENYazT2TsI1KG5hxaNltIUBDr+AG1pye4dg6hD+EnkzZE2VbF0QkbVym
         uZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pT0uTKRS3mJTAOZ8+3JtVuSzB8Uv+VsNHlXjOV4iOi4=;
        b=frbc2PxyRjga8/GS7KQqInSodc4PhbONFthzctjP1EcxroJEHGMorZcG03stbPj0Yp
         0djKPbQuJe/nQp1qzivh4Q0d/EtJf9R0gHkW8TJvOyIrkQ+nxnfh8/PUk6n/9AcARrKt
         qoygEBpcFgX21RRGkLazvmxuDjs2Sm5Kf9wpGdgcf0SeIK+UXZkSdqso2aGTjqhZwCu1
         qmVrHmPfpG4eeVFICZ7EnQDtBO5e65710fRgB3FMhKvr6brn7bOZARCOT+GgVhnL+BFb
         qlRl0n6gP2+2atXaH8x2Z9vZba83wiEp6t6vVORP4PgtYC0fMjCcWRCtrMPodJCdwV9b
         L2NQ==
X-Gm-Message-State: AOAM532P4wqV4RgPMh0L4MZnA0BJIE0FiOqRLzkpBa1JfUZE2gwqJ+zQ
	Yacu52aG8Ul+ZG24pugrt3B2QYtngWA=
X-Google-Smtp-Source: ABdhPJwlmdgj128rN/MS3Rb97HNTUy9v+WphgRpNC0649RR+Lw9XYCn/OsNljj/9+Ec6wa4sAFZYHQ==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr5336419ljp.498.1634982049243;
        Sat, 23 Oct 2021 02:40:49 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p28sm980138lfo.71.2021.10.23.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 02:40:48 -0700 (PDT)
Date: Sat, 23 Oct 2021 12:40:47 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/4] fs/ntfs3: Update i_ctime when xattr is added
Message-ID: <20211023094047.o4mrisdlf3eadxwp@kari-VirtualBox>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
 <a4ce42f1-19b4-67ac-660d-228ae10f125c@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4ce42f1-19b4-67ac-660d-228ae10f125c@paragon-software.com>

On Fri, Oct 22, 2021 at 06:56:07PM +0300, Konstantin Komarov wrote:
> Ctime wasn't updated after setfacl command.
> This commit fixes xfstest generic/307
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")

Because this is fix I would suggest you make this patch 3/4. Usually
fixes should be first so it is easier for stable team to pick them with
confident.

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index bc3144608ce1..702775a559f5 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -994,6 +994,9 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>  	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
>  
>  out:
> +	inode->i_ctime = current_time(inode);
> +	mark_inode_dirty(inode);
> +
>  	return err;
>  }
>  
> -- 
> 2.33.0
> 
> 
> 
