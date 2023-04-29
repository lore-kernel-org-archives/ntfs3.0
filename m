Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2B53A1
	for <ntfs3@lists.linux.dev>; Sat, 29 Apr 2023 18:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8588DC4339C;
	Sat, 29 Apr 2023 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682792392;
	bh=kHgDemyxd+ETTICl0RvyynE82gBsklNHTWkUhPlY8rE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eOEx+zFyMgScU5K9qYWdsVGKyrM61GZSFNPe4mT1+NVH0W1OSdxi6GQOrEAwY3CHV
	 ZFnBW42yEBDDF21d66tzoH/qlQoCLGkaAsG40LDTG6fVY72V95gaAz+La5qAHngrjT
	 FzN+3VU2ZHh5r0Ss3sXndkaFXC0T4VZpfeYzEkyNW2qhYaU79POLwhq95wLX1cDZmT
	 /cFIzLt3vT3QhtAAgnj5eDL1h4zN4H1NopHMXg+y3Yda97qxxzmSYiFuEINDsa9qw9
	 dWNG1COIeXrNZoa8vXfGCiwn7T0fRTkuT+guxI5QIhHt+UcFX3vQ6xziGeWvUyWMPH
	 1+NfuB0kBUukQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71F88C43158;
	Sat, 29 Apr 2023 18:19:52 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs3: bugfixes for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <f949c754-6d38-af12-fa83-176e9971132e@paragon-software.com>
References: <f949c754-6d38-af12-fa83-176e9971132e@paragon-software.com>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f949c754-6d38-af12-fa83-176e9971132e@paragon-software.com>
X-PR-Tracked-Remote: https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_6.4
X-PR-Tracked-Commit-Id: 788ee1605c2e9feed39c3a749fb3e47c6e15c1b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e098dec61ba342c8cebbfdf0fcdcd9ce54f7fa1
Message-Id: <168279239246.22076.4593087405631164929.pr-tracker-bot@kernel.org>
Date: Sat, 29 Apr 2023 18:19:52 +0000
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: torvalds@linux-foundation.org, ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 28 Apr 2023 11:30:01 +0400:

> https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e098dec61ba342c8cebbfdf0fcdcd9ce54f7fa1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
