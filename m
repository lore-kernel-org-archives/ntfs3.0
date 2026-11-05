Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873269;
	b=STbb3mFW5zkVf/pUDyi54kEF4okH/u4uwXDG99fEj2z4SyWOMQHpvARXRNt5eBTybAOM
	 xz1tcw6aPp4PZlY6OdDPqfPOpRy7x2ydzBj49guNCOGucmqyI36jP7jUAnILjEouh2zaH
	 Tw4NcBzQJ6FWNY+mMZUttvT+YXonsd35oVKpMtPlfaVKQBsI2KrE5BZ3b147j7XYVpvXg
	 MjNMG0cxJbf0RMibiu8vxVDDjgfvJVa88tv6ZdAepCo3J0poj+cAln7I/2vcRtM+fcTxb
	 SgQ/SvaDuj5qOBOvxzAgmNV4Qs0hjeBjKx4fNt6jZwjyZ9C6nALfxmqbZbIG2cl9eBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873269;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
	b=yx9v1btUC+ZpK0OUNYQYhP7HVN7sx43sP69gjH4CkH/NhMq3K+xMmLRmzwH5gUrhHo1U
	 ffPFD87dqj+YaBaTiG57oIMerFBXkGkDvWaafDIAd/qejeMCV9AsXfgdKgOeVHQvVl3lO
	 YP0o6h+OQcqLwKTSf7cmg8XNdzbTZ+W+mG+fu8QIrLyPTwJIIp9ujQjeeZrTMS3gSie+H
	 75RjB3ffd6Bd8CBdl2w5J2vS/poOFoZhu3Tqy0wTSVRP53OamRuV92Lwny79ps/93GWgR
	 e7jWDnE7PDDZH4/PWN8QyVfzYTLKpvkbZRW5OZuZuVB9k7sMSBST6m0Rz3UwwkoapRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B04606D814
	for <ntfs3@lists.linux.dev>; Thu,  5 Nov 2026 10:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B04606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ce77f98658so526665137.3
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 02:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873268; x=1794478068;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
        b=Rn2To56WazqlK2pOPx5cmSIBC1ZvIyMypp6t6BP4SrPchEfA6Kc4Ja5wJU5F9GcWUL
         Mllhx8tPKf356OwQo7FODqqBeNbtqXziTwFHoyxSGd73bbMTFcinhzCaDSMp6Bcv9eIC
         i7wlw3N5c/Ng4uMrwPZdBeEER88j9uh+Kpd7J2GHsgZy25+Jp0ZX8bdotL5B3RR53pMr
         PwK9XC3fl7w0KKoxU5Ff1EMjrKf8CfQMuNOP6VG10B2aGKq+sVVIv/VaT0tarlsF/bvS
         qWSI+xISTiifHnebW4dwcoFW2AMLUGm62y13Ib4m+vSFGtfxaNYzRFKaBi5N1lTVK7j/
         su6g==
X-Forwarded-Encrypted: i=1; AKwUvByHgQOAJYOJhr+LAoj+cHc0K2vavFuXDXzp7lf4o/QU55ziGnI2AolBUIKt9UGLVv+jurKiXQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9PPHBBlXq0lF2+4E3l0UZtfHncPic6w5f2iVST7KeC1lWOOFdJ
	AjY3DOcmehx5X4l716t77ZDdu4ezSB4vJJi6Up24cSTkP4LOlqh3srCw1TcCQFnfcsI=
X-Gm-Gg: AYBFou1Exm9XCT1XRABxd8poEf/bDZNRzhQJ5TZ3cHhUqw2oOSnZ1biP7O9woVWeAmK
	m2yWeyWxSDw5pPPUdxPjfQ3lBSjZsLKpVH9crQjGpzRXY1B0S6sDWp04xDqN5AhZP9e2HbkRt/1
	ihk0uDBWVRVlOTMYdOCSV4sz0f5D2gopXqQoM/a/JnHrrhq0Hrg1gau+NS4z+rR4QrkGl743ymR
	t3r8KJ4TVt/xw7ivWV8pZ9ItvyZO686NiIOsrRaOB3SRi2DR185Iks4dH3gOwp1UFZCjWUm3F2P
	N2r7KIXBRWtcBkiutgOdD5Q5ryw7cdi6lCc2p1nLUhPI/QayDE+I2CKZ+0byO+6o1KX/hawEARk
	x0N/LYUTqCtoiqsKXj6CriltRsw+VPstXtFOeOxaByIZVJrImlFuvYiGO/t5JtVz5BGNzme3Fid
	8x4zOqYaE6LOmCxUugyR+sT+of8Zgq5WYgipA0CE5RTZwuVap8FWXLORR5nd3e+dJL/EECIdjhB
	Vp+9yYdi/ZcfKQg4LNMSHLbh3GUAkgXViNUXCojXqwTZN1kcMkklVeObZLeHxOx7KMMK2Q0QspM
	kTN5IX6/2u/M9Q6ufjobbmnOlw3xjHAg9Q9E6UMY6WjZZJmsRE0Pnb+QChxtDKeA/hrnbA==
