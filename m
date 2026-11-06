Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939631;
	b=EUfFvx1cF7E+OEb1y6w4qX9qhlIfyXHnpp26Wkrr8swt+2JwtHx6r4JSH8gHyKZxoz+u
	 bfX1NI+pxGA/9mrFvY8DDVh55kAFQSKeaXhEqlkovFUj8jugS25DSEMqYbaygD4rPadz9
	 6tPaPmLOh4Bk6vbXqqz+AzbCGqrqzWnXFW22VFmIxEhuCBiMyo202XaqvVemQOwpaepqq
	 bnFIVD3LfY516T1lTPDuO/PJR3Pb/2h6AHRVer4bA8jZ7QePAUAfNygmOrCZA3uU0dzHE
	 8DLVarLof23h/J6WN6aTwGQFwFOFHqHZmVPEvmYVNeJTJLOx+hpnhEkERrbl+FBF0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939631;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=H3PCrpQOKeukqMHQivsvquj4Uxt0wqhi596+Jc4CmmE=;
	b=aU/0GhrIr0nHC7fUEm6hfd9bJfz40xwlamhPcpr1sepIom0Z5ugclGN1LJijnT1XNaor
	 Dd8oMW7W0YDwKSDsoq066TcHlQFK4J/CzGNFM0dGBD7gXxogh0SoJzugnjvU9dTwUsTeU
	 CC/u28BP95cFFtVRrpFuLnMwyafHFFzqHrCr3u7qN5a+OOUk3htZZ5SBnIbW7eFAWpfW4
	 RuwSagX4l+rc04SO1+RYFaNuRd0u4juUY2k2Bqico1XqD6hnIaXiIRz5E5OKUnDqeX7AA
	 hokEygnTDZmqy+iAdCKd55tkhEZPrtOtiPucVEb8YjHA26zMo6pniZ+VhdUGDgLq2ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C7606A335
	for <ntfs3@lists.linux.dev>; Fri,  6 Nov 2026 04:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060C7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so344073b6e.3
        for <ntfs3@lists.linux.dev>; Thu, 05 Nov 2026 20:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939630; x=1794544430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3PCrpQOKeukqMHQivsvquj4Uxt0wqhi596+Jc4CmmE=;
        b=XQinYkB3Eteq5OoEh0N6u48+1zYOg3kzFdCiSaZ2CuptxhzTcRx+ywcZUDaFRsWNCN
         92TOkRx6y63T1miV5EVjgzMhBUrX+j2L7SQuySxpTUmZACkVHdVUNMN1t2llNZaxp7aB
         lFyb2rE2txdbpymRX1AOkLcaod1hsPFDKZVA5IdsMpqWEAQRiRfbbx6YqMj9TrWm46lp
         Jmf+ek9WbLqG7/K9x6XRA+lv/zMKvlX0Dx5Ar+sDNZ9/7d8V/bE3JVsyn3/ep9Kq1Wwc
         cKeD2FAuMiaLYf1qY8WStolmb0tiW2QDmMl9GbeTy6YkbY2OsDK+gO17CTJOHb/dheNg
         /Hew==
X-Forwarded-Encrypted: i=1; AKwUvBwkcwiha+Cy7xcunKxhTN7jNK4N/JNv9RO1HXmRMDTflt/6Fb96OGt2NRkDNvT2WI3QTqa59w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9VNK886QMHndgwn4K/grbFaMKxaYlgl4/zRqB9ajlVOLmtr6S5
	5MA+ZBRBV80iQ9t28JjkQVWkk9gB4tKXQVpO/fSSObOP8gzjERuCaV2ZRNYMm0mAe56YC7IHymD
	iItAKO3ry8hPO7AJ/xXdpwhTw09/47AkIvqBfPrltxHm4o6XeWyzGsJwe2uA=
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1ad:b0:4b2:8ee8:8a38 with SMTP id
 5614622812f47-567e095e8c3mr948527b6e.0.1793939630097; Thu, 05 Nov 2026
 20:33:50 -0800 (PST)
Date: Thu, 05 Nov 2026 20:33:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed58ae.02d3f859.2829d1.0004.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Nov 2026)
From: syzbot <syzbot+list41376c1b07a9e4ea8fb6@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 0 were fixed.
In total, 12 issues are still open and 85 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4035    Yes   general protection fault in al_destroy
                  https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
<2> 703     Yes   possible deadlock in mi_read (2)
                  https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<3> 25      Yes   possible deadlock in page_cache_ra_order
                  https://syzkaller.appspot.com/bug?extid=8bd419f88e25ab12cb75

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
