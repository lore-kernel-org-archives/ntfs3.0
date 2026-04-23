Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F223E715C;
	Thu, 23 Apr 2026 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945352; cv=none; b=J3nDivJzLwGEZKSVVeo1mSf8CmuzmRtDOFMTNxM+JmNfpUZlo3FkRP7BpUkvrFhIQKF8XpuMdejTUhzb3pWF/CAUsag4lZ2TutXRX5g4SkjUpXTesePTL1nP9TEQXDPcT4cJVKag+alc9KFuf6NIC0vzl62vWcNK/AoYYavRS54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945352; c=relaxed/simple;
	bh=Kbb/NQzvtUATqloWzR9eY72U2KksMcUKmWraodIv+Ic=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=L7SkdjopQSaOGKfRsiQ+ivhT8vg74sS4hQODGZMbEXc86qc3hU4l9Px+obIFDSVFRToO8YgFGbzJ1LL9tDV1Dfxwy9FoeyxajC995n8+SqqiRIzO7J/U2827sJcRojAYKE6kShKdDPQvZ7Y+AK9pmFY4e9+c3qZLPvSnp5zgnTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c0WTpVcm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c0WTpVcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75982C2BCAF;
	Thu, 23 Apr 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776945351;
	bh=Kbb/NQzvtUATqloWzR9eY72U2KksMcUKmWraodIv+Ic=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=c0WTpVcmQG3RRKUDYfy8FhDT3wKssk3AKulTtr5M6A4sfMI/XJvrNudAH+TNgRGTJ
	 rTIxr2rH9qhvjMvafWKaiaSYXNnsqtqoez+8F3GgjiBMxIcFGy2Fpp1XK1NiBmT4UF
	 cYhNO/UsAPktXW7UYURS8IvinR2/iH5H4zP+HaGY=
Subject: Patch "fs/ntfs3: Add more attributes checks in mi_enum_attr()" has been added to the 5.15-stable tree
To: almaz.alexandrovich@paragon-software.com,gregkh@linuxfoundation.org,ntfs3@lists.linux.dev,rob_garcia@163.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 13:55:28 +0200
In-Reply-To: <20260423070159.3246415-1-rob_garcia@163.com>
Message-ID: <2026042328-grafted-affix-d7f3@gregkh>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    fs/ntfs3: Add more attributes checks in mi_enum_attr()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fs-ntfs3-add-more-attributes-checks-in-mi_enum_attr.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-240430-greg=kroah.com@vger.kernel.org Thu Apr 23 09:02:46 2026
From: Robert Garcia <rob_garcia@163.com>
Date: Thu, 23 Apr 2026 15:01:59 +0800
Subject: fs/ntfs3: Add more attributes checks in mi_enum_attr()
To: stable@vger.kernel.org, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, Robert Garcia <rob_garcia@163.com>, linux-kernel@vger.kernel.org
Message-ID: <20260423070159.3246415-1-rob_garcia@163.com>

From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Upstream commit 013ff63b649475f0ee134e2c8d0c8e65284ede50 ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
[ Overflow check deleted to keep context consistent. ]
Signed-off-by: Robert Garcia <rob_garcia@163.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ntfs3/record.c |   63 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 13 deletions(-)

