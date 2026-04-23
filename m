Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFC7351C22
	for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931971; cv=none; b=fH6n+t8690XPQcV3fBcOXij8IpqzuKehVTv/zJkhjzJS+twODBMgEHNn4f7YGQc/WXU4uEKotfXHYVULWAyRVqQTYOco6DEKcS9orxiFwICPNOaaWzvpFsrE02XMnN3pxqCEUkgiX+jbMSNMwohkWXDNGxo6YY9K0PJ/IW3dTfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931971; c=relaxed/simple;
	bh=0HN/Tu4zYgMBLIl0YAkCouRtizkaCrsBW0EkrddUlFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rCkahVzeLMkoLfWDClC0piZBbJj6aQrDikl+L/MveTUyCT1Chim83S6+EeGyENFWU6vCc5nfugoUCk5vkv/cXKNwE7sGaStoTH7AgVtNdcihQluMv+nCrcd43pcrID+HCvnJijmyglwnVHcHheHCyC+mab9juLmxNqhjWZDozm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elh9+5R6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elh9+5R6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso5568414f8f.0
        for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776931969; x=1777536769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIitABbzFrBo+jI0TZjBOkCfwx3fb9iN9G0AiTd8KVM=;
        b=elh9+5R6Jxd2G04iRXspChndRlNCUlp84tahdu6tEQc0T+8m0vOvomhNi1J04/VUQ3
         ogJ6T5A0ZZXL229RBy92U5QB0TYPsycmtdA1IQdO9A9jOdy9zie6IElrn13OnC73aTfe
         HVn5HNyFjl3CB6Mtwl4tMTD6Hjp5nKNoDvMBbOK6Al9xQQ6XBeF77yFq5WAgvGwwlOpJ
         nn2Hjgo7KbqsOcXSuUYdfZ8jwlUemoue+Y0ZAaLrMTbr7DTPcfkT6rmNbzrvvSaaqG89
         yhToogfv896w6ytWmtIxHCNOUEC2kwX2vz/WrezFiJ3tU32xk0NdDn3k/O4PtU3v4gVf
         xT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931969; x=1777536769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nIitABbzFrBo+jI0TZjBOkCfwx3fb9iN9G0AiTd8KVM=;
        b=prMMhlXcjSYrlGUzUgPcNZ0njiFDUx4x8dqD2ShoGEVt14Lpmrdwr+f5+3OVeUFav7
         1XsVwtUWM1kMCxmbnBxZ/7s8yW26SdSl47G8PX8z0ZSoDjJDsgpDaijzyihQqWk7R06P
         YFCRTi8GfP5pEHrhJc30N+Bzzv2fy6D1tOi7XYYXmUit44raQiVqfqUT54xCHcNIvo20
         pTlfX0BHIO1vZHHVLEecjhX5Fua+qgYl203mq/OlX4jgsR9mG+zDBwGGEvWnj8/dyilM
         LGBHXMGJIX4eUp1oae9LYiS2Zg1mqbl7FIlGKkX139riZLQ2tXIqdu2SnO7TODkOLyjO
         PlWA==
X-Forwarded-Encrypted: i=1; AFNElJ9gm/iozIORFbfYNIpKfsB17ssOJnRpxguiX1p6iWs90P3Vg7QhtEVMHNZByW6FoymNlEytlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxWCmhKa7XHDMfZ3JYTHCDImY/juYdRBXpq4s3fKweFees+eUR
	Ggu4ai2G9OYBhgVaerr7MUeQj1retL3LMWo4OixjvTJlrwdsw8V2cZXT
X-Gm-Gg: AeBDieum0pdbL9xL4USxkcyMjzEqJLU5DYi1XIrzvOpLrE//GorWcZRGZ0pJPlFpHC+
	qaodmlAe+k5knzRFXMFeMZUldxaeuga9jBs71jng1q0jOIPaZWkOqNKG+8jNUHxoYpurRnRSZvK
	2sb7/k1uGCU7unmGC3lLezNOBkqFVNGv9df+O/178mzRp7ydKPXBemLeHUgHLnvWA8CBloRwEf7
	lR7bFLwGTyNG2nmDuyDp0Z7+NiAMg70s7vFdCjTirAm1rhCBhi7a8uHq0qmhGchu68OizVwrTLT
	BiqeKTD8aAPIGRmdvO9eOjqsfRxNdhsIPXqx/Vek2yqVQ0yuipPugqvWmjoxsbLHYkxfGcn4uF4
	Jbvfwj/o7oa7OjKxKEsDF5xr0Dx5E+UI2Giy479v54kfttdcpTbvdMpaFs8sQF98qUYrquXPexg
	bpUd9CqQdPydote82Qc2J79721p56dSOAL+NbXL9CMSdY8laVMm1H6KbtsrzJaAsplyvA+fHJyQ
	SU=
X-Received: by 2002:a05:6000:2389:b0:43d:7a97:78ac with SMTP id ffacd0b85a97d-43fe3e153a6mr37830279f8f.40.1776931968154;
        Thu, 23 Apr 2026 01:12:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm53083138f8f.0.2026.04.23.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:12:47 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:12:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Dmitry Vyukov
 <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Message-ID: <20260423091246.7ffa38c4@pumpkin>
In-Reply-To: <CANpmjNPLozCUhARwskJgA48OCGBaSsHFhoRpgmfCmnOZcY+mNw@mail.gmail.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
	<CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
	<28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
	<CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
	<0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
	<aed5LYnQvjgWm5Rc@elver.google.com>
	<6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
	<CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
	<CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
	<49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com>
	<4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
	<CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
	<f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com>
	<CANpmjNPLozCUhARwskJgA48OCGBaSsHFhoRpgmfCmnOZcY+mNw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Apr 2026 23:50:22 +0200
Marco Elver <elver@google.com> wrote:

> Which means the simplest fix is probably the absolute_pointer() one.

I'm not sure that using absolute_pointer() is right, it is normally used
for special conversions in low level boot code.

Here it might just be best to explicitly use (void *)(long)addr.

	David


> 
> Thanks,
> -- Marco
> 

