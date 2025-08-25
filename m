Received: from mailhub9-fb.kaspersky-labs.com (mailhub9-fb.kaspersky-labs.com [195.122.169.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720B51F95C
	for <ntfs3@lists.linux.dev>; Mon, 25 Aug 2025 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.122.169.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116885; cv=none; b=GJqMm3MVpXlHLCA6AL7SI7h3xiXl8E0MO4BCzU8eE/LeqLvjVBeE8rjM+J2lsn1FveUxt/o74WWWS28tEN61KF4wCNR2+tYjxeZ3f/WEHwhs7qnLDb09T6QJVRxKuPbIOdzyF6YA1mc4rzBJ2c7e5FgoLEnK+mBUJWTR1o1TWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116885; c=relaxed/simple;
	bh=wTT4f687RviT4XPRnYOHHt+WIsj2Z5vQhzteBZlx2bc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e6nFX3qjZJT/PvIsNNq7Ge6IRtcIIbxkPxfm9cO2t0C/kP6l+7xMgPn4A+Pl7FGQaX62GXyYmJ3fMdpgG1k/HBxUeZWIZ6QnbXoOlzgdP6NOaYKjX+musGw99sB5pI01tlnZNz0aHEi0Lgokn66SLu7ff36EgJqszWEN/DLBnm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=DWOxv7Qt; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=R/SdyWwY; arc=none smtp.client-ip=195.122.169.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="DWOxv7Qt";
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="R/SdyWwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1756116555;
	bh=izDY/mIwIJVLtiSbOkgOxgE/5YF0HgMNMtobWE5+ra0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DWOxv7QtCq0xSl0jRSYrctNrNXYTQVW5eNO3aXD8YKIzf9i5UctKzrLKRXI/rgUvw
	 Wsya75dHUXXD4QXXYTbaC9VIDpC8s2lVsRc5Aal0ZcRJVzGnIMI9zyP+E6HtTKVBHD
	 yLumWkFwdDdBlzSKui23x6mLikLuA65PaVMfoDIK72wyb0KLesn9bizH+YooE0D842
	 FEyhxbeEwa9U8Uai5Bdi7tUsFVuqZfHHlwEnxR+UguY1UVS59F4EL0Se8L1LuRwY4d
	 uVkZDxTANlVBaI5U8ppmRqNT6PzmNIqvgfs65U19r3w3FdqRJH5lWKXQPrRfti74EU
	 qR1OvF8Sf/AHA==
Received: from mailhub9-fb.kaspersky-labs.com (localhost [127.0.0.1])
	by mailhub9-fb.kaspersky-labs.com (Postfix) with ESMTP id 1DEE9908ECD
	for <ntfs3@lists.linux.dev>; Mon, 25 Aug 2025 13:09:15 +0300 (MSK)
Received: from mx12.kaspersky-labs.com (mx12.kaspersky-labs.com [91.103.66.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "mx12.kaspersky-labs.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub9-fb.kaspersky-labs.com (Postfix) with ESMTPS id E0D01908EC7
	for <ntfs3@lists.linux.dev>; Mon, 25 Aug 2025 13:09:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1756116547;
	bh=izDY/mIwIJVLtiSbOkgOxgE/5YF0HgMNMtobWE5+ra0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R/SdyWwYuMwSAAa0BKPJ18t7A7upzqVD7XhbkJywrLpCztdE9en6kDXRZyzx6eMss
	 CryxOgEE0qEFffcR3nt1h61LhxL4G2IetkkfJcN0aeYR5v1ASOsQZmoNftGVnnTw2k
	 zYHYXEnqz72n7FlCwiH4MReaiui+RSaIkVhqlWI2yO//C87HuuhPVIKTrUie2JVEYs
	 vgUcwq8shDku8IuGByJNalEzJ4dzPf9329aGNOnwNws2lZGhnXCWOY/CLswSJHmSP4
	 N2sKIIz4mRsTEbrwzHvROI1n3tXE9F/N9lclGcgOeartLAyLszW7lfvs+Hjzxv2Rj+
	 D4FNz7D71M8kQ==
Received: from relay12.kaspersky-labs.com (localhost [127.0.0.1])
	by relay12.kaspersky-labs.com (Postfix) with ESMTP id 608A95A143C;
	Mon, 25 Aug 2025 13:09:07 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id E740B5A1785;
	Mon, 25 Aug 2025 13:09:06 +0300 (MSK)
Received: from larshin.avp.ru (10.16.104.188) by HQMAILSRV4.avp.ru
 (10.64.57.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Mon, 25 Aug
 2025 13:09:06 +0300
From: Vitaly Grigoryev <Vitaly.Grigoryev@kaspersky.com>
To: <ntfs3@lists.linux.dev>
CC: Vitaly Grigoryev <Vitaly.Grigoryev@kaspersky.com>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
	<Maxim.L.Alexandrov@kaspersky.com>
Subject: [PATCH] fs: ntfs3: Fix integer overflow in run_unpack()
Date: Mon, 25 Aug 2025 13:08:55 +0300
Message-ID: <20250825100855.1590067-1-Vitaly.Grigoryev@kaspersky.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV4.avp.ru (10.64.57.54) To HQMAILSRV4.avp.ru
 (10.64.57.54)
X-KSE-ServerInfo: HQMAILSRV4.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 08/25/2025 09:49:40
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 195738 [Aug 25 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Vitaly.Grigoryev@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 64 0.3.64
 96c1edcdaeab4cf6c1fd6858be74d3893179d628
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: larshin.avp.ru:7.1.1,5.0.1;kaspersky.com:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/25/2025 09:51:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/25/2025 9:19:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/08/25 09:32:00 #27692559
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

The MFT record relative to the file being opened contains its runlist,
an array containing information about the file's location on the physical
disk. Analysis of all Call Stack paths showed that the values of the
runlist array, from which LCNs are calculated, are not validated before
run_unpack function.

The run_unpack function decodes the compressed runlist data format
from MFT attributes (for example, $DATA), converting them into a runs_tree
structure, which describes the mapping of virtual clusters (VCN) to
logical clusters (LCN). The NTFS3 subsystem also has a shortcut for
deleting files from MFT records - in this case, the RUN_DEALLOCATE
command is sent to the run_unpack input, and the function logic
provides that all data transferred to the runlist about file or
directory is deleted without creating a runs_tree structure.

Substituting the runlist in the $DATA attribute of the MFT record for an
arbitrary file can lead either to access to arbitrary data on the disk
bypassing access checks to them (since the inode access check
occurs above) or to destruction of arbitrary data on the disk.

Add overflow check for addition operation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Vitaly Grigoryev <Vitaly.Grigoryev@kaspersky.com>
---
 fs/ntfs3/run.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index aaaa0d3d35a2..09e4c5d90a2d 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -9,6 +9,7 @@
 #include <linux/blkdev.h>
 #include <linux/fs.h>
 #include <linux/log2.h>
+#include <linux/overflow.h>
 
 #include "debug.h"
 #include "ntfs.h"
@@ -979,12 +980,16 @@ int run_unpack(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
 
 			if (!dlcn)
 				return -EINVAL;
-			lcn = prev_lcn + dlcn;
+
+			if (check_add_overflow(prev_lcn, dlcn, &lcn))
+				return -EINVAL;
 			prev_lcn = lcn;
 		} else
 			return -EINVAL;
 
-		next_vcn = vcn64 + len;
+		if (check_add_overflow(vcn64, len, &next_vcn))
+			return -EINVAL;
+
 		/* Check boundary. */
 		if (next_vcn > evcn + 1)
 			return -EINVAL;
@@ -1145,7 +1150,8 @@ int run_get_highest_vcn(CLST vcn, const u8 *run_buf, u64 *highest_vcn)
 			return -EINVAL;
 
 		run_buf += size_size + offset_size;
-		vcn64 += len;
+		if (check_add_overflow(vcn64, len, &vcn64))
+			return -EINVAL;
 
 #ifndef CONFIG_NTFS3_64BIT_CLUSTER
 		if (vcn64 > 0x100000000ull)
-- 
2.39.5

