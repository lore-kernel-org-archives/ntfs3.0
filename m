Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552919D
	for <ntfs3@lists.linux.dev>; Tue, 14 Mar 2023 12:37:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB6A121B79;
	Tue, 14 Mar 2023 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678797456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVBTw+DhM3f21FrFggkTiJhwDRbP8puisI0B3bctBi4=;
	b=NNI7qJVrY9AfgBN1+WTOtIMk0eu42c7RuBv/uDrj1TZCbVeVIMbkeiYpkBXrYQKGwhqwjn
	HPsLeqrbpHE1XmP1O5yeif3mRP2xgkLczgY17ZKgUMip6lvaZSsL1YEkud87dAQCfsPl8q
	m6XNvsS4WHu1D+3c79yGaxDzfhjmTRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678797456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVBTw+DhM3f21FrFggkTiJhwDRbP8puisI0B3bctBi4=;
	b=VubHSHo+vtgYjD9mhi4VgkAw9xoWgHyNcvqAKRLa04IoeATwpEgc3hu7eIkMFALKADMOFj
	O9+42FZxsLO3Z7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B49D713A26;
	Tue, 14 Mar 2023 12:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 41W4KpBqEGQlXAAAMHmgww
	(envelope-from <ddiss@suse.de>); Tue, 14 Mar 2023 12:37:36 +0000
From: David Disseldorp <ddiss@suse.de>
To: oswalpalash@gmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in ntfs_trim_fs
Date: Tue, 14 Mar 2023 13:38:54 +0100
Message-Id: <20230314123855.27154-1-ddiss@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <CAGyP=7cgTARo7opXbtgNvPbAg0RFTdO2+NVHXgr5LkC0ZAPkSQ@mail.gmail.com>
References: <CAGyP=7cgTARo7opXbtgNvPbAg0RFTdO2+NVHXgr5LkC0ZAPkSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

IIUC, this was long since fixed at the time of your v6.0.8 report.
The mainline fix is 557d19675a470bb0a98beccec38c5dc3735c20fa, which was
backported to stable (v6.0.16) via
7e686013b7071f4c16644cfad8808e76097724c4.

Please try to check more recent kernels prior to reporting.

Cheers, David

