Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E7368
	for <ntfs3@lists.linux.dev>; Tue, 16 Nov 2021 17:16:41 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z10so64594205edc.11
        for <ntfs3@lists.linux.dev>; Tue, 16 Nov 2021 09:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=nD5YA8Q0SaYT5tGVhwUF69BMltqLjIJd1I7ZJVJiop0=;
        b=COY1FPGul6lpeAe9541xbGL6riE2omphurxT+vO6XIoEmwEtBmEq/mwpdXILdvfjJx
         mWijUzgrqmS1Z5NhnmU4Fw/V3dVEKHXI7j5NJQla/AS/dit5sLcBfuPV/EFnDTN2s7OO
         cldDidr8rGMZVGWqwfJQglrIl/tWtsCmMCzJ6YSXHmil1eXXYJP3LgSCwkDrrDbvV5kW
         nBAoXpP3sSjJ2D2hgkV5JfvDXgWOuxFDIzHTEjuCMaZXDkjkrc0kh0oaWtvFBpt05MtT
         PPHAsmXaLKIGXLSyt/soJJqLwAujL4jvkTk2P8VERfQk+4bWrG8l6jpCPRL1tLYdpfni
         QlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nD5YA8Q0SaYT5tGVhwUF69BMltqLjIJd1I7ZJVJiop0=;
        b=lFW6LWPvk/wZ0Mj2CMjH4UaM9TQ2z0QMqHmMNSaQthCFRUfzhnncqiEIoOEvN6aQCs
         Sw4cn9IIw3pcu9JKq1vrWAS611h4YUWdeNzNM9wd+A/mnxLo78ovpjHIhP9zbA04UyTE
         H+X3wT660C9tL9yEpAnZ1D686JeDnDUHPiEnCDDO1bcJ9oG1PLK0tr+UsNQIxQ7QcTRv
         /9VW0XhjT0YsE/L0I0nsKqqF613S58qdIhguMKVYzVrq+PvtmE7ak0JFGZVFPigWdw70
         2+psAzyF01zUThcSvdgWMtcp3bbkEo2NXIfICUN1//jWf675i1ZgyScocuWc2WVvJ5+u
         hbUw==
X-Gm-Message-State: AOAM5300+iCgEH+70vf2RCP3kfjjVQKD56G9ixpRSUxO49iR4iRhSbJJ
	sA2tngm4YJo6pZVZmPSnH0Ig57ZxjSqf2ty0SpZjoJIWunW6Qw==
X-Google-Smtp-Source: ABdhPJw8jDp6v05yzQ0eaU/3NbrfPoXAZtuWrsoEkuxjmys7MpLiwXB7gQH5+MRKaXTXOT84D5jfZ/UKUJHt2+1wBw0=
X-Received: by 2002:a05:6402:1a27:: with SMTP id be7mr11675342edb.187.1637082999568;
 Tue, 16 Nov 2021 09:16:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Antonio Petricca <antonio.petricca@gmail.com>
Date: Tue, 16 Nov 2021 18:16:03 +0100
Message-ID: <CAHyOv-b4sxAES5Wbg9f8A2Z2XMrmdp8VLRx-NSNEEsyxtBKG8w@mail.gmail.com>
Subject: No more accessible (compromised) NTFS volume
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

ntfs3@lists.linux.dev

Hi All, I experienced a fatal issue which I submitted as a bug at
https://bugzilla.kernel.org/show_bug.cgi?id=215033 .

At the moment my only solution is to rely on the deprecated NTFS-3G
which is able to read the NTFS volume, in spite, unfortunatey, of
NTFS3.

Could you point me to the solution.

I would go back to using NTFS3.

Thank you so much,
Antonio Petricca
