Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A611C3E
	for <ntfs3@lists.linux.dev>; Fri, 28 Jun 2024 00:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719534306; cv=none; b=Jdcu0XiWv6Fq8GWWd//aR+gVHbaJUphQCrFT2geuNULFPMKIIuWMU7KlkQWu4hDNNA/7kKpDRvhUJ4c/okDDvtobMCXbEjEIFrYqpeZbYn2AOi0wlzq3DK4t6umZkg8SNQmqQMwbufjqZQ3sG8iuWqlG2cYDot6qc9IjqTK82wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719534306; c=relaxed/simple;
	bh=B7ai0eVoKTNczcFTdEd5cVJdPhoqYSzvFR4/p1O1rYo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=GZ/xsJHAxHYSmIeku2DPEQlTW0Lf0rllfldKBFOlofLpuJ5Ku/PkJjQV7kdFiw6PMlRVkE9iB8MXM56PGvGS9Y+wsN/mFKYiZPoa+KTWdEO/GDFnHD1tSH2akArneMNqcVRkAQAcHHitif5tWrxcKMDZtFi4adS/rMh4oDiHirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANkSa4zo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANkSa4zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719534303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pht9Lfpad0vyg1Yyut9IEpvrjSRLNRr1y5QQbadsiGU=;
	b=ANkSa4zoOzL3+PvGs74y5JvQkv60ko+P7S0Oc/fZOFfMtzTrdbjYmBEnIbJ+p4/CPYshKJ
	dhmtLJt7sJYDlU/W8g/50HfgVp4F0mFVKbZddKuYgY/Mxq6HUzIM8TiFj1jZuQCKx2TlsU
	PG3iJYQbgWAnpbD4x/798ZwUSHxO4Qc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-3P5dxGcRNwOpovEPKH2eJA-1; Thu, 27 Jun 2024 20:25:01 -0400
X-MC-Unique: 3P5dxGcRNwOpovEPKH2eJA-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-376210a881dso1074565ab.1
        for <ntfs3@lists.linux.dev>; Thu, 27 Jun 2024 17:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719534301; x=1720139101;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pht9Lfpad0vyg1Yyut9IEpvrjSRLNRr1y5QQbadsiGU=;
        b=qlxMTg4/8v3FBFPOZnVTZ0xNbJulFJFWMlrbXRpIxmgcmecV5Q/HNI4yeGpk7YpZzY
         TPUm1gK1bf7NAs2kbnbYpPKxAlDsJf7rTwjAffp95j765xjaYjsVlTdzRQmd+sJk/alu
         gm/ZUXL7pST+dxXXpSl64yR84RYDDIUOLCO51KncmunjALIFUN2Nvfg7c3a83TGMBtLK
         GxSHzmb/9us1qGeWe7Mt8ZVuH8qiPw54N1rDJztt67/4Biz98sHtGtsM6zG5KP2vOObY
         BtYPZZJsYTWhInrFkogYBivljVgPkPeh//uYy3uX9h/eSYONq3m2G0Llvk9diJAZlr1Q
         4gvg==
X-Forwarded-Encrypted: i=1; AJvYcCW4RL6rltVsO+kirRSToBKrPpMxOXnRhJG99W9qdWWndthRrt3+xcZ7D28u2AWnziKAy7IVq/nSGOkkf29zkSzY/CMFTEU=
X-Gm-Message-State: AOJu0YyhTuws5H0NEnlnSRsOIuA7IusnPZ8x0BYhaf3QIbReiJggc0eB
	B3VF8luBBh3s1zLBNBtM4kgDp+hJ4iJO4khBkbKADlkVWkrb90H/tzEeMD9KXYH4fQYRij7aghH
	ST4zZq4muUhdyUaRJ48AqIdrlRzp/1NTOmhGwAP54ap1ILJiTeIFd
X-Received: by 2002:a05:6e02:b4b:b0:375:86bb:2142 with SMTP id e9e14a558f8ab-3763e0607bfmr185522665ab.24.1719534301030;
        Thu, 27 Jun 2024 17:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH481kZ0wneyCG62Atf5OEAOI8SNnvN2mW4RtYhpSMGDQsWqiRmeiQ26Brky+7JgOdDtIxULw==
X-Received: by 2002:a05:6e02:b4b:b0:375:86bb:2142 with SMTP id e9e14a558f8ab-3763e0607bfmr185522465ab.24.1719534300668;
        Thu, 27 Jun 2024 17:25:00 -0700 (PDT)
Received: from [10.0.0.71] (sandeen.net. [63.231.237.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-37ad4370c90sm1696895ab.69.2024.06.27.17.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 17:25:00 -0700 (PDT)
Message-ID: <8dca3c11-99f4-446d-a291-35c50ed2dc14@redhat.com>
Date: Thu, 27 Jun 2024 19:24:59 -0500
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Cc: autofs@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-efi@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-ext4@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-mm@kvack.org, Jan Kara <jack@suse.cz>, ntfs3@lists.linux.dev,
 linux-mm@kvack.org, linux-cifs@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Hans Caniullan <hcaniull@redhat.com>
From: Eric Sandeen <sandeen@redhat.com>
Subject: [PATCH 0/14] New uid & gid mount option parsing helpers
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Multiple filesystems take uid and gid as options, and the code to
create the ID from an integer and validate it is standard boilerplate
that can be moved into common helper functions, so do that for
consistency and less cut&paste.

This also helps avoid the buggy pattern noted by Seth Jenkins at
https://lore.kernel.org/lkml/CALxfFW4BXhEwxR0Q5LSkg-8Vb4r2MONKCcUCVioehXQKr35eHg@mail.gmail.com/
because uid/gid parsing will fail before any assignment in most
filesystems.

Net effect is a bit of code removal, as well.

Patch 1 is the infrastructure change, then per-fs conversions follow,
cc'd as appropriate.

This series is also at
https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git/log/?h=mount-api-uid-helper

Thanks,
-Eric

 Documentation/filesystems/mount_api.rst |    9 +++++++--
 fs/autofs/inode.c                       |   16 ++++------------
 fs/debugfs/inode.c                      |   16 ++++------------
 fs/efivarfs/super.c                     |   12 ++++--------
 fs/exfat/super.c                        |    8 ++++----
 fs/ext4/super.c                         |   22 ++++------------------
 fs/fs_parser.c                          |   34 ++++++++++++++++++++++++++++++++++
 fs/fuse/inode.c                         |   12 ++++--------
 fs/hugetlbfs/inode.c                    |   12 ++++--------
 fs/isofs/inode.c                        |   16 ++++------------
 fs/ntfs3/super.c                        |   12 ++++--------
 fs/smb/client/fs_context.c              |   39 ++++++++++++---------------------------
 fs/tracefs/inode.c                      |   16 ++++------------
 include/linux/fs_parser.h               |    6 +++++-
 mm/shmem.c                              |   12 ++++--------
 15 files changed, 102 insertions(+), 140 deletions(-)

