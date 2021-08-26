Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CAB72
	for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 08:36:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bq28so5125611lfb.7
        for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOVmDtgV07MxR0ve6Zn2DEYBTC5oECP7BrAEQqsJwb0=;
        b=lZzksODnRxRDYImF3JeKxu1709B21pfaMBhqgWKl4TOtzRcwcgmuGRNa/XKd8VGwL/
         DLIAe9kvBDtOSlrZ+K/0S/W7QSxDDOympLZNcdDFy9cB4kryvb/FwA/KktgITMLMI3VB
         31wwuBfVdYmO0eWbS4FtHMUnr97FOpwTaf3WA+uTBS2HlGdpYQNWqn9GIaCGmuc9Rb2z
         fQ07IyIxYe6R4uJfhxj9YJUcFHm5haPQVMHy2a4KeERkwtiFMSQr9KpUo0jPNIpjCex4
         IKlQgDPukWjoi7gWwYQLeye2U3sLY8wPWPrvJ+TDP/v4ogQMK9D5SBmClkui6N5/EdVU
         Q7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOVmDtgV07MxR0ve6Zn2DEYBTC5oECP7BrAEQqsJwb0=;
        b=JrTd35GHul+9eZe5X+/9gnt/Bv6APiuU9CGgiAg2mB/0gJjH7h+eug63AmoMd8cYht
         Oy97XILpuQ8FqNkEOrcqaO0z+r3jN8n8giJkNLQbs1QQqWigHAXm/d7wWX3gGG9mzunK
         0xqmLNB+5x5Bbcp7WRGPbrDAIeVYQ/RFBjcScG3XrQzeyRDOkFNK/lZQ+RteVRLOG6El
         Rr1USK8esS4LA6o9utwBN2iD41MdErsB9Zk4+uEuYp3WPOjyKnxE4tJtr4p9JqkIdflo
         HrmStJMPIj5pRSj88oyOxMjzXEdxfdNEKdwdbhMtOTmY7zGJyXOFv3Mqnr60Mz/drvF8
         7akw==
X-Gm-Message-State: AOAM531S3mHGWSZbg3/ulbPXnay50hru5TJ8DTpoVK9SD4y8UJHtswKr
	Mev0c4mXydJ8I8D2vw5a51Y=
X-Google-Smtp-Source: ABdhPJwj5Dyyc+BRGKfwKkXZK81haLb+viOeICgbrn/vJ7wiI4019ywPnTHpsKIQa22aaYLB1N4/8Q==
X-Received: by 2002:a05:6512:3688:: with SMTP id d8mr1855960lfs.356.1629966958594;
        Thu, 26 Aug 2021 01:35:58 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id bp25sm251936lfb.51.2021.08.26.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 01:35:57 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>
Subject: [PATCH 0/2] fs/ntfs3: Fix minor things in ntfs_get_acl_ex()
Date: Thu, 26 Aug 2021 11:35:47 +0300
Message-Id: <20210826083549.1565173-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First patch fix Smatch warning.

Second one add missing default path. This is not necessarylly needed,
but will not make any harm and other filesystems have it and it is also
checked some places in ntfs3. So let's be consistent.

Kari Argillander (2):
  fs/ntfs3: Fix pass zero to ERR_PTR() in ntfs_get_acl_ex
  fs/ntfs3: Fix missing type checking in ntfs_get_acl_ex

 fs/ntfs3/xattr.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.25.1

