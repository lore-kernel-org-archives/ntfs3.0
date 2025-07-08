Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB402153ED
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965565; cv=none; b=HA/OQGw36DNPUsXnpzh1mubH4Nmms94KpwSe5Galu9dCKnbRd/jZHRP1O0AnRLJNhMtWLfmKom9CYjHiD4J06Zjo7SNfbuUT6CIRgtdGRWPVHTaICCzmQvaMJHZtw4RhTelpSI8Qm5DvFhFubCkWqqJYRuVloJIUPGVXGvsOyVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965565; c=relaxed/simple;
	bh=Xhb9ffyW8dSjYoMTKUPlDRr5VE0teCeAMQ6EAiIEer8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PJ9sVJuFVxpoX4QcIuRG340Q2a0/0AL0CTzsoIv0JXb9o306sF0tU6QT2GSc4+0wqORn37GjPc1ktRLyUuISBNZXUUEkH8pGswf6fYB/aGMKtDChjFXLstWPa86yhwpROrsPYyFMsr8BHaZ9jIVvG785TGJc6GCGcvErHJuCFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87595d00ca0so353831339f.2
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 02:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751965563; x=1752570363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKU2Ks7QggMb85/IbT+YTciHNCoFkKdX3/APeX+LtU0=;
        b=dGy2eJoRQvXcWQjvQuqB87H6GCnk5sEeTDnL7wD0Sy6vE+sipmwRVDxeZBOUSjwJ6S
         Io4NtIc4jl2yMixaBI34vx2HVfzVYBnE2M9u6Fd0nk/R9iYIiy/yBYvx2yRfWoMMqYXN
         Qj4vlnkOy9cNePLTwI3buaX3B4gBqh0cXrlnWa0VWVRnHDsI/UG8m6BKOJ0Yhh7kLRfc
         r7o0kzwegp5DqnJ4r1y5WvvNJc+tGN3RYtjAyNooZ+VUrPbXkApnTET7fOyT1tXRbH5t
         ptJNBL9I9tk8WTnl+0s+YcDaG4HtVPFE68fWOsK4NuhM4TeR+0VxrXyJ9W/gnDj5oCmE
         rr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7FUoDT3ISw1Ow6+Rtrz9j6FhLai/KzkKlC3Ck+zirMJglrhVcQqQ1CP7qSxJ3p9w9V5IrWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE/i0463Dtw9oMAulaQ7aYvNFloe02QaXJBdDh8ueb2qP7QSgV
	KxaHvA2oLq9CRux8Qww2YMZwbuvQOPOMUAzpA6Zwu1dNn2MlHZZJqF/t+QCy3OgiPSkgGrh2FE4
	V1qcPjAQkOfWV5BzQAl3RUjWmXpT34WfVTvuM79n/A6NAKusvIYc4QD6/XhA=
X-Google-Smtp-Source: AGHT+IE+BaPhaNoHXu+pbQ9ISl094NhJTXYh45F6pUUAI/I/nlwym42E7vyfZwRJ1uOiDI6DxQFhoxw/D9f/d3mFKp6yk62/EznT
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aaa:b0:3df:43ac:af5a with SMTP id
 e9e14a558f8ab-3e154da8d00mr21915035ab.2.1751965562784; Tue, 08 Jul 2025
 02:06:02 -0700 (PDT)
Date: Tue, 08 Jul 2025 02:06:02 -0700
In-Reply-To: <CAF3JpA5UK1iRiHTbPZNej5izQZNVwi3phN5f0pzCzadqn7K0+Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686cdf7a.a00a0220.338033.000b.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	moonhee.lee.ca@gmail.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Tested-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com

Tested on:

commit:         26ffb3d6 Add linux-next specific files for 20250704
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13a14a8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59817f9ef599726c
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a9df70580000

Note: testing is done by a robot and is best-effort only.
