Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EAB235BE2
	for <ntfs3@lists.linux.dev>; Tue, 30 Jun 2026 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781218; cv=none; b=EiDkb7L9qTBTt9ONPj0C9yObZqJR3ArYN9EccGAKqJ3tHHx0eAOsunPw6I8cFEdsPBNSPPjysU2A7meq+xFeo7ewu4UD16GI6rexJ5q7wasA1K9g0p/oirF6jaSjFJnkLantFJ+clk0QtmfsqIhVtSJqH1dEid34FqyKFGnytN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781218; c=relaxed/simple;
	bh=LV/ZGGMnyJLQIcSpD2SU1kf/Jvz14O0zZVHjqmF9TWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaSUfSjRxudwn6Z2MHvOVjDQTTAXTvJAsMX8Ijs9r2CfeNdIO1oZRac5IkN8igD88TAsYbSaVyHVlT+gGqzo9/FUo5jZqYRVSouY7cogyZQ5DcVEzMW9Y0pFuOIazx2Boj2iaFrvM/G6uoauoIciIQcEe6wzlmaOKKDVrqmNgR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pnGBQrv2; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pnGBQrv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2w
	izKsiZhq5xv8gDraghwmvVUJLndgWBMExmiRsCuwE=; b=pnGBQrv2Jo0avtItmk
	jYmF66qgThj+LABr3lwkS1jjd5AXO3zQavZeg4UIAcfFO8816WmS7eTD8Jr+iDms
	MxqLP0OzA/tQ66R9UsXIQcSTUjgS+3nr2jYzfp2e2VFSkKsapd2/dyztoG/56YSs
	KPR7y20RChRQBPmyl3grSBdtY=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H0IOFUNqahiaGQ--.34898S2;
	Tue, 30 Jun 2026 09:00:01 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com,
	ethan.ferguson@zetier.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH] fs/ntfs3: reject FS_IOC_SETFSLABEL on readonly mounts
Date: Tue, 30 Jun 2026 08:59:55 +0800
Message-ID: <20260630005955.1374688-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H0IOFUNqahiaGQ--.34898S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy8Xw1xuFyDZr4kZrWfuFg_yoW3Cwc_Ga
	48C3WIkr4DX3ZYyan7C34jqrZxWw18Crn0qrySkFn8AF4kKa1aq397trs8twsrXFW7JF4r
	Jw13W34Y93WrtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiNeO5UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hG0f2pDFRHJCQAA3d

From: Baolin Liu <liubaolin@kylinos.cn>

FS_IOC_SETFSLABEL does not check for readonly mounts and
can report success without persisting the label change.

Return -EROFS on readonly mounts.

Fixes: 21dc07ac9c25 ("ntfs3: add FS_IOC_SETFSLABEL ioctl")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index b041639ab406..f43baa46ec5c 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -105,6 +105,9 @@ static int ntfs_ioctl_set_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
+	if (sb_rdonly(sbi->sb))
+		return -EROFS;
+
 	if (copy_from_user(user, buf, FSLABEL_MAX))
 		return -EFAULT;
 
-- 
2.51.0

