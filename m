Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E821E098
	for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 05:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920723; cv=none; b=VmixO7/yS3GIGSdMckii6m8Zxr+7kp6udh8XCnGCXwNW8A3rNYohwRY60qFfw30z0tddzYTEKKzPetdr9rBKLc55QafI1gs2dYS8wfG7pgXCY6mxyuQBzmDKnRlOm047WP3mapKECsXZfBx4amGF8zQOscmTGUgYaXmoNo8V56M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920723; c=relaxed/simple;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=duI4+Ueq7smj2cFTqCXTLcN+3a+EsXTRInq0E+e19bLGOpIQ5V8gAyqcP/oO7lwCPShwcaqtYJ5XXVtV7mN8XeTCDO3WTq72F3k4+MXMcz32OoVAXejS1Rip0uevK5VvzxOZ4s3ar7JAy2QePCcHR7sQlMVra8tkS+0cMNDvJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6946e873672so1431014eaf.0
        for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 22:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776920721; x=1777525521;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=QkWiEVtSTxQDOMyISKmj/Qn+wzKfDh3z6JYXUbah0SZVkHGvxry5XoXLikxoHVpLij
         XMGXZRkAia7H62eLICOGkl4N9vezS4O0+3dq8NgbbEoYg2wbrTet5koDd7brLLyopcGz
         McjnShIwpvUcq52s/oHyYpO8Ff2ppeB9nlNeeesdZb4wyLMCo7y44vBA5i6c+zdAJipo
         7eTz/OLJZP/ADE+dcJczwCamC3oROeZAI3F5qbu+2ZLn3obvY4Zfr7WraH/q1iXKZ2KW
         7wuVGTms/ncPurj7C9m4HFrWzrLhMbMdp/bmTVtMLgonA8qUAp37/B31I6o08yUyJie+
         0S/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Uy1tXzOjTvO2cWcpUJj5KauT7aBZmrSPTiwPvL9F7KipQpClZH35NRNtfnuiPglJU7tNm7A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4V50LbnfgQ9RPaDAkHEjtwQ5GmhuBCHlUG3BrGSzgwiL5vFtq
	W0+mSelXzd3xrtUg5mfvfIF1ARKO2UrloIa7kvmfOG+7CiI/0G4Uc2vSqAJhHQS2bW7q1vBDLcV
	lBF6MnlK/32KMAoW0EHjnhuvu7CFCAZJcTubkYDXbFLRiPwOFV074a/NgTdI=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee09:0:b0:696:1cf0:22 with SMTP id 006d021491bc7-6961cf00103mr161763eaf.38.1776920720911;
 Wed, 22 Apr 2026 22:05:20 -0700 (PDT)
Date: Wed, 22 Apr 2026 22:05:20 -0700
In-Reply-To: <699fd494.050a0220.2fcbed.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69e9a890.a00a0220.17a17.0037.GAE@google.com>
Subject: Re: [moderation] KCSAN: data-race in filemap_read /
 filemap_splice_read (3)
From: syzbot <syzbot+6880f676b265dbd42d63@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, akpm@linux-foundation.org, 
	almaz.alexandrovich@paragon-software.com, baolin.wang@linux.alibaba.com, 
	hughd@google.com, jack@suse.cz, jiayuan.chen@linux.dev, 
	jiayuan.chen@shopee.com, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, ntfs3@lists.linux.dev, 
	rostedt@goodmis.org, syzkaller-upstream-moderation@googlegroups.com, 
	tytso@mit.edu, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
