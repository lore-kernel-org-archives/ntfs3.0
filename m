Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99E2D1319
	for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413454; cv=none; b=GaiMOVZQaFfgXGWV65bLoA0RHQPQR+2zFiic9orA17D7lrtgI7p7x6voXMhCKiFltQbV2tUeryaXXAp4K3onyboSEirSyzTgbrRGZIUmobG+BpMT9cEwJeAKdi2TdYmleBzvjRFOc/GYjj23hyw7KYL6w9o0gHhXiXBX4hUx21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413454; c=relaxed/simple;
	bh=oRP2p2pJOga67cG+m/f+zcP4uYDeO+yZ3lN6tYQQkXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qiW/MP2FOjr3AF7ff22V5wTlqljxMKmoS0HAz5jOeWjlT66sJMJ/NRVym+L0GWNl+JNUmJycVY1nn+q+X6GY0mGacBIGAJmloZBRm4MzPUy5v8wL3OYhDdzyY5oGI/8/DFCjeQhN1l4WC1iWY+KytL1vEqgcTxrk0mKBf67/JD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=HnaBeG63; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="HnaBeG63"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e870689dedso94598185a.3
        for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1756413452; x=1757018252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOMMLFiaOAz+64Gs7xjJhrQIlkJjOe3bWicWl5TD5n4=;
        b=HnaBeG63uuwRCWjDl+UJlBlj18Qbpe4Fll28N+es/fQEicDdeIPy/G2hrhqDtUDfnH
         js2df1NFYRqCqErM6TmvQRzOkVpSfmaFEbo+24YozZ1IyvaHOgiPU4ChFQ2tU5gI4MqQ
         QhOAdHMuTsMlSnKueCSvgIzTB0cSoG775WJUQGzX6k+fbz/EaAbF8vWEhrDKokUfrAW2
         qg7+ufxVbgtIbm9snmn2gmQPx4gftI/JlhsAVtrCClFjHTqBWVJl43Hf5hYuBO59MLwW
         lhFMeDnloFqFxNgHVf3XN2AVReQ2LZO2/DbU5/8R4UaX/84WoiAXFqiaQxezskydcl0/
         Ebkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413452; x=1757018252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOMMLFiaOAz+64Gs7xjJhrQIlkJjOe3bWicWl5TD5n4=;
        b=DfKx0HQTKY6RNXe3ihNMKn3h1XyD9e5OS02ddVAA0Aba/Iu683HQOUC0YsqHHmxFmS
         Cc862qu09ZFoAP+7URSH7n9o1QrViDgDq4YsxTBYwKVecn850lJ8gheWBkn0uQVRkKQO
         vullvd7SWPkEuFSstr5Y0IdJH/VpcN9xc4eYaUg6EVKUAouJTh30xAaiVq/AL5uwEww5
         jrjW5Ytyjju2t0GZbsvUXD6daw/mxMH3EMg1L5dGeTjG9KvO39kVv0cgK/LUGr64GXdC
         xaY8Juam1n68jyrfNRhMqBV5376gENwnLN4G9KKyRWslX6eehlLSQiVPNjdfsFTHzRA3
         t6iw==
X-Gm-Message-State: AOJu0Yy9gGqO2lRSaCfQ1iAnBdLaTA2G+ssubQq6Eyh/huKxIY63bQEM
	O2JHt+7io62vGRuZrhWo1nQgg3NRkTkURIhkPHAeMYzPn2PkkIHf6hXXFwE4UOZ1rkY=
X-Gm-Gg: ASbGncvUmDeAQg+zjKB+sx34+UOad6TiB7FxLPpR9l2H/b8KwROXCGN8rbxGth2v+Ry
	PpbQO4wZOgABE+W2G4/PxCqYv9FZTbrVhuxsYurFVJKBA4v7tlOYhc7ua9pAhjjJUFDhbo4ZhE7
	ywWRigCKyoRgCKdcRDU2TwdctUAcXEkux5kd4HuVmMZfZhHXUjBxQRRHUIx0nwqcbmrHo64xwgz
	HwvN3/cgrrgkBzq5TbixQCwiXhuC4uQmxNV4V3CJhYQhxqZi2oL2bWV2f/+9ZLtwGgeME+Hsi/L
	trygelhkNzm3HVvw+AEs9n8prahm9KodqG/QjcbKJ2aED/jmJNHLgpxfq+RNY1sHe+9uqp52GEk
	8Hefq63WlzsHqt1ufWPDCRjAkUn26yhSkyvvRAA==
X-Google-Smtp-Source: AGHT+IEuSR941eoZ1jOjsoOEgYz1hR0QFvD7yeN/R81eIk6+aXmjbxztfihWFemM+y/f9Vu5CUyggw==
X-Received: by 2002:a05:620a:1a98:b0:7e9:fdca:1296 with SMTP id af79cd13be357-7ea10f74696mr2973451385a.13.1756413451848;
        Thu, 28 Aug 2025 13:37:31 -0700 (PDT)
Received: from ethanf.zetier.com ([65.222.209.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc153de18asm45879585a.54.2025.08.28.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 13:37:31 -0700 (PDT)
From: Ethan Ferguson <ethan.ferguson@zetier.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: [PATCH 3/3] ntfs3: add FS_IOC_SETFSLABEL ioctl
Date: Thu, 28 Aug 2025 16:37:16 -0400
Message-Id: <20250828203716.468564-4-ethan.ferguson@zetier.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828203716.468564-1-ethan.ferguson@zetier.com>
References: <20250828203716.468564-1-ethan.ferguson@zetier.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the FS_IOC_SETFSLABEL ioctl.

Signed-off-by: Ethan Ferguson <ethan.ferguson@zetier.com>

---
 fs/ntfs3/file.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 0a1e9f16ffaf..4c90ec2fa2ea 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -57,6 +57,22 @@ static int ntfs_ioctl_get_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
 	return 0;
 }
 
+static int ntfs_ioctl_set_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
+{
+	u8 user[FSLABEL_MAX] = {0};
+	int len;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (copy_from_user(user, buf, FSLABEL_MAX))
+		return -EFAULT;
+
+	len = strnlen(user, FSLABEL_MAX);
+
+	return ntfs_set_label(sbi, user, len);
+}
+
 /*
  * ntfs_ioctl - file_operations::unlocked_ioctl
  */
@@ -74,6 +90,8 @@ long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
 		return ntfs_ioctl_fitrim(sbi, arg);
 	case FS_IOC_GETFSLABEL:
 		return ntfs_ioctl_get_volume_label(sbi, (u8 __user *)arg);
+	case FS_IOC_SETFSLABEL:
+		return ntfs_ioctl_set_volume_label(sbi, (u8 __user *)arg);
 	}
 	return -ENOTTY; /* Inappropriate ioctl for device. */
 }
-- 
2.34.1

