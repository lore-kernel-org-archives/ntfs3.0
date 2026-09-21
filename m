Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51A5383992
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018539; cv=none; b=e3ngn+y6l9Cxruk1KTAhKAHR6hAi6jtq07zBTo2rLgm7Q/AIl6dF8CxuMRSlZblxuHGPjXHAsVnuYb3iszUPh0KHCtTGbyrCQXTFVp3P9zTtk9Rbwmtp3uF/LSGkae+SWNu6XXfGaE+hov8Qk/LhMfewwxAph8zLuJxinNCz3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018539; c=relaxed/simple;
	bh=e3sIKtRpbFRf5PL2S0UghV7GT9zAOdrng4XZYq+Guws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfroVYzsb67KZ2ljPwfEjnxyrP048/yOY6nPabvt5ub2et3I5evRIQ7OlXM0ynqM+Y1jOJzTEPQgN078YG+NXRGWjHVubL9yMzWxgujTa8i/IbXA+DIsWzEKhxuWYlb5Rsc4eOOLErVe+Jiam42WqCPmyrfKztnL6mFVJnAfv1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=F7oFrIuv; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="F7oFrIuv"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6a9dfe4dfc0so4983670a12.0
        for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018533; x=1790623333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bk7JZc4hNA76VOHfcQArIGuYp8mR4aUxSNBec+E39o=;
        b=F7oFrIuvVr5VyyKMEGEJQbWUNybBZ6EJfa1Gd3IC4ksmU/X3eQynZ3+xD14+YCx2oB
         wf5T0/FXvOvS3MFNyXvc7eVAZhwvIdPAs1TZXSpxD5PRHV7wH/tAruWrQBb8RxR36i5x
         94z5UamwbEUXz/vDH35rrOhvi0ljF/E0m4v+3/cNnSndGIHo0npKgxS9aNDqO7H2H+1e
         3ldawcKxyx6E2/SzfM9dSxgVINIilGuP3k9PMozx8TCTP/HfczbUi+m5idkr6yQsRN3s
         yI8+4jajBnxlZoCRnHJBXjYeDGGfURqjw8ISh3C0646Htm2q9+ZhCDzLrdyliG5PNxkl
         iLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018533; x=1790623333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bk7JZc4hNA76VOHfcQArIGuYp8mR4aUxSNBec+E39o=;
        b=EIFxMezWfseSY4OvX02s/07grBVFHeC2bbHqMhJLR9jT/V6dUoe7mMTkKfK1uB7Qf0
         E22VjLElebC9Sh69n/GNei2hqntz3ObqWrBFws0azJNDjYkdm0xbD6SISuL92HKjSwnR
         4qRQVwjiAoEKFY8dLKF6rj+mjBPLOLtsLbHyynkeQ1a8WXodQeGL9NazCorquNgLesKh
         7lus6Zv7xb/5Vm0TMDhzx/CKSGUvp6MWuKVbq+3fUJUDJzKeabCzoR9z6oUugEadwKVp
         QyUyKbg72g/vu2AgpbGtnAGcTdcFqbxhrGr0s92v2JZjuwB8tJ8deDlDcG92oFVOUK2d
         29Dg==
X-Gm-Message-State: AFuF++m4a/OjKW1r3VrXarI50Avz64qZie+754wHP5ohEd/Jv9SzlPV9
	XbP0uZezIZqevsw1o1aW2K/JBZhVmqQEcxeEnpxm75F26NN9CDgHpGFt1VMVMR5OARv3
X-Gm-Gg: AYBFou0nhVyRjCkfubkXxofpyfMpTRTUP/mvfJjN81Zx8iqac2ZpO64Hf3tWvx9meEB
	B6L4nlVLUGCswKRhQRYd+7axgdWe0/JuhTGYTQISEqVMU3hEni8nLbkJHiQ7FPjPf3o+tHWKdkm
	MhuPapCTxtwk3+e2KckGGYpQxdkY+cXEqlfqQ+uLHo4GGB6dJkaviVFONwTS307ehZ3Vk6ep+zz
	cBtZqrjZff7XORxdTZXd6S+/zbG7mVQklEw/DVz4BVEfUFq3X7VjLabQs8n0WQV8hixe9YIYL+C
	aWb67BGbQJkqu94LRfEsiRhUKtDmTb4e2SgM7avDsC2F4OGmjgi4f6SYvy+tgVFBBQTulwcffYa
	/YPklWcx+Xonl35wfHrngab1KDuxi3WKR+zklSB5SYYvtoZYfNJ1l4BFzVqz2+U1OifooD9q27V
	XnmprrvmriuNCH8iCgvJgq2UMvGe7eYXB5vub1
X-Received: by 2002:a17:906:478d:b0:c25:5faf:b207 with SMTP id a640c23a62f3a-c2a1565b58bmr937608966b.3.1790018532498;
        Mon, 21 Sep 2026 12:22:12 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:09 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 0/4] fs/ntfs3: tighten restart-table offset validation
Date: Mon, 21 Sep 2026 21:21:35 +0200
Message-ID: <20260921192157.102738-1-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes NTFS3 journal replay safer when the on-disk restart
tables contain inconsistent offsets.

Patch 1 checks open attribute offsets in the dirty-page walk. Patch 2
checks transaction and attribute offsets in check_log_rec(), including
nonzero attribute offsets in records without LCNs, and validates
allocator offsets against the on-disk open-attribute table entry size.
Patch 3 rejects restart-table dumps without a complete header, rejects
short open-attribute entries, and requires the transaction-table entry
size to match TRANSACTION_ENTRY.
Patch 4 bounds the free-list walk used when allocating a specific
restart table entry.

Cen Zhang's earlier patch [1] checks target_attr at the redo and undo
lookups. This series adds checks in the dirty-page walk, in log record
validation, and in the restart table allocator. It can be applied
independently of [1], but [1] is still needed for the additional
validation at the redo and undo lookups.

Greg KH asked on that thread why this should be fixed in the kernel
rather than in userspace fsck. Checking and repairing a filesystem
before mounting it remains the administrator's responsibility. These
patches serve a narrower purpose: if journal replay encounters an
invalid offset, it should return an error instead of accessing invalid
memory. They do not repair the filesystem or replace fsck. I am
proposing them as robustness improvements, consistent with the kernel
threat model [2].

Each patch includes a KASAN trace captured using a crafted image before
the fix. With the series applied, those images were re-mounted on the
same x86-64 KASAN build with no reports. The series builds clean with
W=1 after each patch and passes checkpatch.pl --strict with
GIT_COMMIT_ID ignored for the KASAN addresses.

[1] https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.microsoft.com/
[2] https://docs.kernel.org/process/threat-model.html

Giulia Aloia (4):
  fs/ntfs3: validate dirty page open attribute offsets
  fs/ntfs3: validate restart table offsets in log records
  fs/ntfs3: validate on-disk restart tables before use
  fs/ntfs3: fix out-of-bounds access in alloc_rsttbl_from_idx()

 fs/ntfs3/fslog.c | 110 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 70 insertions(+), 40 deletions(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.55.0
