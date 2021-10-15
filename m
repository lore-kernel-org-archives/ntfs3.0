Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F71B2C81
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 19555611ED;
	Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634308510;
	bh=fUaZfoTpYsco3paffMkQgI3k8iJGgH940qRzRU9JlCg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=I768/Ll0Y63a7ZGEBs16Dh61+9rEQKAKbnt8elJVsogMsuCuRcKBSRFqwIanVZJnD
	 qqG0GZkp7iloqdIT6opvSorVbSzruH9fVJNhJWwHoUmug8oWneF62s5HxOhLkdU8tC
	 Gj0Aih2mKA3umJ7bBSvpQ17aajrcht4mu7rJjwO0T3mR4rRTmrt0amwXgmEG1MKIf8
	 PbR33jEnHTPnUTOGvaHiAL+Ds0iryDA/GwLoe9MQEO3BUvDGE8jZx5EWZ8eZYfcl5t
	 j1Mt18/HRsh0JsJlx/QMBLepibM+Z92ltPmozatl5PwqoERVW16OJQwVychkYkD7Pa
	 k+nJV35tFnvuw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1405160A44;
	Fri, 15 Oct 2021 14:35:10 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs3 changes for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <795fb170-9696-bf0f-632c-c8e84ee98a31@paragon-software.com>
References: <795fb170-9696-bf0f-632c-c8e84ee98a31@paragon-software.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <795fb170-9696-bf0f-632c-c8e84ee98a31@paragon-software.com>
X-PR-Tracked-Remote: https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_5.15
X-PR-Tracked-Commit-Id: 8607954cf255329d1c6dfc073ff1508b7585573c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86a44e9067c95083d5dbf5a140e3f4560e5af1ca
Message-Id: <163430851007.21069.3138752909524584704.pr-tracker-bot@kernel.org>
Date: Fri, 15 Oct 2021 14:35:10 +0000
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: torvalds@linux-foundation.org, ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 14 Oct 2021 19:25:07 +0300:

> https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86a44e9067c95083d5dbf5a140e3f4560e5af1ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
