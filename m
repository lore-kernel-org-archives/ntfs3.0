Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7012C1788
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764025; cv=pass; b=GcfpOiA7C2Hi5SrJjlDLHQyQVM+SwIdZTFoIYx5abVY1QejjpxHwRvbUsO4PsQqvLzcAxaxrvQj6TmHPNfME0zLbam3ajao36eswTJoAAZZTyxdCTOL0ieFFeAtiCRzLkkJKH7tP/aAIrorpMh8oQCCgn8Zg7xrCACdb0tqzIT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764025; c=relaxed/simple;
	bh=zRa2RDAk9JH1+FwbkbHo69oVzW8R5Pkppx4ro8bPqBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tl5blfmEYmyttMHrCS8GHqArC1NjQ6HfzA+Iu5Oc28Q3JVW23B0a/BZN5EE2c/BmvXZQlD+ItheFiWD3VwdSDXdJCrDIak8eqgEPW2LYJVzP9o/9lasYfkBo2VtCqRdgIN/r67PFjklNgl/36S66HodqZkw/L6rPwc65F1eJsNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vylfRNKU; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vylfRNKU"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c6df0b9bbso8844199c88.1
        for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 02:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776764022; cv=none;
        d=google.com; s=arc-20240605;
        b=dLVezNiekh3zgRYnOx1T3O2RIM/tgEwTXrrQyvWqZz1GYg16rTCJPYawZqCcEWs2XY
         AVA3hWmqKysNcE776gHj32ooafcn/yV40uQPN2dPcE//zBEReO7cQyXnKo2VJGSfgp+P
         AJESN3P1pq2zgKcdpw6Z9+sp5Pk9QCD++EOa0Yx6v1LlLMfTL1pZd+lFmY2bwdaeFWeH
         IuAwm7h3arvYTAMwBbEZ9aU+JeAiGjGEmA2lF3CnmIMefMrbVr+cZPt/gjTICHI9CwET
         lzT6vlV6k513Cr8o3EHttpY8L31Hig966g1rd32xw8wAEJBJeWyhknOxpWuOIKvMjFHy
         LAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TF0jTXFR83gHQp8FGO3ftKmviRspLA1NYBoivJhgOwc=;
        fh=4cgIo+3Cf5+o/qtAe6hV2iyNhEmnopCy0S7/VSDKHd4=;
        b=UtsF7flNa+iTMLxDonKVQHwAgTBO1kRgTNPMDBInRhFpQA2pXYzVsIqFPPogmJirjQ
         M9XhY2HY9OWjzCysUVijpOa7WAgnqHlHF0ENWT9UP9OGSHTPasSZ/XRi+tmXyxaN5k+C
         m9Rll8tFiCjwk5EkLkhCT8gbC8BJK4KO9BgBR0yp7ZUrEM414e+dPc3Wwt5iN64SVG5e
         Ku/3tFIsKBmz7srGOfLu6Xsmgik2v8kw1w3bv6I5gWI/sc+RdOmec9SW97WhIhxwAtWa
         YGbq66bVFOfsSNZuLftvGM9izobnnG+RlRLpqYWmzl39cKFFOvtNoXzptbo0KAcN9lBm
         /v2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776764022; x=1777368822; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TF0jTXFR83gHQp8FGO3ftKmviRspLA1NYBoivJhgOwc=;
        b=vylfRNKU6ZCeTiAHmnVik5y5ibEViW0tOx7IVWdOE2lbp16Vp7jMYvOvc1ynmD7Aku
         Aj/xyMU4G5rvb0KAlwIao7fqpA3YXVyoZXH9aCy0OwIJ5JH4inrD8THBrNVXxr+jxFmh
         vaM406XOVLrcBnROpNHs3H+3XXXsvARTfSFEUsiS5jWCqNZT69Z7Q68TxyUBLOHPhNyQ
         1HAIo017NBlGbnT7Ap9A5kQ9OhPxzPF6yEsh+YnmAGyiBmJoGFF4xYzITfLZlZTDZYKh
         jrL1ADHv/IRcLQpbBp212+wF0L4WqN+7JjyIqLTXzNd+kc7EM0P66YD0HWVM3EbMDv3D
         D5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764022; x=1777368822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF0jTXFR83gHQp8FGO3ftKmviRspLA1NYBoivJhgOwc=;
        b=f1++dDNwbct+lWQ2cE8NShA9nbywd2o9rxcbI/WUP3L7u+UuFMjrXBMJi7EiuTrtoh
         QRSekp46uVPFGttsEn3m2CVmf0sXfHHlNBY3xFaf9Gs4ZezT/M89VvtRMKGCkwSIOfyc
         rufCGrhosbubUloHn7gDBK2pBeeSxm+vb2yD0v7ASYC1H4XQ+aq9dbREXlbsIvrSixJi
         RaF4jaUHILYr4DA5M8RTOkZzCxMIXyFIf3bNAB5JEW6c3F3/hYPJYHcnDYOlT7uUXBLQ
         VzUuBSGDKodCgl+H6jfBSYBis+UZXMb+S//N9Ytk/jU48EGrwVRMj1WAHWXb8gqdEJli
         hF2w==
