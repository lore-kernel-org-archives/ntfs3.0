Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3672
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 14:28:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id e23so5806432lfj.9
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75RjxCfLjQSwmyhXcT0XtNjKX6pdVwXCyGclbHCUCpQ=;
        b=L/5MU7CfkLPnsnEReBQpY0KGqg07whucLQ2iYYbnZNCMZMjtzvDI2RBgb+/EYTpHl/
         0/wDWw44RncgeG8KrI+sFPq3TwkNgNJ968aKBoi9i2BxAJoZRmQafI7zU2SRalDQH+kb
         eof3wUnk5ZsJdGlLVFPMpqtqdeijEmx/muk6c6BUzA7/gqJGqL4NkGrTWuzEwHjb6cRl
         FDZ7Q6TVQpM84ap810C9B/utGA2LX66weKdhi8ZRbn0c//OhNvFJ1RdsZXPQ8NBkTPlA
         aDvpDBVOCaLpxSJNS4qFDgaSeZOagg4DsHshStOMvkdUz2s2CyYSY+HrE4dS6SXzc0ta
         pUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75RjxCfLjQSwmyhXcT0XtNjKX6pdVwXCyGclbHCUCpQ=;
        b=cc1fzzRd+EZ/zhHI0inq1ByUPCp7Q3xU3RmVQDWYVRfffDK2vsEGsxsH1mnHZBp90v
         aU5AMtLVKc1B8UglVTswBovZsDZdp6ARQ6JIwXOCwXH9dBCIWr8EupPOrphuOXRN6IAY
         ifQXpenXgVuX7RSettoVpe0qOKaqwXUreqVKTAoMA9JyT3pECpPxHjlLTqZrM0pjz4Is
         6sg8NUch+BeSoqjLo0dxdWEzLDgu/dE6nzzFlXhLbdBqn9L4dMwByYwtlU2IsQcXtgO0
         /Bg7/rrbsT8KYX7YBIRGN7Hth7C24OAjtDxNNG2I99Ta3yt9YNh3RYxohEhUjftDZU/h
         mPdg==
X-Gm-Message-State: AOAM530WpKC+5LX7LjdAKXl5L0utloMDP5c6/Cq67eICuD6HkpYudP/l
	EtOEQWSv39ilrvDoD9tv7mY=
X-Google-Smtp-Source: ABdhPJyG8xBIROa64/VLmk5PgHtuVkqEq6vH2E0Jg9TtS8C0yerJDqL7XRAaK9CQ/XwlNUFqF4K+jg==
X-Received: by 2002:ac2:41c2:: with SMTP id d2mr6629172lfi.395.1631024927911;
        Tue, 07 Sep 2021 07:28:47 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id l11sm1014251lfg.39.2021.09.07.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:28:47 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Fix error path and use kernel macros for min/max/calmp
Date: Tue,  7 Sep 2021 17:28:38 +0300
Message-Id: <20210907142842.133181-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First fix some error path fault which I found during when I did this.
It should go to 5.15.

For better code readability we can use kernel defined macros. Patch
2/4 also removes some dead code so that it would be more clear why
do we do what we do in patch 3/4.

Series is tested with xfs-tests. No recression in my tests.

Kari Argillander (4):
  fs/ntfs3: Fix ntfs_look_for_free_space() does only report -ENOSPC
  fs/ntfs3: Remove always false condition check
  fs/ntfs3: Use clamp/max macros instead of comparisons
  fs/ntfs3: Use min/max macros instated of ternary operators

 fs/ntfs3/attrib.c |  3 ++-
 fs/ntfs3/bitmap.c | 11 ++++----
 fs/ntfs3/fsntfs.c | 68 +++++++++++++++++++++++------------------------
 3 files changed, 41 insertions(+), 41 deletions(-)


base-commit: 2e3a51b59ea26544303e168de8a0479915f09aa3
-- 
2.25.1

