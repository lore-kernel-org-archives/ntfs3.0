Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB061F19A
	for <ntfs3@lists.linux.dev>; Sun, 28 Dec 2025 03:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766894021; cv=none; b=BvSHUMpBDVfXYsgAVNU/IF2l6TVagImMs6+HW9pguq9cwhImsSbncpxf5TfbKRTdYm9rAmpHoIaJlhaKeltbsOaOMsczh2lofYCv555jWgL6fCTsbxG5tHV+3ldj4CRt0kjlCwbXE0IO1DbC1pbO0ghMRqSfpiLY2AYJAYpi9oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766894021; c=relaxed/simple;
	bh=R4RaHhgHRtYqHw7sgZFIRRQqKMbkE+fy6iCESmtjh2w=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=bHJbKd3Wfwcz3uFOQVytIajKgmyeXHMGZ1W73LJyICwZO1wZ080xPmyc/cm6piSdxIMwNQAcLzYT9S1OqdeFnyIl4aiBdmBPx6T9LgFXJLrVkaM9P0kfTgujClOMVSza8/1ku72acjh5AanFJ5PcVfVJQdLzbDtESkheyUQL/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Q4ajDgLh; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Q4ajDgLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766894008; bh=Uwswnz/YOqpctSG1gRalhVsZaA5kCtxEa+XJ1xZHYrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q4ajDgLhhFrLEzyYsii6+Ur2oMHPjSv6QKzMBk9M6Hi+/6myLEwLOk7dGxNMHzPoG
	 dQtK7akzNq2ZjAOBdc5WoUSk5FTv8NUj/OrpwkKfHHI7bCTKygSOZnzObHaMYbCpsK
	 wvQUPK7HPYlyehUgD6H7ebEI/TtGwrzqEgGaRkpw=
Received: from lxu-ped-host.. ([111.201.7.117])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id D5911EAC; Sun, 28 Dec 2025 11:53:25 +0800
X-QQ-mid: xmsmtpt1766894005te7zby2rk
Message-ID: <tencent_D46CCC9550EA26ED7ECE4079366D542E790A@qq.com>
X-QQ-XMAILINFO: Nj+lDvaLCxoMVYmJ5AEVjQ7dgqCEXFVBVKJglVQwE05f1/c8H71kTxuMW1y7dx
	 sharozbYNSJWNlG1ww96s7ODenGx3mJJ/QUuymn2OrTPtiPl8L4ph1+bwALmvDrk82pHspqurJAG
	 YVrJeyOX+ST6rMgplu05Q7xm+qO6LOkEIefD1ZKuSv2IgwuS+AoQ6Y0z+9OR3avSgkss4eYp9v4e
	 7DAfKEnExz0X1rpDfWYZawhY1BC43X4rsp53tjWLhGToQznSPzKkgv5tpevwHM2vIHSG47SfxB7q
	 UhuYbrA0FG1acHq0plJP+HgAmGeZ8U9e83OqUMgceNlrk/sx4Ci3vGgutAEDBQK35V1hz5XcIP7F
	 Ucg8sJRcg1kLNqHJvq09f+VKey2aAtB+CSJSuTD5alXEszajMwVYfOmLO7nVEOkG7e0bO1BTGttI
	 MjF/q0UzkukQvE7MxZvpSZ2gDgf3Q9vhDhHArqRD69armfEva0/NLBduWcfhPZJov0R5lzlrI4bx
	 Mgbzc8MUresAohXfGTy/Z3q2n+DuYdxxjs0/sJd4N9OR7EYgdhHT14krD5Fxcmmi9JhPeq9I3ldy
	 dwlAN0BJ2y/D9Ks1dSQAJpp+JJGBa5PMeaK4UMHuR6LU1emuRwFS+qgDMRZifpRSrsG6ngl0iOnD
	 NQK0zzqEn+dlXd5BCBve9txvCv4XaWnEEwFHdf7t9jJpnjph8v3okMJGgYV3L37YWb84VII1BLip
	 pF/LLypXonL0u0s0azxcbVZHGJ1c38US0zJ8kzbPsEx0YRVY+Ath6EznoaKQE7f+4r2hBq70VI6e
	 caMqksl9ESooMMnRh0la0mLaAVPbkBL3nDwOmmH2x1CcragVBGviGUibMh5/CqbDvl5ygk2BcHn6
	 2Qb5fkOAsxs+It/mCWjBdGJAD31APlQavZoGYxamcEEAZOu3I97TApVlbwq9o05PXVs5zwfHrsZ7
	 beW2xDbQdzf4ULdLBl9RZ+pyEJ2Na0IDK+9PwQka+pr1Fv7t/nTA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+bcf9e1868c1a0c7e04f1@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/ntfs3: prevent infinite loops caused by the next valid being the same
Date: Sun, 28 Dec 2025 11:53:25 +0800
X-OQ-MSGID: <20251228035324.133663-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <694f53ba.050a0220.35954c.0083.GAE@google.com>
References: <694f53ba.050a0220.35954c.0083.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When processing valid within the range [valid : pos), if valid cannot
be retrieved correctly, for example, if the retrieved valid value is
always the same, this can trigger a potential infinite loop, similar
to the hung problem reported by syzbot [1].

Adding a check for the valid value within the loop body, and terminating
the loop and returning -EINVAL if the value is the same as the current
value, can prevent this.

[1]
INFO: task syz.4.21:6056 blocked for more than 143 seconds.
Call Trace:
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:1027 [inline]
 ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: syzbot+bcf9e1868c1a0c7e04f1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bcf9e1868c1a0c7e04f1
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/file.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2e7b2e566ebe..04292674f889 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1077,8 +1077,12 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 			goto out;
 
 		if (lcn == SPARSE_LCN) {
-			ni->i_valid = valid =
-				frame_vbo + ((u64)clen << sbi->cluster_bits);
+			valid = frame_vbo + ((u64)clen << sbi->cluster_bits);
+			if (ni->i_valid == valid) {
+				err = -EINVAL;
+				goto out;
+			}
+			ni->i_valid = valid;
 			continue;
 		}
 
-- 
2.43.0

