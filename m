Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DCF30D3FA
	for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 13:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479490; cv=none; b=EARFFlxDSaEfb/Zg93QHOifW1xojXkN6Sh60eE1gUwjR9kya6mH+Ex5PWRZ+oalM6ajEcXpxzEdU2aJuu+GBNK7JA90KNd04uAt8yTtasSFQvQioFan94Mc6KXVd3KU4Ix9sOQ2K8RfusVG3/kk09vyKdYuNhSQfpyLlCxcAzsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479490; c=relaxed/simple;
	bh=lJ+OBwpSmNxu05yOr9PmGJPJWDTMt0GEFw3mqTdUhs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXYzCCwh292lsCG9mRZp+3UFf+p+km/y0Ks9fSWb7JCc4c+5Z23O/xClWccXp2QNjeaUBxphFsAphGkRKCOAJ54Br1sYK4xICfA2Jw8pEZ2UXUKX7WWRM6mqKB/0/SeDwTOLXM7ajMB0bVWogJMuBPylIpuQTRSB2dWHaa5yJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV8uFVy+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV8uFVy+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84536e2857eso434666b3a.0
        for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782479489; x=1783084289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjcfW/YArfhSkjN/lzs+Iq6KU+eSjbr3oJOOoEG0Y+s=;
        b=MV8uFVy+bLL+VPEmviAQWajUO3MmPLSeY1daezndF9V1SngUniY//S1fqfuonKrIQo
         fbPnhlm2lEzdUxbRE/RDF/7mN3fv+/eRpCz31lyI+DmaGQuw2d0bOAHjkLRrpbhtZTzB
         FUVPnJDQ3fWtETKGfZtcdGx4r0ZLQtrTKsNBj8s5KOjrR+i8U4U3PrU4Xvl51Gv+xrTG
         h9ecCNgrD7CYi6wtlYwqihPqxTsGVeDN+HoK//q4ROhwZi3JRK65FJfWC++k4rASPu9u
         zzQG8N77v/40Rg+dumO/OFIoSfgfSK7hIvnjpr4hZgq2WsGQ5E8rfcEM1r9cGnMsBzcy
         sHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479489; x=1783084289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjcfW/YArfhSkjN/lzs+Iq6KU+eSjbr3oJOOoEG0Y+s=;
        b=COcksnTrSj6gn0EkcG475ZNdCO2yh24TFI7oSnRBArgFjb/21l9mclIvOfgUM/Q4WU
         KwTlY5tdpR3Wut/w4I/8rW7+uMD1ps4WeyTeE1ObA3KoGVtFMWGpC4lMywbMIM8yMVNG
         YtC6E9k/0LmmgU8eQPLg3B42a1GqV1UA3dlfFsH1Jj/9wOFNm+QQfLK+F5N6qq/KIOyB
         9zMHHKRHicWBSmlMqfz63try9Cib7R18ddPMO1woj8W/vFVGtqR3UUcq2pDKNrqYo0aF
         dwDhODYbT+Lzb3nF+tuJH8cg4gma/XEtWbuBAEx+PwGUK8a1d9radZH/dC+PdAe65Ewq
         YfIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T/qtgWDM3hqZI5Th/RBXEKwkFHqIYm3UeZPbi70jfja09KCgOD61Df3esW9wrCLtBzJvWvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE818gjM3MGXYRbx6AD/zIe3nI1XxYRCr8lA6UwhYDwYmcmWf1
	Pwy+QdhOblkVg5HyZ/KUPmiIIHFrJcQoNivfgAMUiCv+/HNjjIZQGNxJ
X-Gm-Gg: AfdE7ckO7gNmIvh+K6nVFIeOGpCIoUnWXZbG9N3jqe3KWd26GcxjlIYHZlQmnxMiinA
	HLHqFjaHc0M54a80Uefo4ZlNEqEl0sNSspoI64ju/UNlwfWyt1El3ZPC9QwnESljMEDrr50twM8
	XiQHAYEf1xlCJKgYYv+AF4ECirzpqL0x6Byx+SY2UeyWMQPcTUCZIXh9pmDsf2qLChdSzavukd5
	HRy597r3+nredGufmFA3ntoH72Oe3jjrXyatLKHeKZwD/onMCWDjoSLR9S9f7v89nHuTpLJ6cRh
	VucqirvkNTIxD3A8MMiVrTttBilTBKyPq5NHjFBaUQQFnH/5tP+1nFqO2WbCURP1Nimg08epOcE
	dBr4IeTq4daK3Q+kQNXBn1mDhXlH0L1D7IZNAnZaqOfzaAwl1vSteU7/SZmSrXSBhpnssjIRp0G
	B9fpI0PMWok3lqbIdHrDofXfGTUUbaTVKT20nJvFsXlg6+RcuCDcFl1nZKWhD0pHFjkuo4b30C
X-Received: by 2002:a05:6a00:22d4:b0:845:4679:4a3 with SMTP id d2e1a72fcca58-845b3aed31emr7700824b3a.19.1782479488475;
        Fri, 26 Jun 2026 06:11:28 -0700 (PDT)
Received: from localhost.localdomain (211-20-143-81.hinet-ip.hinet.net. [211.20.143.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm7104461b3a.29.2026.06.26.06.11.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 06:11:28 -0700 (PDT)
From: hewei-gikaku <skyexpoc@gmail.com>
To: Weiming Shi <bestswngs@gmail.com>
Cc: Xiang Mei <xmei5@asu.edu>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: fix out-of-bounds write in ni_create_attr_list()
Date: Fri, 26 Jun 2026 22:11:22 +0900
Message-ID: <20260626131122.1341-1-skyexpoc@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624053008.4885-2-xmei5@asu.edu>
References: <20260624053008.4885-2-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Weiming, Xiang,

I posted a fix for this exact ni_create_attr_list() out-of-bounds write
two weeks before this patch, to the same list and CC'ing the same
maintainer:

  v1 (2026-06-10): https://lore.kernel.org/all/20260610002929.51765-1-skyexpoc@gmail.com/
  v2 (2026-06-25): https://lore.kernel.org/all/20260625031932.9412-1-skyexpoc@gmail.com/

Same root cause, same Fixes: tag.  The two patches differ in how they fix
it, and the difference matters:

  - This patch keeps the fixed al_aligned(record_size) buffer and returns
    -EINVAL as soon as an entry would cross the buffer end.  Because each
    ATTR_LIST_ENTRY (le_size(0) = 0x20) is larger than the minimum resident
    attribute it represents (SIZEOF_RESIDENT = 0x18), the list can grow past
    a single record_size for a sufficiently full base record, so this can
    fail a normal setxattr/file operation with -EINVAL instead of handling
    it.

  - My v2 computes the exact list size from the attributes first and
    allocates accordingly, closing the overflow without introducing that
    regression.

Given the earlier posting and that v2 fixes the bug without rejecting
otherwise-valid records, I'd suggest taking v2.  I'm happy to rebase it or
adjust to whatever Konstantin prefers.

Thanks,
HE WEI
