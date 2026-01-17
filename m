Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B53101AE
	for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768653904; cv=none; b=VkcUUMvjM+FgDC7JC5Ptb5lX6Y2HRtuQtTttQd1vkZv3x3/TgyUfDgCWyTkhqD8OHH+IT2lq6D+ptsCovt5OZBGi7l9BhXCTsNxwN0fjxZpb52AOqvZwEjHQscS4J+mJH/Itzxd/27dDhbhuOA7y3H5uFr8KnJvDFXQJBT+O7yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768653904; c=relaxed/simple;
	bh=5ruqoJq4J3ncCLtS1B9swxZYBURteMdZy9AptbueDZ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gy6SEwtCTYEmrvBqby2H8I3LE2UOx6oiO25MpowacVzGecYtJ3LRinf16fk7/15s1XnecEDzjPXZF/kp2LyJDNe1SrM/GH14WXzFSoNbnY/3f+pcgE/mbF5ndIX68PZzFnguILYFjWHy4EtEhqrwO+zcDD5OI/fkrnVYDcIfwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6610d312bc3so8686959eaf.3
        for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 04:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768653902; x=1769258702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsfvigkP7PIfyfnAwg0nekMMWNJKzMEcKhCA4HR9hi0=;
        b=oBTCPp9FF8+oNSA7a7tT2nTO7iUnXJicO78/7HKNScTCbk8OqKpcMQJe60nYG1tzi4
         TaMX/miY4JS3FgTGDYuCeK0/5rWZDvaiTElunxhr3BI0JsIwFZFA54VELaaNCuSOdLKV
         r+FLJQ4qa4wroXuYAMSPnE9FPVvv4VvxcTEhPM/azZnbjaCX4jxBWitpIHuoGcAvXzXV
         yS23cVUsIgIy3OjaT88agXnPQCZTuQABHuTfoD9oS7YyvMi7m0WfGBexVOB0CPzX2iZK
         MwrVywtghzi0Ze9oQcwAy6iDyXEZpU9pBBPt81I/ZLaNiXV0gbCDgHxPGuLovHbWpOtU
         znzg==
X-Forwarded-Encrypted: i=1; AJvYcCXMNitXBxShhrsZsLDqKKrCxlps4Yibh5vELZzQ24bzrXpZ29i9+vVHGpzDJ1TYjQE5A/TNwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySfzWa+/ktfVpKxFGaWwkJTflmqj592q9vky34AoFe3+76H/dk
	dAA3uAPP9VyRnS0m1Ll/eP6zBbjFyeFNravfVhQjjtTepvtOJXDF/WjU3Lt1Hrk0rwJTB+n8P9X
	9acb/4i53mGvrKWJyEXuJ2igbn4H3GWegfkL0PJbYtRCTxI98adC3xcTIjNQ=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:814:b0:65f:71ec:4ebf with SMTP id
 006d021491bc7-661179f2ad6mr2800340eaf.56.1768653901720; Sat, 17 Jan 2026
 04:45:01 -0800 (PST)
Date: Sat, 17 Jan 2026 04:45:01 -0800
In-Reply-To: <672dbff0.050a0220.69327.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696b844d.050a0220.3390f1.000b.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in mark_as_free_ex (2)
From: syzbot <syzbot+8df514c431bd240c5644@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	lizhi.xu@windriver.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit bcbb8d0afd94927215e8ae97c40cfefa807cfe0b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Oct 30 20:51:09 2025 +0000

    fs/ntfs3: change the default mount options for "acl" and "prealloc"

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e7739a580000
start commit:   c9cfc122f037 Merge tag 'for-6.18-rc4-tag' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=41ad820f608cb833
dashboard link: https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114e4a58580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10bfc084580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: change the default mount options for "acl" and "prealloc"

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
