Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759110;
	b=AFCNXmHSJwI6iV7MPN0uWk806P4bGTnDhYnk2zbJ0TJ+zPDBJf9fyXDJn/7z2Kr2gggd
	 KSbrSgZyL/hrTacnehEQbzsFTDf57HoqGFyn5wHr8apqJBNxjR/UcP/9YDvr98UZV6wu0
	 zF5d0CSzeJRqGOS/Mf+SkgVvNvHYy2oqudBFRH4az/hpq3K6MJDsF2Cafcx6MXtAuFoVu
	 fMB3QB31HnZtTBkKzdh5C9p55uGFZ0NwW8R2e8zQpTDlq2ssHPWZSOQimeJFlfd8afPVp
	 vS9u7aNUaqSeNRqzf59kFmyjC0TTmiVZ7JICTkjNIgt6HYsgha/cp0VzuzFgwf/UMAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759110;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5p/W2bprmFnDBAIG0avEYzrbMepHuFa/JXotPOHUHKg=;
	b=lCQmV4vP0PO/xCadsC/FfO6tfYu1DwXB5aOMvutLQG9rZwfHj4MS9lvpdu8z3Yg4uGqM
	 P1M5tSisToS+cfczu4prb6ohOopnkhXQhJ3yOhVYE5Hqc4rq4gl5jEBbhQJCeFErKvSUk
	 QAV9OW+xRghxFtZdwQEJs6bqIhIO+q8iRztZKy/i7OHI9+pdW1AXYlg7Lay0x/none6x/
	 M/ZtEK75kmITEiFHXwHacTqXTm9rNjOWuNtYqUP2+Jxuz8qMLxg+0DxN0rvVQPl/pl8xO
	 Qcv3pTOeR304Tcndb7OymMryx+3gXKm2POj0d386c9ssvLustAewa34T//EbDIRPSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=QkvMHf96;
	arc=none smtp.remote-ip=61.135.153.163
Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B7B606A327
	for <ntfs3@lists.linux.dev>; Fri, 27 Nov 2026 05:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B7B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=QkvMHf96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795759107;
	bh=5p/W2bprmFnDBAIG0avEYzrbMepHuFa/JXotPOHUHKg=;
	h=From:Subject:Date:Message-ID;
	b=QkvMHf967hJuxGH9R85yhVWiwn1dKeMBF7Nk0ra4Mh1jaNNAj7QjWei/QLxJAhvmo
	 CgHBc133qXWfRa01zzkqjbyEDDQKkTPtaOEGmDMK+5VHHErcKE1C94Cv3viDCZh0k0
	 Ov5O5db53T7TaIWAx//FRD/US7+ZZrd9oS9yS+cE=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.32) with ESMTP
	id 6B091BF6000054DE; Fri, 27 Nov 2026 13:58:16 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7957624456832
X-SMAIL-UIID: 200F0F56D93942D996E5A3F512366FE3-20261127-135816-1
From: Edward Adam Davis <eadavis@sina.com>
To: eadavis@sina.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] fs/ntfs3: reject remove procdir if create failure
Date: Fri, 27 Nov 2026 13:58:13 +0800
Message-ID: <20261127055813.58182-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126110326.39235-1-eadavis@sina.com>
References: <20261126110326.39235-1-eadavis@sina.com>
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

"volinfo" and "label" without checking whether proc_create_data() return
NULL in ntfs_create_procdir() and set sbi->procdir = e, potentially
hitting a warning in remove_proc_entry() for remove the label dir entry.

Add a check for label and volinfo when create the proc dir entry.

Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label")
Reported-by: syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d7aeb9ab7b1cc022914e
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: 
1. add missing volinfo release if lable create failure
2. return after set procdir

 fs/ntfs3/super.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..a71628b9489e 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -626,18 +626,30 @@ static const struct proc_ops ntfs3_label_fops = {
 static void ntfs_create_procdir(struct super_block *sb)
 {
 	struct proc_dir_entry *e;
+	struct ntfs_sb_info *sbi;
 
 	if (!proc_info_root)
 		return;
 
 	e = proc_mkdir(sb->s_id, proc_info_root);
 	if (e) {
-		struct ntfs_sb_info *sbi = sb->s_fs_info;
+		sbi = sb->s_fs_info;
+
+		if (!proc_create_data("volinfo", 0444, e,
+				      &ntfs3_volinfo_fops, sb))
+			goto out;
+
+		if (!proc_create_data("label", 0644, e, &ntfs3_label_fops, sb))
+			goto out_volinfo;
 
-		proc_create_data("volinfo", 0444, e, &ntfs3_volinfo_fops, sb);
-		proc_create_data("label", 0644, e, &ntfs3_label_fops, sb);
 		sbi->procdir = e;
 	}
+
+	return;
+out_volinfo:
+	remove_proc_entry("volinfo", sbi->procdir);
+out:
+	remove_proc_entry(sb->s_id, proc_info_root);
 }
 
 static void ntfs_remove_procdir(struct super_block *sb)
-- 
2.43.0

