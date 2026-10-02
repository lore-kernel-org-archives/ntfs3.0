Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49DA3E49D3
	for <ntfs3@lists.linux.dev>; Fri,  2 Oct 2026 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922969; cv=pass; b=tx9PSm+WHM3VGd1uI7qYOhwMdHBTcrdyFnkxkGzjG36BtHFU9T3WN3gk0hn45pMkPA8AHvlryKpeAjnQ230a5Q0eBDLkwlU8lNf34Y2XUa9+Ivwe6MYu7WWvdbRvgHVo3+oBJ62LqS8Q9HhnJd7uq8gZ6/RFg9TE+NTwg087I2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922969; c=relaxed/simple;
	bh=3S1uZs1hII2pWOKPYQNkil7Fn4cNrtQ1UC0K0UrYm/g=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=mBZcoWe5DIZnJUwNOd0aI8qeOsUQeeUoNXDVQxTkpFkZU2Hzs9+e04OUSA65INoccFO/esZnisjz/48WnS5nvsUq8t8xkERp2k56ER0rw23xsgUdG0Zo5HLThiC/ziKDJ0C2gBo4cGu7JJZLSpv22XTKVWSJL1fWbsiCtUVa5gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgNKFn9M; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgNKFn9M"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso85451496d6.1
        for <ntfs3@lists.linux.dev>; Thu, 01 Oct 2026 23:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790922967; cv=none;
        d=google.com; s=arc-20260327;
        b=SO88oofiM1UI9yIfKlZdDFRpUONCnxHj0dD+lzPlx8VT0bf1dk7XEeDayK0XKhlM66
         dEyKPei6IRhxwAoKZRkc5rZJ2SfNA3egWB2cGXOPjYvmE+xFdXGgThNfGifCAM4nHEqI
         gmhLcxUZ/3eLfMiNbXRpu8KiHPVNdQaPFE5ZcF8cGfMxzX/NnvyUFqrypMFtPV0EChsi
         MgkjZlS0cpK3akG3CIlXX8IQpw168KLC26QYEjCxe/Tykltmis8CYsKnP5LDL4XO14dB
         bCH0F/Difut470qmdrrc0PPNJC+UAQnAOkBQv7Xvlg/4nJRRNBultb7ADqLYSl+VuTyk
         Pr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        fh=a/EVjOPzb8sma4cUEAuHW8ypFO6KEpmq9UXPcWLcWwM=;
        b=O3E04ycydyG1BUlGs2Pml40IrAFuCu9Sld1OhKSnig4SVz9oFq6jO2DWd2EcK/MkeU
         dR2YWc274XsjJx5hqKz1wWzZuR+u0kof9s22dlemxe3ydlYFwm0uqoOkZWhWrVyPJa0y
         QNm3MGn4AUdr+rj1j1f0JWUYOdRYZWUn2SUDcL/bLmLArhqfEts0JU0FrMs4HS8gJQl/
         oCUM4MsaaTfBe10xPmJy+PouNxW3bpJgsXJqYo7oOweEr0NsMupQT0JmcTF+R0A9HVZs
         YiyQ8palgzIKgscl3dWMTy//AgJh6LD9IPl8o5+HaOtaT4yPwZpKiO7wYeHEI5+zQScX
         T4jw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922967; x=1791527767; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        b=fgNKFn9MEgI9J9i0HfjIy54Dv9nDgmm0iBhh3TGtMCdazC4BfKvJEt7kuSivBMnySF
         qSUS7EDFQnPWTHqU6GrVQ8oJSDcybygKqiSPHh0W+Dq2jPbwUHC2lcOIdPMzcoS8Lt5m
         wrC/2pU/t8cROfh0/PBExFHAn0WuTDYFT8lm0UV+DkdxeW2nxxiVjiSocBDaOMP4oUXb
         z47KOHjgUwb8UeG343W3ar22KVE4+Ai27/Rh67oiboaZEp1NWNxvRT7qF/At9DNfMcvP
         AZRC45/phAf+QOoPbcTI7qN5ev51shR3JWOKqagomySmf13aZUkohwQSO66PyL4Y+33V
         EE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922967; x=1791527767;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEUnD7DqqTtUtcDjYvQugZu8ealQJ2hIum6Bu4MZjiI=;
        b=YHwDW/J9ax27IKeTMvqDhlCJ05uAlnFaQLFTNf/hOcZ+N8KcRFjIjNxL2Zlo0ZP1Jz
         Y9yAKHb0cl8uwImrHN8oNCjgo1rE9HPo/IHmATBZA79Bxz2DEhLJ8Tuf5aAB80JcHRqW
         Ma8CHUKXtTle/nDiCPWDN4lym4TIXIu1R5C1vr+/6W2clx/vdogeRLyDP5mHfXb33FqE
         b077PfNwymE7PmpcwMGb+IQRWzEBUacrHKf6JvnohkArVCDsBW+gVschmEK1THk9ghR7
         Q0LqC6y2qCbxNKiJSDaK4WJRAZLCAtm+Jp8KdRNpuVtt2e6BNG0wdPCPzqGULdPWGYPi
         F2Og==
