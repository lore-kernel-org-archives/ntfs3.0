Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA643ABC
	for <ntfs3@lists.linux.dev>; Mon,  7 Oct 2024 04:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728276090; cv=none; b=AS7Y+r6IDwLcrHs5H+ebo2TRUE+4HAABpaNUZOuEqpEBe87YD6jkxhvuV28O7spx5rc8F32Sa5WQxSkpwzdUwUmH2NA5gf9B7v/u+kywiXBU4tD4rHMy4J8ERe4Aq+Nra3DdkUoUXydZNbjeEMffK+UDJ58Et/KOWXcoRxpETEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728276090; c=relaxed/simple;
	bh=MHZaI4MsKQzIsPyXnTS3H84ZAKeQcb5mozP0x1onzI0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=dg6x6qzFJR4UAiNUASKly7I7vg0cSp6aDD0Rf7YHlD+wXxtl8GtUXtznvsUDdVAp8yWjOkBlfyh73l2fIqLgn/0z7a1pRtdf5VjvlPOJluCVdNp8i29A6ZEJDvDxVubqezcmVn+dLY8S9RNSlEZ/IPzWfDJUGoLeVSZmaiukhII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=d1n13pXg; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="d1n13pXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1728276080; bh=IqAwFdOF0faKY6cbdSX2nvTig1aJYTAQJvG3ISaHwCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d1n13pXgISHv60jzY7vor5XasoW/tvNlvCw8uEJEq6Hj6AqdkwLkp69P8FFil+lhK
	 m/ZsQv64CSZUN21dVVpmCD3ezCCMcDo397AUsFayfv1z3l556KlENhcYR4d076bPQ6
	 FyuCgc+/ObWtg80Zm33pRIIYR5izSGA8Kk4sJWi8=
Received: from pek-lxu-l1.wrs.com ([111.198.224.50])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 6F11BA8C; Mon, 07 Oct 2024 12:27:49 +0800
X-QQ-mid: xmsmtpt1728275269t9bleep9v
Message-ID: <tencent_B3968DE192105D945D9F997D4FE88DAE2507@qq.com>
X-QQ-XMAILINFO: NR+Rloh0s0m6dtC8A4gQjdFafs0ihqHJ7RJCBjno0WG8Gea3dsbdPxuui9s8Q9
	 U4hH7C4osyzA6rB+kknnpnGbyn0LfIg/aewh3/f1gw+t7TdeevSot/xMhFgp2u9d43ge04ugkVAL
	 uZ8uHpe9V3fWUIDwgRGk94FYkuXYeayvgrh9NplBDH/d/wMskuviXIecaT7asTBkBIKlh3NrcX8N
	 j8a5zzm5QHvLBvbo31TabzgPMTOyn8We+uCH0mjDemwZeGokneT3d7CZ1zxhPGj5iPOIqn/x61Q9
	 374E/QFciOJWzsHU1UOoqmT3sZETGtBRSNloOYxcrESPtO+YZ9F0e6ey7nTW35LqRo4zF41IK9/5
	 JaxZmYAiW3nD5H5TLbI3GEp2oJu1ybTjX7GZalBN/qPnLYjhqM5NirsZsswP4MppSUR0DydhFLvq
	 XO0wG8qQ0KwunfU3UA4UygIB92AF6CK3pzigb6AJJTK8SRc9lLNgFsG/Wd5VCGZeCRc/Rh1fsEY0
	 q0xaA6GXCuL3mQS0gIiULyr8Bcc4YBQhunjyO1GQBI7GRiJ7bqgAL0fwCOzAIocgR5bZCb10cwEg
	 ZHuYtLSnUUTSveZEsXaBciHu0XibEWRohZR7NcoSfPWg4/vwukUjuKbJjVozX2nq8aAsHAQDv/cq
	 6KfSrMKvOFRqRRmAoInJMYhLb/evYqyBNKBJQU6IV8gdXhFLIScqyJZ6sKMLqFLdaJgtUG/vMCym
	 uZUpgx2VIXHBKLdtV2N/aNR5Jl64GhVs+IENZCrwTWK1eNNVJfJqgk7UAZOFnfYiF+zGmsPghS80
	 kfSVERRXWTX6D7LG/JEMfTQ8YyikktVhSkWA7nvkAMmR6rjlXlrx057h5ylZmJnu0kd8r2xW42Ue
	 aKNnGwmp3IWmsBPT0hrG79brIrM8N2GhgAm3ph2V6K1qAMtmscMgI=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+e37dd1dfc814b10caa55@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_extend_initialized_size
Date: Mon,  7 Oct 2024 12:27:44 +0800
X-OQ-MSGID: <20241007042743.3006158-2-eadavis@qq.com>
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

The data type of in->i_valid and to is u64 in ntfs_file_mmap(). 
If their values are greater than LLONG_MAX, overflow will occur because
the data types of the parameters valid and new_valid corresponding to
the function ntfs_extend_initialized_size() are loff_t.

#syz test

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
+		WARN_ON(ni->i_valid >= pos);
 		err = ntfs_extend_initialized_size(file, ni, ni->i_valid, pos);
 		if (err)
 			goto out;

