Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6058B28980F
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798409; cv=pass; b=E4BtaDwGKQ4EJ++jca+7GlSTnnyW5DvNJBo3MQ0MSmX6YIIhDk5gP7n6YzUPgB9z4qUak3W9KNnXXo5KKvsuf2AdE4izlNPNye6yUiaXX+YZSgo8pguiaHxfMCjAfO3y0Abrb5N+YQCJf4tZr4WJq6dUt9DGESV26xvdxF6qm10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798409; c=relaxed/simple;
	bh=WrbZJBt3g59mMK/v19QF6ZmukQ2Sq7rJOsonH5m7goE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lscMFykJ/hWZIvYF+misXdJKD87d/SfRIh2e3JJ9jG95+FNZAjMvcy/+uZfqqcTByWMKjOCEbk4tOk4VdfNAecbvNTrYEdsvs5xkLLXrxwGZovNr4DOUOy+I7O0JK11XOYgBnS6Co/iEv8OMYbm/wgqAfoXDC7dIOgo63h3RspU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ifb/jy7V; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ifb/jy7V"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c637089ccso879c88.1
        for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 12:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776798407; cv=none;
        d=google.com; s=arc-20240605;
        b=Qgp4voNkeGXJQrqS6ltYYIgLOE6zvfz5dpUPJbTkyQT++mdWVIEulbEx8hODwmvbBz
         BOskTiAyGzMiAeOVmJiA4RwPI2OLpbQs64f6au2t4Djy3Ej/F4dQNn1wdzwYJ2aI99dn
         jiC4LZitQBSIORHdnc7ZbzHKgLOHWGe2kntL06Gkgv1Rhf1tAR5wWLLP1QjRejIcOfPh
         koNMf57wcY8ys28bmRuLz8cHv53wfbotK1QktXsHSIY39KFyLNTYfMgOg6uxkUQ8RT9L
         F4STdc3TT4t3sIoIzOHBHg3DKij8d82vILj8f/tJ2OgnxJ7VxZCSSGd9qjzMm8zATbNn
         K6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WrbZJBt3g59mMK/v19QF6ZmukQ2Sq7rJOsonH5m7goE=;
        fh=AlsiUjkVsmIewnD4/lyD2A6C8/ThLJpqkflw1SJEmx0=;
        b=U0SR09WksHapSVRS86dQ+RRfKAStGikPP3hNkwUYtQFm60CkUxUiJ71d5oU6zzzjSK
         2V3iXpIO+DavS1wak9KPOlLz1VqdNiuZb0Eyxj7GJB0nF0+bitQzne49zw2Y+L88h3gK
         zvD200Fn9urY4gQNRo80zgbg5/G3eufuCQBuEWIeD+jzWnt4x8PsSYPxI40GZB6op9JL
         FMY8SSLkCqxhmR7i+Y6Wj+Xsfg7WTHX4Guz4KzZ7YUSy7sQsct+fn5JjhoOD5prw/AuR
         7mUF+xUJXm7RlKcs7P/0K5rm04+Bq0jxs6RSrYlyPgJwrLMcx7ETYF9OhKl5v9oFsS61
         gKUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776798407; x=1777403207; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrbZJBt3g59mMK/v19QF6ZmukQ2Sq7rJOsonH5m7goE=;
        b=Ifb/jy7VyOfjEIxrKnllZGHzx97kuPyWQo7hxg6mHWv8PrX0kR/3jT1xj3xJGct+zx
         bcmHxzkzYiWziNcHH3/sQZCYPxQJd160GE1YuBZcLP2T+MXcAbf3jfjdEhPIpsAM1eMp
         TjBkDHoRVOAm+rS2Yh4/CF3qGpWN253AtlioM5kdsjd32psadOm8rDW+fnbBAzUSKfn+
         JOGHtzmmNI4wQ8/Qa5D96/m8v4Xg4/hmmpkDtw84OrGDaG5bHiKuAO7CfM+gz8s5QKUy
         6f1vg94Jqh8yaC/t8VcYoT6SkIZEyuwnGUsOiTR1khP9lpDfY8DLEfqZimEvKswJb0p0
         G+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798407; x=1777403207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrbZJBt3g59mMK/v19QF6ZmukQ2Sq7rJOsonH5m7goE=;
        b=dqOpnPUJhsN8jyyzm71//3GE9Ac6WWgK195UK6JJ/WrD8x9mr9WlYj67R4e905gOOT
         iibQ0TEwH71WH017E16VGE1HBpkId1lVN0gtMjYlAtIWr9JBo+LzSLQqn9aN9y2pqRsL
         UPfs1+LkRtlMFno4bkekEoV8tZY4axRMJP1+ZX63o/x9WUUZwUNOMfTK6dGbeh0VNJ/Y
         YHwN/2HqnGcT3czOsWdEWqVlqrH+NHnGZvWv2djFjtc7pLRRTq7l1FASnzc/hQG9VFyk
         UJkf4Dt9UZYYoDXMcFfqIsrUn/ulSXGN/8o+9Im0WR3nhQZ4tVV1Gs9bjjL3jC5RBghG
         baFw==
X-Forwarded-Encrypted: i=1; AFNElJ8j+EWpQYXdBrhW61CelLqsgzrT1lz7pNs3OxYM2kiQHTZOjD29AWjd++0uLcvpT/2cOgPF/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YziQwbEPpo4twSDRNHHwpIFjnHVhOUrdiEuKDMnzuyuyXtkB9Gi
	VkSO8XB2surlMjzZ8F9ZX1RtLDZQ1P57kaAmhgePuCt2pQVs9xDsJM6e41ITJstcst7kECvxy2N
	0+1jfnhXB6D/MdgPG8JujaQoFc+gmpkS49CHfLNrO
X-Gm-Gg: AeBDievfBFIENEOHG023B3H/Q88dd2q4QvDLUccyvU2ZQI1IfXMDXYY65rY8W1iP4lW
	dPMoeO6s+/v4UM7A/zDo2gQczTiVw82iwjLY86+gTN8CKIVPybBSUHkP+BONcp+fhDI6QyH2u1t
	It51uvmtg3i3zpYabnucLFHWVC70waWWkhHXS4cZlVw6QbKGMvVctkbUqAOO1PWTcKZRTegdLOU
	+F2QsEfx6jT6I+5+NkWzj4Ig6DaF8gWjBLF39f3Z2Pv28UEZqVXobuM69tsYTErPF706l7DfJbN
	q7lCNxni0O+wTk/7yjnp5oCW7PcabVxyP+LTQxaGRpkKZyZ7QXh8YYZx0UD4
X-Received: by 2002:a05:7022:f016:b0:12c:44a5:fb54 with SMTP id
 a92af1059eb24-12c73f66c7fmr9484770c88.7.1776798407012; Tue, 21 Apr 2026
 12:06:47 -0700 (PDT)
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
In-Reply-To: <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 21:06:10 +0200
X-Gm-Features: AQROBzAdDrCDBdplR43dSg1Xa5GSPvt-aON-ZBAVMhNGcLrikFqVl99W4ulZB_0
Message-ID: <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
[...]
> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
> > so you need to wrap that in a compiler version specific macro,
> > but since I only saw the warning with gcc-12 and higher, that
> > should be fine.

Kindly test if you can:
https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/

Thanks!
