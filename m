Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795854519;
	b=h+AQdWr0K0wg6fvU/HV92d/0MyrQOX5iYARAQGpSY0kZbi2oQwPvNXXbOzk0zWbOGKGq
	 TJGupDYhKiZCW9SlrQPOe63mZxQa/Xx/10WjEvOrvd9fID039be7baz4DCsdT7lSO19wS
	 bPySIlzp7yrVbZCoX+Jf8khchYlVsC3ERPREobogq7NZWYbuw/dgH+b5ZUWjskDkyTsiV
	 eiTrfYKmPL2fN1PrC8aF0b6Uo9PJiYWrw9w0eVVeFoyHdmmtpeTN9LfM4R1kTahnOwFQV
	 6L2dupypEyTMsaqKWXirmzdv5XdWQgxuOV8TA5vIOeNjVkXjFMacgme6Q6uKDXDB2BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854519;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=7XF51mOXbIliBzKF2FUnifL7aWs0RRs0hg4W5lQZKds=;
	b=F1DwF9XSV7InEnx+4WTY5Vi5k9KwZB2VGQHtfmHaQXHw+19+spGwK+qZ//5wRqx4H227
	 g4tzjQvdrjvK0DLUt2lagg57GmYxNgVoqoXVOr8DmruvCLcvhPp6CZWpG1hjlh5vL9yju
	 tRFjdDOrBcrYPuDSnjgOhcesrdhbcZm+LDSQdxKP+2bykgEn+BR9Pa4G7sAgJInYfWScb
	 Ca4ElUr8/9KgJHc6+nVrUF2PC7fgIygcV5wayFw46ekWGG1lOHNMNLfs9mDDdAnn9Tu0a
	 dMHmrYvJjrAJSi8RVcO69UHvvwzYAs0QbMxx9nLMRUYBWuWqaCkiLsjWpZmPWjnhHmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BoTYJv5N;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48801606A680
	for <ntfs3@lists.linux.dev>; Sat, 28 Nov 2026 08:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48801606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BoTYJv5N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7X
	F51mOXbIliBzKF2FUnifL7aWs0RRs0hg4W5lQZKds=; b=BoTYJv5NCZSUpi+W7o
	alb6kkSWz5pN5itMyJPYIr1A6I7rr2U5EL/wr73GZ1hcNSIK2qo7+6XapmrNEUzQ
	An5GDkIReIuHj7eChSn9tiqTUbfyUHkDXc6avCL3LK8d3vVVFbrPcUTXV6b/PgYW
	mAhm68mHrV9Dhcsmy8ygtfGwo=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H8OqkAprXBpeKw--.40085S2;
	Sat, 28 Nov 2026 16:28:27 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: check fnd_push() return value
Date: Sat, 28 Nov 2026 08:28:25 +0000
Message-Id: <20261128082825.3074946-1-shawnq1@163.com>
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
X-CM-TRANSID:_____wD3H8OqkAprXBpeKw--.40085S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr1xXw17Cr1kAr1xuw1xZrb_yoW7XrW5p3
	9akFn5Kr1IyFWkJws2kF409F4fuwn3C3yUJF4UXws7uw4aqr1xXFn5Kw109F47XrZ5WFWF
	va1jva48Jay5XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFJmUUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8QuruWsKkKtghwAA3V

Hello,

indx_get_entry_to_replace() ignores the return value of fnd_push().
fnd_push() returns -EINVAL when the search path reaches the capacity of
fnd->nodes, without taking ownership of the node passed to it.

A crafted NTFS index can make the replacement search follow a self-
referential VCN.  Once the path is full, each iteration allocates another
index node, fails to add it to fnd, and leaks it.  The unlink operation
then spins in the loop while kmalloc-4k usage grows continuously.

