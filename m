Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA886D13
	for <ntfs3@lists.linux.dev>; Thu, 12 Aug 2021 20:49:55 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z24so6417763qtn.8
        for <ntfs3@lists.linux.dev>; Thu, 12 Aug 2021 13:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=jhiVcDjLK9DimYW5raN92xMTBDy3U6wFDiuuGfyxrzQ=;
        b=AdCYibNy42MKnTxuojP4fz4LFzd11cE9ZDrfR4lim++UNLLCVCqjdNeLqsvxoq5ptu
         1IMYwWsR2iqZV+umX+lryC0z10KK5S0xIQn8jgzgKCtrWjVl59IrsO3mwtX+IqicOwrM
         /cddXi4JJsOuEr2b3uUCRIpC5SahgycLjDmWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=jhiVcDjLK9DimYW5raN92xMTBDy3U6wFDiuuGfyxrzQ=;
        b=YDEg24DKU8eJms5QcFlmfyjC/cEZpUYyjTV/Ljge33SGqB+qp8bDYmfOrTW+p9zFhX
         ST3RcL/8JnQzuidQk5j7yQ0wIzSTlH3Sm3eoNHFdsaGavrbYjvepmy6rN8cT5dTAVv7/
         bbpyM/QWLeoQ1CwvFdLeBt3Nj8tVwXK7kvnM3Nb6kMy8v1+MOocZqFciBaMnaphoRjw0
         H/f9DsQdCMSD6Jj4sZzZt5DvD2xkM08acX8q15HcLwUGjjckP7W3mKlAQQcNIzzayScy
         78psmaztc05RiWIE+aWPWnVLeFksHs37xYmwCz5sP0luisJTjVju1GK8OsASPd6+qBIG
         lM/g==
X-Gm-Message-State: AOAM532Bv9OVB1nJjnEl6q+1+52vMdf8cjJH911pjtH2Cg4ckxzyjyW0
	Wkkt/3l5tvUWyd655VZRsH3ET66NDIzyGAIB
X-Google-Smtp-Source: ABdhPJxFu7ufZhg9OwUe2/ZEKKYU9hrRHRshJmWGzy82wIN99nqtcbdccS/D71PQBCAzgLRvyTUNdw==
X-Received: by 2002:ac8:4cc8:: with SMTP id l8mr5819961qtv.336.1628801394478;
        Thu, 12 Aug 2021 13:49:54 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id n11sm2014900qkk.93.2021.08.12.13.49.53
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 13:49:54 -0700 (PDT)
Date: Thu, 12 Aug 2021 16:49:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: ntfs3@lists.linux.dev
Subject: Test delivery to start the archive
Message-ID: <20210812204951.jud2f44hkxpdhvrp@nitro.local>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This is a test email to start the archive.

-K
