Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA349A3DA
	for <ntfs3@lists.linux.dev>; Fri, 25 Sep 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334998; cv=none; b=W+EuaWLGxigmeEpoOd6O09uocMObPRbWIlQia0WNA7g8K/uZQBORhxdSbihiE5xAqbSqNZoObFK/fXP/Ajv8yEwiNHheoeSJq+vp/JBKbtkBiqlmXcdDZCuRGr5JmJ96gOJ8vWxGqVNB2e77pCXOef3RUpHRxo/6wVsgGI9/P0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334998; c=relaxed/simple;
	bh=We+zlzCngSy/UjeEErH342+mGDGa+lMvJgYgEMT5s/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhS4oHchEq/BeYy+z6SyEi5Ir8c+f+IohLQ5cffnc0vZxdC4YLwYYHnidi0ynHBdJ1IQ0itcRvn/J4AeoBZgYjxbzZDQ+d2wbcWbnUFGbcyBsCpjMzt67lgNe4TbqN0B1bo5XiD3GBcqFFWxMvnqkwsTssAp6j4SfdUYjkwL7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=m3k3PlDk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="m3k3PlDk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so6530575e9.3
        for <ntfs3@lists.linux.dev>; Fri, 25 Sep 2026 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790334995; x=1790939795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdDHbNa4yNuLlpTfPbBsyNkmz/U7MP5VR/MdNvttOMo=;
        b=m3k3PlDkIkAsrDkbf7AsmuI36aSu2tVLjQavwoLLHy2foCWpMIFWAsuaEcWZfa3T+d
         uCKGyD++DHFC6yq0SSyxNGhm+kQUhMlqUzc8SkvVD0QlogQh0SOWP1lRbjb4oG5vwkVZ
         T4VddgGwpTobOX95EaW4uz9Iwl6k7E8rAuqpDxSFwqsLUlTBIcgwRFXWhq1j6dTC6DtO
         v80mjKiWcjTvPvDdzCFNafCpOndMiDLduOrqGWN1CiHNH/zLONHTtc9B7ZNJvH8Fr2F8
         gzDIt6jNZbt8Ro7EpL5oWnEBDHgsRs5eqWdJD2xQInWKAqNFRmJ6MiWJa2WhmYDEN72G
         XNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334995; x=1790939795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdDHbNa4yNuLlpTfPbBsyNkmz/U7MP5VR/MdNvttOMo=;
        b=Leo9mmbTn668zbyrJFQ6ie8FeNU/iOJFTqHqs/sYitW/NfHmdbEXajsgUKUYR5KyvK
         EQg5J8fhakn9CLK90YzaQMaIWF1Mc1OwX9eVNpzTPA59IlCnF/erj2dfoE3qTGiQNuXk
         9j8dAhPqSf3hlt+vtK2w10QwbbAdvrp86xsAPJ2Iw9tfcXypcWbmD6OvDPvYDbN+Q6cF
         rYLAMLajvSb9seJSHvsKxKSTykS0egj0tqwds5S9eS3h+nRERcWevo6CA2aCL7AAwRZt
         9KKJK+g+XCmNgIHHh8fB9vf5Rbv+Qu5GF3iH5OrNKt6NrTS3YN1RATA7d3otKN9QfQep
         z8QA==
X-Gm-Message-State: AFuF++kuVk1BqVMjXWyhZsKZL/6lF2RK9NMaqxNcdke/mChX/MuYU2yH
	AbcsYFqvs/S4BF4ce91aCftTLwDVbsq8tP2QdVcZ+bW7feOhwFR+8FOC4R6czY8yJ35t
X-Gm-Gg: AYBFou2AaaGStE07aehraFuo9wZIN5AHjeAeboJa2uTmJUGIrUhgnW0UOBU3m2Np144
	B7osyrmfleI48LkPxMgouEc5WDz3MQk7sShGwJywNHWhco3/A3OjiYnjtAQqx8p06z3T/jbuso4
	wtkJEugLesayKa8u74XgSpqMrOrDdhoVmWan6XojLiW4AF7yX4VtcxanGELLt+MWdz0MdoDLj1u
	VklL7yB8PxpgIuJ766LQTDUwgVrbxrjf9uuze8dF6Om6Qh1AXaQhMXBZ9KlLgA5IMWUebyuP2M0
	Od/Vi5MpvS53DjtcWJ017GZASfBZm+pTqU2uwwdhubqRmklzXVG4cllzRBKUs5MTyAKJYufYX47
	j7+kl0cXFHOwl5Pslkg5KGnaFhRTh7eLmSzbSlhhZt+mpYgJoC6+6IBuBEMU68JUJzx/Kh6NtI1
	kskD4qKswvgkg59PE3dWokW1SiicxTCwh0uGEnhfA=
X-Received: by 2002:a05:600c:a47:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49fe66abc9cmr93939725e9.6.1790334994846;
        Fri, 25 Sep 2026 04:16:34 -0700 (PDT)
