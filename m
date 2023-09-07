Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA176134A3
	for <ntfs3@lists.linux.dev>; Thu,  7 Sep 2023 17:24:33 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-500d13a8fafso2039881e87.1
        for <ntfs3@lists.linux.dev>; Thu, 07 Sep 2023 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694107471; x=1694712271; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ADxwAtasu+gveWpqZZkTiYMFLculswygOTZbb2QVivM=;
        b=CZobEaYuqgcVmPYVyuT0x/FeXsNveVZrjetKAiDrn5sff1vUY7r4ym1SHh0Ovohd9A
         oqohMa6X439XwtoRK9riQ/LNRWGI7pGH2pzITL0Lo1UD/wnBy/IzVVRkFAyPMJonK9FY
         klvRQOHBBjHLUAuZZdquMpVMdZHqOezzMpbxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107471; x=1694712271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADxwAtasu+gveWpqZZkTiYMFLculswygOTZbb2QVivM=;
        b=P0vVbMhOG+CiJxzhE6IKX4Gr3NHWONMMVIhhvvR/ZeCNzWv3iwrYrxMUbUMcBNCofK
         XzIF9L0v6j3w2nmV+kJxa7LhU8lf84eKHXXJ/I67Ca5w0mAHabY0WOKESHwZB19Zj4IH
         XSLtOEugBcx1JTAt5ZWx/nw2OpHikHyATIJVRVVDlKVnE1Az6At9qee1OnGaApuDAcIL
         /oDbBifCtXz6cpgK4AuvvfEUzMUvkSP3fLaeFXtJRfLlltmy+fjC7NA0iUHd0jpVNKUz
         HOGPVMsPLJSukwIzh/KwE++RAaQZ2KxDGTClBDcED/qhWEOmZn/BhrscQKE3S4ZxA3i3
         UY4A==
X-Gm-Message-State: AOJu0Yxd9EaaVhYJXgIMufv3pv87KAR69qRj6oO+aCxQ8nG2uea6SsUJ
	tZ21KiWgBaVIa668N2pqwDaE9X1VxZ+HA4FZrD/354gZ
X-Google-Smtp-Source: AGHT+IGIxqktm8CS/u/HQCPRjXBHq5V2PUmvhT5PtpftIP6neCrG6p+8FFS5puQn1gX5c5fvHzPjPw==
X-Received: by 2002:a05:6512:3b95:b0:500:7fc1:414b with SMTP id g21-20020a0565123b9500b005007fc1414bmr94916lfv.25.1694107471357;
        Thu, 07 Sep 2023 10:24:31 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id m13-20020ac24acd000000b005009aa86582sm3210508lfp.55.2023.09.07.10.24.30
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 10:24:30 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-500d13a8fafso2039828e87.1
        for <ntfs3@lists.linux.dev>; Thu, 07 Sep 2023 10:24:30 -0700 (PDT)
X-Received: by 2002:a05:6512:104b:b0:4f3:9136:9cd0 with SMTP id
 c11-20020a056512104b00b004f391369cd0mr60515lfb.44.1694107470248; Thu, 07 Sep
 2023 10:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230907-vfs-ntfs3-kill_sb-v1-1-ef4397dd941d@kernel.org>
In-Reply-To: <20230907-vfs-ntfs3-kill_sb-v1-1-ef4397dd941d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 7 Sep 2023 10:24:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5NKHNdrzJ-8bwu0go=6n177M2EkwcgnXiyd23go5RPw@mail.gmail.com>
Message-ID: <CAHk-=wg5NKHNdrzJ-8bwu0go=6n177M2EkwcgnXiyd23go5RPw@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: drop inode references in ntfs_put_super()
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@lst.de>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, linux-fsdevel@vger.kernel.org, 
	ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Sept 2023 at 09:04, Christian Brauner <brauner@kernel.org> wrote:
>
> Hey Linus,
>
> Would you mind applying this patch directly? It's a simple fix for an
> ntfs3 bug that was introduced by some refactoring we did in mainline
> only.

Done. Thanks,

                 Linus
