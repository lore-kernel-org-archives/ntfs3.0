Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6822F80
	for <ntfs3@lists.linux.dev>; Thu, 23 Sep 2021 15:42:59 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id E98B682328;
	Thu, 23 Sep 2021 18:42:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632411777;
	bh=AGAk4jUzbizS+IaTUDiD3JKzGN2DMd2TWW71KsQVmt0=;
	h=Date:Subject:From:To:References:CC:In-Reply-To;
	b=oZa2EsKEgsLE3gds6ickzdO/+E4rcjOqgKht/Gstf83dRln8Jx79Y9aqaVhdtSV4q
	 CVefcsDlYClzlmBmqWMpbN2/ygY3TppSid6lxiYg5DOXIQx1kHxg8GPkXgMgE0AnJC
	 y785bjqZ/JQ2gldMV/uJrQEAsHqtki86r/wg+Oss=
Received: from [192.168.211.73] (192.168.211.73) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 23 Sep 2021 18:42:57 +0300
Message-ID: <3df9fdcb-5941-b2ca-0ba9-65dcad8bce22@paragon-software.com>
Date: Thu, 23 Sep 2021 18:42:56 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: [PATCH v2 3/6] fs/ntfs3: Refactor ntfs_get_acl_ex for better
 readability
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
References: <a740b507-40d5-0712-af7c-9706d0b11706@paragon-software.com>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
In-Reply-To: <a740b507-40d5-0712-af7c-9706d0b11706@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.73]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

We can safely move set_cached_acl because it works with NULL acl too.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/xattr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 5c7c5c7a5ec1..3795943efc8e 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -518,12 +518,15 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
 	/* Translate extended attribute to acl. */
 	if (err >= 0) {
 		acl = posix_acl_from_xattr(mnt_userns, buf, err);
-		if (!IS_ERR(acl))
-			set_cached_acl(inode, type, acl);
+	} else if (err == -ENODATA) {
+		acl = NULL;
 	} else {
-		acl = err == -ENODATA ? NULL : ERR_PTR(err);
+		acl = ERR_PTR(err);
 	}
 
+	if (!IS_ERR(acl))
+		set_cached_acl(inode, type, acl);
+
 	__putname(buf);
 
 	return acl;
-- 
2.33.0