Received: from cachyos ([151.36.34.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm50237695e9.12.2026.09.25.04.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:16:34 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] fs/ntfs3: fix out-of-bounds read of redo/undo data during log replay
Date: Fri, 25 Sep 2026 13:16:13 +0200
Message-ID: <20260925111619.68345-2-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925111619.68345-1-giulia@bynar.io>
References: <20260925111619.68345-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_log_rec() is the common validator for log records consumed during
journal replay. It checks the header size, the transaction table offset,
the 8-byte alignment of redo_off and undo_off, and that the record holds
at least lrh_length(lr) bytes. It does not check that the redo and undo
data ranges themselves lie inside the record.

log_replay() builds those ranges directly from on-disk fields:

	data = Add2Ptr(lrh, le16_to_cpu(lrh->redo_off));
	dlen = le16_to_cpu(lrh->redo_len);
	...
	err = do_action(log, oe, lrh, t16, data, dlen, rec_len, &rec_lsn);

do_action() bounds the destination in its copy cases, for example:

	case InitializeFileRecordSegment:
		if (roff + dlen > record_size)
			goto dirty_vol;

		memcpy(Add2Ptr(rec, roff), data, dlen);

but it does not bound the source range. The undo pass has the same issue
for normal undo records, and the analysis pass reads DeleteDirtyClusters
LCN ranges and OpenNonresidentAttribute entries and optional names from
unchecked redo/undo ranges.

redo_off, redo_len, undo_off and undo_len are 16-bit fields read from
the on-disk log. A crafted dirty log record can therefore make journal
replay read past the end of the log record while applying redo or undo
data. In the copy cases, the out-of-bounds bytes are copied into the
in-memory file record being replayed.

This is independent of target_attr and restart-table offset validation:
even with a valid open-attribute entry and valid destination bounds,
do_action() can still over-read the log record because redo_off/redo_len
and undo_off/undo_len are not bounded against client_data_len.

Mounting needs CAP_SYS_ADMIN, since ntfs3 is FS_REQUIRES_DEV and not
FS_USERNS_MOUNT, but the image is untrusted wherever removable media are
auto-mounted onto the in-tree driver; replay runs on any rw mount of a
volume whose log is dirty.

Before this fix, mounting the crafted image on an x86-64 KASAN build
produced:

  BUG: KASAN: slab-out-of-bounds in do_action+0x2820/0x89e0
  Read of size 1024 at addr ffff888102404f30 by task mount/67
  Call Trace:
   __asan_memcpy+0x23/0x60
   do_action+0x2820/0x89e0
   log_replay+0xcd38/0xe690
   ntfs_loadlog_and_replay+0x3e0/0x500
   ntfs_fill_super+0x1fd3/0x4510
   get_tree_bdev_flags+0x2ff/0x5d0
   vfs_get_tree+0x80/0x2d0
   fc_mount+0x15/0x1f0
   path_mount+0x77e/0x1d70
   __x64_sys_mount+0x207/0x270
   do_syscall_64+0xde/0x4b0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Allocated by task 67:
   __kmalloc_noprof+0x1cc/0x480
   read_log_page+0x354/0x5a0
   find_log_rec+0x383/0x5f0
   read_log_rec_lcb+0x1c7/0x550
   log_replay+0xc85a/0xe690
   ntfs_loadlog_and_replay+0x3e0/0x500
   ntfs_fill_super+0x1fd3/0x4510
   get_tree_bdev_flags+0x2ff/0x5d0
   vfs_get_tree+0x80/0x2d0
   fc_mount+0x15/0x1f0
   path_mount+0x77e/0x1d70
   __x64_sys_mount+0x207/0x270

  The buggy address is located 3888 bytes inside of
   allocated 4096-byte region [ffff888102404000, ffff888102405000)

Reject redo ranges that extend beyond client_data_len. Also reject undo
ranges that extend beyond client_data_len, except for compensation log
records, which can have undo_len set even when no undo bytes are present.

OpenNonresidentAttribute also reads a fixed-size open-attribute entry
from redo_off; validate that the entry is contained in the log record
before reading it. Because check_log_rec() intentionally leaves the CLR
undo range unchecked, also validate the undo range locally before copying
the attribute name from it.

Every caller already turns a false return into -EINVAL and aborts the
replay.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..88bd6ef98467 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -694,6 +694,7 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 			  u32 bytes_per_attr_entry)
 {
 	u16 t16;
+	u32 off, len;
 
 	if (bytes < sizeof(struct LOG_REC_HDR))
 		return false;
@@ -731,6 +732,17 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 	if (bytes < lrh_length(lr))
 		return false;
 
+	off = le16_to_cpu(lr->redo_off);
+	len = le16_to_cpu(lr->redo_len);
+	if (off > bytes || len > bytes - off)
+		return false;
+
+	off = le16_to_cpu(lr->undo_off);
+	len = le16_to_cpu(lr->undo_len);
+	if (lr->undo_op != cpu_to_le16(CompensationLogRecord) &&
+	    (off > bytes || len > bytes - off))
+		return false;
+
 	return true;
 }
 
@@ -4736,6 +4748,25 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	case OpenNonresidentAttribute:
+		t32 = !rst->major_ver ? SIZEOF_OPENATTRIBUTEENTRY0 :
+					 bytes_per_attr_entry;
+		off = le16_to_cpu(lrh->redo_off);
+		if (off > rec_len || t32 > rec_len - off) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * The attribute name is copied from the undo range, which
+		 * check_log_rec() does not bound for compensation log records.
+		 */
+		off = le16_to_cpu(lrh->undo_off);
+		t32 = le16_to_cpu(lrh->undo_len);
+		if (t32 && (off > rec_len || t32 > rec_len - off)) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		t16 = le16_to_cpu(lrh->target_attr);
 		if (t16 >= bytes_per_rt(oatbl)) {
 			/*
-- 
2.55.0

