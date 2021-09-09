Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490592FAE
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 10:58:06 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id D13FA8222B;
	Thu,  9 Sep 2021 13:58:04 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631185084;
	bh=pGRek/hfohXY6dQN+Oe6F3DUHHeJDG5t4TgyGR+GJ+s=;
	h=Date:To:CC:From:Subject;
	b=LcoRI7x+dXi6QWVx05NIN1uM33Udb/dKIqalBcHX74T9oAPgUCB7mD0Z3u+aROCH8
	 l23NQXrHKfF3x0wn4CJCJBjB3gllODvz2Ws+fvfM9oP3RM9JNCRRGwaDOhnEKoKCxB
	 qd5ReyZnc7RGiGo+q2Mm0uD0n9j3nYYZlZiJgoBk=
Received: from [192.168.211.46] (192.168.211.46) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 9 Sep 2021 13:58:04 +0300
Message-ID: <89127d37-a38a-d15c-36f1-62f2ac0f4507@paragon-software.com>
Date: Thu, 9 Sep 2021 13:58:04 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 2/3] fs/ntfs3: Change max hardlinks limit to 4000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.46]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

xfstest 041 works with 3003, so we need to
raise limit.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/ntfs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 6bb3e595263b..0006481db7fa 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -21,7 +21,8 @@
 #define NTFS_NAME_LEN 255
 
 /* ntfs.sys used 500 maximum links on-disk struct allows up to 0xffff. */
-#define NTFS_LINK_MAX 0x400
+/* xfstest 041 creates 3003 hardlinks. */
+#define NTFS_LINK_MAX 4000
 //#define NTFS_LINK_MAX 0xffff
 
 /*
-- 
2.28.0
