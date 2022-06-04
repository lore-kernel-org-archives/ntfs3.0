Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09977EA0
	for <ntfs3@lists.linux.dev>; Sat,  4 Jun 2022 00:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E983C385A9;
	Sat,  4 Jun 2022 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654301160;
	bh=bB/7Qg/ZWdTRZBizAQW+tLeYFyUrjLlJ+g9oiaJnNPQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rF4ikw/L2wjG3Aa8eLURpCFcpl9uqcsY7m6zMeF+ead3CbyZH9+R0DCTpO5lsmawc
	 +SCIlyAZ+nG4+zLOaqjaVXzvV+op0CcTOrUuxfiSyeQK+4XBwdgq82heNSGY8MjduU
	 AFDpNO0aVaMrPkodlCbRBLadr444fhAIo+id3qGzKSYqEKkYUQVxtDmbjO/wY9+gMm
	 Y+c1xrK89GVQMWKi5qM3X1O3HRYgw3y14EEXE6rlpotDIH82J9WUDRWBmKV+twivcR
	 wFTbtumYFZphBH7x2Nk57Ptb+ZVMupbS7rbnTrMROdog4InFPH6ANtossUkWIj5ua2
	 Cnjgpyv2OkOvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8AA20F03950;
	Sat,  4 Jun 2022 00:06:00 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs3: bugfixes for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <c5c16f3d-c8a7-96b0-4fd6-056c4159fcef@paragon-software.com>
References: <c5c16f3d-c8a7-96b0-4fd6-056c4159fcef@paragon-software.com>
X-PR-Tracked-List-Id: <ntfs3.lists.linux.dev>
X-PR-Tracked-Message-Id: <c5c16f3d-c8a7-96b0-4fd6-056c4159fcef@paragon-software.com>
X-PR-Tracked-Remote: https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_5.19
X-PR-Tracked-Commit-Id: 724bbe49c5e427cb077357d72d240a649f2e4054
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f952675835bfe18d6ae494a5581724d68c52352
Message-Id: <165430116055.8653.4989553009324938778.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jun 2022 00:06:00 +0000
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: torvalds@linux-foundation.org, ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 3 Jun 2022 14:26:57 +0300:

> https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f952675835bfe18d6ae494a5581724d68c52352

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
