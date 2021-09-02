Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96393FC1
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 15:40:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id c8so5248421lfi.3
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuYhyTGw4lWqSUdES+fH4JDl0igY3Z4nvbSSawEsyY8=;
        b=q2wgJmOJjmwtv6XnpZyovktbSHyXroKKJ2fF1aUJor5EIp3Rd/ebY/PBptHCiPGyMz
         bzpoFgKjl6118ndzykrhkCWga2CoqXIJTRYJTrSM6B/64Xqnl0shWAmpUUcuCSuetWqm
         p5ps+nYVeSQW4aVY/aIJYAvr2RL/ybwK6xC3tJTDItyPDasKPB/GiyFqY+QjDPzHPLrd
         Cl4o7i1RZMjc7ryI324/et0O73ZFmBqcMv+uNslz5k4LcPwWV1StWy5LFt+supK7k66A
         jaHzDiLzfqceMzTkLzSNaFJjOeEsquwp2MT7fF0ZkXchXoV81KQ9V0c9DW+01SmR98D6
         L6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuYhyTGw4lWqSUdES+fH4JDl0igY3Z4nvbSSawEsyY8=;
        b=lwzQXRsO/dYEh9I3Xw2eRnbz8h8eSLQBZvgfabedxG5kLy4KAB0PEOb8QmrsfyxFig
         9t4KyJF/IdFF3HkgaMf6/E6bHZfBE+6wg4C3L5gV7951mIOmX8NDZrD4qfoqJD8alUE+
         3fhMasNmrMmE4/EKt6oa2u7G52I7L5duxQy4upuI8+81EDPZLFOJbwkPYD5qTF9eEfNp
         mjDt4y20+Kw2f8OoSVXbxm4xAnasKSKL5lA7m+1/cjgnA4aDp4WYv2SZ7CfRdY/wqi8l
         LzrX+ISTcioSe4QgcJvea5EWnhwNPCUja2AvNY/sXGyOMiF41U3TERf8VbUfP6JhIxxK
         qEYw==
X-Gm-Message-State: AOAM5314/E8yqig4Rhv4x7LsZc333qxrC5vo2k3aAhTugNIZnvnuOpGO
	jMgc+VGTIxPzp6y18MzVnK0=
X-Google-Smtp-Source: ABdhPJyHgof7YjHUqCBdwf9LcChC69K35HwidG8abusTBlBaVtir5R1C9iO1PLdN3iVOmgCNY9Qmyw==
X-Received: by 2002:a05:6512:22c4:: with SMTP id g4mr2936623lfu.500.1630597254951;
        Thu, 02 Sep 2021 08:40:54 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id 25sm258630ljw.31.2021.09.02.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:40:54 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH 0/3] fs/ntfs3: Make entry binary search faster
Date: Thu,  2 Sep 2021 18:40:47 +0300
Message-Id: <20210902154050.5075-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series will make binary search faster with removing the need of
allocations. We will only use stack memory. This will also make possible
to remove linear search completely.

It is good also point out that full binary search not quite fit with
entry search because entrys are not always same size. This why we first
need linear table fill algorithm. My implementation try to use the fact
that we should not linear fill full table before not doing any checking
of the entrys. It is example 50/50 change if we are in middle that entry
is in first half. So it is very inefficient to fill table after we are
middle point.

We could also predict how many entrys there is and use this information,
but I did not do that in this point. I'm more than happy to improve this
more if someone has ideas.

I have tested this with xfstests and did not see regressions. Checkpatch
and build tests for every patch have been done. I haven't done major
bench marking with this one. Idea that this is better is just my two
cent. Paragon has hopefully done bencmarking with old binary search
compared to linear search? I'm quite certain that this will win old
binary search algorithm because no need for allocations.

Thanks Joe for let me notice this improvement.

Kari Argillander (3):
  fs/ntfs3: Limit binary search table size
  fs/ntfs3: Make binary search to search smaller chunks in beginning
  fs/ntfs3: Always use binary search with entry search

 fs/ntfs3/index.c | 153 ++++++++++++++---------------------------------
 fs/ntfs3/ntfs.h  |   3 -
 2 files changed, 45 insertions(+), 111 deletions(-)


base-commit: d3624466b56dd5b1886c1dff500525b544c19c83
-- 
2.25.1

