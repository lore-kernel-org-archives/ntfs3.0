Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCC3FC8
	for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 17:01:17 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id m3so334569lfu.2
        for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WkliQtuiB7gvGpUed1TYW2cuQJQCTGKxOOGy0fW2hRk=;
        b=WbOckG2skYZuQKXj+ZAjrYV7deYygJ/bpLQKvThd0tPoDGHuyHvFFDYrbDftUvObHH
         O0okqjuCgOAk165AorGHrwfcXmWaGNt9K9ndgbUaCMlygpyNO1abhzxl6dreVnl1vL2i
         vraLDIIkNsB2mgFUUK0R18SKvJsH6TPmM8ro+XXPtgD+4z3FWMyWbD1sWuFcB3RJJKoc
         7VSQkcECcadKjXO5xfdzDrdyDuGoGjKO7oeZWG0ywucxIoFndSF1GPbD0rD9RK1bhSJT
         PEB0qrCdsLTExfDsNbmbaZlngKF9sCTVQiuN+d481RBJwyk3wrzq5hMI3aAjMYWnL/Ls
         cacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WkliQtuiB7gvGpUed1TYW2cuQJQCTGKxOOGy0fW2hRk=;
        b=V/tSrNhBR/1r6FR5vK6vQMh3d6UYUGtp2yR8A2qeY2uwel28hXvMrc60RpNUxt60cl
         rJ4VpQh5RPNvNZU0nysfc6QR+RG1UGUtPuonWQmL2i6t5YPaD49T31sQ0MyQV1o3BkZr
         KMCs2asY+rzSGb61JxTcaUv491mb7R6dLaerxZFg+IRH48ueZVQZe/2q/07yzGrk3pZS
         KGt0eXPnE1SeV+Www/W4wPtqygz/8Sy4rGlKi8UGfydpK4yWt3wAUxwJy+uIqMpIdFQz
         pLY/9txQJiqaoI7ZpUO4p4S9EvH0vBmY36TU2FYnPvfsMd6dHajsrkrRxn9l0IXao8QM
         TWqA==
X-Gm-Message-State: AOAM5331ClH8GdguVoipK2givVTeCnwwuS236amqps/8XFQ+rdHZuW24
	M45NVslxtQnaMoCHzS7RLtw=
X-Google-Smtp-Source: ABdhPJzrJZKyUtD/n4mB5S/SLyhOR8MN/nGmg3MWJXyWm7D1ECqQK9A8AuUtiyBIRU5UbqiXYQ9H9w==
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr24704180lfp.685.1632243674060;
        Tue, 21 Sep 2021 10:01:14 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id v26sm1718430ljv.77.2021.09.21.10.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:01:13 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH] fs/ntfs3: Remove deprecated mount options nls
Date: Tue, 21 Sep 2021 20:00:53 +0300
Message-Id: <20210921170053.48676-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some discussion has been spoken that this deprecated mount options
should be removed before 5.15 lands. This driver is not never seen day
light so it was decided that nls mount option has to be removed. We have
always possibility to add this if needed.

One possible need is example if current ntfs driver will be taken out of
kernel and ntfs3 needs to support mount options what it has.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
Patch is compile and checkpatch tested.
---
 fs/ntfs3/super.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 6a535b144ff9..66a3d02a5e14 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -246,11 +246,6 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("prealloc",		Opt_prealloc),
 	fsparam_flag_no("acsrules",		Opt_noacsrules),
 	fsparam_string("iocharset",		Opt_iocharset),
-
-	__fsparam(fs_param_is_string,
-		  "nls", Opt_iocharset,
-		  fs_param_deprecated, NULL),
-	{}
 };
 
 /*

base-commit: 6354467245ff8dd04b54e39790f2ee4d21d5419e
-- 
2.25.1

