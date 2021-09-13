Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201933FD0
	for <ntfs3@lists.linux.dev>; Mon, 13 Sep 2021 15:14:15 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id BA40D1D17;
	Mon, 13 Sep 2021 18:14:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631546046;
	bh=JyO+R0eWKCW9UDCCeZfpjO7DE9L4mgM9xZntgOqdjYw=;
	h=Date:Subject:From:To:References:CC:In-Reply-To;
	b=pV6BVazsNGy5DfX5JEwi5pnn7v/uAs7wXAjgI7r2lbxROziTJ1AS5BXXdTcUIEJbA
	 imYSAo3MOtdNjYvMhgjE/oatykw14poLngTTJ21kdJ2nbYjxmOeL49MLYpeUux02S1
	 z0l3gIroLA9B6nsKBSzgDdGLI4EMmMFVUh+1IXaA=
Received: from [192.168.211.103] (192.168.211.103) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 13 Sep 2021 18:14:06 +0300
Message-ID: <cc783784-15b8-c631-b7b3-9c0ea9f74028@paragon-software.com>
Date: Mon, 13 Sep 2021 18:14:05 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: [PATCH 2/3] fs/ntfs3: Change max hardlinks limit to 4000
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
References: <a08b0948-80e2-13b4-ea22-d722384e054b@paragon-software.com>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
In-Reply-To: <a08b0948-80e2-13b4-ea22-d722384e054b@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.103]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

xfstest generic/041 works with 3003, so we need to raise limit.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/ntfs.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 6bb3e595263b..6c604204d77b 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -20,9 +20,11 @@
 
 #define NTFS_NAME_LEN 255
 
-/* ntfs.sys used 500 maximum links on-disk struct allows up to 0xffff. */
-#define NTFS_LINK_MAX 0x400
-//#define NTFS_LINK_MAX 0xffff
+/*
+ * ntfs.sys used 500 maximum links on-disk struct allows up to 0xffff.
+ * xfstest generic/041 creates 3003 hardlinks.
+ */
+#define NTFS_LINK_MAX 4000
 
 /*
  * Activate to use 64 bit clusters instead of 32 bits in ntfs.sys.
-- 
2.33.0

