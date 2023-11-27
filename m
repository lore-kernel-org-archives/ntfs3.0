Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411D1879;
	Mon, 27 Nov 2023 06:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r7UxG-0005MA-0Z; Mon, 27 Nov 2023 07:18:50 +0100
Message-ID: <138ed123-0f84-4d7a-8a17-67fe2418cf29@leemhuis.info>
Date: Mon, 27 Nov 2023 07:18:46 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [regressions] ntfs3: empty file on update without forced cache drop
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701065932;e3db66cb;
X-HE-SMSGID: 1r7UxG-0005MA-0Z

Hi, Thorsten here, the Linux kernel's regression tracker.

Konstantin, I noticed a regression report in bugzilla.kernel.org.
Apparently it's cause by a change of yours.

As many (most?) kernel developers don't keep an eye on bugzilla, I
decided to forward it by mail. Note, you have to use bugzilla to reach
the reporter, as I sadly[1] can not CCed them in mails like this.

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=218180 :

> The problem I am facing is the following:
> 1. I mount an NTFS partition via NTFS3
> 2. I create a file
> 3. I write to the file
> 4. The file is empty
> 5. I remount the partition
> 6. The file has the changes I made before the remount
> 
> I can avoid the remount by doing:
> sudo sysctl vm.drop_caches=3

See the ticket for more details. It according to the report happens
still happens with 6.7-rc2, but not with 6.1.y. The reporter bisected
the problem to ad26a9c84510af ("fs/ntfs3: Fixing wrong logic in
attr_set_size and ntfs_fallocate") [v6.2-rc1].

Side note: while briefly checking lore for existing problems caused by
that change I noticed two syzbot reports about it that apparently nobody
looked into:

https://lore.kernel.org/all/000000000000bdf37505f1a7fc09@google.com/
https://lore.kernel.org/all/00000000000062174006016bc386@google.com/

[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: ad26a9c84510af
https://bugzilla.kernel.org/show_bug.cgi?id=218180
#regzbot title: ntfs3: empty file on update without forced cache drop
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"
