Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81E15CA
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 14:36:07 +0000 (UTC)
Received: from fsav115.sakura.ne.jp (fsav115.sakura.ne.jp [27.133.134.242])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 28NEZgEL063409;
	Fri, 23 Sep 2022 23:35:42 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav115.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp);
 Fri, 23 Sep 2022 23:35:42 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 28NEZgBr063406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 23 Sep 2022 23:35:42 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <ea7c00c1-07d7-c23e-80f0-0693016e9731@I-love.SAKURA.ne.jp>
Date: Fri, 23 Sep 2022 23:35:43 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in
 true_sectors_per_clst()
Content-Language: en-US
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Shigeru Yoshida <syoshida@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>,
        "'Aleksandr Nogikh' via syzkaller-bugs" <syzkaller-bugs@googlegroups.com>,
        ntfs3@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <000000000000f8b5ef05dd25b963@google.com>
 <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
 <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
 <423b1fa6-10fa-3ff9-52bc-1262643c62d9@I-love.SAKURA.ne.jp>
 <CANp29Y7fSsjqKbFiMZDG_w-ERigQOk_6Zw3L9rw5erpP3rRU0g@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CANp29Y7fSsjqKbFiMZDG_w-ERigQOk_6Zw3L9rw5erpP3rRU0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/09/23 20:58, Aleksandr Nogikh wrote:
> We do have plans to start inspecting LKML messages for the patches
> that mention syzbot-reported bugs. It will be possible then to display
> them all on the bug page and somehow mark bugs with a PATCH sent on
> the list.

I interpret it as an attempt to automatically show "Patch proposed" state.
But since not all patches have Reported-by: tag, and/or a proposed patch
with Reported-by: tag might be withdrawn via review, that state should be
also manually changeable.

> And then syzbot should just display all such received comments on the
> bug's web page, right?

Whether "all comments" or "last comment" needs some decision. It might be a few words
indicating culprit subsystem (probably "last" should overwrite), it might be memo
describing how far debugging went (probably "all" is helpful), it might be some
URL where discussions/patches are (probably "all" is helpful), it might be trying to
show or hide "Patch proposed" state (probably "last" should overwrite).



By the way, a possible improvement on "Patch testing requests:" table.
Although the "Patch" link showing diff output after applying proposed patch is OK,
I'd like to also see a link to original "#syz test:" mail, for the intent of diff
(which would be in patch description part if it was a formal patch) is dropped from
diff output in the "Patch" link.

For example, https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232 was forgotten
for 1000 days after 7 patch testing requests. I can't easily find the intent of each diff
(e.g. just debug printk() or proper fix). It seems the last one was about to formal submit,
but I can't find why it is not yet applied.

