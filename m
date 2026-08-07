Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2A2264A7
	for <ntfs3@lists.linux.dev>; Fri,  7 Aug 2026 01:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064672; cv=none; b=GxTUACdNQCe8fp606J3IsWm9MT5EdLwEVUrXt6LtKFxkWn+ZjLDCb4o47UoyEbF/4TTrkdESj7HiKjMRw/twAlGSZf/VE4/lQB/uzo7UPMadr51rPM1wttYQ/FIV0twq1l+t45hAl2866Nt2LBzY8zi666HSuEBOQFhbwnziUBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064672; c=relaxed/simple;
	bh=ISd204hZbiZN0T7rQwA9J2aGTXNSnXWYw8ww/TClxYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlMAYYjf4+HK/Ju36XlnWvi8i+6Q3uH1smNdNatbVt1GkB66q5dUfQEqXh0ry9bgnBzEmfxngIs6fB8rb0KgModniECOcF6bjAMAsZWQKT5qeWcTJaETKSOiWWGePpy7Tvj+rA3nvYDsFmjnG6dGBlKtZXbH1l/6oqVpNNNDq8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HNExABj/; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HNExABj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tr
	SmgPK/iKYopYkshvdX6gxgIvX9ARM61c0Feb3kP2g=; b=HNExABj/tD3X/dkKcX
	jEQaO1xTwYgLD9eOBmizvQ+xGIT2IPZinFgV5DzMZfeK1mqO/SrMfXZIzRRpYao4
	iO+fOHtfVQwryee8Q6cfHC0gLajLgCRPlVxTZsY/UnTluA5nXbDugCMfQcKKnMJ7
	lZwnvFsz0ZiAv2cd78A9fEO+E=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAnpYn9LnVqp7BkOQ--.32974S2;
	Fri, 07 Aug 2026 09:03:59 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 v3 0/7] ntfs3: add tracepoints for core filesystem paths
Date: Fri,  7 Aug 2026 09:03:47 +0800
Message-ID: <20260807010354.2277156-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnpYn9LnVqp7BkOQ--.32974S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW8Kw13Zr17XF48Cr4fAFb_yoWDZFb_Ga
	4xGa95tryUWFn2qa9xCw17JrZ29w4SgryDtFyftF17XrZ8XF4rJFnYqr43Xr4Ig3WYqFn5
	AryfJF18Xr13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM189JUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6R-CjWp1Lv-kQQAA3S

From: Baolin Liu <liubaolin@kylinos.cn>

This series adds an initial set of tracepoints for ntfs3 core paths.

The tracepoints cover:
   - mount and log replay
   - namei operations
   - directory index operations
   - allocation and block mapping
   - iomap operations
   - file I/O entry points

Changes in v3:
   - Reorder tracepoint fields across the series to reduce padding on
     64-bit systems

Baolin Liu (7):
  ntfs3: add mount and log replay tracepoints
  ntfs3: add namei tracepoints
  ntfs3: add create inode tracepoint
  ntfs3: add directory index tracepoints
  ntfs3: add allocation tracepoints
  ntfs3: add iomap tracepoints
  ntfs3: add file I/O tracepoints

 MAINTAINERS                  |   1 +
 fs/ntfs3/attrib.c            |   9 +
 fs/ntfs3/dir.c               |   3 +
 fs/ntfs3/file.c              |   5 +
 fs/ntfs3/fslog.c             |   3 +
 fs/ntfs3/index.c             |   8 +
 fs/ntfs3/inode.c             |   7 +
 fs/ntfs3/namei.c             |   5 +
 fs/ntfs3/super.c             |  11 +-
 include/trace/events/ntfs3.h | 389 +++++++++++++++++++++++++++++++++++
 10 files changed, 440 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/ntfs3.h

-- 
2.51.0