X-Received: by 2002:a05:6102:c49:b0:7cc:33c9:b3d2 with SMTP id ada2fe7eead31-7d0726825bfmr7549145137.25.1793873267722;
        Thu, 05 Nov 2026 02:07:47 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d8afbfe6sm4223710241.3.2026.11.05.02.07.43
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:07:45 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso603388e0c.0
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 02:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzWxWMvbuwiUIn5z8IgTT5v0r5gwj7C2Gm5gkQuytKW206M0CiEcHJKMaYg87AjckQC9/G/BQ==@lists.linux.dev
X-Received: by 2002:a05:6102:374c:b0:7cc:1a41:20e8 with SMTP id
 ada2fe7eead31-7d07227a940mr8060714137.5.1793873263361; Thu, 05 Nov 2026
 02:07:43 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org> <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 11:07:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
X-Gm-Features: AclHuK9naqg5CZQ7lhJVrMhg9TNH44f-SpA5WbUGCGBsAlcoOw2midTd7doJSmk
Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
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

Hi Christian,

On Wed, 4 Nov 2026 at 20:32, Christian Brauner <brauner@kernel.org> wrote:
> proc_reg_write() pins the entry and calls ->proc_write() which copies
> from userspace itself. A page fault in that copy can take as long as
> the writer wants, just like the copy to userspace of a read, and
> remove_proc_entry() waits for it.
>
> So do what kernfs does for writes as well. An entry that implements
> ->proc_write_buf() gets a NUL-terminated kernel copy of what was
> written. procfs makes that copy before it pins the entry. The copy is
> capped at ->proc_write_size bytes, or at PAGE_SIZE - 1 like
> proc_simple_write() if the entry doesn't care. Larger writes fail with
> -EINVAL. The proc_ops go away with the entry, so procfs remembers the
> limit in the entry when it is registered, like the size of the seq_file
> state, instead of pinning the entry just to look up a number.
>
> Entries that take binary data in pieces, like the PCI config space,
> ALSA's data entries or a firmware image, can ask for
> PROC_ENTRY_SHORT_WRITES instead. procfs then copies in the first
> ->proc_write_size bytes and the write comes up short.
>
> ->proc_write_buf() gets the position like ->proc_write() so entries
> that write at an offset keep working.
>
> Note that procfs copies in the whole write before the entry looks at any
> of it. So a write that is too large or whose buffer can't be read fails
> before the entry's own checks run, permission checks included, even
> where the entry only ever looked at the first few bytes.
>
> An entry that implements ->proc_write_buf() and still has a
> ->proc_write() fails to register.
>
> No users yet.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for your patch!

> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h
> @@ -67,6 +74,16 @@ struct proc_ops {
>         const struct seq_operations *proc_seq_ops;
>         int     (*proc_show)(struct seq_file *, void *);
>         unsigned int proc_state_size;
> +       /*
> +        * procfs copies what is written into a kernel buffer and calls
> +        * ->proc_write_buf() with it. The buffer is NUL-terminated and holds
> +        * at most ->proc_write_size bytes, PAGE_SIZE - 1 if that's 0. Larger
> +        * writes fail with -EINVAL unless the entry asks for
> +        * PROC_ENTRY_SHORT_WRITES. The position is NULL for a stream, like
> +        * for ->write().
> +        */
> +       ssize_t (*proc_write_buf)(struct file *, char *, size_t, loff_t *);

"const char *"?

Seems like you have to drop several const attributes during the
conversion from "const char __user *buf" to "char *buf".

While at it, I think it would be good to use this conversion as an
opportunity to replace "char *" by "void *", which will probably let
you drop several casts from users.

> +       unsigned int proc_write_size;
>  } __randomize_layout;
>
>  /* definitions for hide_pid field */
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
