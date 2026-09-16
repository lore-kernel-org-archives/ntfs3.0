Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E124B540C
	for <ntfs3@lists.linux.dev>; Wed, 16 Sep 2026 22:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789598408; cv=none; b=ojMvB58TxiJV5bytaY7kxOtRDGBRlDMRe6kgEBlX43ERNordCwO5f2Zm0GyyJRKdZdXKWBtGVh1Ukal7AMN32m69YqTTHNy9pZnN9jRqNtGIu8QlrOimV7A915nkRgInWsZUfrxnvPedlLHd0yevkYG+X1HR0IOFMoS0kizWc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789598408; c=relaxed/simple;
	bh=aY0C3UZNWISVo+SEYdMA+dpLR2TC50hIsVNTH/1tMWI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gh2xISc0jkgdW7RmC/goas27o8KItYcdJp6Uqvk81GN4suQw2yCcdGNY+uuicjEKj+QJvTjstvbwgvBw5Os0zlSsGl3dFGsbQ3jQ10k0JQxaLA9IoT0Tn4w/pMvqUtwLwjooxRjB7slwQD8cyPBzIX8uVlbb6I0JThpAskbu8ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so261520b6e.1
        for <ntfs3@lists.linux.dev>; Wed, 16 Sep 2026 15:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789598402; x=1790203202;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eWbhpWk71ccWdwuOVmq402NHgmE8BaqjoYuvIsrzF3g=;
        b=g8UYHFjKfuyjDsQhps1UYLbhZ2tafH1T+sG2kqKo5KIb5CdepJesZCYD/YdbTjc50f
         uFuyoo1h8vuGE1ssE6tMl9J/zlJRevzFFfdv+6/emqWTXF+i5nrcyNHhi5Ov3r7KKZgh
         l8m2xhlLIrDcAOLWiMEFoP1fucGHtLIasOHUZFotRLHsZbr149evE75MAcs20R0kjhVl
         yMieZGNcrdZOi+4bFd1wYOo3T6gbtFvVhbatK7P8bl1rvQp/pP8NH9VAY5WId5IHzFEd
         NcJUUfPDZ8r5GdOMNVfqOIR3esUnXM32pXT11O2b/XBHq+RQPxg769Kkwi7oG2f7BHmk
         +zaw==
X-Forwarded-Encrypted: i=1; AKwUvBxpdwrnsmP1fmitugrEV67s3S3tj5Qlg4HOoqR4U4q2Cc0DnYg1/XdKaJK8AcwZg/df6ounsg==@lists.linux.dev
X-Gm-Message-State: AFuF++lw+r7gfqismXKJHge7ggZDYF17HO4JnIrQtuqXCEDFOsoqufLz
	ns47bXucWXSBDqSLTslpjCkWRuQc0S6S5tWxBbOsd18m5e6T4nb4PSjhX3dFz/fiP39DWQkRdba
	UaoAGRuR8BVazFnK7g9Xvgczq+m7nlh3kFgKPNWJ8ZaYT2JCR4xCw/wt14Bc=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5087:b0:4b8:4703:db8b with SMTP id
 5614622812f47-4cb69b976f2mr1049869b6e.20.1789598402258; Wed, 16 Sep 2026
 15:40:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:40:02 -0700
In-Reply-To: <6a1b9770.fd5edf16.2e7427.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab1ac2.71f81b7d.278072.0000.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in page_cache_ra_order
From: syzbot <syzbot+8bd419f88e25ab12cb75@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	gality369@gmail.com, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d62cf685d12e95cc0a4122c43cd9f0eb8bba0b4c
Author: ZhengYuan Huang <gality369@gmail.com>
Date:   Mon Apr 27 07:26:50 2026 +0000

    fs/ntfs3: hold ni_lock across readdir metadata walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1540dbf9580000
start commit:   704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1740dbf9580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1340dbf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=8bd419f88e25ab12cb75
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=154788c9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134788c9580000

Reported-by: syzbot+8bd419f88e25ab12cb75@syzkaller.appspotmail.com
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
