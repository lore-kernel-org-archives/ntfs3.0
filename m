Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74773FCB
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 18:33:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ba1so28909881edb.4
        for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qESl3rMYHtCNsN1KYJrZYVtclXyNC4opKxEbtNkEn8A=;
        b=P1R5PSgD6HEYoUj5joCV0pBdshOX5aFC25ZEGGufht/4X2mNwstChoDfxDkpD6FQEQ
         0QOIQ4+QSlHTUuxV6b/+oaBWPV4IAxSnKlIa1YKiBbV/w2Z28GbiWmzb8JdC+92Cejms
         mG1sE06vJcpthaMA+W7KT0nv4znZpWBeQX0+wMzkMB2782mMibJ5bxPsWzCjVrtuzYGI
         OMrgx/9hrKAZMDAcYA8ZwOYFw4IAMeQ8hiAmryvEcuEDsauqz3CvKw65l1P5P4tw1rl1
         tgr6uto7EVuiMF62crDbWny+8aCUeEW6jFKNhjzJ8e1Ldl4rVmla3ipAlzgwS9Op/BCI
         MTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=qESl3rMYHtCNsN1KYJrZYVtclXyNC4opKxEbtNkEn8A=;
        b=Lq2clNP+VOCspNDcGczcRDLC0nCoW3ilgFua3oCl4BlGhMlPHZuN/4b8MxA/syUyP0
         yuF1P+uSTVYVNFcBpUpBYsn9GLpHk2DHs+m3tSbgcnFnjnIPLRfgcsQ6xOMibETPoaEh
         923ZwxHeLVJGpcpJ7Az7/OZabduOula9Gy5+BLsFAVRzU9Sz3eZZhtCqMcvPmGVqa6mW
         3ISEeLddTYfO8Ew9MDQFDhY/VoDrpqolc/av49fzDop2xx0NTxlBJ8gLSHW3HCHLzSQi
         oPSkZ96Ajs9Q+AFISjKQwwSWVT/DZfrmDH7mUPYTrroKWo0lHn9geHtp6vU6AvkTWN4o
         t2NQ==
X-Gm-Message-State: AOAM531EjX5umzfRg4y8s2lOjvN6cH2ZBW+1hJl5QvbjxFV1WpJ85/la
	RW8hR4rwsUfvOn9CDRy7krc7gJQN13M=
X-Google-Smtp-Source: ABdhPJw5mtXNgAu3Xen12QSCp2XpNiIljxYskSDSscf6O0YmXGYEaGs2B3PteQmL/bt1S6PPS/rLww==
X-Received: by 2002:a50:d80d:: with SMTP id o13mr9511244edj.204.1632853984029;
        Tue, 28 Sep 2021 11:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8010:64ea:0:fad1:11ff:fead:57db])
        by smtp.gmail.com with ESMTPSA id l8sm10903897ejn.103.2021.09.28.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:33:03 -0700 (PDT)
Sender: Mark Harmstone <mark.harmstone@gmail.com>
From: Mark Harmstone <mark@harmstone.com>
To: ntfs3@lists.linux.dev
Cc: Mark Harmstone <mark@harmstone.com>
Subject: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Date: Tue, 28 Sep 2021 19:33:00 +0100
Message-Id: <20210928183300.12946-1-mark@harmstone.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm not quite sure what was intended by the logic in ntfs_cmp_names_cpu,
but it was broken when comparing case-insensitively. If the strings
matched but differ in case, diff1 would be non-zero, meaning that the
function would always return a non-zero value.

Signed-off-by: Mark Harmstone <mark@harmstone.com>
---
 fs/ntfs3/upcase.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/upcase.c b/fs/ntfs3/upcase.c
index b5e8256fd710..dd28c2133a4c 100644
--- a/fs/ntfs3/upcase.c
+++ b/fs/ntfs3/upcase.c
@@ -74,31 +74,29 @@ int ntfs_cmp_names_cpu(const struct cpu_str *uni1, const struct le_str *uni2,
 	size_t l1 = uni1->len;
 	size_t l2 = uni2->len;
 	size_t len = min(l1, l2);
-	int diff1 = 0;
-	int diff2;
+	int diff;
 
 	if (!bothcase && upcase)
 		goto case_insentive;
 
 	for (; len; s1++, s2++, len--) {
-		diff1 = *s1 - le16_to_cpu(*s2);
-		if (diff1) {
+		diff = *s1 - le16_to_cpu(*s2);
+		if (diff) {
 			if (bothcase && upcase)
 				goto case_insentive;
 
-			return diff1;
+			return diff;
 		}
 	}
 	return l1 - l2;
 
 case_insentive:
 	for (; len; s1++, s2++, len--) {
-		diff2 = upcase_unicode_char(upcase, *s1) -
+		diff = upcase_unicode_char(upcase, *s1) -
 			upcase_unicode_char(upcase, le16_to_cpu(*s2));
-		if (diff2)
-			return diff2;
+		if (diff)
+			return diff;
 	}
 
-	diff2 = l1 - l2;
-	return diff2 ? diff2 : diff1;
+	return l1 - l2;
 }
-- 
2.31.1

