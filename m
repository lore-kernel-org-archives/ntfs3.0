Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243C3BE17F;
	Thu,  9 Apr 2026 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745440; cv=none; b=A/nB4ovs1HbYKfO6AGajENd7ob+nEB/yBTkPtCiatvCIDOjIJpbdOwLlOFPIz9CmCuyUTkTEMQHkfyW+FwKSy5Mnxwlljk9UtDNWSH2VTveq28ij0aWMcUtMYni4kkg+4Q6vVyzqV4llbj2tzmmuY7amAHNo4la5W1XY26Xr5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745440; c=relaxed/simple;
	bh=MJxNbTMCH0ezXiLcWQ+WBoX650y/sOmvOn2oJAqHK7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1er02Pa18u2W1+Gf8WMvzjAJRXpqmngKAgAeu/efl1xw2Vj+Wg0F/tDVUlnixVe7jsidDsHe2as8Qg2WFMTs+dCY7cFTvtY6kKELzotpmt67T4gHd5nI9r5FlrIL/qHk00SqigbJUga6XAhP5IRKMOTldaa2qIZasCCqEsxUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KjaGM6p2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KjaGM6p2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7EDC4CEF7;
	Thu,  9 Apr 2026 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775745440;
	bh=MJxNbTMCH0ezXiLcWQ+WBoX650y/sOmvOn2oJAqHK7k=;
	h=From:To:Cc:Subject:Date:From;
	b=KjaGM6p2l3vLLagFlCKKtt5GBEspXeCKUzZIRAL+idxDSya6xP7FMDVoR1bvfy5+0
	 t3C2nnZ3qYu9YkoyU7IVFfcVAnHfTVNOBY8Hztc3AuItgJBfwqkbCzoeIuHl6g4Nqg
	 P0Y9FdMm/GD2ONVVrt5LbOkA35CIqYlQyjSsZaHA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	stable <stable@kernel.org>
Subject: [PATCH] fs/ntfs3: validate rec->used in journal-replay file record check
Date: Thu,  9 Apr 2026 16:37:15 +0200
Message-ID: <2026040914-overbid-spherical-ac2e@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2761; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=MJxNbTMCH0ezXiLcWQ+WBoX650y/sOmvOn2oJAqHK7k=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnXd85uzkoL6Y3P2yG3zZJTOjkwfMt2CQ/mfVuqjvO8e 7GiVf1SRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEwkpp9hfumnb1td+kILA9NZ ltqYOy5OOdH8n2F+/JsLMdcdHx7fsmmPaNmCN0UM4acOAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

check_file_record() validates rec->total against the record size but
never validates rec->used.  The do_action() journal-replay handlers read
rec->used from disk and use it to compute memmove lengths:

  DeleteAttribute:    memmove(attr, ..., used - asize - roff)
  CreateAttribute:    memmove(..., attr, used - roff)
  change_attr_size:   memmove(..., used - PtrOffset(rec, next))

When rec->used is smaller than the offset of a validated attribute, or
larger than the record size, these subtractions can underflow allowing
us to copy huge amounts of memory in to a 4kb buffer, generally
considered a bad idea overall.

This requires a corrupted filesystem, which isn't a threat model the
kernel really needs to worry about, but checking for such an obvious
out-of-bounds value is good to keep things robust, especially on journal
replay

Fix this up by bounding rec->used correctly.

This is much like commit b2bc7c44ed17 ("fs/ntfs3: Fix slab-out-of-bounds
read in DeleteIndexEntryRoot") which checked different values in this
same switch statement.

Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ntfs3/fslog.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 272e45276143..037df47fa9f3 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2791,13 +2791,14 @@ static inline bool check_file_record(const struct MFT_REC *rec,
 	u16 fn = le16_to_cpu(rec->rhdr.fix_num);
 	u16 ao = le16_to_cpu(rec->attr_off);
 	u32 rs = sbi->record_size;
+	u32 used = le32_to_cpu(rec->used);
 
 	/* Check the file record header for consistency. */
 	if (rec->rhdr.sign != NTFS_FILE_SIGNATURE ||
 	    fo > (SECTOR_SIZE - ((rs >> SECTOR_SHIFT) + 1) * sizeof(short)) ||
 	    (fn - 1) * SECTOR_SIZE != rs || ao < MFTRECORD_FIXUP_OFFSET_1 ||
 	    ao > sbi->record_size - SIZEOF_RESIDENT || !is_rec_inuse(rec) ||
-	    le32_to_cpu(rec->total) != rs) {
+	    le32_to_cpu(rec->total) != rs || used > rs || used < ao) {
 		return false;
 	}
 
@@ -2809,6 +2810,15 @@ static inline bool check_file_record(const struct MFT_REC *rec,
 		return false;
 	}
 
+	/*
+	 * The do_action() handlers compute memmove lengths as
+	 * "rec->used - <offset of validated attr>", which underflows when
+	 * rec->used is smaller than the attribute walk reached.  At this
+	 * point attr is the ATTR_END marker; rec->used must cover it.
+	 */
+	if (used < PtrOffset(rec, attr) + sizeof(attr->type))
+		return false;
+
 	return true;
 }
 
-- 
2.53.0

