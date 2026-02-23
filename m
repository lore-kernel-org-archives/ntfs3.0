Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BD35972
	for <ntfs3@lists.linux.dev>; Mon, 23 Feb 2026 08:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833688; cv=none; b=ojitf08OpalW+qD61sCVwV3GtNhdWghAs2+NM22t45RkcSzFRvie/YPEeISoAY1r0zam7Vk0whwlZtu0uqrEmaqGJWBP1LWywYJVAXQzxjYMH21E0+9rLeF+wYK8Aga8Sl8F6b1nUNhFzp2R2lxxP6NoQWTjMLRYAYc11bkJRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833688; c=relaxed/simple;
	bh=eeNMf+1v2/DdwoX20intrYpI/JVD+VHxMrru33XVD/o=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pCwbVdtm5U372rb4bR45iEE2kDfPtiWyHmLTq4CF0zMnEW68rrz62OYOtE4Qf03AR2/5EWBU4kKn/vQqBTrBJZyV+8z/CcR5Ma6XDeG+eskUFwQ4lqOgdctGZuxnoAl9+/flYTMGMZPQaiSlu4P87MY0hGXu6TZh9fhOZIqXpp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jp8n2hlH; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jp8n2hlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1771833674; bh=tmuJKZp+863DIJamI/7WtrkZIq0L3gc+hphOBQNDvcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jp8n2hlHLIszvsi3YfNQqxDOADCB66YDzxN3BtsTWq55Xbykutq9wcD7v0/64HzI0
	 OnBfq1oI2uH4zFvUX6gicgYp+od5sWEuU5gxeQ+wFCl67UsBQziyNdDM9zxuJG7H0F
	 PQ83nZHOWDTosdOdo7KMKVebSivXStr8Dsb3JyVs=
Received: from lxu-ped-host.. ([114.244.57.237])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 4C3CEB5; Mon, 23 Feb 2026 16:01:12 +0800
X-QQ-mid: xmsmtpt1771833672tegc25294
Message-ID: <tencent_24B18DF3926D5DB85DAA195F4FBD0D8E2507@qq.com>
X-QQ-XMAILINFO: OEUhVsHQax4MC61P/jurb6jQfwtFFRnv1XBLy9rj7rp+ZGTrQcLXOMAUjVoVPI
	 1sk47FCaCfg/lQ/IRqg3AmwI0Cq2uP79zZ1pQpDvzJNudmGPFv887WuULNmRpssjGCKtVeytQMjU
	 EsagUSjH9GkW+qr6yMLwJ5zAgv8iNtRFsqF23gHfz+lZEj6CFFHk7wPJs2vD8pL1aLtLxo1ULLb5
	 ygXCCgfwUZ3ITBDeQsevInmZ4QC8dEJPWYpxGqZ9x0anfZA1gsEVy0ak50IvARDyLClULBpv1cpW
	 fV8zhskAQ6kUrn+WKaYX6+0otpDlQel+FaeE1PDPzCiv2c9XuYZirL9+bdDx8mGT48Nl2FD6MivC
	 ipe0NViKn/71IM9QRlP+LCZCiLRBNTZNSgHaIE2EweX7dcbvYWUVJMlYUuCbvHn1h46lbvqZ96a4
	 T6cVJyfwseWz1Z2cpLp+epEOmnucR5c2KOha7Dj9hHlCNqr9ds+H51pYvjEhuwBkKcMoK+hVQs2o
	 27bfB7qYhKNrtUjjF5fTIaA7O8Qt5dKkaiaZnYUAaJQMGHpeKf5N+hgN4I9vKqzv0/4mWkMHOPzn
	 oyQ9xixffa7qh9sRWaaSUd6RETekdXnQcFQFymJ1+LYWQBhgy4uwmxiVEW3N87i1+FSC94XWB90L
	 K0Ns1C61Uuid7qFd2LT2F/YG+0a45k6yap6cgI5jGN4A46GQwNB9zGgaqhVpH7MUzHEOY7MU+Gih
	 wSk5/XK+S2RNH8kNnm785+IK/KL9UXsq3kCm+3k4Q3ty9pZI3w1Jrxwtybx9Vz6QJDba29SKG8FU
	 en0SF+rlGofNmIiKAkcQxYdEyudgxYudxyirsrr4IT6dP+YCgtTOzZmV4zlr3ZgJSI5TkbTvde8T
	 t1IXn7Ug/XaRZdmbf3frQrkAridCHN0/vWMKYluU/Dj3Rf2Gsn3e92OyvaI4C6wucK95/XKZgK3m
	 DOOpYAYWiLIYXGQDbe4juY35joI1ERi3noHuZ5tXyVPPndn5oIgK76xzea85ZFGUekD4fTl417WZ
	 HOV2U81BvNcKMcPqea
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/ntfs3: prevent uninitialized lcn caused by zero len
Date: Mon, 23 Feb 2026 16:01:13 +0800
X-OQ-MSGID: <20260223080112.32239-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <699ae98b.050a0220.340abe.0d30.GAE@google.com>
References: <699ae98b.050a0220.340abe.0d30.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a uninit-value in ntfs_iomap_begin [1].

Since runs was not touched yet, run_lookup_entry() immediately fails
and returns false, which makes the value of "*len" 0.
Simultaneously, the new value and err value are also 0, causing the
logic in attr_data_get_block_locked() to jump directly to ok, ultimately
resulting in *lcn being triggered before it is set [1].

In ntfs_iomap_begin(), the check for a 0 value in clen is moved forward
to before updating lcn to avoid this [1].

[1]
BUG: KMSAN: uninit-value in ntfs_iomap_begin+0x8c0/0x1460 fs/ntfs3/inode.c:825
 ntfs_iomap_begin+0x8c0/0x1460 fs/ntfs3/inode.c:825
 iomap_iter+0x9b7/0x1540 fs/iomap/iter.c:110

Local variable lcn created at:
 ntfs_iomap_begin+0x15d/0x1460 fs/ntfs3/inode.c:786

Fixes: 10d7c95af043 ("fs/ntfs3: add delayed-allocation (delalloc) support")
Reported-by: syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7be88937363ac7ab7bb0
Tested-by: syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/inode.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 6e65066ebcc1..eac421cf98a8 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -822,6 +822,11 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		return err;
 	}
 
+	if (!clen) {
+		/* broken file? */
+		return -EINVAL;
+	}
+
 	if (lcn == EOF_LCN) {
 		/* request out of file. */
 		if (flags & IOMAP_REPORT) {
@@ -855,11 +860,6 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		return 0;
 	}
 
-	if (!clen) {
-		/* broken file? */
-		return -EINVAL;
-	}
-
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = offset;
 	iomap->length = ((loff_t)clen << cluster_bits) - off;
-- 
2.43.0

