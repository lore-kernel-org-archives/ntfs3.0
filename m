Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786259;
	b=LLFLgIUGRcZz5HKhSlh9k55g53z/HkJTh8IPGg3NSm+6/Q9MnUIp2t5gRTqBelbpORpb
	 N5czkAE4tlrDX3Si4T71D8fMY//UTfMDIKOUUcYL+cmgDl+oi+xgjjslO3i7YzFamHQya
	 K/lNZVwnalyoSdN52xgyaYjvOGCzruayIPFe1uW40tMmIdNqYGvLB5k3j9j33OsrRMPUB
	 jwPXO3kf2z9ipRfJkCuOFodiY2VaamDVBFU9Uda3NXfFiWEARuip1tutE8i0H7upxWKkx
	 NN4P1d77vM0f7X/jXdDPriX1abi1HkhCB8RgW7hzm88LPDyAXD/fBYiuGreJji6LTqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
	b=OQAS/jrl26EGalRYKFlBwCzKHSHBt5P9R7d4bvkNYWYpptRW41IqZ+z0V7EuxZupSHmZ
	 z/wEJFoaYkGAe9JEx+vCLlpIWGDsI3bvh6rhwTLZ4DP2CehGrvcRMlpHOqogZVNjX1zDa
	 K1R6OBFX7lnPb9JA9PgNfgfhERsU19vWCP738nVArq9YJSk56Sau66QXnErSvJbJVdKoQ
	 5Qr+j/+YZdtu3Sn31CcTDTElhCHAD4R+HvmBCUroY0txuObXeMjZrcgJLENeFxH3GzUuP
	 wPOVD++yD5MJNvDvSzgpLjwtrt3fddy+4CjdP5yo9E3cpCaP7nXin8M99RxA045Kl0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufzcP0F5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51E1606A326
	for <ntfs3@lists.linux.dev>; Wed,  4 Nov 2026 09:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufzcP0F5
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so4178755ad.0
        for <ntfs3@lists.linux.dev>; Wed, 04 Nov 2026 01:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786258; cv=none;
        d=google.com; s=arc-20260327;
        b=TOXGZusZdSHJXXdRAn/8OA4NngwEzli6oIi6nDY6FQWCeFQW/EspLL/MTBO61gZJHK
         ExfzvlVCdeGG9WBlQREzobvcJ5KQU8Y+DFz3zc6htFm8IkGnpBqZP7/svfmXFuNjvsVN
         29DkCl+9kMd375pS868ajJFEUnD/HFNE7cZ+DFX1Ety7FVgBf9g2CyUkCruU3xFBBmop
         CJtxpiZ6b3HLtL5Zj5DIUWUgts4vEJ0GKPfAx2Fibow4aFo6IZ8OmnNjnUw5q9xAGrSZ
         vm5A2TEShGMEG6k02MFj5WAaUxeOhP7pV6gN7VycbICozCy2eN7n9JqcBtldCE1mseS8
         phtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
        fh=8Mxx1paKBLL0xykYasOtZrCa9fkGidddz5kTCkBWAqo=;
        b=oE/Gxb5Lv6G9PlX5R00JtAuY4hok8GfViiJ2htxmu161+PslNfCChWJOJaExd5GyfS
         8OYHNYw2IDZcIT3+0Y0VpMOCuVlkpofiAHxbunYXATW2gW/Hbj7EMjEXS1FZ27BW9j3K
         xReUGfk4vI5xP9Z2dci3dbb9nasF6/Cvvg1Q4de0ROIBr7sbpQZlY6cIheRF6RY55fuJ
         GkXf30XPGNecfl1upnCpgFq58qwofme0Qtr7tMUR9mory8BwvCX86DzbDlEOyDGE5Abv
         YyJyuH+fVm928Hq+xLQyz2CUr3FHFOLkK6rjZR62qIa6AZyJMDPL0NjrR12PIXspksUr
         n0jA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786258; x=1794391058; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
        b=ufzcP0F5pD6yrbSYGmh0mjm+Kfr2V3r82BEIvnq5bMHlgLyQNB1lADmwwzH0JdB3vj
         N5XMLlBdap00tP8f68O9tayQV0tiAwSlRUi1/4QWp29+EwgEDrp+0armRBk/3bxY5rmn
         3mp/TRD/j5RSoQ3di21WLkuFprnyXrRwbZMxbZKFqM21sumajIDjtT00yEYX3mohyXWC
         z8aUI3B4yLyREc3aojDWK8ztogp+YUNLbjxbrRUyv+wwR1V15L4z9c5YAuFyLQoTxSeA
         SI9C67+0C0c33Nl7Sjs+4fFnDnCM5bvOoZfGuf0EyEW6mQtRnrnigfORu3uL5EkUUuGD
         fE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786258; x=1794391058;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnpMMMR17dXF17Y49yYY6JNWkoAioE74UmJRR17FwN0=;
        b=D59OzRsO+QYObkiO4d7NNr28MHKuiK2pEUcGQa7Viyu7P4u9cvJsfE+yyYCxA+Qx1u
         7gXo9jjo9eeRwdUMgtLKQzVdUCDkuxhsNoffsIna75OYEBqSjxqhHw0wVNav8mER7jgf
         JEzrhQQs7X2nkTfehmvUYJA4/Gm7mEoNhRy/hFTdIl6DkW4R/4AZBs14nf6UuISR5wCp
         3qRim36krxNv0uGzb6iB/247nU/tok0hpT29YUG5pFqazvzGGpbV2f7giDtRN8cO3xCq
         QPk0mZTKqIn2AmfXQQfxzyt8WFpeKJJUuZ+yKePrQn/rfMjIlY6Lxy3aAjlSwjX9vBPE
         exjQ==
