Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=182.48.54.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616330;
	b=L8lZOrUuBbFfkScmbgVMKYXodKlDOWmy0eGvbkc3fo0Bgp6xzEhfH9tJAsg4O4fX0/+Q
	 AOq521wyMvKRuW3PDxDP7sCjO3raKh64965l1Cdjl9xe1nEkGYqBlZhQ303MQlXl27VEW
	 PJBy1TAiitolizkhHF+sXl/X/SGWEU2yVwbK2igIOo2TvjxymUrUYlNkluAhVrWv9bKfl
	 Kn/tLVZwvb7Y3cNUGLn00s41jkDGJdezna0oUAhMPxFERk/sB4otNXcFfw0VFafoLjEVV
	 IoEbJ7M+rUkOQ0Pj8fnq2Emossac1R6Zv4xQNndpnsjhUdEwJlF76D5ENaR2F/rF3Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616330;
	h=DMARC-Filter:Received:From:Date:To:Cc:Subject:Message-ID;
	bh=3wOajHH4NzvZvBhjuRIDgAkiOClVftzL+88Gx9NKlJs=;
	b=n0YL5JV6JEGTB4aw7mckkkFT7Vn18rHGiaq/iZqKPJsusbfeg8PaV1mnJ+F7K/RmD0+e
	 ec6bEYAkb1IWZxqwuRwd2Ps2/ZUdbAzAIbDXQlx5JRMikngJIXAHkI84HM866gn836Y6h
	 iJt5hmWYMULX9jtrvyls2His7SJ6ckL6AWUGNLcGslqbriAZzayz69iLBUXeywPMSIaTR
	 0tJgVL7QWwEvq6lUpOPZTp6pGTmALyvw0zUZVIGV6chCEr+hftGRoY8EkmDYhf96qKXDs
	 1uPzU8z4t29ctNsgjapsm8736oWPW2yXNLwgkdQBKHQc7Uysvl0rQta1bSDfo49asOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=snowrabbit.org;
	spf=pass smtp.mailfrom=snowrabbit.org;
	arc=none smtp.remote-ip=182.48.54.220
