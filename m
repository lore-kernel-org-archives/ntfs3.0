Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74161FC8
	for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944148; cv=pass; b=RZIg2h7EhYVG6C4nfidp90RYL6KdGFfy34su16c0PwUaBDW1/cwZ89e0G2a/nC4sVamitfy/A7r2vpfJb3pudcX3nuiDb9aGm/AD3hkxtE4w36oduho51mfywhFNAIUqEu1SNJitlHLN4AwpNsrrUcrDglNc5K3E7jt10INxc38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944148; c=relaxed/simple;
	bh=W34bohqj6NVjitFaM7neiTDZMzYmk+K1XRzz8FSsYpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKfEOP0RCdElvEdJp+Uhxre3rzbLRNNA6QI1Or2/08WXxNO2s7rvrGmF5ixKhaqS4VCmMGDpR29oXKig1iylyMDA8BpnHjZO9YNQrNwuZdfW8oCWKQBpN0X6wkwbp06Rh4dEu+uLXw5UHYTZtC5zO4HBLrsF6HqQXp2HgMvqquk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nlEKRnpc; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nlEKRnpc"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so4954953eec.0
        for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 04:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776944147; cv=none;
        d=google.com; s=arc-20240605;
        b=XNkPC54r6L1r1i33QMw6LSLM9ZjXlqeVEKYaEvMgHU88iMUrsm3AAkVh4R+GbLh2Cu
         xYMa0aVMZ6ZxQzFO50Yl22doDDIxvB0QMwlU/k1rfE3aqAnQ4/8PA118TqBXfzmLF+i7
         SzLaldry3XWv2HYyQR43ekSgPtC43P0T1WodC3XXPMmV0BMo8THfsgcUoCD9lQ5rV5iX
         m+z+dTeWKUfwok3pLD3cPexjRVLwHWLnqSI2HrtTy3vYyA2I3PtTQGsOyU4lnCNW/u8Q
         c8JemCq3Kx7HNFrdBSiNuImfkYtYITAdxxFEKcLruke5Pm9Xq0IGrCWL+KonAZQ0mKRh
         C/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W34bohqj6NVjitFaM7neiTDZMzYmk+K1XRzz8FSsYpE=;
        fh=Pvnno/N8e6fXU6jCHOF19Vuwz2/X+IpfHcqjdo8izt4=;
        b=isVEwfqpV2MRJJkAy1Irlevkc66oJUJZWPmgp892gWsJP5tFX2kRsoUsEwxIswAVQF
         at5bS6ikDQ2W1ATxMjm5Vfqi4k1EJpVj7gVRFM4TQuzrsYX+F60jFkJvaYwHmaQHWzYJ
         wxtDWXZL70vc9tA64aL3fgR1OtPKoJBTDhAIsYqq2kzZ0eucTU/YCOXXU1qCB+Ca2Jhy
         aemA5gRhuY3A69E4f451PnPsNviUFNZTjn1q7z00l39Kn32KDQoz28mK1I9d2lHtBZ0F
         wtWYy7rITGbTTa/rC3C2TvWYOatOtj8WWFEZCkGbWYKHPwC4qipCSjUkpzPB7isCsgJb
         rMUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776944147; x=1777548947; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W34bohqj6NVjitFaM7neiTDZMzYmk+K1XRzz8FSsYpE=;
        b=nlEKRnpclT97yTwn+gbTYuZuxLyeg0049CEM0CZl743jQb8By0i3bkPi0O7YzT/2QA
         ofAbm0xuNWpkXDhgRwZVO38kP7ZSVTlL9XtqOmqjYcz0su8z8C8+IHtf2ckiGFDAHn5P
         nDbZjy1SuYp1MPUVpsB25kzZLV+7wMpy7jdJlZPkN7LQG6bhNWdD4KBCWc+n0w8vRE0G
         RSu491aOhvSh88NXe9nsoEqkT+eOju3sYI89d2FgdKhCFeGeIucvoXhfEDtv0Z3mj4ne
         6zYiTE2OpX5YkqomKFbUcMpELpXDpMZD/GToHwAFoMBQ4Vf7ndYRTWMjnbKIoupc+dRx
         wz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944147; x=1777548947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W34bohqj6NVjitFaM7neiTDZMzYmk+K1XRzz8FSsYpE=;
        b=dcxTNWjVrV/gNluyoGvvnMvfYlB6jdg+dfQrKvMcwE8rlkx/Ks94vCrhV02ybAKIwd
         7lOmZaUXszb8IFKUXwzBhX9rJo6z/hDsMSXXABWu/hcNrYZbmrFOxBdUqFtBlAN7E5pY
         XjseGzOdjAbCm5qZQ9BiwV6ibha906AkX8eBsgdGykfAzkonByB/Qu1ZuLAd9rY7tQ/o
         +irkRXxpnl6MIJwUWTwAfQXUGoKyQIRVb7KVeMgccbLXoKQvztMUXeELKfaz45XXCXJn
         9aAv7YuKIbwDfu479Jsw5DUp9Fa7G5mqkM5mGJJU4sw+C2GaoU2PqChVKQ1G3F01ayvR
         pE6w==
