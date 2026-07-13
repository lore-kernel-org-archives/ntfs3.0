Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1EA34A796
	for <ntfs3@lists.linux.dev>; Mon, 13 Jul 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965084; cv=none; b=PnnkayfD4eeH8lvh33kttIMg4famTiXrUB2YSrRveQvJXDWOYK9QF1J+ERc1cGvEYA7myEZDm6LRGjIwbkYxPBi6E0TWXn/tqcwcpBRaCA9sPiUIXi6K3t0MZQW9STzFIHdFQoOqk89NXF/96WmrpJ7RapZUCqNxcdStrkHzJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965084; c=relaxed/simple;
	bh=lIuSLdLFUMYHYIkQND+5ezv/2Gm5SAaNrjxK7kuHO+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZGWpOYtOJU+Rr7qQ6xVqJPAHz/215hx7Q9u8w05CztTjPQzNN3nGhGuU1GgKX85VAQr0w+V7ilxBN3j/PSDgvhRVeiOKrpulhkeCZ2EjKMf60s9zosS5Wd2bhoSIlam1gRlQXJTLbvQ+RbuQlYHY/ThE/3KSJ+eZZ6phV/2p3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTnoiAQI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTnoiAQI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-388b404ea89so154717a91.0
        for <ntfs3@lists.linux.dev>; Mon, 13 Jul 2026 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965083; x=1784569883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7b5s+xdKt531buNfoF0W/b2tSHU/H/fnzI1QXPkyZpQ=;
        b=HTnoiAQI+hfpVL3o+r91CCnTd6mnKXr/3hXMUQUAxqr22ZZFWx5tAqEkj1z1Iu0gV/
         6jLQKRy2I8YsAI25REco02dF0I5v1GHuwFdTeYRg1cixTisOyLa2H2o0+8xhDmMe8baB
         u7rTWNWYA5NZc1m5Ppx1e1b5UKOIfFhlzSWIilMStOl8Ml3qODGr+JyQfDBPcZtWEo10
         DC1OZxWNVM4SBAxbnZCOO3WQ5e6lRjHf6lb+5dT+siObsntDjN9jDlwEIc0/RXnPRf2w
         cBKjItmSX/pw7q93eCU9zFxo2VMEtzWMkQe5e4MLVtBAcWf+axbmxCwWBC77wjOmXpoa
         Jf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965083; x=1784569883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b5s+xdKt531buNfoF0W/b2tSHU/H/fnzI1QXPkyZpQ=;
        b=fqj9vb2rWOcmyhRyAGUiWbjf260qYoYiDXMj6Tl1e6aQJNR1pG94eMVtyBdmt+S1Bi
         2PnJDDraj8jL+ForbEssYdKl1SK5HxKxAyVooUzu6ytxTVqFK+LtGfXffeFOm9zDDiyV
         Q3YbFGEmlZa+UipBD6DIjPet7fJpVmU8cnDeU78PFZiqX8VUfp5PKB3RxjIweo0wNyTV
         953DDJOeJOoW4XJBzFPMmy3DHUcg2iTlEoIVwZXuQVubuckpeAhXmcioF4HBoEZJliCJ
         q7pBqG5TfM2056jmkvXrns9Lmjwjtmg9KHA5UL8xm3xEfKtRByCT9jVqNFFtNp7HO4d0
         Bpmg==
X-Gm-Message-State: AOJu0YxhGwmSeKwvz3TbRzb2jtCenya5BSksNw7MFlwWnMsaWNigizmj
	VvzVed6rSQqAbBJ38+qK/7+Div7QDcJJWrdd2ASrjEEf/XomXKgjC8Vp
X-Gm-Gg: AfdE7cnVbu0ctLKDAcCmKxo7y06V6/tslBnRM+BFJvNSYRRL9cKACPH8dwMx6XGh0Kz
	DH4Gk02RzPxFAV7pby1YBCQtUqBkJOmtaW763mQat+L8SHUs25/audGzBTu7ni6ICTDQCb/qwt+
	q7jtI/soyxfhJh5BHE/APXvafTm2lEQJHgBjyf7fbmtbCk4viZrIj0TX/oKrYFuyEZmocmx6eUw
	BBA6bDLlmuQsgehmplvd2cSO9JUJyncfZ8G8Qv9fft3VU6dCXBfH+ZU612RzCWP3VVjcCdNClnE
	SM/At48OdBti2Ytdef+8LcF2edicGSPU9LC2FnR4jgKBstlI/VQXNaHIzYyKNx8PkXipnJux2KQ
	DPEZ8LluXGG9JjFCoz4Do/50rlKIR6VnxjEA232a2bi/3PUXoKIXw8vNPXX8+QpoJOj4fre7stT
	fofM54MeU2KTm/dXElJkBckVQaqcysONa0COaoB9o=
X-Received: by 2002:a17:90b:2548:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38d15364030mr14878803a91.13.1783965082598;
        Mon, 13 Jul 2026 10:51:22 -0700 (PDT)
Received: from primary ([223.181.22.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm72354027eec.2.2026.07.13.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:51:22 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>,
	syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Subject: [RFC PATCH] fs/ntfs3: prevent positive E_NTFS_NONRESIDENT from reaching writeback error handling
Date: Mon, 13 Jul 2026 14:11:40 +0530
Message-ID: <20260713084140.249515-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_data_write_resident() returns the internal positive status code
E_NTFS_NONRESIDENT when the DATA attribute becomes non-resident.
ntfs_writepages() propagates this value into generic writeback error
handling, which expects a standard negative errno and triggers
WARN_ON_ONCE(err > 0).

Translate positive E_NTFS_* status codes to -EIO before recording
the writeback error. This prevents positive internal status codes from
reaching generic writeback code while preserving the existing behaviour
of treating this path as a writeback error.

Reported-by: syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
RFC:

I'd appreciate guidance on whether -EIO is the appropriate errno here.

E_NTFS_NONRESIDENT indicates that the DATA attribute became
non-resident during writeback. Translating it to -EIO prevents the
positive internal status code from reaching generic writeback code and
preserves the existing behaviour of treating this path as a writeback
error.

However, if the intended behaviour is to retry the write using the
non-resident path instead of failing it, then the correct solution would
be more than a simple errno translation. The proposed change assumes the
current terminal-error behaviour is intentional.
 fs/ntfs3/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0c9bd669117d..9458867c6b0b 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1019,6 +1019,15 @@ static int ntfs_writepages(struct address_space *mapping,
 
 			folio_unlock(folio);
 			if (err2) {
+				/*
+				 * attr_data_write_resident() can return the
+				 * positive internal code E_NTFS_NONRESIDENT;
+				 * both mapping_set_error() and writeback_iter()
+				 * need a negative errno and warn on a positive
+				 * value.
+				 */
+				if (err2 > 0)
+					err2 = -EIO;
 				mapping_set_error(mapping, err2);
 				if (!err)
 					err = err2;

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.53.0

