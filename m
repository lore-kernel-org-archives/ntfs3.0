Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FE846BF
	for <ntfs3@lists.linux.dev>; Mon,  4 Jul 2022 18:53:22 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso8493323wma.2
        for <ntfs3@lists.linux.dev>; Mon, 04 Jul 2022 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T1YetwhZb3OgibIUGFFuv352SwQk2UY8NZnYhEM765U=;
        b=lNmrkBXzGPjuvDVI9s8mP5gy3z8tuSbD3fF5goEhL+xcTBkDvxLphfho2IGzOMVnFE
         PRS4P3AwX8EKEkrn5c9JBZX7JrNoc0o2mKo8QFgx/CTByvzT282a6O5kjKgRyOAqx/rl
         Iepu4fPVQ1F7LnhPqKkuYTowGsthDaO4IE7nGUtszRw5+x3Wfz3yJA2eb1LoHb/GmBzi
         7GIvfxBSrRgw+l3YG3dV8+Mn29s/ewYutcOlpfAVPI6Ss5SyrFXrAy0jYtPMSmrvmR7O
         EXNaMbXXzPcgf4Q0khCAgh9C+poLbndlE1zaveKYow1JLUsBpRU42bcDdrwS994bYRy+
         sAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T1YetwhZb3OgibIUGFFuv352SwQk2UY8NZnYhEM765U=;
        b=Jl47uvmhDbFxa/tRhDdYVMYQH2Fi1Ao1pKv2d7sIm9pQJ8QWx+ofvUTmH5wd0/m6pt
         p0jVwf9ZedGToFT2JP2alwF8JkJ0pi/TDY6gezFXVWSyAC5z4NIkGcqhX1XNnkwlrMPn
         rzUg2/V8guL7sJzUkEzoLo8NSITtcWJ1yqUHhH5h2Denvo5cKDE/rbwApURfeOixrm4Z
         Npr1OLXHxvRu15KKH19/39htDCQVC26t3Jra7b3di69eJQsuBGYgtJqZXx7R1t+IrAeK
         4+gZktBuq3Ym0H9RZgBHAsW/JYYFBRpVWwdSEtvYCI0ShY879yLJrKjYm0td0ZBs4JpB
         /yiA==
X-Gm-Message-State: AJIora/r0iZAL44GFNxLqcEkhkNdkICbPyFx1aLuCgZHvEWusG0qNQ10
	9vdfQ+yQIBFuA93Sxar+noY=
X-Google-Smtp-Source: AGRyM1vrBQHyhEqZZoyA4hn6r7CWyFalKKLaQYe4c6q+MWprWZDioffoMIe1RQn59/cE20iBV1Leyg==
X-Received: by 2002:a05:600c:2315:b0:3a1:772e:b9a6 with SMTP id 21-20020a05600c231500b003a1772eb9a6mr29213575wmo.34.1656960800853;
        Mon, 04 Jul 2022 11:53:20 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id by13-20020a056000098d00b0021b89f8662esm7273877wrb.13.2022.07.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:53:20 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs/ntfs3: remove duplicated assignment to variable r
Date: Mon,  4 Jul 2022 19:53:19 +0100
Message-Id: <20220704185319.592631-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The assignment to variable r is duplicated, the second assignment
is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs3/run.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index 7609d45a2d72..aba8ab1b9fcb 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -563,7 +563,6 @@ bool run_insert_range(struct runs_tree *run, CLST vcn, CLST len)
 	e = run->runs + run->count;
 	r = run->runs + index;
 
-	r = run->runs + index;
 	if (vcn > r->vcn)
 		r += 1;
 
-- 
2.35.3