X-Gm-Message-State: APuU4Z8faz3gbPIeTp18d/VN++8RhLYmiPxfRVhKgzP65tNH/OGvvb3T
	KGREmkcDPSZ4VzSBdncZMWRqseKd6O0nUrqa9x2EuVKLqBAE7IIqrPW+0S2eZhDXkZQaBn9d1bI
	HiJZliimtHcf+isIwuUsjoRXkSuTw9tI=
X-Gm-Gg: AYBFou35rhn/fXW7Fy35YBMeT1NFnbw5PKBvCG4zzCzvgoqBpSSPKEi34odxhInMQtH
	XNaHhDy4DXEjrYmtltFiqVFLbNPsNHXZKpy72gEcfd13xmrZNGpK0J4WJXvi8m3Z0XFNB46suW8
	G2hRmRHmH2Us5/6B2Y9cvDhwNnQ9w5fWDmULWIL7OXcQzqLPsrreiM3gMOq6iL/OdKUWkso662w
	hKCr42ivfQAgc8eMdVz4IEN7CEjAUxaxXcYWSr95DnJCWfm7MDY/vd/4YEhsErfK2kwtPN4uAMt
	xEWJ0tqusFGprd074sY1G9/1fOOLreGEbcchBAAutoEQejhZrC08iRRAUhSBQcXIFTpsW2GR8Up
	OcA45xIpmIhKJ/OSU48xI3l/0UD2crOqri5h8ffebrh2PORfRBG5hugux9dqkNNZZVA==
