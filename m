Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8787B2C82
	for <ntfs3@lists.linux.dev>; Wed, 27 Oct 2021 07:35:46 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bi35so4209149lfb.9
        for <ntfs3@lists.linux.dev>; Wed, 27 Oct 2021 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qGjKGeSuDUaZDoV5/uNfrSoQiktZrWO+lzRzUgpx3qs=;
        b=hubUU1WknuKm0XwNFCVG5hORUOZqYI5pSnqYMcFzd607mo+Zbo5SDG3vWSGCbP5TlX
         /cNM4hzGsKHODA3ytUBfMw7NJaBAV3biCFSfVUCRecXhOIyLyG7sAoO0FGXBZMmR5tsw
         i12fYLnQknZpvg5fuB+hObbgUWMoyRdPhUeP56rV56k50yujXUZonnLO3GsU8aqatE2F
         kj6YZKYMASZQ/B8/jyS8a+fncx5Ofj24Q5y+CC1W4yHCO66xup+uoj2YkJaD+i18Pog0
         PB16jAbTpXl/pT5JpH9gjjd+EjDCEBCkZiLxJH2qoACTvWDFrzd73Vjjp98mC1tWSqkS
         HJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qGjKGeSuDUaZDoV5/uNfrSoQiktZrWO+lzRzUgpx3qs=;
        b=G8qOhGCBjAvOgtqJflISJYSX1Se3mJuBBK61Uy2kjlb5o7/klFgOSYEbqI36LHefo7
         aq6ZG1c8ytEOWs+8qkW9jIE851KVSouIm1b9Edx4LOSfhl9E83+hLc12cddoG+kbYjGQ
         qxFjpi+z0jxQ3FafvZp9M2V7JBozJ75YzAEXCml2cdK6UF08d/u/tUM02Rq9aP3L66UV
         /9XaWAi5CIgtKCpiFrtnPGVScQQ8q7HPSY7WnR8N7BPjFBZ0DKJ3gLqZ33YME3i4UDPY
         Ow09zgi19pnh1VI+rfPNHfV17Lw9uhIOI8XRurDew9dFWxM9Xm+HAzOHicS+fY0kVrOS
         ItXw==
X-Gm-Message-State: AOAM530ODRTDZ3f3mXiR6oBB+9ZYalvo0at8eASXKEHczds6Z8Xn8cUs
	JCX5v3N3uizPotmn0PYrNdc=
X-Google-Smtp-Source: ABdhPJxNV1qQ4uB3VOFu44HLiUFl+Jqwo9RzBEA61kZvsfy2ItmC7RU5ybFH+slIgTNvF1/P8mCuhA==
X-Received: by 2002:a05:6512:1304:: with SMTP id x4mr26741097lfu.591.1635320144608;
        Wed, 27 Oct 2021 00:35:44 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id g35sm957015lfv.248.2021.10.27.00.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 00:35:44 -0700 (PDT)
Date: Wed, 27 Oct 2021 10:35:42 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: apw@canonical.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev
Subject: Re: [PATCH] checkpatch: Remove cvs keyword check
Message-ID: <20211027073542.qxbu236cg2wic25n@kari-VirtualBox>
References: <20211026231637.3750-1-kari.argillander@gmail.com>
 <868c29d45172a151b6a751de4ba32165cbf7a4cc.camel@perches.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868c29d45172a151b6a751de4ba32165cbf7a4cc.camel@perches.com>

On Tue, Oct 26, 2021 at 05:26:21PM -0700, Joe Perches wrote:
> On Wed, 2021-10-27 at 02:16 +0300, Kari Argillander wrote:
> > Time has pass and we do not need these anymore as almost all people are
> > using git now days. Those who use cvs for kernel development probably
> > will handle cvs pretty well already so this check is not needed anymore.
> 
> I think it's a relatively harmless thing to keep.
> 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -4017,12 +4017,6 @@ sub process {
> >  			}
> >  		}
> >  
> > -# check for RCS/CVS revision markers
> > -		if ($rawline =~ /^\+.*\$(Revision|Log|Id)(?:\$|)/) {
> 
> Looks like this would be better using
> 
> 		if ($rawline =~ /^\+.*\b\$(?:Revision|Log|Id)\$?\b/) {

As I say before I do not know much about cvs or perl regex, but I do not
get any match with your suggestion. Test strings which I have tested:

/* $Log: frob.c,v $ */
/* $Log: frob.c,v$ */
/* $Log$ */

But these can be wrong as I do not fully understand how cvs keywords
works.

> 
> > -			WARN("CVS_KEYWORD",
> > -			     "CVS style keyword markers, these will _not_ be updated\n". $herecurr);
> 
> 
