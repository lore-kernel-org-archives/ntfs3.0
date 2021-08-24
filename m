Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744029CA
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 18:37:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id g13so47429349lfj.12
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hUkG3xr/dMt/8zI98k75vhyv50SLMYA7N1BDb0m4ctg=;
        b=hcp5pLtAOovIB3GujgCAwVZ1xEnCaTwVJZn/SkMdDESmxQBFocjHffQae3ojrqGcPw
         SGXVOXws20bN0r3xbs7NfpSQsFM/KM0NqAXl8M7oKPUfhdRiS5RoZs3P6JS4UKArQunn
         YPdHNSr/1xEO2pGARWBZxQpU84KDhtIavmVhJXAh9qvRl9A95lLI5im52d4sX3bOI2l8
         72NZa9aAmv4LAKdQLuy2jc1xXaxuQ9F6JoQCbqVrejO7aTMjLPaAdh3XD5FCDgpPY/Zl
         NX9DgMNKAbbbQPRF2ij700FZxaVwxLgv+qtg8s+szXtiXjBIgYllT+SsbqaNLc8KNOBV
         zE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hUkG3xr/dMt/8zI98k75vhyv50SLMYA7N1BDb0m4ctg=;
        b=Ox4/fewxqZ8h1tQa61tyTU/XIzdY8FoHZ/e1RZP58WM9iMU8IqXqnjeE0L0QFFU2GK
         WfCJ4Ygg/hPj57wJh/v9OBqNjJHnW+DbrnBb/PmAGtFJ+TALySbptgvSV5CBH5IU95h0
         Q30mbMsIlpMorDt8ZHpKZ4SI/eVFcbBc1JB41rrC7TscUs/6N6d0Gcrr1AKAatp0EK7H
         Go46jfqogr3yVrifaPt9ieBIn9VXFWDlWWg2FMUXcsZL0bpApxNFSsVYuwgSgJ5jlQ7k
         k808UeMj5fKkHktQ6+uLanmAoJEE9XU4OgC1fyYu8K6KNLSl+ZhdM6GKIui/1J7kZpXE
         hmvw==
X-Gm-Message-State: AOAM530WZAhteoegLIk2nLxo5REA2XjToo+fPgRdhwdQ+ZXH22GcPlfU
	AKlhVdeoDBOcEYQs9zXQp8Y=
X-Google-Smtp-Source: ABdhPJzXhOKJZPwAVsi9vxhpDDwEKS1xbHj1fQb3JS9IV+Dn+VVF3m9PaZRkLIM3OoCcJy+dToqRIg==
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr29708927lfb.476.1629830238207;
        Tue, 24 Aug 2021 11:37:18 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id k13sm1826378lfm.168.2021.08.24.11.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:37:17 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v4 1/3] fs/ntfs3: Restyle comment block in ni_parse_reparse()
Date: Tue, 24 Aug 2021 21:37:06 +0300
Message-Id: <20210824183708.1008538-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824183708.1008538-1-kari.argillander@gmail.com>
References: <20210824183708.1008538-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First of this fix one none utf8 char in this comment block. Maybe
this happened because error in filesystem ;)

Also this block was hard to read because long lines so make it max 80
long. And while we doing this stuff make little better grammer.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/frecord.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index c3121bf9c62f..e94d830b2f4a 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1782,14 +1782,18 @@ enum REPARSE_SIGN ni_parse_reparse(struct ntfs_inode *ni, struct ATTRIB *attr,
 		break;
 	case IO_REPARSE_TAG_COMPRESS:
 		/*
-		 * WOF - Windows Overlay Filter - used to compress files with lzx/xpress
-		 * Unlike native NTFS file compression, the Windows Overlay Filter supports
-		 * only read operations. This means that it doesn’t need to sector-align each
-		 * compressed chunk, so the compressed data can be packed more tightly together.
-		 * If you open the file for writing, the Windows Overlay Filter just decompresses
+		 * WOF - Windows Overlay Filter - Used to compress files with
+		 * LZX/Xpress.
+		 *
+		 * Unlike native NTFS file compression, the Windows
+		 * Overlay Filter supports only read operations. This means
+		 * that it doesn't need to sector-align each compressed chunk,
+		 * so the compressed data can be packed more tightly together.
+		 * If you open the file for writing, the WOF just decompresses
 		 * the entire file, turning it back into a plain file.
 		 *
-		 * ntfs3 driver decompresses the entire file only on write or change size requests
+		 * Ntfs3 driver decompresses the entire file only on write or
+		 * change size requests.
 		 */
 
 		cmpr = &rp->CompressReparseBuffer;
-- 
2.25.1

