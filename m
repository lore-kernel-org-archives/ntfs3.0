Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872804;
	b=thW0k7ge59aFb8u/Ei38XLBSFA7TIxduqGREEMa6ALZAiG0px+kskOjIJa1ZwuC7W+rK
	 EY/9PgbggvjhUeawDT+wcXC8ksHr/2EfKmishsr9+3vxymSEEdeB+fRRF2m1RyhOQdVXX
	 F9XX4iLVTa6hLvCPYM8YvLWCfgrt2cCChZ4cNoANxe+T9W4OaBKQ6q+7TyPGDHdfjbZ13
	 btsu+SzT0UwXsxO8pOpLSHJGf4Hf0ogUweXd81+OfYf+0lEQNB1aTk9UyzZrSeJESbrDs
	 qj/aLK59f76f4ggvGF5RPtNMwNgRJ7+hykNYPRfaWCCuJM9hQyYiW1WXuBToGiAZHSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=lZD0SXx0m/sOsmXbhfsg9EQGRPROIYTrKiF/kNYxtSmddtPhclkNCE6yXu3qKltS528f
	 rvmeSGElCtPy1rdWvBiEgyD3cb92ZdviLQ/wNRkJHimKCGKkttf3ideIGYPbOcT8LY1N9
	 aDOU2i0HikktBdWkuc92aGuhOKlPUt5YB/QM+gT6qWmZPxynGXPi5MIiwYSQg9YHyJaHu
	 c7DLAoqhxQb6PQa0AABfOJPx0Rcxkan9rIoQIJlv6Fli83u9a+yqtOhCSk6YuhczCQjeD
	 fkn1zLsRTBl7oP7IA6UwO0d60Ggi+Y+wY1gUETXtSipzkSszkllq3hBjwTwDmmbl7SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE27606A328
	for <ntfs3@lists.linux.dev>; Thu,  5 Nov 2026 10:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE27606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f269e335eso196511885a.3
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 02:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872803; x=1794477603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=X6fpCfTepqb+YJfn9c8mgd4JjhQtNXLfOATUj8kUPqBtzenV/LNMUrzqbrnyibYtBO
         HECh20SQlhAs0Aydn0rTPMHvP7Sxw/fwGr+FJXDCIb/Xu0sm7DU+fYH3C5TfuyGIcygR
         xygl7Wk4TlD8op5jukvao4QzTqdAj+mS1OZm6K9cP0gs86q5Hf/eQ/Jku9oer5/mC1mt
         KOGGFa84+KhGaC8Z33DeY+kxQD0Ja/DAMgqrYZAmScYJfObDie2sLw9EQVykFrSlJ4Hc
         yya0/dg2MWBJKYFH1sL7OLKIGvjUtnctSxz2BRelAf+KZkcvkmN49cCrDMcCH+kKK74v
         UQeA==
X-Forwarded-Encrypted: i=1; AKwUvBx019/33Ix8LnLgceVCpL1Qm2wmW+7901MJTgBi0sI1aR/UHBKE6xLlIsf35zzmhNY4pYZh9A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/zRYd6Gmww5zyVC04wcZU+YdEgs6DrX1TmPNqWs0xSQ/otVFS5
	hZULLcbUPBjy43UuX/zUSnBaPaaJZfafD/wrz6RLx7/TgyMKXkgH6BojoXDYpae27i0=
X-Gm-Gg: AYBFou0r8N1+upU0Uwiu5UrvSU1HA63QjPGAua6CxRJ6tUISni+p3UgooXHxlmj8LLm
	9EG2Wt67BdqkNE7wbBX8r6+f6Dsex9UgbAGtVw+8dIQmWT/qCgThXcQ8yDkXcA+YUIaNLLqbREf
	kDSeA4agwKmTEzLrn8gUVRT0ACsuP7EV7wFwV4TY2k2O5c5Y5jetnBiHzXh28sbU2ocGIXEb/c/
	yf5YBNDg7I+sCJM1XXgttbDprAP8gofyX7XxUOfVn3eo4ooTnjWThRj/Gp5NDd7NWF3A0jg7z8Q
	zY0n7SjoJw5RsdjuBCv0EhCq7/E9TP3y64IHBLfR9y5G4J2MPK3bVFWAgF/+nGcUQYBqiJYutb6
	bjcAOj3s7yFyotrsJzvBLL4e1RYPyo5us0RTtnGGZbYTJUo+qiHlxYdbCTafoYx701ZIDd0wZYJ
	U+5PAKp4PR0wvqJfez3lflImoF/CMKFnAYmbW0afT+BJHHBx5wkHslCWKFz/j9cpbpZXvixRKa0
	cDGAX7aobI58j99zIHRumWYTkb1Wcp3AMJNOE02xtJ5IJIk1wHvTptaiQIPs5Z8MODbvPNMTpdr
	7HyP5unAGqLfAbBNGKsvNavQbmx+aYNqVWbthMrH3XBgshMY5BkkyZPqIk6smxD8GQ==
X-Received: by 2002:a05:620a:2a07:b0:93e:6100:6c1e with SMTP id af79cd13be357-944216770b1mr3094729185a.30.1793872803321;
        Thu, 05 Nov 2026 02:00:03 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e8dac2a3esm27777136d6.1.2026.11.05.02.00.03
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:00:03 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c79a9a739so23674096d6.1
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 02:00:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2X+U135QiiNyGyBGynPUPTEeli7OYOw/dh4X5e/to8zcFtp2EZ106TaLk6madbqxl4nCLWw==@lists.linux.dev
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
