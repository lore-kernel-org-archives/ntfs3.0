Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0212D3FC2
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 19:31:03 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id o10so1164009lfr.11
        for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 12:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ci8RsGCUHfQz7nmoHgVgYoNhxkkZ9gzkCCxPYWj1Kw=;
        b=YPTMaBTqCggdBkLCMMZEIi33gvKL6fqCAK93ss8pGeknbOaA/+JbrcCnkIU2jc8p5O
         1CrJaqe8upu7Ms5/ZcMGP2E3QnwD8aTf66I19j/5gDuuenCauWQcw7mgFBrRZqv+gReD
         CnLUQ9kwpMSGHaC0YgsmqiRhLhvUx8mGGn6yJXr8hC1FyoG8ntnT3WthyGorfBDHDwkA
         kV07G28ZaDjV4qGlS1j+/cb+yYtttoMRqVxCQdkQjnoSyCioffDgQDPuPpe67gY/sIn8
         GiCg+taD7mbDwEshYcwDLJwZCllOggYBq0f9jTkG6DSu8MCe5W0vT80L97po8wXGR9YT
         tk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ci8RsGCUHfQz7nmoHgVgYoNhxkkZ9gzkCCxPYWj1Kw=;
        b=ZAoMjXgF8unc7dE0TNWS4Uc+vwYF0NiwiYFqHy8/I/bzdPP2FfukLn6wiUxgjW652O
         RwA+6BaYS075Z0ULTR1mjYXjClKoVH7mEDDkmV9kDSlaTgvpqMjqtQao9ofesyZ6MCqS
         kkKtK2HquowflWOYgDHeHTh5Bz/Y4chM3x/dYnGrLYRfXgFXbk+oXRyquH+1MES+WmOR
         lgXRW7CFhyF9nr0wpds603X7bat2H2yXXZw4kgKkHiJHhe0USYkPi57CW/cGK8rKNY1c
         rVxCYzHOOj7LshPYtZfyAsyTjk5Fssbtbohu22PGQOZfIyNmR0pFi2gnDBXe7OxcXQC/
         ioUg==
X-Gm-Message-State: AOAM533GCWByWE6s0ogGhigC3lZCLof5VAY1sZPWt4D5u8/907GbW1Wq
	9BtBnaY1LTYrYmx/tOGgkvQ=
X-Google-Smtp-Source: ABdhPJwCTVJ7Pbr7mOv2KUJCeiKaehlnS7v7SEIiGOr6TmwoXcfdlPlRDgFsEWrl21KSsOdOYrr26A==
X-Received: by 2002:a05:6512:96f:: with SMTP id v15mr5698347lft.455.1629919862077;
        Wed, 25 Aug 2021 12:31:02 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id o20sm91400lfu.148.2021.08.25.12.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 12:31:01 -0700 (PDT)
Date: Wed, 25 Aug 2021 22:31:00 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Remove unnecessary condition checking from
 ntfs_file_read_iter
Message-ID: <20210825193100.fix4o2p7swifru5o@kari-VirtualBox>
References: <20210825182522.1367594-1-kari.argillander@gmail.com>
 <20210825191757.GW7722@kadam>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825191757.GW7722@kadam>

On Wed, Aug 25, 2021 at 10:17:57PM +0300, Dan Carpenter wrote:
> On Wed, Aug 25, 2021 at 09:25:22PM +0300, Kari Argillander wrote:
> > This check will be also performed in generic_file_read_iter() so we do
> > not want to check this two times in a row.
> > 
> > This was founded with Smatch
> > 	fs/ntfs3/file.c:803 ntfs_file_read_iter()
> > 	warn: unused return: count = iov_iter_count()
> > 
> > Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> > ---
> > I cc Dan also because I am happy that I finally managed to install
> > Smack and straight away I found something with it. Thank you for
> > this great tool.
> 
> Thanks!
> 
> You got a bit lucky, because you're using the --two-passes and the truth
> is I haven't looked at that in years so I'm worried it's probably not
> great.  You probably be better off not using the --two-passes option.  :/
> I should remove it.

Haha no I need it :D I was just testing what this tool can do. I also
notice that --two-passes seems quite bad to read. But hey I found
something! :D Good to know that you are not using it. I will not use it
then. Thanks.

> 
> regards,
> dan carpenter
> 
> 
