Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C722771E
	for <ntfs3@lists.linux.dev>; Sun, 28 Jun 2026 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782605992; cv=none; b=PDdjdWVWr+WfsuGQ4SbvhZnQiIEugUDgWvnU7VCb7U4TcDEF5+JDxEV0qUAQRiP/Toq5KYVQV6oXhRPF5wJQj/vvi+K32cqLyM0GqO5ZIpb/cVBh3uTDclzpWEW4OMEURF0rVF5/Lnv2iyqRgzjfZ72InErpIrCDofv9emq0N+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782605992; c=relaxed/simple;
	bh=BZES6Vu+87PSEiXIou4+9wu7I0xf5hQoKPcuveWQTos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scYO6Y6KO/iHazjlH4nfumnU7hRPE4gTvf4vkJe0k/M6CBNlOsPFr1biQgDaX1vCpkZk+rHQnEC2tOPvW184itr9IRTjobfVxgzYM57KGeL6KDcBvkveNFXqX5XkNDedc5kNBF3dKqhAgBWiw4eZpUXRjmd03WvEVjUBPp5vQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHCBZEOq; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHCBZEOq"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664b3831a20so1181503d50.3
        for <ntfs3@lists.linux.dev>; Sat, 27 Jun 2026 17:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782605989; x=1783210789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCBjOduh7mJd8MUykpzCDwwBD7x40iz6urrs4/3NtAg=;
        b=FHCBZEOqbGrJd2+0wzOruiE3FwdtojXbsTl1I1oPbW85iYnIv6GS7VOPuGTppaPXTa
         kIyiJ73tGa0I6ms1CGleUBh+qiFBcCJp3+XCibwfg6PH3IHusGrkH8gX6zqnIQtaGr+g
         hC8REy9EIbuwL5HvaejTwHy0o7vL7MI3t6c0kIupJQKgzF1oyWHG1yP+/3xcU2mIDnQl
         HXPJ5Xa590SoMPmtzeJYA5dwJifeLo+h6I50Qk6InVC0wepslC2MUWX2aY++9yIxY9oC
         E0kSw+/N1QiiJdHKA51HYFTFVW3cQF+cteEODTa8f2m57z9OtwEFnoqKkllf4Ncrxtl7
         DjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782605989; x=1783210789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCBjOduh7mJd8MUykpzCDwwBD7x40iz6urrs4/3NtAg=;
        b=aRuObE/qNT+dRHvmd+sdWGpolneMJ3qjKWeJVBm1IOAT5nr0hotzHM5oMxVUvP4Ir5
         qajKv3hKlwBM4jj4YAm3BxvVRh07QChuafZ1Fk/EhZUFRG1/g+mrbXvqa9hDrcjdmgQY
         O5dxj9UCxdVbRiXsxWZJ3Nnd4vHzu7fIQ4RmJP26/D7hCMa8XMzPh09qYC1Kkag12sAs
         YZ5MY2ho0IOdti1ZJXoX+f7ycs5+9nxbV5uxshqJqwPpJiARfIItkPoHT9EXuGBIC5CW
         pwUi0N3+xMRyK/ftb/0D10wH+98uI05Re1PY+udqht3i+BDEJoV9bh0cl/BEwcq/JDMW
         DVKg==
X-Gm-Message-State: AOJu0YxkM/u6lj1EkD2nfVJDUgr8rkvrtjv+ZtWpXGxgdVYPh8WtvCV8
	BOSQzGeHx6evE57PDGq1Iu6s5Unfg5XE2VNT5jldtI55KpHo/uJkyFF+
X-Gm-Gg: AfdE7clqJHiiDW/JN/Dk6hsed8P8Q39WRPODnv/44GOmy4P92scgrI6Y5TH6jXm7Ja8
	2tPb+Fq1MF5T6M/F1JSqugf/4jO11w389OXIa3kC0V0FYc2wRiJMSaEv3OTGo8Rbjb+DkbusJk3
	/hGC4FuKkLhvPN88bPPaUEtXIbPbHu8uztCZoVCpYPwn9RFTY5n+5OBio3qm1uwatznk7uaIG14
	eL1qbiRU0bKIDJB4yS6roiH0qPWE8DDAyh3cTANgNbyZJSECzGi0uwVKjR+6YLbCwVw0ET3z90k
	Y5Bn7o7ZD4rIpc7hzgXhJB4H9SshivcIFXJkEB0jhYfVy0h0fI/0lWW3N9CUoV58vf1VbNf1d5W
	PlQPsh37iZ4wA/VRvXGRtJ9NcBteKMubUoHB+ZgLp9Kifz4wjncW3faW8PYYJbRfLDeKr6IsVUf
	y8xhXi4nKfs9zWCmUI9j0YbaOZcciURInAnSJg
X-Received: by 2002:a05:690c:e36c:b0:7fe:1413:f6b7 with SMTP id 00721157ae682-80a6b4a3649mr113536277b3.48.1782605989094;
        Sat, 27 Jun 2026 17:19:49 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80d0f574c7bsm11589827b3.40.2026.06.27.17.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 17:19:48 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+33e764e33338f7b46952@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] ntfs3: serialize readdir against MFT record updates
Date: Sun, 28 Jun 2026 02:19:31 +0200
Message-ID: <20260628001931.21861-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_readdir() walks the directory index root and resident bitmap directly
from the inode MFT record without holding ni_lock. Writeback takes ni_lock
but may remove the attribute list and replace or free that record while the
directory walk is using pointers into it.

In particular, ntfs_dir_emit() can pass an MFT_REF from the resident index
to iget5_locked(), which may sleep before its set callback dereferences the
reference. This leaves a use-after-free window against writeback.

Hold ni_lock across the directory walk so resident record pointers remain
stable. The index run semaphore is already designed to nest below ni_lock.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: syzbot+33e764e33338f7b46952@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=33e764e33338f7b46952
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 fs/ntfs3/dir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index d99ab086ef6f..a6861f1b1b99 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -472,19 +472,18 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 	if (!name)
 		return -ENOMEM;
 
+	ni_lock(ni);
+
 	if (!ni->mi_loaded && ni->attr_list.size) {
 		/*
-		 * Directory inode is locked for read.
 		 * Load all subrecords to avoid 'write' access to 'ni' during
 		 * directory reading.
 		 */
-		ni_lock(ni);
 		if (!ni->mi_loaded && ni->attr_list.size) {
 			err = ni_load_all_mi(ni);
 			if (!err)
 				ni->mi_loaded = true;
 		}
-		ni_unlock(ni);
 		if (err)
 			goto out;
 	}
@@ -543,6 +542,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 	}
 
 out:
+	ni_unlock(ni);
 	kfree(name);
 	put_indx_node(node);
 
-- 
2.54.0

