Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC301A304A
	for <ntfs3@lists.linux.dev>; Wed, 15 Jul 2026 00:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784075123; cv=pass; b=NUSF2CsqYC1QzMIzgWUn2yX51FrhfdKSihTubrlRmaly+y2HiPk+PUU6Y2QQ6J80qtYmgmWo9zr/y9j036L3pSY9X/fQrSlOEc5eK3q9OYdlwPaYFwJh33a9mhrW9oD3O4Rn/7tJeEGMdgJnKg64xEGzBhUsJx7Kcn3snvBntvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784075123; c=relaxed/simple;
	bh=XfhPUbrymiVdSnM6B/pu7i6w1MHoki5738DqM32vVhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxYAQmm8x1YPB/8ToZ8nVoelwoQ77AlzemdOvOi3UphojdR0GyLGt3HunE5OhyEDk8qJSg8IZPtK+WrQDLgWcuT4WKHnGMMQP/sm+7uGmh74icbBgyziBRY8bQbOINg7KT9Cnqvl5en4V7ITdxr2U/yJ/aYGZcNC4AEn7kFiPdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J54kwc0N; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J54kwc0N"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cac59f8b64so55048855ad.0
        for <ntfs3@lists.linux.dev>; Tue, 14 Jul 2026 17:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784075121; cv=none;
        d=google.com; s=arc-20260327;
        b=Lz/KDrm4tAWHoap6XZZPCH4/LjC7W4W8RixaRLIvGbre9ZVqQqJYc0Nb1zOsZQNcS8
         cKiCt1F26cLLoejoU88X+QhWLrztaPgGQhSHXCfW2bsWg9mo5GgOPdQ9gNb6tCkn1hAo
         mN1ihz3HyNt0suJPFRL0oJk4y7doCNIquJiPxQr5P7VWUZ8CPoXpCTqPqwlbg9Z138eU
         CBXT783xOX4g2v2ilDJ1Ipu6vXGGAuzDkvNGNAw3bHxwKCKxPPFLCzgyiDbBdEUwcZq8
         B4kA1Fa8IpucYNsmOA0WLk3BibFteKP1VgxNZ5yndP49VrVmQ1utr17SKw+Qc0ijtbiR
         2R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XfhPUbrymiVdSnM6B/pu7i6w1MHoki5738DqM32vVhI=;
        fh=PDwEMmYbeKQdVGyrAAm0UXv0X4d3z/9WZPeZg+TNITQ=;
        b=Y4K2zQHbfhFAPYZC6MJ99iKk1woWIjp9agYLb/KIYvZgypV9zwxcGLlCa1Ugr8jYzc
         4zo9VcxAa4s8x4GnpshCcI8G+iMU1d0yJrCdQWiL33cbBQFLIbuC3A+E9TMsIS7n16Cy
         8lU0kejTkNgcC9RPjYvTthmctAtX4wyDrGAxIxgyCndSnUWoVm7/5mPL42Ok3pvVAufv
         If3hkpL1ccDZPbX0IMpDaKmHMkEsX5ERHbmdEUGKku39XxP/4Wt1i6DzZjbggH6/fxdI
         e6T4EcliD8CrZXjd9E8BdE0LZaeSbmv+S+DydpKBPTs4LOXw0xFrlDmJ3jpQVnNLgKhi
         pfZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784075121; x=1784679921; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfhPUbrymiVdSnM6B/pu7i6w1MHoki5738DqM32vVhI=;
        b=J54kwc0NGMcpBIFAGH3FIGxSAbWD8v/O+zYzIK4bXfr2fm+/kDTW3T5KOmY5fGJ2+W
         XPKAMK2zeFW2nG/S/x5xQLCQH6fs6Ngp6Vh5prLaIGdEOLubuaFD9khnZPxSFmyN21GB
         xciLU3ne7Ghs8eyZbETLv0dAwZgw+RSxPmT96mdjIYeUXr4/iMPC3dPI6v48P2U/F0PK
         2FUDyaInsmE8lN6j9cfR+ZTrZaboCy3Ij6DDGJUQEIYaLqMGSTYxR8l35VjsZQawtaKs
         0D7BRXgWiaDZf1FxurXqWfpSkFRm3syof9w90sSSARnqVHDo78EDb4fJ/cI9O/UNxuMu
         UuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784075121; x=1784679921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfhPUbrymiVdSnM6B/pu7i6w1MHoki5738DqM32vVhI=;
        b=NwuP2R6hMTcfoqQPIe7zquJzLbmQjqvI5prfEQ5uKo2RY2wRTvXRqWcs6Tro/LduVa
         ikR+IMiO7BK1fAeKq/Ss6CMGCQCvrqCCAN/agYVEIeEU85Or6xQpjtcM5bF7EO9w+iM1
         0OZ3T83nsWZpTX1DqxyYAWkT0TGy9zXGOckMb8X/9viJhfbCoME3g0Untr3OMZxTJ/1P
         yF2pfAaPpv38Ge42c85+xKbCh10GhImJHMFuATAx1ndlCk06LWnAYjNTesDdOX6xEKuR
         HpJnwyTsW6a+UT8q6ZbBSu5Ki1jJFxJMLShNYt6a0XpzSFq8lVd24MyuYm/ZtF3aQj8H
         di/A==
