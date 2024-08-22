Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34981CBEA4
	for <ntfs3@lists.linux.dev>; Thu, 22 Aug 2024 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341947; cv=none; b=ZwCGmOAaO4SwKLHieFjy4gJpvG91tPgO6TpzOzrAozNQ0B+LHbAk4o+HdcQZuT+UPd1qwCzJ8eLK81PaNGBP7ffYnIenUd/8o6v1xC6qoBZnf1EClGhJksc7Vd1AvmdWmKpbgW2F8mFEqB4J8dclYkpMsqhMVWzh2RaNRqjOEdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341947; c=relaxed/simple;
	bh=wD74zatcqBag8Jp7QiXZBE4XIxqnloU3RFQ6he53fj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtLcPffubEq08Q6n8oLH3a+LBCeYP67yzd8P0GTtv18PTffq9xAfGVcC6e1C4kA2UoSSGgo261+2eayDGgW6Q1wIXUt5d85qDdydDfM8W4Z4gohKYSOoxg7s0wmheKrR6Gx1IiqF8rtyW6cbNyZGHcMqoA9Nt3hRXkpOCgO3c8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=NmKX2h+Z; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="NmKX2h+Z"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D6D2B21DA;
	Thu, 22 Aug 2024 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724341464;
	bh=FrV6PeF39+ub73eFOOPjneG7iUPkesQEMIXaq6o3r0A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NmKX2h+ZmSWZeCu9u+OEQcujp8Dn7sN1iVATsdd0s46zQUinuFRb9jkomaLHXJSRj
	 S246+XWvOnkGXqu38qkprc0H3J9zq2xgpAh3kvjzyacMPfsOWepeQE52kQFabjGXzH
	 Mx1Ge5EqWlNd7N4ofo9cthUwcCh4Ev/Y2U2Czt20=
Received: from ntfs3vm.paragon-software.com (192.168.211.133) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 22 Aug 2024 18:52:20 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, kernel test
 robot <lkp@intel.com>
Subject: [PATCH 06/14] fs/ntfs3: Remove '__user' for kernel pointer
Date: Thu, 22 Aug 2024 18:51:59 +0300
Message-ID: <20240822155207.600355-7-almaz.alexandrovich@paragon-software.com>
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

Fixes sparse warning.

Fixes: d57431c6f511 ("fs/ntfs3: Do copy_to_user out of run_lock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406271920.hndE8N6D-lkp@intel.com/
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index a469c608a394..8d801eb291e8 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1906,7 +1906,7 @@ static int fiemap_fill_next_extent_k(struct fiemap_extent_info *fieinfo,
 				     u64 logical, u64 phys, u64 len, u32 flags)
 {
 	struct fiemap_extent extent;
-	struct fiemap_extent __user *dest = fieinfo->fi_extents_start;
+	struct fiemap_extent *dest = fieinfo->fi_extents_start;
 
 	/* only count the extents */
 	if (fieinfo->fi_extents_max == 0) {
-- 
2.34.1

