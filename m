Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379168;
	b=YfbyIrAWGHupUEtfJhUy016giwhOw/M/pUFUAMf1ELoB7Dt3Hg9HhLTZhIJNZM2WipgV
	 R6CtGkzwwheqF9S6RPmqS9Ko7vI6MDexDhzbXXasa2CM9jWM3GUTzsp1qE1lU1Q9yHsdk
	 GyGUXCIvO4EAcNaNyoS1cmh0jpptmlziolLPTvRQ58xl7tjh3P2zo6hqUdxqAAaVQjSQ/
	 DoXJbPwgqEO2lIu3lKo38b4GIIgXsz80y0ekDiavTrOqXVUgPzgc1vShJs1yvslKFSBdL
	 BSItpIWdMi2YYLHEVk4MJAaO3BZXoyiL/jRHm2K9JlsUZ/U2PgpTRNK92l1fL60Lhng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
	b=w8MfqpF1EV/2lZWNCUcQqr5JbPU5QY/Yze66FXI//fJgR82blDzPjuK6WZNcvTwH3Wnk
	 uy4jaNXdOE35YUXRw4Ggyk/ufCBC26Xh1NvAAjwE7Vc1A3cg/71mM0Pz0fL4B4dZ2UdXk
	 Gy7kEyy4EIBXq11H4/JISihmWCHY8BrDf6PvQ6EwyyxdGScW8Q2+gDlfR+F++E4RSLgG4
	 1swxjmM1UuCbq/naIg3rhyDCWwAgnG6ojDk6x56lCcbFe5pCO0ciBVWq3I6egTAoRK2Yf
	 t839yNg53MaIVtgHnTvxegthUWviuX0JhCS3DBMAi2jZ8rSgm5+y77sOSvkT1pRqgqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bynar.io;
	spf=pass smtp.mailfrom=bynar.io;
	dkim=pass header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=gTxHWwKD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C3D606A32A
	for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 20:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C3D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=gTxHWwKD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5814755eec.0
        for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 12:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795379167; cv=none;
        d=google.com; s=arc-20260327;
        b=APdqZPsQ2Ro5B+p4wtD3uCsZ8TA6ogz4DrY32pJYKOmMUca+h1SHLCfBpiTd8TiSxS
         l6TGjzjHyJwahrnuXx9AIDdH+YGMoL/EUmaKGWIe7wfjx+nzBxqG2qpFwBvFN5MkoXby
         H9R0vGuwjRMLmzjP+vEHIkpX4SFXeEDCfZDX7S8kS7v5Evk36hKqpY53PHSVVz38eumk
         wzVfbquUEblZW0jG47xWw9u7pyUd79GW+s8GyN5zhiHZGVjnLazqL1wlUK/GK7nkc0ft
         sGrr7fXkl1KDTarzE/PzT64lNPGfZCE4CnFeQU5ybAN3Qnhh6PuXZoPb4p0U4RUDmKg4
         5+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
        fh=EaRh9Y+iEUxYOfE3k3H0I/U0z0RoIcoWdL1YuzMS+Xo=;
        b=kWGgLR+5Lbc3xV4IvaRnns5dtjyxE/cJlMz1WDxaHmza9u3wMNT+9rWOh3ZgIfn7Ig
         btwGbSP62C1Dz0keUt7PNZ9CgslFMPgtrr3jAmE8BvfL1mHgZjtHYVTv0OUg/4Wzs/gu
         OFRx8JclSM+QL6IJIOl2TvaEZXjXqUkLjOCAip5pzV8ceToh7OjxprjXrYTjUiEqhio3
         GmicfkO++xTUBmXDRank2hDoAYS/D4ys7A2qWyiZaHbCCuOQsIJb2OVaiLZ5xUb3RQNr
         MWXsQ/1lrBZNRF0fRajrB0Y/6Cfwgh8gZr2fantqMVCsO/OKrKlJ/gmwqC8sbEwH0Sya
         z3uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1795379167; x=1795983967; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
        b=gTxHWwKDi6HUhnA6DoKPR7Om2Y1ZU0RFbJltqKh5T/969+lb8cjYzCWUiL5y+qkbSX
         WXVf4eaqZBwxxsipO6x7vMYbwJzfrd3Gj2lCYjTprLlPp3n5l6J34svGEzjZOvEkIHMB
         DWvBQTBCHC2nExd4h8SPzcSdPOmSzutvOB5VWkE4uceI/1SGnmcR0Iy6xm5VIreppfUJ
         0aeP3tk4tF5cJFYEAQf3pgRbauZbeDJyxxQL58jvYicBWz35f68XIUl6TVhG+KzOCMcz
         f/P8lK85Y9uL2O1T4r481z8px700EeUahQivkewuOo4uZT74xgDrNCy3LSaeML+/suBU
         Y1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379167; x=1795983967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDO/H+Y4L9JRvwYDS18T8LLRtt6pdAf4wwDTNx1nY+0=;
        b=wSwWkdqnf2ToW2lgs6feUD4rQ2S1tMRXMowuL3MD8Z2c8HBx48BXSwUQNm0AEtMyJV
         udZ534f2pdYTl3m1eSzkLvhHxgoUcNRmtuD/FDePSgIzZpx0Cre6y4+bVuaRpg9XBzGL
         F/pJaZUeXNR/E8Dbf1clo8S5qHtgNIUPtbifAFEFOF5nRyg6lTuaG20jvTTYxU15dVmk
         wCYlWFOsvxcmm3XODBjTxtDn9wbUKqS+F/jfsy1pReiTU8+6AT/5or/UCvZERH0vkW9c
         5hhy1LLJiVqI8J52q+SHdFivzFrSREOcReR0xlEdXIU6SSaQc2S4SJD7mYkWLaFysC6S
         lsvQ==
