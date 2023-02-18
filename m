Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1254642
	for <ntfs3@lists.linux.dev>; Sat, 18 Feb 2023 22:16:22 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id b13-20020a92dccd000000b003155720bbbfso643235ilr.22
        for <ntfs3@lists.linux.dev>; Sat, 18 Feb 2023 14:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHsGASxn4uSpXV+2HTVe0iufvQ5emn00jv5p2JD41NQ=;
        b=pl5R3KOHe4h0jureZifgt6nIC+pRm2CugBYi5lvJ/OCjWUkJYFcPE1DUnV/dzjt7Ow
         OBsxXkHMQQZBE/dXuzA/CusCvaz2NqduerEsb7ls7XZOsl+yqRsIyFJlK/n+5dcgD8Su
         gAh5veYuiv0355tJHEy99AmDbCOVzqPx3/C9tLOLRXe6uw0CTPqocLnzQwawJP+sdxep
         7nvQsx41t5QfTfbhlnDDiVJ+R6kkumSnoe1ibGJovYAYVwQ1aeMCdAalMOVblpd7l65I
         Y7RXmI8khFax4UQU7y6zT/RUdSlnYvQ/pxe3qagbcsuOOCbu1TSxQQtn2+Z/eJI6A3oy
         rnvg==
X-Gm-Message-State: AO0yUKXZAdykLNW5ovM/a60Sdl11YxksaACzxzNls/CCwJID8x5ajBPZ
	n7t+6iJ7Uo2mZsOTa2MBRL5pzROnw4gGygYAxm+jQ142VdIt
X-Google-Smtp-Source: AK7set81YNapfqNQN/UzWAcnjhBZNW5cOTuUpKTrlryiSRsou7OkgLiS8ErPWr/uxepSxYs5OQH2sbSHGA092OPmq/y0k9QkOI3p
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:c:b0:718:b11d:a972 with SMTP id
 b12-20020a056602000c00b00718b11da972mr1403521ioa.36.1676758581499; Sat, 18
 Feb 2023 14:16:21 -0800 (PST)
Date: Sat, 18 Feb 2023 14:16:21 -0800
In-Reply-To: <0000000000008f00f7058ad13ec8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009fddba05f500c785@google.com>
Subject: Re: [syzbot] [net?] [ntfs3?] KMSAN: uninit-value in bcmp
From: syzbot <syzbot+d8b02c920ae8f3e0be75@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, davem@davemloft.net, 
	edward.lo@ambergroup.io, glider@google.com, idosch@mellanox.com, 
	ivan.khoronzhuk@linaro.org, jiri@mellanox.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	petrm@mellanox.com, phind.uet@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4f1dc7d9756e66f3f876839ea174df2e656b7f79
Author: Edward Lo <edward.lo@ambergroup.io>
Date:   Fri Sep 9 01:04:00 2022 +0000

    fs/ntfs3: Validate attribute name offset

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=149cdbcf480000
start commit:   b7b275e60bcd Linux 6.1-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
dashboard link: https://syzkaller.appspot.com/bug?extid=d8b02c920ae8f3e0be75
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164c4a4b880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=152bfbc9880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Validate attribute name offset

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
