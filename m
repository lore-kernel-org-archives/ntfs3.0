Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC447463
	for <ntfs3@lists.linux.dev>; Wed, 17 Aug 2022 22:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCC80C433C1;
	Wed, 17 Aug 2022 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660774812;
	bh=/A4dxYPAFlRnEYzWPz9DOGV8SQQ7Upm4kVvKZcKotls=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AOIW6BYbt5qeRw5wonjrQQIAXwgPOOl3RfuhEumLL7VDZTq+0AOwYMkJrKa+GCBFP
	 52j6oYVkDH33vr5wTnIizCmxglRvtVoFI9N5Lo+NsZgM79MtaiM7VdAoNvScNCaD82
	 bkaANbOksDitK8rXUvsi07hlGIQLG3Gt7GygsHeiJUpnS49J4v5sE1G5zz2uH6sU37
	 xBq1Pu55wh3R1wlURucJf5M/V2+X7muxIRhlECp485DaPwznSsJd4Tx7KIA1ly5bDO
	 nISxxy1twZq9MG+gOia/eXc+EgQm6broWqJ4yWHculEYoKYToV6m6RZGgTxzyTckgD
	 Gb8Ir6sfLM/MA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9EF2DC43142;
	Wed, 17 Aug 2022 22:20:12 +0000 (UTC)
Subject: Re: [GIT PULL] ntfs3: bugfixes for 6.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <db8cb5d9-56d6-a00a-9cf0-4deec9056433@paragon-software.com>
References: <db8cb5d9-56d6-a00a-9cf0-4deec9056433@paragon-software.com>
X-PR-Tracked-List-Id: <ntfs3.lists.linux.dev>
X-PR-Tracked-Message-Id: <db8cb5d9-56d6-a00a-9cf0-4deec9056433@paragon-software.com>
X-PR-Tracked-Remote: https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_6.0
X-PR-Tracked-Commit-Id: d4073595d0c61463ec3a87411b19e2a90f76d3f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b06a2755758937add738545ba4a544fc5a1c56d
Message-Id: <166077481260.1953.14226345009502116708.pr-tracker-bot@kernel.org>
Date: Wed, 17 Aug 2022 22:20:12 +0000
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: torvalds@linux-foundation.org, ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 17 Aug 2022 19:43:51 +0300:

> https://github.com/Paragon-Software-Group/linux-ntfs3.git ntfs3_for_6.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b06a2755758937add738545ba4a544fc5a1c56d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
