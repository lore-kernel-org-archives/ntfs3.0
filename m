Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160268C0C
	for <ntfs3@lists.linux.dev>; Wed,  2 Aug 2023 15:24:28 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a5a7e981ddso11974393b6e.2
        for <ntfs3@lists.linux.dev>; Wed, 02 Aug 2023 08:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690989868; x=1691594668;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/xHSfiG3E7HaC8jNHVxDotiCnXbEHNk8zmRylg8nEY=;
        b=dssuHrJejPYKkBORW0kV09mS32AFu9EzNNs4rogeUFvhDzeYdY62XOFTMo+cCVxyOV
         YyKZBwAVTI6jbvwIRoBbP2vrDwLqVn+hgAK9K7TZ1QY/4nSi5GdH1ECJdVUvKLAkmW5R
         +fqMeMS8OQmcHedtiXeVMO7BkakqCP+QPo+V0HTYoIaIv29t3fs71O//wg7MVoxHMdUm
         4BZqwWGUIcW8WTXy1AGMq3WqBMsqjTH/6RR03QprflfYQukw09Cu6ZarR1j/U4uesJpH
         7dBkwrwtKTd9vn/St+ArF6JIb2QvsYH/e9XIgKMPMZn1wm78W5VOjbseWk34svgMxfVT
         V/pQ==
X-Gm-Message-State: ABy/qLYXmqN6oqozgoQpqPgd0dgya+2f38IhtiJJUrD3kJuSP4daRyoT
	JudjygiU2uf9KdyD5jULlDXHVckS3nKAkld6RlRq+8iEgn2I
X-Google-Smtp-Source: APBJJlHU0WeUCbqnQs8zsRopuGrmVyWbNrSUF3np4ZkkweFSzWejKwIUs5LnnM7Oa9NOViGy8XUCpcAuAyrQpG9pi4TUeByF1XUT
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1511:b0:3a1:ed05:198 with SMTP id
 u17-20020a056808151100b003a1ed050198mr26676639oiw.2.1690989868016; Wed, 02
 Aug 2023 08:24:28 -0700 (PDT)
Date: Wed, 02 Aug 2023 08:24:27 -0700
In-Reply-To: <000000000000117c7505e7927cb4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000066e89c0601f24249@google.com>
Subject: Re: [syzbot] [ntfs3?] UBSAN: array-index-out-of-bounds in truncate_inode_pages_range
From: syzbot <syzbot+5867885efe39089b339b@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	davem@davemloft.net, dvyukov@google.com, jiri@nvidia.com, kuba@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	vishal.moola@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit d772781964415c63759572b917e21c4f7ec08d9f
Author: Jakub Kicinski <kuba@kernel.org>
Date:   Fri Jan 6 06:33:54 2023 +0000

    devlink: bump the instance index directly when iterating

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=129893bea80000
start commit:   e8bc52cb8df8 Merge tag 'driver-core-6.1-rc1' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7579993da6496f03
dashboard link: https://syzkaller.appspot.com/bug?extid=5867885efe39089b339b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=153137b8880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123cae34880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: devlink: bump the instance index directly when iterating

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
