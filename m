Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D86115B0
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 02:06:14 +0000 (UTC)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 8DAAF40B3E;
	Fri, 23 Sep 2022 00:47:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id BD6E32F;
	Fri, 23 Sep 2022 00:47:41 +0000 (UTC)
Message-ID: <34b60d0ed48e4384e82a29020702ee2471092fb1.camel@perches.com>
Subject: Re: [PATCH] fs/ntfs3: fix negative shift size in
 true_sectors_per_clst()
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, Tetsuo Handa
	 <penguin-kernel@I-love.SAKURA.ne.jp>, Konstantin Komarov
	 <almaz.alexandrovich@paragon-software.com>, Andrew Morton
	 <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, Shigeru
	Yoshida <syoshida@redhat.com>
Cc: syzbot <syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com>, 
	syzkaller-bugs@googlegroups.com, ntfs3@lists.linux.dev, LKML
	 <linux-kernel@vger.kernel.org>
Date: Thu, 22 Sep 2022 17:47:51 -0700
In-Reply-To: <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
References: <000000000000f8b5ef05dd25b963@google.com>
	 <4b37f037-3b10-b4e4-0644-73441c8fa0af@I-love.SAKURA.ne.jp>
	 <e0173c17-3837-a619-4bcc-7a0ba4843cc4@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: BD6E32F
X-Spam-Status: No, score=1.46
X-Stat-Signature: eo3ixo5odzpwpf9s5tiwmc7efjghe9qh
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/xx4yzr8Tvi0rO8ab9gqFKolV42Rk2IkU=
X-HE-Tag: 1663894061-333989

On Thu, 2022-09-22 at 17:38 -0700, Randy Dunlap wrote:
> it appears that the NTFS3 maintainer is MIA again. :(

(I've no affiliation with the NTFS3 maintainer or paragon)

Perhaps the expectation of prioritized immediate turnaround is unrealistic.

It's free.  Be patient.

