Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEEC2571A1
	for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457709; cv=none; b=BITVQCVGI54Bxedg1G1to/P5uN9Ld4cRngRgY5cjU6lEYlB9dsHxZ9oP079PWuKd0FceP9MRXbXIWHhW4qzzN6VmJ6droCXKkJF0876C/+BEmqkcDXh/UyjLycuA4GZsAX7+Pj5HT/7JKFrnh7rdoh2I50kmb0R1qT+/vl22rAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457709; c=relaxed/simple;
	bh=f/yjvNeAiG/w6HXlU8hc0Zzbdo6HDQWDJs3ftJ44QoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkCGesu3Ch+NZiMFV2ZMpQEcq551rzPksaub1vbRoz/Vk06HUiwGMyFU6o7ELzSTLBQtmYBwLtapwjBLhaTkvG5obuU9jrirW+PkGse9fZBYqTwemE1/UPqxtvsZBrT/PZLsdP9apPLZSkTZwdJbDozmgYmllGNR3e2sei2VDAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1T6QJ6R; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1T6QJ6R"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63cf081f87fso3608808d50.1
        for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 09:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760457707; x=1761062507; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/yjvNeAiG/w6HXlU8hc0Zzbdo6HDQWDJs3ftJ44QoQ=;
        b=l1T6QJ6RHWdjgEB8l2Fok0x4dAAPYUUdQqs8I0uVlsoyTmrvolloogxCtHCM2H952/
         jCcMHxq8ormVp0ahwCAx7yAtj5CpLXwaKVSym72V6em5jWOY+E5lbmC/5WEwH1juTmD1
         1Z7QKq2uYiPtxaNMZAzmXcST1FA5Jp5WGvBIV/OrMaYMoAbJY8VNlj+0XN54Dh/9q3+W
         uxEf7mNJCxbeD6jIzkdRWIg5ymTdTWpZ2GEz/kQ2Qetuom6bEfxhVwbHSnP3e6xXSqC0
         yYEIaKOCGUDGtqPFvypzokSGeXLg9o+cfpyBT5KTDlw6H/MIcU/qiXB9eftwt0BMhgnG
         ZPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457707; x=1761062507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/yjvNeAiG/w6HXlU8hc0Zzbdo6HDQWDJs3ftJ44QoQ=;
        b=Y6mC0gbzTMinZ5PDiZwX5eJANbJiYF0lEvYXN1lVkyqjcLBdj9yhNnGhEOqy5pSGar
         wxrdiZJRk46/CAtQSDwjmoBzU3iOgmlp+Zn3hhuQejlXXWn5F84kNxm4stB9P8T9FPI4
         8UpaCCSTYUeea0Ipo5by0PPEAClxpH+ZXvlmXadKdg2SKV7YPO7V2sYipDeSGmp7QzIx
         r7VnaG9at7jhLozlF+N3s42SFb398eeqmCHslKtY9dG0NLb1oAwJi4fqMVa7WTJwdQm/
         4dr4WTN1HdycXcxKM5Ga6Va22IRfmY2tHkBt6+Ie5qoTA85MuZkgzaLBdQJH0QZ5ay/6
         pB0g==
X-Gm-Message-State: AOJu0Ywp/85oZcKahX56y0OuSRjL1GZBXPsw2acIT3cJnD9CKswhjPZs
	ZYgyPtvnL209JfmovUGvGA1BcBOCn3TFNPpHh7JTusOfx6s4/F3dDt9aEF5KP4dECF9S0c/iuEd
	XWrQDnbHiqW+ouexscVwtlYr0dyuUPUM=
X-Gm-Gg: ASbGncsvWQUSb1Z3gSPiT9xfwea2Qm/lpBHbQnU1FV4m3n5x0TBbn/yI6JFq0FkQb2H
	Wl9gI5DliFgLAvzC4L5LzKCRat76wU6gihTY1igCrDVX8CqRrDNbIIj/k/oX2h1CwR2Y6EImSPz
	zTs8Ee7dkv3V4z27EPGA8fBCqs0AEFoPSnaqAxLP7rLt4sDHYohhBLwZ6Xd6AhAjtT+XgJ1R/Gs
	nSJ1zPiqF9sZ2R8VZjiIOXvEs70MbrJoGiWGBgPWUM0+C6rlwzVIheR1VB9Cdt85NSMHbbiuDvj
	ff1334XmANBLPEfgCmHshpEVNQ==
X-Google-Smtp-Source: AGHT+IGlpqNaavmoJjF/rTRFjKs7dOdsBv7+wZ5/6Vvo5SHlUjQEOQPeIUBdypabQJr0k89JFdmbyrtQhHNALtFuUQw=
X-Received: by 2002:a53:bb4a:0:b0:5fc:53ab:a49c with SMTP id
 956f58d0204a3-63ccb825b6emr17067165d50.11.1760457703041; Tue, 14 Oct 2025
 09:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014143942.643856-1-kartikey406@gmail.com> <CADhLXY6zA0EGhKjzBZXSv3QFC2OMHxTxzgZy2sObzNaaza7eLg@mail.gmail.com>
In-Reply-To: <CADhLXY6zA0EGhKjzBZXSv3QFC2OMHxTxzgZy2sObzNaaza7eLg@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 14 Oct 2025 21:31:29 +0530
X-Gm-Features: AS18NWBXOM1m99KfAKGpTf5yz3g-4wshloXh0Et30lKGi8VyUx33nLhLIUtwwks
Message-ID: <CADhLXY4CmHm7tP+M3RzS66tA3pqt_JghbaF6DRozZBjtpdCzEA@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: prevent operations on NTFS system files
To: almaz.alexandrovich@paragon-software.com, 
	penguin-kernel@i-love.sakura.ne.jp
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Tetsuo,

You're absolutely right to question this. I made an error in my patch.

Looking at the debug logs again, the problematic inode is #25, which is
a file INSIDE the $Extend directory, not $Extend itself (which is inode 11).

My check `if (ni->mi.rno < MFT_REC_FREE)` only blocks inodes 0-15, so it
wouldn't actually block inode 25 at all. This means my additional check
doesn't solve the real problem.

Edward's simpler patch (just initializing run_lock for $Extend records)
is the correct minimal fix for this crash. I apologize for the confusion.

Thank you for catching this.

Best regards,
Deepanshu
