Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21ED1C2C
	for <ntfs3@lists.linux.dev>; Fri,  1 Jul 2022 13:11:15 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 7254221B5;
	Fri,  1 Jul 2022 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1656681016;
	bh=02KihnYdaZm2ncpfXa/zdWa/4dUMAjXhtcspmqZ/iQc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=mP4lTzPxF70rg8R7AaoBiR2jL2xAFAY+/6mtWP6oh7IKcqR5wLOJ1idZf5Zjh8i7L
	 OfBAp92Ofh+91lXT/L+ZGvnA37YVn15fwKKQtETHQylGpHDbegufSUGpnQi94rQqQO
	 jLkzOUXZNqufZbc7pstGHzmk0s+QpPwIQHpIFB+8=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B8B4B21B8;
	Fri,  1 Jul 2022 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1656681073;
	bh=02KihnYdaZm2ncpfXa/zdWa/4dUMAjXhtcspmqZ/iQc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=KvvpoADQyImOQM7pjCEgEWkZjUezYYwliAyAPGCu8BtmjposgJNA2ewq3EaCC1hoT
	 3FdOOzUXW1bxub9Da494xDQIpwT9QprpJReI3d5nZmt5+39xQcH9qTwVzPntRj8JrD
	 xi89KWLZyPirofVKtghKw0441ycBJA7XABOgKoeE=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 1 Jul 2022 16:11:13 +0300
Message-ID: <5ddc83fd-5e98-d66a-91c2-afb8a037ebb6@paragon-software.com>
Date: Fri, 1 Jul 2022 16:11:12 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 4/5] fs/ntfs3: Make static function attr_load_runs
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <34e58f6e-e508-4ad8-6941-37281ea7d3ef@paragon-software.com>
In-Reply-To: <34e58f6e-e508-4ad8-6941-37281ea7d3ef@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

attr_load_runs is an internal function

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/attrib.c  | 4 ++--
  fs/ntfs3/ntfs_fs.h | 2 --
  2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 43b9482f9830..68a210bb54fe 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -84,8 +84,8 @@ static inline bool attr_must_be_resident(struct ntfs_sb_info *sbi,
  /*
   * attr_load_runs - Load all runs stored in @attr.
   */
-int attr_load_runs(struct ATTRIB *attr, struct ntfs_inode *ni,
-		   struct runs_tree *run, const CLST *vcn)
+static int attr_load_runs(struct ATTRIB *attr, struct ntfs_inode *ni,
+			  struct runs_tree *run, const CLST *vcn)
  {
  	int err;
  	CLST svcn = le64_to_cpu(attr->nres.svcn);
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5472cde2aa5f..b88721e48458 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -408,8 +408,6 @@ enum REPARSE_SIGN {
  };
  
  /* Functions from attrib.c */
-int attr_load_runs(struct ATTRIB *attr, struct ntfs_inode *ni,
-		   struct runs_tree *run, const CLST *vcn);
  int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
  			   CLST vcn, CLST lcn, CLST len, CLST *pre_alloc,
  			   enum ALLOCATE_OPT opt, CLST *alen, const size_t fr,
-- 
2.37.0


