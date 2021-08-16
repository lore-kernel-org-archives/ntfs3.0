Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238602FAE
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 13:14:22 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u22so3180113lfq.13
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v+/TSYpQmBgEhEstfES6J/h5GgRRcYAB0YCuOv/QsxA=;
        b=JZjUH4qBCLZ0YOQHOvvdL5vqYKxzCRnYRD3YKuSVQrrE4bK3WBJp30ljOMfaz0qgFo
         ak314QTJetdnwoN6A9/u/hkROJOtpkThQpsqGU31FykHu5/PlrvPFju0e9BFnDlbDzgy
         szNgCy57oavn/DtoXzXksW8efm9RewhFgB42WaHWshjk2Pl2Mh5jEGfHqe29aaxliD2k
         J+IyEbvHQjdLfIPpVuq2XP7eovQ+C5L452GMVHDT3M9byr+dZTY8gVKz0jIAvLF/t/p8
         hgV+JWyKYx/uZgDgOB86+zcfXdPyPotDAuC0KnJN/xOvu9dEj07ya2qJwu/HvDQnnLr6
         sIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v+/TSYpQmBgEhEstfES6J/h5GgRRcYAB0YCuOv/QsxA=;
        b=k3DLsBdEJjLRlbtKLWFXCgqDz+qEkvJLN2TYFzlJg6qvzQYMOHFOvHBnywKiQe3EIM
         Q4Osi5mWrRxw1cgcABa1efSpNkWGr1qIeXeuV99rL7JU78Zn3ULVgfkWFl/pgY4jG/yJ
         O23JVPGcKjo/u34HedverRt433BBM9i+ccw10Eb2D69JiQlewd/NJQ83qR+ysFdrzTrU
         VtMOja5CD8+qLNh6hcDu+SLrRWj3mV8Z2XS8cotE/+FqHaIM2qFzSiJAO1I6rW/ivrqs
         jnlkZFMCloiBpwtY4XsIhFbJTOh2cPxJaKgM8HPcz55hojLCOCaB7PTX/mE8u9DvhSh7
         ApgQ==
X-Gm-Message-State: AOAM533y526zCpSlCrfyHdGGa2M8vvIatzDVJEoKYYpyPEfgPQUfY2f7
	1oOBGpisYpDSotF9wJLkASk=
X-Google-Smtp-Source: ABdhPJzY2NCOWAd21DmP22EXneTgAJ5tNa6htKpMSXf3WBvG0Wo1YFCTBcvoYQSSLol/8hPaOhrqqw==
X-Received: by 2002:a05:6512:1689:: with SMTP id bu9mr11893633lfb.147.1629119660263;
        Mon, 16 Aug 2021 06:14:20 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id g19sm802728lfr.255.2021.08.16.06.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:14:19 -0700 (PDT)
Date: Mon, 16 Aug 2021 16:14:17 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 1/4] fs/ntfs3: Use new api for mounting
Message-ID: <20210816131417.4mix6s2nzuxhkh53@kari-VirtualBox>
References: <20210816024703.107251-1-kari.argillander@gmail.com>
 <20210816024703.107251-2-kari.argillander@gmail.com>
 <20210816123619.GB17355@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816123619.GB17355@lst.de>

Thank you for taking time to review. I really appreciated it.

On Mon, Aug 16, 2021 at 02:36:19PM +0200, Christoph Hellwig wrote:
> > +/*
> > + * ntfs_load_nls
> > + *
> 
> No need to state the function name here.

This is current way of doing this in fs/ntfs3. I just like that things
are same kind in one driver. I agree that this may not be good way.

> > + * Load nls table or if @nls is utf8 then return NULL because
> > + * nls=utf8 is totally broken.
> > + */
> > +static struct nls_table *ntfs_load_nls(char *nls)
> > +{
> > +	struct nls_table *ret;
> > +
> > +	if (!nls)
> > +		return ERR_PTR(-EINVAL);
> > +	if (strcmp(nls, "utf8"))
> > +		return NULL;
> > +	if (strcmp(nls, CONFIG_NLS_DEFAULT))
> > +		return load_nls_default();
> > +
> > +	ret = load_nls(nls);
> > +	if (!ret)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	return ret;
> > +}
> 
> This looks like something quite generic and not file system specific.
> But I haven't found time to look at the series from Pali how this all
> fits together.

It is quite generic I agree. Pali's series not implemeted any new way
doing this thing. In many cases Pali uses just load_nls and not
load_nls_default. This function basically use that if possible. It seems
that load_nls_default does not need error path so that's why it is nicer
to use.

One though is to implement api function load_nls_or_utf8(). Then we do not
need to test this utf8 stuff in all places.

> > +// clang-format off
> 
> Please don't use C++ comments.  And we also should not put weird
> formatter annotations into the kernel source anyway.

This is just a way ntfs3 do this but I agree totally and will take this
off. I did not even like it myself.

> > +static void ntfs_default_options(struct ntfs_mount_options *opts)
> >  {
> >  	opts->fs_uid = current_uid();
> >  	opts->fs_gid = current_gid();
> > +	opts->fs_fmask_inv = ~current_umask();
> > +	opts->fs_dmask_inv = ~current_umask();
> > +	opts->nls = ntfs_load_nls(CONFIG_NLS_DEFAULT);
> > +}
> 
> This function seems pretty pointless with a single trivial caller.

Yeah it is just because then no comment needed and other reason was that
I can but this closer to ntfs_fs_parse_param() so that when reading code
all parameter code is one place.

> > +static int ntfs_fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
> 
> Please avoid the overly long line.

Thanks will fix.

> 
> > +		break;
> > +	case Opt_showmeta:
> > +		opts->showmeta = result.negated ? 0 : 1;
> > +		break;
> > +	case Opt_nls:
> > +		unload_nls(opts->nls);
> > +
> > +		opts->nls = ntfs_load_nls(param->string);
> > +		if (IS_ERR(opts->nls)) {
> > +			return invalf(fc, "ntfs3: Cannot load nls %s",
> > +				      param->string);
> >  		}
> 
> So instead of unloading here, why not set keep a copy of the string
> in the mount options structure and only load the actual table after
> option parsing has finished?

I did actually do this first but then I test this way and code get lot
cleaner. But I can totally change it back to "string loading".

> 
> > +     struct ntfs_mount_options *new_opts = fc->s_fs_info;
> 
> Does this rely on the mount_options being the first member in struct
> ntfs_sb_info?  If so that is a landmine for future changes.
> 
> > +/*
> > + * Set up the filesystem mount context.
> > + */
> > +static int ntfs_init_fs_context(struct fs_context *fc)
> > +{
> > +	struct ntfs_sb_info *sbi;
> > +
> > +	sbi = ntfs_zalloc(sizeof(struct ntfs_sb_info));
> 
> Not related to your patch, but why does ntfs3 have kmalloc wrappers
> like this?

I do not know. I actually also suggested changing this (link). This might
even confuse some static analyzer tools.
https://lore.kernel.org/linux-fsdevel/20210103231755.bcmyalz3maq4ama2@kari-VirtualBox/

