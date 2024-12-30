Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8113E40F
	for <ntfs3@lists.linux.dev>; Mon, 30 Dec 2024 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735542612; cv=none; b=ZzAzkifGP6XOznIRV0DeO1O4d5YSk4NTy25RM7jf8xYh4xak1i+jzfc0hLzN7UlceUiFCW0ueHBZPvlKIaQg/Cq2zXvHRSYygHFpuw8u52Fgqc66vWTKGKE1SK6Oxltz26gqHqSBA7grzTR4VK64/jiTWHyf+mx+dmIp8X7vt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735542612; c=relaxed/simple;
	bh=8Tscofo+TGCfTPq1Y1zBn3HXCMt56JKswzAt3SWLuBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0MwpY51q8QqpwHRl5w8Z4lPYQEVur9ORln6MvaP+r64LGWivktMibjgZTXEBVL4yHBlP28VzGPqv5Fji7Ie7Hoom6SXZx9+IdIVk1Os36sWawjtCf6a5SE9JNnfs/GId4COM9wyKh0NM8ALQRyEx3Fg021r5A4J8z742frJ0WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU6jWNq024027;
	Mon, 30 Dec 2024 07:10:08 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a81dek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Dec 2024 07:10:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 29 Dec 2024 23:10:06 -0800
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 29 Dec 2024 23:10:04 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <lizhi.xu@windriver.com>
CC: <almaz.alexandrovich@paragon-software.com>, <linux-kernel@vger.kernel.org>,
        <ntfs3@lists.linux.dev>,
        <syzbot+5d0bdc98770e6c55a0fd@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH V2] fs/ntfs3: Keep write operations atomic
Date: Mon, 30 Dec 2024 15:10:03 +0800
Message-ID: <20241230071003.130590-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241230060902.7526-1-lizhi.xu@windriver.com>
References: <20241230060902.7526-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cXmpAaODkUuDdP8K3dm-rfyMQIpE8uuM
X-Proofpoint-ORIG-GUID: cXmpAaODkUuDdP8K3dm-rfyMQIpE8uuM
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=6772474f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=eX3EWibwm58GufKUjPQA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=971 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412300059

syzbot reported a NULL pointer dereference in __generic_file_write_iter. [1]

Before the write operation is completed, the user executes ioctl[2] to clear
the compress flag of the file, which causes the is_compressed() judgment to
return 0, further causing the program to enter the wrong process and call the
wrong ops ntfs_aops_cmpr, which triggers the null pointer dereference of
write_begin.

Use inode lock to synchronize ioctl and write to avoid this case.

[1]
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000086000006
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=000000011896d000
[0000000000000000] pgd=0800000118b44403, p4d=0800000118b44403, pud=0800000117517403, pmd=0000000000000000
Internal error: Oops: 0000000086000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6427 Comm: syz-executor347 Not tainted 6.13.0-rc3-syzkaller-g573067a5a685 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : 0x0
lr : generic_perform_write+0x29c/0x868 mm/filemap.c:4055
sp : ffff80009d4978a0
x29: ffff80009d4979c0 x28: dfff800000000000 x27: ffff80009d497bc8
x26: 0000000000000000 x25: ffff80009d497960 x24: ffff80008ba71c68
x23: 0000000000000000 x22: ffff0000c655dac0 x21: 0000000000001000
x20: 000000000000000c x19: 1ffff00013a92f2c x18: ffff0000e183aa1c
x17: 0004060000000014 x16: ffff800083275834 x15: 0000000000000001
x14: 0000000000000000 x13: 0000000000000001 x12: ffff0000c655dac0
x11: 0000000000ff0100 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff80009d497980 x4 : ffff80009d497960 x3 : 0000000000001000
x2 : 0000000000000000 x1 : ffff0000e183a928 x0 : ffff0000d60b0fc0
Call trace:
 0x0 (P)
 __generic_file_write_iter+0xfc/0x204 mm/filemap.c:4156
 ntfs_file_write_iter+0x54c/0x630 fs/ntfs3/file.c:1267
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0x920/0xcf4 fs/read_write.c:679
 ksys_write+0x15c/0x26c fs/read_write.c:731
 __do_sys_write fs/read_write.c:742 [inline]
 __se_sys_write fs/read_write.c:739 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:739
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762

[2]
ioctl$FS_IOC_SETFLAGS(r0, 0x40086602, &(0x7f00000000c0)=0x20)

Reported-by: syzbot+5d0bdc98770e6c55a0fd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d0bdc98770e6c55a0fd
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
V1 -> V2: unlock and return err

 fs/ntfs3/file.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 3f96a11804c9..d3a31bad21f9 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1228,21 +1228,22 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ssize_t ret;
 	int err;
 
-	err = check_write_restriction(inode);
-	if (err)
-		return err;
-
-	if (is_compressed(ni) && (iocb->ki_flags & IOCB_DIRECT)) {
-		ntfs_inode_warn(inode, "direct i/o + compressed not supported");
-		return -EOPNOTSUPP;
-	}
-
 	if (!inode_trylock(inode)) {
 		if (iocb->ki_flags & IOCB_NOWAIT)
 			return -EAGAIN;
 		inode_lock(inode);
 	}
 
+	ret = check_write_restriction(inode);
+	if (ret)
+		goto out;
+
+	if (is_compressed(ni) && (iocb->ki_flags & IOCB_DIRECT)) {
+		ntfs_inode_warn(inode, "direct i/o + compressed not supported");
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	ret = generic_write_checks(iocb, from);
 	if (ret <= 0)
 		goto out;
-- 
2.43.0