X-Gm-Message-State: AFq9FYLxiXp0THvvDVHAnxdaXjyVoEaM3QCT/EQMIcrd3cgxKVPEZsQ3
	IqpMgv6PkCMuOzcqjZVIYXGdWl1rnb+DNEmQTbWi8VpCTHVl6KcuJw8jAQelGiS3llhp2dVH9t6
	+KJNRfAWVdnApzyLOrJiWqsCswTj/3yM=
X-Gm-Gg: AYBFou23Vww8PqndfRMZE3fm7jF340/7s++e786P5f83PvL5VGFZrjYDzdgwCBt3Vyg
	mbPGx0YdChC8BsrhkISLt6+SBdUvOcXyN4V3/DpcjhwobYW5GDB6fWk7Rrt4a7GiLB2kY38FLf9
	T/hjabN44QE0hgHRMHIiHtQZeJ8pM+RQ8+N2cap+otrguejOA2dNvkxRPjOCiokgPxcNE7RMKYd
	1+gCNEt5AumW1DXykVFnEkGB8zxetu8W1ULD3BuErNLw3pnF6g7oMvLZXbHai2+U1NwYg2WoN46
	3DLnkYuB2QsK8Dlis31aQ/1NQ+w/kVSHbFcteEeRGz9NRgYSm0VsaS017Vr6m1N5D3dVlcJkwX1
	xLxTguJE=
X-Received: by 2002:a05:6214:250b:b0:917:9407:ebe6 with SMTP id
 6a1803df08f44-917c01f8f37mr34918186d6.45.1790922966450; Thu, 01 Oct 2026
 23:36:06 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 01:36:05 -0500
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 01:36:05 -0500
From: aljojobypls@gmail.com
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 2 Oct 2026 01:36:05 -0500
X-Gm-Features: AclHuK-eOHG-KjrKk1EnhSAW8Anv2gpdAShX7kyS6osGEORvuk9-xVyj6NCHZdM
Message-ID: <CAPNiJxAHw90Ndv_NoEi5PeqO4mRnw9S9vx-es3F0NNt2nbV2cw@mail.gmail.com>
Subject: [PATCH] ntfs3: do not trust setuid and device nodes from WSL metadata
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs_get_wsl_perm() copies $LXMOD over the inode mode, including the
file type, setuid, setgid and the sticky bit, and $LXDEV supplies a
device number. Those attributes are stored on the volume.

A crafted NTFS image can therefore present a setuid-root binary or a
device node. cp -a and rsync -a copy that mode onto a normal Linux
filesystem. The nosuid,nodev flags on the ntfs3 mount do not travel
with the copy.

Keep the stored owner and the rwx bits. Keep the file type already
derived from the MFT, and drop setuid, setgid, the sticky bit and
device nodes. -o permissions restores the previous behavior for a
volume the operator trusts, such as a WSL disk that really contains
setuid binaries.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Aljo Joby <aljojobypls@gmail.com>
---
 Documentation/filesystems/ntfs3.rst |  9 ++++++++
 fs/ntfs3/ntfs_fs.h                  |  1 +
 fs/ntfs3/super.c                    |  7 ++++++
 fs/ntfs3/xattr.c                    | 35 +++++++++++++++++++++++------
 4 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst
b/Documentation/filesystems/ntfs3.rst
index 2b86a9b3a..260f73228 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -109,6 +109,15 @@ this table marked with no it means default is
without **no**.
        Kernel. Not to be confused with NTFS ACLs. The option specified as acl
        enables support for POSIX ACLs.

