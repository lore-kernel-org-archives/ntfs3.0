Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456580;
	b=dpFhDZAl+bCT9o/D1YgeH0C0r2UegCd+7KBu6Gq05mCjpfXz6+ppyG4/mRPQ9jpnRBob
	 69FXi5VwBA3SeXspNGPEzjtMqBId14PhEOZDygaLDytuhcSGC9Tycs04R/ucDCug0GdLF
	 knt579e/DZ0M/gUtDVF4fgZlg5gVk3Lpj9JKAGi9MowdI4gAOkyCijFCU06wj2CiQmC26
	 wWAnTu+0lbw4wfj4r9ET6B5XBCs2sm/x2Vt+jp5QQmkGmFeKrkaEG8ZfhgE5oM79wnDwX
	 P36LkPmhGEZOqmkYrlVoapRwt6lPyHiZmbt7mA4fkyC3zg8GeZCjkhImn+ng3nwAMWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456580;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=vrwQ4UcFXwhQ3qDSdK1JN1nsT3iCEicbv6hL+NhyQIw=;
	b=IwopSqG3Ecs4e5oUhc1nrE2aihZ5NQRFiR5+VAQMHXH8D/IxuYW1/8O4ChOQnwRj7Wv6
	 xZxU+kTlgK5YvFy2bzX2PIO/DQ9NKZxmy0s4DHk60vKWZSDwZ5c9nJ74sAfhA28WK8ovZ
	 hUL3+yu9Wl80EleOx9lKUdLu49/a0RQg0G4arwB/LK4iHG7qS65lRrYgFd9cT6LVE3p6w
	 bQyQH4La7HdKNh6VgC2KzVVPvRNWkk/G6Y0QOeCRrVSdajrR3m7lg/sEEJT/Tb4YJ2xfq
	 TkrywZrDcgyquZti5OhFDBlSXzDfQXV+Scb3AaMbEwb52fy5F04eRQqDALnFQKLTfIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=p+21fwko;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC94606A319
	for <ntfs3@lists.linux.dev>; Tue, 20 Oct 2026 00:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC94606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=p+21fwko
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vr
	wQ4UcFXwhQ3qDSdK1JN1nsT3iCEicbv6hL+NhyQIw=; b=p+21fwko9kAFsDQhes
	7tXYcdhmPHu6mkosxOWaRfiuwtbeYWkpan9cpiuYhgwpmbepT25J/Ggp/Ah3TNQQ
	epzFPzcYw8+Ms06KGGfc5+zIpdx58nRwbq+VmzbRh9Cak2oy9ktkXSk4wgZ32v+J
	3zK512kYJIb6HlbA+7jsn+ruc=
Received: from shaos.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCnZA2At9ZqARJXAw--.38032S2;
	Tue, 20 Oct 2026 08:36:16 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: an ADS rename target can overwrite a base file
Date: Tue, 20 Oct 2026 00:36:16 +0000
Message-Id: <20261020003616.1011559-1-shawnq1@163.com>
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
X-CM-TRANSID:PSgvCgCnZA2At9ZqARJXAw--.38032S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1xtF17JF18JFyUJFy5urg_yoW5Gw1Upr
	ykAFWfKFs7tayUtw1kZF45GFyrWwn2yFWUGFyUX3WxCF45XrZIvw4fKFy5GFy7Zr4kGr1U
	XF4UZa17Jw4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul2NNUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8QBebGrWt4BD8gAA35

Hello,

ntfs_rename() rejects an ADS source but accepts a target name containing the ADS delimiter.  With ads enabled, the target parser truncates f:ads to the base name f.  The existing-target branch removes f before the rename installs the source under the truncated name, silently replacing an unrelated file.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/ed9ecf403e25839c2adc7cca3429b29b/raw/3b3e7b34634cf0d124b98ae8ca648213707e55af/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/ed9ecf403e25839c2adc7cca3429b29b/raw/5eeafdbb8044bfe53ae5eea6ab0a15ff311a3152/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/ed9ecf403e25839c2adc7cca3429b29b/raw/4bcf15d059e55bc0a19c6320263fb5e34657a5b4/poc.c

Run in a disposable VM with a fresh read-write NTFS3 image mounted so uid 65534 can write to the root directory.  The first invocation creates the files and attempts the rename; unmount and remount before the verification invocation:

    dd if=/dev/zero of=/tmp/rename.img bs=1M count=64 status=none
    mkntfs -F -q -L TEST -c 4096 -s 512 /tmp/rename.img
    mkdir -p /mnt
    mount -t ntfs3 -o loop,ads,rw,uid=65534,gid=65534,umask=000 /tmp/rename.img /mnt
    gcc -static -O2 -Wall -o ntfs3_rename_ads poc.c
    ./ntfs3_rename_ads /mnt setup-run
    umount /mnt
    mount -t ntfs3 -o loop,ads,rw,uid=65534,gid=65534,umask=000 /tmp/rename.img /mnt
    ./ntfs3_rename_ads /mnt verify-run
    umount /mnt

Three fresh vulnerable boots returned success from renameat().  After remount, a now names the original source is gone, f:ads is gone, and f resolves to the unrelated file that had previously been named a.  ads=0 preserves ordinary rename semantics.  A diagnostic fixed-kernel control rejected the ADS target and preserved all files.

Impact and prerequisites:
A local user with directory write permission on a writable NTFS3 volume can permanently lose the pre-existing target name and replace it with another file.  The operation also leaves the original MFT record and clusters leaked.  No kernel crash, memory corruption, or privilege escalation is demonstrated.

Validation: Three fresh boots reproduced silent target loss.  The ads=0 control and a diagnostic kernel that rejected the ADS target preserved the files.

Thanks,

shaos

