Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456573;
	b=vkJmoUa6Lbf3iGnst0r6zq0OLpQhtMa17v+qCTc+j3h8x73KoBbSHHlAllFSVXhf3HMP
	 pgpqZg5zrd4xWqUJ3xFFpiUgq832wLyoaEqbf2jN/IEX2BkWQRxo5EnTrp9sJjtwiwYqW
	 Wt10ZThiyt8PBeXo4nbzF1JVQuRzReDb8VrG8E9Lp7IJ7huUDer3FVp43x+AIQS6vBjUZ
	 eLy5lmfZ9X5TM5fRBOdn8ogsL4Q61if+unNxEIpfR4yo5ONFJFkb13zcdIM2HOXExEVyQ
	 GzeW37BFL5hX8e17gKcJnncWuXP3rjQb0xLnE5TC+F64MFtpcnMel1qvPx9eQSEnEHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456573;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=5uz/3kAW0IxwRLiWTNUZZk/dGUcJrArwJeXsdHpf+iU=;
	b=T1Gnhc3AVfOHUTR+pwkhDRD3YACnRy7DfF+CbT7JLLnSL59gq9GFlGw3G/2Cc3cB0n0x
	 9c2N56RPtIYq94ETznQKouMoktfcMpipK0QUiwAyN64kJmHaWJA+/ICztOGWdhokW11em
	 Jynyam384p9Bqrpr2oNnk5LaLY85u3daM84TlfEyheBMkUgHx9s4N4XrkfNx2DA7z9w0b
	 OiiUxgxK33I/N1F45A7uR3aXgM8ZMjmO/c37J491c8Wijo+YMdO1rFl5lnwJ8DhcPPx7u
	 blxce2jZw4MQDP9ab/tQm/+twdJCsLWC7qTYSEzO7u+kdxil/p+8t1F4E3feEd2/G6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FEUDwAP1;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4266606A319
	for <ntfs3@lists.linux.dev>; Tue, 20 Oct 2026 00:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4266606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FEUDwAP1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5u
	z/3kAW0IxwRLiWTNUZZk/dGUcJrArwJeXsdHpf+iU=; b=FEUDwAP1uoAkJVkUgP
	T1nOtr2K9bY/XedejSHn0BO5Dn28iLeyPmBLHy30MYdmpAJl9j8ru2pjwxVEfBRB
	O5wIXGULnW/zvr3w2JM/coIDjA1LtQOOzdCtcQjwqPc9ZLqx4W0Q8OMxoRFgCZDU
	xMSPRioXT/yyyD77ySrB0VEdg=
Received: from shaos.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnb5x5t9ZqNJWPAw--.45303S2;
	Tue, 20 Oct 2026 08:36:09 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: closing query_streams can dirty the volume
Date: Tue, 20 Oct 2026 00:36:09 +0000
Message-Id: <20261020003609.1011439-1-shawnq1@163.com>
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
X-CM-TRANSID:PygvCgDnb5x5t9ZqNJWPAw--.45303S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1fZr4xuF4xJFWruryUWrg_yoW5Jw1rpF
	WkArWftF17G3Wjy34Iga1FqF1Y934fAayDK3s8Z347ur98JrnxA39Yya4YyF17Jr1v9ryY
	qFWxua4DXr4j9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul2NNUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC0BpcamrWt3ry0QAA3u

Hello,

The :query_streams pseudo ADS has no backing $DATA attribute, but ntfs_file_release() treats it like a writable stream and calls attr_set_size_ex() on last close.  That lookup fails, marks the inode bad, and sets the volume dirty.  A later read-write mount then refuses the volume until it is repaired or mounted with force.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/696df55ba34ba3d0ea908a473c5628c0/raw/a388466cae0def97290365e4daaf573405381b73/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/696df55ba34ba3d0ea908a473c5628c0/raw/f1f2cc408fb1591991bf120e6c749ec011f3db35/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/696df55ba34ba3d0ea908a473c5628c0/raw/4ef0ad6f0d9b4a630b3b072332e53e7586c36c89/poc.c

Run in a disposable VM with a fresh read-write NTFS3 image.  The pseudo-stream open and close are done as uid 1000; unmount and try a second read-write mount to observe the dirty-volume refusal:

    dd if=/dev/zero of=/tmp/query-streams.img bs=1M count=64 status=none
    mkntfs -F -q -L TEST -c 4096 -s 512 /tmp/query-streams.img
    mkdir -p /mnt
    mount -t ntfs3 -o loop,ads,rw,uid=1000,gid=1000 /tmp/query-streams.img /mnt
    gcc -static -O2 -Wall -o stream_dirty_poc poc.c
    setpriv --reuid=1000 --regid=1000 --clear-groups ./stream_dirty_poc /mnt pseudo
    sync
    umount /mnt
    mount -t ntfs3 -o loop,ads,rw /tmp/query-streams.img /mnt

The UID 1000 run marked the NTFS volume dirty on close, made later access to the pseudo stream fail with EINVAL, and caused the next read-write mount to fail with the dirty-volume check.  Fresh-image positives reproduced; read-only open, a real ADS, and ads=0 controls stayed clean.

Impact and prerequisites:
Any local user who can write a file on a read-write NTFS3 volume can persistently mark the whole volume dirty with one open/close sequence.  This can deny subsequent read-write mounts and require repair.  No memory corruption or privilege escalation is claimed.

Validation: Two fresh-image positives, including a uid 1000 run, marked the volume dirty on close.  Read-only pseudo-stream, real-ADS, and ads=0 controls stayed clean.

Thanks,

shaos