+   * - permissions
+     - Trust the WSL metadata stored in \$LXUID, \$LXGID, \$LXMOD and \$LXDEV.
+       This includes the owner, setuid, setgid, the sticky bit and device
+       nodes. Without this option the driver still applies the stored owner
+       and the rwx bits, but it keeps the file type it read from the MFT and
+       drops setuid, setgid, the sticky bit and device nodes. Mount a volume
+       with this option only when you trust it, for example a WSL disk that
+       legitimately contains setuid binaries.
+
 Todo list
 =========
 - Full journaling support over JBD. Currently journal replaying is supported
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5811d89d6..267d980f7 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -111,6 +111,7 @@ struct ntfs_mount_options {
 	unsigned nocase : 1; /* case insensitive. */
 	unsigned delalloc : 1; /* delay allocation. */
 	unsigned ads : 1; /* ads support. */
+	unsigned permissions : 1; /* Trust on-disk WSL uid, mode, devices. */
 };

 /* Special value to unpack and deallocate. */
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index f4a42a0c7..863126e87 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -275,6 +275,7 @@ enum Opt {
 	Opt_delalloc_bool,
 	Opt_ads,
 	Opt_ads_bool,
+	Opt_permissions,
 	Opt_err,
 };

@@ -303,6 +304,7 @@ static const struct fs_parameter_spec
ntfs_fs_parameters[] = {
 	fsparam_bool("delalloc",	Opt_delalloc_bool),
 	fsparam_flag("ads",		Opt_ads),
 	fsparam_bool("ads",		Opt_ads_bool),
+	fsparam_flag("permissions",	Opt_permissions),
 	{}
 };
 // clang-format on
@@ -432,6 +434,9 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 	case Opt_ads_bool:
 		opts->ads = result.boolean;
 		break;
+	case Opt_permissions:
+		opts->permissions = 1;
+		break;
 	default:
 		/* Should not be here unless we forget add case. */
 		return -EINVAL;
@@ -805,6 +810,8 @@ static int ntfs_show_options(struct seq_file *m,
struct dentry *root)
 		seq_puts(m, ",delalloc");
 	if (opts->ads)
 		seq_puts(m, ",ads");
+	if (opts->permissions)
+		seq_puts(m, ",permissions");

 	return 0;
 }
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 594ef6860..5db154513 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -1036,6 +1036,8 @@ void ntfs_get_wsl_perm(struct inode *inode)
 {
 	size_t sz;
 	__le32 value[3];
+	struct ntfs_sb_info *sbi = inode->i_sb->s_fs_info;
+	umode_t disk_mode, type;

 	if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
 			sizeof(value[0]), &sz) == sizeof(value[0]) &&
@@ -1043,15 +1045,34 @@ void ntfs_get_wsl_perm(struct inode *inode)
 			sizeof(value[1]), &sz) == sizeof(value[1]) &&
 	    ntfs_get_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value[2],
 			sizeof(value[2]), &sz) == sizeof(value[2])) {
-		i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
-		i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
-		inode->i_mode = le32_to_cpu(value[2]);
+		disk_mode = le32_to_cpu(value[2]);

-		if (ntfs_get_ea(inode, "$LXDEV", sizeof("$LXDEV") - 1,
-				&value[0], sizeof(value),
-				&sz) == sizeof(value[0])) {
-			inode->i_rdev = le32_to_cpu(value[0]);
+		/*
+		 * $LXUID/$LXGID/$LXMOD/$LXDEV are stored on the volume.
+		 * A crafted image can claim to be a setuid-root binary or
+		 * a device node. Those bits are copied onto a trusted
+		 * filesystem by cp -a and rsync -a, even when this mount
+		 * itself is nosuid,nodev. Trust them only with -o permissions.
+		 */
+		if (sbi->options->permissions) {
+			i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
+			i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
+			inode->i_mode = disk_mode;
+
+			if (S_ISCHR(disk_mode) || S_ISBLK(disk_mode)) {
+				if (ntfs_get_ea(inode, "$LXDEV",
+						sizeof("$LXDEV") - 1, &value[0],
+						sizeof(value[0]),
+						&sz) == sizeof(value[0]))
+					inode->i_rdev = le32_to_cpu(value[0]);
+			}
+			return;
 		}
+
+		i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
+		i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
+		type = inode->i_mode & S_IFMT;
+		inode->i_mode = type | (disk_mode & 0777);
 	}
 }

-- 
2.53.0
