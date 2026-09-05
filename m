Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B4384CE5
	for <ntfs3@lists.linux.dev>; Sat,  5 Sep 2026 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788651544; cv=none; b=KIaVhWKoNo6gNT2c8AKqN2XHm6+IK0aRMy7Wn8IZtYbb1yisGBJ4p9W1TlDLEQW8S8AZ4Y+xyS4jNV6tRBhURQAIQUCgktDUwF66RCThI+/ufUNaNN/nQPUin3/VFi8hmLl0IhxLXWw0WLiweNlKPsTkOTWP7pLliQVZYIjsDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788651544; c=relaxed/simple;
	bh=w6esUUNPu8BpPol/KRZXiWuoZ2jzAQ93b3hbqEc5MEk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hzS3npyTPNs4EM4rKht5yEI/fGS3XNxsKhjAr5DQFdBtMSN3chF/0Bq/56LNjhgrNsNeF5z5NikH1IMQ0bpVPjkOfRm4sCq8fc+oz28mtBpDkR8HY/DUk2MWz+Rcfx7SxKyZqgumlxYZRfJSA3/45tdtyM7rcPbni77hwfta9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45a07949855so3433869fac.2
        for <ntfs3@lists.linux.dev>; Sat, 05 Sep 2026 16:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788651541; x=1789256341;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKXoibRSw/wOsrV5a7d8BhV7hWNdQ7b1sUhe44l++gQ=;
        b=T07dvRrxY0AuteqeUxTeSlAEqieUSpKuR3zQW38fgcNWC12YX0tTVKxKSu+80lHuYf
         mlGsiWbOzENGBUC3zhRXkivYVAKaxmg2l+2f5dusNYQ9Qmph4W85mox5zTlCG7T8riry
         Ay9PDzoQwNgmUMy/374aL9/6WihHTU2FzIbenRgzymbuOf3JkRUagyCP3/ma8Ov42MQz
         YSQ90wcTvwuywRUivgljrbiVbg3N9MLUr7rPU1r5M4oDGAmZLuexahLyNqtOtlfcVRBR
         cwxBn0/Fk472G0mkcZZhtweZ+xpKyx/FT52+noh8Su2JCVHKk8ghM1Z9R2UqPcEngE3U
         IvRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDOoq5/V8IyBk6JYsLm+ClqW7IA8taonIsps+8etFZ2/cQSCQdL8shKZ2DsQ2VqigJZRdmzQ==@lists.linux.dev
X-Gm-Message-State: AFuF++neQe/Y2oU/H/Req1YLDeU42Iu+I1rQw5jcrU8/7/MMZMoD212h
	Tw52NXxGiFC+1FQBaHr+BSYQy0tEo9wkr2CE4dRVsDeSSH5ya0zh2dTEt1ZM+z3WGWePbgPoIhX
	bRQFTbx783uuAdAZYu1VHWLQJm7WqSU5I8vQPFZT4RzjT8mHoi3QspeCf2ek=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:201b:b0:6b7:46fc:1d0 with SMTP id
 006d021491bc7-6b746fc0280mr8338537eaf.47.1788651541499; Sat, 05 Sep 2026
 16:39:01 -0700 (PDT)
Date: Sat, 05 Sep 2026 16:39:01 -0700
In-Reply-To: <6a42cfca.9dc7bc9d.3393b4.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ca815.2e659fcc.61e1a.0009.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_readdir
From: syzbot <syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, gality369@gmail.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d62cf685d12e95cc0a4122c43cd9f0eb8bba0b4c
Author: ZhengYuan Huang <gality369@gmail.com>
Date:   Mon Apr 27 07:26:50 2026 +0000

    fs/ntfs3: hold ni_lock across readdir metadata walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1376eb49580000
start commit:   02dc699f83d0 Merge tag 'kbuild-fixes-7.2-1' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10f6eb49580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1776eb49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107a8db9580000

Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
