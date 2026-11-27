Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773554;
	b=SBDXI8eOrwuPlV8GiRRAp9NqBlleMk4YezJBmF+aEHgZFfIrdDIk1RSBXbjPPqyKL1SS
	 40juP/S1MLrj/pTaC2G6DJBzok3o5FeupoAtcn6UdINXuvhUq9L0v1YH95CrTOvxFOvgO
	 9xrZgalg7fZlUz1i3apQu9sKfNtdu2vCtU/wxfZNXLat8HOsw4d8WKLtXHp+sz7uIQ+iS
	 JDh3c0vAlNXlyxaO6wyKzepd5/TGkrcnd3/mrZYkd/StzX6sVSuoVdO0He/OncRo1OLAT
	 G5+imlwI+I37YKaXLnalwZoZqDAVLZ2N6LMHW3y8bOCrrpv+zA7H3zDgs8s0rpshUuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773554;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=baJ0mjyslci1WDPJ+WAvlMf5kc9rL/LQw0lo569JThw=;
	b=lgYc/2lYqrOHNwGhhAwXF9iRgxuoy4YXN2B2q97OAMGQhZJCBue70CKsHqISAYLBFzRY
	 fW63YviTtjxq6RPBjUwn8btJUoGMYiWu1tHUuh6DcvZvaKcZyTp2kJi/xC1ffDKdCpZsv
	 w3ugSTzKgBngqfn+RcZDN1F1FHBbhKbcLa4t16QCjYNeudN3rlJnTY0cnT5tlcJpZdvc6
	 UmaTIsC/J6Hly5Q6NZnUPEueFmOmgKvpSO9XsZ7gFbiSqqWFhcDKFOrOisIN/eZXvnRMq
	 ZtnBc6MG2vXS9x3qGT2rQG4QHc8cFNmcTaTl5DKL/W+EKuvY02ThMAUnWzyH9+ToVkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=bPXTnPmy;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F2B606A69B
	for <ntfs3@lists.linux.dev>; Fri, 27 Nov 2026 09:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F2B606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=bPXTnPmy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795773538; bh=baJ0mjyslci1WDPJ+WAvlMf5kc9rL/LQw0lo569JThw=;
	h=From:To:Cc:Subject:Date;
	b=bPXTnPmy/W6KudIujZzit3pDAEr8pWumOZWpGLDIFHCP6mos/eoX4TAFYT0GAZrQM
	 hgc7M5KCEIxyEidh4uSMFrLJe44g07e1FHMLieQJoFWy6U2rE0zh2Q6xchdojxSeK7
	 hoDvq23bvi13zWfFWvkIALT+iAIX4BVEUIDLNtDI=
Received: from shuai-VMware-Virtual-Platform.. ([39.165.245.102])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id EB83566F; Fri, 27 Nov 2026 17:58:56 +0800
X-QQ-mid: xmsmtpt1795773536t7hof9yn8
Message-ID: <tencent_17D1FD4EFA98C54A1EA1E90D37406C602205@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJQ6Sfm5w8eYU/Xk+Y1uGIhZj1xhO5GXZdFMMMFadOMDiz1w59Dc
	 Mh8IqvXH8lV8GTB9yHoAS3y2hdTDfsqaXM08duaBAHwr2Z3nn0sLB4zPHKsHNzeRil7FL4+KYKy9
	 F6gpOrI9bJap/oHnvXiWSro8R58kO8qEC7ToLszQ4tq/Ev6zAUyCv/zfvZa6nMR19Jzn17brkPP8
	 6HCA9/byNxNT41Cvzir86Ei3iZPJozJoo8acRhee3QwTLx8dXVZHVV6QMWx1gOQW8BEOQHuNHIT0
	 eH6v7Vb/EVhEgK54++5niZM5sK0R8gtdqd/+PJT0VIhJ/XLuXyMZyYi6gD2KXdnxSw+VzZHZTwww
	 S1htuhzXjaUV0bRoiexdvh6zvfLwrAvk/81rZWRGCUPW/h/EsXk+0xnZStJsJgON98DKfobakfUz
	 IJx2gv5N5huboB6tJ89Ihol6P+UZqdVud3egh+QUtmpDqG4rJ4wMt41eqbRiII1ocFgSlthdSl5C
	 dnkePYsMwMryOc4pmrXPcyUpT63HwlYo7OfgVX1A5z3QM2ZYa/dpSL/c1aNhHKGb7VrvXU4s8JEa
	 Ms72KWt3h59iqAkJvxuY8slDLN+BQIderrDQ8Jxg52SvpFjkR27Fi6AvnDFUzkQIBzhCuniHG9ro
	 71t6WwN9zFjIcmRZTFLLMhkPDF8VjSx15ed/gAqmNH862zFJPf0WEz81b5lLWd6mJM0lquqMnDXD
	 LdBjQQ8xVI9Ej3pfIijK5MR/og+vdnNp7kD7ceiUbZbPQ/3vrZfWiPobaJY1F2aASh/M0jD5UKHO
	 XMiVA/7kU2kpL5gCb7et/moYyhJyTgOQrXkxi8Gh1YYSlq8jMegCJus3SRk7cBrgMvmto/OUyx+V
	 DIOPdJJRNE6/nAzMFnauYlg5poH+LW1eJYo/2fVqHvpyiGen2iv/Otix9itWwUFHTdakH/HOOAJe
	 t24dAPHaYtPlV8L9TcBswH8MkYSB+rgLCkuilPtPGEg9qhodEeIyoQsRC+K1BSJVjdrzFGsfukFb
	 2la3AqqHy3hBIGFeXNnjdRPx+R+4venb2BNOuba1w7pmL+9NzdrNbeKLTAFcujvVxX0esGug==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Shuai Liu <847807867@qq.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] fs/ntfs3: handle proc_create_data() failure in ntfs_create_procdir()
Date: Fri, 27 Nov 2026 17:58:56 +0800
X-OQ-MSGID: <20261127095856.770026-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

proc_create_data() may fail and return NULL, but ntfs_create_procdir()
assigned sbi->procdir unconditionally.  This let ntfs_remove_procdir()
call remove_proc_entry() for missing entries, triggering a WARNING
at fs/proc/generic.c:742.

Check both proc_create_data() results.  If either fails, remove the
one that succeeded plus the parent dir and leave sbi->procdir NULL.

Reported-by: syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com
Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/ntfs3/super.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a8012..6beb850fc1dbf 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -626,18 +626,31 @@ static const struct proc_ops ntfs3_label_fops = {
 static void ntfs_create_procdir(struct super_block *sb)
 {
 	struct proc_dir_entry *e;
+	struct ntfs_sb_info *sbi;
+	struct proc_dir_entry *volinfo, *label;
 
 	if (!proc_info_root)
 		return;
 
 	e = proc_mkdir(sb->s_id, proc_info_root);
-	if (e) {
-		struct ntfs_sb_info *sbi = sb->s_fs_info;
+	if (!e)
+		return;
+
+	sbi = sb->s_fs_info;
 
-		proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
-		proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
-		sbi->procdir = e;
+	volinfo = proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
+	label = proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
+
+	if (!volinfo || !label) {
+		if (volinfo)
+			remove_proc_entry("volinfo", e);
+		if (label)
+			remove_proc_entry("label", e);
+		remove_proc_entry(sb->s_id, proc_info_root);
+		return;
 	}
+
+	sbi->procdir = e;
 }
 
 static void ntfs_remove_procdir(struct super_block *sb)
-- 
2.43.0

