Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BCF1836F4
	for <ntfs3@lists.linux.dev>; Wed, 26 Jun 2024 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719405801; cv=none; b=OG7fbviM3Vd2ssnovDPZKmBXQwYlmgYx9PHmsTTPI2VdckGu1HuOJXGZq8Ef+43cTx2EOavSy/3PUNgegISs7HnsnsRQ5U+pp/wE57AG5jff1sw/OGpg6NM2/LVZzK0INmUsSEIPry5e7cPJaItLGhnKjlJqjFtGOnI1JxOzdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719405801; c=relaxed/simple;
	bh=1p5kJ78aVskOpXmWga2mKR1YgWgUGYIki1EQ0PzkUiw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsI1pIXTQrOHK4Nba6vAmCOB01VNh7I/biYObEBHIwIww52ioMdD1at1OGkAQUVRi5jRqs9yt5z6fnZmSRbkJJr3PiteTpD2HATduJO21AYk8cc+8lgL+7lkZfPtMY2ggVqptNf3rC+H+Tfgu+FQH8geFuS/e/F6K0um/OoK2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Lxts0jtu; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Lxts0jtu"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 17EA1217E;
	Wed, 26 Jun 2024 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1719405315;
	bh=Yi1RRgqH3mZIaVkpZ2udxSjEaLNlPe6YySqqKchCbgA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Lxts0jtuFc/c9cdy8irTU/6/sc3GddbWve/Eo7V2AXUKO9pv450+6Bi6u+dglaNCP
	 H13Q7wB7gLsARuoTgrnFBcZtGyJ+HVKc/OQQ/fV5BnHbDmJ5ZGUYtFAcfLZOQKK3J3
	 EJMbncXHjY7O73RNYuAHCXKmvxcINxK8XOg0qhTg=
Received: from ntfs3vm.paragon-software.com (192.168.211.129) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 26 Jun 2024 15:43:17 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 07/11] fs/ntfs3: Minor ntfs_list_ea refactoring
Date: Wed, 26 Jun 2024 15:42:54 +0300
Message-ID: <20240626124258.7264-8-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626124258.7264-1-almaz.alexandrovich@paragon-software.com>
References: <20240626124258.7264-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

For easy internal debugging.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/xattr.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 73785dece7a7..0703e1ae32b2 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -195,10 +195,8 @@ static ssize_t ntfs_list_ea(struct ntfs_inode *ni, char *buffer,
 {
 	const struct EA_INFO *info;
 	struct EA_FULL *ea_all = NULL;
-	const struct EA_FULL *ea;
 	u32 off, size;
 	int err;
-	int ea_size;
 	size_t ret;
 
 	err = ntfs_read_ea(ni, &ea_all, 0, &info);
@@ -212,16 +210,18 @@ static ssize_t ntfs_list_ea(struct ntfs_inode *ni, char *buffer,
 
 	/* Enumerate all xattrs. */
 	ret = 0;
-	for (off = 0; off + sizeof(struct EA_FULL) < size; off += ea_size) {
-		ea = Add2Ptr(ea_all, off);
-		ea_size = unpacked_ea_size(ea);
+	off = 0;
+	while (off + sizeof(struct EA_FULL) < size) {
+		const struct EA_FULL *ea = Add2Ptr(ea_all, off);
+		int ea_size = unpacked_ea_size(ea);
+		u8 name_len = ea->name_len;
 
-		if (!ea->name_len)
+		if (!name_len)
 			break;
 
-		if (ea->name_len > ea_size) {
+		if (name_len > ea_size) {
 			ntfs_set_state(ni->mi.sbi, NTFS_DIRTY_ERROR);
-			err = -EINVAL; /* corrupted fs */
+			err = -EINVAL; /* corrupted fs. */
 			break;
 		}
 
@@ -230,16 +230,17 @@ static ssize_t ntfs_list_ea(struct ntfs_inode *ni, char *buffer,
 			if (off + ea_size > size)
 				break;
 
-			if (ret + ea->name_len + 1 > bytes_per_buffer) {
+			if (ret + name_len + 1 > bytes_per_buffer) {
 				err = -ERANGE;
 				goto out;
 			}
 
-			memcpy(buffer + ret, ea->name, ea->name_len);
-			buffer[ret + ea->name_len] = 0;
+			memcpy(buffer + ret, ea->name, name_len);
+			buffer[ret + name_len] = 0;
 		}
 
-		ret += ea->name_len + 1;
+		ret += name_len + 1;
+		off += ea_size;
 	}
 
 out:
-- 
2.34.1

