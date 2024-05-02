Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1884204E
	for <ntfs3@lists.linux.dev>; Thu,  2 May 2024 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714675346; cv=none; b=Eh5Xs9FUmLIT8QraG2A1zXcjhqD0cHdZXeltDPZ3To6YnGFQSiM+Iwwhzym84OE6gp+Zc1EJBJevtqCz6X4C0NkTpQJQ7uN/iXouYA6oG4ohs8jItL3hDU4jKka2kU95omqUUX5YGmg42k0AOWH739wZpS9kiZ+iycs8Nre5KqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714675346; c=relaxed/simple;
	bh=G5V5ACM950fGQKM/49XtcbRxUoJw8KTEU8tsC3O0IiM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QdJ1m9r1IK3E2DAT/VnDEbPsNnhVJ15BksFWgpGeZOeJRPgOzlq77qHBe8i2aNLR0QUWc0NPdYS882RxV/F0oHWxAx+5ZKJY2j/IRVcvi7f7XS5FGHVsNVlzAkdKLOlhunBLoirXmpw5fS5x0j6dbWj4ppcOUQIO+t65pzVQOf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVaJaEXn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVaJaEXn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed627829e6so9681125b3a.1
        for <ntfs3@lists.linux.dev>; Thu, 02 May 2024 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714675344; x=1715280144; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fmQTHNad7dmA0s0giWalMqGG/pxPdq/wO7cnMf5Ybbw=;
        b=VVaJaEXnz/hon42b5yNHblZV2Jr4E9wAyhXVMA1shgse3i3Ae55184Q15RjxCEOt+X
         s4JQT9EsP66yKwRfQ3Telb80Su4uCdIRjrZOaJLbwxPhN/T/KQhvxquKJzkObk15eIIr
         2/i8bViySYKWEeJltgO1kZ/szQqZFNEozhEHidM4v5LU07sqjhm4m6WTMVlZmbAByR6r
         Uza6uvaHoulj2P+pwcmZOGdL0xobZWvEwF4QYnZB1fxhQsnz1nDvTslb813Wow8Qw9n2
         nzJN5Z6+icY2teRbCan2F1S1bCVFVel2aZdHKaIpntARYYvCQftsuIZv0TgaHecjBhNv
         MjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714675344; x=1715280144;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmQTHNad7dmA0s0giWalMqGG/pxPdq/wO7cnMf5Ybbw=;
        b=mRdwl2vIoSA5KrSwKTINul2rk6S0PrU+uMIrIgfMBQV67FKS5gXRc9T26WaPOc0Nsg
         RzLkzOsYs6L+qtfWyTV1SWWW7tOt+F1UsmWcqTsEL0PIbeJY0P5lbVQRt1xzeYccFqkj
         Wzm4Y4ofv5ayvTN5Xz/SyzA70xEVFUcswuAqv3gTK7HDtacesdfl5RT1FSbKp2YeQ0m3
         XD17/V3RV7PDmaYzZS5+BHnMlnxHNzdT4VNRJKL5S04SJBGo6INMVnp8ZKwdrnrWPSAN
         XCW7oJN2wSf+FP+jKvND06pkNtLsK4S4MVRt43t5xeXCKm5Rp+XA1aPSMrdCNy3ItfjK
         chig==
X-Gm-Message-State: AOJu0YxILfu/VojHuI77AsSkNAV+Z8dFHtext79qmAqghYtLXDhVFjiX
	Rr0am4pQlK+5c4iq7UYRQMZqvjUY+CIcjZbFM/QAUneSeEVRFbZg8G9aHlrjEhbmXiKBALCQKbJ
	n8fKidikuu1i9nIfRNcvC2O96bnugKQ==
X-Google-Smtp-Source: AGHT+IH+FNSK195qG3bFbTfZRT9MxN1OOqFvoVe8INNeh/RDDAeslAlQ2IGbCmqGm67K93s0hgG6L3m4OAsh87HFSxs=
X-Received: by 2002:a05:6a20:3953:b0:1af:5451:d00c with SMTP id
 r19-20020a056a20395300b001af5451d00cmr737628pzg.32.1714675343944; Thu, 02 May
 2024 11:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Philippe Cerfon <philcerf@gmail.com>
Date: Thu, 2 May 2024 20:42:13 +0200
Message-ID: <CAN+za=NCAmgf9Lmc9qh6RC4TRMxHAimzm_qgXhF-tes0nChfyA@mail.gmail.com>
Subject: support for Cygwin XATTRs in NTFS3?
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey.

Cygwin supports user.* XATTRs by encoding them somehow in Windows EAs.

Any chance to see support for reading these via ntfs3?

Maybe with default mount options, they could be mapped into some
special namespace (like cygwin.*) and with some special mount option
like xattr-profile=cygwin they could get mapped directly into user.* ?


I found only little information on how they do it.
There's a few words in
https://www.cygwin.com/cygwin-ug-net/cygwin-ug-net.pdf
on PDF page 4, chapter 1.6.3 File Access.

Other than that, one would probably have to resort to:
https://www.cygwin.com/git.html
where it seems in
winsup/cygwin/fhandler/disk_file.cc
winsup/cygwin/include/attr/xattr.h
winsup/cygwin/ntea.cc (which seems to contain the beef in read_ea())

ntfs-3g as some limited support for getting the data:
$ getfattr -n system.ntfs_ea test --only-values | hd
00000000  90 00 00 00 00 04 80 00  46 4f 4f 4f 00 37 32 66  |........FOOO.72f|
00000010  32 35 64 39 30 65 66 34  63 66 65 63 64 61 38 66  |25d90ef4cfecda8f|
00000020  61 32 63 34 37 35 36 31  61 66 35 61 66 30 61 31  |a2c47561af5af0a1|
00000030  30 61 39 32 62 66 64 31  35 39 38 36 62 31 66 39  |0a92bfd15986b1f9|
00000040  31 36 33 35 38 62 66 36  61 63 38 61 33 37 38 35  |16358bf6ac8a3785|
00000050  38 61 31 34 64 32 37 33  32 39 35 30 36 61 33 37  |8a14d27329506a37|
00000060  36 36 62 61 64 30 66 33  34 64 32 65 30 34 63 61  |66bad0f34d2e04ca|
00000070  66 33 39 37 63 31 36 30  37 62 34 33 38 30 65 62  |f397c1607b4380eb|
00000080  33 33 63 39 37 64 33 37  64 66 63 33 37 00 00 00  |33c97d37dfc37...|
00000090


Here, on test the following XATTR was set from Cygwin:

$ setfattr -n user.fooo -v
72f25d90ef4cfecda8fa2c47561af5af0a10a92bfd15986b1f916358bf6ac8a37858a14d27329506a3766bad0f34d2e04caf397c1607b4380eb33c97d37dfc37
test


Not sure whether support for FAT and exFAT is needed, because it seems
Cygwin itself cannot even set XATTRs on them.


Cheers,
Philippe
