Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854903C5539
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774421; cv=pass; b=pXlIs4j1GGPpsXhIUqe47e7UYwnIpJRej4YINIlN8sIpBCtAo3AroWjuVkLAoMSTQ7Ll8l4OQf6Tuaq2Qk40i5oBfJ24X2EGdzi3jw4g/F5Ag0kJ5+wpwYZIvpPJ5TYakLCHHXUfAxLFyOyMXKs+sCEoa0gMrPAFKV2clSkuIqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774421; c=relaxed/simple;
	bh=5WEtuP4GQnSa1tba0cRCgiRFKFXCLDdWnqLm9MtMlI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQLtQwxuGDHb2MKkoC+nBAB1d8djg1vO9ea0whzgBiHwkwuqpFG+XTKOm6j5d7ibAT7KVqwQYLpK9CcAj1UI9/+qM9JyMAk0fKJh9Idc99oJbnRPXAOqYdGycDjGl8ksJz9/60Oq550xzGHslxNkQ6ve4yfGvAkWshMRsh+fMlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWdKYKMf; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWdKYKMf"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12db63c6df4so327167c88.1
        for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 05:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776774412; cv=none;
        d=google.com; s=arc-20240605;
        b=HeFqWRUiUKf7IXTONxJ8ouP6d/JRox3bU+0vAmJ9KVUtfug6Sma04oaEUPOeglbiBJ
         mp5HOK5h5IkGS3IStXvmewOOD9KtueTPCrNpHmHU7JwSpDmEP/ccd9KLtrldU6mz/75q
         gSaUbHI6vSvXiEjzNt6D8siUrskGhkQn8KEK2Awck6E+oXyKTVzoVPWeRwg//FinttfB
         zkYoSJNiipa+P/+ZzVNkm+EvNSMJQdwZfjGtfltCcD6RQmZlQFWkxSZ25ZT5uFZXyTms
         X05ZVB63wr+eSzN0Dv1c3KEqxU+soiEXdqmfPJCc/t/PbaH3PV57t8j80ukIkd8o7PvD
         /ylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5WEtuP4GQnSa1tba0cRCgiRFKFXCLDdWnqLm9MtMlI0=;
        fh=8sCwY5ZfbjoRpOQGMUZ1UFeoAWwfmHgc3fQp2eE4feI=;
        b=Eh0hFzcdQZwPhpb7qLpopWkO2PuFYBFgkWNnoJk2YwEcNFTrOJ0O93oeuM1/JspkRP
         INV7e74bztnLwCeY8PUVZX9oy5yIiCS7wCgvWm/ItjhMYqFikTBM6OvqiKbco+pUStjQ
         whk+EMBFEowU7gpAj3wdL9jMtmbhHxHWnyM0xXOe6OsCHKEvMISZzJIKD4PTyz9bsjak
         5vBRHhncvXXBiNxDxim3rCxCuQUNM7fSYr+lQCeEvVGkoqyCzapJcdNxchzaUzsucndd
         ikmxEEVZ6qNReLLXjFnuP7w+exV2xVHfauNmi8kS3d+sYHfgjAG2t+neogCnMKG1M3fN
         1OgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776774412; x=1777379212; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5WEtuP4GQnSa1tba0cRCgiRFKFXCLDdWnqLm9MtMlI0=;
        b=RWdKYKMf5ww/ast2fQngmimRLrsQlOGojmrVppxA57Kwk7NileBJGdVQlXPcoXIGvg
         JLTC96GTouOR+y3kMQxOnzr34kwb0u4ZzAQaDxlOYzqRE9m3SG50XVvUM4wNHo9nnSrs
         IBhHPkROQViKylUql7y/sKMvCXOs04H3CMeK5r9pgWzMxzLEkQFFAJSxiBx4Gkm9dKCM
         P6vWiZPyuJvRlmjM7IJT4OPG8fHSO6xk5Jzakip2Y5NedcKN1T87W1o0IhrMKf/vJrDf
         K75frERmUkDOD4okFNLEC5MUBu7qrZSHQI9OzaRd5WxnIvJtK7jwAx5ubtmRyeYWq7Ev
         nu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774412; x=1777379212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WEtuP4GQnSa1tba0cRCgiRFKFXCLDdWnqLm9MtMlI0=;
        b=ol06RtSwOtaRScAhezyvoG0m3yUiWNifvlpBId+UL9uwTJxP+RiZDJ/SjVVAIEoldn
         0DLvYLo0sNNDL2Klzkc+TKKoTGrEbzp/xf1SJw56ukQ9yj82gcsNuaE4b/hm1ybVNyd0
         6InNTBmnZyr5YhtF1XTCu/bNT+zl7ff2YDwJ74NrylZY0C13y1+1pBEarlqj5WuoHvMG
         fJfyovwV5TP6YGwoIGtLGW+3mLNGlur+C2qydJ/mTLLzAzu+nsY17Jpme+Kg5QVucky9
         zRlvSO9cpatmGQCjxdqoNiqrNjd22WoVNpEddtCmhVHmlsE8z5C5+kpunH7KkmZqPxKS
         pKXg==