The existing NULL check for hdr_first_de() does not handle this case.  A
related check in indx_find() from commit 1732053c8a6b ("fs: ntfs3: check
return value of indx_find to avoid infinite loop") covers a different
traversal.  The unlink path through indx_get_entry_to_replace() still
ignores the fnd_push() result.

The reproducer requires a privileged writable mount of a crafted NTFS
image.  It demonstrates a CPU-consuming hang and a continuously growing
kernel memory leak; it does not demonstrate privilege escalation.

Tested source revision:
HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
source version: Linux 7.4.0-rc4
compiler:       gcc (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0,
                GNU ld 2.38

console output:
https://gist.githubusercontent.com/shaos26/6527bc7b947fae21f2ff589d7725c451/raw/d7f2cde89b263e212053d7913002432466d8db34/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/6527bc7b947fae21f2ff589d7725c451/raw/c81a372534f86268589d2efee757cb035d5ba38a/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/6527bc7b947fae21f2ff589d7725c451/raw/cdb9e24d2f6aeac681926cef142f1634eb6fef2d/poc.c
image setup helper:
https://gist.githubusercontent.com/shaos26/6527bc7b947fae21f2ff589d7725c451/raw/0e7a810823bb17c6a2dda9e9fda5563fb3c30183/setup.c
index image mutator:
https://gist.githubusercontent.com/shaos26/6527bc7b947fae21f2ff589d7725c451/raw/fbe29e409a7507eecae2c7270558c81b3b0da6b6/ntfs_selfvcn_patch.py
patched-kernel config:
https://gist.githubusercontent.com/shaos26/6527bc7b947fae21f2ff589d7725c451/raw/d204ab19c4a8824c83293b94741f80cc0fa52b0a/patched-kernel-config.txt

Create an NTFS image, compile setup.c, and boot it as /init in a minimal
initramfs with the image attached as /dev/vda:

    truncate -s 256M ntfs.img
    mkntfs -F -Q ntfs.img
    gcc -O2 -Wall -Wextra -static -o setup setup.c
    mkdir -p setup-root
    cp setup setup-root/init
    chmod 0755 setup-root/init
    (cd setup-root && find . -print0 | cpio --null -o -H newc) |
        gzip -9 > setup-initramfs.cpio.gz
    qemu-system-x86_64 -m 2G -smp 2 \
        -kernel <linux-tree>/arch/x86/boot/bzImage \
        -initrd setup-initramfs.cpio.gz \
        -drive file=ntfs.img,format=raw,if=virtio \
        -append 'console=ttyS0 rdinit=/init panic=-1 loglevel=6' \
        -nographic -monitor none -no-reboot

The setup helper creates /tree/file_0 through /tree/file_599 and powers
off.  Copy the resulting image and make the self-VCN mutation:

    cp ntfs.img trigger.img
    python3 ntfs_selfvcn_patch.py trigger.img --patch \
        --out trigger.img --target-file target.txt

Build poc.c statically, place it at /init in a new initramfs, and place
target.txt at /target in that archive:

    gcc -O2 -Wall -Wextra -static -o poc poc.c
    mkdir -p poc-root
    cp poc poc-root/init
    cp target.txt poc-root/target
    chmod 0755 poc-root/init
    (cd poc-root && find . -print0 | cpio --null -o -H newc) |
        gzip -9 > poc-initramfs.cpio.gz

Boot the mutated trigger image as /dev/vda with:

    qemu-system-x86_64 -m 2G -smp 2 \
        -kernel <linux-tree>/arch/x86/boot/bzImage \
        -initrd poc-initramfs.cpio.gz \
        -drive file=trigger.img,format=raw,if=virtio \
        -append 'console=ttyS0 rdinit=/init panic=-1 loglevel=6' \
        -nographic -monitor none -no-reboot

Two vulnerable runs remained in the unlink loop after SIGKILL.  In one
run, kmalloc-4k grew by 270800 objects after one second and by 356140
after the signal.  With this patch, unlink returned -EINVAL in 36 ms,
the target remained present, and kmalloc-4k grew by 24 objects.  The
sibling and partial-VCN controls completed normally.

Check the fnd_push() result and release the current node if the search
path cannot accept it.  fnd_clear() then releases nodes already on the
path:

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: shaos <shawnq1@163.com>
---
 fs/ntfs3/index.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b367604487..151b71d4ddd94 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2303,7 +2303,11 @@ static int indx_get_entry_to_replace(struct ntfs_index *indx,
 			goto out;
 
 		e = hdr_first_de(&n->index->ihdr);
-		fnd_push(fnd, n, e);
+		err = fnd_push(fnd, n, e);
+		if (err) {
+			put_indx_node(n);
+			goto out;
+		}
 		if (!e) {
 			err = -EINVAL;
 			goto out;
-- 
2.34.1

Thanks,

shaos

