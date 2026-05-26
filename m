Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0B3A3804
	for <ntfs3@lists.linux.dev>; Tue, 26 May 2026 08:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779782907; cv=none; b=Uy6t1C7qsYhLCa2LiEt+33k89UIgBJQJZpHvWD6OCKBrmHI2B4+tCu7HA32mS+66ztuH3Zp4svOHmEXxtZHHhhI8k+++Sb/W0dnQx2AlptZgsg0e84sa+MDBxhPvstOYG29C++78+vVYYjWiqXpEmFaQSOkQ0sKQaqcS8wLLtCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779782907; c=relaxed/simple;
	bh=ijjTZF/51vYbdaN9qZMed7iw9Mndh9T6hRyAEX6o3Uc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=coV6Km8Urf6o1Mm0kQ5B5DDdcyXOS3Tl9svOEHveSjEEFarfF9m4RjavsgfC7huAA3PhlGNIvjGXwYmVnvHr41NWvhEzOF1VVJb1YGpvRaCXkx5+op1LIWcgkNIGY7s6CPl8lkiaLFOIIjnEhdsyzj6GeyDYTs6vV4VV2wn9G10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=TmRso/si; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="TmRso/si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1779782886; bh=TUeQMMcGqjHOXVjcS+d6NPe3AeflS8mPR2r4QJdRONg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TmRso/siSz+aCzlDha8rkVfXZ8MUCivvxW58BozWHH7B+3MmopA6tuOlTEbRCi7nT
	 qtaPb9mBnAi4AumlrxxPrKcDYWlcTTheddYwv8DJagKS76bIzvrQe/mgkfwfr59GcL
	 IPRrmQVeQ8WOXqCh5zD+kltJkSFoaAC3cZfM5MeM=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 20426C7F; Tue, 26 May 2026 16:08:04 +0800
X-QQ-mid: xmsmtpt1779782884thyfjdp4w
Message-ID: <tencent_76C985EEDDAEE04C8627DE86D9D2DC467906@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLGtjoFJ3y9LojDx8e8BELUUWg2Xo6icSGub1PQEEdyp6CluFPJG
	 81g+R+ErAqcuLRuSP/iT2YUVP7du/tXh2qTSKJBqNngi/ATydusXaoERnVXdfDxqK9YgN27hfHVO
	 WtOZol1Bw4uX/uXCLBhSPWxURYiIOuEBkwpTIoYeKkWm7QAFC7DzvcQmMFpeAnypK2ndiWuHdQia
	 Pa0UzaKNJEsyf0iIRJwl0GIx1P7NiHDyKOS+ZMdd+R9Q0dk2/EWrV0mH2Qkxum1s+LJaCZ57MQ/P
	 fL0/E5PasHWrGLqpEwAQLdEKk7CZxkpBCUddQgx8ieyPyqC1l9gIu3cvzKi9IgmJoDB6dlbl8s3y
	 BNguhpaZrfIejwZSuf+DjSqZjv6fNajN+FsKWAZKjBJ/Qi9dxWOCCKh8oBJIWdqKkOQE5GsLzlNc
	 dCL/Cx/a9aVK5HvsDar+HUdLlRT2zypqnFbjoXDZ+ai8k1JR34fqDlH2aJ251FY4JB7u7s26aBOm
	 yJlGZKnmeW3DQfbrmGKqj2bH+Ig4QKjSX6VWk/ezhTeIa0KIR2sMW0Z3/nXPCpfKDkh2okmOR6el
	 vb0S6pev+2KcNVVlpGt7HIflIhzNolmVGyvL5XQBZs3ATemntSXccTulDefZQZ1x5w30G5RGE3Kt
	 tMyLHnJHsfAq1yeV6somAvvM64XNlFBGtDIKEfnr0W+gfxNGocbi0qLe9jg8uwbbwHqJTYyb+qxL
	 sP7RFx/Gxr+SeIpCOSAF2rYeg4YS29AKo4EtRujK9mh3xPTS3rjYWHN6SuOd8MYLzvV8VY18ercW
	 NysyzJJ2PILpW/oNlgfKEIQ3+RB9L7tSdf7zkGvRwxvmjqDiWHV/l5XfXJwnUK3GrGjaNegQ5WyR
	 gNtNFD8L0upArv88f2ASoPDHdUoOLQqU1mDYvnzcUzuONPytiUVH7jaVAlwE9dXspywkeWd06VZ2
	 y+Lp6xw0i+TZsuXVCQTSyFfpHiH9mU1SVn/ZT/H6jh9iVZdKK7Nd8E530eAb3J0OSs9+JvrmUdPV
	 2270lglFJypWqLIy/1
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+c2cfe997245202e46f10@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/ntfs3: prevent potential lcn remains uninitialized
Date: Tue, 26 May 2026 16:08:04 +0800
X-OQ-MSGID: <20260526080803.187791-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a150a09.820a0220.e7972.0005.GAE@google.com>
References: <6a150a09.820a0220.e7972.0005.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The target VCN being sought was not found within runs[0], causing
run_lookup() to return false. This causes run_lookup_entry() to return
false, which in turn results in a len value of 0, and the new parameter
passed to attr_data_get_block() is NULL. Collectively, these factors
ultimately cause attr_data_get_block_locked() to exit prematurely without
initializing lcn, thereby triggering [1].

To prevent [1], the clen check within ni_seek_data_or_hole() has been
moved to occur before the lcn check.

[1]
BUG: KMSAN: uninit-value in ni_seek_data_or_hole+0x24f/0x5f0 fs/ntfs3/frecord.c:2862
 ni_seek_data_or_hole+0x24f/0x5f0 fs/ntfs3/frecord.c:2862
 ntfs_llseek+0x22a/0x4a0 fs/ntfs3/file.c:1530
 vfs_llseek fs/read_write.c:391 [inline]

Fixes: c61326967728 ("fs/ntfs3: implement llseek SEEK_DATA/SEEK_HOLE by scanning data runs")
Reported-by: syzbot+c2cfe997245202e46f10@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c2cfe997245202e46f10
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/frecord.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 7b035da63c12..d511b6a75ae8 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2859,6 +2859,11 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni, loff_t offset, bool data)
 			return err;
 		}
 
+		if (!clen) {
+			/* Corrupted file. */
+			return -EINVAL;
+		}
+
 		if (lcn == RESIDENT_LCN) {
 			/* clen - resident size in bytes. clen == ni->vfs_inode.i_size */
 			if (offset >= clen) {
@@ -2909,10 +2914,6 @@ loff_t ni_seek_data_or_hole(struct ntfs_inode *ni, loff_t offset, bool data)
 			}
 		}
 
-		if (!clen) {
-			/* Corrupted file. */
-			return -EINVAL;
-		}
 	}
 }
 
-- 
2.43.0

