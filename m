Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F542340A6F
	for <ntfs3@lists.linux.dev>; Wed, 28 Jan 2026 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639978; cv=none; b=Yrrpyd63nySKxy+r+FgW99yBjglNAD0lzLvbtPpfMAQ0NppdHBHNTLmDZ57WOelK2cErlR2iUNCkuYkUnoILbVHf9tMmXi5no1PxRoATR4jtjnjQVY4BJjAPoiXlTX87n9OOhDB0fRQcb2b/ZRZzK0oKVcJ2mnfqPL36jvwVIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639978; c=relaxed/simple;
	bh=TUgnb8v47oqyeQqUwyZMg1izlHRY/jjW8D5+sBk+JQo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Xh4nPndGjeeDwcM89SjgZHxGTO6TQyGNaMBOFJDlbSgJv/1UM1PsVOgLcUxT6lHEoCM+G9dSfKtxKP5gyCORupCengErUi/bddXR6NPTwZAP9m04QxYSYzSkHu37JmwNC6lqxkxqyjfbmTBW/2CDG/v8YrRtW8C9SG9Aep5G3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-66109baed42so1027081eaf.3
        for <ntfs3@lists.linux.dev>; Wed, 28 Jan 2026 14:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639976; x=1770244776;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xl9nPVwrVOT1mDbB64Y1BWPInO9FRljdhGKKsU5RGmk=;
        b=lTTcEFreTHmH4DfeI3LVi7slpeg9rhCshVpzCBaYT38ZEPc9V24kjZ+HIbrn/p416A
         EaCD8hFvX4/rXNVyNsi9AY5EQcyEegRCvd4aosv2sfVsYUqYS4dgiy4dqx/Obsw4WDCZ
         nNhEXhKfgbv9Hc5NinsY3RIbKZ21gAsLVImPEToTMaU24BMLU5gB5M/CzzeUE0p3w14U
         IaYoIR9RxgciurRbvpgdj+ZKEuLdsz9PO5iULjU8u0/CRU+WY+Qjid1Jt4C3ljPbjjyd
         ZTLX9f/X0q8jpzVSEqSjNftTCFViaPxxLpRLZrMxBcK4Hd/qQ2UV0k23IMQIW4v9SSxq
         NRiw==
X-Forwarded-Encrypted: i=1; AJvYcCW33S3j08rGh81Sx94mSdD3/oyiE2Ndbt62wnI2m19HA98XDwFhyrDHMS9wz9F0iC4lsuZ7+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI44e3FeNbxBhtaHaFfxs3676GMyKyLMLD/1tMD3aoYUjTINYy
	ifQoh12BMELQ62mxG1pWVciQbJHzJjfwDmMn1DugqHyadVuVf/UGBkjaEVtd9UtBI5EhnkiXYEd
	hUX6mFXoC9Y1I5Go0+bOLEeGjUe41LbXIj27xLGmiJNf/f6k/2699sR0mmZY=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c87:b0:662:eec7:58fa with SMTP id
 006d021491bc7-662f20b3319mr3367043eaf.39.1769639976413; Wed, 28 Jan 2026
 14:39:36 -0800 (PST)
Date: Wed, 28 Jan 2026 14:39:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697a9028.a70a0220.9914.000c.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Jan 2026)
From: syzbot <syzbot+listcd973ab20f45b5fb0d7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 1 new issues were detected and 1 were fixed.
In total, 20 issues are still open and 82 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  9370    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<2>  5594    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<3>  3616    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<4>  517     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<5>  411     Yes   possible deadlock in mi_read (2)
                   https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<6>  137     Yes   KMSAN: uninit-value in iov_iter_alignment_iovec
                   https://syzkaller.appspot.com/bug?extid=f2a9c06bfaa027217ebb
<7>  116     Yes   WARNING in ni_rename (2)
                   https://syzkaller.appspot.com/bug?extid=4d8e30dbafb5c1260479
<8>  88      Yes   WARNING in do_symlinkat (2)
                   https://syzkaller.appspot.com/bug?extid=d123d9a1df4f9a897854
<9>  15      Yes   WARNING in errseq_set (2)
                   https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
<10> 15      Yes   WARNING in iov_iter_revert (5)
                   https://syzkaller.appspot.com/bug?extid=1e5f71cac2c1db825478

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
