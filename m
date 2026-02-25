Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8234E3451CF
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059301; cv=none; b=h8NZ/C74Jc7skeGUqdVrhFkg2xj2YKkY13fHZMkeQnPx88Ny+UNvKjJg6mGcJ1uhQ9t3FpgkwVVJh0H5K+4Jd+vKPQFlUIrG5ElPJyhRN/ynQnQdy0Fqj4ZqliJF8+k+NFmr1B/eTlawtYuE/vOASE6Fzqy9K7IP5vxP0gfvDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059301; c=relaxed/simple;
	bh=wvO7UclkDfOFQdfC1evvQhRGdmzqdeL+WI5Bp8USXg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vzbnxh21iPvb7qHh60cVeXxkbxRybh2QR+LJt7+8fl5+P8ARd5Gh2p+v5mxb4C42SjdtqaSvLWfDrhVyGVZp+hP8NWpHBY4Yeet44VeEauJ0l4M94oDCeXwuvPyHy0Rl7vHw6qtqUlSr0YwaPv9bT3VtE2IWFt1+FJhhYZ+dToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dk9Jybov; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dk9Jybov"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PMDZg04071210
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=B+x8
	HlKrObJCF5zGXiosgMuiJzbAlNo3I+yj4hi3OCU=; b=dk9Jybovs8IHdEvEGP9P
	/Q+tTmC5El4AZB2gHDz4eA8v6PeKwiNC27gSP64f3zuophROaYaLhYmmHZXiKwMJ
	NSRp7hKX/59LhbwItsKVPFd7Crde5MZ4zs3tGudNHcoxx4fALdYT98VxFmtL21u7
	fGfx2Y40whZsXWbmDY0qeSprynaAbzY7D4ttYLp1lNjUZRCarCpKgXdwbIuqQBKo
	dAh2ixL7cwqcSMAUrxeiWUHwrgu0D6JUMLqoY/Z34kR3anogYSc0Opb+0Pn0KWVM
	aWbq5vkVIyD/o2s7Co6n14E/UIIBlvbWXdW76yZm6WRRtPqcpoGOJFPXc2AOxDga
	cA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4cj35vcd7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:41:39 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506bfff75edso29152601cf.3
        for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 14:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059299; x=1772664099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+x8HlKrObJCF5zGXiosgMuiJzbAlNo3I+yj4hi3OCU=;
        b=Ngi+JEpB0jSG5xVd4tV0CKZstySQqQT56LUkfZMrsRp8h/cRT6CzDtu6SsCfnwGdR6
         fDmbK0fMOr2IeRK5res9O46/eTwWo9FQGxxGzPgAMh94jcVmd5IEwQYYpn1SH+22fF98
         kd15o3XuMcoTHLmptLKdnJKODzIvKW0DnASr+jOs+LPVzvMaJSv8OzfpQgif6UTMUCyi
         q7PAkdO9DHlllW2j1vYJ5LhjHRvHectIIYlt/2KGW9Ew1Xw8/NRKkHCdjzbThxte2Dag
         56c43ohGQbhx2MmpHWCzxSeBHGnZy16Jhbnm1tBJXjbJh5N+kJmxgEGdNF2afcyC7PE+
         AC+w==
X-Forwarded-Encrypted: i=1; AJvYcCUjDC0VV1gylPvO6b4f6g0Mt8Vqzv4pKufEFA3GTahHqn9Atl3ImHx3vF1kuF1H/X31VuG+qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwU6DHoZfcedwdLVBmLmfhuFu44YNy0dETAMstKpP0antfZSu4o
	dyxxT0ZsVdMDEvObYpKWawnHzIchzQCX7WQdJW7zU5Bu/KeGRL/DavR2itbvOtC/rDJ6wYMIANV
	MYEpdvGi87pTXjkGwwCvg/qhW2jE5PhtkaUFs0WBT2ht0ku6hL8an
