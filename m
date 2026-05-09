Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653532D0D8
	for <ntfs3@lists.linux.dev>; Sat,  9 May 2026 23:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778369617; cv=none; b=Mtc/XZV/tRXgj8mr1u/k98Tjkl+D9p+Jc99aIVxLC8PLfp0z4IHXav3E8NIndvJDlFEJPN1gDnu5cAjqLj7iVtMt6gWNdnQduu5uBheZ1VEhqS83qgpQIobeylBYoxu37oamn3CMKvrm1BsDhbQAo/5kj04M0u8Tx+VQukl4hIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778369617; c=relaxed/simple;
	bh=tS2ZOwwLAK44zzC8KJkgqLe54SK6fFDD9Mz8fNc8SFY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=pZP9DNURnkbk3pnuL5zKSWbD0oDjY+TtK00jqluKto6tKcEY8ADPOdGDzHEybMjNYdvpWNe+La5Tb+hJhIWQ6EdsuPgTvBtSxgWOzjBQBxOclX1M27gJKTW7fvwEndxihgne6X2SsdIMKxJACUo1dSBEyQ1FavBcj8yM8KWUm6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABhFrK3D; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABhFrK3D"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso2710372f8f.0
        for <ntfs3@lists.linux.dev>; Sat, 09 May 2026 16:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778369614; x=1778974414; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVG5zt/COxsE1iTVHgCjqR8vjJKT8VaVSfahJvIXRIY=;
        b=ABhFrK3DHPt09GODLmcLxtJ4XT3ATT18lQ/bVkmZ43hofL448yCU06olM7QFS47WTq
         WKrfrNQs8IwsSRprZtI9ALRagALGjdTYSeTbu0Zc7xIePV4RQ+TelGMfz9SpGb9qKuPe
         tr9Kq71qgba6rfEvTwziZvdCqHeMTosWRFDuVk1aK/W/Mo8MUNkFZ9g4R6Hrk8pu2SDj
         B4vBpuLsUK5lHRqL0SfrlTb2hrb8VIxUjo2M/OM36K0dgyexMDu/jt0psqc+PdlCdUXe
         tyQ5Rydc0ecKD7WQbAd2smwTmNshLb/yFCSp9Q3R5DSTEtDu9rge0SVectCAT6D5PdWd
         Yq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778369614; x=1778974414;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVG5zt/COxsE1iTVHgCjqR8vjJKT8VaVSfahJvIXRIY=;
        b=HN7b0+tfmaMVL7Fx/hkOKqJlzu8dlkZbMYp2Z+pRHyf1ryrKbz80cknSZ+w8JL7OSl
         cETRW8nMOGVh6pdDWtlOvdW8QqyVaEdZwTroHRs8Vkl0mF54KshUiG25rZ7jXxIP3QXA
         KV7+LAAiWf1/2UkbvdvlD+/cnV3HQ39k716irl0Vmd60B04UvmYB2jcFX+zWRRVkAYPV
         hu8pLc0Rqlv345zq3b2LF1srOIaKHsdaoWrX0WV9Q0MLcG/80Tpe9+GaEuPFjCXOWMP9
         Vl7vZq3HMyem2g7NZSEGxTE8AF+WqgNKAFJdg75MTwxaMvgTBPcWaqo2hIlK9YxRKJh9
         wWgQ==
X-Gm-Message-State: AOJu0Yx0CM5k/8alZpsCE9sai4p96EH3rTYOcCZ3QfuM8mHVUWNGaxBh
	40y0Dp/BBycW/NNhHh2cnLZ+KWNa2YF3nBaedRWDUlRYVQ++zIQXgrVianwEHMGq
X-Gm-Gg: Acq92OHhBR2yyDYbkipVMpVMyc4fOtj5jcHb6eQ9xk8H/2H6QT7YDbJdZ0E0fI0jq8a
	EHGAoWugDQn35czQZY4DSlToqZhNOBYyWw2/1k2h5pR2ubWwsRRYW3bOR8CRzAdnN22B9SaC/Tm
	3R1Gd/+GS27T89vT0azw79iN7SkrDyIjuF2/hPWB1uurreKFga25l7qS414thXJM73JFzqtZ7we
	FstW1B4A5XrFhq/Qw9pCE4SVqTt5iE+Bhoz2Q5YzgBOyLfqC5RFZhU7Tj7iPFxNO7090dm+1CYO
	IvdnB1kvz3MnTvW+ltuyB6Vc5h6+1LzdjkZrCUvNs6JP90gUwgk7nwPBlaB1nV2mLsWRRxuDL6f
	PbTGkJEsxE+ebffxeZk1o6WEAvtdTJj6zfmmP5cXVJJin/dQLfjWp3rDhMdWCvxKIWL2INSMfXb
	tNGM0BZHdRqvxka1t195PCu+FFnTJQMlih1gOVbClU9Unq4qGFgsUUWHgBMAe9QAmhmBzdTv7G7
	X2rohVZ9+WRS226u5xprT/8mPgFkA==
X-Received: by 2002:a5d:5d87:0:b0:43d:6a0c:9571 with SMTP id ffacd0b85a97d-4515b61a683mr29155653f8f.11.1778369614359;
        Sat, 09 May 2026 16:33:34 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:a405:b300:e2a1:1a24:245d:ce04? ([2a02:2f04:a405:b300:e2a1:1a24:245d:ce04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b00fsm16193195f8f.11.2026.05.09.16.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 16:33:33 -0700 (PDT)
Message-ID: <b7487a60-3364-45fc-a269-9c121da9baee@gmail.com>
Date: Sun, 10 May 2026 02:33:32 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: almaz.alexandrovich@paragon-software.com, m.brodschi@gmail.com
From: Mihai Brodschi <m.brodschi@gmail.com>
Subject: [PATCH] ntfs3: Allocate iomap inline_data using alloc_page
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This fixes a BUG reported in iomap_write_end_inline:
iomap_inline_data_valid checks that the inline_data fits within
a page. If the inline_data is allocated with kmemdup there's no
guarantee that it's page-aligned, so the check sometimes fails.
Allocate it with alloc_page to ensure it's page-aligned.
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221446
Signed-off-by: Mihai Brodschi <m.brodschi@gmail.com>
Fixes: 099ef9a ("fs/ntfs3: implement iomap-based file operations")
---
fs/ntfs3/attrib.c | 9 ++++++---
fs/ntfs3/inode.c | 4 ++--
2 files changed, 8 insertions(+), 5 deletions(-)
diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e61c5bf7e27e..f72848d077b9 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1042,10 +1042,13 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
*lcn = RESIDENT_LCN;
*len = data_size;
if (res && data_size) {
- *res = kmemdup(resident_data(attr_b), data_size,
- GFP_KERNEL);
- if (!*res)
+ void *page = alloc_page(GFP_KERNEL);
+ if (!page) {
err = -ENOMEM;
+ } else {
+ *res = page_address(page);
+ memcpy(*res, resident_data(attr_b), data_size);
+ }
}
goto out;
}
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 42af1abe17f8..031f85fd53d4 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -801,7 +801,7 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
if (lcn == RESIDENT_LCN) {
if (offset >= clen) {
- kfree(res);
+ __free_page(virt_to_page(res));
if (flags & IOMAP_REPORT) {
/* special code for report. */
return -ENOENT;
@@ -921,7 +921,7 @@ static int ntfs_iomap_end(struct inode *inode, loff_t pos, loff_t length,
out:
if (iomap->type == IOMAP_INLINE) {
- kfree(iomap->private);
+ __free_page(virt_to_page(iomap->private));
iomap->private = NULL;
}
-- 
2.53.0