X-Forwarded-Encrypted: i=1; AFNElJ8I2w4VKxnjuHH4+6yMUAxfj27OwsY16j/oNiXLyX4MVFZN1OzlnspbOkkn24RwpTWL1PwpOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMfdKWQni/5LtH9ngD5AK2Fx3bTlo8m2p1KqFOK8sJJX+ClVS3
	PIWitYkCOp8yI+xHbyldL1DGsV6s6L5LXhpraj02295Ka17QVAS1nP0wo9MQvne0oJzDt9pPsOd
	zv0qMMNSRT5HWj9YridXTTZGszB4U7STadLOXwYbH
X-Gm-Gg: AeBDieuFyXr94WsS/VuDJSluEgYFzqvxGl4LYoizBlOQBl6CEhTCcj2u/XS3oagcQwU
	yWDhBVvIOb9zRpYU87zlrtjnH7OvpSca4n36QqujdIoUG4rZ3I2ZO9fmeBaX/Inm+iJ7517tgxB
	rD39wPqLi9CH46P5SHvqtpBOfryWCpZVRbl9ARj4RiTq9Md0ifYfny2UBU1vLfR2wbtgTyICxtd
	IYpRWzIIg/khxJYw4wxJ/rxDYdZjbTg93cqhRkuAUwyiQBoUzAmj8O5ZRerh7Di2awAdjwREBhG
	ybnsyhicLipeu5USPfRv6aTq2TGk+9T/SilJ3vyIjTWuK0q3e6u9IGsWCOGa
X-Received: by 2002:a05:701a:c951:b0:12d:b205:c737 with SMTP id
 a92af1059eb24-12db205cacbmr1948808c88.17.1776764021898; Tue, 21 Apr 2026
 02:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
In-Reply-To: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 11:33:05 +0200
X-Gm-Features: AQROBzCX_6jNqotsUoJG2u_Y1WMix14s8VMe6RX-kaslMsuaHCe5SuIli9CSqBE
Message-ID: <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kcsan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 09:54, Arnd Bergmann <arnd@arndb.de> wrote:
>
> ntfs3 started enabling -Wmaybe-uninitialized, a warning that is generally
> useful but is normally disabled in the kernel because of too many
> false positives when used with sanitizers and some other gcc options.
>
> I ran into one such warning in today's linux-next:
>
>   CC      fs/ntfs3/file.o
> In file included from /home/arnd/arm-soc/include/asm-generic/rwonce.h:27,
>                  from /home/arnd/arm-soc/arch/arm64/include/asm/rwonce.h:81,
>                  from /home/arnd/arm-soc/include/linux/compiler.h:369,
>                  from /home/arnd/arm-soc/include/linux/array_size.h:5,
>                  from /home/arnd/arm-soc/include/linux/kernel.h:16,
>                  from /home/arnd/arm-soc/include/linux/backing-dev.h:12,
>                  from /home/arnd/arm-soc/fs/ntfs3/file.c:10:
> In function 'instrument_copy_from_user_before',
>     inlined from '_inline_copy_from_user' at /home/arnd/arm-soc/include/linux/uaccess.h:184:2,
>     inlined from 'copy_from_user' at /home/arnd/arm-soc/include/linux/uaccess.h:221:9,
>     inlined from 'ntfs_ioctl_fitrim' at /home/arnd/arm-soc/fs/ntfs3/file.c:77:6,
>     inlined from 'ntfs_ioctl' at /home/arnd/arm-soc/fs/ntfs3/file.c:164:10:
> /home/arnd/arm-soc/include/linux/kcsan-checks.h:220:28: error: 'range' may be used uninitialized [-Werror=maybe-uninitialized]
>   220 | #define kcsan_check_access __kcsan_check_access
>       |                            ^
> /home/arnd/arm-soc/include/linux/kcsan-checks.h:311:9: note: in expansion of macro 'kcsan_check_access'
>   311 |         kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
>       |         ^~~~~~~~~~~~~~~~~~
> /home/arnd/arm-soc/include/linux/instrumented.h:147:9: note: in expansion of macro 'kcsan_check_write'
>   147 |         kcsan_check_write(to, n);
>       |         ^~~~~~~~~~~~~~~~~
> /home/arnd/arm-soc/include/linux/kcsan-checks.h: In function 'ntfs_ioctl':
> /home/arnd/arm-soc/include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
>    37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
>       |      ^~~~~~~~~~~~~~~~~~~~
> /home/arnd/arm-soc/fs/ntfs3/file.c:65:29: note: 'range' declared here
>    65 |         struct fstrim_range range;
>       |                             ^~~~~
>
> What happens here is that copy_from_user() is used in a very
> normal way to copy a user space structure into a previously
> uninitialized on-stack buffer. With KCSAN enabled, this passes
> the pointer to that buffer into __kcsan_check_access(), which
> takes a 'const volatile void *' pointer. Gcc correctly notices
> that there is no way to access the data behind this pointer
> when it hasn't been initialized yet, as both read and write
> would cause undefined behavior.
>
> I'm not sure what a good solution would be to avoid this,
> but I assume this should be fixed in the kcsan instrumentation.
> I tried changing that code to pass non-const pointers for
> any instrument_write variant, which does avoid the warning,
> but also adds a bit of complexity, see below.
>
> Any other ideas?

