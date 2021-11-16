Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B4572
	for <ntfs3@lists.linux.dev>; Tue, 16 Nov 2021 19:32:30 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 8so348080pfo.4
        for <ntfs3@lists.linux.dev>; Tue, 16 Nov 2021 11:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEUJ6Cchj6DxoHgG1vlE1s8aOzepdDzEGtiMa3XVL2Q=;
        b=CIytzrlXphzfFrs6A3g8F+qIiR5oMedCXkVqQxjEkLVx8DqZXENvsXIIfHSHeiIax6
         WTknH5rIMVTfjebiAHH3/3JEqYF3qJaONSJkIntZO4i2Bcx21tkHmlN/NZwyCSPTteYx
         1lvnbhQEU9B3FV6QtGliIk8ElS061RX9fg88InlfUvwWvLgrPe5EXTlV7754PRGs4U3P
         ZtZZJQXMunUejVwtiTYwKZ38Q95KqkI54/rkZrTnIosldagx7UclSHkPSCZBSbaDPmQO
         yqXjRCum+cmBbniPK3EMAigXEbNTkwcqW03GRd/q1dlltG4jv4/CeNUjc+lF1BkD+qel
         LfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEUJ6Cchj6DxoHgG1vlE1s8aOzepdDzEGtiMa3XVL2Q=;
        b=muM4cG2s/oa9kcFG2zIYfQjpJbcubgOrUCmu9aS/9t9Y9E7dAwsqVAOrnQCsWgk86K
         0cr2IuvbBkssCOtvX69X9vWkyQVcms7l4x+nL7LprsmxaQ3UljcGDlpdIR/laFkt5Bk7
         Iv3KIQkennuaOvBuzKe5UzJeDH6+nYyImTLTCVsSGjMvUW4fJIOGfV2FNOcMvrAywR1Y
         JxoapkgRMKLZ3z4g+waBdV7kDU4x1wK6NBxXh5hRPF18GG0RRSpHXIwGyBRJClRt9RNF
         /nbZFpQ+9764cT2vkPJgb10TQW86ZbCjkn4THFrC6rYaIWFRd1wH7TPjbsj9zayXmAPo
         o69g==
X-Gm-Message-State: AOAM530pBQjqv764TfsFp/85VUrN+M/L2l+5aqjQBc7EPw0c/LhVPR7Q
	B3KJKTtqzzzS1s6tJrv4HRs=
X-Google-Smtp-Source: ABdhPJxBqEcKGkrn5U38ZOGVuIn7FvUUDyTGdOzWbs7YQUjE6ddOcIfyLgADmd4ZYn1wDiLO1wFlZg==
X-Received: by 2002:a63:e444:: with SMTP id i4mr1021586pgk.474.1637091149674;
        Tue, 16 Nov 2021 11:32:29 -0800 (PST)
Received: from nutanix-ahv.sre-labs.nutanix.com ([4.7.20.99])
        by smtp.googlemail.com with ESMTPSA id k19sm20472563pff.20.2021.11.16.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 11:32:29 -0800 (PST)
From: Rushab Shah <rushabshah32@gmail.com>
To: 
Cc: rushabshah32@gmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jiri Kosina <trivial@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Doc/fs/ntfs3: Fix a trivial typo
Date: Tue, 16 Nov 2021 11:31:38 -0800
Message-Id: <20211116193138.335050-1-rushabshah32@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the typo effectice -> effective

Signed-off-by: Rushab Shah <rushabshah32@gmail.com>
---
 Documentation/filesystems/ntfs3.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index d67ccd22c63b..05e9c49b7400 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -104,7 +104,7 @@ this table marked with no it means default is without **no**.
 Todo list
 =========
 - Full journaling support over JBD. Currently journal replaying is supported
-  which is not necessarily as effectice as JBD would be.
+  which is not necessarily as effective as JBD would be.
 
 References
 ==========
-- 
2.34.0

