Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3E01F0E2C
	for <ntfs3@lists.linux.dev>; Mon,  3 Mar 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993244; cv=none; b=tqn4ES6Ko5k9323ZsEpHuiVe1xLvB8BxZ7eDWZyl6CRzM9bQa9AVKXMrvBTLXL5iICzvqNUGDY9Sb/o61A8gTTmnztXiFZ5WlQIgcUw+crVw4MYzpiJ+pZ7CFYgrGZ9JziOTmeyjcbcTQ4afbSsSUXzzQN0xJJgHcbwlNP0lLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993244; c=relaxed/simple;
	bh=Y4na+PZuq9qpln+6pQDbOO1I/ozVi+pT4LINH5/Xlf8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S8seJKJIBNZ+ESd2OU6tszzj8hKcsyCNONCravE76Bq8gjj9/8IsQEk7z7rnL4d1ZhZdnAd2YhyePqwj2bNAksDdr+R+C0CHl0MGimltSbTNWoJyACAi6B4s5gpRWNuUGqEMTmq5WfS4oidROdiEJQx9uWDoYUvlnZaLbJg8oOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=Opd1Ifto; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="Opd1Ifto"
Received: from mail.crpt.ru ([192.168.60.4])
	by mail.crpt.ru  with ESMTP id 5239Dv3R014231-5239Dv3T014231
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Mon, 3 Mar 2025 12:13:57 +0300
Received: from EX1.crpt.local (192.168.60.3) by ex2.crpt.local (192.168.60.4)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 3 Mar
 2025 12:13:57 +0300
Received: from EX1.crpt.local ([192.168.60.3]) by EX1.crpt.local
 ([192.168.60.3]) with mapi id 15.01.2507.044; Mon, 3 Mar 2025 12:13:56 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH] fs/ntfs3: Drop redundant NULL check
Thread-Topic: [PATCH] fs/ntfs3: Drop redundant NULL check
Thread-Index: AQHbjByXRCuH30BWgkWBO5T9Xi9FhA==
Date: Mon, 3 Mar 2025 09:13:56 +0000
Message-ID: <20250303091321.68634-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.4
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=pWgN86eTmOK9MIqHI455dmQDuotfD8lDByCxbx0so6g=;
 b=Opd1IftoPEawGICNHpkbQc77+FGkvgOn7uG7QKYxcgdPYrnSoeVtjTUDs0qZbmiX5U29LNb/Tr83
	XlhLZv9DzCfXuiwxvjkTJ5fywD60AU03zRbDx1/skaPjYw4gn2A9yiYMWGPun2EjsGNsITqjn0hl
	LS/W2EZMoPQhFrNyCxpkub2gcny2mhdl/UOW/TqHC0uQ9Mq8xXVVjSPYNkd0Vc0REvcXJ6dAU/0E
	pVecCbKYFMad4F16anQfL7+7/SttQ1+PTC8dY3uwIerHeloyU+KJjQH4WQoe24GqnG8DWjCxSRda
	AnZsasnah1fxbU4i9BwOo6HZtE+8cB1pFILGQw==

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

Static analysis shows that pointer "mi" cannot be NULL, since it is
pre-initialized above. A potential failure when mi equals NULL is
processed.

Remove the extra NULL check. It is meaningless and harms the readability
of the code, since before that the pointer is unconditionally
dereferenced.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
---
 fs/ntfs3/fslog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index d0d530f4e2b9..03f3292fa987 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3143,7 +3143,7 @@ static int do_action(struct ntfs_log *log, struct OPE=
N_ATTR_ENRTY *oe,
=20
 			if (inode)
 				iput(inode);
-			else if (mi)
+			else
 				mi_put(mi);
=20
 			inode =3D inode_parent;
--=20
2.43.0
