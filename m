Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE45495028
	for <ntfs3@lists.linux.dev>; Thu, 13 Aug 2026 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637785; cv=none; b=H1rxNK7uwnSGYFaaiyy6zp2LuvJvkF4GxHzQzyDU5OGG17DMEqASylat1sG79IM0iYsk/82HVusz4lNXw2GESKbX5o5JhzYoSxn/5uXo7rqHdu2fvFjwVzGfZ/Y7seerXiBiT7TgroC3ellqpSKP1zTCuOcM20AeHx9ZD84eHIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637785; c=relaxed/simple;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sTSWlVhKJvQ2OY8ACym7JQbUuBIPwU9n07DAnG0h3bx25ySwG46qYUb4DdeDH0Gsj7acCGYPFEeDbWbA9yZUmGkmdiFgaK50HBxtfQDiQm22KgkSAlvgXxOt20f4YRc6y84rxXv9W1z+N0v0Gr6+NMCraCiIZMfPHCAohtMrd3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45952ce9ee0so67870fac.1
        for <ntfs3@lists.linux.dev>; Thu, 13 Aug 2026 09:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637782; x=1787242582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=EFRFIkjwId5bqg+MIRJUjeEQtkTrx6D+J6nYvLzAOGvET8wn02NQfgO/3nxI+8BCif
         8bWy8CVSOWlBzqgztfUHuGJBHDFOwLQ/PGwpvzuTEJsXDrXT4PYPRBOxACn4bLHzLHxx
         xfBNH9GWPj192RGMZkPW4vihgBJdxpWthDnFbaKxaMcNtEaHP8Z4670Mk030AswtQ0GF
         qRlVfQO6DJkXgpG06jHhcAchDPeRwSnJZfsRFMEeJmu1Gxaz44DGhvvIBgA4vQZ6Xvic
         dZJFVJw/KBVrYtwz2HHWk7igRRxQP+NNItI/BoPIJOTjJypABtbQBcREH8dUEmT+EQMY
         uW8A==
X-Forwarded-Encrypted: i=1; AHgh+RqI36Zj37u0q3UsYeYPxKQkCehLNiJBV8Lr/t8FbV+e1/F5TZtgzK2JCw4zhzso7/ML8dxung==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCXAFGL/tiD+t/VRlYeT5mLqh3QSOeay6B0dQS1E1lGpkdkeFC
	EyjOteTBE2cRWCVSu1BljXyh7laXcE9yPcpHap/HlYJKX329sESXNjqSzCEeHHU8s6Dr60qWmJy
	m8NJllr9fhCxQLHQj0hT1bSKUfNAsGH9JHXw84f1RwVo9Boqj6pgR0KDE4qg=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae7:b0:6a3:d631:b460 with SMTP id
 006d021491bc7-6b0c4355736mr5894410eaf.19.1786637782326; Thu, 13 Aug 2026
 09:16:22 -0700 (PDT)
Date: Thu, 13 Aug 2026 09:16:22 -0700
In-Reply-To: <6a0c8e02.050a0220.3bec29.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7dedd6.bc649fcc.f9e73.014d.GAE@google.com>
Subject: Re: [moderation] KASAN: slab-out-of-bounds Write in hdr_insert_head
From: syzbot <syzbot+45ef5a8d661162757547@syzkaller.appspotmail.com>
To: alhouseenyousef@gmail.com, almaz.alexandrovich@paragon-software.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, stable@vger.kernel.org, 
	syzkaller-upstream-moderation@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