X-Forwarded-Encrypted: i=1; AFNElJ/+MxiKCWAHYe+myd0zwIGgF1B6icThw/g39t6wm1UvQzZ2me34sTHqw5iiw5qlx/QG5goaSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVToVumW57KGtX2E2YesEiGe4QZbAqH/r3LF5sTDuPGjUILEaK
	cxSYkGIZnGtztOuipvcllpFARurRjPHZmwwDEaaDFJaEAqxltYFedRNg/0nG5wA41aQSzdCb3K0
	GeGoCHN2SAh3U/lK89G8TZ4YM6XU3brQYkj7sZ7WQ
X-Gm-Gg: AeBDietIBOglzXeo1HawrzfpGriuwGE2RSvuckp52ljD1Cy7bP5Q2TDZeZqIhMPxWp3
	TA7rWmpQ1SswNoBLY/lQrcMHODrojvyj5KUEpW2Fj/0ad+LIy7SdfbjAobkrIV+OXbmexnT78sl
	i09y+ruz8VA7BSQcBvQt6EZb7MK8wSrMEzkJRMGJKNJC6jQwpedKj/u83MHqhl/L4o5jgB7BMZZ
	U0LVF4ZTjSqU2FwNL4qmvWvGVKPKCPGx94OfdqUOmOhZnrv2UDHgpyXMh4GDFcXIdDIhBBTs7Iz
	WYApp622DkZybOjlgkrnTfwO53WVasv/1COh68xlONr7hT4QiaHaJoOPwMXq
X-Received: by 2002:a05:7022:6725:b0:12b:fa3d:e03c with SMTP id
 a92af1059eb24-12c73f70e92mr8385153c88.8.1776774411649; Tue, 21 Apr 2026
 05:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com> <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
In-Reply-To: <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 14:26:15 +0200
X-Gm-Features: AQROBzCYZY4hk2WxZwz1Jm1UajDCjj-RyW2oeh3AQ0mXg_S_ZZ9SfUTCTw3f8vE
Message-ID: <CANpmjNOpiaBX=CRQHP1-SY+9McCYphAVsg=OJ5v+Fwha++mQRQ@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 12:21, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 21, 2026, at 11:33, Marco Elver wrote:
> > On Tue, 21 Apr 2026 at 09:54, Arnd Bergmann <arnd@arndb.de> wrote:
> >> What happens here is that copy_from_user() is used in a very
> >> normal way to copy a user space structure into a previously
> >> uninitialized on-stack buffer. With KCSAN enabled, this passes
> >> the pointer to that buffer into __kcsan_check_access(), which
> >> takes a 'const volatile void *' pointer. Gcc correctly notices
> >> that there is no way to access the data behind this pointer
> >> when it hasn't been initialized yet, as both read and write
> >> would cause undefined behavior.
> >>
> >> I'm not sure what a good solution would be to avoid this,
> >> but I assume this should be fixed in the kcsan instrumentation.
> >> I tried changing that code to pass non-const pointers for
> >> any instrument_write variant, which does avoid the warning,
> >> but also adds a bit of complexity, see below.
> >>
> >> Any other ideas?
> >
> > Indeed, the below is rather complex, and seems unnecessary to me just
> > to suppress this warning which not even the whole kernel enables.
> >
> > How can I reproduce this? GCC version? .config? I can't seem to with
> > an x86 defconfig + CONFIG_NTFS3_FS + KCSAN config + GCC on linux-next
> > (20260420).
>
> I ran into this during randconfig testing, I have attached a
> reproducer .config here, but have not tried to narrow down the
> configuration options that are required for triggering it.
>
> The compiler I used is a recent gcc-16.0.1 snapshot, but
> the same config produces the warning using earlier compilers
> as well, I see this with gcc-12.5 but not with gcc-11.5 or
> earlier.
>
> > There's likely a simpler option (attribute or warning suppression
> > around these functions) I want to try.
>
> I tried the 'unused' and 'uninitialized' attributes on the
> argument without success.
>
> I'm a bit worried that just using __diag_ignore() around the
> call would still leave the problem that gcc warns about, in case
> the compiler decides that this is undefined behavior and do
> something we don't want.

The warning is "maybe-uninitialized". GCC cannot prove what the called
function does with the argument; if it were to miscompile based on
wild assumptions around what a function does with a const-pointer,
that's a compiler bug.

I think diag_ignore() is the right thing here.

> Changing the type of the 'ptr' argument in the internal
> __kcsan_check_access() call to 'unsigned long' or perhaps
> a non-const pointer should avoid the warning.

non-const doesn't work for read (const) accesses.

I still cannot reproduce it - I've tried various permutations and
compiler versions.
