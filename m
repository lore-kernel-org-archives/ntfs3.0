Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384142;
	b=yNjMfss1ZPWhFDAQvunFJbf9SlSwLxezNCMm8kWcJ+Nm/elO5JwjRJiTXwTbUXfxuqz8
	 ND+k23A017w9//6lZQFnNOlYzLiG5xWvzpWI0tM1nSV1Ox0yM6Ww5/QKU6hXAWhG2dpe5
	 /Z1rbqfts4fCOwSunpp0vCiyoJ127C1FdDkjiuXz3ofZlxs20xLZwn+Zk/ffth+2sMFcC
	 oOZA3XvyK+yMXmhChuzgqkrXxQcnGWPMORmQbsjbdd1ysBZojlR5eqmoh08pp1yUAl+C8
	 ZogriFjdBy7L1zD/ye4OnVM00wHBivZjswdLsHj1PDvhvjJpCRcHFRGvuAYS26BnuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384142;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1MfWhKRJnGNQuiv1S74it4d0E6/yGd9NIUqLlfkgtBw=;
	b=3ODFjlgOR5hPTF1XnMovhspunWeohT4Oel9dZSzRbc6RCJriJCwPmDrhxNyJhT+OavNZ
	 /PXh5UV7RQvnYAjKIXFxvLJRLyaK+MHSSTRSXRF0RO7TT8hbWI7ju3Th0u0R6o2+bTaFB
	 qFNWua3NypNrtq/WgS0J/kON0vj/tUJczIzTjM2ivrQ8vHU7k/CbkZJnpM98iXPZserv7
	 W8gGYu0MlfVeMe8UG/aFRv/2YGyyvyEERT+SxzZGbtqCCvcxDBHnjGh3aLKOoDsXJ+ele
	 uWfP0beY37U6LHlBK7wnx+3y7qhQehguaw7Kb3rzlELDEVsVBjzowSxnkyJ7J2J2Myg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aKqCMg2M;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13330606A321
	for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13330606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aKqCMg2M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=aKqCMg2MpqQSJP2uOD84xWh5kO3aJpeCcmdGJqR2WWRHMgU/XcFMS/yWDtJULt3CNNqbmCi1qalRs
	 5ypfAfFDWVUIknAgapzCwPLF0vCtGnPkq0kS6HLc6VHHx3RxALg6a+em5mrIlm6CPljylBDZlUG27H
	 A/i6MnjbjKR/FCUs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af42108b9f-b2021;
	Wed, 11 Nov 2026 16:02:18 +0800 (CST)
X-RM-TRANSID:2ee16af42108b9f-b2021
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af42108507-d4631;
	Wed, 11 Nov 2026 16:02:17 +0800 (CST)
X-RM-TRANSID:2ee16af42108507-d4631
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: laixiangwu <laixiangwu@cmss.chinamobile.com>,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: Fix memory leak of ntfs_fnd on corrupted index root
Date: Wed, 11 Nov 2026 16:02:15 +0800
Message-ID: <20261111080216.1583-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030084532.1748-1-laixiangwu@cmss.chinamobile.com>
References: <20261030084532.1748-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: laixiangwu <laixiangwu@cmss.chinamobile.com>

Hi,

this patch was accidentally submitted twice within a few minutes and
the content of both submissions is identical.  Please treat the
submission below as the current one and disregard this thread:

https://lore.kernel.org/all/20261030085315.1814-1-laixiangwu@cmss.chinamobile.com/

Best regards,
laixiangwu


