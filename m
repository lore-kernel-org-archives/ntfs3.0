Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC42F349CE0
	for <ntfs3@lists.linux.dev>; Thu,  9 Jul 2026 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634706; cv=none; b=dnaELQ2EDSsP8SMg6d5D6Ahw/N6/nFXUmRCDoE3ZKE7gxp46awQIQxu1Rf/Q2+ssUolgrnlbMZKJfApuV73DKH39sPO26c05QmrWCK5jKGMX1/8ZgRF26mNEOEJJgNzuZITHsGEKkbPTbfn/yY0NkT/JXYbCcIt7yRplk/ssLjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634706; c=relaxed/simple;
	bh=GWzCqgBdnzrCXDuGs1zCJaaPEipz38yup9Q20fHT26o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8rTzh0zGtzSkAN+kw9ILxchyE+AuS51Mpm1fZbYWY0rO8uAxJGKipkdlD3dn7ycxQjKz2xCWQEk5bSGRt2xIwXQrQLNQbPNNWqTaRmbOu8nkDsQ69YTQsUiQ6bJmy00zy6JAtlDa3IQkvIxJ+VoydjJ0PaDGt1jl5uGFSIBqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=tEoHvnVO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="tEoHvnVO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso222911a12.0
        for <ntfs3@lists.linux.dev>; Thu, 09 Jul 2026 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783634704; x=1784239504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rb6RDuAYsdeez60Ddc+s7DNRi0KrVtOV9l66vIIUTlg=;
        b=tEoHvnVOTXb6ROiCSEWRdXPE6TnraIvtcHPFM8J5ZIW+aaAGbE7l02AKtU93lETjCP
         JCijqhcIrnwtfEbgwvQvTATHaQjwq7ZK6jajswEFZKSZUJ1eivcQ8Khn3dAjdIKgpKVt
         z6as3saYxMq9F3LsaOUlbkSKwhmoXUKfQmw/fQs9QJ1QL5rcx320XmgYsL7OrKUtF+jB
         Fa2hJAd9n6OMv7zwa+wNNoagxi8m+l2+DcdBJOuuDwBL4NHF2CoxZyg0UVMO2CiWjbUH
         VCHul/0V/uprsprWWuKRkDO93Ql8DpmvxH+S7ff3/ElU1DxqYM3Fyy/qO/ByxiYPcWQD
         ifDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634704; x=1784239504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rb6RDuAYsdeez60Ddc+s7DNRi0KrVtOV9l66vIIUTlg=;
        b=hoZSXbD0WICNAQrF8+RukypM0QAZPkzc3xe6qUz1MpHW+XUw/h0C5I6rH8b6zfBuvp
         2mydLi0Q8SkjzrQTLUqpbWpu8bRjrMCYpZKTLztAj+vgmOVrWfG8HW3kKTG0/IfiDpx9
         Qxwl08U3dWrUFtnmGcHoLrPwytn2fgZwdlEG+0Hg8KL3UyfuFudnzZ0thC6ui6fdDpHO
         ISwcNvSNxPDrqQ7qX03IyIpYdWQNF8E0PMBG1KScTJYD+csaeLRsUQz+7mSf5m6RSrBB
         2xxqYJ5MhZM0+mZ4UqocP+O2CUhau/zUapYpQLTIV3S/dBOayMHcybxO1L1WdBH2kGYo
         prjg==
X-Gm-Message-State: AOJu0YxuQLosjMFek9BHJEnfRBrDZV/gJ+wkG6TALbbbSOcIT64H4cdv
	1/Jxr/Jwk6qjSNgR5iUZFDxDTH+ma2xfz9r4YV1kAGyeGsUpe5PP0xK9AfSmVQpyQQ==
X-Gm-Gg: AfdE7cksuVXx9mz7wDy7wY0/VTCDLZFJaM8VUwv11FDHhkmZt1bl52GE8ca9SE8AGpD
	fjIS8nqSpL+Vi2ms7bzK7V7DmhrfHT4rHTSknP3jMKk7gYEbQZVG03PyK5UCDs1a7d+rmJmwCl+
	Wl6ZOJ8/Jl78gGzHIRdSg6Ak2xVUzEc89T8o98tXTbajLbX9xOUQy9p9fC1MqzjNP7kZwDnHzwu
	NodUJIDGpNkC5PgP6z80cDQcMiM6McUxzNA04E4FcPwZHo5CML6DiD/mXM3Ya0O+qEXJZogyMLN
	hjLPIlaJhu2BmERuZopRw5mGNiYpScQYmuPZ1llROCyT9hGYsQpM212V0Khm+97vXeZFPOXT2QI
	FIdYRL7Zmm3HTOge/8l6dCHGoZ/vrVVFrJG1ZL2ap9Ta5xs8M8yRJRWuCGkV1wRSh3RDCB6c+p9
	Z2ePIDG4DySuPq8e9qUQ==
X-Received: by 2002:a05:6a20:918e:b0:3b4:731e:6f95 with SMTP id adf61e73a8af0-3c0bd206d33mr9703927637.39.1783634704083;
        Thu, 09 Jul 2026 15:05:04 -0700 (PDT)
Received: from xiang.tailc0aff1.ts.net ([20.171.14.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm57229945c88.14.2026.07.09.15.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:05:03 -0700 (PDT)
From: "Xiang Mei (Microsoft)" <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	"Xiang Mei (Microsoft)" <xmei5@asu.edu>
Subject: [PATCH ntfs] fs/ntfs3: fix slab-out-of-bounds write in attr_insert_range()
Date: Thu,  9 Jul 2026 22:05:01 +0000
Message-ID: <20260709220501.395659-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When fallocate(FALLOC_FL_INSERT_RANGE) grows a still-resident ntfs3
attribute, attr_insert_range() shifts the inline data using the insert
length 'bytes' as both the destination offset and the copy size:

  memmove(data + bytes, data, bytes);

Both are wrong: the shift must start at the insertion point 'vbo' and
move only the data past it (data_size - vbo). When bytes > data_size the
memmove runs off the end of the data_size + bytes buffer and overflows
the adjacent slab object.

Since vbo < data_size is already enforced above, the reworked offsets stay
within the data_size + bytes buffer and cannot under/overflow.

  BUG: KASAN: slab-out-of-bounds in attr_insert_range (fs/ntfs3/attrib.c:2581)
  Write of size 512 at addr ffff8880135e8b10 by task exploit/142
   ...
   __asan_memmove (mm/kasan/shadow.c:95)
   attr_insert_range (fs/ntfs3/attrib.c:2581)
   ntfs_fallocate (fs/ntfs3/file.c:618)
   vfs_fallocate (fs/open.c:338)
   __x64_sys_fallocate (fs/open.c:362)
   ...

Fixes: 9256ec35359f ("fs/ntfs3: Refactoring attr_insert_range to restore after errors")
Reported-by: AutonomousCodeSecurity@microsoft.com
Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
---
 fs/ntfs3/attrib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index c621a4c582f9..a9a2c2104fd6 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -2578,8 +2578,8 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 			char *data = Add2Ptr(attr_b,
 					     le16_to_cpu(attr_b->res.data_off));
 
-			memmove(data + bytes, data, bytes);
-			memset(data, 0, bytes);
+			memmove(data + vbo + bytes, data + vbo, data_size - vbo);
+			memset(data + vbo, 0, bytes);
 			goto done;
 		}
 
-- 
2.43.0

