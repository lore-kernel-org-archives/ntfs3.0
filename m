Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6A40B11A
	for <ntfs3@lists.linux.dev>; Sat, 15 Aug 2026 07:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786779875; cv=pass; b=Dfn/TlfBTKuLisXMR3c7ApZkwMrHjBS8x7BtPGAkQAl6USmZzSsT4waBMVKqjpo5+vzy8c093qKTcyYl59u5byGuVSLUPjAghDPLikJ3Koxo+rZbDjgmpFETNolk1kD8Ty8UZbu8mwozPUtn26mILb4ZAFXHqU8d+RqWFwdxHJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786779875; c=relaxed/simple;
	bh=obWPTrndnwQziSdveHckuhHMF9sUE9gDeJ0HAv51tCw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZbLObpUav2jHgAXBv1bCREPScIOkzl9qX/pvMCE0xs+CrSQh6xQ7nl/zuNkaOHspmb6gASbkx89/02kQUXqxWvR26wgHsp/xVUQhzpstojRuD9x0KbjT3DfvMl813eFOPE+kq/P0ekDhs+nZ0zuEeekSUy8pk5H7+8cjbDMo9ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=breachx.ai; spf=pass smtp.mailfrom=breachx.ai; dkim=pass (2048-bit key) header.d=breachx.ai header.i=@breachx.ai header.b=hK6iEs/H; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=breachx.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=breachx.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=breachx.ai header.i=@breachx.ai header.b="hK6iEs/H"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1098443a12.1
        for <ntfs3@lists.linux.dev>; Sat, 15 Aug 2026 00:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786779873; cv=none;
        d=google.com; s=arc-20260327;
        b=bqypa6OnghOzvOy+xKJkAI+SYZrMZqoqjNG8HCoOMlcFN+qz6p14lnP/Af5DcqJgef
         c66XsrugZho9UmY1i/XCZGJMWEQQ56oxeE98YAIzz2zVu6Fa44YBj3onHJDf2a3e58uk
         KauhkCgxuy8aiunxqN8Z2Ogno9aRowPguWlBxpZwejcwWXx9mEzr2W0Atu8Nvsr7pmoX
         Du0NTKIUVgS2b8C9Vbao6WwidtUxfw6pxaxb5QnlQO/7z4OZO28HPL7BnbotSPITlABO
         2ijORM+WPTwch/LQZBKiIWTGgZi0NSrxPavllcAG0SFyef849SntTLJJgMkmmZAjpiBF
         Sg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6E5bZO0QtG5GwP+ZYRPrGDTckZtMS40lPNJEkc15IRc=;
        fh=ACxbD7eYziYYlF+ZzwFCeniDSWZP8rLNApJHwGjD1BY=;
        b=Arv/4KVFHScINPWVqCtWpIVAeuqSpbsrhv0xt0BaPBMrYBFC48iu+HHooVW1jJylNn
         qKqu5SfF5izmYY6LwAu6feDoubTpdBWPptzwvjWSk3v3z0TQTrRZ+SdvPkl1Rm79t06b
         AtwyFaIG23WPzVr1MTcKI7/ev3s6QsRF/ne1eop9c7oGd0ImHvvGvow/oL6PC94PLGeK
         8x+xnCMoVbqmS8wWCH7B8Uz3CE3eMD1SaMIcGs5U7493dVkr2qdLc8sv6KvmPZQnuYRG
         Tr0q9y9UvILNjjTu+lb+wySj6igRDPR986wJiVPtSQAqQqJbZvydY3BC1byNSisbYHTN
         e7kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=breachx.ai; s=google; t=1786779873; x=1787384673; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6E5bZO0QtG5GwP+ZYRPrGDTckZtMS40lPNJEkc15IRc=;
        b=hK6iEs/HYQb1f9mODTQnwLn+qJmcTdDkocHwcqvNJ6mdKsr+eyrjXFIBVB6OYyKd0V
         Af5vy1gLbyPG3nUJAYR2WzGFmELPFFGqiYkL4SAen8cbyXwHzs5I7vBO4YWy5dIb03To
         zFcmHK3Xy5H7R3N9He9VvnRRvSpxRu0Oy1zpn6Dn6EeIJON3H1Sr60HL9FJKa0B5IAWx
         CTlFsA4p3vdpraMzZBHPSgaYCPpl0AexzIOynjSzpIYUB8GTnNMvo4xipp58z29B9pG7
         D/dfMhskEg0gnp9nk3ZPOwci8O/6TwSBL7UyEH/XmSFjEZCsuJLSwz0j6MqrnvE1etvx
         ox9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786779873; x=1787384673;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6E5bZO0QtG5GwP+ZYRPrGDTckZtMS40lPNJEkc15IRc=;
        b=tKD2gDgSqfT37CTIvBfKRNfzCN4F15ASm/UidnE/NxnVZSY79X67HtfTci0Z8yOL0N
         cUXVgrKATGtsEaJ0bIvCUlZQDwp4p3QREF5CSux97rrHcCaJq9dlzpU8ugnK888xvniQ
         T8fmN+Rm96VSpt1GW0zQg5bzWJFqgsoOPtcLXAK+ESi4Zz7oeh97PZbpFenxNHL4x1pT
         fj3j56W7DP9dooc4LX5dPeM7BTSsrzOrqvKOF9jsJK2toGrkHmWrhS1Qf5lKtNfqgfVN
         U9XTbYNchNuyXA+WU7APQabWpzpnfioYUYaxFYKRVh1QY034Rv2pBIWVwRnzu7uuC+V9
         iNCg==
