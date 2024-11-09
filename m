Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845321411EE
	for <ntfs3@lists.linux.dev>; Sat,  9 Nov 2024 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731141065; cv=none; b=NWZ8QS+Rzok4ACx/HObBqKccsM2RpFjioJSHr4okJSGsWnZH5/6irXDfHfZmVopG8B70s42Oqc/2fo7dM2XjhSoNeRNE1+hJDVdy22YMWa8uPs9K3672eGwKNiJBmRkyIzXeGgREHEwyT25KfZN7BiDcflT3rgre+fZAcAmHO08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731141065; c=relaxed/simple;
	bh=1D1xovnM0EMAFcuSF0pmt+0U7XeGSOPxADpUIgdsIQg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FcM6Y1ANPNtss5KpnD2+aZdc6N8L3MJ2b5CGC7mKpwWK+gOzWSEYA+T3iQ7l2YqlY79vtPnLtUBEOs2SosqPzYMJULjRjtrwoJipi+P+KkiaDJAms1d/n5BwPMjY7jgYBWtYJrLtXX+BxS6aZ/Iz34plaVQNgF9bi2f5SX7OFYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-83abf68e7ffso326075039f.1
        for <ntfs3@lists.linux.dev>; Sat, 09 Nov 2024 00:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731141062; x=1731745862;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYVFRLpr35Jnu0CNYH9eEEbObvwHw3Y0l7EYQ4KbDpQ=;
        b=QdJYFC7/WvVzbazZqqtSPOFH12y+yN7OYEzyLZESuTpG37GBLkw2NFOAPfMkUk4tcf
         XORl8ob5RuezXReJV+se7pqLovXzUldagRS9ZZOgjNNBD7DevcI4NIH0/FHwg/W0jQ5g
         l7LaFEU2S60S2+xtd1pZGUxcQpr7tfbbDwnzKKWl5gUuSYb527UyvXx/kJtfaqHQ34EF
         OB4CnjQAI5nT7CnmpE6rXDbQEpeoBl3Qhi5Gz2mXNxr26vj+xEOmEW3luhQSPs5QnY9b
         ylauiCYkFIJjvxSNMwifFL6Y4CzJ3DFXReou7xLJUJKcDSS53wYBnwuMCUTXwhR0/9oK
         h0fw==
X-Forwarded-Encrypted: i=1; AJvYcCUWfs6EOOtzU4WU/73dzMVt6MZf9y7k0Ldhhic8Nm9AIG10Al42PYEOclgxSgaSHscLgK2gYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxZ0vcJUq+JQWDB11Qz1DBX+KEx1wejKOQ90m3HrgGyOY6EVZH
	ijTBCfRJ6aP/0e/ERX38TIZrzCjYIckVECp4vuDJwFWqphcamckrEWFQE9zay6xeauc6CRNvn0r
	JA6lTttlOBfPIPqURbt49fo0aKsVO3vfGD1gSdW6+QZElEowtx2dBB1M=
X-Google-Smtp-Source: AGHT+IGumaAxr12HSrk3WMZeIvTdg85QNwAfY38l9VuHuXPLH3cBOYaCgbCt/TfwXfpZvNPy4DGVNbYZjn1IQ9TcG/OTI+wS0IlM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1706:b0:3a3:b4ec:b400 with SMTP id
 e9e14a558f8ab-3a6f1a48d05mr63137605ab.17.1731141062618; Sat, 09 Nov 2024
 00:31:02 -0800 (PST)
Date: Sat, 09 Nov 2024 00:31:02 -0800
In-Reply-To: <0000000000001a94c3061747fabd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672f1dc6.050a0220.138bd5.003b.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_mark_rec_free (2)
From: syzbot <syzbot+016b09736213e65d106e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 5b2db723455a89dc96743d34d8bdaa23a402db2f
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Aug 19 13:26:22 2024 +0000

    fs/ntfs3: Fix warning possible deadlock in ntfs_set_state

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a67d87980000
start commit:   ea5f6ad9ad96 Merge tag 'platform-drivers-x86-v6.10-1' of g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f59c50304274d557
dashboard link: https://syzkaller.appspot.com/bug?extid=016b09736213e65d106e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133fa268980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142cb182980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Fix warning possible deadlock in ntfs_set_state

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
