Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7993A1A43
	for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858692; cv=none; b=ItrsA1Z79Rq4GermMdzolQgCCpmXB3Mekqohxg8WvX8cFOiy0rRr+3DERL+ptbe8Hg6vd+wBaUT4dRKv4GxdrEvVwlT4dYVRbNp4P83d7fTbqUd6bSyYJmd8H0E+VJNf7nvezgc82C9XIOuHSzzdj3K/rNeYu+kx2Tt6L0btWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858692; c=relaxed/simple;
	bh=OBn4CvTQ5YASqiiH9xDH515EARre704jAVVy/mGT2hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J75tkNAItBn+v8dVe337YU1tkqjY5+tboLKj6lJvx5YAIcSt21z8eYjwwGWKkhU5EfS3CbwGU0VktilzDfplrdymQW0xy4WOQaNUC3GggNydbXK7nh3GYQoPsEgcjtFn6fn2ACFY5hfeAzUIrlVLtmuyCWIniQjOpncxeLf2HYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fvPxNgu4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fvPxNgu4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so46762115e9.0
        for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776858688; x=1777463488; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76R9SIp6a0TMGxYcT3ORY3Bh14TIu6L0Ph33OjuxO2A=;
        b=fvPxNgu4PLk/BXki5HGisVVkPvq/P1lyytJwXBY3CqYqq+S/dHjNbed1lP55csRbbq
         iup9zvCOreZ0FRE0jLNt0EmwJNU1qd3CqdUBwPN4gc3apDleM+dZCBf7jKl0z4aIoirp
         ekI1apw3+XmxQxWppXaT5TmTguDvD99YZaDKKkUsIvm5uEeDVDaN1wYjKM5WSdhLMXWn
         7rIVJZISlU0z/s08BhwzglikgYiU2WJ4jFcLTJ1IjFC44QwhOuEthIvqB42xsyepIvIo
         a5tb0wYYiPpEALqo2JIoHFd/eP7HUepW2jCA8pg7StPZo88ht1DZWGPLCzFW8isEq3gG
         ipCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858688; x=1777463488;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76R9SIp6a0TMGxYcT3ORY3Bh14TIu6L0Ph33OjuxO2A=;
        b=Od8uC2ai8YtfwSVpY26txkMqVzcFK6Z+HurVjMmx91P9O/JUbg1pqinkzft7dIGAOJ
         INl90gBqWL/8Nm0i4jkSiA7F9JLxKxQSsLCI6zwLuXFKBAXWCcYmiTZz7mCAHtRpv5Xw
         ZLCz2xaOCQF+sjbN+UaICCvbn1I12vpkUI3GKN/Ad6BWNR3MaheGwgfpc+HrGMutr1HK
         alcIW9Myd1nVmKZwMuUacB58wNEshp/s8tRBI9xS8wnSgYOGjOBezl087VNpleuqFnPP
         5TxH618s+U1BayfzjoHXxkZM0IvA86m+GE/PLg4WtxSrFLDEpfQa+MF/E7U+iJqnb9fv
         1U1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/z7TZltLNaktL2Kz4hwe/HbZJMpwHBJvmTNvOZ3f0IbzRZBz8sX4Af7Jb2kG4gggL4f3JmFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWkCPG/8qGp/T28uIQKFefI12VT9tCOfx4UGaoyrihm7bRiHvb
	FA9qjgIZZwKIXGF9RhMyInoEm7924QG71TUH5V0FviqV0zEHs0IaZd2ZieKArL9WUw==
X-Gm-Gg: AeBDievINYxTo6cZY3427Xcrrr465haT2uo2oBbmJBdLJzpKXo1g2RtfNPw8kVJMWRI
	9zazaeB1lGiio3KnEfwVYOY6cSFH/saJ5F1LuLu79DC7dBE9SKcmw1dnw29BntJIj8uwVILcLDr
	QYGHvpV7LsT8E2e/OzTXRWYfYr63W4j33nPnMMSoc7N/whc3THs4vc7D4GqxvwknpPSnusKg4ym
	LN4DP7unPzkriMBhBa9Y+RgdgW2Mzs6fJ3MXgTGWMi2NClt0R//A2Pur8UojNwAg80hCg1oM61D
	ORKcnlZgX85G5KYbRmfEtQ928Eu0ZJ/SWhMUGouf0yqKXGzEpUj6+1+Fr990KWixI0Mo6ywIHeN
	pLC8nv+CabYJQx5tGLaOpzyH4l/9snOpYUu9ozXLTJBaitIBMbRW0C+WptoZ+UqO39DkkdAcx6Q
	eMnbpTKT6VFcWvv3FAntur3hVfu+JsY564yle1rCL4ghgv1RlCZHwkCnSxRz8FyIDRJmeiRYEy2
	5XS7RTVYQ==
