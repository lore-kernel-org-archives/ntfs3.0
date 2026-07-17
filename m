Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206A937472F
	for <ntfs3@lists.linux.dev>; Fri, 17 Jul 2026 03:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258612; cv=none; b=sHCMGifsU8PqW5wC3NtMWpE+7jNjhJwwr4lEiimBoY0/01aiRpVzlA9DE3k1XcVHrFvQYn2JMYOrdUeY8qIG9qxyOqKFlNbFd4Ckvl2MiGAOS1SJ1GXp5/VapoGVSyUvZqbkag1qx1paRp1WtIQTPbQIxty6SsG1myp0TDKrlP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258612; c=relaxed/simple;
	bh=2q2m6lDuCmbOkMpQrTT+db5Hq3Szmb6X5pI1yh9CGho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrNCAhPW7GFJ7/2RJR478TIMSG5bkMntvRXlMq24khX6JY2nOI1EcXyULtwZtgT2WyvPPZgUJA/kl8ln0x2lFuszPwgGk+Fa48uLyOP5Loh1y16iPgheXWQCR4pp3CWUbllS5OKVu26VA+secQWR65GBZFfNvkE20y8onXROZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=V70OySeQ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="V70OySeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=NS
	IXhiOnJyOGnQ7yeu5uYFXAW46RVEcfs5asLTqNgIs=; b=V70OySeQ7l68ooZluO
	JMiQlorjwYDoJB6TOUxNl84AyErhCtwgZ3z5XXQ8UsDMd2TUfK5VsuzXHep1yFqF
	4pPeJZw8RAGQUKJrwmgUbZ8uvWiCi7q4lOdPGREJ3YjeyTvGOaDV0i7hRnD39LkI
	CvWS9kVXEiUim1CrtAmzk+oFU=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3twcPoFlqvNaLJg--.4501S2;
	Fri, 17 Jul 2026 11:22:58 +0800 (CST)
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
Subject: [PATCH v1 0/7] ntfs3: add tracepoints for core filesystem paths
Date: Fri, 17 Jul 2026 11:22:41 +0800
Message-ID: <20260717032248.3318208-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3twcPoFlqvNaLJg--.4501S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW8Kw13Zr17XF48Cr4fAFb_yoWftrX_Ga
	4xWayktryUWFnFga9xCw17JrZa9r4Sgr1DJFyftF17XFZ8XF4rJF1vqr43Jr4Igw1YqFn8
	AryxJF18Zr1fZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM189JUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hId52pZoBJHkgAA3W

From: Baolin Liu <liubaolin@kylinos.cn>

This series adds an initial set of tracepoints for ntfs3 core paths.

The tracepoints cover:
  - mount and log replay
  - namei operations
  - directory index operations
  - allocation and block mapping
  - iomap operations
  - file I/O entry points

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
 include/trace/events/ntfs3.h | 395 +++++++++++++++++++++++++++++++++++
 10 files changed, 446 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/ntfs3.h

-- 
2.51.0

