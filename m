Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793595180;
	b=m3my+bKSOxHbpD6QeL2ztO33lTH8FBvMRbKsvoCN+rXIlrwQg40elqTaL6TKFyfYMP2e
	 BahCBdQqzzlP8+EJqgOIuPeJKjr9JA+4bCLcY6G+vfvJrItmODMgpEpWRCmXOs9IGMN/8
	 skT9kl9IP6Q71JJPnRLJIy90a1BGk+WJE5joJWrbltY+uP3iOwTkHU+JE0FABe8lGvtt8
	 Ezapx3g6b77atb5lJOqNSIiCAN97S9f9hRy6G+AtQTBHai6b3KzqpwJ34FflZjyk1cmkf
	 eIJ8KJZP89hFNHziWJWCqn5G9R+fCz7DvM8MtKQJnioGiwlZzUR6Ci7odWNfkU0rF7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793595180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6oqpKxk86SD+jV+VPFMFYNzOMC1DXOMLFvPv0KulzKw=;
	b=XR1s/wSFuQ0+vSWbFgP5mgJaJU4QWmtQFYeA78MCfuoTgYYVCBoZiiTuwsOe+dAby1bM
	 r0WLLSmYx2Bo0JJDThSk8aGrSO98JHjC8Hh0MweCpYpr/h4wa5IyAW7r1IwbzYTxblanU
	 +2oG1InB6F3e6nTj/bF8zL04SPf3zvHzY2tg86nfW5I9Ijyh9Uv0wAgzSIkFcCUiKw5Qz
	 Od5JPfB7ZHg3utKLxWFYoI2CRL0bMFDz5qiWYAihUGkbbEpE8urGr7WdEmHXDQzuZhn6D
	 Cab884mTnE2S0CzPwoWHSoy0oKKbimZJ89EYmrS1crLBILaA8grgS3tF8nXA4/L263Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIPbQ3vd;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE6606A326
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 04:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14DE6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIPbQ3vd
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-980c4258105so1467600241.2
        for <ntfs3@lists.linux.dev>; Sun, 01 Nov 2026 20:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793595179; x=1794199979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oqpKxk86SD+jV+VPFMFYNzOMC1DXOMLFvPv0KulzKw=;
        b=NIPbQ3vdSyxbQyGwnEkDyRVAPt9S6YQ/zYC7TX6cqTJKKt9cvGxniNzaONfAjoDjCQ
         uUuqk4TqcJy5GcMR7iRizOrUBZIJUTnM198+1QhVCsrw2rCVkJrbzKrBR6ZeRC6cdWc8
         JPoxz2Z7XrWV13ftO61SLt1kI4Qm5T7tNuIJ/MhIpOcvaUK5NZUjQwicWIeO6B7Xpcgv
         ZEVpnTJhSD78C5eYIZ1XIJPAOdU2Y//S4D3LZg102FXSpE2/C6eaWzFKV4DrRo+WBv5N
         omJqO13Re6Us5xr1OO6OIGuI9YgAMY7HFmkgQqwLpPA0OH1EA8J+twZLN9JYzxTJnclP
         V5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793595179; x=1794199979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oqpKxk86SD+jV+VPFMFYNzOMC1DXOMLFvPv0KulzKw=;
        b=u/AHJYG3lTeyt0v/KX2fPtefvx6KFnc5Rf+MQIl515pymcU5eGPLH7x0DvmyY/1ly+
         VYP+rps3VygDjZqjLAEH4HiuPhNvYRYYG++7WNvDyR5hP/crNeccsRGIWlYoSGXwBg1d
         TLPCm0sVMnRNYXSv6mawDrGx/1tsgaetDc0RZ9jonPTMGeZRxmffJ9VLY+MxDvRDQ3bj
         GfHcKxgcpU0fWWsSKJ5foY02qMvw8gxsAkk4YQFW0v+HbE7ZVaHzHxeJt8D9qJk94Mx0
         RfAL3k6JYGGiA/DLNXCCvF0+TiyXBJRlCOA8HmadCg7CPjIpqbhKl1EdMsxT3q8RKR1y
         oNug==
X-Gm-Message-State: APuU4Z8LPBt9RtExFZNP948LWd0iWdvFSlhzUarglSt2OHY+Cx3tCf89
	PwmAfa4gU/wr6M+bP22YO7wPinNESJErMnPhykOIiLqtMLY8tNI4az5I
X-Gm-Gg: AYBFou17cwsDhoR3p148lm+2eBq2S1WkK2OT/M4ScekIkCMAhiPPZxYc4ESWb+H5M97
	STlzJEy1xSfU1mCkPXSADELbhpayp+4iGzOqadS/u2t76Z5wPcXwUmslvKBPYghGgb3HzACjyIJ
	ynCDbsFeuGHj5Qx+3YpRvH/6C8gmFvLrSfibiDs5ufCalq9J9j3Efmy8jGUrFFPD4Q+QaoB/dZx
	wsoY/yNO/3MhZqpO306cZ1dyOh3pRXNS1KVLQfXID7yL+oghcX4PN/W/TNcea4aMI2lknjfu61L
	XXEZwrz3Vj5WR5NwJJcGtrXMd2FQ7gbrq6uQFJsgYnagE/+WtlEW4R07eegmLizdSJ2iUr8WOBI
	WyI/CaZPyJKVl0qBT7Njsz5tqpXmYPl+nALAbRSgbyf0uTtOM01PvW4TbfM1ZPGkNrXlBGczUpi
	rOweOxpz3TLchKgWaZvNysOZApYg6LyfH5hksyr8nr2IcwgfZ1bfwjdzICHfIUVo1y556GrjmC3
	k1YivFVDTxjnJU/3uXrbwLoe5M3u/yM/CKDHCMx7PheU54Grf4CpvQxWpJoAEmBylXXp1HnY5Jc
	sN/c9l8xHEibUO0jUX0PB/D4fS61df27wdB0iWevczVnhTuOmEtE2BQq8WY=
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr2728316137.4.1793595179009;
        Sun, 01 Nov 2026 20:52:59 -0800 (PST)
Received: from bridge.. ([2804:14d:ba6b:8339:72cc:e44:b5d6:98cb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4c1603sm10652171241.10.2026.11.01.20.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:52:57 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yun.zhou@windriver.com,
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: Re: [PATCH v2] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
Date: Mon,  2 Nov 2026 01:52:33 -0300
Message-ID: <20261102045233.16718-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029052102.1585462-1-christian.aurichzm@gmail.com>
References: <20261029052102.1585462-1-christian.aurichzm@gmail.com>
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

Hi Konstantin,

Any update on this? The bug is in 7.4-rc1 now and syzbot is still
hitting it. v2 still applies.
