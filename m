Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF123859C4
	for <ntfs3@lists.linux.dev>; Tue, 10 Feb 2026 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739001; cv=none; b=ThrMKUMR+j7NokkKSa+rhelsGDx4gNPtf2fBkWEyfoaPQZN4j/JLmSJpX3FCmhWSGizTWLa+xsaFin2UyUQR+Ou5q2NIzFs9J0k+U/3C7PqOox2U2dLe8xDDBmZ5kPwdMVQonnhKErP+hhJOL3TBN88BaV4US6ajXKRcZtZLRfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739001; c=relaxed/simple;
	bh=b1KI81QCVyZKda481lPa8TvpkjXnj8jSJ7iZxEBkXKw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ezjIJ17+RqpTMlnlMY8ouRXqAeaZT8pkSsMKW24Qn1ofv7r2a4D9XGKcI+8owwkKNjfP9JmuNDoI843xMg40BApENHrAQU4BamciuJlTCdQVko6mqoxQ9S2S9Xp1zrw/CBdBLOYoGlYSnxC7wyOsuETPM+BJkvOMH3UWhKJq/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=N5u5+Qbi; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="N5u5+Qbi"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c7199e7f79so595471185a.0
        for <ntfs3@lists.linux.dev>; Tue, 10 Feb 2026 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770738998; x=1771343798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDpGjkoxzYtvXKPUSGDqMhAIzIEx7lz/mHNbFicp3GE=;
        b=N5u5+QbimUxWdvN9RRaY0l1qw6RTFi0/zrTkKBQ7U9sgguVlxmgYi4NgOFgIyDNQRv
         oXPQYfhdxW4bdYxP3HaVfe0inm9keb1rm3yMifCM2DFiQYBqr7ZKn1LLaXWaEzTjrcCE
         4aeq8+MKWmO9NrBIKlaBAOiYptmbQ8eMP0x7R3Ds2tycE4WpRf4RjweQ3M6dFHYciqB/
         tH8W8hwq4JA5j3LcflNPCpYCj/8K2z1BGBhA3+6T+JdVG/579EWNyPpRo0H2ytNV8SsT
         Ckin4RBTjQN/WaJdwZ/Di8pSSCEVAM4Vs7UPlPZ1bA83Xt1BA4gXZiO110GOZN4ZBueY
         71Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770738998; x=1771343798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDpGjkoxzYtvXKPUSGDqMhAIzIEx7lz/mHNbFicp3GE=;
        b=AaYxE0R5hNP7/8tJfvxNzwbi6KCHGhSaXVYyosMS4IZlayt0Zc4ya73D5LtqBYsOEc
         Sk2NiQeK6VNq6li1vzhLq1l9ew3BR6TydXEzdhlYivEOfK0sHpD9uq/awz2kiJlJ2815
         31S5VyUxMFc2gT0sAc0Ml9m31d6u0trez9OupBZLQLgvbmoisOa1kh/XqGxirh1zoaEc
         Q9RfIc8mip/qk8dhvrsJaRTFntOZi2ejI3Mzp+kBxHM+/vfQBFxiHBcagW8/038eRT1h
         9Z34Iq4b8XykM4lIgUl/+fW6Y3Qs6ymmacESuv8fZ+isOfxS0C1rPEH6FOA9Q4ZFQbAB
         YS8A==
X-Gm-Message-State: AOJu0YyY5DfzlEmjhoNb34j8E4juST1yAoPG/2V6mlX7jX/Y6nP//WKW
	exxS+KqN6frvZf5WcNmqCdMiaiLJ7rTRxDj5DmCGLwmuTnGslC3zFPc8rZpgj5vqm74=
X-Gm-Gg: AZuq6aLmmgPkBX5RRzH4nlS9686r0qXNp5jkBFNUEnsyQ+SYdntkM2El688DPd+VSkT
	uJjuJRQIJls9uRS3VrGnk+0eGVViZQHPOxpvZP0V0jiTabSMbTU4BWytRrRFwfUyb5KAMETXGGw
	uU/bKMKe67WsuGopOEWg+NknwhSaqCQidCBuEK9CoAGj5PbfXscTtvbZqHHT11yZMl2KY5gGy9V
	0TY63QIL+1oofJ2orQh6K09Gqbb4xfEo02gug31CXPvaa5IZ2eNMl+wD++TPc8mZFN7vgf+R3Hw
	AMsEuyg1MpBLfWe2LWqzkdQI/WynXo/cSZC8p7TlOQC8pMeA1tM54d/QVrvcq9g1/2GiAewtyXW
	FAEoKuU2F+hl3JYwvJA93tIwX2ckJwNVMRP+j/7GzfOxvd65lVE1NUFRkHL+bdTKoBiyCs+q4Vd
	CCoW8xjbP454+dkkDzoy4iFSYCqGMX5QE0YGiedibk8MxZ8rFHWT4nwWkg1Z5Zp3bbp5JQoHkdX
	aizkPt/tSUeGKWzd9+J7UeKW0v2UFL+rXDCRisZzpeZ7rA+1YctPw==
X-Received: by 2002:a05:620a:7010:b0:8c6:e1ff:8cfa with SMTP id af79cd13be357-8caf1307e4fmr1949595785a.60.1770738997009;
        Tue, 10 Feb 2026 07:56:37 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f6f20sm1048773985a.2.2026.02.10.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:56:36 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] ntfs3: reject inodes with zero non-DOS link count
Date: Tue, 10 Feb 2026 15:56:34 +0000
Message-Id: <20260210155634.380168-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_mft() counts file name attributes into two variables:
names (all names including DOS 8.3) and links (non-DOS names
only). The validation at line 424 checks names but set_nlink()
at line 436 uses links. A corrupted NTFS image where all file
name attributes have type FILE_NAME_DOS passes the names check
but results in set_nlink(inode, 0).

When such an inode is loaded via a code path that passes name=NULL
to ntfs_iget5() and the nlink=0 inode enters the VFS. The subsequent
unlink, rmdir, or rename targeting this inode calls drop_nlink()
which triggers WARN_ON(inode->i_nlink == 0) in fs/inode.c.

An all-DOS-name MFT record cannot exist on a valid NTFS volume.
Reject such records by checking for links == 0 before
calling set_nlink().

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 fs/ntfs3/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0a9ac5efeb67..a2984a4996c8 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -433,6 +433,11 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 		ni->mi.dirty = true;
 	}
 
+	if (!links) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	set_nlink(inode, links);
 
 	if (S_ISDIR(mode)) {
-- 
2.34.1

