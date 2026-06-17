Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202F38F24F
	for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 23:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738398; cv=pass; b=OGNAAjPENdNMAV5knCXV+xnLFuEPRsFlSmBbJKtJCBQ6LK4dj6+On3COUadAYBefWRIvWHuM9kE1IVeJoSgw18ZGsw0/kYawVgBUiAkqhF9YQVonzREURIwPQkpaibrAwi021ARqpj1nyaoGedAp7hfLa7lQcX+VKifhBccY/qA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738398; c=relaxed/simple;
	bh=C2uIgO4GKMDb/V8hGe2dDq7ICL4NIxLXZI42+/B5/VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qym0ZXj+xTdlocpBwXYCXomtMG3qPJy+Lu87RMx7FTNDPsoJxY0c/NvZn/WIxQtbENqJlKxz/bsAFQe7MG0X/O8p46ezx+31lGOBqAp4dbUNL11Xd9FAxhkSde2MXU3lC7b95q/BmPCVZkVVHtAtYX4gt/aYHUMRs2q3W/t/YIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=VsxLBEqd; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="VsxLBEqd"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so242740a12.0
        for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 16:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781738396; cv=none;
        d=google.com; s=arc-20240605;
        b=H2MbJEIeyGm/hlX6bZwH6qeoy8NnjvSJxTfuX/2qNAa55Ma4boit/32njQQ4TAN7yU
         N42s+cumLuOL/B2oxi4Pl184ErKEjunEsFe/4yrevIc9XX5KyRyf6JG5Ev8338NXjj4c
         63aBRQyRsvCapzXFMQhr0e7q4T441NzRFxCbjmPFE+iwP6tzNaZ2kAX3tC8cM0fnZkU2
         aSatow14/LEO/CLb52KFp6Iivzux+fJoYH7e0yZb8jICzyD/+ODiLWiKqC/jUSYLaoDm
         JdiLvNSW17U70HeFFodujbKHlTd0Au9IKdgqyhN4+RStnZcUe5dia7I0GD3gOCtpkaVP
         6H3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zqCA+PokS+2/wNFc4bObFUUjwikCsKrkjdH/0a6K8Gk=;
        fh=XZm3QxHmr5C8P86qhzOirxHgkn0yssSNKkQHPVTDSVE=;
        b=CY4fvNPewmIk13VREDsO58budpoijqSXC+6lcy4kSBmBxop9xXP1vXgNe5JkpZWW8q
         oubr8aT6lu9J4hQMY3AexLODV4cIhStHwAjqJy30lAkRV+/86fNgSzf8OllY3D/upuf0
         NRhM4P5H3io3xd09I7d1puafBtGlmq5fKYEKMswWNqdidkDg9KN+++HsYiUq1ME4r3na
         IY4aB5xADQyGFtzud6RyQJjSU2Pt0Rfe1pE9O4sH/Iqb4XfUKkfMPCbTsM7jXCXdUG53
         23bI+LM4N8zgSpF9aEFhv5mRx1cwnfXC8pMyhvduLuF4pRd+A870DNxm3/ITS97MSXEm
         +cOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1781738396; x=1782343196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqCA+PokS+2/wNFc4bObFUUjwikCsKrkjdH/0a6K8Gk=;
        b=VsxLBEqdKK4FClpO2XjQfNcwD39ZYCREJWRN2JuXFLqFEVIrjVHaLS2Ss7z7ehTzOb
         LwscBQIDx0wHw460mUD8rRYtHn2/iDmwZz9kFWhCTok/hjzQBQggTci8X60XxwljGQRh
         dGaW6N95n4XrO8HIOOtDf/XWezFHgYFbmoqSUBYe5cg2P2iGuPWv9fP37n9i7NWswXd1
         /bim3qsFh+slNELHFwJI+AmSyl5E0bPWlouOTjEKk2YUINa7HvWuv/Vubk6c4INUqn2M
         6R3MfFJ/5o0FHgDBY3tuREQFxiNUuUYutjfkIGqQBDBYJAH8wybqEJIHWT6ShB+Wvksh
         Uqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781738396; x=1782343196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqCA+PokS+2/wNFc4bObFUUjwikCsKrkjdH/0a6K8Gk=;
        b=cK9479B2UMnyZqyuzu4BmZtAbdNTyjj/f7zN/+HsV23L8fdeTyQSoiwybItppiWegW
         DPXi7VaQlGwFqaVBrii3gVfLrbfDG4BpIp8Ib+alyci5Mll0iZn4m5xX5GDDkY/ieJDn
         N7mRKMGMpq/vCiZDjUIWt947jHc2C01H+1PpTM0aJsfwPjsdhDQv5EhsGuxzWp3UqTU1
         b2X1c8LQOYuLeFntqiuwmIWr/9Rp/3vIITnB5J73wDLZZf1B9sDTDsMj54rVVSOEtf/Z
         G/CYHYK6DWazaCshmxwbOv+qAYk8ihtNyMpH2ULIyclUDHm1ziS9m31/3AXyVjgq0wsB
         oWJQ==
X-Gm-Message-State: AOJu0YwOgcFKcRbp1R8zMY7fswdH+1eyEUwVeFSuNNGEIvrQgqboVi8e
	zKvLjuwvl0FwSaF6/pZp6nGGfhwHaMQ6THpjlNuWkYCLSQX3V9uHfSRZO7whU8+KPZ6tXKLaPbu
	IY9zY8jMLdemj40f5a0PGsG/TdI2jB2Lp/1QF6k3/
