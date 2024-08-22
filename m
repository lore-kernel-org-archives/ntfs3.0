Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C6F1CCB54
	for <ntfs3@lists.linux.dev>; Thu, 22 Aug 2024 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341950; cv=none; b=ghBga2cJc7OHPO/lWOh/RZzPq+2YrUJldD9ANIs3C1HQGjiMSnHEwTkrv9d0/o+KL1NXzTSSsxbvhmh3vzqN8nCGPRiCxCHozvtnXwtgntyl8QGLYJWhDu3EvfKZRhYkbelxBJ66J8DubA/6JWV9Ia8o8C1R/OK7xe2e3iUsqAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341950; c=relaxed/simple;
	bh=RnqOkoHf7tMMnt3OlFnGk/EEwgrjtQx/QMgMTTpNIKs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxobwxshhtkAqoRFOeEAaNJsdijqjFSDsphl3T4XJfwiIfjCTTktPT9WTyqml9DLHvrTEqNi2bH901DUqEk1naW2ZHIJmtZ0Co1UGTGvRw9GAsnudArAOztMeGq+sjOa4CZXAlaNJhKwD80VOP1iQi/AWFoeA817wIEelxzRMaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=g7LZPj7b; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="g7LZPj7b"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 46DEB21DD;
	Thu, 22 Aug 2024 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724341466;
	bh=lJwnTsLSOngz792/fDzy3aN/miLK8nR0E/OK1x7J4dU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g7LZPj7byyERrC/vdETVCUza+i5jtKbQIl0pzkYc7CQi6YDLSTAl5RwfArPJViqDH
	 GmM7vmy71OHK8cqLNBCr0lv480YPULo+f3PHrfu00Ppehx0hQmN1eBpH+kpbm9YiKO
	 mfFhZoQoD9L6z07k0tpWYdSdZbsvcpbuaxoD5CGA=
Received: from ntfs3vm.paragon-software.com (192.168.211.133) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 22 Aug 2024 18:52:22 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	<syzbot+c6d94bedd910a8216d25@syzkaller.appspotmail.com>
Subject: [PATCH 09/14] fs/ntfs3: Add rough attr alloc_size check
Date: Thu, 22 Aug 2024 18:52:02 +0300
Message-ID: <20240822155207.600355-10-almaz.alexandrovich@paragon-software.com>
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

Reported-by: syzbot+c6d94bedd910a8216d25@syzkaller.appspotmail.com
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/record.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 6c76503edc20..82950a267d4c 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -334,6 +334,9 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 
 		if (attr->nres.c_unit)
 			return NULL;
+
+		if (alloc_size > mi->sbi->volume.size)
+			return NULL;
 	}
 
 	return attr;
-- 
2.34.1

