Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCFC41DEC9
	for <ntfs3@lists.linux.dev>; Fri,  4 Sep 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504886; cv=none; b=FLozFDrnYlqVFjheTP8JZCWoByBdps3oZX9MIEnBhgJjl7q+YgeCqlYN4J70M+tezDL+Ji39mXvUNOzDqznZXpF/Sryd3bCOdUHb7k+stQp30h9bVDzWGzwrUYEri037zoQiVGVnYkfKACXOrFtFUlSQM2yF9DQ2WeUfr7e21kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504886; c=relaxed/simple;
	bh=No/tqeKhj5vhBbZ9eGGNy9XM2YinBvrbqfjqRNEzjNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VFiMruWSRGsF/Qz3tGKcA6CQ979LzZFRy1BSX5du6D5KxT8+7ep/odwS0hE/m0MhgEifugNhk04fPLq1whPNjx1pWahA1NL0NYJHDwliLsTnO0l3rmWJfKNdF2sVEc+xwAxTMyBB2dUQAvr1MlBbF1hk5oJI5f3FLvZWqlp/HCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjS8k5Ax; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjS8k5Ax"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso537916a91.3
        for <ntfs3@lists.linux.dev>; Thu, 03 Sep 2026 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788504884; x=1789109684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B1Y9JGeTBz9J0cSMx8uNBI7PYHW5JuoK9tu5YHKCsSU=;
        b=sjS8k5AxNGaTSwoNf0Arf3qMFiEM5JPmK3H9Ym6eDUNE2hWmIZZxcgNQNuASyTMewt
         X3+Z34hTCyNuYOUzqAuVMkfrQrqgwdS8yijDyH4Lyp/Bp101FT7NzhC82M4FOvUcijBI
         kdJrgdyHbqFzpmy+QuToonB7VjG1B5euQiIN5aumVfP6KLXsUE4Q3DhuibGHxCWcbBzR
         cVY+ndqUU5wUoNqGB9X/OLAdr/jYca5ux4Xdz1mutKd0eEgiviW5zlHfzWG2uo0HZIKx
         L1f1Rt+de1LGjMINCPYNqQC96ghmVoN+VNuaRQkG9GqkyHgxxyeHDlupB/VteeHWjIcy
         5Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788504884; x=1789109684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1Y9JGeTBz9J0cSMx8uNBI7PYHW5JuoK9tu5YHKCsSU=;
        b=MSa/5N1VXcZe0qSO8zL5oaSRCVA3O5JCeRNlLMFLvyW5kwIz/PcHJ+KyoTVLPRlAoW
         KkAkNLYZT01+AOHxbAwQlChh9OV4pbz27PsHcPgA9T0vz0VBrW8Ur/oHNIUHBB1ckboi
         0GQOZDSCsfJEQYm4Lt1lj/i048OMLBofQQ/H3ileyK1ZNbu7pPNbLifJk5JQdhf8zEkI
         SVyuPveTXZRs9HGIK5F9xh6T4fDbKIe++GnNqsRTZhzaQBhK0CBoWRt/jy/uMOJ+TprW
         bxOD0smFNRRANvjVneQyAaAZwmySwHLOuDgk0z8BkSKULQS4zdA7c+Jw6/J9VRL39/2g
         dm8g==
X-Gm-Message-State: AFuF++nApdsz0q0X41+MwiGBtxL4b9KZ7FwiPvZFlLbaAfAxWEKTEnGi
	vyMyTfl26JQ3j8zySPNoB2HuV9O+XcRfS9hcqxjIroBYJExRw0AFNu2V
X-Gm-Gg: AYBFou29zgWGbw3sW1jYAXtOVpS2EKqnN9SxFFeCeZ9gHFEK/nVYH7RF4PusrOd0ISE
	wx5HLBi0PnESgJCCegna3pepJ2HR2AUIIWZhWELX+z7tltnMKBjISdau5YRi9QWKxTL0t8dGpTF
	/DlrGcQSrBROA7r1vFAX7AZANs3ayfv7BV6oufUoA2uYOElVVeXu7E1AHXuJrXoF9PLUawufJO3
	yAUovwqfmz/aY6sq/G08bv2WKLQUmFVEH/OcAZ9FibuQUoITFrngzZ3IL6yE8L2kSzXrfIEh4UL
	kxn6qh8lGx0nG5CoJKY+tlrkNlJQcEYa7BbXHbZ0dqdWucVAVXbZlBfWpQVNR/ZZbci8pFuip3m
	0FjKwT9eoXmj65hr9GGLk8It8tsPu83kQtdThQwbj979ZzBJpl2v+asJKvzSM+G0fDdCcGTnfqp
	+PA75Bqdb65szvf5NODpToRi7gneVvIEFOwLHtO5hrsQZ7NlB9Sa+eRymCIopnAHNFT+fPiqXmv
	Z0f7mJ1M8g=
X-Received: by 2002:a17:90a:c10e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39b2622b3afmr6273154a91.18.1788504884500;
        Thu, 03 Sep 2026 23:54:44 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm2845086a91.13.2026.09.03.23.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:54:43 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: bound asize by SIZEOF_NONRESIDENT in check_attr()
Date: Fri,  4 Sep 2026 14:54:37 +0800
Message-ID: <20260904065437.957677-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_attr() validates a file record attribute during log replay.  Its
non-resident branch reads through attr->nres.valid_size, which ends
SIZEOF_NONRESIDENT bytes into the attribute, but only checks that the
attribute fits the record, not that it is long enough to hold those
fields.  check_file_record() admits an attribute starting as late as
record_size - SIZEOF_RESIDENT, so one placed there with non_res set reads
up to 40 bytes past mi->mrec, a kmalloc(record_size) buffer.  The later
"run_off >= asize" rejection is too late: data_size, svcn, evcn and
valid_size have already been read.  Nothing earlier covers it, mi_read()
checks only rec->total, and do_action() gets here for the ordinary
record-modifying operations, so a crafted volume reaches it through
normal replay.

Reject an attribute that leaves fewer than SIZEOF_NONRESIDENT bytes in the
record, as mi_enum_attr() already does outside the log path.  A real
non-resident attribute cannot be smaller than its own header, so nothing
that mounts today is rejected.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Reproduced with ASAN in a userspace replica of the layout and of
check_attr()'s bounds: an attribute at record_size - SIZEOF_RESIDENT
gives "READ of size 8 ... located 24 bytes after 1024-byte region",
and is rejected once the guard is added.

I did not craft a volume, so there is no mount-level reproducer and no
KASAN splat from a real replay; the reachability above comes from
reading do_action(), mi_read() and ntfs_fix_post_read().

 fs/ntfs3/fslog.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..034d72929ac0 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2772,6 +2772,9 @@ static inline bool check_attr(const struct MFT_REC *rec,
 		break;
 
 	case 1:
+		if (asize < SIZEOF_NONRESIDENT)
+			return false;
+
 		dsize = le64_to_cpu(attr->nres.data_size);
 		svcn = le64_to_cpu(attr->nres.svcn);
 		evcn = le64_to_cpu(attr->nres.evcn);

base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.43.0

