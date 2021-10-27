Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8542E2C87
	for <ntfs3@lists.linux.dev>; Wed, 27 Oct 2021 10:56:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id p16so5333494lfa.2
        for <ntfs3@lists.linux.dev>; Wed, 27 Oct 2021 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s2N13FmOEYQNpt6BncLBbaLCyj4beMEaWW0ResefSLU=;
        b=QpZeNjrwXoUDv74u/Vt5/yjPKeirdC3bBtjTbxCLXEgpnFL5FB+VvtY34BzU5HyMHe
         hZHDg6g/jeHqhqz6uFKt5DqSegxzFMb2Xh+qgMVzE7IYFf+q15FLmjHv8/nyepgvmKrL
         UCvJBPZlT0/Iiw63lffWsd9vq8O7c402Z0uveQ9IgA7JeGjooiFcfhmZePC2haYszhL4
         Iy0SbilmB2ER3y9LOXsXX+uDFY+p9C+Sev/GARJvcOpepoM2OL+0pE0Z2iS49/C0t03t
         3bD08RzOYP4MPy9OF16Jcd4hUUDJ16LT/775pU2KCCGBtsChv7FtnwRmxEXRDEdPwhbH
         jkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s2N13FmOEYQNpt6BncLBbaLCyj4beMEaWW0ResefSLU=;
        b=sZv8LED6zpmRFVgKP6HBUpZOzgwwdI80YUDg1kzGKbtZfgkNorlmkbE5tn4T+SCLMF
         GZ2D8YsxK9XL0OZghDzxPyk7dMEvaPsV8sIcZLIMdR2lR+Gyjaak1310p9G0n6DUjz0q
         HMUwj/sU9SkGOgM/ay85Gk+SF01S9earZgL7DbqxxhGpbZ9sROwjbav4PcKLEVQ+LZlt
         WMzplr0qF+TgEvjWt2o6qyciuq49XDvIy0LlOYfNo7wHuP4wWjU+N0hStOhVRnRrEan1
         Zq47f9kY+fLatIRVG+O2BV+Ycq3WvvL50/odeTZnGr7rw6fSymoImexXg568ub4Mx6zk
         LsHQ==
X-Gm-Message-State: AOAM532x45PqhbwtVq2xx6FzgZJkFj0S16o+6TREagT8JSpfKmQTvA1x
	CeUHzqiQMrPzMZr1R4fnu44=
X-Google-Smtp-Source: ABdhPJyikWVwet80BXAhvtjDXrRAgcazYpwGuvo/ChrFMpFKJnR81d4QzubW2YP3JIFxkKvtPDNaew==
X-Received: by 2002:ac2:4352:: with SMTP id o18mr28410983lfl.48.1635332209590;
        Wed, 27 Oct 2021 03:56:49 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id a6sm816098lfs.115.2021.10.27.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 03:56:48 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: apw@canonical.com,
	joe@perches.com
Cc: Kari Argillander <kari.argillander@gmail.com>,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: [PATCH v2] checkpatch: Improve CVS revision marker check
Date: Wed, 27 Oct 2021 13:56:36 +0300
Message-Id: <20211027105636.29571-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This check gives false alarms at least in fs/ntfs3/ as there $LogFile is
used quite lot because it is name of file which logs NTFS metadata. This
improves check so it does not false alarm so easily.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
v2:
	- Just improve checking. Thank for Jow Perches for regex.
v1:
Link: lore.kernel.org/ntfs3/20211026231637.3750-1-kari.argillander@gmail.com
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 461d4221e4a4..a45c6274fcb4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4018,7 +4018,7 @@ sub process {
 		}
 
 # check for RCS/CVS revision markers
-		if ($rawline =~ /^\+.*\$(Revision|Log|Id)(?:\$|)/) {
+		if ($rawline =~ /^\+.*\$(?:Revision|Log|Id)(?::.*)?\$/) {
 			WARN("CVS_KEYWORD",
 			     "CVS style keyword markers, these will _not_ be updated\n". $herecurr);
 		}
-- 
2.30.2

