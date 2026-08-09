Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A53F38E12B
	for <ntfs3@lists.linux.dev>; Sun,  9 Aug 2026 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786255634; cv=none; b=AKd02Ts4G+zs4n6f2l0OXQxVi6cd6p0pwIHtTbC5zlEwXjSlTUhU0ZwXzHh7bT8upw2qT5gm7BMyaTBYzUPBzsjRyp40ttSw391bDRr0/tos66+Z8QpgVh9AzSE/GSB0q+xhtqyLw/euW67BfhlnPY1elo/UrhH+bpDiQW8S17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786255634; c=relaxed/simple;
	bh=Vkbo0FQlB1W0mJWcOF0uB7ytrqgJJ+SScvipnq2reuk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=q+ttU2t0TiL7VsQZ3Tdpg3Mnyg6ml2Gr8KaUJSpDTudJhfERePIeR/g5q5xS8/udKf1qBTw5XCsw830jDIKe0GTj2nP35EYlNTofFUBp7lLgCW+wjMnxG74RS7aBojmgz93tZYomGT4r+TH+WJAA8cYHeenmNdt8e41l1Yz+w5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=h2QxeeiA; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="h2QxeeiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786255626; bh=8zSH2AzluL6FSBpC7B7ZDsjfmuqyXlEZH2k9LWVIJmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h2QxeeiA2s9uzChOSNqz2jtzaAKgZAatNooeW4MUjk7s/Y8nqwShqwCvNMWhIG7p6
	 kQeK6E0aHE20+r0FT3Jf6o8di+NLs031J86YXKuvBllP7cDVmn1xhLLrRElwGEG+3J
	 z1vxm5OCGQbSOMG/Kq0N8V4kCEGNFp3rdqA+WRtM=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 1C39A6C2; Sun, 09 Aug 2026 14:07:03 +0800
X-QQ-mid: xmsmtpt1786255623tegpyeu6d
Message-ID: <tencent_1C66CE3D8B3704962236124B067405761909@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuLmCtP6lT0ijgG6ZVn+4Oa4EvRUjCPgDBHSZ8XZpnRP+TxY1i4s
	 CIL5T1U34UaN3j4wkdC/u2fUajEjcLRvzykT/F/nsKpaSWr7ec08FLRXa0F88uqKa0OvcGmjERlE
	 9vtHNxroP8WILmlFymOoyz3cI6bG0FEsFBNFpqjllttpj8FnOIYINYkY4tnAOIFhSXt7xNHGcR2y
	 Cx8b8vqTLbhcL5E0YkP67JoKO+1o/jLaiMgv9gSd44rLDkPQ69RsYRANnM4BEkw4VM4GKdVsIriA
	 EhOP0GKjKAtWO17HtEOuoTUzIPdDHu6X78jRmQBuvH2oLAn/pF+2UJdChenPC7begjmgjg+s5a5H
	 dtDfcupq9iq6ydOl/VSeISrJVDPrBKpE5k0TIe20LsWKUsi+Zvw4Evd9/srgzv+17mXalLubEuiV
	 gvm67thSekW5s62F7O7WjCfWbRDL20Sto/HE8N6AxIerftgRSNHNqxgOvqgYSwg1+3xXcjRuloMz
	 UIkr2vmUUtEoH4QmAT+iEoR3/28JIbk+otWKJ94/bX74QxAjxCxp4ViPUmOppGhpK47xA6BBvHiI
	 XeVFSufYCdcdo+3umLX2jr8r3BJVXGt4wdSZ2/xo/5OO58qjNcXzxsDsga0jvTkoZqYDkPGIMuuw
	 BFuhCGNroCEj+nhvzXBg1XwGHNl9Vt1LxnDq2pekdlmW581y8Esfg3fJXGfWMl7c/Blwj5ozwJWm
	 wNxpgYv59fTlm1Oy+W//Hj+/OsmBqhyH8wR2cQzi4QMzuD5AzX5MgREZvAQAALKJ5DhAx2BKvYIJ
	 gnqiqzxKlREjDYCk9Hl22NhMarGJ2ODmytg7BnDhfSQzkWzLaGwAU8EPaH0Fiz458vbhY/al+SIb
	 E3iVAgf0osXzqrGrA5BtqydpasMwGeYANaEGPZcE0LIjClxmjo4yLqbHGdjp8XxA6dHztfRIsdXs
	 0IuWzJAdRAa891+WsQSMkV1fiWlwvI2Elb8ZJ23fnajScPVNtNb4eknrZAGLDRJaF+WQWQC7x9gq
	 FAun10KyJeOIHC+TuZML3EQ7fLdv3HVmw15k6FuAleYwF30BChHxLM84qs52U=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4c22f022eb39c86b9d19@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] ntfs3: Update only the member values without replacing the opts pointer
Date: Sun,  9 Aug 2026 14:07:04 +0800
X-OQ-MSGID: <20260809060703.28714-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a778cc0.01d0871a.3a0d52.006c.GAE@google.com>
References: <6a778cc0.01d0871a.3a0d52.006c.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a potential race condition when accessing options during remount
and read operations. This would trigger a uaf [1].

CPU0: remount				CPU1: read options
==================================	==================
do_remount()
reconfigure_super()
 ntfs_fs_reconfigure()
  sbi->options = fc->fs_private
put_fs_context()
 ntfs_fs_free()
  put_mount_options()			ntfs_show_options()
   kfree(sbi->options)			 opts = sbi->options
				         opts->dmask //trigger uaf

The fix involves not updating the sbi->options pointer during
reconfiguration, but instead using fc->fs_private to update the
corresponding member values.

[1]
BUG: KASAN: slab-use-after-free in ntfs_show_options+0x656/0x800 fs/ntfs3/super.c:762
Call Trace:
 ntfs_show_options+0x656/0x800 fs/ntfs3/super.c:762
 show_vfsmnt+0x637/0x780 fs/proc_namespace.c:129
 seq_read_iter+0x8d6/0xcb0 fs/seq_file.c:273
 new_sync_read fs/read_write.c:493 [inline]
 vfs_read+0x59e/0xa90 fs/read_write.c:574

Allocated by task 6027:
 ntfs_init_fs_context+0x55/0x570 fs/ntfs3/super.c:1862
 alloc_fs_context+0x9a3/0xd00 fs/fs_context.c:295
 do_remount fs/namespace.c:3392 [inline]
 path_mount+0xc5e/0x1040 fs/namespace.c:4153
 do_mount fs/namespace.c:4174 [inline]

Freed by task 6026:
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 put_fs_context+0x123/0xb00 fs/fs_context.c:498
 do_remount fs/namespace.c:3419 [inline]
 path_mount+0xef9/0x1040 fs/namespace.c:4153
 do_mount fs/namespace.c:4174 [inline]

Fixes: cd39981fb92a ("fs/ntfs3: Fix double free on remount")
Reported-by: syzbot+4c22f022eb39c86b9d19@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4c22f022eb39c86b9d19
Tested-by: syzbot+4c22f022eb39c86b9d19@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 3305fe406cb2..58540491e68b 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -461,7 +461,7 @@ static int ntfs_fs_reconfigure(struct fs_context *fc)
 	}
 
 	sync_filesystem(sb);
-	swap(sbi->options, fc->fs_private);
+	memcpy(sbi->options, fc->fs_private, sizeof(*sbi->options));
 
 	return 0;
 }
-- 
2.43.0