Indeed, the below is rather complex, and seems unnecessary to me just
to suppress this warning which not even the whole kernel enables.

How can I reproduce this? GCC version? .config? I can't seem to with
an x86 defconfig + CONFIG_NTFS3_FS + KCSAN config + GCC on linux-next
(20260420).

There's likely a simpler option (attribute or warning suppression
around these functions) I want to try.

>      Arnd
>
> diff --git a/include/linux/instrumented.h b/include/linux/instrumented.h
> index a1b4cf81adc2..d28aa6b0aeb8 100644
> --- a/include/linux/instrumented.h
> +++ b/include/linux/instrumented.h
> @@ -36,7 +36,7 @@ static __always_inline void instrument_read(const volatile void *v, size_t size)
>   * Instrument a regular write access. The instrumentation should be inserted
>   * before the actual write happens.
>   */
> -static __always_inline void instrument_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_write(v, size);
> @@ -50,7 +50,7 @@ static __always_inline void instrument_write(const volatile void *v, size_t size
>   * Instrument a regular write access. The instrumentation should be inserted
>   * before the actual write happens.
>   */
> -static __always_inline void instrument_read_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_read_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_read_write(v, size);
> @@ -92,7 +92,7 @@ static __always_inline void instrument_atomic_read(const volatile void *v, size_
>   * Instrument an atomic write access. The instrumentation should be inserted
>   * before the actual write happens.
>   */
> -static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_atomic_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_atomic_write(v, size);
> @@ -107,7 +107,7 @@ static __always_inline void instrument_atomic_write(const volatile void *v, size
>   * Instrument an atomic read-write access. The instrumentation should be
>   * inserted before the actual write happens.
>   */
> -static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
> +static __always_inline void instrument_atomic_read_write(volatile void *v, size_t size)
>  {
>         kasan_check_write(v, size);
>         kcsan_check_atomic_read_write(v, size);
> @@ -141,7 +141,7 @@ instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
>   * variants). The instrumentation should be inserted before the accesses.
>   */
>  static __always_inline void
> -instrument_copy_from_user_before(const void *to, const void __user *from, unsigned long n)
> +instrument_copy_from_user_before(void *to, const void __user *from, unsigned long n)
>  {
>         kasan_check_write(to, n);
>         kcsan_check_write(to, n);
> diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
> index 92f3843d9ebb..e598fd9679a9 100644
> --- a/include/linux/kcsan-checks.h
> +++ b/include/linux/kcsan-checks.h
> @@ -34,7 +34,8 @@
>   * @size: size of access
>   * @type: access type modifier
>   */
> -void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
> +void __kcsan_check_read_access(const volatile void *ptr, size_t size, int type);
> +void __kcsan_check_write_access(volatile void *ptr, size_t size, int type);
>
>  /*
>   * See definition of __tsan_atomic_signal_fence() in kernel/kcsan/core.c.
> @@ -186,8 +187,8 @@ void kcsan_end_scoped_access(struct kcsan_scoped_access *sa);
>
>  #else /* CONFIG_KCSAN */
>
> -static inline void __kcsan_check_access(const volatile void *ptr, size_t size,
> -                                       int type) { }
> +static inline void __kcsan_check_read_access(const volatile void *ptr, size_t size, int type) { }
> +static inline void __kcsan_check_write_access(volatile void *ptr, size_t size, int type) { }
>
>  static inline void __kcsan_mb(void)                    { }
>  static inline void __kcsan_wmb(void)                   { }
> @@ -217,7 +218,8 @@ static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
>   * Only calls into the runtime when the particular compilation unit has KCSAN
>   * instrumentation enabled. May be used in header files.
>   */
> -#define kcsan_check_access __kcsan_check_access
> +#define kcsan_check_write_access __kcsan_check_write_access
> +#define kcsan_check_read_access __kcsan_check_read_access
>
>  /*
>   * Only use these to disable KCSAN for accesses in the current compilation unit;
> @@ -226,8 +228,8 @@ static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
>  #define __kcsan_disable_current kcsan_disable_current
>  #define __kcsan_enable_current kcsan_enable_current_nowarn
>  #else /* __SANITIZE_THREAD__ */
> -static inline void kcsan_check_access(const volatile void *ptr, size_t size,
> -                                     int type) { }
> +static inline void kcsan_check_read_access(const volatile void *ptr, size_t size, int type) { }
> +static inline void kcsan_check_write_access(volatile void *ptr, size_t size, int type) { }
>  static inline void __kcsan_enable_current(void)  { }
>  static inline void __kcsan_disable_current(void) { }
>  #endif /* __SANITIZE_THREAD__ */
> @@ -273,7 +275,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @ptr: address of access
>   * @size: size of access
>   */
> -#define __kcsan_check_read(ptr, size) __kcsan_check_access(ptr, size, 0)
> +#define __kcsan_check_read(ptr, size) __kcsan_check_read_access(ptr, size, 0)
>
>  /**
>   * __kcsan_check_write - check regular write access for races
> @@ -282,7 +284,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @size: size of access
>   */
>  #define __kcsan_check_write(ptr, size)                                         \
> -       __kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
> +       __kcsan_check_write_access(ptr, size, KCSAN_ACCESS_WRITE)
>
>  /**
>   * __kcsan_check_read_write - check regular read-write access for races
> @@ -291,7 +293,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @size: size of access
>   */
>  #define __kcsan_check_read_write(ptr, size)                                    \
> -       __kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
> +       __kcsan_check_read_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
>
>  /**
>   * kcsan_check_read - check regular read access for races
> @@ -299,7 +301,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @ptr: address of access
>   * @size: size of access
>   */
> -#define kcsan_check_read(ptr, size) kcsan_check_access(ptr, size, 0)
> +#define kcsan_check_read(ptr, size) kcsan_check_read_access(ptr, size, 0)
>
>  /**
>   * kcsan_check_write - check regular write access for races
> @@ -308,7 +310,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @size: size of access
>   */
>  #define kcsan_check_write(ptr, size)                                           \
> -       kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
> +       kcsan_check_write_access(ptr, size, KCSAN_ACCESS_WRITE)
>
>  /**
>   * kcsan_check_read_write - check regular read-write access for races
> @@ -317,7 +319,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @size: size of access
>   */
>  #define kcsan_check_read_write(ptr, size)                                      \
> -       kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
> +       kcsan_check_write_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
>
>  /*
>   * Check for atomic accesses: if atomic accesses are not ignored, this simply
> @@ -329,11 +331,11 @@ static inline void __kcsan_disable_current(void) { }
>  #define kcsan_check_atomic_read_write(...)     do { } while (0)
>  #else
>  #define kcsan_check_atomic_read(ptr, size)                                     \
> -       kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC)
> +       kcsan_check_read_access(ptr, size, KCSAN_ACCESS_ATOMIC)
>  #define kcsan_check_atomic_write(ptr, size)                                    \
> -       kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
> +       kcsan_check_write_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
>  #define kcsan_check_atomic_read_write(ptr, size)                               \
> -       kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
> +       kcsan_check_write_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
>  #endif
>
>  /**
> @@ -368,7 +370,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @var: variable to assert on
>   */
>  #define ASSERT_EXCLUSIVE_WRITER(var)                                           \
> -       __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
> +       __kcsan_check_write_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
>
>  /*
>   * Helper macros for implementation of for ASSERT_EXCLUSIVE_*_SCOPED(). @id is
> @@ -449,7 +451,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @var: variable to assert on
>   */
>  #define ASSERT_EXCLUSIVE_ACCESS(var)                                           \
> -       __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT)
> +       __kcsan_check_read_access(&(var), sizeof(var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT)
>
>  /**
>   * ASSERT_EXCLUSIVE_ACCESS_SCOPED - assert no concurrent accesses to @var in scope
> @@ -525,7 +527,7 @@ static inline void __kcsan_disable_current(void) { }
>  #define ASSERT_EXCLUSIVE_BITS(var, mask)                                       \
>         do {                                                                   \
>                 kcsan_set_access_mask(mask);                                   \
> -               __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT);\
> +               __kcsan_check_read_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT);\
>                 kcsan_set_access_mask(0);                                      \
>                 kcsan_atomic_next(1);                                          \
>         } while (0)
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 8a7baf4e332e..289634c3de5c 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -953,11 +953,17 @@ void kcsan_end_scoped_access(struct kcsan_scoped_access *sa)
>  }
>  EXPORT_SYMBOL(kcsan_end_scoped_access);
>
> -void __kcsan_check_access(const volatile void *ptr, size_t size, int type)
> +void __kcsan_check_read_access(const volatile void *ptr, size_t size, int type)
>  {
>         check_access(ptr, size, type, _RET_IP_);
>  }
> -EXPORT_SYMBOL(__kcsan_check_access);
> +EXPORT_SYMBOL(__kcsan_check_read_access);
> +
> +void __kcsan_check_write_access(volatile void *ptr, size_t size, int type)
> +{
> +       check_access(ptr, size, type, _RET_IP_);
> +}
> +EXPORT_SYMBOL(__kcsan_check_write_access);
>
>  #define DEFINE_MEMORY_BARRIER(name, order_before_cond)                         \
>         void __kcsan_##name(void)                                               \
> diff --git a/kernel/kcsan/debugfs.c b/kernel/kcsan/debugfs.c
> index 2af39ba5b70b..665a06bc37a7 100644
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -75,7 +75,7 @@ static noinline void microbenchmark(unsigned long iters)
>                 unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
>                 int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
>                                 (!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
> -               __kcsan_check_access((void *)addr, sizeof(long), type);
> +               __kcsan_check_write_access((void *)addr, sizeof(long), type);
>         }
>         cycles = get_cycles() - cycles;
>
> diff --git a/mm/slub.c b/mm/slub.c
> index 161079ac5ba1..b1dcfc575407 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2621,8 +2621,8 @@ bool slab_free_hook(struct kmem_cache *s, void *x, bool init,
>
>         /* Use KCSAN to help debug racy use-after-free. */
>         if (!still_accessible)
> -               __kcsan_check_access(x, s->object_size,
> -                                    KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT);
> +               __kcsan_check_write_access(x, s->object_size,
> +                                          KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT);
>
>         if (kfence_free(x))
>                 return false;
> diff --git a/mm/vma_init.c b/mm/vma_init.c
> index 3c0b65950510..248e9042a6af 100644
> --- a/mm/vma_init.c
> +++ b/mm/vma_init.c
> @@ -125,7 +125,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>         if (!new)
>                 return NULL;
>
> -       ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
> +       ASSERT_EXCLUSIVE_WRITER(orig->flags);
>         ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
>         vm_area_init_from(orig, new);
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 9b11cf3193b9..7a3650fb10db 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -1155,7 +1155,8 @@ static const char *uaccess_safe_builtin[] = {
>         "__asan_report_store8_noabort",
>         "__asan_report_store16_noabort",
>         /* KCSAN */
> -       "__kcsan_check_access",
> +       "__kcsan_check_read_access",
> +       "__kcsan_check_write_access",
>         "__kcsan_mb",
>         "__kcsan_wmb",
>         "__kcsan_rmb",