X-Gm-Gg: Acq92OEl+IZaU/3/vr2MzC7RoAUXC+8gAQhnnszN/GDQgUKwP2V0VgPehQpCgR0bQ3f
	jBMzOr0BQrvi0pYgBbHCTHlnmesXVw7AEQ9DltDRprVftBQhZh334/09+nxBFSmhafvikKRJbRB
	9j9Q+c3hiMzIuoR1paHgn1xvxYLCc0xyokqcAcG7/0aO0VcPBWwHRtIW8NvVvDCWxTayGAKx/zH
	V71qEAmkMmrUwq0Uawmva2w5VR8vz8f3snTR/UHtosoTaCy4OE7M+DP1qhpqgTLcybUfg3hNtoZ
	sv4t124b3djUrvejjw+wPMWuwXpt
X-Received: by 2002:a05:6a21:e083:b0:3a2:d838:bfdb with SMTP id
 adf61e73a8af0-3b8b76e78cemr6620170637.29.1781738396452; Wed, 17 Jun 2026
 16:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617231343.403432-1-xmei5@asu.edu>
In-Reply-To: <20260617231343.403432-1-xmei5@asu.edu>
From: Xiang Mei <xmei5@asu.edu>
Date: Wed, 17 Jun 2026 16:19:45 -0700
X-Gm-Features: AVVi8CeUYZZnz1sG3al02pUouG8W0SMwKcgXJUwT8LMhc2xdHPmIadta1baKGVY
Message-ID: <CAPpSM+RNyi9mwzpa_QNeFS2PmAw=pdHzaOAj4MrBdY75chDRrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] fs/ntfs3: fix out-of-bounds page_lcns[] access on
 log replay
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Considering the vulnerability is exploitable, we don't post the poc
publicly. If you need the corresponding poc triggering the issues, we
would like to DM and share the payload image, poc.c and steps to
reproduce the bugs.

Thanks,
Xiang

On Wed, Jun 17, 2026 at 4:13=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> While mounting a crafted NTFS image, log_replay() can index a dirty page
> entry's page_lcns[] array out of bounds. The array length is the on-disk
> lcns_follow field, which is never validated against the space actually
> available, so several replay paths read and write past the entry. There a=
re
> two independent ways the index goes out of range, so the fix is split int=
o
> two patches:
>
>   1/2 - The entry's own lcns_follow (from the on-disk dirty page table) i=
s
>         not bounded against the entry size. check_dp_table() rejects any
>         such entry once, right after check_rstbl(), so every consumer can
>         trust lcns_follow as the real capacity. This closes the HotFix st=
ore
>         and the v0->v1 conversion memmove:
>
>           BUG: KASAN: slab-use-after-free in log_replay+0x55be/0xbbd0
>           Read of size 8 at addr ffff88800dbb28b8 by task mount
>           Call Trace:
>            kasan_report+0xce/0x100
>            log_replay+0x55be/0xbbd0
>            ntfs_loadlog_and_replay+0x4a4/0x5c0
>            ntfs_fill_super+0x2252/0x4570
>            get_tree_bdev_flags+0x373/0x5f0
>            vfs_get_tree+0x91/0x360
>            path_mount+0x75a/0x2120
>            __x64_sys_mount+0x298/0x310
>
>   2/2 - In the copy_lcns loop and the redo shorten loop the index is driv=
en
>         by the *log record's* lcns_follow, which is checked only against =
the
>         record length, not the target entry. dp_range_ok() bounds the run
>         against the entry before each loop:
>
>           BUG: KASAN: slab-out-of-bounds in log_replay+0xb7e0/0xbbe0
>           Write of size 8 at addr ffff88800fff1518 by task mount
>           Call Trace:
>            kasan_report+0xce/0x100
>            log_replay+0xb7e0/0xbbe0
>            ntfs_loadlog_and_replay+0x4a4/0x5c0
>            ntfs_fill_super+0x2252/0x4570
>            get_tree_bdev_flags+0x373/0x5f0
>            vfs_get_tree+0x91/0x360
>            path_mount+0x75a/0x2120
>            __x64_sys_mount+0x298/0x310
>           The buggy address is 0 bytes to the right of a kmalloc-2k objec=
t.
>
> Both are present since ntfs3 was first added (v5.15) and are reachable fr=
om
> an unprivileged mount of a removable device on systems that allow it.
>
> The two patches address distinct untrusted inputs (entry capacity vs. log
> record count): 1/2 alone does not cover the record-driven loops fixed in
> 2/2. Verified with two KASAN reproducers that mount a malformed image, on=
e
> per patch:
>
>   reproducer   without fix   1/2 only   1/2 + 2/2
>   ----------   -----------   --------   ---------
>   hotfix       crash         fixed      fixed
>   copy_lcns    crash         crash      fixed
>
> The reproducers and crash logs will be sent as a follow up email.
>
> Xiang Mei (2):
>   fs/ntfs3: validate dirty page table on log replay
>   fs/ntfs3: bound page_lcns[] index by the log record
>
>  fs/ntfs3/fslog.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
