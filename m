Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5ED264634
	for <ntfs3@lists.linux.dev>; Mon,  6 Oct 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759747627; cv=none; b=IWLuyWNCvrgxGfLnm8UED06Ihfzuaxt/jPeh2eLR0YNc6YF/eHaSKYrdv6hQWQHmjRT7UUx90AN6IB+KIp/nWemaJDWnEH4sbjO34zRpWllU37QUeOWQzsD1Ru2nBlL7M/RWN7dRuHWtngryTkKYnuQHFTat7aN+bJxzeKrnV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759747627; c=relaxed/simple;
	bh=MRguVoH9xVXZ8xCke5EDKsRyE5O3HLuD7jYGE6bFqkM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TFosU0b2eznWaDeltkGGwG/oDlJ+J5P/L3AWrPBmZWHlqbJqxB6WIy7NGHTKTG1iZJQSjrQHhvCEmI5xoFsTRpYxL9iKWk/Vz0HYs1VrhNg31UYu9EJpuj+f9vWil//tHAYtSlbYncxkvDgF01PYV5QUf5EesC/AVXhMG6K+sQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-886e347d2afso501180939f.3
        for <ntfs3@lists.linux.dev>; Mon, 06 Oct 2025 03:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759747622; x=1760352422;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnhgHNmaKn33yO8Yk7hjkUq3ciy72gfjIkejk7N2DN8=;
        b=J/cOqiOPgNn6o/cKxJ5Fn6tRuVqQytfZV+wWzhN5afmYKeRQw1eCBvTJN5gAShLh35
         IoQbNIRf86P96YSrpF/g7BTZfKLEfLlThiBOxFqCva3Xw58xPqz+3GoOkdV0kC5vXNad
         tfW+TwNc9PfwlZPRlnugsMNe6FpoC/9cihAL4zWu2/KMt8SVJddc1G2febsuwJWX5D0D
         8+p69jc5y3oHzcC6I1dkBeKNJSWdNYOFjZbNm8CdNcKPN31OR9ltFnzIO2zICBd2jEXM
         jp7dZ4cImtadV8hiC1DwqZOT3MQiPYP+9nJTo6432Jkd/9MUSpyiAdInd7xl7/2rTJvX
         YWUg==
X-Forwarded-Encrypted: i=1; AJvYcCXmSFFOLhe1ncAnsAZx4T0zDETgfT7dKAfg4DDFUCk5njIIZqvEa73/lvl/IxUUeuoovhFX6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAV/cUhgVFtCB1kwUimoJVFKwr1xhKGtMX1FJsfn39BYbnqYYf
	MosbMtjQb65onOb6uRDdHlNYK681ROcPfVlNryRGDOv5XwwbS1lGTzu3oD56zMIyzVt6W7dz5Wk
	/QcIuELTq7L4tMHYbPMuWFgMbi2lm58BLSO8Z3R7nWW5dG4c9soPWqmdL6vI=
X-Google-Smtp-Source: AGHT+IGlVMdpwvaBxkFYUgpvxCjgSFNJRiWa2s5eXLMCmT8Fnhtpp5bUCBQ+kY6C6sIk8Q9NZmshceROFLnHuDn3g/kQzY29Du8S
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:174e:b0:424:fd76:2a2d with SMTP id
 e9e14a558f8ab-42e7ad8a126mr175026145ab.29.1759747622580; Mon, 06 Oct 2025
 03:47:02 -0700 (PDT)
Date: Mon, 06 Oct 2025 03:47:02 -0700
In-Reply-To: <68e2ff91.050a0220.2c17c1.003a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e39e26.a00a0220.2a5ca.000a.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in indx_insert_into_buffer (3)
From: syzbot <syzbot+3a1878433bc1cb97b42a@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit acdbd67bf939577d6f9e3cf796a005c31cec52d8
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Jun 28 15:27:46 2024 +0000

    fs/ntfs3: Optimize large writes into sparse file

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=147995cd980000
start commit:   6093a688a07d Merge tag 'char-misc-6.18-rc1' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=167995cd980000
console output: https://syzkaller.appspot.com/x/log.txt?x=127995cd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e654219ed2546322
dashboard link: https://syzkaller.appspot.com/bug?extid=3a1878433bc1cb97b42a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=104b692f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17962458580000

Reported-by: syzbot+3a1878433bc1cb97b42a@syzkaller.appspotmail.com
Fixes: acdbd67bf939 ("fs/ntfs3: Optimize large writes into sparse file")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
