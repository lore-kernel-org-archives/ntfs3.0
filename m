Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123773921F6
	for <ntfs3@lists.linux.dev>; Mon,  5 Oct 2026 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232421; cv=none; b=AqiLfcQqhar1+y4lcmcrPRleoR8MlVFz6nTIh87HpfbXHaP7ERYN9VJg5zfFUrH2DxRMMMW/f2S+QFI8SBbNY6mtq4rGXjd0XqXAQL8YcuCJsCJRLCR/Lqh3E+TMzWcQ0Vs717CqkIOI75nlt6vrlsz97vPWMFxrtCmgtpDPsu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232421; c=relaxed/simple;
	bh=Wn+dezwOG1k7TtTfi67rlSmNqRy3ScRlO1oloc7xTiM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=s2czQKAsA+oyamo+HOFZV+mnt+tX+IqxVJ5t0RVkHJZd28jIgT7RUIkPyp40vYJyuQGFSZDYZ5xi7kcIFO5RcbLj0rs0xFrcxm8I2ssf9yjr+ZfqmSL2K8gZHSE0HQW0iMy2XEaaj/SIbEowPFtSfTM4o+BrTVTnqHfup9tJ4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46524220c5aso2343395fac.0
        for <ntfs3@lists.linux.dev>; Mon, 05 Oct 2026 13:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232417; x=1791837217;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtIEXTPSdkYP5S5A4G+u9IsP3J/p10TykbRmGowqaqw=;
        b=o4TpC7+8VlMr033p00iOcJ21BFYHpz4VeT5q+oJ9EG+yUeTr/COV6p4jdpP7Sd5WDN
         AkBzEeT6ofYjL1LAc59nwvaKkN/lI4pL+x/wBQNH88qGOhXq+0o2yyA1j/XWCZqMi1JC
         FWICThUo2ohcA5O6Fwr9Zw+sbZSycdEQTj6cgLAbCwgtSbOoUDbCppzGXIvK8oU76O5N
         ndHJ5JowUJBI6GWgPY3JATlL0CsA9S5RU6u9rPzTsIrqsxxTcdvRd1cgTScGSjPl87oa
         nOV+iY+a7gwNLQbr5GhPHW5eookS+RMWvMF5f8K0QNrcm9MSR4XOWV3E6o9WHt2reRS6
         FSuA==
X-Forwarded-Encrypted: i=1; AKwUvBzLR9z9yOzzofbyBXtuhDc2sOYWzDg55IxW2/tiYrx78xh5FQ5EVoZo2220LT4FoUxG71R6CQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l6+M3mKH/XgazmelHLbuGqxpOZZ0W4IXBqWL4XmwR1qXKS8bsf
	+2ZJGxQj/PJq5/w6RpEcVOJZwoBCDI7Y1KK+MUIpzFjGv2RjEqEwzGeacvQ2pPqzwB5MrI5IAeE
	zAmgq+K1Wxk5t3J6BxP0nRMm3Z0CHJSr82BVKN/mM2zhSy09a29aBzTlwCPA=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:221c:b0:4d6:92f4:d684 with SMTP id
 5614622812f47-4f67b96ee05mr9364527b6e.63.1791232417116; Mon, 05 Oct 2026
 13:33:37 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:33:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac409a1.ae2c267a.265a6c.0006.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Oct 2026)
From: syzbot <syzbot+list5c1b0e54ec58a24b17ce@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 1 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 94 have already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2417    Yes   general protection fault in al_destroy
                  https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
<2> 666     Yes   possible deadlock in mi_read (2)
                  https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<3> 530     Yes   possible deadlock in ntfs_fallocate
                  https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<4> 104     Yes   possible deadlock in ntfs_readdir
                  https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
<5> 68      Yes   WARNING in errseq_set (2)
                  https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
<6> 21      Yes   WARNING in wnd_add_free_ext (4)
                  https://syzkaller.appspot.com/bug?extid=323f07d372f692a127b3
<7> 14      Yes   WARNING in attr_data_get_block_locked (2)
                  https://syzkaller.appspot.com/bug?extid=7be6ad5cb228286af3e3

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
