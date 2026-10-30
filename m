Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375795;
	b=sVLXK2EN2gk+f42T6IEmLBBZpWx9hhe2aojn/Ex56ILKhGzgaeQzqY73QGzhLzder9+/
	 fX75AbMQSDxvzOOsoG/WfO2o+gzu1m/gmUQZew/3b5IV8EP7YA8zjoXOpBaGQxH94kSbW
	 uP1+YTdAxpZaQKIgiWktm0KE55SUrI+wxKQz5OY04hry0Kt072mkKVwUV0tXuX81f5YxY
	 8F0q8ugaf984ZqJ9tEpsc5A0yHBD5Oqr93lDNK4wRbQZzMtbvS05sMU2pKYKK4KLYqiNO
	 Qo1SJS9lHuRAIzqdIbkpwmNmZiRowNwppQiP1yd09AyBcfk4O1nuTe7NokvZUBc/k2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hbkb5n4pBE+XUrjWX5DdGWczVnzqmasFLyCQvO57Eko=;
	b=r4h4iEN4ojwAsYd5oXvBDKk4RXvedEKn2Ci8Gyd9lCPFmtqxFESnz5V6UotKkE4B6VbX
	 1VNon5P8pnL72hnGQGoQ3xFBOb/T1lK7YRG508YHi8AopDm39xqXAv53RdAoplA/Lqr90
	 y9x+Ou8+551xtst2r2cjLhZKYoxK6Z+yOh3CRzMGqgVen1Ze0IX6OJcHahNEqT1UpFeMk
	 zd8GFUpKs14Wi90tMsK0oproK03Lfl2G1xgs72BYInBN3XFsopE3f7bVyP4Ez990mEVmx
	 TzRhgBVDr0+48eNycqI1o4zZavb4uzzZLaAWiPvDsDHy/x0MghK+QJnwIlZhH7Zv85Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bsInX+Oc;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7C606A31D
	for <ntfs3@lists.linux.dev>; Fri, 30 Oct 2026 15:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF7C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bsInX+Oc
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1194767f8f.0
        for <ntfs3@lists.linux.dev>; Fri, 30 Oct 2026 08:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793375793; x=1793980593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hbkb5n4pBE+XUrjWX5DdGWczVnzqmasFLyCQvO57Eko=;
        b=bsInX+Oc3lM+axpUX5po5yQHlxbpL/+DjW1dFBZfrugqWQwH8wHV6Y35igyNg6tbEC
         RPHKADArWXRWGXLtzjCglBesrf+qxZR9VvraExrocKXjQinlIuStX2R8o0Bz84JV3pMv
         cwVpUBt2Bp5H1H4Pn/T803XhfAZOfrQUOPDHbqFH18KOuAuox+ltNR0GLLJN/IlS/P5R
         A7Gi4AjaHnzYyr/RW4HHG6kb9I4zn1NS428gJb56O0Lax+s46Z/Ip5QudQhVn6qDyR4X
         IJDdtMp5Nh14LEYXXLMgwufutIjP0dQKe5iwMCOZfisqB1HTD2mL8ruIOwpVqEHkRWBZ
         gofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375793; x=1793980593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hbkb5n4pBE+XUrjWX5DdGWczVnzqmasFLyCQvO57Eko=;
        b=b+v30nBhItzj7zBHJSyGosCzevWzLVPFYNkFuue8azXCYUW5mDSfRb+5i3NCABJKVD
         P/Xu2O3pwxFhpAZPIzanhYI2z/a+vLc8j4uSLEOng0L85XtVW8VgCSINVXm1KeZG/TNX
         J4A9tQtkxKdlRVEnsljqWlRHpDI6pJ6N8SQJII7LZYsFxXGqZ662GCMMCF133O3/mnAs
         mcOy5C8zyql7QxeaI0S+RDFGnF0sVHBRTRhm9rlEnzKvoRMm7UedD3MvZXWLT9AAuUga
         nn78xYg7df640utzaeIci7jTBLaa263YLYvC+sQ+21J8ZQGii0wpm19YZ2c1YVh0Ir/9
         0pnQ==
X-Gm-Message-State: AFq9FYK/Wm+MjO9zyfyh1+nXr9vEJjgdRxI/A4L3AUuPHkqEk5KtRPAW
	odld+ETaW3DL85SS7IHQMcBKOMkhxpO5tjVyKD5WqY6rAkGt92w3nQmW
X-Gm-Gg: AYBFou1WFxFHfpCUgeo4WQELVcolJB0ftVQNPw5S/4fmKJKQKySD0tMszE+fxQde6Zt
	W1Ma379RDB4VN9zU1SrIY6nUm4lCYOTt+txbMOncKjC0J4Ge1QVsM5UU7l3/Vhj4Wv189oJfIax
	kwB10F4OieYAKfhFj6DoOwXTHzSe5qmZgHfe++yne32KzvxNdLUxO78cGaWHVxizV/nblgtFUwt
	a8sS1Zct8knJTNAyLL577SdCN8JuWWn0fUpu7byWhfEvukSTJC3hF4Ylde8DVeUiT6VavRj6SlY
	B0l58LXuyyAc2x4Geq8bUs04acZjl5Vpv4gGviZExkLBtfSnf2WgZUYP0VJWI2KMGK0zB5UUAKY
	j1DOTq/eF/zcQ11IV73mZqKQ3M14gqF0EgwxFgS/mKbH1+ara/NTiF7bRi6Unwj0vlXqlqzH+og
	TUMJF3WlhikhdrE/opAZOLdq1NdN1lfuJm1SYkoecdh7EiysZY2FV6cvJons0DN8JushipkGbHC
	jjBbYU7d9tlh2rgzNT4NYrgFv7nc/XigkE+ZYjJQoElNG3vDfBg/BKn49zrM+czUszwdO3okvqm
	LuAHNtzgJhTZQJVhw0g9ex+ka7iHs0IdIc4HV3rxqorLFxdPLemUPVs+Ey0sHQhyp8kOjwg=