X-Received: by 2002:a17:902:d4c3:b0:2e9:5059:4468 with SMTP id
 d9443c01a7336-2eb3640253dmr137219665ad.7.1793786258064; Wed, 04 Nov 2026
 01:57:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 01:57:36 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 01:57:36 -0800
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Pavel Zun <pavel.zun@gmail.com>
Date: Wed, 4 Nov 2026 01:57:36 -0800
X-Gm-Features: AclHuK9uXSDqvVProHF1jhv2kQ6yi2-I1MN82vpnyRFmOf5EaIupmEonuz5KmtA
Message-ID: <CADEvP=3KfP6kUod2u0fbSCW9suoROHj=qxXih+EToRnpbBuNNg@mail.gmail.com>
Subject: [RFC PATCH RESEND] fs/ntfs3: avoid recursive MFT bitmap locking for
 external attributes
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs_look_free_mft() holds the MFT bitmap write lock while extending
$MFT. Growing $MFT::$BITMAP can require an external attribute record,
which makes ni_ins_attr_ext() call ntfs_look_free_mft() again.

ni_ins_attr_ext() passes is_mft_data to the allocator, so the nested
call for ATTR_BITMAP takes the ordinary-file path and attempts to
acquire the same rwsem. This leaves the allocating task blocked on
its own lock and blocks other users of the filesystem behind it.

The following stack was observed on 7.1.13-2-MANJARO during file
creation, with the hung-task report identifying the same task as the
likely rwsem owner:

  down_write
  ntfs_look_free_mft+0x1e7
  ni_ins_attr_ext+0x1ac
  ni_insert_attr
  ni_insert_nonresident
  attr_set_size_ex
  ntfs_extend_mft+0xef
  ntfs_look_free_mft+0x262
  ntfs_create_inode

Disassembly of the matching ntfs3 module identifies the extension as
ATTR_BITMAP, not ATTR_DATA.

Pass is_mft instead. This selects the caller-locked, reserved-record
allocation path for all $MFT attributes, matching ni_create_attr_list()
and the ntfs_mark_rec_free() error path. Keep is_mft_data for the
unnamed $DATA bootstrapping constraints, which do not apply to BITMAP.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
---
RFC notes:

This is a request for review of the locking/record-allocation fix.
I have not yet booted a patched kernel or reproduced the original
failure on a disposable NTFS image. Please do not treat the following
host-side checks as native filesystem validation.

Validation completed on mainline at
734bef548a96e8774d6eef5dfa2026c6edc4e80b and stable v7.1.13:
- Complete fs/ntfs3/ object builds, x86-64 defconfig plus NTFS3,
  POSIX ACL and LZX/XPRESS, GCC 16.2.1, W=1: no warnings.
- A host harness compiled the actual ni_ins_attr_ext(),
  ntfs_look_free_mft() and ntfs_mark_rec_free() functions with
  instrumented lock/bitmap dependencies. Seven targeted cases detect
  recursive locking before the change; all 17 scenarios pass after it.
  Controls cover ordinary allocations, DATA bootstrapping and cleanup.
- checkpatch --strict --no-signoff: no errors or warnings.

The affected module's build ID matches the hung-task trace:
1f6011352f196196d266069023704fdf61030248. Its disassembly maps
ntfs_extend_mft+0xef to the ATTR_BITMAP resize call, and the inner
ntfs_look_free_mft+0x1e7 to the repeated write-lock acquisition.
The original kernel reported taints P W O E.

The investigation and patch were prepared with AI assistance.
The original production volume was not used for experimental testing.
A detailed report, sanitized trace/disassembly and host harness are
available for follow-up. This RFC has no DCO sign-off and is for
technical discussion, not a request to merge as-is.

Does using the existing is_mft allocation path for BITMAP match the
intended locking/reserved-record contract, or is there another MFT
attribute path that needs to be handled before this is submitted
for inclusion?

 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a95..a4c6fa019 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -1019,7 +1019,7 @@ static int ni_ins_attr_ext(struct ntfs_inode
*ni, struct ATTR_LIST_ENTRY *le,

 insert_ext:
 	/* We have to allocate a new child subrecord. */
-	err = ntfs_look_free_mft(sbi, &rno, is_mft_data, ni, &mi);
+	err = ntfs_look_free_mft(sbi, &rno, is_mft, ni, &mi);
 	if (err)
 		goto out;

-- 
2.55.0
