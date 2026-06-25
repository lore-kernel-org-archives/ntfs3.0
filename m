Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073D7387346
	for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377588; cv=none; b=vFUnbjhfDhiBiDmkcfPASaEc3DBl0MKDI9s1AZxAGtLotb6CPx+EcbQ3Lxq3fMkcjyNy+Ghe56XKKrbustKr0e0juNynC9XRya5BSvMzyIgRHxOaltk8amBGuqV4DFXL3qARrSFXgmopQgpj78QKTncXoToAL56t1FJsv+s/H0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377588; c=relaxed/simple;
	bh=XrkuZT/OwaqYkfvfVZq6UKvtJ/FmppbMvYNCGI0KEXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gL0ZIgkK5C0tD8Gkz1rGESw79rcqPFZuaS/qal2nd+w2Y1w7tNDydgMSloi6wqPFavUeWCKYn7IqXsDJZxr5OxtPbIIAFZcXDSqCoU/bFa2dSRDuxSgpZwlP9qXMJ73vWFO2FTFS9YG33nzWrF78fhU8au1EljgX02p9T8vHNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdQ9nG6p; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdQ9nG6p"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1390f75d8bbso4766222c88.0
        for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377586; x=1782982386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHIcJTOv0rFGJ1wFoiq4xMsPfLJojpCiHJcrZikZ9vI=;
        b=bdQ9nG6pUnK/rjbXnT5h7GvFCRqqcoXsuDA+V6JvWSpgFDCF1S6aUkPh/BwGyFWcq7
         Kz2kL8bdjlqD+cg2Ilo+UPuEmBNXaTP5Xx3gNaTmO0aP/h4AH3g7d9pG60KjVq9+2ysw
         C3nF4jr9S3dwCEDLSb/nb/JH2RuoyB3Kv/xE6gqquSguieZDgQHZs5J+mUklxcNBJucM
         8B8V7+hkquzqoX7v4KJJMJpm/x27RAgc+5jAzRJKMSIPfkJoKM8jRBnsC2kw32SjXATq
         JWCGyhID3iO4OCYMuDEQB/Xu2LnwNShmfe0uCuWsxc6dNWa9IzWGR9YI9isHqijr1cij
         VOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377586; x=1782982386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHIcJTOv0rFGJ1wFoiq4xMsPfLJojpCiHJcrZikZ9vI=;
        b=tM25LnP1SgnwIcnnMcHdFGC/pwpkrqxGNRakdOIACMA0hkmuEUMgFclMi/ScEPiKoI
         617L77a5YoNzlqjyJ46T61ffrnxmCd34O04KvkSlY1Un9ewGaZNmgboC6dzWBwZVFA9n
         /aAzhuNAHklQYyYu9UjWMPAXT+ceRnNRvFCvLxqpMQdfDdoZdCeK4GDGRqN6tjxTksV+
         Us5CDbjiDUf3afI3Tjyua+NPQ3RsRpn3ScVEI3oLmOiZFSpNK9XLw2xZ6kpC4DQRaugZ
         7BdESFQPekO7FzW2kdK06/cePWyM/ENNrSwN15Xm3Z4NRlKqrLzbxfhYlCuBWHaId4Ew
         eSJQ==
X-Gm-Message-State: AOJu0YzF0Ns6uzfOqfpfsGHuigchloytzMN0WYT5iSDmpzePylONNi0T
	SL2YIibugfZcwGv4zcF5eE1tlA4lbY5yS2ruZnINVjhUiW4ZK4MFfDlnrsJo58pz
X-Gm-Gg: AfdE7clt8LHAPKYAF314vHOtwPUI0rhOm74O3u5zAc237jKxsWSVFUdYOphja0LETpb
	9iRB7mVApxkN2Qo+5tN/JCEgitzwyJq1rywMk+J3jspVnsoB1JzECEIfj3d+2ZHGd77h8q7gYVe
	nRYJfvZQI6lmdV0wf/4t/pS4THY1WpfAHgzpp7IObv+E+FNUn9qJ/lzGofhjKvjv6+O3MKGiLkL
	E8wfOGZlXKN6Mdca6EKXsCkSwoty8w0a6r6wGrXAQfEC7Z9qTe7YMLGjH4q2wUoWX1afnKEhGvU
	HnipF4eutY8IDwjChquH/dedZpMLKlgkivWyka3ddu2nfnGnE/StNk/Z0nPZg3N/NoYfuL2GOaS
	1sZqQmyzY92M2uJ531hBXQL5z+/BpvYJA5bhGR09ESOBlGrst0sPuvdLU0paIU1xDl/UlrFq7JA
	4MCUUoyrlGB5jkTdfQqPy4JdBtvXE7AAcxJ/NgRk6c5HfP4bcP4XI2l+eHag==
X-Received: by 2002:a05:7022:160c:b0:137:fec9:8ffb with SMTP id a92af1059eb24-139dbb69b90mr1398598c88.25.1782377585920;
        Thu, 25 Jun 2026 01:53:05 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f77602sm5776975c88.8.2026.06.25.01.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:53:05 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH ntfs3] fs/ntfs3: zero frame pages on read error
Date: Thu, 25 Jun 2026 01:52:58 -0700
Message-ID: <20260625085258.1579874-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_read_frame() marks every frame page uptodate at the 'out:' label
regardless of the return value. The pages come from ntfs_lock_new_page()
and are not zeroed, and several error paths reach 'out:' before anything
is written to them (e.g. a failed decompress_lznt()/decompress_lzx_xpress()
on a corrupted chunk, or an allocation failure).

A page marked uptodate is served directly from the page cache, so a later
read() of the file returns the uninitialized page contents to userspace.
On a crafted compressed image this leaks kernel memory, including pointers.

Zero each page on the error path before marking it uptodate. The success
path is unchanged.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/frecord.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 2b49bc077558..ca3b46a2c9c5 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2469,6 +2469,8 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 out:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
+		if (err)
+			clear_highpage(pg);
 		SetPageUptodate(pg);
 	}
 
-- 
2.43.0

