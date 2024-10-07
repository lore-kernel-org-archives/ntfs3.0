Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2CA4C91
	for <ntfs3@lists.linux.dev>; Mon,  7 Oct 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728299722; cv=none; b=Sz7MHs6OPfcowQpRIDBgMo5ZfcnL1KHPvnWsV+eypQ52GSCU2cKJTAFTCSVnTZkjXlWPvfHhfn54wdILYhvAWFSYShrIZjls41qT6TCqCB9HBIWrdWYyuCVQu5kcEIvPuE0aB5JTu1RmNBRsj/UrNjaRPyqWaAjFkDoBlodj8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728299722; c=relaxed/simple;
	bh=IEogS7qBcDkIxH/lDa0FbA0H02Lh473WsQ2JuEKUmU4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=SMM749L9Gr09qVHAfuVtkCEnsDOqIK5e8x4dhBCLXJGdFtHLsJlvf+fgSIeljp2hfTrpcPhtmHKpChyJCRFHF2ZSo+vpwBWcOctRNvesgwPRDZblJ3MCQ6ePXc8E8yAHoyFRaAswYb/v8xj1SSi2VbVHkpPnQsOCL3H0w/dKDTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=pJ9Ugfhj; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="pJ9Ugfhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1728299401; bh=sI7g+cXO6Bskawnkt36EGxrET2f84T1y5C8hHcCBfok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pJ9UgfhjaUq6wdmXK6lnL7U/N4DFvmLoVSzcc48mAKdr4k5NSDQHKkewezGPgeG00
	 I7pKbHJdWwlVCM+qxHKa8HynCANcHHKHS8K2KsjaQ9P/lbnUolp63++x/3D8kapB3E
	 VTi53O8eUajQnuucGlKjdAQrEXaYc566GXa+exkM=
Received: from pek-lxu-l1.wrs.com ([111.198.224.50])
	by newxmesmtplogicsvrszgpua4-0.qq.com (NewEsmtp) with SMTP
	id 27B35876; Mon, 07 Oct 2024 19:09:59 +0800
X-QQ-mid: xmsmtpt1728299399t6j71migv
Message-ID: <tencent_EE134FDF8DFFA5E18D84121FDDE5DDB41907@qq.com>
X-QQ-XMAILINFO: MyIXMys/8kCtYudmUXYSJ7u8+QYzXlmuDhVI3C+surwzAA+C28q9tBvOvoYoDI
	 4T2h8VEVr28UlMwqpNE5WlISBSzHPAIpKlE48bzO0Ww2XF3qWtUjiLCxV7WKNJP4bYYZksyM1e6G
	 BIAi8iIhk4qCh+iOjjDJqtFOl57Z24WyxdUP9iIn51M07ZG6IFAkel4Dj3QO86GZbqeMFcJjFk44
	 oQkke1zWqT8/voUmlNdMBAqB6QFV8qksG9DzLKqOQdhxSJW5D4IKIw0/aHkJvOCUM9OCxNcEHUzV
	 QYcxEA13TXzcxXaa2Ll/KJczcgFmhwAy329oqoUEBJs9o/RCB3UKw+LqEvVS+nIQzOuZmxLZUl/w
	 Eajg6J3BbWU6jWXk2lI86EmQgmwi7FEHlMcNSC2e3zPzKQLyi1czcbCa6Lou6DsdzkxMbC8G21ct
	 dPRyOljlA9TFMyJ28wzpblKQW7GKefnJ5+XnZWZ4nSM37hoV5ZgLZMe7uc+dO1RxaQjS7BIX18kz
	 lBw/BnSPGUd3gnqK3W6a4JMlffv3jUXaGUoM4IoMASJjvrm44+iEG1QFV47HZU/zQKuVIA7O8Uuh
	 auiu1OsHdZrIVGx7w93qcAI6A5qW71zOCjwM/YlZuGNuWVrrNT7xfrCwnl8JjVh7kiHBgIPHLp3M
	 F+rauaxIZLvsBey8KmJGcPszYdrr/Os3uqWyhXoHo7GzTt8H2Fv+q/FlGjy2HvXj8OUHreUPKfXG
	 dZ5f8xijwoQGyX8bu8/FfWSoPXunvLKEJGbZbJeozro1dOwpMsM3uRCuafovBWTmQuo+nYH3it7Q
	 9QMI0DsD/j1JdDJlOyw/XrpJLIC4Lc3KF1kuA1aJH4lD5moo/W4ZJ9KWTatHtdZWFaGQBgJWMLWa
	 eZlUKr88jYzdvIaui53AMxuI4N3h4xYkrLBVZ1CA8tLqvsO2LtwXiaoOqxyNNW6/aagQHvvlqr
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] ntfs3: Fix WARNING in ntfs_extend_initialized_size
Date: Mon,  7 Oct 2024 19:10:00 +0800
X-OQ-MSGID: <20241007110959.3380145-2-eadavis@qq.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <6701c108.050a0220.49194.04ca.GAE@google.com>
References: <6701c108.050a0220.49194.04ca.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a WARNING in ntfs_extend_initialized_size.
The data type of in->i_valid and to is u64 in ntfs_file_mmap().
If their values are greater than LLONG_MAX, overflow will occur because
the data types of the parameters valid and new_valid corresponding to
the function ntfs_extend_initialized_size() are loff_t.

Before calling ntfs_extend_initialized_size() in the ntfs_file_mmap(),
the "ni->i_valid < to" has been determined, so the same WARN_ON determination
is not required in ntfs_extend_initialized_size(). 
Just execute the ntfs_extend_initialized_size() in ntfs_extend() to make
a WARN_ON check.

Reported-and-tested-by: syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e37dd1dfc814b10caa55
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 6202895a4542..c42454a62314 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -178,7 +178,6 @@ static int ntfs_extend_initialized_size(struct file *file,
 	}
 
 	WARN_ON(is_compressed(ni));
-	WARN_ON(valid >= new_valid);
 
 	for (;;) {
 		u32 zerofrom, len;
@@ -400,6 +399,7 @@ static int ntfs_extend(struct inode *inode, loff_t pos, size_t count,
 	}
 
 	if (extend_init && !is_compressed(ni)) {
+		WARN_ON(ni->valid >= pos);
 		err = ntfs_extend_initialized_size(file, ni, ni->i_valid, pos);
 		if (err)
 			goto out;
-- 
2.43.0