X-Forwarded-Encrypted: i=1; AFNElJ8kO9J3yprJb0Ru8bGSos1gSPg7TrBG3fIYR/yu2AKPKlcOJ6IAEeQBxOyN9PSWWou3V6+mXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzatW64LnZ/Gqt3Bus6pQrQOfsRzeZltEWFTDEHlOow1YXr8qlq
	mHbRmSs3HZhf0LWhycPz9IMVg/X5Vxd5ny4NfrO9L0cyU0avdZfkt0FFhedoV0E65y/tVGTLF5v
	dMDMQZNV6oJCmPtJpnFphHSTRmSQHL0BtqjZvZ/L7
X-Gm-Gg: AeBDievFxoEG9hJJ9/nR9v2WVkwpXxyuMSBH4fsiwnxAR4MCVvnDW7kAQGrzH762GEs
	t8nKuPIVJGSNPU1VEBEOjLtjWjdomtLSACV/Vq8d3W/cgH7pezoSxh74T8aYTKjZk7pdeK5wvR3
	E/bkrOTTL7Ewk3RVltxuvyHNkb2+dPA0RatCuKvJJ2Mc5Hqoif52Kt/bfZeQmK/HNgOrKEEivVZ
	rv2cKyErzxAH8TmfK8PcGwURq3gYnrZRLvy7dx2BQC04lIvWyWTClw084shTDVKPeh8b5KjM0st
	GeJmZBhbFOEiRWSuFc8quAjN9SyT8ybGFbSl4D6+xu0tBayAx3kyxhW+f2s=
X-Received: by 2002:a05:7022:6988:b0:12c:2e07:3fd with SMTP id
 a92af1059eb24-12c73fae684mr15937883c88.32.1776944146143; Thu, 23 Apr 2026
 04:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com> <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com> <aed5LYnQvjgWm5Rc@elver.google.com>
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com> <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
 <49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com> <4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
 <f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com> <CANpmjNPLozCUhARwskJgA48OCGBaSsHFhoRpgmfCmnOZcY+mNw@mail.gmail.com>
 <20260423091246.7ffa38c4@pumpkin>
In-Reply-To: <20260423091246.7ffa38c4@pumpkin>
From: Marco Elver <elver@google.com>
Date: Thu, 23 Apr 2026 13:35:09 +0200
X-Gm-Features: AQROBzBdOFBSZJ6g-8nNwZoMuLVYqjU2YRRmcqtfFKDSi2H6sZGA7ODRPqEKjUk
Message-ID: <CANpmjNOzsu8fqEr-qfE8LZbVUUUdoqjBojxoXjiOoR7Pzr+zyg@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 10:12, David Laight <david.laight.linux@gmail.com> wrote:
> On Wed, 22 Apr 2026 23:50:22 +0200
> Marco Elver <elver@google.com> wrote:
>
> > Which means the simplest fix is probably the absolute_pointer() one.
>
> I'm not sure that using absolute_pointer() is right, it is normally used
> for special conversions in low level boot code.
>
> Here it might just be best to explicitly use (void *)(long)addr.

That didn't work - tried, and warnings still there (GCC seems to see
through it).

So that leaves:
- absolute_pointer()
- __diag_ignore_all wrapper (mentioned elsewhere in thread)

Preferences?

Thanks,
-- Marco
