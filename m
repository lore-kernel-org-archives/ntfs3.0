Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34451C9EC4
	for <ntfs3@lists.linux.dev>; Thu, 22 Aug 2024 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341947; cv=none; b=N6N/WFLqMKS0wA6jJ0pJ8R5qOp4dX8b9pzvl2csIQXQG7SCqKBHa+v33/wCfmkAEX0NubtXDaOwMhmzlzCyGHCw8QbnJjnDF1D6DRBCDuUQ9STdRpU9kP7Wuaci9cMG3rTYt0O3HjpjfHx1JcFXbGYvOxKjPSCcaNOs+SC3Nfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341947; c=relaxed/simple;
	bh=aremsOjrn6FLI7OqXLGaII0JGVgMX75BHc/uH49s/7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lh5XTRnuMmkDRig2YsaDq+SEfHtCgRCj0ELoC/Y90yJ4Jryw0a06XN6BwHMduffh/IiP1EBrjT3ix3KNANuA7JJ/yh3hO4ot+XxSIPSqKcuSzHT18+y5MbGlIsjU9u79QM72OsOyqMfYplxPR6Drz1NC3bMzKZhS3A1+X3oCILo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=FOeAMDEx; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="FOeAMDEx"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id A888821D9;
	Thu, 22 Aug 2024 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724341464;
	bh=fcIxLkzyuCk2yv/4wxyJZYfPyWbzVIijYFMYkinlhb0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FOeAMDExQ/nA3HHWvo3npeIfxW4BE1aMPWInVW+ddpXwHL9+Pdck/zpkHM8lonbRw
	 TA3GESA7QfffpCA4l+iaEQEgjPYpaYTxykReaH8Ir9DqqMlqcAuiFy7HktxFrJJEhi
	 wyLgp+MbGvvQaoXJO/69z3IfkHwzC71fUcoiH+lo=
Received: from ntfs3vm.paragon-software.com (192.168.211.133) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 22 Aug 2024 18:52:20 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	<syzbot+c2ada45c23d98d646118@syzkaller.appspotmail.com>
Subject: [PATCH 05/14] fs/ntfs3: Fix warning possible deadlock in ntfs_set_state
Date: Thu, 22 Aug 2024 18:51:58 +0300
Message-ID: <20240822155207.600355-6-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822155207.600355-1-almaz.alexandrovich@paragon-software.com>
References: <20240822155207.600355-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Use non-zero subkey to skip analyzer warnings.

Reported-by: syzbot+c2ada45c23d98d646118@syzkaller.appspotmail.com
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/ntfs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 4e363b8342d6..898c742fca14 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -334,7 +334,7 @@ struct mft_inode {
 
 /* Nested class for ntfs_inode::ni_lock. */
 enum ntfs_inode_mutex_lock_class {
-	NTFS_INODE_MUTEX_DIRTY,
+	NTFS_INODE_MUTEX_DIRTY = 1,
 	NTFS_INODE_MUTEX_SECURITY,
 	NTFS_INODE_MUTEX_OBJID,
 	NTFS_INODE_MUTEX_REPARSE,
-- 
2.34.1