X-Gm-Message-State: AOJu0YwPVru6kyJe6jHh7qwhSpdeFA20hoIFE1upH6RiovTXCNLb64IP
	/5rCxmj0gTf0de+YJv/4bG9qW0Dt6nvUP3153gawc7hV1owvpxGuZhO/c7/oCo7+yBhm9PHMzMN
	50Up6FX6Q4LMlLVkwjNVR+0XiLXDGZNhRliXjp//qB6Q=
X-Gm-Gg: AR+sD13hU/Q3RQSxhIMnw8tfonU0UaSIrpTFNmdAsCWUodlgFwhia5gHISS5YwwnwWN
	djLsgQ4Ni27Rp/fIFzVbtbVus6stWsjlrFcU7qFL2x8YchStgvLWz7bp/MznZ6gIaIpwzrRgNfA
	Jx+g840QhzUiqqEFv4vu1uOzECsx3ktChS8hEPTdnhqztEvxeA3DKfig4lQ3vFs5rZWD9+wBMny
	zH8ukGGaZWxONbIwtalvO64D4+KUiw11vVGm1DKxPKocVAoWhWsF7DjXaknSf8yvd1n/QVqxpin
	JMWyUq4IQVjWsgrT4bgKewDQNnrU8HgTpeaXadE9L555P6ZvVkTQBn8NsuKRi0rNg+vunWGNQum
	NmOIGFWsVVjPqxpYZxuk4RDA2NWeC97Lct3nFmnLoAlGrvzr0agR5xMQquZuVB5BE8UmInuk=
X-Received: by 2002:a05:6a20:6f04:b0:3bf:6e72:68f9 with SMTP id
 adf61e73a8af0-3cc720e1af9mr13924036637.38.1786779873000; Sat, 15 Aug 2026
 00:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vivek Parikh <vivek.parikh@breachx.ai>
Date: Sat, 15 Aug 2026 13:14:21 +0530
X-Gm-Features: AUfX_mymDEBssOtnPxTrVt4a0TjDimv-TSZ3DQ5FSvcKAHRGkTDHgyYah7fs0mw
Message-ID: <CABYdpihXucDUdmj402-rOjRUuCXPaxe8a=XoBoJ8wbvAnsAu9g@mail.gmail.com>
Subject: ntfs3: no permission check on system.ntfs_security and
 system.ntfs_attrib xattrs
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

In fs/ntfs3, the system.ntfs_security, system.ntfs_attrib,
system.ntfs_attrib_be and system.dos_attrib xattrs have no permission
check. Any local user who can path-walk to a file can read and replace
its Windows security descriptor and NTFS attributes, including on a file
owned by root with mode 000.

The VFS deliberately leaves system.* to the filesystem (fs/xattr.c:
"No restriction for security.* and system.* from the VFS. Decision on
these is left to the underlying filesystem"), and may_write_xattr()
checks only immutable/append/unmapped-id. ntfs3 then checks nothing for
these four names. It does gate the WSL names:

  fs/ntfs3/xattr.c:967
    if (ntfs_is_reserved_lxattr(name) && !capable(CAP_SYS_ADMIN))

That is the only capability check in the file, so $LXUID is protected
and the Windows security descriptor is not.

Affected
  fs/ntfs3, present since ntfs3 was merged in 5.15.
  Verified on v7.2-rc7 (11028ab62899) and on Ubuntu 24.04
  6.17.0-1019-aws with the in-tree ntfs3.ko.

Reproduction
  On an ntfs3 mount whose directories are traversable by other users
  (mode 755), with a target file owned by root, mode 000:

    getxattr(path, "system.ntfs_security", ...)   succeeds
    setxattr(path, "system.ntfs_security", sd, ...) succeeds
    setxattr(path, "system.$LXUID", ...)          EACCES
    open(path, O_RDONLY)                          EACCES

  Measured as uid 1002: GET returned 80 bytes, SET of a descriptor
  granting Everyone full control returned 0, the read-back matched, and
  the value survived umount/mount. The $LXUID line above is the same
  user and the same file in the same run, which is what shows the
  inconsistency rather than a general lack of checks.

  A reproducer exists and is not attached, per the security-bugs.rst
  guidance for reports that go to a public list. Happy to send it on
  request.

Impact
  An unprivileged user cannot read the file's contents through Linux DAC
  -- open() still fails -- but can rewrite the file's stored access
  control metadata. Where the volume is later mounted by Windows, the
  descriptor is honoured there; on our test volume the resulting
  descriptor was O:WD G:WD D:P(A;;FA;;;WD), that is, owner Everyone and
  full access to Everyone.

  Not claimed: this is not a Linux privilege escalation, is not remotely
  reachable, and does not bypass Linux file permissions.

  Exposure depends on the mount. A per-user udisks mount is not
  affected because other users cannot traverse it. The case that matters
  is a shared or dual-boot mount that is traversable by several local
  users.

Fix direction
  Apply the permission the VFS would apply for user.* before handling
  these four names: inode_permission(idmap, inode, MAY_READ) on get and
  MAY_WRITE on set, in ntfs_getxattr()/ntfs_setxattr(). Optionally
  inode_owner_or_capable() for the descriptor write, matching chmod.

  We have a sketch of this but have not tested it, so we are not sending
  it as a patch.

This was found with AI assistance and we are treating it as public
accordingly. It was verified against the source and reproduced before
sending. If it is already known or you do not consider it a security
issue, please say so and we will record that.

Regards,

Vivek Parikh
Lead Researcher - Zero-Day Research Labs
BreachX
security@breachx.ai
Alternate email: viv0411.parikh@gmail.com
