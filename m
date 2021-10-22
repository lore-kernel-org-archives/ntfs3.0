Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97F29CA
	for <ntfs3@lists.linux.dev>; Fri, 22 Oct 2021 15:56:09 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id DA553822AB;
	Fri, 22 Oct 2021 18:56:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1634918167;
	bh=YOq5hRPWPXZWRVKy7bnM5IrY3Tf2tWJN1KcRTVcIT5A=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=hHLJ+Z5Nnnb93SNIuWuF0/IBwg2m9NDjZZysaR+/SmD8CgfCSeq+JLCAIr3P/5lqE
	 KhbGqsRn9m+WQVG0zMP0Kc2UEezW896F3hq/mu9G6akD2op+x+A5QwUh+Dzeot9RGc
	 n9ZXJa1xU0nCENyNsvxRVh4jOToZVcVs4HkM/oRI=
Received: from [192.168.211.69] (192.168.211.69) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 22 Oct 2021 18:56:07 +0300
Message-ID: <a4ce42f1-19b4-67ac-660d-228ae10f125c@paragon-software.com>
Date: Fri, 22 Oct 2021 18:56:07 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [PATCH 4/4] fs/ntfs3: Update i_ctime when xattr is added
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
In-Reply-To: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.69]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Ctime wasn't updated after setfacl command.
This commit fixes xfstest generic/307
Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/xattr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index bc3144608ce1..702775a559f5 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -994,6 +994,9 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
 
 out:
+	inode->i_ctime = current_time(inode);
+	mark_inode_dirty(inode);
+
 	return err;
 }
 
-- 
2.33.0


