Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910963B3
	for <ntfs3@lists.linux.dev>; Wed, 30 Nov 2022 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669820242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N6u+3XG/IMxarSx5aTpA9vTKE6ky1leeXmNmLaEP+NA=;
	b=LXob3EseICAXvxo6XNqZjA+jCBxLY4cS9ez5dSZjniPwDluw5/2poKQ7vqYtZoYbaL/RDd
	HQQY5Jl8effDrPhMlUhcPVeDLAXTotsyuEHD3uLl7YuEqUqsBKWoIwC7gxiAsmNcl7jiz2
	UNjhqBjHhf14BXJlIka/rOsl7Dyq4Dw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-cwHgk1HlOiO3gY_LADK0bQ-1; Wed, 30 Nov 2022 09:57:15 -0500
X-MC-Unique: cwHgk1HlOiO3gY_LADK0bQ-1
Received: by mail-pf1-f198.google.com with SMTP id j19-20020a056a00175300b00574ceff570bso11665854pfc.9
        for <ntfs3@lists.linux.dev>; Wed, 30 Nov 2022 06:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6u+3XG/IMxarSx5aTpA9vTKE6ky1leeXmNmLaEP+NA=;
        b=0jnvXWKI9/aeAMztbn6T9Jablg0FqXtvTxr8RhbnUlStHg+YJVn2SWQ0lgdCQe5+RC
         ymdwROfXal8mvxmo/ZPj2ev4Y0RNQlH5lme1gFsuDQ57Kl5TE1dAJtIe+/Cmeigte0ZV
         WLwSM5eB6d32yP2ByD01Gxb3dy53YNV0GhfR1w6zJgAoc8rNVsddzBBgs0G621ldpn0Q
         kc3Hyrr9ctUwHQJtuPQL8gbtGfCgSZiIOFkhirLUWzLHzSaqhTPzJsqKxTW2EkYJwh6A
         mEseaZAEnH6KIXR4HaHQQHYRewjSofCaui29EHTvfaeMljSf5XAoQUTpj3zVz2THcQpY
         8CqA==
X-Gm-Message-State: ANoB5pk2GmnoULsOVDZ8iLndQbOCZcfR8Fa0+Bk8LqDsNEykpgCXWlRt
	/HKVUaNiJKaTCS1zpkcQ8wAsfGO05e0r7tsMS2I/fNtMh7gHzYyaQXZyX2LqfkKKuBcWNglkrY1
	3HdVmpQ5MZ/Ct7U0=
X-Received: by 2002:a63:165d:0:b0:473:f7cd:6603 with SMTP id 29-20020a63165d000000b00473f7cd6603mr37042537pgw.336.1669820234247;
        Wed, 30 Nov 2022 06:57:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7V5/uVZ6WdKV+gGJoNyoymh+C7/c+wVew1dN51CbEENsyVhB08Hf+fc9wbP23e81z/ykc0ng==
X-Received: by 2002:a63:165d:0:b0:473:f7cd:6603 with SMTP id 29-20020a63165d000000b00473f7cd6603mr37042464pgw.336.1669820233305;
        Wed, 30 Nov 2022 06:57:13 -0800 (PST)
Received: from ryzen.. ([240d:1a:c0d:9f00:fc9c:8ee9:e32c:2d9])
        by smtp.gmail.com with ESMTPSA id v124-20020a626182000000b00574e4fe6118sm1488600pfb.162.2022.11.30.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:57:12 -0800 (PST)
From: Shigeru Yoshida <syoshida@redhat.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>
Subject: [PATCH] fs/ntfs3: Fix slab-out-of-bounds in ntfs_trim_fs()
Date: Wed, 30 Nov 2022 23:57:05 +0900
Message-Id: <20221130145705.488351-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

ntfs_trim_fs() should loop with wnd->nwnd, not wnd->nbits.  KASAN
detects this as an out-of-bounds access like below:

==================================================================
BUG: KASAN: slab-out-of-bounds in ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
Read of size 2 at addr ffff8881745b4f02 by task repro/19678

Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-2.fc37 04/01/2014
Call Trace:
 <TASK>
dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4))
print_report (mm/kasan/report.c:285 mm/kasan/report.c:395)
? __virt_addr_valid (arch/x86/mm/physaddr.c:66)
? __phys_addr (arch/x86/mm/physaddr.c:32 (discriminator 4))
? ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
? ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
kasan_report (mm/kasan/report.c:162 mm/kasan/report.c:497)
? ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
ntfs_trim_fs (fs/ntfs3/bitmap.c:1434)
ntfs_ioctl (fs/ntfs3/file.c:41 fs/ntfs3/file.c:57)
? ntfs_fiemap (fs/ntfs3/file.c:51)
? bpf_lsm_file_ioctl (./include/linux/lsm_hook_defs.h:165)
? ntfs_fiemap (fs/ntfs3/file.c:51)
__x64_sys_ioctl (fs/ioctl.c:52 fs/ioctl.c:870 fs/ioctl.c:856 fs/ioctl.c:856)
do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120)

Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 fs/ntfs3/bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index e92bbd754365..1930640be31a 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1424,7 +1424,7 @@ int ntfs_trim_fs(struct ntfs_sb_info *sbi, struct fstrim_range *range)
 
 	down_read_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
 
-	for (; iw < wnd->nbits; iw++, wbit = 0) {
+	for (; iw < wnd->nwnd; iw++, wbit = 0) {
 		CLST lcn_wnd = iw * wbits;
 		struct buffer_head *bh;
 
-- 
2.38.1

