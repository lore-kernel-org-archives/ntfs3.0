Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456593;
	b=gVY6TwU3ytOJpXNl2BlOjLQJPeMlVJtyLTczI+t32mrto+u02fjfrIehxwrzSye3YB/a
	 N2/bp5mf/NbqcyqfH708jULNbUtFOpasHCJam2cyVNe9WOvWzquOGO0VcLmn8WTC7iixm
	 vJzWWeO0rbtfIVlLtL00UdrYFK8mpzQzTrhdSynQQyQGo0De3CgOpqfp9Y14GKFcebL9j
	 C78H0z/fO6MsLfo18N7c8mvOXTZkwRvMBPotKyeTPxChFmfgPsOtJ5b3WIlFmesaoFFOW
	 ziGsONzfJ1mUgRccG0uqgEPWeUGRCCSw53gFtfk10gKV/6wvJ/lbn0I2GFiO1KL/VyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456593;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=DpUqO6IYFNGg75SBjj0qg+xX0HmTEsTlFF09ahrMwrY=;
	b=i7tWM5CkcX99B4ifKl8GMHgCykCyBeTeHtEmMilfzTemrpTKtt/1fgRgKohIumtzPo0I
	 Zws4753IVPToAmYGXSqOAq3sILSroZwM/BnwjCc1qvlG66eSHihSQLVHRIK5T3CF2lzMI
	 ii9B2ocLkUqHKd2psPf+TTJgTeXuXyAdQRETVggfS0plLR9qqJHw5pEcT9j3UlqIFyWN/
	 4DbiBdkUISYgeIBlA5o6SKNZP/XDkZtN1ERa/EEbtSBLISAsHnnOD//16dsULvljBr7ff
	 l6zpHPkbaIK6o8L/jAzaQxY1055fZatN7IMqxhPWqfuiGaezAE0oq/2mDYb2nlc4wYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bInwt0Ld;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC79606A31F
	for <ntfs3@lists.linux.dev>; Tue, 20 Oct 2026 00:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC79606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bInwt0Ld
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Dp
	UqO6IYFNGg75SBjj0qg+xX0HmTEsTlFF09ahrMwrY=; b=bInwt0Ld+Boo8LgNd4
	zgrYr09i3lcZYZRCglHdUZCkrpV+R75KzhDDGaZzsOf5ro3MZkWNZVjGXs6e6cvO
	iR+FXkvyRRzg8NE+XD74jaYvS/++noEL/GFtdSKpbROIdAztDe2VQSAQ15vbEwn8
	qzaTDJSvmzhsfeJjQXpuzrAOo=
Received: from shaos.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3zTyMt9ZqfUOYAw--.46111S2;
	Tue, 20 Oct 2026 08:36:29 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: setting a security xattr on an ADS dereferences NULL
Date: Tue, 20 Oct 2026 00:36:28 +0000
Message-Id: <20261020003628.1011754-1-shawnq1@163.com>
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
X-CM-TRANSID:PigvCgD3zTyMt9ZqfUOYAw--.46111S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWkuFWUKw47JF1kKFW8Xrb_yoW8uw1Dp3
	909an5Kr4rtF4Utwn29FW8W3WF93sFyrWakF98Xws7ur45t3W7AryIk34YvFnFvrs7Kr98
	taykJay8Xws8uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWa0QUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbCzw1hb2rWt43w+wAA3B

Hello,

ADS inodes share the base file's MFT record, but ni_std5() passes the ADS inode's uninitialized mi to mi_find_attr().  Setting system.ntfs_security on an ADS reaches that helper and dereferences mi->mrec at NULL+0x18.  The crash is reachable with an ordinary setxattr() call by a user who owns the file.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/a045de92005a251e1cc33b71f352de96/raw/00e77de3ad1fe8ba5df29f5b5d54619025579979/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/a045de92005a251e1cc33b71f352de96/raw/3a45887bd13dcef8a37d87699309038ddc0aa586/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/a045de92005a251e1cc33b71f352de96/raw/4d7823afe03fcbc7299266715ed014e776105dca/poc.c

Run in a disposable VM with a fresh read-write NTFS3 image mounted at /mnt with ads enabled.  The PoC starts as root, gives its base file to uid 1000, and performs the triggering setxattr as that user:

    dd if=/dev/zero of=/tmp/xattr.img bs=1M count=64 status=none
    mkntfs -F -q -L TEST -c 4096 -s 512 /tmp/xattr.img
    mkdir -p /mnt
    mount -t ntfs3 -o loop,ads,rw /tmp/xattr.img /mnt
    gcc -O2 -static -o ntfs3-ads-xattr-null poc.c
    ./ntfs3-ads-xattr-null
    dmesg | tail -60
    umount /mnt

Three fresh image runs and a uid 1000 run produced a NULL-pointer Oops at mi_enum_attr(), called by mi_find_attr() -> ni_std5() -> ntfs_setxattr().  Setting the same xattr on a base file and using ads=0 did not crash.

Impact and prerequisites:
A local user with write access to an NTFS3 file can trigger a kernel NULL dereference and denial of service when panic_on_oops is enabled.  No privilege escalation is demonstrated.

Validation: Three fresh-image positives, including a uid 1000 run, reproduced the NULL dereference.  Base-file and ads=0 controls were clean.

Thanks,

shaos

