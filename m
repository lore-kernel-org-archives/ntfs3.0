Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD02D0621
	for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413452; cv=none; b=DjLNzi9vHVT5GjUrqh5JJv0FRtL05+BR+f02y3A9fDUYIeKcTEZ0F/mbJBAfye5aKSZHIZeusUXHRNahmzx1De2bWKWMInQc10K76KCmKWDx80QSu1XN0ToCO82IKsEpF+/Ecn6p4UFtRb+2Dh55VM4E9+dZSCqXQ8VHtw/EqQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413452; c=relaxed/simple;
	bh=v3tNAwBhpBUiFio8okJKatoWKiAA7m7Ju8WjJI9haxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F55/qyau7EBfgaa3NuWjydWrNf7hyCDNmzbL/xkW9M3AvO8cOeCx2yd5/wAgTKa1v1YXkf2jswqOX4U0v6EyJJ+vN2pYNSmtFXVOkiYl1mCD1idjV7nZJOhHdvWyHZshdQYpYCO+WvWvUr+uJVlTultHRmeQHwLOIPDFLJsPkoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=Y+2pR2PN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="Y+2pR2PN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7f6d8fcd0feso134636185a.2
        for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1756413450; x=1757018250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RriXiZVMbDirHcW8G/DnsNKudmZ3VJAyWsZq7K2sfI=;
        b=Y+2pR2PN41x5hopJd+Ms3w/++SNbSsv7nNe6yFn4ksgB4Khh5WGe0D3Mf2tve/f4y2
         mfn1bGjixH1C0AEKTQazhb+v3/ECnF6MHuM7rYttxnGDF4CxmGHl0IOkZrSr54atMBkR
         zUo8jhX3e4eLM/wAjnjj+PfIcWLZkFFklMn8gZkJDh25sPR6JJXH9GFIal2S3IxtUFLA
         P+JLIN2f3ilhXcLTeeUoUkF376FPQRjDSGmkXpFHUjSHFF/jNRbPsp88LBOGADoWeNIB
         dHL06VdEd68aOlVol06MEfjq00y4uSzk6EtT/byx/4Uu37XwkqKyPCOIlY7Kas4HMXkN
         dqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413450; x=1757018250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RriXiZVMbDirHcW8G/DnsNKudmZ3VJAyWsZq7K2sfI=;
        b=mjjXlBpo/Yb/gxGblmcJjYyUcl15eOTEMSCMkIEGH+/RlxeBFAr7mw3FUkNLZTd1s7
         5bJJLc7F0hmyHDysHLBg8ctQAajnSf/hcpsc47pJ9wD+NbjBLjTV1FcuAOcsbAUQLECt
         JjVogvuyE2tYi0ctKt179dcNtJjpq6OtfsHwRfOEVBzoz55kU/Dp/7cs5VBTo3wWrLsp
         yZkukRPMCOdP2eb61wQjGT1xeu2PxdK+y0HzgrUEfgcZUvut6Ni6n78SKMpcLr7fSi1I
         ibQlmdbZmDOaQbg2EybNcCpYL6qbbU4nQgw2BSHcL8EMfFZ778MALk+5tDSJkoFPesXI
         FcOw==
X-Gm-Message-State: AOJu0YymSC1A1xX2SQkvn+7ghLyz1UJ24QUluXSR5ZOZAHGzjCzskltF
	O2M2nbT6oIQ1Suyrdhm23FddTBExErhhN1ELTPKb3cY1nIObpfByj7WVX2hV2NNVnV0=
X-Gm-Gg: ASbGnctN73+0q9YbXyOXJUHQ2dcnKUURsO9ZjN5/bzxIEbRTVNE6t10d+ZZsfP6AEcP
	0RvFj9R3hMfUy1vb5BiBduqp3s6+//cLUnWnBwbBLd3mbu1GsXtGkauiSfjyqC4Xrx0fv6pPa9B
	O/qv/y/18DndLqyEjJvIYvB+MFWFdrE2PowrwkpizBzn6e3kg8TTsTG/Ij0FmF8n71bYYh26iMS
	PMq/YXJ0yaiFOZed7Dx7/R7F9x2aiBkXqJ0r8oxP4nVJS9LCLJgmcF8VdCIUczP/fCHnpgbMc7o
	ur8v1k/0jr7hPzONVFzglcdZYqspIRMaBlXF+p1wzvcXX1/EQRsTawZF1A7WyLN/iAwOmzg68O/
	qY7zzuk7mE1bPpJgl3oCfTS2qV5KE58dsGWGV1w==
X-Google-Smtp-Source: AGHT+IEjz8KP1dIJYFfgk9q1HARMOkHqV+Dlmyl+MAWJJuPIjW/g3EPR5yAAe9oscuHjVmxXLnELLQ==
X-Received: by 2002:a05:620a:2590:b0:7e9:e676:2162 with SMTP id af79cd13be357-7ea10f7232bmr3147260585a.13.1756413450043;
        Thu, 28 Aug 2025 13:37:30 -0700 (PDT)
Received: from ethanf.zetier.com ([65.222.209.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc153de18asm45879585a.54.2025.08.28.13.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 13:37:29 -0700 (PDT)
From: Ethan Ferguson <ethan.ferguson@zetier.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: [PATCH 2/3] ntfs3: add FS_IOC_GETFSLABEL ioctl
Date: Thu, 28 Aug 2025 16:37:15 -0400
Message-Id: <20250828203716.468564-3-ethan.ferguson@zetier.com>
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

Add support for the FS_IOC_GETFSLABEL ioctl.

Signed-off-by: Ethan Ferguson <ethan.ferguson@zetier.com>

---
 fs/ntfs3/file.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index c1ece707b195..0a1e9f16ffaf 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -49,6 +49,14 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 	return 0;
 }
 
+static int ntfs_ioctl_get_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
+{
+	if (copy_to_user(buf, sbi->volume.label, FSLABEL_MAX))
+		return -EFAULT;
+
+	return 0;
+}
+
 /*
  * ntfs_ioctl - file_operations::unlocked_ioctl
  */
@@ -64,6 +72,8 @@ long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
 	switch (cmd) {
 	case FITRIM:
 		return ntfs_ioctl_fitrim(sbi, arg);
+	case FS_IOC_GETFSLABEL:
+		return ntfs_ioctl_get_volume_label(sbi, (u8 __user *)arg);
 	}
 	return -ENOTTY; /* Inappropriate ioctl for device. */
 }
-- 
2.34.1

