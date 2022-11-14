Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219C64A3E
	for <ntfs3@lists.linux.dev>; Mon, 14 Nov 2022 11:53:35 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id y4so9856451plb.2
        for <ntfs3@lists.linux.dev>; Mon, 14 Nov 2022 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hk+Ng6HzdEIcxEdrVoC5xdXSCCrpPQX/sVOx2Fc1RIU=;
        b=XSsHqQQFR8a+jzglZGxrXAFL9CywFjxS/ReTLiwH6YBiTS4TZcDe60UCsGDeSSmFoz
         /WGYg9BAcVn9Ndl0EcjAiPgjot0FOIB/o/4N8SJEjNA1mQddh93SbRNfGxsOQgOozsFD
         E18Ch1DrCYA92fARFXicfyxie5L6+hsQ/F2p6uDe9R1bpEPDBoo6UtVCgZzs3juahDPa
         OkCGZCRdUUQ8rQAypKWsERASJNPyKtM5X9BohXZ2E3XYIHfuzJwmDJCiCHrJE5cNx3Ra
         nE98MaN7VB55HtQBLUSQqEpilE0hKSY5MfbPDIdklhLd8q+c8rkDlP60Qyi/3bQTHIni
         Di9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hk+Ng6HzdEIcxEdrVoC5xdXSCCrpPQX/sVOx2Fc1RIU=;
        b=KQQf+Akczp/Vj+HoMalwX72epwMmpmJSwOLXFWdlcRAV+KRg/14vd4hau1f0zbFbIr
         B/nCbSZA/p9v8OTXikVWEsOLSiblbh4VOpNqqIY/FS9cb0lItjeL+MB6dLnIait4qLUf
         PYOAH3c4qwpgbKze4GoL77i2l5bOesPYyhy7h+c/DuSpJuKDaAismjD7RUovgbKRE6Uh
         PzWEmB+u61NMSPnv4n/K/Ztrx5FY7wjaaEF7YB66WUGspeGbF+1Qg9bjMKCWeDTsFmR7
         64FU/W2s/d4qOjyTXGCWiEwUdtnoRy08iM/UI8aeUsNAmGfyvdmPZ1PZU1sK1I23jEvv
         bfEQ==
X-Gm-Message-State: ANoB5pngcQ10RuI1XhMKirJ0ugnq5QZAu5E8+xpfWizT+kBBG7SD+Q4O
	mACrcWl7/lWDNiSXb6Le4bI=
X-Google-Smtp-Source: AA0mqf59B2DO9ZPDLarWALVCW0QEKktkW/UTpAJO53Bv+6cCEY7rNVHY9Wxfvns5lFF5/ZGBg8dXtg==
X-Received: by 2002:a17:90a:a391:b0:212:fe4a:c378 with SMTP id x17-20020a17090aa39100b00212fe4ac378mr13592444pjp.82.1668426814474;
        Mon, 14 Nov 2022 03:53:34 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.16])
        by smtp.googlemail.com with ESMTPSA id d4-20020a170902654400b00188a23098aasm7248907pln.69.2022.11.14.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 03:53:33 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abdun Nihaal <abdun.nihaal@gmail.com>,
	syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Subject: [PATCH v2] fs/ntfs3: Validate attribute data and valid sizes
Date: Mon, 14 Nov 2022 17:23:14 +0530
Message-Id: <20221114115314.183818-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data_size and valid_size fields of non resident attributes should be
less than the its alloc_size field, but this is not checked in
ntfs_read_mft function.

Syzbot reports a allocation order warning due to a large unchecked value
of data_size getting assigned to inode->i_size which is then passed to
kcalloc.

Add sanity check for ensuring that the data_size and valid_size fields
are not larger than alloc_size field.

Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
Reported-and-tested-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---

Please apply this instead of my previous patch.

Changes in v2:
 Correct the format used for the Fixes tag.

 fs/ntfs3/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 970bb7c357c7..763dd982a43a 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -132,6 +132,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	if (le16_to_cpu(attr->name_off) + attr->name_len > asize)
 		goto out;
 
+	if (attr->non_res) {
+		t64 = le64_to_cpu(attr->nres.alloc_size);
+		if (le64_to_cpu(attr->nres.data_size) > t64 ||
+		    le64_to_cpu(attr->nres.valid_size) > t64)
+			goto out;
+	}
+
 	switch (attr->type) {
 	case ATTR_STD:
 		if (attr->non_res ||
-- 
2.37.3

