Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9978C60
	for <ntfs3@lists.linux.dev>; Sat,  3 Aug 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722672246; cv=none; b=b17m91zavVno6dF53tIXGHXdQPIzc5FiVmmGx4o6YQ7iTDN0yFCNvyLHlUkRkVDk0fZW3gBPoT0Z7KVwVau61jl2KZpqKpFNbEQQ1HdQbSnlI2tAPqOv8rlnIF0mVUtuC/rQNy9mmnY45UdPvHlx0WrOuKGgP/aAV96pGwipUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722672246; c=relaxed/simple;
	bh=TUl6A1fJ9ZRYuo+G4Y9mhLp0xVeTjBmar5Dc9936tcg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gmnxu9ZkwW+abrOXHTW7pgybyXGkxXvIonXw3EGFyywLb3LwxfLi3sG4AyylzCy1KgYBPhIOxwXdfyl51omTHvk4jsotBtOgAJGqX9XslafOBL74+V8bGLwoC7CplMueDByBub9zQmmZVaiqd83Qpzc2PFg7IWUy+R3NNJMdJE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39b28ea6f37so12758725ab.1
        for <ntfs3@lists.linux.dev>; Sat, 03 Aug 2024 01:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722672244; x=1723277044;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3iMRMKIFvG/w+WAfYCTR4OLJLvZCiv95Yp2c2gsmjM=;
        b=DCiPgz/ppnwbMrN1HEo1EKacUqpVjzutfffnMq6yFFpoWgWg2bU0p6xdoJygqIwEHt
         yco3uRs1Oov0WIZ2X8Yp9/e2lFvpfDY1ME8DzYw1o0yMOvegAg4PzZm4PaGAJ5nmv1vX
         qjn5wrydrK+picW12EUm7Ohfac6QdkeIjRQiRn1pSc+u6N2+9YJCAGn+ez4tBhgsht27
         jn7CpzmojTUPoH7UJeH5xfNeWu4ZsvjBsxskGdWFtSOiwgfgTnNyivuFkKLXms7tu9QP
         A/0k+Nvym4mn7bmU2rZbNzBEN3G2LxI+fPqhgODQMJLAMhbmWRXyZ2Qy8y+MhPc9eITL
         JqJg==
X-Forwarded-Encrypted: i=1; AJvYcCUFfMNgT+XqkauOBjhtKqHgx2aPT3+FTohWb8vmK0tKlfB2y4jXHiYaubpI6J2cCEyjt9cUnoALUVjanycKZvezTENFiKQ=
X-Gm-Message-State: AOJu0YxNXWyPJ8WmZvLmpljCUCVhmiaFUxOgRCt0NzU3jBRKVef9kV2z
	SvRQpfacGRKn0aPqIzQkkBQdjlU8M6yYSIHf4sFhNDU+Ar/UUkBUu1QBukdO4FoSTalSUIrAY7q
	Y/iTFPFCdfk57JEDw/HsL8B55xU00FnEgcAEdaLChmWX2RdZvGPfOe6g=
X-Google-Smtp-Source: AGHT+IEKgs8EZx+LTsngQm/GYFavav0/7rWM9+EgTiiqJeL6xXbOziT99l9CujHTeqJ5NQFrcwzlfJNwuqfBIzDv/fJiLzRTPijJ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148b:b0:377:1625:5fca with SMTP id
 e9e14a558f8ab-39b1fb599e0mr4835445ab.1.1722672243843; Sat, 03 Aug 2024
 01:04:03 -0700 (PDT)
Date: Sat, 03 Aug 2024 01:04:03 -0700
In-Reply-To: <00000000000078a6b2061ae9c05c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000028b122061ec2e3b9@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_file_write_iter
From: syzbot <syzbot+d7452fc408a961bcc6ec@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 69505fe98f198ee813898cbcaf6770949636430b
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu May 30 07:54:07 2024 +0000

    fs/ntfs3: Replace inode_trylock with inode_lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=135e0bbd980000
start commit:   c0ecd6388360 Merge tag 'pci-v6.11-fixes-1' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10de0bbd980000
console output: https://syzkaller.appspot.com/x/log.txt?x=175e0bbd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=288f248fe2b6eab0
dashboard link: https://syzkaller.appspot.com/bug?extid=d7452fc408a961bcc6ec
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142941a1980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15b302d9980000

Reported-by: syzbot+d7452fc408a961bcc6ec@syzkaller.appspotmail.com
Fixes: 69505fe98f19 ("fs/ntfs3: Replace inode_trylock with inode_lock")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
