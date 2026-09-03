Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42D377ABF
	for <ntfs3@lists.linux.dev>; Thu,  3 Sep 2026 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407050; cv=none; b=sdXpNeiwUlE8F3C6yd/ui3Yb6cKMWixJptFHRh4SUrbm8mL5fLeor/1hYUrTZOHMoKUctrsYxn8peSNm9XDTXcVGph+hnzd199yFBFYrFLHxp1jIhPMQO4DTbGjhMQm4BhyDou1/aQNL6UHpotu/2i5RVb99cI71VNRQykbMrWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407050; c=relaxed/simple;
	bh=MekaC/bw2J5PJbLFjiERstmDR+FFIcFUa33PSS6gzWI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TPJcdjaEeSFUSmnBzGX3IRW4ZLd9V1p9uwXOjg47EYpMOTLnt24dCtBfrh1fB6cKhbDPSHImVOJS7GjP6jsAfuIN0u1bJCWmLTZf2zPjUyIuAijyLpi3qdedMM3IORK1wPMNihLlem9cJSDs52IdM1jEWjz7W0QyxTIlqJy0QOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1478e3546so1237395eaf.0
        for <ntfs3@lists.linux.dev>; Wed, 02 Sep 2026 20:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788407043; x=1789011843;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bLwrttdEjO5xigp5FT8QRJJDoTnvI7kbhsn3pgHXw+4=;
        b=if5jxpCIluu6FQixxSC395zyU7aN97ogRmFRusuwh4XAYGwSTbcklleTrqqpbYGKZR
         bZwoCW+ftcFpiu0xOFvgUBTsTdFyyeSuQAiQCzxfwLhd136v98OO6vGEZ+0NCSZV7Ssr
         MH/ZKr5jXSVEJFVtzSaJKLfOpROxdHPxg2zZOxJmkq9Cug4S2/nEUW7/ayaHSy1jY68S
         L+sdyxopHaH7YVr2+1WGi76eu8gQKMB55yW0ALP7KAgZg52s+8mRTlLxVLTHSKQoPH0H
         +7Oh/QxxD87COSPoE+/XWcK18nP1aFe91UiP7/yDAEq989eow/dWMHn5JK0DxT1DH3Rr
         KEhg==
X-Forwarded-Encrypted: i=1; AKwUvBwU1v2ugzvAuUZfOOmcHAn0yRVGvW3KWQvEAWewL3ktyFIFE24lTxb1IPkimkip9TWed5g5Gg==@lists.linux.dev
X-Gm-Message-State: AFuF++l/gP2gGvXHvAEqkVlu1oj/8k1ntcT4qpWtf0tGW0jA+DPqTy2V
	0KDScd++dab6WT0pT1HcLFJT5+qUeAOR8AjCJSIYfkvgAAQ5Sg+v51JcjBOqm5WpC1r1RhUkrzN
	UGXbagZfsS5MxrixjnimMnayQuSluxrO1gMPwJPuO4RSxLum+p7CFyarKgwQ=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198c:b0:6aa:de29:651 with SMTP id
 006d021491bc7-6b48102ea96mr8177101eaf.16.1788407043559; Wed, 02 Sep 2026
 20:44:03 -0700 (PDT)
Date: Wed, 02 Sep 2026 20:44:03 -0700
In-Reply-To: <6a778cfb.9c11d2ce.289b96.00b8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98ed03.2e567484.299ffc.0006.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] general protection fault in al_destroy
From: syzbot <syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, eadavis@sina.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit be310476e8868ebe7a2ce8fb0e7b229535723963
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Jul 30 08:47:44 2026 +0000

    fs/ntfs3: Add basic support for alternative data streams

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17621f79580000
start commit:   73e3f0710014 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14e21f79580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10e21f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9efed59cf70d6280
dashboard link: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1391859e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11417415580000

Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
