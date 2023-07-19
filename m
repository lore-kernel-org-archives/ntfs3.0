Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFD112B8D
	for <ntfs3@lists.linux.dev>; Wed, 19 Jul 2023 11:39:31 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-39085e131dfso959007b6e.1
        for <ntfs3@lists.linux.dev>; Wed, 19 Jul 2023 04:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766770; x=1692358770;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vGmZ9/fDb9epDvOedOBs7HeR46EwNPEEK7sk+j6Kio=;
        b=Fq/sxa3cbCQq1oX9k6ECpqvOL4Y8gwrGkrtO/j4EPsxDXC+iDWGCy11IaF7w2HHimA
         nRMSAUcMMqZq8U5gWwrruDrblwL077eMiUScTaCAjUVBdtL9+lDEgfMYH6sV+NP3tZN0
         mieFpn0CR2hh4WAR2dQM6PQpzZeHzkudbuuOdRLI11BNXcN93PW0N92TIIdvSfjrl4tb
         5XZU1LXBKdBYUZ+5ZWkn7NPqyiOfypm/WUhy708EUX/17oX45RSTt5Qg73Mciw7RckFV
         9Wnr8OhsBE4DHIejR6J2uo9tduSyyyAnYoe0DkiXcw/4IKFSSa+WDiFV+uE9VGrdBBbt
         SyVA==
X-Gm-Message-State: ABy/qLbrsvFbSqS2/GXLSaJfNvgFaDpGGBlwNEzbHK+GeJiSdHgsLU2K
	pEx2IPD2C9RfEUyb/1Sa1lGMpav/UKL6Vn7iVyDE6aUKEZNG
X-Google-Smtp-Source: APBJJlHVcNkxZiOgTQ8esKMapxANI5L22BOi8in+N+miz/kb77z2U5OyIOT1jLZTT/rIepP8GTCXchunn8fJhay0LPEwt6P5G282
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190f:b0:3a1:ee4f:77ce with SMTP id
 bf15-20020a056808190f00b003a1ee4f77cemr3849967oib.1.1689766770301; Wed, 19
 Jul 2023 04:39:30 -0700 (PDT)
Date: Wed, 19 Jul 2023 04:39:30 -0700
In-Reply-To: <0000000000007cfb2405febf9023@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000018e0570600d57cdb@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel paging request in attr_data_read_resident
From: syzbot <syzbot+33a67f9990381cc8951c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit ad26a9c84510af7252e582e811de970433a9758f
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Oct 7 17:08:06 2022 +0000

    fs/ntfs3: Fixing wrong logic in attr_set_size and ntfs_fallocate

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=143dfc66a80000
start commit:   74f1456c4a5f Merge tag 'linux-kselftest-fixes-6.5-rc3' of ..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=163dfc66a80000
console output: https://syzkaller.appspot.com/x/log.txt?x=123dfc66a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=77b9a3cf8f44c6da
dashboard link: https://syzkaller.appspot.com/bug?extid=33a67f9990381cc8951c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15619a3aa80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12288c1aa80000

Reported-by: syzbot+33a67f9990381cc8951c@syzkaller.appspotmail.com
Fixes: ad26a9c84510 ("fs/ntfs3: Fixing wrong logic in attr_set_size and ntfs_fallocate")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
