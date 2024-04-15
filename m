Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597CE78C73
	for <ntfs3@lists.linux.dev>; Mon, 15 Apr 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713194648; cv=none; b=XqFp0d6+SmtOsaiboC7bMC8pI9umgpoh4rKiepNmCIJU12VTUDK2priVK3WGyuFhigv0ul+BPJOwHbWp71dlQQDvQpIRoSZYElV6WMiklXL8GA7021lK+o8iBKJG/6FXHtEEahLXtl/rET3ZqPBxV+DrkHO9xlNhxAli42M7mhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713194648; c=relaxed/simple;
	bh=0K4dQJV+mfWZQNpGK/vITATfXVgyY0RZsCg7Qbj7+NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjuiL2ivcEvkYLn0ZPaRmZI8MI07ZV8OdDOGSPnsF+5XOwoipJv/ibrXAzOLd577reNH/xZ913AzXeMQzkAZeDqSBYP1TaNB7TXpvphGTSSxPyx+LPfXwd45zI16Iwbs2xzZdBOAR1K2uC88YEcGIKV7Unv0Od/jsXa1ESLYTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=R1o4cCL8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="R1o4cCL8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a4702457ccbso418395866b.3
        for <ntfs3@lists.linux.dev>; Mon, 15 Apr 2024 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1713194644; x=1713799444; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WYfOEsGC0slx6ThijhpmfrIi/hp4YLF9aD3FqVog84w=;
        b=R1o4cCL8yOXmuhYKOLfps2AYl2nq8F1OhO/LpxAOZyXADqLVaTrxAoah4fEYayXhgI
         MbSp/nmmqnSSt6dNb4du45OtcefGuPvSd5kYK61gd+RXmAdsccdFS3KO828/qWSir8cv
         1310i4dTyjYKJELXWUmbaig9I0uP2ch8eCcg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713194644; x=1713799444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYfOEsGC0slx6ThijhpmfrIi/hp4YLF9aD3FqVog84w=;
        b=o70qiKcVGYrgJtKxGO5CaTBTJeNYxoaPlirD+8v+ixJEXp70DJrypG2ZH+4DeyM5AK
         GAHi4hxe6f/KkFccvlU3R3SDG5o2LAOHBs/Zo2fWlu5KhVonmgrEu3aTLmg/nKQV79+6
         ONuZuVV2MA8Ha31tPqRTxyiJx88c5mYq0Q12op0fMvr70KBUmm5aZz55FAStSEayBc1X
         hISo1I2FNe7Ov6Upqt7qq9matnUwf5kbmHDCZai4I3+C+14aZx+hEjcPeQ8CYRQ3fpQA
         D+f0qwXlYA3jQuvdAmJKsrc3DHGy0L+p0grT/8KXqxLKvkUv/rZlP45t2N9xI1thT1dS
         x/cw==
X-Forwarded-Encrypted: i=1; AJvYcCW4X1g9FCKEpIdbDw66ebk9lLrDL4rED78T+U7XwK2++bO8UeQj6YlbrHzw059jf7io6auUNtzyTvJq3ZQy0u8yKTVOrMs=
X-Gm-Message-State: AOJu0YwNyqMcUICCL4bPTo+lRiysNfXii7/6tLVekCGWh2XtPSCForj6
	Pcf0pdrGR/3zuF69L9fB8qkoPpEm6JUejN1Qh+6ct9kgSVFtaKzswRT1xYA6gvxg2gKZjvYACwX
	mCb93zw==
X-Google-Smtp-Source: AGHT+IFuPP5Npk+Luzb2DqflNgUDc6k/1PwZv2B3SdfvF8HKuVoJ2OFtLlaSIonKvStyE5EO1Pa4oQ==
X-Received: by 2002:a17:906:f148:b0:a52:14b3:480c with SMTP id gw8-20020a170906f14800b00a5214b3480cmr7060803ejb.76.1713194644461;
        Mon, 15 Apr 2024 08:24:04 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id bm23-20020a170906c05700b00a52331dc082sm4646704ejb.11.2024.04.15.08.24.03
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 08:24:03 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4702457ccbso418392766b.3
        for <ntfs3@lists.linux.dev>; Mon, 15 Apr 2024 08:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDygPxWpRo/BDdRErr1hDkB6ndZGbhgSXFu/UC0MugnnuWP+AM57GxB0eB1A2bzcn7t8+dQTlhk/jgBAadxzr7UpqQir8=
X-Received: by 2002:a17:906:e0da:b0:a52:5c9a:1c8b with SMTP id
 gl26-20020a170906e0da00b00a525c9a1c8bmr2466375ejb.5.1713194642825; Mon, 15
 Apr 2024 08:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zf2zPf5TO5oYt3I3@hovoldconsulting.com> <20240325-faucht-kiesel-82c6c35504b3@brauner>
 <ZgFN8LMYPZzp6vLy@hovoldconsulting.com> <20240325-shrimps-ballverlust-dc44fa157138@brauner>
 <a417b52b-d1c0-4b7d-9d8f-f1b2cd5145f6@leemhuis.info> <b0fa3c40-443b-4b89-99e9-678cbb89a67e@paragon-software.com>
 <Zhz5S3TA-Nd_8LY8@hovoldconsulting.com> <Zhz_axTjkJ6Aqeys@hovoldconsulting.com>
 <8FE8DF1E-C216-4A56-A16E-450D2AED7F5E@tuxera.com> <Zh0SicjFHCkMaOc0@hovoldconsulting.com>
 <20240415-warzen-rundgang-ce78bedb5f19@brauner>
In-Reply-To: <20240415-warzen-rundgang-ce78bedb5f19@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Apr 2024 08:23:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whPTEYv3F9tgvJf-OakOxyGw2jzRVD0BMkXmC5ANPj0YA@mail.gmail.com>
Message-ID: <CAHk-=whPTEYv3F9tgvJf-OakOxyGw2jzRVD0BMkXmC5ANPj0YA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs3: remove warning
To: Christian Brauner <brauner@kernel.org>
Cc: Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, 
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	"linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 07:16, Christian Brauner <brauner@kernel.org> wrote:
>
> (1) Since the ntfs3 driver is supposed to serve as a drop-in replacement
>     for the legacy ntfs driver we should to it the same way we did it
>     for ext3 and ext4 where ext4 registers itself also for the ext3
>     driver. In other words, we would register ntfs3 as ntfs3 filesystem
>     type and as legacy ntfs filesystem type.

I think that if just registering it under the same name solves the
immediate issue, that's the one we should just go for.

>     To make it fully compatible
>     we also need to make sure it's persistently mounted read-only.

My reaction to that is "only if it turns out we really need to".

It sounds unlikely that somebody has an old ntfs setup and then tries
to mount things rw which didn't use to work and things go sideways if
that then suddenly works.

But "unlikely" isn't "impossible", of course - it's just that I'd
suggest we actually wait for that report to happen and ask what the
heck they were doing and why they were doing that...

              Linus
