Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B156C1DA21
	for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947965; cv=none; b=RxSQ3JunED00KqLqXDBzwv0TzO2s9S9jtJa7+KDnAP3MJKBTfwef3uhauhA74gdDl8phOo2dWbc1vQO4mZLQ099ihC3CgrILEdtyniKvKB1o0EtPvlWJKrss0XqSKKJH7eVOofNq4TRqZjyGQf9xlUgl00+TWPVUJv/sfb7tXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947965; c=relaxed/simple;
	bh=S1DH6N129w+vMq5/UljzKNmTTX+FRMOyP1Xrb7w06Bs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JhC7C/fQXsoe4Ts0zUurCSfDLkldn2MrTmqxqvcA/fD65OuoWHK2YPem0EU3spauZvWaaNpOnj//W7ce2TEl/y7Nya9+MozIUd/WmztAmtbInbFC5XAwNKIDoW37NX0VAAP74sBQ1zPdRMekTKvtRjHcNgYnt4kZM+TZMRZaZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-36424431577so26648185ab.3
        for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 03:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947963; x=1709552763;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Co4mHqcajZ+TaVXtj1uAZr7j1bhwGXeKEUyHjDEeql4=;
        b=ltZKAu1dLHD1hUs4YnA0ta7cblOBwLzeZ8Er66hS0GCpcUnJLH02eFCST6EOl5Lwer
         VSYgKXLqbm7uMyKYBVaQGNrQid+hLYJF18j9t0FzNwDll1DTEXz8hNHeVB7Mk5bEWwY4
         yR6iPTThtHOLrwrHrGzSFX+/lExd4AD8keXdGdlpZGbLeb2cyZITdgSoPv4qzT9+Z+zL
         Ngwa8wETw+29eWtvJaJ9ycroqNuH+Gy7jl0FKZ9b1ahyLxjfW5oOLE8R0ZQS5e5BIqR2
         /O/K2Y/kCnnMaN3HWNF1ZbKMx1+dLemZQlj9M4ecLr/RzNMnqJWKTlemaK3zry1KMBkb
         ayTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzEufNfoG+zWCoFs13FbMtAppElcS2bMVqAIJv76J8GHnvbKg423CIQLFX9H34sTd22NTOkS0oYRj0X8fiN+mUnGqkFE8=
X-Gm-Message-State: AOJu0Yzp78dL/Ef/DIHWdufBbX2nZ/Gi/jcQ9VDyL5hf5JLQR39PDO3x
	gzNXJFxGXN6lJ/5yM7smCSiy1M6SEYlUmEE/7WON+5yYiIp4aDF8gbVzhgDfmWiU+W9p5Cf6U/L
	DUSWjl/bc0Kg8Th3eM6DAV0LqqKo0n7KEiMNbencUrqyCEi2OCqOhqRE=
X-Google-Smtp-Source: AGHT+IHIVqTZZ7YCL3IN8GhgKNZ48yzHqYO4fermQmaHfAwR6BgfFyKH6DsdKtx8xrqBPkzE+Y2WHuiAXDPL2Aoeo4nERWuFkxCB
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3885:b0:365:2f9d:5efc with SMTP id
 cn5-20020a056e02388500b003652f9d5efcmr328599ilb.6.1708947962903; Mon, 26 Feb
 2024 03:46:02 -0800 (PST)
Date: Mon, 26 Feb 2024 03:46:02 -0800
In-Reply-To: <20240226105506.1398-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000044c2da06124774f7@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_set_state (2)
From: syzbot <syzbot+c2ada45c23d98d646118@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, boqun.feng@gmail.com, 
	hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, penguin-kernel@i-love.sakura.ne.jp, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git on commit 716f4aaa7b48: failed to run ["git" "fetch" "--force" "--tags" "4d52a57a3858a6eee0d0b25cc3a0c9533f747d8f" "716f4aaa7b48"]: exit status 128
fatal: couldn't find remote ref 716f4aaa7b48



Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 716f4aaa7b48
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d7c92dd8d5c7a1e
dashboard link: https://syzkaller.appspot.com/bug?extid=c2ada45c23d98d646118
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=172e5f4a180000

