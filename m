Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967046;
	b=sLoS4YvGNAR5wzD1tv+cvqclAM6b+Doo5YesIne436DWLmiSEFknm40ItKmcJOVw3Qbs
	 NSDyYHyhVsiqmgV4/EqTFt24D05Rb82Nb2zZYIoPWcxHK1IN2BX8Hzo81G662U2+XCHz8
	 +I2om2ZcDRxgngvP4Ws/9FnH0/+2rc21MqZYqhc9fe27LgFXwPFNpDLvgRYsIgX/vpEPW
	 uqMJlW5c2dUBfzs30WUrY1UIX9Fp2fb2IN+3tQLg4VN44sjdLUs4r3iM0jXT2DwWw/BrE
	 wjU2bl0tS9tlCMcJOVxlWSMiQD9yozjM86rKYOFFE7XpLwSSAvSnm9wMUYVQs35yZ+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
	b=RzExsCGXZjD4wrBWgg7WlwO0D37EYVV4VrhZ3APU4x4DMh1yIVdDNXIjN8cphYK3RLpI
	 UQ1fJ7lf4koFqjQmDY1jGJaUxYh1GWPekzkOfaqR5NSwlWV0tzpLGUT4utuTrhlByFrcZ
	 8Y4Lb8vTMaaSiRAxrlyL9KogHIdF8BvcsAX66SRyr8k+7+Xvf+ETSGL14aEWg2Wr1DhpJ
	 Ozr6mYVQsOr08hNjrwUgurk8hjBI1eWGdypEIsEuaXUdHI3SZg8REHtlKxjNnFpz6vzwE
	 n/4QsvEa5wpAU9daKxclso2YYoPH9EALYC8uyigMTD9aYWnAP/Ca8YtDPVpNTpw/czg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBio2ibJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C90606A31C
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 01:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBio2ibJ
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4ad654ea104so114091fac.1
        for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 17:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967045; cv=none;
        d=google.com; s=arc-20260327;
        b=W42/aLP7LZSzAqUDhlimfIN4y7xeYzhlZomt6kCFr9yJHZvZWccO1iD6AfICNCruO+
         FVBcuYMDn4cwzDmrRGnPhalTHVdBBkOd754K9zIUTeEe9/WnqiGHA1d9MVnbc1C9pSI8
         87uI7yEYTK8KIIpNsz+aDEaWECTQWiMcE8bLRexiJD25qJk+xGPI+UsBVbqpH5bZJsyI
         iyZPdjmW455fdnhJiaZplOqwBm/2YbPTs5N1Vx9iwLca5TE5o8q7IPYCcSkekWBgYfyA
         eW+DEZwX+OOzIsB4tBcZqEuF7+3qa0GW2fxeVLqFhrhp2NWNStAeRPOGMfA68JSkWQc5
         V7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        fh=BAaG8kSMHP89hrtrCf/lKjiUPFhrNn4IRjFrxl2QEgg=;
        b=rNCXkS5eC0HE/Tg6YCmWcdgYAeObUfEijAV9PKAMR7/WU0TBGBBFWQmNynFyLGpYWV
         Rdz2RlTXIxpNn60+CgDXlcGbtslikTtJ7XTVTcy9Y9LAxKc3CY4T5Dg80Lp+204Gwwlz
         QQY6O7VhhiO9ui9EGB/nYZA3JNbYsg0qzTuTExdoat0Kp2fikddbzkoxAw5Gi5zTZK3c
         J6SisMFaTqk3J4lBGVPbwv9P+O6P582ZKdWQ7L3fp6KUSFWnREojA+syEdDMOuv6CtQb
         s7mCsCHR3Rmg8infAopSnUahEB9BEyJ7FuNev+kGJsv6q+u166+9UkaWVF9S3YHaiUGT
         CCug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967045; x=1795571845; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        b=WBio2ibJsDwSphEQFEnGzniWjBvYlrxT0hHHbWGt6ztVjw17iWf3aE75Ql990bZFgU
         S+12lteENQ5mZ2lFcSw1zDp6KzfJBN6LEX0cN9iARD2XkkKRpHbdxIdofQkQ37aF8oUF
         Kr/qJAKrNlBiYVSsXASeSs4oLFZITVyFnMhoTz5YJi6l94wRCJLPDTlWBCCfu9dVxjwU
         K89lzse4oc+b/Vk+eJOckWIWYPgqD2tcNDrs14APkfJicpKjg/3uwb+vbIJPo1laKCTI
         IraNuvMFPBzMP9NN1CDj52RqP0pHwpumpYaKL9UKiJIpGIWPEvYdqJyZPBPSzDzDPuI2
         2xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967045; x=1795571845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPM4Z2/d+OWE/oPOGuzhHg0apTJ3Jgl1KSfNq20bq4U=;
        b=uzCxZYgRojdi/h3IFN5w025oAUXt4QpT6C5rfmbYtCQUsW1THNvUma/HpWjgCYOvKw
         yoK5NBUrXs0aCIwmFuwqGedZskOGoiO8NmgMt1QPNtpWjxQeceCTgtLmiZ6RDnEf9Yb5
         JKvHBvmyGXsSZ18bX2YLxVgvYBMFjxQVC3+XdsFRkI69tV+2MZcod9ZYNh2kBPH7luHB
         GvBy9tHRbyiV9V/H1h7DiaH2RB7kPk9zVzwwuXUsRd5M30sRdpQR5chJDR9O6WEI/M3Z
         RwpnKzWlCDaxmVeyegqoXYp9+Khc41iG1+h+H9sAgHcPXT37XPAhU31MhFVWXFORz88Z
         vThg==
