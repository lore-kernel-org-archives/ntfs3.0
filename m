Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF1199EB5
	for <ntfs3@lists.linux.dev>; Fri, 14 Jun 2024 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382263; cv=none; b=gOv2uj+WuLEVco+Mf/omSnfVmoegKXquBH92npgSUae5zRs8HT4LS7L6Ud3P2p6tRx49UbL4hyYrBugZ7d9QLf8dZcNSGHnTbqxlx55jO2zIoskmu5V2BquvCoR9WaUp0m+UmhV9m3RE3jleEs8VYPfAhfcjZv/lAOTF3bND6DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382263; c=relaxed/simple;
	bh=tN7LqXu7sn76l8RH6t1mSgBaDnSjmiDONXBR6nK0OuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZCaLiqyLYAvkVUvElYDpPUImCEt8TLmLUNI45O11BqPALubFicwYEU1sVB+Fw+/ipA+hxkuEEIUM/s4yBtk0MEnOumsnwyrJbwATSYrSR8yHnL7SW9JWGQVpE1M6wQTiPAgnblkYwl/gWWzOP2hBJ8SuuRnxXY/sr+TO7cnn39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObzWZpKR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObzWZpKR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6efae34c83so315232866b.0
        for <ntfs3@lists.linux.dev>; Fri, 14 Jun 2024 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718382260; x=1718987060; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN7LqXu7sn76l8RH6t1mSgBaDnSjmiDONXBR6nK0OuY=;
        b=ObzWZpKR5fLNq/OP6GXHlht0jezT1fUrXO0Hrtx9yQwAo5fuP+hWtRxXAjqTBf+Bis
         HcoUpnbjY2UD7Oqz4EAwuJ8Ve90tyElxxh946fAEUy9cEpSiTbbrFiYIz4KzTAG/7P5E
         w7J+eT0Cy7IpbBNscs/ktyAXeMYxI7RrPLhPvRW0YaBGCGedw3sxjlvL7jD0O+ft3TIa
         z1XcXishygg/RpvK54boHEtb1FcLISBLDVyDOCqVjNpO/p2EFGsM009E556yj0ZLLtKH
         k8ps1bMlbo9bv//eHPLSMf2KXPywiz0dNxoJYb9CG+noUskF9sNmsgBzMU9GTyvE5n3x
         4dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382260; x=1718987060;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN7LqXu7sn76l8RH6t1mSgBaDnSjmiDONXBR6nK0OuY=;
        b=Ak1nVaE4Qpj7jrkT/I2JQxAqKBs5BWH0F44LQrBkwzynZKk8Zozy6tQ0bEEeGfaBES
         Vodm2JiQUNM2ZxXizjZDoJr9mNBqhXLbsuuuE1lBnnndyt4GCtzm1ChuSlk5fR7kOfW6
         aVokO2Y4bNmNKtMANlyYoq1VUYsN3PeZfOf4gJ5Z6zrqkSM43q/fEp/Ff4/e61cVUg3D
         NEXJzpqC8z4sjSRrEsqWIoECfL/1kTw7q5G0BPYwJuYNWftcKDacSnN830k3Uvw+Xvpt
         OaH6e8RFAUUacuAI8XXVak6adzNH79YUdZX3tQbKXJpcip0Sin61E0gUStGkDB93tAux
         6qnw==
X-Forwarded-Encrypted: i=1; AJvYcCW465nynQjtvqGHdF+/BeUq27zJPjwAPcWYlAXawmsNLAnKnvB6B0XUIAGzQbFLSbS9KZZt/LWxFLpprLFlFCcEBg49YQA=
X-Gm-Message-State: AOJu0Yy/msHMSkWIlqh5rjGSqjuPT3f02BXmqOP/t4JI3vnmQY34Jcie
	90/vnUqvRg1rB6EFPaxco7BO9wvx+yBntXmDYZp83mR8BnNaV1lFAcFFFRWqTg9Vi7YCZJ3J/C5
	LebKAlA527zHXfIaa/3tNTDMsJnY=
X-Google-Smtp-Source: AGHT+IFLKKrCZDS369pQ/YZWrvvgToYgfpJ6ibTX1xOSwFIy5J1GhkwxlZIAQZMkzKJiAjXeuMq7s2FMLtFwX0uzRMs=
X-Received: by 2002:a17:906:9c8d:b0:a6f:6ec0:5568 with SMTP id
 a640c23a62f3a-a6f6ec05917mr34999466b.55.1718382259716; Fri, 14 Jun 2024
 09:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240614155437.2063380-1-popcornmix@gmail.com>
In-Reply-To: <20240614155437.2063380-1-popcornmix@gmail.com>
From: popcorn mix <popcornmix@gmail.com>
Date: Fri, 14 Jun 2024 17:24:08 +0100
Message-ID: <CAEi1pCSQePMo4X_RvMfYmpxYwmuamhd8=1OXgNCU-N2BBdTXPg@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: Fix memory corruption when page_size changes
To: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 4:55=E2=80=AFPM Dom Cobley <popcornmix@gmail.com> w=
rote:
> The kernel panic can be observed when connecting an
> ntfs formatted drive that has previously been connected
> to a Windows machine to a Raspberry Pi 5, which by defauilt
> uses a 16K kernel pagesize.

Here are links to some bug reports about the issue:
https://github.com/raspberrypi/linux/issues/6036
https://forum.libreelec.tv/thread/28620-libreelec-12-0-rpi5-and-ntfs-hdd-pr=
oblem/?postID=3D192713#post192713
https://forums.raspberrypi.com/viewtopic.php?p=3D2203090#p2203090
https://forums.raspberrypi.com/viewtopic.php?t=3D367545

The common points are it occurs on the (default) 16K pagesize kernel,
but switching to 4K pagesize kernel
avoids the issue.

Issue wasn't present in previous RPiOS LTS kernel (6.1), but is
present in current LTS kernel (6.6).
Revering to 6.1 kernel avoids the issue.

I've confirmed that reverting the commit:
865e7a7700d9 ("fs/ntfs3: Reduce stack usage")

avoids the issue.

This patch avoids the issue for me, and I'd like confirmation it is correct=
.
