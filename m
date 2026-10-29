Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243900;
	b=FkzwTz94oI9xgWNVygl1Y+HyQHZuOFskdXLAj39fbwoZB0TNYNgQQ5kcajU3lTr2p4WI
	 shhqRLIIVmJMscTx5HttfawWg0Gz0CwHRUE9bItOCF2SlBePaho7tuOoks4y2SAWuJrTI
	 AwxcRtxxeEoRhAfWJ7b+dQ52Se0u7YxJaB3D3BwfFxadSr9mR8+zIPKKLMLMoUzrQR3G7
	 CpeC++VFvaOHJ0F7FTZVMaRiQJNjsC0TOGdYbULtNup8/w/qW/eWeqqKGYsyyj2jcpSBy
	 xAFEamENGk96ML9Vxx0O5ngnv3yIJVW6eMhBUNUeVG3SXDoOz5h9EyTvTTIa4LBK8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Pqa3G+YdkYhQdI9IZ8D/yqKBWxvlf8m9JxMAstqjQIY=;
	b=r6msvNnZw488LFTZH5QMf9q8NBaMgbmj5o6UFMjqKKBDS/6eZpVEgQu2Q74T9JeAwi+H
	 +uTYidPPYz1sJPxLgsrHx4j7yFPkQCUWe2BLv+czHa8H72ZPLlwszE/9SXai5L7+kOodj
	 8NxAuQnDMXJszZGyWhRQ5SkHD0KjxiZgntzCw/94SJnhlcnbQHDhcf1KAKys/8dFQtN5A
	 jJPLPk11wg+rzoCHIXoJmvbpIHCwIXQAbnbhES1+XA9ZpfVkH9q5wrwcP+KS00Vt4oK2C
	 4DyH5G40vVKevY9JiwNthGM7YjsAXrCwB6vQwxVL6bX+VUdGhlG514MPS3pnm4/3hLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="p/uPOqFd";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43A606A31A
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 03:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D43A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p/uPOqFd
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so4888224c88.0
        for <ntfs3@lists.linux.dev>; Wed, 28 Oct 2026 20:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793243898; x=1793848698; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pqa3G+YdkYhQdI9IZ8D/yqKBWxvlf8m9JxMAstqjQIY=;
        b=p/uPOqFdYzH0XpppQb+nKl4NqVtr8Mps9ZowjB4iawpvcHQoaV3pYhJw830nvkFGyV
         csujStHXoZWD1GzdS7xwePJTPJ57EbO7Y/7EBvuOUdUJoCrqQROEd9Uw3JnWAPy2HZm2
         YHi5QUwVSp8+bPVIFkZz/5imyqKN2EkCdc7yulHVaKrFqLy31zKCH2LxDDelwtUwEKMO
         BB4ZUCTB7ymPUKymLj8uDphVV/Gi0tV8OMcOQEbE+QkrkrqvNf4/uatVgpvk//sU5XmB
         MU6jC8KZnVkj1d8aZAZYGDIymOvzzL/+hXIxE2aJfLmwO5AFTqGR7TPAqPoeixZ62mKM
         K4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243898; x=1793848698;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pqa3G+YdkYhQdI9IZ8D/yqKBWxvlf8m9JxMAstqjQIY=;
        b=PZp7g8/Edvn/GdhEKFZiQ7PGG40oeLVK5dGoJFP1ebUkkOcVzVZTIroapL1wPPmIQ+
         iSsQ/viVv4yrJDAYUR/QewdLpND/ajAeHWDBPwd0vfkmb2Z2XyAehgrs8sfhLHmOSe27
         qD3tT+wBHWooC+fMBpai0GEtpoOp47wT3VK/MEEVgv7Yno1bnc1NyV00YF5vDythUIa9
         E5DYQDnt+RztIrwo0XD38cYABsMlH/fB/2k5uVHPrXAEcU3Uzc5fw3skliwMh3DGPNt5
         pWf1iLImrbQ7Q1l1IevQt634IukRxrz0qeoiC79ZJWtJYoB8dAq3H8zXVzLAIcMJ1kfg
         co/g==
X-Forwarded-Encrypted: i=1; AKwUvBzWEZEX93hFYJerbbhbDPm324MGf0gHe5j6TCUun35yIsOycz1VVyaG44WMFyjeXBCU6mMKQg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJhN4v+SXVf4zEPzu3BThDfgm78lewYol2O/HXnU9Di9nWQySM6
	GZvv8O6aFWBCw4LI3dqB0CK+eZ16mgwO2/sZGgMR5MB5cm+Q1qJykSLtxLi57r8w4w4LlpIuGtH
	bhimhJE1MAhzT+Q==
