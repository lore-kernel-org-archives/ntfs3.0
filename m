Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CA31F9AD
	for <ntfs3@lists.linux.dev>; Sun, 17 May 2026 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061318; cv=none; b=MHA020KLVUzv1n5/D3mjGMM/lrz+W5b4aPPRLf1rQXrReHEHGcAFXDazm9YwdcraorsUoMAJc4/UA+53QhSLquZ6weksQM6/JbReSpnf843qCir8vIDd77BjnGyYJliapsFNi3Oc/jg8UONkOSwkdjTMAP1zjbcfoc3QB4dD0jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061318; c=relaxed/simple;
	bh=zhs2bnGbv4pg0dju1W5cpnVZBrNI+0HxWWMGZQUAOQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOlLGYdbbAjLQsYBK4cmX7zrXRaEL+GvJvAQzNWnh4wcN7T3+m2dQ0TrLrr8TUtP2H3LMiEIXH2VUzMVsK/Yuy8d+oNbjYdx8bMwQn9EOAdWACrcaybVh88CIW4UCvTy841WGrliaIw6HJNOTtrDlz6lOhNcrIP//jJg6EuUCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZqhmah2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZqhmah2"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-90fbf21d9d3so347589585a.1
        for <ntfs3@lists.linux.dev>; Sun, 17 May 2026 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061316; x=1779666116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcSrMq+0NUzVSUcdssHmirp8ahVv/yZU4js8kmI7fz8=;
        b=rZqhmah2LiwKrnVDkMwuJXF8x6xuevNomNayYeIRRRAC7gT6S5bxSTzl9UiJ8Zl3vH
         1GNVCBtf9Msmpnp5T48tLeYIgnTOY8HGTDltvwebDVFoVydQX9Cw/qFf+Yfi5tPJuDfg
         BGieh3XumKydHEdbRK6tf45lKLWaC2dRQBCpsHKThjxWI7OZQgF+2RCGiyyHAoejAwDw
         RQBKspBEMhZpjjjyEE3nHZXbYpRUs2Ols6ximtrrO9WPw/XJKaUC9ujr8bQgcCM60rpX
         3Guq7gH6Xfyc47HFcDFnFcUF7dBrPucaGjyZr5xjvYoAsBqRn9X2VIEI3UxVaQCTXZ6x
         WMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061316; x=1779666116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcSrMq+0NUzVSUcdssHmirp8ahVv/yZU4js8kmI7fz8=;
        b=avCg/XhKAoKEXOuapTJDs2D3XqxQf0UkYwh0Bagfa1CVmoTYVo7j1ED2NYQVrGzJmc
         WHzjavGqnxEnIEeHOLJNYXEDI3npRldWW0qf8w5S79SmeQ5Fxbcmuk64kNMjFSUMJaGX
         8/qnPl5QW615xaYk1FzweqaAGJD86sqXV3EUzWF31DPsqXTZjsWc/rV+oNpkru/PehEC
         OAwHHUlsQ/+BbUsgkpwUlfbX89FuV8fMDvY+7e0AiXn5JGjVb1GsB7Oqsa86Pxf4dwyl
         KNQCUrYko2r5vsWdXbeHTaFcGsBldq3KLkl+BboZZhgHWyw8f+/NUBjxYTKqvntoo9D9
         auFQ==
X-Gm-Message-State: AOJu0YwCoo3eCbx1vc6ASyTKI+YMmPRki7s4cGR3tPKbTVdwQOO6yF+S
	jzfFaR9dzGMDkFSqDA7WqE5XelnvHPqJJR1mDVojYyymhT6BTlveizrR
