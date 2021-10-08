Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822B2C83
	for <ntfs3@lists.linux.dev>; Fri,  8 Oct 2021 05:51:42 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x27so34406054lfa.9
        for <ntfs3@lists.linux.dev>; Thu, 07 Oct 2021 22:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P1mgz4E3k+xDC7FjEQwHm2u2pzlHKm9bOZA2p3LDPlQ=;
        b=aFG/XpJyX/MUsVDlvdZfn1pFqtLBZVrVbMzOro8KyscJ4kT5HX/RT5gz/m62OjNwYD
         cApP8MAk19lkeDDvlmiq/j99ftPe8Bhgdo2vrzIqmOOryV/ufr66YnLWXQJf2cnsIkGd
         cIyMqD+siH8fTe0AIBdcGxFBYCCvDR36ZxFtnts0MsyN/cqR81PoF1NgKTM9rEBImgFo
         3us+qbjmljLEhAwmMG5boLxfx2nQrplk3yc4WW1j2x/JMlpDqOHWN2w2gcncq6OAUDSS
         ayoMLEfnjuEfzD2KVWDUMZl8J4qW+7NzFoASfJ/vG0YrBvfA9RHy6iW+MrbRnxiJxN2X
         UkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P1mgz4E3k+xDC7FjEQwHm2u2pzlHKm9bOZA2p3LDPlQ=;
        b=Xq56K9DdepgW9LuCR3vMZMlxXZBzM5ujp3JoK5f7C6w39/DaRHH8qJXRmKw2BJTmho
         Qsno+NSCKDjZFt3wRcTTwRP4dYxEO9RuF8gkowAbcJaOuUUKJPFtdjd2EWwbR1flXeAr
         fmehlf1yZMArCZFnaVgm4qrLkKMJ7Ao0uWpmqUMkRKNufKR3Q6tkNRfd+ZvunsHkpvZ2
         CXgr/rweqCdazC7cpCHUkvSUZ8pH924UjXLEHZGLprV5CKz0W5v2S5HE7fkSUXnEQQIu
         JQlx+yUuk/1b3NoEufgpJJ+WRUdawm3vJx/FHowDsxLFSMPuT+nUPR0r3nh391lpR8Bv
         EiGA==
X-Gm-Message-State: AOAM532qmCftb4bFf4K+az2agqk1qTheSMzzuSnwt/hkGu4o1QO1DR5r
	tN1vMfgArqoJtXEtuM73Vww=
X-Google-Smtp-Source: ABdhPJw1H4265A0nDgMyL8MpQHfCYDNyZBIIG117G8pO+Ef3jJAB5Duu5PVsiq55xbwmNdS/mJLlyA==
X-Received: by 2002:a05:6512:402a:: with SMTP id br42mr8552690lfb.23.1633672300271;
        Thu, 07 Oct 2021 22:51:40 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m27sm150134lfc.178.2021.10.07.22.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 22:51:39 -0700 (PDT)
Date: Fri, 8 Oct 2021 08:51:37 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Message-ID: <20211008055137.55c7anomki3ylhve@kari-VirtualBox>
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
 <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
 <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
 <14130f55-f61f-fb39-c653-02b4dd39bc6b@paragon-software.com>
 <1068834b-5c16-84e4-2692-938dd4e91121@harmstone.com>
 <20211007201231.ald2tfljtuidcimz@kari-VirtualBox>
 <ae5c8b89-5bcf-7ad5-c7b8-d54dd229e5f6@harmstone.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae5c8b89-5bcf-7ad5-c7b8-d54dd229e5f6@harmstone.com>

On Thu, Oct 07, 2021 at 09:34:02PM +0100, Mark Harmstone wrote:
> On 7/10/21 21:12, Kari Argillander wrote:
> > NTFS is case-sensitive filesystem which Windows treats with tricks like
> > case-insentive.
> 
> This is a distinction without a difference. It's not by default case-sensitive,
> but it is case-preserving.
> 
> > > Your driver lets me create a file called foo.txt and one called FOO.TXT in a
> > > normal directory, and when I double-click on one in Windows the wrong file gets
> > > opened. That's 100% a bug.
> > 
> > I disagree. NTFS point of view no bug at all. I agree that it maybe
> > Windows point view might be a bug. I agree that it might be good thing
> > to add mount option flag to control this behavier. Maybe nicest thing
> > would be that if we save other file which match case sensitive we just
> > raise flag for this folder and atleast never Windows will be able handle
> > those correctly. What do you think about this Konstantin?
> 
> Very dangerous. If you did this in System32 say, you could very easily nuke
> your boot because Windows was looking for NTOSKRNL.EXE rather than ntoskrnl.exe -
> even if that's not the file you were using.
> 
> > > It's worth pointing out that the Linux vfat driver handles case-sensitivity on
> > > Microsoft's other filesystem correctly.
> 
> Question: do you disagree with the approach the vfat writers took? And if not,
> what's the difference between FAT and NTFS in this regard?

Difference be that ntfs will be more commonly use at boot drive or home
folder in Linux.

> Quite apart from anything else, the principle of least astonishment says that
> Linux should follow what the reference implementation does. By all means add
> a mount option to force case-sensitivity throughout, but this shouldn't be
> the default.

Changing behavier before we have mount option or other solution to this
is totally wrong thing to do. Then you basically break Linux user
experience. Example you will not be able to save kernel source to ntfs
and build it from Linux. Sure Windows will not see couple of files, but
it will still work. If you do save something in Linux case sensitive
manner you usually have reason for it so there should not be many
problems to user. We can discuss default after we have solutions.

