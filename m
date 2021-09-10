Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220C3FC3
	for <ntfs3@lists.linux.dev>; Fri, 10 Sep 2021 18:12:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id s12so4632416ljg.0
        for <ntfs3@lists.linux.dev>; Fri, 10 Sep 2021 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yAS2V26MFTPXdp5D+1VvRXcpwyS1dkM+dGnCynSdaik=;
        b=QZCMZ92pfp0Aw7elF0GYvXcwRYYzg/cDsaEmEba4f+WIMOVwz64HZqjB1pjqWaqukb
         BIwSvfvT4DWFNxpLG6dqJIBwAdLbGHF5xXrKnAarI5o91JevyqVgKYgwE2SaxNHrunCS
         41lNXtxFKbJ3d1/82AzOiHGuEiHzg7/4kipXZOrwcZ87+wKE/3L7czuJk+oxX/0d73E+
         uJKdkUoRTBaP30HwMX4u4SGP4p5MrIDNZdNwZ7xq99qXL5FvCE6QdiJ0WfJSNj1ERa8l
         hbcqa6ILYPJB1hgBsrFvgArXvSZEZ1WXL7ylaUIYasJ2G85yWH7wzbrFjioLsLpt0W0Y
         mfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yAS2V26MFTPXdp5D+1VvRXcpwyS1dkM+dGnCynSdaik=;
        b=GB6zgj/A/IvLqkmqVjyvUN9JjhOGIEyOk+QJZRtXBuB00OffZ7ZPtELFE+RfEp+05c
         kMQVCLfLOdcakgz0r27NuDuKAmVYZt7XsuIUGPQ1bm14Hl6MEndnKRKUq0tabfepF0i3
         ug27WYrliMsqzP92IV1u3q2yM0wWNpxfuM26jUAEmfKbiZ1mhCUJnMhySoaR2bwrzEFk
         DnWki1Qdab46pzeEwTuY39MBOAiFkRBCt4WGB4djHhC6dO4gk0E5gYdZvLbCgFDjhQ3y
         a1D5vFWsN893tc/LFRIzk7pugYsiIt5g7OJuPelBNYWYjq0MyufQwP58CdDgutDdmHiL
         CeUA==
X-Gm-Message-State: AOAM5318OnBt79MGk26x5Ix9uXhRobyyIQIQQpHuxbtEK0vJyPH8DC9n
	HqDzij+VOLowHtX2CWL6IpU=
X-Google-Smtp-Source: ABdhPJyv+ihp3UJkL+McKA/31v+I+WB/lbUcXTkXIuSsRWwmYlY+S/nkN2pZwedAzLWpLNtlfn1zyg==
X-Received: by 2002:a2e:bb93:: with SMTP id y19mr5072294lje.79.1631297549627;
        Fri, 10 Sep 2021 11:12:29 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id o16sm623643lfu.45.2021.09.10.11.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 11:12:28 -0700 (PDT)
Date: Fri, 10 Sep 2021 21:12:27 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: fs/ntfs3: Runtree implementation with rbtree or others
Message-ID: <20210910181227.4tr3xn2aooeo2lvw@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Konstantin you have wrote in ntfs_fs.h in struct runs_tree:

/* TODO: Use rb tree instead of array. */
struct runs_tree {
	struct rb_root root;

	struct ntfs_run *runs;
	size_t count; /* Currently used size a ntfs_run storage. */
	size_t allocated; /* Currently allocated ntfs_run storage size. */
};


But right now it is not array. It is just memory. Probably some early
comment, but I check that little bit and I think rb tree may not be good
choice. Right now we allocate more memory with kvmalloc() and then make
space for one entry with memmove. I do not quite understand why cannot
memory be other way around. This way we do not memmove. We can just put
new entry to other end right?

Also one thing what comes to my mind is to allocate page at the time. Is
there any drawbacks? If we do this with rb_tree we get many small entrys
and it also seems to problem. Ntfs-3g allocate 4kiB at the time. But
they still reallocate which I think is avoidable.

Also one nice trick with merging two run_tree togethor would be not to
allocate new memory for it but just use pointer to other list. This way
we can have big run_tree but it is in multi page. No need to reallocate
with this strategy. 

I just want some thoughts about this before starting implementation. If
you think rb_tree would be right call then I can do that. It just seems
to me that it might not be. But if search speed is big factor then it
might be. I just do not yet understand enogh that I can fully understand
benefits and drawbacks.

  Argillander