X-Gm-Gg: Acq92OHtC/5eLHgHMS/bMLw6n7K8/xwiC0jmkvSiG09sFT5TxMu1pmODk0sXekl781X
	BdUT/fU6AWe6QKlrpPRCzgBxkakUzanO+gRo9QLOvHpn9TMuqk4l7OWEMaNJZgKdBGoiGmozkaY
	u4txj39mFWZcPyK58+VQq9Pbk6CrxC90jvyWhF/9WD9XDXjKj1Vl3K0cbzP37YnmOLwGFrZ6TvL
	eMCHyPT6oyVCBewgksZfRrXk66AI6NuSEOD7hYLDZrW+mRt2qyCzM1gxvQWvTYgQv0q5ROxPOo7
	bmUZSLXHPQ2DaMhpT5VJiKNh6SN86r+kHj6xt39Ybqya5nLACf11ejTVeS1zQnGhk65K223PWKU
	sBHLAAon5s1EqYQ9CWIxZFntFRM3KFYPIFZphT8+5rZCVmDcSNymMZyrhn1WM8CPmn6RZ4NN+en
	D5s82XcTSFZRtfcJex1yKvxoEquPXutzLglebw0kQu0Y6Xnc+dcTA+7Jbz2JBi7yV0h3eB8xS3Q
	lmglbfeQnPi7ifTBaMAKR/h9t+2RRWeqk0faf+UZ1s=
X-Received: by 2002:a05:620a:7017:b0:90f:e60e:d4b7 with SMTP id af79cd13be357-911cdc42b1amr1928746485a.37.1779061315765;
        Sun, 17 May 2026 16:41:55 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91435ca2855sm199148085a.40.2026.05.17.16.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:55 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: cap RESTART_TABLE free-chain walker at rt->used
Date: Sun, 17 May 2026 19:41:40 -0400
Message-ID: <20260517234140.1261718-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

A crafted NTFS3 disk image triggers an in-kernel infinite loop at
mount time, hanging the mounting thread and firing the soft-lockup
watchdog within ~22s on multi-CPU hosts (panic with
kernel.softlockup_panic=1).  The bug is reachable from desktop USB
auto-mount on distributions where udisks2 routes the NTFS signature
to the in-tree ntfs3 driver (Arch family and an increasing fraction
of Fedora / openSUSE / RHEL deployments); CAP_SYS_ADMIN-class manual
mount elsewhere.

check_rstbl()'s second walker iterates the free-entry singly-linked
list headed by rt->first_free with no upper bound on iteration count:

  for (off = ff; off;) {
      if (off == RESTART_ENTRY_ALLOCATED)
          return false;
      off = le32_to_cpu(*(__le32 *)Add2Ptr(rt, off));
      if (off > ts - sizeof(__le32))
          return false;
  }

The existing guards cover three exits: end-of-list (off == 0), the
in-use marker (off == RESTART_ENTRY_ALLOCATED), and out-of-bounds
(off > ts - sizeof(__le32)).  None of the three prevents an
in-bounds cycle.

A crafted on-disk RESTART_TABLE whose free chain contains a
self-loop or A->B->A cycle whose offsets satisfy:

  - in range [sizeof(struct RESTART_TABLE), ts - sizeof(__le32)]
  - (off - sizeof(struct RESTART_TABLE)) % rsize == 0

passes all existing guards and spins the mount-time thread forever.
Reproduced in UML by hand-forging a 2 MB NTFS3 image whose journal
RESTART_TABLE first_free = 0x18 and whose entry at offset 0x18
stores 0x18 as its next pointer; mount of the forged image with
the in-tree ntfs3 driver never returns.

Bound the walker by rt->used.  Each entry on a legitimate free
chain is unique, and the total slot count is ne = le16_to_cpu
(rt->used).  A traversal that visits more than ne slots is by
construction malformed; reject it as a corrupt RESTART_TABLE.

After this patch, mount of the forged image returns with -EINVAL
and a log_replay failure message, and mkntfs-produced legitimate
images mount cleanly (verified in the same UML harness).

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
---
 fs/ntfs3/fslog.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401e..d3d808d644dbf 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -764,8 +764,19 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
 	/*
 	 * Walk through the list headed by the first entry to make
 	 * sure none of the entries are currently being used.
+	 *
+	 * Bound traversal by ne (rt->used) to defeat a crafted on-disk
+	 * cycle in the free chain.  Each entry in a legitimate free
+	 * list is unique, so a chain that visits more than ne slots
+	 * is malformed.  Without this guard, an attacker-controlled
+	 * RESTART_TABLE with a self-loop or A->B->A cycle whose
+	 * offsets satisfy the existing alignment + in-bounds guards
+	 * spins forever at mount time.
 	 */
-	for (off = ff; off;) {
+	for (off = ff, i = 0; off; i++) {
+		if (i > ne)
+			return false;
+
 		if (off == RESTART_ENTRY_ALLOCATED)
 			return false;
 
-- 
2.53.0