X-Received: from dlbcf38.prod.google.com ([2002:a05:7022:45a6:b0:195:8b4e:20b7])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1716:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1a6c800e43amr5835246c88.5.1793243897959;
 Wed, 28 Oct 2026 20:18:17 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:18:14 +0000
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029031815.2783998-1-cmllamas@google.com>
Subject: [PATCH 6.1.y] fs/ntfs3: fix null-ptr-deref in ntfs_lock_new_page()
From: Carlos Llamas <cmllamas@google.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Carlos Llamas <cmllamas@google.com>, stable@vger.kernel.org, 
	"open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Commit 95b917a14b15 ("ntfs: Do not overwrite uptodate pages") added an
IS_ERR() check on the folio returned by __filemap_get_folio(). However,
__filemap_get_folio() only started returning ERR_PTR() in v6.4 with
commit 66dabbb65d67 ("mm: return an ERR_PTR from __filemap_get_folio").
In 6.1.y, it returns NULL when the folio cannot be allocated. IS_ERR()
misses this and a NULL folio gets passed to folio_test_uptodate(), which
dereferences it.

This is easily reproduced by reading a compressed file while failing the
folio allocation:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 1952067 P4D 1952067 PUD 2601067 PMD 0
  Oops: 0000 [#1] PREEMPT SMP NOPTI
  CPU: 0 PID: 79 Comm: init Not tainted 6.1.190-02250-g79807e970724 #1
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1 04/01/2014
  RIP: 0010:ntfs_lock_new_page+0x23/0x120
  Code: e9 54 ff ff ff 66 90 55 89 d1 48 89 f5 53 89 d3 ba 07 00 00 00 48 83 ec 08 e8 f9 a1 dc ff 48 3d 00 f0 ff ff 0f 87 dc 00 00 00 <48> 8b 10 83 e2 04 74 53 48 89 c7 48 89 04 24 e8 d9 63 dc ff 48 8b
  RSP: 0018:ffffb9e2c024fbe8 EFLAGS: 00010207
  RAX: 0000000000000000 RBX: 0000000000100cca RCX: 0000000000000000
  RDX: ffff9f56c1ad2c00 RSI: 0000000000000001 RDI: 0000000000000000
  RBP: 0000000000000001 R08: 0000000000000000 R09: ffff9f56c260e000
  R10: ffffffffb6963140 R11: ffffb9e2c024fbd0 R12: 0000000000000010
  R13: ffffe4fc804266c0 R14: 0000000000000000 R15: 0000000000000001
  FS:  00000000092ca3c0(0000) GS:ffff9f56fec00000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000000000000000 CR3: 000000000135e005 CR4: 0000000000370ef0
  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
  Call Trace:
   <TASK>
   ni_readpage_cmpr+0x102/0x270
   ntfs_read_folio+0x44/0xd0
   filemap_read_folio+0x1f/0x90
   filemap_get_pages+0x41b/0x5d0
   filemap_read+0xd3/0x350
   vfs_read+0x28c/0x370
   ksys_pread64+0x62/0xa0
   do_syscall_64+0x35/0x90
   entry_SYSCALL_64_after_hwframe+0x6e/0xd8
  RIP: 0033:0x445162
  Code: 18 41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 75 1a 83 e2 39 83 fa 08 75 12 e8 1b ff ff ff 0f 1f 00 49 89 ca 48 8b 44 24 20 0f 05 <48> 83 c4 18 c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 10 ff 74 24 18
  RSP: 002b:00007ffd593a3b30 EFLAGS: 00000202 ORIG_RAX: 0000000000000011
  RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 0000000000445162
  RDX: 0000000000001000 RSI: 00000000004a9ac0 RDI: 0000000000000003
  RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
  R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffd593a3d28
  R13: 0000000000000002 R14: 0000000000000003 R15: 00000000004a4100
   </TASK>
  Modules linked in:
  CR2: 0000000000000000
  ---[ end trace 0000000000000000 ]---

Fix this by checking for NULL and returning -ENOMEM instead.

This is a stable-only fix.

Cc: stable@vger.kernel.org
Fixes: 95b917a14b15 ("ntfs: Do not overwrite uptodate pages")
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 fs/ntfs3/frecord.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index fcdaea02ba04..49766278eb1e 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2157,8 +2157,8 @@ static struct page *ntfs_lock_new_page(struct address_space *mapping,
 			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
 	struct page *page;
 
-	if (IS_ERR(folio))
-		return ERR_CAST(folio);
+	if (!folio)
+		return ERR_PTR(-ENOMEM);
 
 	if (!folio_test_uptodate(folio))
 		return folio_file_page(folio, index);
-- 
2.56.0.317.g454f8302e1-goog

