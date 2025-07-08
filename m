Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D128724C
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961309; cv=none; b=D0IG3n3yH1oa92i7XxNdzIr9gt92eSnsHjBuQ6S9+c0Iwi+gIgSkH9ApavVCAq6C86cSBmfmqzwQapP31tgYdPf0Uha8VPaSyGttkiUZYPZN765xEICFGZGlWqxBFoc1FNpENatRNb6CexKyBTooSYd9S8iKWWL66H58bY22vDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961309; c=relaxed/simple;
	bh=SFYJ9F7huYqGN3attK23C+QMdeDJac4QlSPKRrDU4Dg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r2f8onJ4ng9I4kYR+oa4XE9yeeJOYRJMF8IZEe//4GdhfyJ1eoqv2y/3Ac/h+H9jLFP2poXsMdxuNvvyTTKtTFMmYi3wEA27OYXfyiawXOeMOQsgQwD3tTiaVobU8kGX6B7z4vFveqjcgfoTUssZxO7c+kjzf3PyQ118/Q3cGOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IV4UcCqT; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IV4UcCqT"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-713fba639f3so34176047b3.1
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751961307; x=1752566107; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=unanIWyMjQ+vHf7d8Wd5oX37FaPuC+rf95W54Arze8E=;
        b=IV4UcCqTK3C2vyVvlg/baPIOVQeDSQ7WEogTn9ISiuAFc5xpJMm8PEkXe5NuONxQsu
         0lPqcORuP9G4ORvo6Z/quiwi6BCyHepW3NGE3wkmWITHRuuE41+CBbh9TpsxtVgWcPEl
         lz7kS5Ky7J05YcR3j6TDHOWkl+NX9vtlx9g9/E8DIqigK2/63d4Gp7tp+GGjEmQqWn3f
         O01nRJa7BU7p25WPq8c7IdM8Qc/3/wFU6EHMck4REW3RW76LdBdK5r1a2WsRLoNSBd5U
         WObT0bkTkw+bG4pacFM/hHfLcBeWtBhkrD2oN5A53s8wDRIGAF+C7exXmd8/RoXMZU+r
         ENxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961307; x=1752566107;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unanIWyMjQ+vHf7d8Wd5oX37FaPuC+rf95W54Arze8E=;
        b=f1/dvkxK5ZX16eGeZB6HvyM5KN839Wee1jZluXV73WUBBktQHIvAubGVvrOVHLnPU0
         sG7WFwcVwk+Yvg5DuyrAPic3Oc6ZPS4xhcPkvZugAq1RRvk/DyY9wPfq27wTExEFFy3Y
         H7yN0lNJibWfmFr0DfX5tAJ7glQPlLHK022DTDwPBg7iUyF3pABmcjcol1IP/vKEgxC8
         SN4A9AUTjpSyWpFt17A9JIio6Y4HscEfYFjBxcaUO+7mmLNgtWKSDihHbBNNen5aAu9E
         uxE5aOSuXOCF1P1TbcrH317cTHhSoefuq9dib7z9R3xcmGHXsGG/c5Nuu9N//vrp6zDr
         MdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM3E42/vRz+KsHwtk+oo71WHsFUPXIZy9Wl/8KfPiDjOq7OjeVCTgMZYRgUDZ6LIsI1feFOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3CceDYjN1FJ0I6Vs8FW51xJwGBwjkyDBfjG583jRaFlG8svgd
	UphOYpWXkQyhl6sT2+qcKCLWJtssEQf9Pk3bofhlhRUUTGZykSCWmAWmiCjJ08O9PowSNO5nT0K
	+7fizABTbmZe4L7rMTH0JooAZP3soeA0=
X-Gm-Gg: ASbGnctksJXX16yR+IACtrZ1WRziZTkyrKFP+jasIPfut3e/U37Pm54rRDM7N7IqGxC
	u219FTiX4rcanYtow8UJXfR8hB3pMHoWJZvy5Wco/uSMQKrWI86ez2Ly4kQCyCaGRhuuCqgyS5Z
	NqeSIrImHYqh8RTuwFnZvezxT3Qgn7Vs3SEFBgtWCpvSzb8Vg0m/v/onSr5oKQvkJjP6oQUvJXm
	nf3
X-Google-Smtp-Source: AGHT+IFXKifAScORyZguiMoMWqTCt3CMHazmqXK1SBZk1Sap7bwF7y/fZva4KW9i9L5nvFPJCpqfn7D9xvuKGJD++hE=
X-Received: by 2002:a05:690c:7241:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-717a047fe9amr23118597b3.35.1751961307087; Tue, 08 Jul 2025
 00:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Tue, 8 Jul 2025 00:54:55 -0700
X-Gm-Features: Ac12FXwGPoEdJrb6bmrbXp7t12R6zeJ0T_YO1VBL5JsCd8QHB1bvQPjmPk1YL3A
Message-ID: <CAF3JpA5n1Xb7h_RWG+y10zu_cbciPsppv8Pnetmxw6QXxi1D9A@mail.gmail.com>
Subject: [syzbot] [ntfs3?] WARNING in ni_rename
To: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

#syz test

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 1bf2a6593dec..15f3a711ea0a 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -478,6 +478,7 @@ static int indx_find_free(struct ntfs_index *indx,
struct ntfs_inode *ni,
        struct ATTR_LIST_ENTRY *le = NULL;
        const struct INDEX_NAMES *in = &s_index_names[indx->type];
        int err;
+       u64 bm_size;

        b = ni_find_attr(ni, NULL, &le, ATTR_BITMAP, in->name, in->name_len,
                         NULL, NULL);
@@ -488,6 +489,17 @@ static int indx_find_free(struct ntfs_index
*indx, struct ntfs_inode *ni,
        *bitmap = b;
        *bit = MINUS_ONE_T;

+       bm_size = b->non_res ? le64_to_cpu(b->nres.valid_size) :
+                              le32_to_cpu(b->res.data_size);
+
+       /*
+        * Allocated index blocks require $BITMAP to contain at least
+        * one bit for usage tracking. A zero-length bitmap in this
+        * case indicates a malformed on-disk structure and cannot be used.
+        */
+       if (unlikely(bm_size == 0 && indx->alloc_run.count))
+               return -EINVAL;
+
        if (!b->non_res) {
                u32 nbits = 8 * le32_to_cpu(b->res.data_size);
                size_t pos = find_next_zero_bit_le(resident_data(b), nbits, 0);
