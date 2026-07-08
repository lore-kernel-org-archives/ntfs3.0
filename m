Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C32C2360
	for <ntfs3@lists.linux.dev>; Wed,  8 Jul 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531060; cv=pass; b=oXv5o371Gd9eHEk8HOmJa9yUb4GYd3Cjp9hJdsQM5a2ftKGFLNFQjM9d8dPZ4mE6/P6jLIg2vV3Q0kAMZQR5rWZQOY1kolkfqoZ5X9BwgJVZuChbZAIv5wHmebo1YSqPe1CGElldObSBO7s2ey5V1iRJHhPh/LSvui3mw6dJf1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531060; c=relaxed/simple;
	bh=PIu9fyMR7GQ/nmpeDJB/gw/7OAGKTDNEalqbZLvD06Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KBBijEsvhQnuUGsAqiSYrRbYtqUgvVK7rk+lE0JQzkYi+n4HlihU4yIk2tvXlAZ+QmDNSRwlpARu0VvxgxXXnFGYc3kBRm59Kfmp95gPYVSPhH4grKEE3XUnneSWIPBGuU+Eq7LgwgOOuRQgqmOS5+OdTglYlL0d6TjId9GhfHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tykubhhl; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tykubhhl"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-806449d108aso14611867b3.2
        for <ntfs3@lists.linux.dev>; Wed, 08 Jul 2026 10:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783531058; cv=none;
        d=google.com; s=arc-20260327;
        b=p0XoKai3ss1PwA474w5iKcn7KOTmyXs/+sqffGP8aatgULjOmFGCL8kDXIzHtihZP+
         ot8NXckzM8HlPN8PWKjF6mkgcl90YItPeGgq7/olNrIMnWb+Y9yvWDBaEWRV6yO2RA4s
         VLTV4tILk+yO3nmoadO4d/r0DnBxeamxrFx9lX3Wh5urFBQW2w8/z9Al+ZY3MSSA/MRg
         ToseSg5V9tNrQ9RwQqBGnMB4KH8inIJ+o1Kg6dBfRH0oZYv6WwQw/83nZFgRaLPLi9TX
         CkYTvQ6PE80tX0x86QDq5gAjVF2XzcSdNyzPIvPiWiM/2rCwUbF38XBaFiK5KigVY1D2
         hsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PIu9fyMR7GQ/nmpeDJB/gw/7OAGKTDNEalqbZLvD06Q=;
        fh=qPW8S1mzg8SnymDyIX/90+TZiX+SBIGl5B3e9Z5kqxE=;
        b=Bt2qVwS300I/W1vMlm3FS9OrqUYv6SjjB6JeO1PhJ4cjj4anycaMQXvTfb1kQoJOyG
         97bFohJhiMYF4A8JXsIBZl+5eZMJ/GVPCqCVRmdYHwtdLpkTW4RJb4uK0eNXtlxIDqlM
         SpN4PTA87YCFjc98dPWC3HhG+a8stzSIsMnvphRWVd5JfuuypZuWMD4+gxOwrmZiHQWn
         urFTWS6k4QtXZEDqEClvMMmhu3xiEEDHtHfCnK5WdNv+7A6Ax07diK0RMGIv9UihlIQg
         suGh2eA5cGLUSlHC90bJ41cDZ1z0c0i+Aok9C+O2UcTVaJF9/olgqePvzcFT1E2CBaVo
         EdIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783531058; x=1784135858; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIu9fyMR7GQ/nmpeDJB/gw/7OAGKTDNEalqbZLvD06Q=;
        b=Tykubhhlya1SqriPQMKqGE0J9EtG35M8q9XumTobbL8DuQ2WNaoMAs43H95DU0qK5G
         UjdAG3PueCxcgqbpNndJfmILd+pV9UcP5JM0kX4EPOFmiN824BC9L720kK1StW1LupLE
         mvhI9IXkrPS6XWtbMihFHZZUGQldEBacDeEQ3I3AnxQKh+xSbCjyP9qROv6xOiN/XWd4
         SlgFIramoeSL5n69c1QUzRODtmxN5RrerAjaEdmTIE82GMRRxRjoxi3auGITXew9Lr3Y
         w9min/jjg+n011GMMv+qGCLijZYKAGQ2jhaaxa6YmxAT1kOyqPEDvl8iOIObqi1Hh0Xa
         mlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783531058; x=1784135858;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIu9fyMR7GQ/nmpeDJB/gw/7OAGKTDNEalqbZLvD06Q=;
        b=sIkfPeLDd0qW8TWznULNqOl/8twWVIvnPUzwOCXVXZ54PrJozpvtYojGRkqmkO9g/Z
         NQA0GeoINn8SrgLCLiqHAPQqN3rQCdTgsxEWOqBmwnmRGHSXU/sUcR4f+Da1T7GUy1Jf
         VEKup1qM4rFkAE79NxAlhg6BuAAD8pKHVPdNf0Orz90YKWOdXT4lijqOfvLIEa5kqIJm
         w0O8/kVtP39b0kn16XD94ghDPpxJtUbEUwzS7hmO6wCJNSVJYi+1lKXmB0TKjAkVfZUa
         2AmlEPMSyclTn+UjF6JGPpIGHtyF3baUjKnorRfPKRVUKs7fWrxkJ6WR7nosyRD5lk3e
         8OcQ==
