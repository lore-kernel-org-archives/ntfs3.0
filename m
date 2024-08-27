Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3792E62C
	for <ntfs3@lists.linux.dev>; Tue, 27 Aug 2024 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724775425; cv=none; b=CvFviD+q2MvIzRL+V6xNIFO2HTRGVl5UMO2kGDNP3KofgKc+N1ZswTlkkQNBkv7Sz7xn/8gFZIShCSY9R0SX54PJePEjglYYXp/4ggdXa/IjxmDzrL5y2Rs2aeb14acxO+JFbEbWWLJnfuC+suAKQp4JwkC6qacjJEDRavvsDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724775425; c=relaxed/simple;
	bh=5XAqISp1O5JZg1ULLaLmQmHYO6E/l554W9XWwLazz7w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fx458OfMCi8F4fdDl+Ycchb4TdO2jfydhLV2maC0Cjzr1wTDzCB9/4ApZbWvhFx3oiTPHE5li9pBoH/8yso8ML3u0KfS5wkGw6jgA/M+Z+9mxfcT0ha8vtQ9Yn3LUjL21CoGSVGjAEq/pl4wGURUlZsUKub021jy7Eomwf/pAOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-81f99a9111fso606819839f.2
        for <ntfs3@lists.linux.dev>; Tue, 27 Aug 2024 09:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775423; x=1725380223;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwdLy7ifDFmOoT2TcapjsucGnYM4zQXePJyan7677kc=;
        b=P++sTN53oEDDMbHpCeKGsyDWHgtj1M4XpxAfX72J186sp/6SMxYs5+Dw0jQM1IqvoI
         2uEfueKawxBY5Pa7cKDHfMcsTKcopJ40XwEnlRqif+u7OdYGbj2yhNg+5bae4lgHEXcT
         1YEIQdpRvGmfz6vq+0QKIrnsB1zEihfqEbL3l+nUvmBu2FPv+1mWqpbwaDO+h6zpjoJn
         8W7o8GMQwsANEBgf1ltmIxjsl7t+dYBBG3E2NzXnEvAVajpyucqgWAnC3S5ZdJuhwWbM
         QpFQWSIi2QNbi6U8QTbz+ysG+/A4vrcBdxSDlUgmyUyBUiqJR6ABiJ9haqE4ECR8mLJ9
         UM9A==
X-Forwarded-Encrypted: i=1; AJvYcCWLXB+oCyeyD27UiXrIw+z4eW1mCv/taSIF1oCCfuEcpB7dwN5/MMrqd0gzTdUcl6uI0oc2uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEWwxnuiMlvTizQcM7JRfOI6DP+CfN1DSU6ZgTiOGGATJHx6gp
	vp/xAjl+kdGXw5bZjX+g9uxqtnBqyNagKK9qOSyDtFcqwJNQAzcdn4YX3opPNuQOd/qyY+ropJD
	Xp+5Q/NqQ4T7pG5PbY8iIWfAvi/n5kyXkFK2QM42N4Lw+gk8iC4lsf7k=
X-Google-Smtp-Source: AGHT+IGpwEmPBIxSKDNU4LNMXj+yBrZQT3OiZ3ToEhcwCQyzlfwwdNLqvvVvcM3LRCTQNIhnwWPtHyIODAfKlavgXJMzK0Y9wJWI
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1485:b0:4b9:ad20:51ff with SMTP id
 8926c6da1cb9f-4ce8284ec5bmr330404173.1.1724775423189; Tue, 27 Aug 2024
 09:17:03 -0700 (PDT)
Date: Tue, 27 Aug 2024 09:17:03 -0700
In-Reply-To: <000000000000be9914061763f17a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006ab89d0620ac92fc@google.com>
Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in attr_make_nonresident
From: syzbot <syzbot+5b6ed16da1077f45bc8e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0f9579d9e0331b6255132ac06bdf2c0a01cceb90
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Jun 3 06:58:13 2024 +0000

    fs/ntfs3: Add missing .dirty_folio in address_space_operations

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=116e278d980000
start commit:   34afb82a3c67 Merge tag '6.10-rc6-smb3-server-fixes' of git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=42a432cfd0e579e0
dashboard link: https://syzkaller.appspot.com/bug?extid=5b6ed16da1077f45bc8e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110a2c7e980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1312ea4e980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Add missing .dirty_folio in address_space_operations

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