X-Gm-Gg: ATEYQzweVK2rg9ZF5TR3hkvkmAxto8s41V5WF6TA/yxPMbHFwg9Enp5bjnBSh1VjLhg
	w1PGyzfSrAgD0n6sgVJWlhHppo/NDHZi5lQV7/OGI7vzoYovcgtlQcCt2/hZGfzA4Xc5kgUyeha
	Rv+dIkGKUHvXHqnY2rQcrd3qr1ASLhnGrhgcwMbydCiU8oA1LcsMl6h1lsymNtg11hDXN0nXRtu
	DZCI6kqz3ktUm19omSBZU2r1LzopFO8XT/BpFmsxrEcYDrXrnkY4ZilkIGsIzkmgbYmtXjuALNa
	v46fEVtuF2EuK/ME6gkaVHeU3qiEr5l29GZ6jFsyFYkUZ08I6+KopofNmbPpIEAA+740l2Ly9C7
	+0GvzKUS7ejILt6a5jMF/O9jkdtofqFkq
X-Received: by 2002:a05:622a:44:b0:4f3:59c1:768c with SMTP id d75a77b69052e-507460dc42emr758621cf.60.1772059298711;
        Wed, 25 Feb 2026 14:41:38 -0800 (PST)
X-Received: by 2002:a05:622a:44:b0:4f3:59c1:768c with SMTP id d75a77b69052e-507460dc42emr758291cf.60.1772059298273;
        Wed, 25 Feb 2026 14:41:38 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449be47dsm4196231cf.15.2026.02.25.14.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:41:37 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 17:40:56 -0500
Subject: [PATCH RFC v2 1/2] filemap: defer dropbehind invalidation from IRQ
 context
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-blk-dontcache-v2-1-70e7ac4f7108@columbia.edu>
References: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
In-Reply-To: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>,
        "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Bob Copeland <me@bobcopeland.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
        ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net,
        linux-mm@kvack.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772059296; l=4861;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=wvO7UclkDfOFQdfC1evvQhRGdmzqdeL+WI5Bp8USXg0=;
 b=h4bisF4GoCaCSoqd37/ZfJNSaUymW/3u+9LXcqmZG0KnRoDbGHtk/4qRW+EsLRX8yAk3THDOa
 S2MblO1dCLPBna+BzWEdZKkpfva3GYEHQU94DPCiujOK2l2fhb+tpu1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: BbsIjgx80PtgcgK6azzesLIUd0eDipi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIxNyBTYWx0ZWRfX8yazd9mHM+kX
 Kbo+MI1FVEA1sdWPd1BbDLjY++aepmEN0VkGxDAdLtSyRN8LNIr8rkzbxFA0m0uup8wHFpAoGLn
 mGELifEhXcccf4E9uARTsrAIP8Ruqigq8qa8315vEcpGCKieIjVsz4tZEF+RIiM4PPYswD4sM7F
 yxiY60CeW2jTYFwr+MEa8UQ+QfCwrKaHY5++uKQcFAxJvWN3n9INlBncWlue8TcJvD6U2aGZgOv
 0lt2CbRUKKZ63/1csje3H96hWKOnwpen2hlHp2nQ8FSVPK65tLSjLJnu3sd37en6+olr++aQPHB
 zUCaL2oQReSJbr657u87Dc0fihr9xBNHM7TCC1HlVXdzSkRPBKdaZcXCWpjkAZjsFEI+3NdE8uF
 Gn+UeShc1dr+9ROYJSR6nh5Ph5lzqrId6nSv5lfNl6/l+K5yWQndSuAfTGc+0yDQ+1yBEFJTXPe
 LQhbfo7WigtEuf7akjQ==
X-Proofpoint-GUID: BbsIjgx80PtgcgK6azzesLIUd0eDipi1
X-Authority-Analysis: v=2.4 cv=Q9DfIo2a c=1 sm=1 tr=0 ts=699f7aa3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=wj6egcThClJy_xBgiekA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 clxscore=1015 impostorscore=10 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250217

folio_end_dropbehind() is called from folio_end_writeback(), which can
run in IRQ context through buffer_head completion.

Previously, when folio_end_dropbehind() detected !in_task(), it skipped
the invalidation entirely. This meant that folios marked for dropbehind
via RWF_DONTCACHE would remain in the page cache after writeback when
completed from IRQ context, defeating the purpose of using it.

Fix this by deferring the dropbehind invalidation to a work item.  When
folio_end_dropbehind() is called from IRQ context, the folio is added to
a global folio_batch and the work item is scheduled. The worker drains
the batch, locking each folio and calling filemap_end_dropbehind(), and
re-drains if new folios arrived while processing.

This unblocks enabling RWF_UNCACHED for block devices and other
buffer_head-based I/O.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/filemap.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index ebd75684cb0a..6263f35c5d13 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1085,6 +1085,8 @@ static const struct ctl_table filemap_sysctl_table[] = {
 	}
 };
 