X-Forwarded-Encrypted: i=1; AL+hErG/q7F2KRttdUd90k6YDMU25kKQ83bfqMx3Ce0iyasweifolb76D40s6YCuVnu1/XRNnphalQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/p3gKjNlRX82AiQlrg723kHGDGT4EV11CI/Y1r5U0tECcW3wkW
	BEHTuugxrlJmM26yPUpEZGzJLPZsJleNQ/0ZIinm4QzH0dhst1FtF/TtBI1QpYRcmCcB/EukP4i
	VfJQvXOxzH7Byeshl7tXWcspXUAC6tmg=
X-Gm-Gg: AYBFou1K6mByqae1NqqEnBcMSVnUHbw+1I7/BF72UNMHGUDCRSOVfPuZBSbKLUoZaQp
	wso8OUHiS/rm+Pc8HrhyBMAJbgcj4GhvJwaiL1U9f4c6eOVNKdt18ey43X7lqpfqEnQ7IR6jRTg
	aVzIV+ouDT7mirgLYw15vwIQK4pHdOk6P3jK09rDDs3P502q/BtW40bhJn3Ev7Q2UYIXX1f1w29
	E7+mGP7wCnASGzC2GPSHAHrtZ80VBfVW9boXBr9Q/yQ24s/dTRVv1769b+j32J5H3vk9RrVN1Gf
	A8lpwM5BwkI9EZsCxQ95Kr86BEmIV41x0R/t/3bu9ETaUpx7RenXmoeuUKTkN4i+0v8ZaYdkrWr
	Hn1MNxIcTP+UpDSMcIetJrFgmecdi4hT7zo4lfGB/QHQ1xgQDXe0TqjXgpYk0Uqfzhz5NzIv2RM
	gY6mDsx7RDIZ3JNUUDI/VP5rnY0RmFQH/TsCWywNhVqlFoKEnTt3xn
X-Received: by 2002:a05:6808:23ca:b0:573:2541:1804 with SMTP id
 5614622812f47-5774045c9fbmr1927983b6e.19.1794967044731; Tue, 17 Nov 2026
 17:57:24 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
 <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com> <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
In-Reply-To: <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 17 Nov 2026 17:57:12 -0800
X-Gm-Features: AclHuK80GibvNnDmnk1ufJQUnUWv6v5F6uZQtv2GfalFtbrM8RVlito02JIyaSw
Message-ID: <CAGEkeHfywOHr225v1tm7zjf6ui2a2NttrPBwUhts9-DHLYszcQ@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:27 PM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com=
> wrote:
>
> Tested-by: Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com>

Thanks for testing!

Hungyu