X-Gm-Message-State: AOJu0YzYQQzG9ZsY+7kr5+oY7p6SnPY2lMT9O1RXq1/STivTSHJ+foTm
	IE8qDIWZLtu0shpfMncQwjdz0Wgjw5BaeozyS1yn5jmb+E1pF5i5udRF3/hJc+wDekMxGU1bhKV
	vAlYgeUtTpplPfm2X4DV7S3iropMqVf1qJy9oFw==
X-Gm-Gg: AfdE7clNLUrWnCImjGKTZ1dgRzSGLUdN+G9AbjZRY95H8sLpmqpTnXk7jnw8gdm+1am
	t+3DMaDjWrB4A33BcJYq2sRrvahGs+/phOehPPyRjup5OutmIL6a77hus2Q3+n2RbMA4FzVYVaI
	iGdQT+0ubPrC1iaZEvCCKuUHPwXT4wmN1SfWNjHPNvM5pJGjsM3c33svons8Stmj3BML9PaGkkh
	krDsbkeqd+JcTMTM599OE4DT9ea1tG2raR0sm4+A9x6GsvCO7WCYSYHusv6ENnAiX0f0F4=
X-Received: by 2002:a05:690c:7305:b0:81c:c2ee:7380 with SMTP id
 00721157ae682-81dbe856ba9mr31131807b3.48.1783531058134; Wed, 08 Jul 2026
 10:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOSSAUCpS7SqevJ9hnSbLHFK14ijnrKM0_RihO=1hmDD2n9-uw@mail.gmail.com>
In-Reply-To: <CAOSSAUCpS7SqevJ9hnSbLHFK14ijnrKM0_RihO=1hmDD2n9-uw@mail.gmail.com>
From: "J. Ortega O." <jorortega@gmail.com>
Date: Wed, 8 Jul 2026 13:17:12 -0400
X-Gm-Features: AVVi8Ce9oz8pB1LJMslhRoaDCWPhUN-P5Yq3Ve53CaNtMqiGONBS2lDchvEQBNY
Message-ID: <CAOSSAUAukawgCuJQSeYcD1hxKGOP4gGE1v0oxwEcuweZZFbqhQ@mail.gmail.com>
Subject: Fwd: File operations on NTFS drives causes kernel BUG at fs/iomap/buffered-io.c:1061
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Seems to be fixed in 7.2-RC2, but now replaced by keeping the
filesystem in a dirty state all the time.

Even a clean umount will leave the ntfs filesystem dirty, including
when no data has been read/written to it, only mounting seems to make
it dirty. (windows always repair the filesystem in the next windows
boot).