Received: from bambi.snowrabbit.org (bambi.snowrabbit.org [182.48.54.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57D0606A321
	for <ntfs3@lists.linux.dev>; Wed, 25 Nov 2026 14:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=snowrabbit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snowrabbit.org
Received: by bambi.snowrabbit.org (Postfix, from userid 3001)
	id 17D42C9314; Wed, 25 Nov 2026 23:18:49 +0900 (JST)
From: Showta Ishizaki <zakinko@snowrabbit.org>
Date: Wed, 25 Nov 2026 23:18:20 +0900
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
    linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Showta Ishizaki <zakinko@snowrabbit.org>
Subject: [PATCH] fs/ntfs3: fall back to the substitute name of a junction
Message-ID: <20261125-ntfs3-01a-v1@snowrabbit.org>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list

A junction made with "New-Item -ItemType Junction" on Windows has an
empty print name, and readlink() on it fails with EINVAL, because
ntfs_readlink_hlp() only looks at the print name.

MS-FSCC 2.1.2.4 and 2.1.2.5 give a substitute name beside it.  Use that
when the print name is empty, without the \??\ that starts it.  A
symlink with an empty print name gets the same.

On a volume made on Windows Server 2025, readlink() of such a junction
returned EINVAL.  With the patch it gives the translated path and the
link can be followed.

Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
---
 fs/ntfs3/inode.c | 119 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 95 insertions(+), 24 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 86d9ba8..1e99620 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -2133,6 +2133,94 @@ out:
 	return err;
 }
 
+/*
+ * ntfs_link_target - Locate the target name of a junction or symlink.
+ * @rp:		reparse data, @size bytes long.
+ * @ulen:	returns the length of the name in bytes.
+ * @nt_path:	set when the name is the substitute name, which Windows
+ *		writes as an NT path such as \??\C:\dir.
+ *
+ * MS-FSCC 2.1.2.4 and 2.1.2.5 give both a substitute name and a print
+ * name.  The print name is the one meant for display and SHOULD be
+ * present, but it may be empty: Windows leaves it empty on a junction
+ * made with New-Item -ItemType Junction.  Fall back to the substitute
+ * name then.
+ *
+ * Return: the name, or NULL if the tag is neither of the two or the
+ * buffer is too short to hold its header.
+ */
+static const __le16 *ntfs_link_target(const struct REPARSE_DATA_BUFFER *rp,
+				      u64 size, u16 *ulen, bool *nt_path)
+{
+	size_t path;
+	u16 sub_off, sub_len, print_off, print_len;
+
+	switch (rp->ReparseTag) {
+	case IO_REPARSE_TAG_MOUNT_POINT: {
+		const typeof(rp->MountPointReparseBuffer) *mp =
+			&rp->MountPointReparseBuffer;
+
+		path = offsetof(struct REPARSE_DATA_BUFFER,
+				MountPointReparseBuffer.PathBuffer);
+		if (size <= path)
+			return NULL;
+		sub_off = le16_to_cpu(mp->SubstituteNameOffset);
+		sub_len = le16_to_cpu(mp->SubstituteNameLength);
+		print_off = le16_to_cpu(mp->PrintNameOffset);
+		print_len = le16_to_cpu(mp->PrintNameLength);
+		break;
+	}
+
+	case IO_REPARSE_TAG_SYMLINK: {
+		const typeof(rp->SymbolicLinkReparseBuffer) *sl =
+			&rp->SymbolicLinkReparseBuffer;
+
+		path = offsetof(struct REPARSE_DATA_BUFFER,
+				SymbolicLinkReparseBuffer.PathBuffer);
+		if (size <= path)
+			return NULL;
+		sub_off = le16_to_cpu(sl->SubstituteNameOffset);
+		sub_len = le16_to_cpu(sl->SubstituteNameLength);
+		print_off = le16_to_cpu(sl->PrintNameOffset);
+		print_len = le16_to_cpu(sl->PrintNameLength);
+		break;
+	}
+
+	default:
+		return NULL;
+	}
+
+	*nt_path = !print_len;
+	if (*nt_path) {
+		*ulen = sub_len;
+		return Add2Ptr(rp, path + sub_off);
+	}
+	*ulen = print_len;
+	return Add2Ptr(rp, path + print_off);
+}
+
+/*
+ * ntfs_strip_nt_prefix - Drop the \??\ that starts an NT path.
+ * @name:	link target, already with '\' turned into '/'.
+ * @len:	its length, not counting the terminating zero.
+ *
+ * MS-FSCC does not define this prefix; it is what Windows writes in a
+ * substitute name.  Without it the name reads like a print name.
+ *
+ * Return: the new length.
+ */
+static int ntfs_strip_nt_prefix(char *name, int len)
+{
+	static const char prefix[] = "/??/";
+	const int prefix_len = sizeof(prefix) - 1;
+
+	if (len < prefix_len || memcmp(name, prefix, prefix_len))
+		return len;
+
+	memmove(name, name + prefix_len, len - prefix_len + 1);
+	return len - prefix_len;
+}
+
 static noinline int ntfs_readlink_hlp(const struct dentry *link_de,
 				      struct inode *inode, char *buffer,
 				      int buflen)
@@ -2146,6 +2234,7 @@ static noinline int ntfs_readlink_hlp(const struct dentry *link_de,
 	void *to_free = NULL;
 	struct REPARSE_DATA_BUFFER *rp;
 	const __le16 *uname;
+	bool nt_path = false;
 	struct ATTRIB *attr;
 
 	/* Reparse data present. Try to parse it. */
@@ -2187,32 +2276,11 @@ static noinline int ntfs_readlink_hlp(const struct dentry *link_de,
 	/* Microsoft Tag. */
 	switch (rp->ReparseTag) {
 	case IO_REPARSE_TAG_MOUNT_POINT:
-		/* Mount points and junctions. */
-		/* Can we use 'Rp->MountPointReparseBuffer.PrintNameLength'? */
-		if (size <= offsetof(struct REPARSE_DATA_BUFFER,
-				     MountPointReparseBuffer.PathBuffer))
-			goto out;
-		uname = Add2Ptr(rp,
-				offsetof(struct REPARSE_DATA_BUFFER,
-					 MountPointReparseBuffer.PathBuffer) +
-					le16_to_cpu(rp->MountPointReparseBuffer
-							    .PrintNameOffset));
-		ulen = le16_to_cpu(rp->MountPointReparseBuffer.PrintNameLength);
-		break;
-
 	case IO_REPARSE_TAG_SYMLINK:
-		/* FolderSymbolicLink */
-		/* Can we use 'Rp->SymbolicLinkReparseBuffer.PrintNameLength'? */
-		if (size <= offsetof(struct REPARSE_DATA_BUFFER,
-				     SymbolicLinkReparseBuffer.PathBuffer))
+		/* Mount points, junctions and symbolic links. */
+		uname = ntfs_link_target(rp, size, &ulen, &nt_path);
+		if (!uname)
 			goto out;
-		uname = Add2Ptr(
-			rp, offsetof(struct REPARSE_DATA_BUFFER,
-				     SymbolicLinkReparseBuffer.PathBuffer) +
-				    le16_to_cpu(rp->SymbolicLinkReparseBuffer
-							.PrintNameOffset));
-		ulen = le16_to_cpu(
-			rp->SymbolicLinkReparseBuffer.PrintNameLength);
 		break;
 
 	case IO_REPARSE_TAG_CLOUD:
@@ -2281,6 +2349,9 @@ static noinline int ntfs_readlink_hlp(const struct dentry *link_de,
 	/* Always set last zero. */
 	buffer[err] = 0;
 
+	if (nt_path)
+		err = ntfs_strip_nt_prefix(buffer, err);
+
 	/* If this is a junction, translate the link target. */
 	if (rp->ReparseTag == IO_REPARSE_TAG_MOUNT_POINT)
 		err = ntfs_translate_junction(sb, link_de, buffer, err, buflen);
-- 
2.54.0 (Apple Git-157)