X-Received: by 2002:a05:6000:4910:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48e6494c24fmr15895958f8f.3.1793375793295;
        Fri, 30 Oct 2026 08:56:33 -0700 (PDT)
Received: from macstation (109-206-198-198.host.skynet.net.pl. [109.206.198.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm4157944f8f.55.2026.10.30.08.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:56:32 -0700 (PDT)
From: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix ENOENT in indx_new() for blocks with unloaded runs
Date: Fri, 30 Oct 2026 16:56:31 +0100
Message-ID: <20261030155631.953779-1-m.sadowniczyk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029172655.432752-1-m.sadowniczyk@gmail.com>
References: <20261029172655.432752-1-m.sadowniczyk@gmail.com>
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

indx->alloc_run is filled on demand, one $INDEX_ALLOCATION segment at
a time. When the attribute is split over several MFT records (via
$ATTRIBUTE_LIST), a segment none of whose blocks has been read since
the inode was loaded may have no runs in alloc_run. indx_read_ra() handles
this: when ntfs_read_bh_ra() fails with -ENOENT, it loads the runs with
attr_load_runs_range() and retries.

indx_new() has no such fallback. When indx_add_allocate() takes a free
bit from the index bitmap that lies inside the existing allocation, the
allocation is not extended and nothing loads the runs for that block.
ntfs_get_bh() in indx_new() then fails with -ENOENT, and so does the
insert that needed the new index block.

This was hit on $Extend/$Reparse, which gets an entry for every
symlink. After many symlinks had been created and some deleted, and
the volume remounted, symlink() started to fail with ENOENT and kept
failing: the bit is marked used only after indx_new() succeeds, so
indx_find_free() returned the same free bit every time.

  ntfs_create_inode
   ntfs_insert_reparse
    indx_insert_entry
     indx_insert_into_buffer
      indx_new
       ntfs_get_bh  <- -ENOENT

Creating regular files and directories, which add no $Reparse entry,
kept working. Other indexes, including $I30 of large directories, go
through the same indx_new() path.

Load the missing runs in indx_new() the same way indx_read_ra() does
and retry ntfs_get_bh().

The missing fallback was found with an AI assistant comparing
indx_new() with indx_read_ra() (see Assisted-by).

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/ntfs3/20261029172655.432752-1-m.sadowniczyk@gmail.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Maciej Sadowniczyk <m.sadowniczyk@gmail.com>
---

Notes:
    The code change is the same as the untested diff in the report (only
    the comment now names indx_read_ra()); it is now tested.
    
    Tested on the ntfs3 devel tree (ee1cb3443cff) in a virtme-ng VM, with
    lockdep and KASAN enabled, using the reproducer from the report:
    
    - without this patch, symlink #14940 fails with ENOENT. The failed
      symlink() leaves nothing behind: after a remount b/l holds exactly
      the 14940 symlinks created before it.
    - with it, all 20000 symlinks are created. After another remount all
      of them read back correctly and can be deleted; ntfsinfo (ntfs-3g)
      then counts 20332 entries in $Extend/$Reparse:$R, i.e. the 20000
      remaining a/l symlinks plus one end entry per INDX block (332).
      ntfsfix -n reports no problems and there are no KASAN reports.
    
    In this tree the reproducer's readdir (find -delete) trips the known
    "bad unlock balance in ntfs_readdir" (syzbot; "[PATCH v2] fs/ntfs3: fix
    double ni_unlock() in ntfs_readdir()"), which turns lockdep off before
    the indx_new() path runs. So I repeated the patched run without any
    readdir, deleting the symlinks by name: debug_locks stayed 1 for the
    whole run, there were no lockdep or KASAN reports, and a function
    trace showed attr_load_runs_range() being called from indx_new(), i.e.
    the new fallback ran.
    
    The failure in the report comes from indx_insert_into_buffer(); the
    indx_insert_into_root() caller and $I30 directories were not
    specifically tested.
    
    Starting from the function_graph trace I collected, an AI assistant
    located the missing fallback by comparing indx_new() with
    indx_read_ra(), and drafted the fix and this changelog. I have reviewed
    and tested them.

 fs/ntfs3/index.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760..2b0f2a6bd 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -987,6 +987,23 @@ static struct indx_node *indx_new(struct ntfs_index *indx,
 	}
 
 	err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo, bytes, &r->nb);
+	if (err == -ENOENT) {
+		/*
+		 * A reused block may lie in an $INDEX_ALLOCATION segment
+		 * whose runs are not loaded yet. Load them, as
+		 * indx_read_ra() does.
+		 */
+		const struct INDEX_NAMES *in = &s_index_names[indx->type];
+
+		down_write(&indx->run_lock);
+		err = attr_load_runs_range(ni, ATTR_ALLOC, in->name,
+					   in->name_len, &indx->alloc_run, vbo,
+					   vbo + bytes);
+		up_write(&indx->run_lock);
+		if (!err)
+			err = ntfs_get_bh(ni->mi.sbi, &indx->alloc_run, vbo,
+					  bytes, &r->nb);
+	}
 
 	if (err) {
 		kfree(index);

base-commit: ee1cb3443cff5a800948b662756f75b17ca63fe2
-- 
2.56.0