X-Gm-Message-State: APuU4Z+dwfm/73xkk1dWpPwQkZf3pdVdAYn5I32GwK97RbmM+iyAr/mA
	alw2rS1UDJYnngaU6/uI2ULhAbT4XoaYYOZHCsUTnP6N9fKxxsSMmKMNKIPjc3ZlmvsOFFRsnQu
	78mT1jwAwwKKHrhaOlZ/7ZOTGohwmi9TOi5/UX6MaRVM=
X-Gm-Gg: AZFdTZdzbxlUGaYH8SV5dhznjkYFvjx5VIo88MYGmqZyQ62CN3+yetlUascKS/z7MRe
	3wg4Oy+CXN3BL8xk4k/sOOg0xVKC3rAyfYskEexVKJmpWkH7y1bRHhQ9WWhV1C+CFoZCWAThQTn
	ENiWbJ3xM3AVHoIAycsH6S49L4Ut9Hgsr5MksP8wYguZEHv3YTAWuPkYJdePxeERG3MUYv51jfy
	UVifU0Eak7kVdZDjsTeRiEXqP6+ca4LL4HcaB6Fy2ULhuvk0UVohhIuhp6QfQWrObGxvJNtHQhB
	XiOsnAkQPhI3ITJEBVdmkdUy3IBEqWKTDRYWFslb5doggVi0P/6bewOFLa0VXwUMtAYCD3UiHCd
	fEFHALBN1SAv08dfSSgyqpjq3o6e7C0kqLtDbxPWQ7D9IYs1Ym0Y7fKbp0DL8Xj3gO3VAhD31fi
	nHcBEDn6UuSS9KmqOR
X-Received: by 2002:a05:7300:f789:b0:386:abe8:32b0 with SMTP id
 5a478bee46e88-386abe835b7mr2204957eec.8.1795379166697; Sun, 22 Nov 2026
 12:26:06 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260921192157.102738-1-giulia@bynar.io>
In-Reply-To: <20260921192157.102738-1-giulia@bynar.io>
From: Giulia Aloia <giulia@bynar.io>
Date: Sun, 22 Nov 2026 21:25:52 +0100
X-Gm-Features: Aa3M54rOmMhwAvSgkjb5fv7qpYvYexK8dK-gFzayc0_5cgFNHRWVFllEYMSHLpo
Message-ID: <CAJzojTgYzOMHfTxWbQe0raaeFsyjSd7W-qHUkFUd7bg3Ppksmw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fs/ntfs3: tighten restart-table offset validation
To: almaz.alexandrovich@paragon-software.com, gregkh@linuxfoundation.org
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cenzhang@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Just a ping on this series.
Would you have a chance to review these patches when you have some time?
Thanks, Giulia

On Mon, Sep 21, 2026 at 9:22=E2=80=AFPM Giulia Aloia <giulia@bynar.io> wrot=
e:
>
> This series makes NTFS3 journal replay safer when the on-disk restart
> tables contain inconsistent offsets.
>
> Patch 1 checks open attribute offsets in the dirty-page walk. Patch 2
> checks transaction and attribute offsets in check_log_rec(), including
> nonzero attribute offsets in records without LCNs, and validates
> allocator offsets against the on-disk open-attribute table entry size.
> Patch 3 rejects restart-table dumps without a complete header, rejects
> short open-attribute entries, and requires the transaction-table entry
> size to match TRANSACTION_ENTRY.
> Patch 4 bounds the free-list walk used when allocating a specific
> restart table entry.
>
> Cen Zhang's earlier patch [1] checks target_attr at the redo and undo
> lookups. This series adds checks in the dirty-page walk, in log record
> validation, and in the restart table allocator. It can be applied
> independently of [1], but [1] is still needed for the additional
> validation at the redo and undo lookups.
>
> Greg KH asked on that thread why this should be fixed in the kernel
> rather than in userspace fsck. Checking and repairing a filesystem
> before mounting it remains the administrator's responsibility. These
> patches serve a narrower purpose: if journal replay encounters an
> invalid offset, it should return an error instead of accessing invalid
> memory. They do not repair the filesystem or replace fsck. I am
> proposing them as robustness improvements, consistent with the kernel
> threat model [2].
>
> Each patch includes a KASAN trace captured using a crafted image before
> the fix. With the series applied, those images were re-mounted on the
> same x86-64 KASAN build with no reports. The series builds clean with
> W=3D1 after each patch and passes checkpatch.pl --strict with
> GIT_COMMIT_ID ignored for the KASAN addresses.
>
> [1] https://lore.kernel.org/all/20260901174934.6275-1-cenzhang@linux.micr=
osoft.com/
> [2] https://docs.kernel.org/process/threat-model.html
>
> Giulia Aloia (4):
>   fs/ntfs3: validate dirty page open attribute offsets
>   fs/ntfs3: validate restart table offsets in log records
>   fs/ntfs3: validate on-disk restart tables before use
>   fs/ntfs3: fix out-of-bounds access in alloc_rsttbl_from_idx()
>
>  fs/ntfs3/fslog.c | 110 +++++++++++++++++++++++++++++++++++--------------=
------
>  1 file changed, 70 insertions(+), 40 deletions(-)
>
>
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> --
> 2.55.0
