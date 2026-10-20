Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456567;
	b=EZHevHQbRVDSx57s2YLbc4l1QsF89jXdCZL1Jn60F6Aivb/knCg6VwlBmvA7xFDfFxPy
	 kMpdHE69sbJ5tZKlF4kIRTAOpun+jytzi4FbWQNHJm3kkt+t8sLv8LtfhWJjG5L394r5q
	 jH/HeV7sxctXImdg0jUS1854OftNtowbKl/P43w7uuqbY8FcEQJ8ns/j++9Qyj0vnqD5o
	 h8P++H3LwtLuOv/MY0APothvIGXNcFgFc5l0hWAgvjVDzKorYjkItUwlTbUyBN2WhFe+G
	 qURWgqxZSdN9dnELrqHqX7IMDaop06v7AKFkH2k+MDkKJpFDnMOU9nsVy9QZ5kGNy/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456567;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=+VbKZgE77oR6fY4dX89WQhNpUG+RBUdvJIK74xP7xZQ=;
	b=n4RMCeQNOiKg2SMyvcLYhwvb4Be2tNZ3e/PVU2egjAre/825nH2vEBnBGSXXRCsd3PVn
	 3G85ug7jZx3g5K6Ce5rByOFXYh43ZZgqX/UImGRLKalzXt93En5344Cf7IgRXDBcJoM7i
	 xO4aoTnShGyOfDqOcVZHAHL+wfLsjQTwDUQuZEPFTHBt8VhZR/uScB1JlhlIT8PsHbIXB
	 lK544iwr4iQuQUTk1Omf/NXsw3Sk+DJ4H04KUQqbBYSsfWVIPtfPsZ0A5lByDBuI9XoKZ
	 DgvnDwrofbrDVO/oCfiOwEMc/eRVL+wxJcgaAtiJGd3IcKwScMdUUlQwKoVnQdbfw0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lmNL2kbW;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E868C606A31D
	for <ntfs3@lists.linux.dev>; Tue, 20 Oct 2026 00:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E868C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lmNL2kbW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+V
	bKZgE77oR6fY4dX89WQhNpUG+RBUdvJIK74xP7xZQ=; b=lmNL2kbWSSypfal5I5
	KxMBV4DoXT+JfAmk+TOygObiEmS2UpsABRL3tNfKBYIPK3PCBkbQ3eyN2cXKxFQO
	bVZqXK0swAJt9mSMomWmFZ3P1GJWOO8GG3uhLn6XoU5zAikh7IPf98fngvRqYqi/
	UySSjZzP0tNIW1gbPJ/mehwqQ=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDXH1Bst9ZqSouYBQ--.20142S2;
	Tue, 20 Oct 2026 08:35:56 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: hard-linking an ADS leaves stale directory entries
Date: Tue, 20 Oct 2026 00:35:56 +0000
Message-Id: <20261020003556.1011183-1-shawnq1@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXH1Bst9ZqSouYBQ--.20142S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw13Xr47Jr17WF4kAr4Dtwb_yoW5Jr47pF
	yvy3y5tFn5tF1avw4ktF4Yq3W0g3Z3Z3y5KFyDC34DAa1a9rnrZrWIk3yUZF9rtrn29Fy3
	Zr4DW3ZrGFWUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul2NNUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8g1ZZ2rWt21E1AAA33

Hello,

ntfs_link() accepts a stream inode and stores the new $FILE_NAME in its base MFT record, while the VFS dentry is attached to the ADS inode.  A subsequent unlink follows the ADS removal path, deletes the stream, and leaves the directory entry behind.  After the base name is removed, revalidating and unlinking the stale name calls drop_nlink() on a zero link count and wraps i_nlink to 0xffffffff.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/894a30b9b56d66f7eb8d82c79f2d0072/raw/1eb1367ed38b55daf97baa8ce89ec16458e0c2f8/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/894a30b9b56d66f7eb8d82c79f2d0072/raw/48442967d9156a166f389d2713eebeabcffacf32/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/894a30b9b56d66f7eb8d82c79f2d0072/raw/e74225d4e25db01c554ff2de341139708b8273ff/poc.c

Run in a disposable VM with a read-write NTFS3 mount.  The PoC creates the base file and ADS, hard-links the stream, removes names, drops the dcache as root, and checks the resulting link count:

    dd if=/dev/zero of=/tmp/probe.img bs=1M count=64 status=none
    mkntfs -F -q -L TEST -c 4096 -s 512 /tmp/probe.img
    mkdir -p /mnt
    mount -t ntfs3 -o loop,ads,rw /tmp/probe.img /mnt
    gcc -static -O2 -Wall -Wextra -o ads_link_nlink poc.c
    ./ads_link_nlink
    dmesg | tail -50
    umount /mnt

Two fresh-image runs produced the same result: unlinking the hard link removed the named $DATA stream but left its $FILE_NAME on disk; a later unlink warned in drop_nlink() and changed i_nlink from 0 to 0xffffffff.  A plain hard-link control reached nlink 0 and ENOENT with no warning.

Impact and prerequisites:
A local user able to write to a read-write NTFS3 directory can destroy an ADS and leave stale on-disk metadata.  With forced cache revalidation the kernel also reports a VFS link-count invariant warning.  No memory corruption or privilege escalation is demonstrated.

Validation: Two fresh positive boots reproduced the stale directory entry and link-count underflow.  A plain hard-link control reached nlink 0 and ENOENT without a warning.

Thanks,

shaos

