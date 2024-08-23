Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC68637144
	for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724409449; cv=none; b=GYwNcyC1F3IS3rnqub++0DqvLDvTHP3ltH4isXfCgAakPkJSVwf4G5Tqev5iC/UtGXTUNJ0bGDwHauho4+X/gccp1XIcN0k3HDvbJKeuQP6wEB7/kf/6bnISskDgUdVU0wddd6hWD65xWcSTaDHhQTf//dC5T7jO1upXwYoJZ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724409449; c=relaxed/simple;
	bh=NPbuzJh5fIufxxJ+VIDS2qcxAtjX/5mbMZBiXDkU7QQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HoS6kOC6mw6ek18HK7ZdCzZExI6J25sOLV1oViPsOL39OyFGvnnNvE2BGTsWYEKH2uY9Nj1eQKcGu+cPfIeyiVlIauM5Kgz6t03XveOmGuvifIVKPUjH7EVo6zQQhMEWBIPWsrVJUS6RUCZ8smYZTqdzQtKXOgRtKgc7FRH/A9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQElDG7G; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQElDG7G"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5d5bb2ac2ddso1003668eaf.0
        for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724409447; x=1725014247; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H1DcsLCpDKMcc7VOa8JGhv30kC6ceO6Ou/wVdjXJg0A=;
        b=fQElDG7Go9e7bnU9dr6gmSCJfqbUglrMWMpeHRu9a1YqgmUhE4a3g1Jux074Edchf+
         e4EpgangX2HtLJwWLO5IlRR0gzHMQUBY+fQzWDqNljbflMsYjkwsl2mQV63tWaTeLqsH
         QUc6EmWB2YkWfeSC/khaM/3v5BWoCPbw3Gdbacmj26OV28qjOqdsHDz47wIvNA20wnDw
         6wZtsYbGxVby6RMOigeKUvbn+jp7/bhwEf9co6Xjio6mYitl0Zx6xyNoEOaIe7/QxlyL
         L81QCApdND0YyhK5q6BveyMD3Jg8VD5x7tE1Jv/V3v1cCO9yAaJZxrAVrbf/MCfG14U8
         ghkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724409447; x=1725014247;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1DcsLCpDKMcc7VOa8JGhv30kC6ceO6Ou/wVdjXJg0A=;
        b=LyvRJnTrYQoex/kjP9S2h48l/8ioKEyKfWNum3z6m6IlM1QmpRQGPfoUPuAQnaXPJ+
         T3OeTN+twKBZjaEFHV/HyAVlaZKz40N3snguTVTSr9dMoPPrURwrnt9JrMfxQgOR9VcW
         uolrQML9T3KT3YgpW85HukvHY3q2SlsN/S0qcbMO8IC3cSIvrWXNXqoH+UJaSraK8EpC
         djpmPB3NJYgzSTEA2an/E6+UAi2kVHoMzbLFk6Smftnuw4BhiUCKBTfa31x5JdicQ32P
         +k9HyKGv1Mdnnt0bMPy3jp0t+us0yksl5LV+PSsweQzeZi93A1oz4cAIoeTOp0c5OEVS
         pxHg==
X-Gm-Message-State: AOJu0Yyr/4OyxrtmbmLLQFRw4Mhzl7ZdkgRpSSqPvpjLAb0J2R1qrxae
	5eeQc+gmt2gTzMj2WmrdTQNtu1z9cyBILMv8PcAsZwKSQN9U/4xBLNbSI2wUnf8zQOy8IAH+uDu
	FhlfOg5KmHea9nXXXu+YAXofH+xZqCfYT
X-Google-Smtp-Source: AGHT+IH2ZO1Z+NfU52bLV2o+kk+5ZrswDfUtUswdFcaf+eCIGPDCGmufk5gqKSG4DHrNUQlOu72OBP5T3ssTIcRBG4w=
X-Received: by 2002:a05:6820:1c95:b0:5da:6795:a803 with SMTP id
 006d021491bc7-5dcc3684a13mr760736eaf.0.1724409446700; Fri, 23 Aug 2024
 03:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gyorgy Szekely <hoditohod@gmail.com>
Date: Fri, 23 Aug 2024 12:37:15 +0200
Message-ID: <CAG3GjfM2o9nEutyF0fO_tv1tid8mhmAR0GvXNEBkWFEx7TKojw@mail.gmail.com>
Subject: Crash in ntfs_iget5 on mounting
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Ntfs3 developers,
I've run into a seemingly ntfs driver issue and I would like to have
your advice on how to proceed.

The issue happens on a 32bit multi-core ARM system running Linux
6.1.83 LTS (+CPU and SOM vendor patches) while doing USB stick mount
stress testing. The tests repeatedly unmount and mount the same stick
and result in a kernel Oops (null pointer dereference) in a few hours
with similar stacks:

Stack1
kernel:  mi_enum_attr from ntfs_iget5+0x520/0x182c
kernel:  ntfs_iget5 from ntfs_fill_super+0x15b0/0x190c
kernel:  ntfs_fill_super from get_tree_bdev+0x270/0x3c0
kernel:  get_tree_bdev from vfs_get_tree+0x60/0x20c
kernel:  vfs_get_tree from path_mount+0xa90/0x113c
kernel:  path_mount from do_mount+0xa8/0xbc
kernel:  do_mount from sys_mount+0x3d4/0x4e8
kernel:  sys_mount from ret_fast_syscall+0x0/0x1c

Stack2
kernel:  mi_read from ntfs_iget5+0x230/0x182c
kernel:  ntfs_iget5 from ntfs_fill_super+0x15b0/0x190c
(frames below ntfs_iget5 are identical to above)

Searching for ntfs_iget5 in Google showed some syzkaller reports:

    https://syzkaller.appspot.com/bug?extid=b4084c18420f9fad0b4f
    Looks similar, fixed on upstream, but upstream diverged from LTS
so much that I couldn't even after considering other changes.

    https://syzkaller.appspot.com/bug?id=5332433f628f47da0efad0982d47e5a0602668b8
    Looks similar, reported on LTS kernel, but abandonned.

    https://lore.kernel.org/ntfs3/20240820105342.79788-1-llfamsec@gmail.com/T/#t
    The usecase is not mount, but frame mi_enum_attr is identical.

Question: is this a known issue with an existing fix or something new?
If a fix exists somewhere it would be great to have some pointers. I'm
not a kernel developer, but I can do semi-intelligent-manual-patching.
:) If it's something new, I'm happy to share more details.

Any help appreciated!

Regards,
   Gyorgy
