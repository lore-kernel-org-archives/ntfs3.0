Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742F41C98
	for <ntfs3@lists.linux.dev>; Thu,  7 Dec 2023 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvEIWJL0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7050EC433CA;
	Thu,  7 Dec 2023 14:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701959323;
	bh=D9nxTK7jFnq47guRUf7p0EWjiyZ4kSvltCqz6c9gFdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=KvEIWJL0c28wOt6hHBfKl/PFvX4I9W4q4j9VYbk0kxQJe491uZumXJkhX1i+r+GP8
	 I2wilQK7faBB+VJvr4Mf1o18lHzl91ZlF4S/QNwi5wBrCnIkXqZ1z5eaKTCAeMbtQ3
	 yKh15zRX8v4GluMOVq5OlO5/SUneBNqaM6oLysbbs8aCucer28/qUTOVfkgIrtG53E
	 CGuEXOGbGCnS6XveR81TVTler4TIgA3i6XQBk0PHEERImbffH+FK7d2wKTBWHzVgNo
	 b6u+j0IUV4pkhj/c3Sp5WOn0ONwHhLnu4HQjguo7SMxUhHCamvFx8vHuQHSjTWoxL8
	 e7WPw3726v4rQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: align struct ATTR_LIST_ENTRY
Date: Thu,  7 Dec 2023 15:28:34 +0100
Message-Id: <20231207142838.960725-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On architectures like i386 that don't enforce natural alignment of u64
struct members, so the recent change to remove the final 48 bits
reduced the structure size from 32 to 28 bytes:

include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct ATTR_LIST_ENTRY) == 0x20"
fs/ntfs3/ntfs.h:530:1: note: in expansion of macro 'static_assert'
  530 | static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
      | ^~~~~~~~~~~~~

Add an alignment attribute that makes the structure the same across
all architectures again.

Fixes: d155617006eb ("fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ntfs3/ntfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index c8981429c721..2d409ac94cbb 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -525,7 +525,7 @@ struct ATTR_LIST_ENTRY {
 	__le16 id;		// 0x18: struct ATTRIB ID.
 	__le16 name[];		// 0x1A: To get real name use name_off.
 
-}; // sizeof(0x20)
+} __aligned((8)); // sizeof(0x20)
 
 static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
 
-- 
2.39.2

