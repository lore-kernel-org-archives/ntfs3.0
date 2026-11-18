Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008436;
	b=kbBjjO0Fhu46VgifvRVONJI6/Q+8plCbnIuZ18FQI5w5sPhx4RfRbjrbnD05cHru5W0g
	 Q3D9MMca4uGfZElZthl81QXPXQsUhCKn2mTqt6pkoKLvEswwPaNI9Dj/gCMn1tNu98IG1
	 0mFN223x4d8TPsuHd7ttaG899D+uc7e66LT8kvcfy72UXJ6597ZbTi0Neg1UlsW87L3DD
	 zn3Ld0HkM/vEWPJejGD0gLw1jMuOYOITTC893CcQF22R0eLV5/ZdN+z+GMtntjPP5Uyja
	 5Avcg6w5HX4PzMPlcoS6otCzLlUEBM1U+dNkQXv0/qN9ayufXABxvgG99rpD1/w338A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kqJV0Ber9SezkC+GcM+NkWNL1RH3m+jhei1cGQjf+lM=;
	b=2NwRVWKXTtIvwEawA4XS6ujgCwZQIie3w2CU4h/I69cYcWjTph52KH3TJ5BQyJjZP/4J
	 yOD88UqHy2PU4PtYUlC+PYaBhdL752SoI2FbNn2ijMXkfy69BtZS1OvRdMwQVmuQq0Rt3
	 aft58HJWNX18amHhbuuY6TASifuqPM0t+CtUoUvZZx5SUEHXoMJqBiXFX5FZfmk0QA1Pl
	 gdraagkxuVKdM2WN7Rp85EXkAroMyTRsBPMjWDELkj1FfTskBRCl1BvyZpK2Ipa3JilYD
	 z0SYpmLJSG7HIIFQHt+YiGaP82BFWlae9F3Zm3vK0KyXY+6TSCLMKch/Jr8AOdX+QQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dagwct1W;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0E606A32A
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 13:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B0E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dagwct1W
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so590442f8f.3
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008435; x=1795613235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqJV0Ber9SezkC+GcM+NkWNL1RH3m+jhei1cGQjf+lM=;
        b=Dagwct1WVTWJSmVF1NX8EUBL9QVw/1z/L16k1Oty7kRJJXwIAOtbkFOg7qfFGtYg/d
         fOD/po1AmmFcjXhK3jVVoSCwVrXRsAJ/t5gULFKg6NeCB6NFmna7oMKRLtMk40hA6tke
         vroLwHTSHVjQ6V0sIreqnyTpkkSYHL5014hzF6mk1viy2Vd2IKXiAvvxqFwXeH/QOEVq
         5Ipv43LVlwMlsyBEgGgj2+/f6/852JTABTwLCf4tXNdLmHw6bfJ2w2XlUTRVvPNbLe3s
         3oiJnaqDDWRzBoZ99AxIr0YjcfCOBkkyBiX+gPL46/E9dpGcmVgyaBj/lvybZikw3l1F
         fDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008435; x=1795613235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqJV0Ber9SezkC+GcM+NkWNL1RH3m+jhei1cGQjf+lM=;
        b=l0Wyj1fNWR8K6QEVwA0mw/Sjf+Wa3QDzxaA6hhWFgq9LjLCQCD5bkvPCgqNlAGljyX
         uixZWCONYFDdZ4ZJCt9uyZMEY1n3KnQnMZkDJQRv5KMTbjZlFI2FItCFj2lHqPr3XEtT
         nG3Gd8J9lpVeKnDhrqZ6hnBjxS1M9+KACgESJ0Cyh2O2Mess2/+EKmgnfTf1K5oRlGgq
         mEoB2M9OXQpt9H87RhXUnJWi3TiHPL0rYCOY2C1HhMqZOvRxbD2Fv/YSY2M8frbKu+K8
         0XtvkQ4wYsJBamXmw6dE/wVu8ZQkPPZafHk25LffHvpuv3wnZe5kg0FDNbTPYS9SXWzU
         jVsg==
X-Gm-Message-State: APuU4Z+uWHaYBCg1pl9qVoU3hAmer6Gvm44MBA6hOwvH4zeohqOrUGst
	ozBNvbiGMM6YcHy/CZuTS92nWceWowhAaPlhTn8p0f10WwCzAazy048BBxeoQ7+okzw=
X-Gm-Gg: AZFdTZcyyo6yaRO/tKs5VruDUlSSXKfoDi6B/Bb4l5PckxChgQshq6VToszO7YYAw2d
	7f2u4fTcZa2Nj4BvTocYWyzJ2nj4FjlNcPsDvZuu1O0c7x+JQOelwGpeWY+uenFOx+N8jhmVlx/
	/fz546DErT77aJJxH5SekYGuvhbyfav9rOp7a+4tH0/IHYCdkNt5+0Vl5x9k6odnQ9B0v8L7kh+
	2tvlIuzhbQOtSWRVvwa06HVa9bXOnxUop8ICZHNupRhDrOlvt9nrrIlMm8JPo7i5GEakE33scHj
	3jtLiS9n9RRPwR6JtjolVltM7TGmOP5AkU00O8M7zItINtbr/q4+320pcZBTHXva1B2Wzs2IVye
	KQIV+wyk6Sx+LkNUadyIHpwVjEjkrdhuZYGDIpThQFpNB0jEOZX7MMaaP0QnsWNV56DiLB37Gb1
	rH9YzNLzRSM/JyozYjf37EJ5z7EHO2uuEJjn5uYv3rWfxRNK9XMgZPmCHBo52TZv8xSPWyvA2XS
	40igtTfo49YEkif7T1Dbz3BCIHEqYs8zahlxH8rvnewDBG8SnINNayZglnOeirpLmu+LU2S+JYj
	FxXFJ/xjtlOxJXNvbhtc7UwRRxAgBlyixlZtb4BVOqLQplTog+NMRurrEi2AxlXl3dtLwfr1LfT
	C4csc
X-Received: by 2002:a05:6000:3cf:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4a65a3a384dmr5519121f8f.3.1795008435029;
        Wed, 18 Nov 2026 05:27:15 -0800 (PST)
Received: from SurHub.localdomain ([196.188.113.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm5392727f8f.8.2026.11.18.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:27:14 -0800 (PST)
From: Abdifatah Suruur <suruurism@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	stable@vger.kernel.org,
	Abdifatah Suruur <suruurism@gmail.com>
Subject: [PATCH] ntfs3: clear VMA_MAYWRITE on read-only compressed-file mmap
Date: Wed, 18 Nov 2026 16:27:10 +0300
Message-ID: <20261118132710.29751-1-suruurism@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ntfs_file_mmap_prepare() rejects a writable mmap of compressed files,
but leaves VMA_MAYWRITE set in the VMA description. Userspace can map
such a file read-only and then upgrade the mapping with mprotect(),
writing page-cache pages of a compressed file even though the filesystem
explicitly does not support writable mmap for them.

Clear VMA_MAYWRITE on that path, so the restriction cannot be bypassed
after mmap().

Cc: stable@vger.kernel.org
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>

---
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e09..a817452ac73fa 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -415,6 +415,8 @@ static int ntfs_file_mmap_prepare(struct vm_area_desc *desc)
 		}
 		/* Turn off readahead for compressed files. */
 		file->f_ra.ra_pages = 0;
+		/* Do not allow mprotect() to make this mapping writable. */
+		vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
 	}
 
 	if (rw) {
