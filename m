Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114192;
	b=abwP0bdjZpBkWxgjfggXF0lMfbd5YlW+aXwJnSGY/HvimA85CFUfCGwL+GWyIqyhvUcW
	 tj+SEmLLuYvFa3IbHyBVtzsQcljUNomhwKEeBOxX+btsP2QNWFBrSCtJVWhg3uczyqEip
	 VVm/vu/5WB2vrw6i242A2hWRlWSp8vXa8nW9IAqEDBCi1RauijR8xXLgLvSyQXy4irq8L
	 HQaoZArQbWsm2RMPBH6Xz65DIUC0bOoAwfDwC8bUyQWsOMCDxsPhu3Ahf+q/C8yNCMeDu
	 bUuMeoFWU5Y7IIdDuUmc2wNQIbFxFKyFUQViaAIElWv8lzG3pfhDKMfeb3+jRUih32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uTppmobKlXCQMDn3ZVLxidM0e+PEeg9PY8KBlnC43UE=;
	b=BBLowR5XzvuUrYITvkeDklirQewZSeHeFX8t+pb30+2Ojc9OFlGffjINHSKyBjehG/WZ
	 17jzMlZfKR6Ab2B0NKfKy9MBGrZ7CXMk0WH6TROWMxuw+/9zZYT6h2I+X9PP0i/PSSkuJ
	 uqB1QbxO1JkkqewUqtmlLsJgLoOwTgrIl9NTiZ+CZx9sghGaTF2hJMCOd1EfCAycCevu3
	 Sm3qw6mu2PMPHGA4PW361x/dNQA/lRpuR/4I/P79BzhK8CbB2Zo0Cxno7iiQ7ohx15URX
	 vNSdgl5g/ynG0cBGaHjvq/CtbaW9is2KFOG0U5eZlTQS14tiGxr3dg1kR3CC1P6fflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJC6RTn3;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7184606A321
	for <ntfs3@lists.linux.dev>; Tue, 27 Oct 2026 15:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7184606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJC6RTn3
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-824413e10dcso2177550a34.1
        for <ntfs3@lists.linux.dev>; Tue, 27 Oct 2026 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114190; x=1793718990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTppmobKlXCQMDn3ZVLxidM0e+PEeg9PY8KBlnC43UE=;
        b=vJC6RTn3tlKQ4re0rqnNljV/MUXtC6xrhK1JzDgtbNyQO8pSmDxVBeYm0v+177uoRK
         KTLi29hYgJdqGjC6Om6b/qH3RAT5IzyXDHUDSI2MzugQ/TadB/bpCcQ4HpeZoVDQigBZ
         iu7qio8GGLJlKTkpYWCbzFf0JHxB9hV8tzYFb2sly6PYQd20o/1n5Ucw8Vv9phdiOwlf
         9Jiksw7VAgp0DHFK621Rt59WLAXe8SzQyhNy2PTjhUJl5KKgzzAoechLez7LN+vGq/gL
         r2nQQ8hms54bGRxTsag4sHGLyR68TiQkyEcWa30YkhxPhl7t02YhihnstgepIgG6ohc/
         xXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114190; x=1793718990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTppmobKlXCQMDn3ZVLxidM0e+PEeg9PY8KBlnC43UE=;
        b=stUGmuFA9aZjx/rTPGlJ3JnUAuVFELTiJWjx+mJWp38MvQ4DrK5oRBeI/0V77O4FGQ
         07UF11OemqDtsglA9YK/oXK1tST5neQX1ohjjgxZnj5fiVI+Do9olYAmaeirMALddaxn
         e31zwuTIX479vwELJ3rxo3BA2uqFovZ9Irq1U69KK3Ok2AbQYtdJ5Qn5ipRV/JVegQBc
         sbj5uMSA7VsH5+98ZOk6DNeOzinyfIsukVQZ265MhuctE8ucknyere6LRLHr5oeGRleK
         j/KToMhSWzS0Hwb6pXKhc6OpGsl79rZIIhdC22/aDdh+NT6WHclVKNmmAo2MaLnA0yMA
         EarA==
