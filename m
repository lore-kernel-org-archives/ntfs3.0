Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58A212D1B
	for <ntfs3@lists.linux.dev>; Tue,  8 Oct 2024 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412375; cv=none; b=qTTvcx0F9PQRKsfebqDW7V7zZnhkup2Py2GMKB1aQ2nUl2IW1Z4AUhVE0/pYbzZ1oY8jILb96fcNxIe3s8aaPXxjJpGZ9umEr3p8wKFrSew/hCyJiBUPc9jDQmFYKnFM2OBbZZdKtic4nM0dEZ31KX6jAChRGyfTVGUDrJ1C8q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412375; c=relaxed/simple;
	bh=NdQwiwQuLoS2/vzCdC3cG3nYhs+SrFNqy7Aeb1DsPg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o24cPcU45gUuF6aj5DUFRjHrMrAooR9hZSxxdH3mWyAtA+9RH8yRMVvWcX1O1i3Ikfdm3Ol1ZuCdlWM+1b1QxikTweFrnT/V2rdgOcKOp2QKxpS+2RQ7lPFwC1+6NyHozEppBYxsg8n9v25e0TRBi3DJ1IvcFuWWHxdGMM5zUps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SDVGgsjC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SDVGgsjC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a994c322aefso15394166b.1
        for <ntfs3@lists.linux.dev>; Tue, 08 Oct 2024 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728412371; x=1729017171; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJoPz0THRqBd4HlQLDGinYJ6nPjtsrSYsGPiskCD98Q=;
        b=SDVGgsjCVrr1gqF9jJd1k0rEtA4phOCa5t73jjBWIYAvG8sszIJqyNo8CIDiRw/lnd
         3fs4BA7bosO3NN8ZPnDjMNmBvvpV1cnetTmLb04XsnJBkbqB6qZigtrYCS9UYF2LZF2U
         HfLYsgW48GJc9NxAITydabw2xcEOfw5L/esNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412371; x=1729017171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJoPz0THRqBd4HlQLDGinYJ6nPjtsrSYsGPiskCD98Q=;
        b=QQzg1umA7M9PYg0MlxrNHehncBPCauYNJBV5qXJsdKP+FKpQszpj4Av08qY/h+aOlv
         oGHakT6W5BJzzfXQjNSLmkn4b6UcGHCP+NI/YIXVOGTIWTYj/vQ0g7Pcny/s6I0rYXni
         3Oh57KoZ3DOp8hy2pkScmsxnrObZGZN3fKfc15s84mkZrW0N3Y7/jt8QtwRLJ6E4KoUY
         maEA/r7tWMJOSnEyPLSzInH0InQ/Vyyb9s8qcFGNtugmN4xLDhyU61Db+c9IJAsHkIEy
         9YaxS+A6CfYmYHAc40PwFCfM9muf26A8sAyj8liiL01+7EM3GmeCcwidRr0r7tOPSccH
         0thg==
X-Gm-Message-State: AOJu0YxNfq2ZqcA149T68LrME3x/gPo2piyaqN5gkDa3qOufqJUKIclP
	oGqIDgieACid6nrxjWGBoAL/Oe8flm0tXWtaA0u66SHEof9bG2IeI67PphanxuZhCcM6G0f5rY0
	equ3nbw==
X-Google-Smtp-Source: AGHT+IEAshXFgfxbDK5ABDb4UAVfbkucTo1MidOqvFI9cmgITPta+6idvUMo4d1a3gEFfXnwcX69YA==
X-Received: by 2002:a17:907:843:b0:a99:5b1f:99b3 with SMTP id a640c23a62f3a-a9967a7b44dmr423533966b.24.1728412371079;
        Tue, 08 Oct 2024 11:32:51 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994f74e13csm343514766b.164.2024.10.08.11.32.50
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 11:32:50 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a994c322aefso15390766b.1
        for <ntfs3@lists.linux.dev>; Tue, 08 Oct 2024 11:32:50 -0700 (PDT)
X-Received: by 2002:a17:906:d551:b0:a99:5afa:cc62 with SMTP id
 a640c23a62f3a-a998b277a2amr1061966b.19.1728412369839; Tue, 08 Oct 2024
 11:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008150247.6972-1-almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20241008150247.6972-1-almaz.alexandrovich@paragon-software.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Oct 2024 11:32:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg5a-4NGhU4J-PxOwVgNEqN+ZSQ3ZvUMfy5DhzGdZXLmQ@mail.gmail.com>
Message-ID: <CAHk-=wg5a-4NGhU4J-PxOwVgNEqN+ZSQ3ZvUMfy5DhzGdZXLmQ@mail.gmail.com>
Subject: Re: [GIT PULL] ntfs3: bugfixes for 6.12
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Oct 2024 at 08:04, Konstantin Komarov
<almaz.alexandrovich@paragon-software.com> wrote:
>
> Please pull this branch containing ntfs3 code for 6.12.

The bulk of this *really* should have come in during the merge window.

I've pulled it (.. because ntfs3), but still,

           Linus