+static void __init dropbehind_init(void);
+
 void __init pagecache_init(void)
 {
 	int i;
@@ -1092,6 +1094,7 @@ void __init pagecache_init(void)
 	for (i = 0; i < PAGE_WAIT_TABLE_SIZE; i++)
 		init_waitqueue_head(&folio_wait_table[i]);
 
+	dropbehind_init();
 	page_writeback_init();
 	register_sysctl_init("vm", filemap_sysctl_table);
 }
@@ -1613,23 +1616,94 @@ static void filemap_end_dropbehind(struct folio *folio)
  * If folio was marked as dropbehind, then pages should be dropped when writeback
  * completes. Do that now. If we fail, it's likely because of a big folio -
  * just reset dropbehind for that case and latter completions should invalidate.
+ *
+ * When called from IRQ context (e.g. buffer_head completion), we cannot lock
+ * the folio and invalidate. Defer to a workqueue so that callers like
+ * end_buffer_async_write() that complete in IRQ context still get their folios
+ * pruned.
  */
+static DEFINE_SPINLOCK(dropbehind_lock);
+static struct folio_batch dropbehind_fbatch;
+static struct work_struct dropbehind_work;
+
+static void dropbehind_work_fn(struct work_struct *w)
+{
+	struct folio_batch fbatch;
+
+again:
+	spin_lock_irq(&dropbehind_lock);
+	fbatch = dropbehind_fbatch;
+	folio_batch_reinit(&dropbehind_fbatch);
+	spin_unlock_irq(&dropbehind_lock);
+
+	for (int i = 0; i < folio_batch_count(&fbatch); i++) {
+		struct folio *folio = fbatch.folios[i];
+
+		if (folio_trylock(folio)) {
+			filemap_end_dropbehind(folio);
+			folio_unlock(folio);
+		}
+		folio_put(folio);
+	}
+
+	/* Drain folios that were added while we were processing. */
+	spin_lock_irq(&dropbehind_lock);
+	if (folio_batch_count(&dropbehind_fbatch)) {
+		spin_unlock_irq(&dropbehind_lock);
+		goto again;
+	}
+	spin_unlock_irq(&dropbehind_lock);
+}
+
+static void __init dropbehind_init(void)
+{
+	folio_batch_init(&dropbehind_fbatch);
+	INIT_WORK(&dropbehind_work, dropbehind_work_fn);
+}
+
+static void folio_end_dropbehind_irq(struct folio *folio)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dropbehind_lock, flags);
+
+	/* If there is no space in the folio_batch, skip the invalidation. */
+	if (!folio_batch_space(&dropbehind_fbatch)) {
+		spin_unlock_irqrestore(&dropbehind_lock, flags);
+		return;
+	}
+
+	folio_get(folio);
+	folio_batch_add(&dropbehind_fbatch, folio);
+	spin_unlock_irqrestore(&dropbehind_lock, flags);
+
+	schedule_work(&dropbehind_work);
+}
+
 void folio_end_dropbehind(struct folio *folio)
 {
 	if (!folio_test_dropbehind(folio))
 		return;
 
 	/*
-	 * Hitting !in_task() should not happen off RWF_DONTCACHE writeback,
-	 * but can happen if normal writeback just happens to find dirty folios
-	 * that were created as part of uncached writeback, and that writeback
-	 * would otherwise not need non-IRQ handling. Just skip the
-	 * invalidation in that case.
+	 * Hitting !in_task() can happen for IO completed from IRQ contexts or
+	 * if normal writeback just happens to find dirty folios that were
+	 * created as part of uncached writeback, and that writeback would
+	 * otherwise not need non-IRQ handling.
 	 */
 	if (in_task() && folio_trylock(folio)) {
 		filemap_end_dropbehind(folio);
 		folio_unlock(folio);
+		return;
 	}
+
+	/*
+	 * In IRQ context we cannot lock the folio or call into the
+	 * invalidation path. Defer to a workqueue. This happens for
+	 * buffer_head-based writeback which runs from bio IRQ context.
+	 */
+	if (!in_task())
+		folio_end_dropbehind_irq(folio);
 }
 EXPORT_SYMBOL_GPL(folio_end_dropbehind);
 

-- 
2.39.5

