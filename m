Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2891D489865
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011501; cv=none; b=gdxjC+sxTmDRPEFN1S6R1/GPnhH7ZCBn2DpBDhYwa+X/OLT9EAe0V7Q0RTMPYqgD8V/mddsVx+oRD05TmR8Lg4pzB78l0dJY4FZJSumGDWBphHHkHhViynv7UJJRVvZyXANQn7B52QCXRiW1MnzAzl/eqJ6zJxHrppmkVevBXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011501; c=relaxed/simple;
	bh=NEAbhKq9B35n7+FNn2ULNfgK7+O3WofJ+tpENtrfo9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAuXVpm9Yb/183fz6HPch8bPHvWyTXdgAGvf4UWHxvULRlY3dGnZx72veHj1kIK5TJ8H6ttfyyfz6QwBkrTW+wMzh7E+ozkzJ6GIygR8lbyTu4Y5zGdd2iP/R54yFDcLCRS6rBUOH21gBEm837I7xZsXqm9dXVXyj6/sxeUsfaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkjUNZMR; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkjUNZMR"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso2582025a12.1
        for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790011499; x=1790616299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5YxojVaNbADO1FA9MJ9tqVVm0PhiUslwtmGv+Sh0is=;
        b=XkjUNZMRoty1z3dHWqvOxBUaCI2HnauYl1PGOX6DpC5BFknRB57cH2zpEkWx4loPQ0
         9OPNleGHYpoc3g0JA9RkBK2eR1aV8ZN3wmGL/E9+z/lY9PmHt7ny7+B5h5d/7vLDYcDh
         qKZd25MChSylBBkF2s99c/MHHPsrANuo4DgQoyll+3pQ+PhNiADynQVrEUYqzsVoaGLv
         FeZZos3pHSOyE/pzSjubLXVKZIEowR7WGFY/2oitLfXzZbp90KZ7rss2eR3r9GmdEJxS
         9Ct8FULRX4n8Kxsql2aqEwo9oTG3DIqMrYRN/7j1iH8eyX5l0HTgNKKjtU1GMI9Rvjtn
         vV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011499; x=1790616299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5YxojVaNbADO1FA9MJ9tqVVm0PhiUslwtmGv+Sh0is=;
        b=2HTykFyZHAAtLLdby714o2qmYZ2s35NemNCLBaFsi5vQzD38buQY39l79pRlw04mrh
         i4pp/t5/l+CfdH5rNv0LKaOUYODVxjG9griD5fjotdd//wZv0QK9tnAt/p0RtXptoCdd
         RPnPpHEc+0mgrOVr0KYDwQtsV2sDYYwr8NUOo753plpRGh32gZFL2rGSuuTi1aZyPkRS
         EtuZk7qSPuMZZ3CxV28EbSF/0r56f5qAmT+QuublIyL2hg35Y1Tfd4rjvR6hHyY8eZ0d
         gpoybJabqLXwKv9w3a3ukQe0Uy3xd6VoAnjP9anzJsThLO+Cw0PEBAOloSpilbYKJvTb
         +ItA==
X-Gm-Message-State: AFuF++lw1fQC6qWwBjfnNu+aE4FW2joZkjKI/AbY47bQPF0114972kTx
	UlHxrd0AaqMomvVNsKz4T/tMwMTeJ4btqUMdY4wQr3+cu/56nHlV5yBC
X-Gm-Gg: AYBFou23vyQUfvg8uLJQPRCiBrTUbKxUWjEKMRPs5d4qoYlUkRH9hdkQ3C7xbE6JpOm
	KMQoER9pfLzXrzSiBp2d/BRtEppRj98xIQIS+Q8F1/wkGGCZ+s2jfDD4K1WXtiAS3BIEsLofxLA
	otj1sYm0S4oSQs1xNhvoCh1aWCSlWOXFT9YMwV+Gmaq1ASS0W6Er8KPcPVjH9UFyGv8RjiFr2/F
	jkYqbjmQSXW3DkiTfrBmgMaZB0HZ1q/2wMpuQoXlX4bYN6ES5IBkJ4pA8MUp17BYxRx2c3DHZH/
	6Bk+CApBkIrkBBQ/xkywEf8HPfw5ZkED9nw4VPSOGyB0NxDSxQdD05UtCrEVhHtkx4sy5r+kDnQ
	3uh7YeTCkmT4Ts3O6HjNg8rZAtfcmQ0vdAssdBCXBvzXnVd0fNSWg/8YdyXAQQXgDCJBgKUkc9v
	biG7niRNajwUR7iKBIRFfrkQ53MsFNXS/iK2i7bzjSMxe2Eun2n2M1h0h1It1iOaaTGb5zgfM=
X-Received: by 2002:a05:6a20:438d:b0:3dd:a196:69ea with SMTP id adf61e73a8af0-3dda1967817mr11917831637.69.1790011499166;
        Mon, 21 Sep 2026 10:24:59 -0700 (PDT)
Received: from archlinux ([103.208.68.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc749028e5bsm1464399a12.9.2026.09.21.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:24:58 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH] ntfs3: sync uptodate with iomap folio state in read_folio
Date: Mon, 21 Sep 2026 22:54:51 +0530
Message-ID: <20260921172451.121701-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
References: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs3 registers iomap page-cache helpers for its regular files.  When
the filesystem block size is smaller than the folio size, folios are
backed by iomap_folio_state with a per-block uptodate bitmap in addition
to PG_uptodate.

The i_valid <= vbo early exit in ntfs_read_folio() zeroes folios past
valid data and marks them uptodate with folio_mark_uptodate(), updating
only the folio flag.  That leaves the iomap bitmap out of sync and
ifs_free() WARNs during evict when the folio is torn down.

Use iomap_folio_mark_uptodate() to update both the folio uptodate state
and the iomap uptodate bitmap.

Reported-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6aab8055.71f81b7d.278072.0016.GAE@google.com/
Tested-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 fs/ntfs3/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 56b4f6469a28..a9b4e288ca20 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -842,7 +842,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 
 	if (ni->i_valid <= vbo) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		folio_unlock(folio);
 		return 0;
 	}
-- 
2.55.0

