Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668026;
	b=wZZ57rP0XySmkelbFlOfVrYsHj7DRLZmjF79PH/4UeistEVenPKR/JH9qlDFDBFEoErQ
	 SZnvwMUyH9Ncgx/6bgQO5XfcPADi0l6XA5cWfWqcmvIdhxYLU8dDk7uF3gf7Ssq1+gVAf
	 xKEsKLFLVZ65grZDDffaPUAlC/HUjqcLIsUVduhV117EDUju/AAr1rNeEOYWiUKY0lS/G
	 1E6LB2bLiVwevO4U+VSRIeihkQqGJQMErCSIP4D6/ZyUsUu6lWI3+79ZNXC+ZXF7Xb5Hm
	 EGnjN5l5ZQ9F4kd/PidF2l0/0RCbRRs6S//xc/75FJISo9Hh1YYEBdeQYf+5CR1Ihdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iw/fWoRrccFojpUKteaeVfiegzWbJTWaZy5KVRGPlk8=;
	b=nL/VGx+2IfOMBWLA+vGR4Agl5KPP0vxg5ncbQ60Ykvljjq4E8j01vWa012+MGMYcmc1I
	 4MNRzPECxqrGalhQMTfEmrDKxTCl/pKrC6qJm1xuPoJZ70JK7AbCckmdB1/lTraJicJfx
	 dqNiEQp7ubGQkbjeKteBfO7aGzcU0/aFj7fzna+0UiUtT0fioa3r+qH0cj+xCzGYxFi9d
	 3iMTGKxRsOb/yr2qvkrYyxc440v8JP0Xd/a49s7HhXSVZODKE3zX381MkR3Co/0JTkrXU
	 jfmH/1g7ge4cTielwMx/Hwf0/JVj5aQHfy6yNWMC8EcccVPTUV1DRZYhEuspy/JNLGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwnSFy+w;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F65606A326
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 01:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F65606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OwnSFy+w
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1448352eec.1
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 17:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668025; x=1794272825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw/fWoRrccFojpUKteaeVfiegzWbJTWaZy5KVRGPlk8=;
        b=OwnSFy+wDT9R1w1o7upOxsXgasXt/kjmHeLnFuUpeOsljhRDQaGsSFM8GxxUfmamVf
         1rMGR0+eyieaXEFsQgjJdyhu8ZoNE4pGgF5GEMSRDphBbRWd8qNFLTTn6plytRvhZztR
         eW4utUCcCXgmfDNh250BSrE2hswtDwvBxlRobxmCDaxQ7Kl8lOAALP1UB4jCgr6JjsrG
         3o4A7LjSoaaqnJUFb0v/u5CmMJfv6klijQmFEyep+AkwA2Bk8qOVEsvol6mpYHkrI4zk
         Xb1pHf44d0Ju9S8sRDfzT8uhLmE9duXZHNUVDYub3fmAnk7AaRMgVRc0kojf5yQJay1S
         b8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668025; x=1794272825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw/fWoRrccFojpUKteaeVfiegzWbJTWaZy5KVRGPlk8=;
        b=0K9Jtek4XloGCoG49jyYCeskHE6P3EjrTWrJtdVk8WxUm1RckWPbchfTrvwlSCD+TP
         7JtEdRnnvGAQBmANYoD3LPC1RKouRFA+gcByNEJI6L/ieLjPfaK63TxRFUzvezqKZ1Mn
         vOShoZQIEgjbH1DeJir2e/NRsnMpbmtkpKBjtwycdYD2/kHl8vonf6o3ou0P4YSq6h+q
         4oHWqFeArat8YLqEgqw+AaWl6O8Ib/mUf/D3LGOHT7JUyaSw66+Y+2p13Zci244a4l6f
         ItjMZhtKxw0gnmqDXfgoje2QFN7CKAi/TLNAKsvsEmj8t6r0zOnKdnnh8YVnp2iGGsGO
         wQug==
X-Gm-Message-State: AFq9FYKPAqmurZ7svW8sTGsv9H0d6EAgfz26VDdpUpWUS5wK5hc1uKtH
	AdfrLxNa0+mRrKr2fWvRJVn7wS78oDy5CqqV/jwRtneTJzWckEljGyhS
X-Gm-Gg: AYBFou0GlC4kJoH4zDjdp9bCaXYrk/06CGiYJ6c9EvfKhwY9C6wfv2+aQFNFNK8mV/S
	a0AEwSHK0oa622zJ06aCzpH3R1ZmJECYMszx65vWCghnXMGpVN8Rb/ofJY2k/8YKO1e+1RqkUrT
	nvRObSvcqscNgV6i0W5/nFEdIFaADkPCjoM+IMC2ZUxOB/3GNTzeyLUfV1AbylMIWeHR+5NIwGl
	/PIZUtepLk7a51OsSwaNZCbraBPJnDgjal23Obloj9F592rZLZmJcFdpuRDkZi+nyNxBpy77zOq
	a+VrqV6yoTAembjO8eEcpbmwQFtnOgnPpbc6ThwC3YJOXMzk1aDuZdbyCppezQVghgtiZszHONy
	jlNQj+vJhq0m8Rkq09mKFieLuJjbcefvvZn0J5+40TxXO8qgM751oPhfqaDAr8iRZ1Pg49ORNKN
	CG+iQFUDjyS48+22fKYQRl9lGKrXQt7aLgwPobo6W9uPcTSP5fUqmaFmTunb10LMl460kMlSOB4
	mA/WZQ7HExiVtLbV2DfVM8162syNnTok+QTDSe50lpcXtQPV8ANKuAGRw5T5RbgYXBaY3vNya5y
	6XA062sh0xK9ZF71w35rt7KBhgrIAg7KjjfjrvFVxonKLoWm2UuKPKIn
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1ac5c45fd1dmr20515706c88.15.1793668024586;
        Mon, 02 Nov 2026 17:07:04 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm3767727c88.4.2026.11.02.17.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:07:04 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: advertise nodump in the statx attributes mask
Date: Tue,  3 Nov 2026 01:04:37 +0000
Message-ID: <20261103010437.55455-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_getattr() reports STATX_ATTR_NODUMP when ni->nodump is set, but
omits the bit from attributes_mask. The returned mask therefore tells
statx callers that the flag is unsupported even when attributes contains
it. Callers that check both fields cannot recognize the nodump state.

Include STATX_ATTR_NODUMP in attributes_mask, whether the flag is set or
clear, to describe the state already reported by ntfs_getattr().

Fixes: 33f29fc7c67e ("fs/ntfs3: add fileattr support")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e0..d5c87d608bd9 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -295,7 +295,7 @@ int ntfs_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		stat->attributes |= STATX_ATTR_ENCRYPTED;
 
 	stat->attributes_mask |= STATX_ATTR_COMPRESSED | STATX_ATTR_ENCRYPTED |
-				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND;
+				 STATX_ATTR_IMMUTABLE | STATX_ATTR_APPEND | STATX_ATTR_NODUMP;
 
 	generic_fillattr(idmap, request_mask, inode, stat);
 
-- 
2.43.0

