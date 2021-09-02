Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0272FAF
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id s10so5438979lfr.11
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TFcTQJKSbXDRLP9mWB7XxD8YdU1LWh59xr03hi/9bMs=;
        b=Ncbaywy50BWV9K53Lja0oOK+hE2NJc3JWDDWmDuJkBmZFH3dJuRUQhFel0fj8Oie3/
         Iib1SN4j3zZkSg/U13+RuASbw9thH/kaiaR9DbbwMJh5lyS2abh7XOGUvTsLVtNIOLPC
         i/JbMPIpRx1zY+3diKLAWqMUq2DLX/O64A7H0x3dwDs89DK4vm0+iQZF/mpljg45gpZx
         idAkOeUndYt0yWcqoNe22CrXa9Gymjy2YIG+rkf+CzKMtVcfTeIjHRec1cLDxDbGvvVj
         2eDryjk02v3/0vu7oIclQxktr1j0G37wH7B/1noKm4FfZA+psBcMuqUlsf+0TOba290V
         KucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TFcTQJKSbXDRLP9mWB7XxD8YdU1LWh59xr03hi/9bMs=;
        b=ByJiYfJU+906apjA4j3cednon+FrLpCPFJ6EFHDHaOjoX/Pbr13fOZAUfHeejskNlZ
         JzjCqlKw+WL0mkZCgsaRtRcyAoVH9Fd2RysuOTJaYH2lJXIzB/K0jgy/Fcx+OT2StMLA
         ptEkVhwwlTlQlm9bRIJPtN9DDXVW4IKUGO8RZOT5bFZ4ULo3HxkB0aV5nQa6lZWqDpDw
         ipXSJcYXVCTp9utSEqNspNlWcOEh1gWFaeAii/BEzWwvdadrLN2qJz7tjfZwgnHGpwxN
         E7uF+yg58dZDfrF2zJGlnwWU3tBR5XFBq7mXwFoVJVUb5daWvnVfHX18pomlXk7tY0vJ
         tYIA==
X-Gm-Message-State: AOAM531uXj8ygxLEQydo/U6sxoT60LI+rG7ExwEfJhWMxvCbvZv8sL7x
	rrJg9BdCLeznZFVOfyg/VeOOH5y4JviCJw==
X-Google-Smtp-Source: ABdhPJyNOOMEs/bXSH41xnWiO4/nVy+dtMoDUlM/uXEKQkHzOL69XPmqEPxeEsAd5vv85Z3jWJ+SNw==
X-Received: by 2002:a19:4853:: with SMTP id v80mr3147164lfa.365.1630599336951;
        Thu, 02 Sep 2021 09:15:36 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:36 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] fs/ntfs3. Add forward declarations for structs to debug.h
Date: Thu,  2 Sep 2021 19:15:21 +0300
Message-Id: <20210902161528.6262-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902161528.6262-1-kari.argillander@gmail.com>
References: <20210902161528.6262-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add forward declarations for structs so that we can include this file
without warnings even without linux/fs.h

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/debug.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/debug.h b/fs/ntfs3/debug.h
index 31120569a87b..53ef7489c75f 100644
--- a/fs/ntfs3/debug.h
+++ b/fs/ntfs3/debug.h
@@ -11,6 +11,9 @@
 #ifndef _LINUX_NTFS3_DEBUG_H
 #define _LINUX_NTFS3_DEBUG_H
 
+struct super_block;
+struct inode;
+
 #ifndef Add2Ptr
 #define Add2Ptr(P, I)		((void *)((u8 *)(P) + (I)))
 #define PtrOffset(B, O)		((size_t)((size_t)(O) - (size_t)(B)))
-- 
2.25.1