X-Gm-Message-State: AOJu0YzgYaEsAERsgVNdGW3cru3ltqhLNeoYLSAO8Cvf6O9YDyMM8FJk
	5iMfriLFxS+501k18BdZDJqc9XdHeO4zrRJ8N6lrNRWRpXOpoEavOOFPdLwDX0hKZasz4WE71dG
	ObyDxNDcX+IjS7vTMLW0TYNOA/IoNFNxl
X-Gm-Gg: AfdE7ckoHQk6fOlf0cqpBp7T7uIx1myC2cbplQIUI0CW5AnVWsS5IQpldgG4wn89V95
	2NZ09OSDz9wXOZ4yrGWzNeCUTUPfKEM3eGEc6YcGZHtHXgRJpCUg4uocdjk49TMR/O5SPFcpzTM
	H2LI8R+WGYntqswtJvs3OVoBu+I9OTn2HD/87F2EfiXxUOK0LTEnU/o4UlrIagiZd2xCe51UHri
	gbSYkTsS9COYWrRPZnD2INvsyFjlto3yDyJq7smpioB9vLqGYdMbuyOufN7Uh28tHjcxoRq
X-Received: by 2002:a05:690e:4401:b0:667:ef19:6705 with SMTP id
 956f58d0204a3-668132bc04amr496695d50.12.1784074774586; Tue, 14 Jul 2026
 17:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOSSAUCpS7SqevJ9hnSbLHFK14ijnrKM0_RihO=1hmDD2n9-uw@mail.gmail.com>
 <949338905.4535069.1784017399327@mail1.libero.it>
In-Reply-To: <949338905.4535069.1784017399327@mail1.libero.it>
From: "J. Ortega O." <jorortega@gmail.com>
Date: Tue, 14 Jul 2026 20:19:08 -0400
X-Gm-Features: AUfX_mwv6yIJD05ig0DKDy8HB-ODZtRgd8CuF-QpDaiKWdi5cMgOvPcL_soZxS0
Message-ID: <CAOSSAUDME=eD1E2QS8rAuX=AEbYCD_6zTEOaYbtuhGiUyewuYg@mail.gmail.com>
Subject: Re: File operations on NTFS drives causes kernel BUG at fs/iomap/buffered-io.c:1061
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com, saarthal@libero.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok,

In the end, for some reason, the drive accesed in 7.2RC1 became
corrupted. No message error generated, but the Dirty Flag was keep
permanent. On windows, trying to use chkdsk didn't worked (As
administrator, run chkdsk d: /f), neither chkntfs worked to remove the
flag, and neither Linux utilities worked on the case.

In the end, i just reformatted the drive.

Not touching this thing with a 12 foot pole for now.


El mar, 14 jul 2026 a la(s) 4:23=E2=80=AFa.m., <saarthal@libero.it> escribi=
=C3=B3:
>
> I don't know why your message doesn't seem to appear in the mailing list =
https://lore.kernel.org/ntfs3/2020820791.1843094.1777717495048@mail1.libero=
.it/T/#u
>
> maybe because ntfs3@lists.linux.dev is in Cc: instead of To:
>
> 08/07/2026 18:34 CEST J. Ortega O. <jorortega@gmail.com> wrote:
>
>
> Seems to be fixed in 7.2-RC2, but now replaced by keeping the filesystem =
in a dirty state all the time.
>
> Even a clean umount will leave the ntfs filesystem dirty, including when =
no data has been read/written to it, only mounting seems to make it dirty. =
(windows always repair the filesystem in the next windows boot).
>



--=20
Atentamente,
J. Ortega O.
