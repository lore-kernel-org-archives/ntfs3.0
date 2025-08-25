Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AF1F4CAF
	for <ntfs3@lists.linux.dev>; Mon, 25 Aug 2025 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756127983; cv=none; b=d+OaUPhTCUb7D3ey46YzVhoqQlyRljVhR9dwN1jWlZv7Hu91HDo7ZektP7nFSeh9p3Y2kAngFdt7ZrCLwZzfkEr2WMP7bOTOPk+xWWfngFZEsJIgKFEO/rHHHKz9BGjYPm1xDZ09NBWcx4JgPhsWLTT6S+OvLLJHZY+wYRQ1nsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756127983; c=relaxed/simple;
	bh=So+cLh59wFV6WlC+MdzEWwEidHZnvDsZHCEBKhIg1qY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Sqc3xI6FWH21IPFFmh3PUhqobRDD3nWpXasYjkz5rujHnQQi7ufuJlSOH37Yh7RUplDAyz9WXQ8p38yYL91BFOGULSr/MdxaD40Bf3tSj2hiJ5GdyACdnItCJBvZV4XqX1WOMGN7LjfkRU38TE7yMTpVzwroLNtcxoESPLj8/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-88432e33c84so1164864239f.2
        for <ntfs3@lists.linux.dev>; Mon, 25 Aug 2025 06:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756127981; x=1756732781;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnPwcV7XV+OKMtppIn4w2Brof3ieT9kdiC+gJ3ovg/4=;
        b=nq2LBFpAvQMEc6P82je0fJL4SkaPDwLardm/WD3ZFllbwkWBnhza3vpQT+yiIcJKBN
         2KsPlxPXz5scN9biJLMjPbuyNCWzasxNm8LKMdaxh8wmkEpRkg0SVE0zvVTpsCP6NN7x
         vzFKTlfpy6JYrQvOQ80kW0i1/emNQJq9YlhZr1mAgv0ZRN/c0mLUgg8boAfmvl7K2YsJ
         D5c3mjMSSvQIQhNTkSRNIGUV51KU3CBEwiG2DKapagJP+QtvEh173u4mqT+KOYN2u0w3
         4Yv6TDU2cabOdACMZ44djoXgZaQCAjRAV+nGrH275hGL792OvI+UgY32Qu612Ox1a4C2
         EeGg==
X-Forwarded-Encrypted: i=1; AJvYcCVRX/MBcsBt1HjToEBlmbSUukicGmCrShWWf1MUGVclldlSADn1oF8gXVVBXrqdCBTUbMwwPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc+SDQVBIniGwSrJ5BW403CxjHxO8Q//L4/JwMmaI9BHYse4YL
	0dr0JdfrwkDl8c/abJwIv7lbH15ViNRwyJAjymItJ3y68y7c70+M9+cT6sGrZbNheJTB8c/8klm
	QhKdtliIVFr4gnlslRqPSc9rCEa7a4/UHsHWrE6BaSXl/GfS94CmQRB4DJDs=
X-Google-Smtp-Source: AGHT+IGnKj67SqUKzIsKL4YCEGT5LHPMqCLohbVjhqxj8GDHlK5HhEd7WwWBCYIl6Dw1gHMr6uOUGXvFPWZRKHcoEWupWIJOkHgR
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:440f:20b0:3e9:eec4:9b59 with SMTP id
 e9e14a558f8ab-3e9eec49ea7mr96860655ab.32.1756127980870; Mon, 25 Aug 2025
 06:19:40 -0700 (PDT)
Date: Mon, 25 Aug 2025 06:19:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ac62ec.050a0220.37038e.008f.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Aug 2025)
From: syzbot <syzbot+list87b222bdd76a860b53ed@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 8 new issues were detected and 0 were fixed.
In total, 42 issues are still open and 68 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  22993   Yes   kernel BUG in dnotify_free_mark
                   https://syzkaller.appspot.com/bug?extid=06cc05ddc896f12b7ec5
<2>  16786   Yes   KMSAN: uninit-value in longest_match_std (2)
                   https://syzkaller.appspot.com/bug?extid=08d8956768c96a2c52cf
<3>  6561    Yes   possible deadlock in run_unpack_ex
                   https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
<4>  4896    Yes   KASAN: out-of-bounds Write in end_buffer_read_sync
                   https://syzkaller.appspot.com/bug?extid=3f7f291a3d327486073c
<5>  4799    Yes   possible deadlock in ntfs_fiemap
                   https://syzkaller.appspot.com/bug?extid=96cee7d33ca3f87eee86
<6>  3005    Yes   possible deadlock in mark_as_free_ex (2)
                   https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
<7>  2666    Yes   possible deadlock in ntfs_look_for_free_space
                   https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
<8>  2644    Yes   possible deadlock in attr_data_get_block (2)
                   https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
<9>  490     Yes   possible deadlock in ntfs_fallocate
                   https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<10> 413     Yes   KMSAN: uninit-value in bcmp (3)
                   https://syzkaller.appspot.com/bug?extid=0399100e525dd9696764

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
