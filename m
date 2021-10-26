Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AD32CA8
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 23:16:50 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 188so1532604ljj.4
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 16:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a6gYg/L6HNljWV7ztbgtErIsUDjL4vvotoGwopXV/dc=;
        b=QOaXM4yTxqbRwoCEUYWgesu0tqS/vkbRxK9hipLoMGdUi8qxpQWSOoENZR2ZZc+HvJ
         7dzfBzDoyfA0bG2RFbYrF5ZDPJwGIQRy9RFotEQCs+qsNNrs/Uw3HDag45ChWD2TdFRC
         df1Ptd1WLYzOSk3rz/HVLkRoRDi1+P9qQJRS0Wtq28JyhyToRHtXpfBvsQkC1ID872cv
         PiIet2VGzEmhwwuIxtL3/VRjeB95a6bdF+zIXpUeS4jAnSVZOeFHZxqvGw1l5U6wcIo7
         uM74/u4IGiFUe13f+E70roE0OoOxtGzHdg9UiQ9+PCQgOtkdt2x2Ih2KZAqciG7RoGUG
         FnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a6gYg/L6HNljWV7ztbgtErIsUDjL4vvotoGwopXV/dc=;
        b=4sTw0CxkUUfnHThHobZe8HCdsAgr+7n2gahNiFRy7/bIfQjfRua5NYX9YQht58p12X
         5jT1qnEVIV/NE93kY/gqT2DwGsuHuOcPaK3o5ATwkt5IscgZ3+/CjWfZsTffp/dA8bFq
         fBAL7jM9STUKrBgh0D0ZhZ/OGivnArfMRaVjaIm3S89M1e0KQRN/gt3uviGSKSlZ0ra9
         xlERvzHdDjDtR//QI+BKD+zdY4mF7j0PowSChspSIhwGRV4YNEviOn3u5Hefz5w5wscb
         jbL3DcocZsQnu5H0jjy+Yp20HzjMol9zqasb6Jla/PSAlyzx4d32AYHdYIImVfSlK7RB
         7zEQ==
X-Gm-Message-State: AOAM531Oj7JtB0aTmAwoZXlr3+853NKc5rLTx8FPK0WsQKhe/k8GIoZW
	AkiqtqWNh7PZKHN1IPMxheg=
X-Google-Smtp-Source: ABdhPJyDblFTuryWLS3iucovhk6KFAMypJB98GedC/QxLhKNjVNHv+vH2CKrCuHiG564LeXsNzCrzw==
X-Received: by 2002:a2e:9ca:: with SMTP id 193mr4557281ljj.83.1635290208768;
        Tue, 26 Oct 2021 16:16:48 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id y5sm2132178ljy.38.2021.10.26.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 16:16:48 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: apw@canonical.com,
	joe@perches.com
Cc: Kari Argillander <kari.argillander@gmail.com>,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: [PATCH] checkpatch: Remove cvs keyword check
Date: Wed, 27 Oct 2021 02:16:37 +0300
Message-Id: <20211026231637.3750-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Time has pass and we do not need these anymore as almost all people are
using git now days. Those who use cvs for kernel development probably
will handle cvs pretty well already so this check is not needed anymore.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---

If someona nack about this can you also help howto fix false alarms in
fs/ntfs3/ by this cvs check. We need to use $Log in comments as it is
real name. I'm also triccered to see these false alarms. I'm not
familier with perl regex syntax and do not really understand what we
are trying to do here. Maybe also because I do not know CVS very well.

I can do patch or someone else can do it. I just want this "problem"
away as it has been sitting my todo list too long.

---
 Documentation/dev-tools/checkpatch.rst | 5 -----
 scripts/checkpatch.pl                  | 6 ------
 2 files changed, 11 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea2d8..08e53ec02f48 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1105,11 +1105,6 @@ Others
     The patch seems to be corrupted or lines are wrapped.
     Please regenerate the patch file before sending it to the maintainer.
 
-  **CVS_KEYWORD**
-    Since linux moved to git, the CVS markers are no longer used.
-    So, CVS style keywords ($Id$, $Revision$, $Log$) should not be
-    added.
-
   **DEFAULT_NO_BREAK**
     switch default case is sometimes written as "default:;".  This can
     cause new cases added below default to be defective.
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 461d4221e4a4..6d65b748ac20 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4017,12 +4017,6 @@ sub process {
 			}
 		}
 
-# check for RCS/CVS revision markers
-		if ($rawline =~ /^\+.*\$(Revision|Log|Id)(?:\$|)/) {
-			WARN("CVS_KEYWORD",
-			     "CVS style keyword markers, these will _not_ be updated\n". $herecurr);
-		}
-
 # check for old HOTPLUG __dev<foo> section markings
 		if ($line =~ /\b(__dev(init|exit)(data|const|))\b/) {
 			WARN("HOTPLUG_SECTION",
-- 
2.25.1

