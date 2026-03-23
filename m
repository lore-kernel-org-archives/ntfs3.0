Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F835C183
	for <ntfs3@lists.linux.dev>; Mon, 23 Mar 2026 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249477; cv=none; b=JD1yhUZTlYE6OiaXWe4WvyQnIhhXMJnj3ccvAwSYAoiZuI5+GFobXixxXa2f9xU64KHU8uqQpGKR5qfZ0XwRHuM8uZLzekhLNFdL7EprWYdb1I6bDhQh2eoqt3KAYboFlLpBl54n6Yd0t4YAzRSXUlIA7O2vejGqb7n0F0YjkJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249477; c=relaxed/simple;
	bh=Tj1gBeVJ0uEP7+VU2BiDIHHK0ewLtZ8kcs2bFSuxU6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ae0uzznqoQc5pNNZYI2UGyNdW4HPgbucQcUk0rHpjTcbgGq3XkSwxN7ZWc5X1FIvxhLGz5auVHE2IPvlhKmxlilR834tkOERqnsUSBT4KP1q95KVjRizUcu63L5A7jrUWyaQe5kCb+MoQc2lZmmuQ+cH7G4Ykx3yXpV6VAg5qNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAAnSeCw5cBpYAWGCw--.57780S2;
	Mon, 23 Mar 2026 15:03:12 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH 4/7] fs/ntfs3: leave room for the UTF-8 terminator
Date: Mon, 23 Mar 2026 15:03:12 +0800
Message-ID: <20260323070312.42889-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnSeCw5cBpYAWGCw--.57780S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1fAF17Kr1DWr4rKFyDZFb_yoWDGFXE9a
	4kua17GayUXan5K3ZrCFZ8ZrWfC3s7JF1kG3WaqFZrG3yDWFyrZr9Yvrs5tw42gFW8GFy5
	WrnrZF4xAr18XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwkFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3rc3UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ntfs_utf16_to_nls() passes the full destination length to
utf16s_to_utf8s() and then unconditionally writes buf[ret] = '\0'. When
the UTF-8 conversion exactly fills the caller buffer, ret equals buf_len
and that terminator write lands one byte past the end.

Reserve one byte for the trailing NUL before calling utf16s_to_utf8s()
and handle zero-length buffers explicitly.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 fs/ntfs3/dir.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 4652a56ad105..df3e2a513df8 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -27,8 +27,11 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
 
 	if (!nls) {
 		/* UTF-16 -> UTF-8 */
+		if (buf_len <= 0)
+			return 0;
+
 		ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
-				      buf, buf_len);
+				      buf, buf_len - 1);
 		buf[ret] = '\0';
 		return ret;
 	}
-- 
2.50.1 (Apple Git-155)

