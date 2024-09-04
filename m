Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC356B72
	for <ntfs3@lists.linux.dev>; Wed,  4 Sep 2024 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725416930; cv=none; b=GKevkfetoE6rkNv5n/qxEx2bcxEqRXMvqM82RNDPJVzb7OteqfUhsNrork+gayblSGnPBpcqWI/7l79FWLGhILr2FC/eviaKqTxq7hNWqKi8iS1RYnHm+bFLRiS6ylNpUq65I1ThW/aZBE1TUX5av/h0hm3tOyoyvfdTJN7xB/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725416930; c=relaxed/simple;
	bh=UB5bO45PKELmHrazxdIb9mIx/XaGGdS+X5mAU+gKVbc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Gs7Y3suXzWWFsDTKJZBjXRlgr9Qv2mS03vcGM/haRHCZ+i/G8YL/ZlyCAkz74h0bbpw+0YmjIWuB28GJN8AzFOxSZLcQEShSedtCqp2uYgYUzKReagkC9GZ2Hi+5fcypKOdzJL6pxGJJDgbSm8BzgUFDikSGlVrvUbRQaOr5e8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ntT6zUnA; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ntT6zUnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1725416915; bh=dQpW2B8c3G5IFRq8w9lACvQqmGNC5D9rMFE0xjBYFvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ntT6zUnAZ4TLuJ96lgrilwkFrpAyJ+Ou7eHiL/AaUKq/843PFB4AK3DECljE0Jo1i
	 Ns4ZX6CU6QoFkPPrz+qoEnRP246RbSF69yoiD9MeoMu0POrwwv9C9kzjTFB3ialnX3
	 rGHhVPUCw1czzElJ8e/CqjA8+SFVdDffr79ivDBQ=
Received: from pek-lxu-l1.wrs.com ([111.198.224.50])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 72110C04; Wed, 04 Sep 2024 10:28:33 +0800
X-QQ-mid: xmsmtpt1725416913tc5p9fywx
Message-ID: <tencent_A84BB764577146D01363A3640961A3B06405@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieS8WZptlgCzTpeuA20A9Vsj+T8LNRjrmLmqUQH961VayuiFfRK1
	 mzHi9HzI3dpgNjl7VoFLLPUJUYQuf97NApmDdUAl4v3yxLdOIdFeKT+WH4n1GSU9ilpxiGMh2Gyg
	 6jXn+fm/OcNM5Wl7xbj3QyxHCqEIqP/PO4DTLk7Lebn37l1Tlm+Q+HoQzwaKZqx+rqaU19MD3h6K
	 vROF2fWQsBj3ZOjfbfJPWlZPBAAjjUCAwW950UtZkFN2b2lfT/F8AnHqLK/KQT2dGP+yAHFbHO5t
	 vtVmkF+QwzJL7EfPnQoqSkFI2m6ySN3h54DuVVB40Us8TbNIEIXVmG/OTHecRlp1iJTBSahlHzhr
	 dC/HmOI5uYpH+eY0tIjS7u/RmBbCjQZfY/qaLlS+N3uHJ9s+/aVHAOGwhIvNuU7yidXfLcnDjLqm
	 b1EP2q6exhskl+rlPd43EIglCEZJc0rzHZeD63gCEoTObRNzm17x4s1So12xwR73PPQQRSGqcIk0
	 0ilHV4kBxZ7oeARAMa/DDmEPg1XdhXn88gfWrKFdU0bi5x16zU3aVL0JO7XB70SH7BSwNHjflUOt
	 lPnhZCDLi/RRBzQIwqtJ0Q6/5iF2RiyrTIRIb9fAuBob1InBDSmQISA8Bz8BKpoMPJ5mUQ3ZxVD9
	 xSsvzTja3jMh5phV6/mdu4lxT6nd1LJmsVOf9fZMwbMSe2S0Lbw1g0Noxs0CPgF9RGEhu0HYrcwq
	 P5BkaJxPISbr7crEWrbS52JpVREkY2+Vs2ZzIbtXGjFC6zdFYzrMM9/2Z4BEXTVkc+Q4kgWRA74F
	 UWNT3RrbFc0q2sMFsN+ATuqYX1TaPjWPtReTrSleSRKQhYrmTV7rgFOeyTr3hAzKPTYZjsyxm1Md
	 m2iToLB9IbQUaNvbptXWw33j7sMVNjH0rXK6E3gOiBLopJE2+sL995+ScF4IpYuKTMgzHAL43nw2
	 BvndZwcNM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3bfd2cc059ab93efcdb4@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in mark_as_free_ex
Date: Wed,  4 Sep 2024 10:28:33 +0800
X-OQ-MSGID: <20240904022832.3529734-2-eadavis@qq.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <0000000000007a66c5062140e8f9@google.com>
References: <0000000000007a66c5062140e8f9@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before call this path, sbi->used.bitmap.sb has not been initialized in ntfs_fill_super.

#syz test

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index cb8cf0161177..8970101147c7 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -1057,11 +1057,14 @@ int run_unpack_ex(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
 	bool ok;
 	struct wnd_bitmap *wnd;
 
+	if (!sbi->used.bitmap.sb)
+		return -EINVAL;
+
 	ret = run_unpack(run, sbi, ino, svcn, evcn, vcn, run_buf, run_buf_size);
 	if (ret <= 0)
 		return ret;
 
-	if (!sbi->used.bitmap.sb || !run || run == RUN_DEALLOCATE)
+	if (!run || run == RUN_DEALLOCATE)
 		return ret;
 
 	if (ino == MFT_REC_BADCLUST)

