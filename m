Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C610F0
	for <ntfs3@lists.linux.dev>; Wed, 20 Apr 2022 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650440857; i=@fujitsu.com;
	bh=L0gnk54iyGfM60Qjlex0JGvplvmF+grDZIqDPCSoCAQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xt/uU5KH9IyTuI4epuL69C6cN45I2fqW85KQDZhfnrIBrIRZbbpW6xbQqUgEP/LLn
	 5DA/6j6o4CHKg2Z6B/Lyq4YwsbLm9fa7kTkXMK5uoYRR/38kzZPEvKyl1vQ6m0/Yrt
	 fXBnt7RbiDLb8815pw4hgaTmj2gkDi1ZCj7kEBkliSgec7MCt7h0Sjjafq31lfuXB+
	 6eF/74yJw2/JiKVYM+kEi9JeEUDmPk3+Y5Di5txXleBfLWnfbKBhzqB7JYRqe5d+m+
	 NYH6FDJMzkwGX9El3dAuhFmijkVD8NdP+tov+1C7K+fYfefzkl1Se4n78gus8cocBd
	 LLfE025T8VY6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRojtjV3y
  SwbcrhhbXHh9it1j5eCuTA5PHi80zGT1mHrrAEsAUxZqZl5RfkcCaMfdXccEL7oojU+ayNjC2
  cnQxcnEICbxmlDj6fhoLhLOHUeLp9V+MXYycHGwCmhLPOhcwg9giAnoSd+8cZeti5OBgFnCQ2
  HIlEiQsLOAv0TXxAxOIzSKgKnG+8S4biM0r4CGxdPESsDESAgoSUx6+Z4aIC0qcnPmEBcRmFp
  CQOPjiBTNEjaLEpY5vUPUVErNmtTFNYOSdhaRlFpKWBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ1
  NdU10LY31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECQy6lmCV2B+PWvp96
  hxglOZiURHnPLotPEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe2UHUE6wKDU9tSItMwcY/jBpC
  Q4eJRHe0nVAad7igsTc4sx0iNQpRl2OSX+u7WUWYsnLz0uVEud13QlUJABSlFGaBzcCFouXGG
  WlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzvgC5hCczrwRu0yugI5iAjqieEgtyREkiQkqqgWn
  arj09SY4n5S/9/Rnp8jz2ZFl03alNmvt74g9eyv32xphjsnWhRIxt2MfiTSbagllJd7NqriUt
  Tz0bwSYUJnPLL3F+3hOG3lVWh5TmCsUFCF5nXX5pvtma3tzbkoGCup0b324y+rqM8950W023X
  bpPr5/cVpxbIvxdOsnreEbPRLnOllmX/Tp+FvVU/FKb/qucKzzVI8mx6oh/o0lgnOOXrRZaOS
  sv5/bULBA5z2LnqNkXlN5V9140ZOu+8LoHhXcl91dqbTzXk8GpYiC0Zb36xiwbV96VDv9CBG8
  Jq+1b905n7aPvwvqT1osudy35YzRjhr1vUenuJNulVh8t10tUbJJ5VpIWVrbQobxfiaU4I9FQ
  i7moOBEAjmUOm0ADAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1650440856!347957!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received:
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2175 invoked from network); 20 Apr 2022 07:47:36 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Apr 2022 07:47:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23K7lQDS009802
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 20 Apr 2022 08:47:36 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 20 Apr 2022 08:47:24 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, Yang Xu <xuyang2018.jy@fujitsu.com>
Subject: [RFC] ntfs3: Use the same order for acl pointer check in ntfs_init_acl
Date: Wed, 20 Apr 2022 16:48:29 +0800
Message-ID: <1650444509-3330-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)

Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
style

       error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
       if (error)
                return error;

        if (default_acl) {
                error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
                                       default_acl, XATTR_CREATE);
                posix_acl_release(default_acl);
        } else {
                inode->i_default_acl = NULL;
        }
        if (acl) {
                if (!error)
                        error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
                                               acl, XATTR_CREATE);
                posix_acl_release(acl);
        } else {
                inode->i_acl = NULL;
        }
	...

So for the readability and unity of the code, adjust this order.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/ntfs3/xattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index afd0ddad826f..64cefa869a61 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -642,13 +642,13 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
 		inode->i_default_acl = NULL;
 	}
 
-	if (!acl)
-		inode->i_acl = NULL;
-	else {
+	if (acl) {
 		if (!err)
 			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
 					      ACL_TYPE_ACCESS);
 		posix_acl_release(acl);
+	} else {
+		inode->i_acl = NULL;
 	}
 
 	return err;
-- 
2.27.0

