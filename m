Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1A22E737C
	for <ntfs3@lists.linux.dev>; Sun, 19 Jul 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784492794; cv=none; b=Jr4MrnR5TaN90dzbTz47Zkc4pOj3u7yFC4aMgdXd4oKWK0xPR0/8rLFw9ZHLSRnSCOgnKEUMM/+7+Ieo/3YrV4Jv3pObqTldOKHTOsJAXG1kQX6XjteHven5mvkwvG2x5sautpbN0KWeAklO7Thb5e/5G6ohSEcBFnfYDJiU2rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784492794; c=relaxed/simple;
	bh=n3YcEGQ3D378pIJ7BISfebbLE6VYIfh+S6sfLSHcUWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCnhWCOD1xXIKJmBjc70Ug34zEZHJ2FuSE2s3uleWp7ausSNQO4ae4Is6Ymc1HPTd1flnJjYmvtxF5C/3RdeoBNLCyZ+hRm3eLOBkEEwWUlzF4rSOUmsQKGoCBrAjJCoCrdnVeTOa5efDp8CLiFDKrmphm6FfDJQ6O25M85Ac68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=kR6V/F/Y; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="kR6V/F/Y"
Received: from regular-pc (unknown [78.36.183.128])
	by mail.ispras.ru (Postfix) with ESMTPSA id E200845FB468;
	Sun, 19 Jul 2026 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E200845FB468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1784492783;
	bh=O0gHKyVSPz1rpov3LSHBjZwZRR/IJYkc7WZ6wnBJ64U=;
	h=From:To:Cc:Subject:Date:From;
	b=kR6V/F/YU5rtAHt5oSIqezEdRj8bkWBNogxEiS/4zrNvqaPfTi4HQYubqdlU30Sb5
	 Dk4h/XRM3twDyknrH3Ro44iAcLrUtdLiBDX2aE7rL1fFeNhSYikbBnJlcof/LS0o62
	 X4Mc03zVgLY4gWi3dM2dUBRVdkVU/FMZajjimt1U=
From: Matvey Kovalev <matvey.kovalev@ispras.ru>
To: matvey.kovalev@ispras.ru,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] fs/ntfs3: remove redundant if-block in check_attr()
Date: Sun, 19 Jul 2026 23:25:16 +0300
Message-ID: <20260719202534.2942-1-matvey.kovalev@ispras.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Condition of this if-block repeats another one from if-block above. So,
condition is always false.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Matvey Kovalev <matvey.kovalev@ispras.ru>
---
 fs/ntfs3/fslog.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index f038c799e7ac..7c40eff69959 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2753,9 +2753,6 @@ static inline bool check_attr(const struct MFT_REC *rec,
 			return false;
 		}
 
-		if (run_off > asize)
-			return false;
-
 		if (run_unpack(NULL, sbi, 0, svcn, evcn, svcn,
 			       Add2Ptr(attr, run_off), asize - run_off) < 0) {
 			return false;
-- 
2.54.0