X-Received: by 2002:a05:600c:5295:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488fb77d0fdmr311256245e9.17.1776858687442;
        Wed, 22 Apr 2026 04:51:27 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:5934:909d:d13c:e075])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55b8baaesm189558445e9.10.2026.04.22.04.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:51:26 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:51:20 +0200
From: Marco Elver <elver@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Message-ID: <aei2OEa1FGz36AOd@elver.google.com>
References: <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
 <aed5LYnQvjgWm5Rc@elver.google.com>
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
 <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
 <49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com>
 <4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
 <CANpmjNNcGgqoA02QGCXcvDwkjcnk8BgCo6yTKu-B0VBVBJd4UA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNcGgqoA02QGCXcvDwkjcnk8BgCo6yTKu-B0VBVBJd4UA@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Wed, Apr 22, 2026 at 01:35PM +0200, Marco Elver wrote:
> On Wed, 22 Apr 2026 at 10:23, Marco Elver <elver@google.com> wrote:
> >
> > On Wed, 22 Apr 2026 at 10:00, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Apr 21, 2026, at 21:12, Arnd Bergmann wrote:
> > > > On Tue, Apr 21, 2026, at 21:06, Marco Elver wrote:
> > > >> On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
> > > >> [...]
> > > >>> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
> > > >>> > so you need to wrap that in a compiler version specific macro,
> > > >>> > but since I only saw the warning with gcc-12 and higher, that
> > > >>> > should be fine.
> > > >>
> > > >> Kindly test if you can:
> > > >> https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/
> > > >
> > > > Applied to my randconfig tree and verified that this fixes the
> > > > known warning (only one out of about 200 random configs). I'll
> > > > let you know if something comes up by tomorrow.
> > >
> > > Unfortunately, there are new warnings after your patches using
> > > gcc-11. In 500 randconfig builds with that compiler, I saw 7
> > > configurations failing with one of these four messages:
> >
> > Looks like a compiler bug to me; can you check gcc-12+ ? Maybe we need
> > to allow the __access attribute only for later GCC versions.
> 
> I can also see this warning with later GCC - so I'll give up on the
> __attribute__((access)) version and instead suppress warnings.

The simplest solution I found so far:

diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index 92f3843d9ebb..989fd21841ba 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -282,7 +282,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define __kcsan_check_write(ptr, size)                                         \
-	__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
+	__kcsan_check_access(absolute_pointer(ptr), size, KCSAN_ACCESS_WRITE)
 
 /**
  * __kcsan_check_read_write - check regular read-write access for races
@@ -291,7 +291,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define __kcsan_check_read_write(ptr, size)                                    \
-	__kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
+	__kcsan_check_access(absolute_pointer(ptr), size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
 
 /**
  * kcsan_check_read - check regular read access for races
@@ -308,7 +308,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define kcsan_check_write(ptr, size)                                           \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
+	kcsan_check_access(absolute_pointer(ptr), size, KCSAN_ACCESS_WRITE)
 
 /**
  * kcsan_check_read_write - check regular read-write access for races
@@ -317,7 +317,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define kcsan_check_read_write(ptr, size)                                      \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
+	kcsan_check_access(absolute_pointer(ptr), size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
 
 /*
  * Check for atomic accesses: if atomic accesses are not ignored, this simply
@@ -331,9 +331,9 @@ static inline void __kcsan_disable_current(void) { }
 #define kcsan_check_atomic_read(ptr, size)                                     \
 	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC)
 #define kcsan_check_atomic_write(ptr, size)                                    \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
+	kcsan_check_access(absolute_pointer(ptr), size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
 #define kcsan_check_atomic_read_write(ptr, size)                               \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
+	kcsan_check_access(absolute_pointer(ptr), size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
 #endif
 
 /**
