Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5FF139CFA
	for <ntfs3@lists.linux.dev>; Mon,  7 Oct 2024 05:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728277327; cv=none; b=Tnp7oT9emQEhLM7HoQrTn0bxr0L9Mc6mWB+higaj3nMe1+KZSWdwbjlNo0gZ8jQ81nTLmEhNJv3qQSy+ciIr65ugLVJ0WTMij2/pbT3jKn3Fqf8uLY/Tu29Tr2UHdQbQkEIBecgOVayK+xf4l17dnVv+/FyfIZo1iNEpaFWdpi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728277327; c=relaxed/simple;
	bh=CIIjV/hWcdyFP05m5m4NTGbWgsxHfusAn7Dl+7PLsrk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W01gwb7cuMqrVZ2JIwmfAzXvsqd2W8Pw7crHg+kespKR19JvkBomm3GhZ/QznyD8b2Zwc2NLjKZ9bbYQxXAfS8QpNwyCke0Fq5P9qhKEjWl2DLPrUihQnYWZ0c7vWONB3eqlG9+AZGBoJUEcQJWCCOAarfqjvXgr9uwydnTCvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-832160abde4so395875139f.1
        for <ntfs3@lists.linux.dev>; Sun, 06 Oct 2024 22:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728277325; x=1728882125;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M81u5pFZU9kf7CiDd7xdJW6Q5HmFx0rGdBALi4uV7Ps=;
        b=ajpJavFQIujcQJ2t1LRIeDAlP4HyH0iSSEqAFueRbObkblIDES9E9yRQBrsR6zk0QI
         gID+RvG1Qo7zFAEQFDK8tCujMhK0dKSaUCcKzytozeBdnGybP9IAiBtn5ROlLeAHUHk3
         Z3jQyfrsZriz/Npbyp1zhY+aXjRIgbBF97WKrx+ZRedoiduTiWr3ATgX0J0rI95p43Np
         LzGJgc3bmVfnIMAOO6gLA5u5fvpnKUdE/eAPONGvCy7MdiZkxscXeIr8TvInHWHJ3dN/
         ZhKrUix5/OCHrv37J6QFyQZAl+e8Z4n+3D2dh5mP/DssWSER7pegV3/yYzG0NbGp1gYv
         iO4A==
X-Forwarded-Encrypted: i=1; AJvYcCXtsieED8l1R02rqU/BYsaG/IElulS1sn4MxK/daKpSC/XnApQh+x/l2u3EM5I64a6eEg3jIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6dwwlTPjNOIMvgfer+iDAmXnfYkfbQ1pqidqUx0OGOpSmbQli
	4NRy+5knt/MRdH2SGdXRu+O72cwhn9bmKsaifA2+V5qU4rrll6AFBHIm0D2HRFXbOn78nOwQ8M3
	LrzrdIptPnvkLHdbVzZfGxR669TfgHfbFIuQfIWKfhM3md6dM4cgn5uw=
X-Google-Smtp-Source: AGHT+IGcHQlHbT+mZEs24tHUFLZOVw30EswUciVc4QnWf5Jxogro6ZUfcA/4pKxRE4+/8wJlDefVCu03RLZagRZjhfg17YPv2kjj
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b02:b0:3a1:a2b4:6665 with SMTP id
 e9e14a558f8ab-3a375ce11c9mr76668105ab.12.1728277324939; Sun, 06 Oct 2024
 22:02:04 -0700 (PDT)
Date: Sun, 06 Oct 2024 22:02:04 -0700
In-Reply-To: <tencent_B3968DE192105D945D9F997D4FE88DAE2507@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67036b4c.050a0220.49194.04f9.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_extend_initialized_size
From: syzbot <syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, eadavis@qq.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com
Tested-by: syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com

Tested on:

commit:         8cf0b939 Linux 6.12-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e24327980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3fccdd0bb995
dashboard link: https://syzkaller.appspot.com/bug?extid=e37dd1dfc814b10caa55
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13ac4327980000

Note: testing is done by a robot and is best-effort only.