--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -193,8 +193,9 @@ struct ATTRIB *mi_enum_attr(struct mft_i
 {
 	const struct MFT_REC *rec = mi->mrec;
 	u32 used = le32_to_cpu(rec->used);
-	u32 t32, off, asize;
+	u32 t32, off, asize, prev_type;
 	u16 t16;
+	u64 data_size, alloc_size, tot_size;
 
 	if (!attr) {
 		u32 total = le32_to_cpu(rec->total);
@@ -213,6 +214,7 @@ struct ATTRIB *mi_enum_attr(struct mft_i
 		if (!is_rec_inuse(rec))
 			return NULL;
 
+		prev_type = 0;
 		attr = Add2Ptr(rec, off);
 	} else {
 		/* Check if input attr inside record. */
@@ -226,6 +228,7 @@ struct ATTRIB *mi_enum_attr(struct mft_i
 			return NULL;
 		}
 
+		prev_type = le32_to_cpu(attr->type);
 		attr = Add2Ptr(attr, asize);
 		off += asize;
 	}
@@ -245,7 +248,11 @@ struct ATTRIB *mi_enum_attr(struct mft_i
 
 	/* 0x100 is last known attribute for now. */
 	t32 = le32_to_cpu(attr->type);
-	if ((t32 & 0xf) || (t32 > 0x100))
+	if (!t32 || (t32 & 0xf) || (t32 > 0x100))
+		return NULL;
+
+	/* attributes in record must be ordered by type */
+	if (t32 < prev_type)
 		return NULL;
 
 	/* Check overflow and boundary. */
@@ -254,16 +261,15 @@ struct ATTRIB *mi_enum_attr(struct mft_i
 
 	/* Check size of attribute. */
 	if (!attr->non_res) {
+		/* Check resident fields. */
 		if (asize < SIZEOF_RESIDENT)
 			return NULL;
 
 		t16 = le16_to_cpu(attr->res.data_off);
-
 		if (t16 > asize)
 			return NULL;
 
-		t32 = le32_to_cpu(attr->res.data_size);
-		if (t16 + t32 > asize)
+		if (t16 + le32_to_cpu(attr->res.data_size) > asize)
 			return NULL;
 
 		if (attr->name_len &&
@@ -274,21 +280,52 @@ struct ATTRIB *mi_enum_attr(struct mft_i
 		return attr;
 	}
 
-	/* Check some nonresident fields. */
-	if (attr->name_len &&
-	    le16_to_cpu(attr->name_off) + sizeof(short) * attr->name_len >
-		    le16_to_cpu(attr->nres.run_off)) {
+	/* Check nonresident fields. */
+	if (attr->non_res != 1)
+		return NULL;
+
+	t16 = le16_to_cpu(attr->nres.run_off);
+	if (t16 > asize)
+		return NULL;
+
+	t32 = sizeof(short) * attr->name_len;
+	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
+		return NULL;
+
+	/* Check start/end vcn. */
+	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
+		return NULL;
+
+	data_size = le64_to_cpu(attr->nres.data_size);
+	if (le64_to_cpu(attr->nres.valid_size) > data_size)
 		return NULL;
-	}
 
-	if (attr->nres.svcn || !is_attr_ext(attr)) {
+	alloc_size = le64_to_cpu(attr->nres.alloc_size);
+	if (data_size > alloc_size)
+		return NULL;
+
+	t32 = mi->sbi->cluster_mask;
+	if (alloc_size & t32)
+		return NULL;
+
+	if (!attr->nres.svcn && is_attr_ext(attr)) {
+		/* First segment of sparse/compressed attribute */
+		if (asize + 8 < SIZEOF_NONRESIDENT_EX)
+			return NULL;
+
+		tot_size = le64_to_cpu(attr->nres.total_size);
+		if (tot_size & t32)
+			return NULL;
+
+		if (tot_size > alloc_size)
+			return NULL;
+	} else {
 		if (asize + 8 < SIZEOF_NONRESIDENT)
 			return NULL;
 
 		if (attr->nres.c_unit)
 			return NULL;
-	} else if (asize + 8 < SIZEOF_NONRESIDENT_EX)
-		return NULL;
+	}
 
 	return attr;
 }


Patches currently in stable-queue which might be from rob_garcia@163.com are

queue-5.15/sunrpc-lock-against-sock-changing-during-sysfs-read.patch
queue-5.15/smb-client-fix-potential-uaf-in-smb2_is_valid_oplock.patch
queue-5.15/pstore-inode-only-d_invalidate-is-needed.patch
queue-5.15/wifi-iwlwifi-read-txq-read_ptr-under-lock.patch
queue-5.15/alsa-control-avoid-warn-for-symlink-errors.patch
queue-5.15/binfmt_misc-restore-write-access-before-closing-files-opened-by-open_exec.patch
queue-5.15/spi-cadence-quadspi-implement-refcount-to-handle-unbind-during-busy.patch
queue-5.15/btrfs-lock-the-inode-in-shared-mode-before-starting-fiemap.patch
queue-5.15/fs-ntfs3-add-more-attributes-checks-in-mi_enum_attr.patch
queue-5.15/f2fs-fix-to-wait-on-block-writeback-for-post_read-case.patch
