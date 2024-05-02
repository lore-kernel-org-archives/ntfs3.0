Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DFA1635CC
	for <ntfs3@lists.linux.dev>; Thu,  2 May 2024 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714678748; cv=none; b=EY4HnypVzbfhxRw9DZayh8AD7NJSmPMpSTqgSevS8C1p6QaDn7ZmtMsgJf6r3j08r2x90upm3vFuhsSJAer1fhEdUVGHmNRP3TcZTn8+AwdvBKUPfznamdceTQ+/FOJ0ymbVsn869mGqgE3ttaI5ctQJaGkA8GVAHiShoylJm1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714678748; c=relaxed/simple;
	bh=EMeo+MPEyevdiLlr0C89fu0wT4C08o+FUc/qGZalHBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=agN6D0rLijsj+h0h3UayfHbEjQAJyXUuopVOO9Y9DeFJx+zL9t0WqFpWGZID6NBtLaowfZc80Acn4fBVDqXBUHjFXfBGKGddZ7/q8ieiy+lusnc92TTqtr1eUk4fF0DihVNhYhG+gWr1hol8MXSTjln2nHO1rdlml0zzkyV9y+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNRmXXAN; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNRmXXAN"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-602801ea164so5706277a12.0
        for <ntfs3@lists.linux.dev>; Thu, 02 May 2024 12:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714678746; x=1715283546; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMeo+MPEyevdiLlr0C89fu0wT4C08o+FUc/qGZalHBA=;
        b=eNRmXXANm2fO8TVNjZFTwzmxAQZ9Zd+e2GgSQWJHtTaM27xVPMFwzgfMqQFlywILrd
         LzyGDdLgBR21SHpW5SDJM9ynhEOYDvErMpBsBGA7ZN4NC02UaU0oTQv+qE+Esoy+U107
         oPblrfaTsoqCi1aBUHz20SVtGXtZXK05jntbEMa2eR/CX4poxG4MG+64LP9Js1BuvKXh
         mqjtc9kiEckrtQYeKPg3S444/iCYYJZEDmd3Ut9eWEj6im/1faXM1urFE0c0v4ZXjwPN
         JU+B5k3R2hG/awiMFa6So+hO2tMVPfneM57tmm++1q6rerhx3xDwuhlhnajWtR9spgMz
         rXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714678746; x=1715283546;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMeo+MPEyevdiLlr0C89fu0wT4C08o+FUc/qGZalHBA=;
        b=wNvTZLEaWAltEqmseOzjrY8VdcSHg3SIrtoszlfDroK6I7QuGAsXlI1C85Jgej+rBu
         7ct/xKVUWPbpHtkiTzdN6jEZFxRHgVjpzq4BVxIWjIhpux0baaiIwZ0XWVs7KkqmuIPR
         uRQXLeuqf2abMau7dlvYbzQOKKFCuAa0taAzH4L2u5IApNEbliF1HdnI5wYcvR4k2WGs
         7GLc+NvXP4wmf+Jx/Ag2GIr4i1I4OhAYD1UjMDJTned6I2z9WA4ly08V/6nfWZLIB3oT
         fr35a94bYZmsPYn6U6vs1nsWijMMNfHpb/Pm/0F2SKgcEqcwBo86JDXOZck2c6XfuwD1
         tB5w==
X-Gm-Message-State: AOJu0YxAB2pYRAOYO1AyAYo/F90z76c5QeNy8RVsq8Yia2tSW0IKD61e
	HfnwrG41fgNgZo24bw7kQITAQdGAlp64LwJ62NkG2Pex2xQDbK5fMu7BoBy8+TeWEUDo7rSUvYr
	SRQMbpnh6UBoqEBG0tv4ZHrllicmg/A==
X-Google-Smtp-Source: AGHT+IF1/16cMs6YzmgK1gpy4qYeV8fr5ppqmtW/j+WcySjXcXrVDkWXC7jQEuB2PAfQS9HrNB6AEbCFhBpw4Gf1Tzw=
X-Received: by 2002:a17:90a:c697:b0:2b2:32c2:44b4 with SMTP id
 n23-20020a17090ac69700b002b232c244b4mr855036pjt.10.1714678746242; Thu, 02 May
 2024 12:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAN+za=NCAmgf9Lmc9qh6RC4TRMxHAimzm_qgXhF-tes0nChfyA@mail.gmail.com>
In-Reply-To: <CAN+za=NCAmgf9Lmc9qh6RC4TRMxHAimzm_qgXhF-tes0nChfyA@mail.gmail.com>
From: Philippe Cerfon <philcerf@gmail.com>
Date: Thu, 2 May 2024 21:38:55 +0200
Message-ID: <CAN+za=NX-KhZNqaqXUZH7=7TLBxSmAuOULyuCj0cNwiSZrNueg@mail.gmail.com>
Subject: Re: support for Cygwin XATTRs in NTFS3?
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey again.

Seems like that:
https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/wdm/ns-wdm-_=
file_full_ea_information
is the format used per single(!) EA as given from system.ntfs_ea (with
some NUL terminators after the name an value which seem to not be
counted in the length fields).

Guess that might be more or less the format that=E2=80=99s also used on dis=
k?

Thanks,
Philippe