X-Gm-Message-State: AFq9FYKGkFCpHgzpnop57ahqQl4nwyHo0pIZFG3eslOzeFkuATApBqv8
	TSNA0zDqeK3tEND2Y060YyQgEDlqHwMIjmXB6sQYcwheCErNCgFHLmHb
X-Gm-Gg: AYBFou3hZwKlYzZGqGgAKNmFWnoGoweSIGZVn+HyfgkPUW6+4P98gGsRdgLnm5idjBs
	typlkBoc8SrhNFUCyHgNxqUWmOLtALNz0YPYgnGuwwH+qpUtP0qRs4YTI/Pu/kr743umpazg1wO
	ZI1vHrs8Eyl80ENZkAekx3GJjx71rh+o6lMZMmor6nfmxtJZRItMBEAgjZ+clcVjmESK5YNdE5Q
	6tOHJWJ1CfRztK0e4oZYx5ZS5XWEeEcVBjT5V4eTFO1Fqq1Geyyi4twIF8to4nnPxLpu1jCpITj
	9oBUlz4iRejydxtFMlPQAjosOmfevtCF9Zqi1kkY/J+mrWSkwcj6mHaErA9hMRkhVTxqV1Yowly
	WyU+n4fRRuEgr3UjTJvbmcuyb9BGWgjb83155/TLD/Hkp8jzwHB8/S6tG8fXfh90j8/wgpfP4oa
	JBjHXkzTBaqU2+6S7sPa6XzL2BT0BjDDEidk0uU19bFNYK02Q/KLS3weiL9Tw2n6nuQj55zFbsO
	B/kBsDnEG6dAqzROLCAb0Bw+3BbM3chXqFeGnT9waVmqErEweHIjT9egoA/h3YAiADNkJIf5hUD
	b6Dbfdm7G5+WixfwON8=
X-Received: by 2002:a05:6830:4393:b0:81e:1262:6536 with SMTP id 46e09a7af769-850fe4f7abemr8973671a34.15.1793114190396;
        Tue, 27 Oct 2026 08:16:30 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d7fsm10768970a34.2.2026.10.27.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:16:29 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix UAF in al_destroy() on stream inode eviction
Date: Tue, 27 Oct 2026 23:16:14 +0800
Message-ID: <20261027151615.971171-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

al_destroy() unconditionally dereferences ni->base and frees the shared
base attribute list:

    void al_destroy(struct ntfs_inode *ni)
    {
        ni = ni->base;
        run_close(&ni->attr_list.run);
        kvfree(ni->attr_list.le);
        ni->attr_list.le = NULL;
        ni->attr_list.size = 0;
        ni->attr_list.dirty = false;
    }

ni_clear() (fs/ntfs3/frecord.c) calls al_destroy() for every inode
being evicted, including ADS stream inodes whose ->base still points
at the base inode: the base's attr_list.le is freed while the base
inode is still alive (iput(&ni->base->vfs_inode) happens only at the
end of ni_clear()), racing the base's ni_lock-held attr_list consumers
(attr_set_size, al_add_le, ntfs_load_attr_list).

Stream inodes have no attr_list of their own; freeing the base's list
on their eviction also leaves the base inode with a destroyed list
(size=0, le=NULL) even without a race.

Only destroy the attribute list for inodes that own it: a stream
inode's ->base points at another inode, while on a base inode it is
self-referencing (fs/ntfs3/inode.c), so the ownership check is
ni->base == ni.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/ntfs3/attrlist.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
index 8710560cf2944..6aced486a45c7 100644
--- a/fs/ntfs3/attrlist.c
+++ b/fs/ntfs3/attrlist.c
@@ -29,7 +29,17 @@ static inline bool al_is_valid_le(const struct ntfs_inode *ni,
 
 void al_destroy(struct ntfs_inode *ni)
 {
-	ni = ni->base;
+	struct ntfs_inode *base = ni->base;
+
+	/* Stream inodes share the base's attribute list; freeing it here
+	 * would race the base's ni_lock-held consumers and leave the base
+	 * with a destroyed list while it is still alive.  Only the owner
+	 * frees.
+	 */
+	if (base != ni)
+		return;
+
+	ni = base;
 	run_close(&ni->attr_list.run);
 	kvfree(ni->attr_list.le);
 	ni->attr_list.le = NULL;
-- 
2.43.7
