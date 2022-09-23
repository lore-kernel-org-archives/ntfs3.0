Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54217C5
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 03:37:20 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id u23-20020a6be917000000b0069f4854e11eso5866339iof.2
        for <ntfs3@lists.linux.dev>; Thu, 22 Sep 2022 20:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5ze3YQW5N0TmNeATfGMitJ0JVafKh+S3YbktO/jFZ5s=;
        b=4a4REIzSblO/XUlp0Rjx1fmjdrJfsvVYCl1IWsSFpVkFHnD+HwNnz0Wi1mRvtcoCtx
         qUcePOcWKKGHwU50uC6WURUDyrCfiz2EK6RIVL8/6fJ0ZfshRUL0ADS/ZSCgRVvhsyvF
         vqQmERbHdAD9fmu+gVd2VSRgI/VdFFOVY+1msvN2cDeSRZwnz30jJ+fnVfai2F9DMBJS
         1fisXS2s1HaZ8AsaGH6wm3O+w8rBnBFfWAkjlYS+J7qOz7jrhDZaShh/VWQ+WMdHXvbT
         Jyvl6euIEPkbeGmuGrdvdayEmQNoWFjBWvzbMb2FLBwLjjp2RlVgigQDSjAXEsRXOcR0
         M5nw==
X-Gm-Message-State: ACrzQf0pDONurW7OFs9zLBf8x+ja+OtM5Zo1htYgWuK56uUAviZCkw0z
	Kyou3+JmyTeHOp/ffrI2bCTy1kJZgFm3V/jOtFFYg0IexwmC
X-Google-Smtp-Source: AMsMyM7yB4yE29iDKfFCHHb5VnJzUZh6ETwiKi/ZaQnBsVlm7oEzx38br16XR/PW7MyFBVryjMKD5YTofJno6sZwT/BeA0sEEywl
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144e:b0:2f5:412e:7d1b with SMTP id
 p14-20020a056e02144e00b002f5412e7d1bmr3270199ilo.196.1663904240191; Thu, 22
 Sep 2022 20:37:20 -0700 (PDT)
Date: Thu, 22 Sep 2022 20:37:20 -0700
In-Reply-To: <20220923031722.3744-1-yin31149@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d50a505e94fe5bd@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in run_unpack
From: syzbot <syzbot+8d6fbb27a6aded64b25b@syzkaller.appspotmail.com>
To: 18801353760@163.com, almaz.alexandrovich@paragon-software.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, yin31149@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8d6fbb27a6aded64b25b@syzkaller.appspotmail.com

Tested on:

commit:         bf682942 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=15dcd888880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=122d7bd4fc8e0ecb
dashboard link: https://syzkaller.appspot.com/bug?extid=8d6fbb27a6aded64b25b
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1476e5b0880000

Note: testing is done by a robot and is best-effort only.
