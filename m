Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273610;
	b=jgYmEsQDsn5KSc0DvB8vWRgaiFkKsN+MwQDgnsrFySL3ZsO2eh0h0ai6vW5s4mSnUdmb
	 nzwVb0lMhLtVoBKuYZXZrZYOyLJB1MAWcaby5Q/knVwcJL+ZgHGHsEvOODt0ddqBU75f3
	 YdHagiI7u7emfcN8T4R1MCgCIT1gQz2kO1+slUhwrE5o4aywbwr8dgC2/XiAO8nm/SJkR
	 /Sey3SoOxLFrdDCCHWfgopcdAoLVC28T5qGKjrpsc81F1EJ4bFjaMBEIIYzHvYqmaCAgT
	 AJXxAOgbqtn9chfGOhC0PfyhCClnz/RBpGBBnZ0GSw84qNRhnutp8+3CvG39d+4ai9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=iVBR6VypoSZGU+nASu3Kp6s8YyThV1vesHZj9RIwK0u69z4V0kVgT1JgHS9rAgXABLzY
	 iq9hugW9t0Y5B3soN0bUJN0RYISox2ksbaiQGsUv92qLFlIoxPreqGyJD5Dfq+mmFFw2J
	 NGCkCV0dmjDuu/E24v8ze9ZeCJoG1f7VtKjvyuq3btfAljFN5W5FG1bbZeFqeLoChdNwt
	 QyQgK5bYWTXLTN4cPidKgj85r/0/d569tMaumoj5CEAn0N18KyfoOtbZO8+sEX23mba0O
	 VyucprygtmjXmMJK1HLPShCp0kAyMH4WEclVnV/yaR2I+GP+chZblMDj3x1ahTN/00w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P1BaPVly;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D560A261A
	for <ntfs3@lists.linux.dev>; Tue, 10 Nov 2026 01:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57D560A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P1BaPVly
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cdc606b47so217141266b.0
        for <ntfs3@lists.linux.dev>; Mon, 09 Nov 2026 17:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273608; x=1794878408; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=P1BaPVlyUewxSU7zVYCD7Rn49oR/s2qDOcaTqdhO198xiSRGH5mJ+66vseM39FE3So
         itbj0qdw+wYBGdEAQCCKg6//jpANpRpS2Nfx0mdEyYfefci/SewNza4DXl9xhHdnAB/v
         7QUhNw5mh3zizSCAq1o1Be1wZLdR0euH6PCtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273608; x=1794878408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=Ol50G9pRuUzZoPgVgQsHkPNdRda7LVzDza4KSY3AZtlRGrEYBNLxwFLpZMD3SDt5Rh
         WNo03Ttn23pjOJ49R3U/5hl0yQIJMHeipAGwyj0L/nZJmn1ipG6wLgEApsngCrDGX5lq
         W1RAqoHBFLn57aVuOHaZlja3gVu1sZmN9JyURNhGzPQW/jx4nGhIPwwcuQTUFD5zf0q7
         Y4ZYVS3/PAvRkwMPecNR5zWbZ3+gtFy6VCMlk4JkQOyHk+yn1erLtlAlud+3JGqTRLSV
         LXIiXBFB474V3eyBflQIQv/33f9+a6jGUezPDqRVer5WqXWx8iy4J2T4OA5xYme2LiQ2
         /IbA==
X-Forwarded-Encrypted: i=1; AL+hErGSHw3zrTnhRdCSSqxS+BozU/Z9FQMU9wlTOi0fL2HohUlEJk71HUFk/IlC770dadMtk1DUxQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9YwEKNsBjYjF1aCwFqqO2TjVOmO3Wu63e0UQ7IngXWlbUbR1S/
	rDP08vQd6iWW+rnaXY+WxVYN8iyiCaTL8V5CKO3Ah1b/eRvhQR7tDnYKdcGxI2SaCKIMsZBzU7C
	ICosexx4i8g==
X-Gm-Gg: AYBFou0CHMe1NvvDPmLlkJNF6wEzpOdwE4FLa/hkQ1wWaca46lZ8rRAI1H7vP+1Ogp9
	jVtYH4lVKeK7yqGTEPOkOc0iWSZ/P4LHiUa/TediYRFQsakwvLrigu36nqWiERfaFlnSvr7b2hW
	8g/6+fYpPgxI9Cp+LQeOdV4OsIP4IPmP3BoX/0KSS3DtiLaIm42e+0dCweTTCmgC3M9H0kmJDi9
	qUpz67Mghdt88YiVfCX0vfyzj0zTKqqRuaEpPHzygSW3RquxtYLM3F8TyPRBRiXAwELiO8K36Zw
	OkyUqLTFyf3n8SAMp7NJ5o8X1e4eFMVBeKMyu5AzRjWKjw8lr7yyjeGEkafQjsMrtSVPKeQilwa
	Ep3B07jN9YWUxOtD5Tc6Fb6PmcSq20X4NA8QyId8ZzoeukQwxzIGVtDoab9HUGBcz8xAYIlZKCq
	vogcoUayzrF/6QSELHvv6iXJagofFKNdfGHOCmsMW+U3A9JbovlOCGfOWljmEJSnsSeeJxgn5UA
	OOmWHfgmKOQzwT0O6yvP3weugjKT8MrzLy/8bu6cBDyXjS8wRQ28C40Vl4ktpHCFps8JtwUe/eW
	ATTWYeZVucKw/SuaycI9igthV66aSDqBwPgMFHA6aWuvjE1S4lEz2DPjyMy6SpL7dmJieZIIB6B
	LIQ==
X-Received: by 2002:a17:907:9484:b0:c41:6de7:7dee with SMTP id a640c23a62f3a-c50494529f2mr89786266b.7.1794273608169;
        Mon, 09 Nov 2026 17:20:08 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56c70asm41664866b.29.2026.11.09.17.20.08
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:20:08 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so242275266b.2
        for <ntfs3@lists.linux.dev>; Mon, 09 Nov 2026 17:20:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwYsip5OdBppA3gAJlmUGCg45Zqt9jJkqD5TCPgi8q9cTFrBZgjmT/HSE9MURTh21rRsYGEA==@lists.linux.dev
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
