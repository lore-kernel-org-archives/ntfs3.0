Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4981CAA6C
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777528; cv=none; b=nLvo3aTsyebZSUXKAB/zQ3pl4CVG+hDLDizZ1iz0mcs3nDP57BKnHvNUrpGR4H396jSFQTJ95L+7LQ7+h+Xsif3UJDC6x3qWB6YLRr0BO7IXCYGcYFRnKkOgNVn0KJPic5OIIH8AbhZs6bV3xEbFiullYRGgTNx4TNwti0MweLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777528; c=relaxed/simple;
	bh=zmoJDTDLt9d1K373yxSVD9TwHD6GMr6E4PWgn7+r4bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfN9rBpew/BsPcmwegvcHANaJPcQHm3unvxAIxhE2h3dbGcxQuovVrir2OJrny+J6N9RrIdcIh0NU2deXgdUkGl2KaIoz+wFJsBS7mmJID24OqLB2iP+mx71wuCuAgG28ZtoBygAyYuxEXyAnomgbZw8KzNGd61nv4MEdpjGKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/GudB8r; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/GudB8r"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso4298863a12.3
        for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776777525; x=1777382325; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1li0rVQ/zPDHUPzfrR9ZJBc76a9rk0thOSNXfUKnLQ4=;
        b=r/GudB8rwEA1znO/b2pa4KcpbkQVWsrx8xgPMYIdC85qPy1F7i5wZaQYAFYsdKISkx
         C5o7PWPUhs3/ubo+p2XRbP1UCIkx6HMWxXMzhSDecakwOFMlqhVKl0Asih9twLZkpG6h
         FGobmlndjmDPeM0TTraKDTDwwSiESE1Z/wRcPnr93E4vh/78GJ8gK8v2tWcvZf7uhwAp
         QW8yrCaUO705B/AXw9tz/jlOL9A0RmLtUhxm7D3ekwTYCL6DMenW6yV9OzN8jfgfndeC
         1jnGXVSY/CxFiYI4h6LDEb4a84l5uxtc66IYLTaa5zO/4BvAZZjt0d+HW1794QMrjQbD
         Antg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776777525; x=1777382325;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1li0rVQ/zPDHUPzfrR9ZJBc76a9rk0thOSNXfUKnLQ4=;
        b=X5tSqVzbInZT6n+p+UA515LkF0rYJ6q5rLCxMSrx5WYbE8BLFoQ/BYbjimzc5Gz6//
         N63sANk+upAA85cCWAmJIULLBiEWa4wrOiZxuBVGXmCVrVbN5xgN5213jVvw0DFBZcwk
         yx046FArn10cHVhI+ItceZZXEtmOhVbZkOPGDlCLNIaPl8TxJj0ViG8rucTYoG6CnEGB
         LeLsB3fqbbHn0HduBCJGhiiMlyz7LGWXUUw+pwJaJY8bqWzMaxmdxCkLmUsE66ajPuJR
         qRfqIgtbYNqZgMkncEFcjBBctqMs3GP0k1H259NWLf6H8/Qhe4vITwlbAtPIbpZWHmLQ
         usRw==
X-Forwarded-Encrypted: i=1; AFNElJ9KZaEiz0cpZGwpvUyu2xU/R8rZl6eKrcKPLcoKzlFSx2KddN2cX/NhmD8QBLjUyxZ83/IgyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvfPdVkWEfaP94EpZ6URyno2F/kPtq9txSZOmPDbJ5csj5k9Yu
	bD2QIJsTMwNJgGunZIEe7UM0n4lMmTlG89xkQgwV1LIkok3BNfLgFDTLd9cwv8s/ojOyBLJ4OLT
	zCXs4wmsT
X-Gm-Gg: AeBDieuyTAtOx3Lcx0rq+muZMTXe95WmvSXSThCLcBVtmlt3oyojb42DFPsZYG0qWwS
	B5KxPlSjJqqEyhCVfUObnJyX/QwRveXMK7vI/SNZox1dffbOSb0yDJTjllo0Ovj9mCr6jL624ca
	EFSvY1TqRENwEpDI4ncTdC67Wf43rVQTYp3mvyvVPQJf60k6NkTBPdaTgrjqMjxNeCIx2Pr2TB2
	Iy73eb7oOKs8Mp777XOCe0FPYGMA4oJpB9pbTwSY97rm2TzKrQRYmJsUUDpz8ySaPoWKEs52lmS
	EszyRP9TdG7mY7S4+fo6KUxv1Fq0bFxhxGiWLp6paGnE2CC6sGX/JlFcQuWlNd1CQxmLaI5Xb1I
	rW2rcP82OgV1c2KK2X08CpUiZitbfB/0sn6qDX65qja2gktvPgKagZ8g+I/4PpkmYdM7ApVkglv
	Re1JFDJnXgkPwpHdAMjN5h1/H/n/filnbPfeXJd1SQXEVqMlYrtLTOU5vGGDtA2AN/3+mSAHGXv
	r9AbxGT7Q==
X-Received: by 2002:a17:907:7205:b0:ba6:cfb2:c045 with SMTP id a640c23a62f3a-ba6cfb2c18amr487857966b.40.1776777524254;
        Tue, 21 Apr 2026 06:18:44 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:81be:cc9f:a494:b64e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bbb1sm440503666b.38.2026.04.21.06.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:18:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:18:37 +0200
From: Marco Elver <elver@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Message-ID: <aed5LYnQvjgWm5Rc@elver.google.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
 <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Tue, Apr 21, 2026 at 02:28PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 21, 2026, at 13:35, Marco Elver wrote:
> > On Tue, 21 Apr 2026 at 12:21, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> I ran into this during randconfig testing, I have attached a
> >> reproducer .config here, but have not tried to narrow down the
> >> configuration options that are required for triggering it.
> >
> > The attached .config is a KASAN config, still can't reproduce.
> 
> Odd, this is what I see in the attached file:

Mea culpa - I added one '.' too many and ended up copying some old
config.

Anyway, I can reproduce this now.

There appear to be 2 options to fix, see patch below:

1. __kcsan_nodiag wrapper to disable warnings for the kcsan_check
   helpers. Tested and seems to work in this case.

2. __attribute__((access(none, 1))) per https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html:
   "The access attribute enables the detection of invalid or unsafe
   accesses by functions or their callers, as well as write-only
   accesses to objects that are never read from. Such accesses may be
   diagnosed by warnings such as -Wstringop-overflow, -Wuninitialized,
   -Wunused, and others."

Option #2 seems a lot simpler. While KCSAN does read the accessed
memory, for the purpose of diagnostics hiding this fact from the
compiler is perfectly fine as it's not part of "normal" kernel code.

Preferences?

------ >8 ------


diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index b041639ab406..088412189f16 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -73,6 +73,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 	if (!bdev_max_discard_sectors(dev))
 		return -EOPNOTSUPP;
 
+	kcsan_check_write(&range, sizeof(range));
 	user_range = (struct fstrim_range __user *)arg;
 	if (copy_from_user(&range, user_range, sizeof(range)))
 		return -EFAULT;
diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index 92f3843d9ebb..7304512cf2a2 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -27,6 +27,14 @@
  * to validate access to an address. Never use these in header files!
  */
 #ifdef CONFIG_KCSAN
+#define __kcsan_nodiag(...)					\
+({								\
+	__diag_push();						\
+	__diag_ignore_all("-Wmaybe-uninitialized", "")		\
+	__VA_ARGS__;						\
+	__diag_pop()						\
+})
+
 /**
  * __kcsan_check_access - check generic access for races
  *
@@ -34,7 +42,7 @@
  * @size: size of access
  * @type: access type modifier
  */
-void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
+void __kcsan_check_access(const volatile void *ptr, size_t size, int type)/* __attribute__((access (none, 1)))*/;
 
 /*
  * See definition of __tsan_atomic_signal_fence() in kernel/kcsan/core.c.
@@ -186,6 +194,8 @@ void kcsan_end_scoped_access(struct kcsan_scoped_access *sa);
 
 #else /* CONFIG_KCSAN */
 
+#define __kcsan_nodiag(...) ({ __VA_ARGS__; })
+
 static inline void __kcsan_check_access(const volatile void *ptr, size_t size,
 					int type) { }
 
@@ -273,7 +283,7 @@ static inline void __kcsan_disable_current(void) { }
  * @ptr: address of access
  * @size: size of access
  */
-#define __kcsan_check_read(ptr, size) __kcsan_check_access(ptr, size, 0)
+#define __kcsan_check_read(ptr, size) __kcsan_nodiag(__kcsan_check_access(ptr, size, 0))
 
 /**
  * __kcsan_check_write - check regular write access for races
@@ -282,7 +292,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define __kcsan_check_write(ptr, size)                                         \
-	__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
+	__kcsan_nodiag(__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE))
 
 /**
  * __kcsan_check_read_write - check regular read-write access for races
@@ -291,7 +301,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define __kcsan_check_read_write(ptr, size)                                    \
-	__kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
+	__kcsan_nodiag(__kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE))
 
 /**
  * kcsan_check_read - check regular read access for races
@@ -299,7 +309,7 @@ static inline void __kcsan_disable_current(void) { }
  * @ptr: address of access
  * @size: size of access
  */
-#define kcsan_check_read(ptr, size) kcsan_check_access(ptr, size, 0)
+#define kcsan_check_read(ptr, size) __kcsan_nodiag(kcsan_check_access(ptr, size, 0))
 
 /**
  * kcsan_check_write - check regular write access for races
@@ -308,7 +318,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define kcsan_check_write(ptr, size)                                           \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
+	__kcsan_nodiag(kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE))
 
 /**
  * kcsan_check_read_write - check regular read-write access for races
@@ -317,7 +327,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define kcsan_check_read_write(ptr, size)                                      \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
+	__kcsan_nodiag(kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE))
 
 /*
  * Check for atomic accesses: if atomic accesses are not ignored, this simply
@@ -329,11 +339,11 @@ static inline void __kcsan_disable_current(void) { }
 #define kcsan_check_atomic_read_write(...)	do { } while (0)
 #else
 #define kcsan_check_atomic_read(ptr, size)                                     \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC)
+	__kcsan_nodiag(kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC))
 #define kcsan_check_atomic_write(ptr, size)                                    \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
+	__kcsan_nodiag(kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE))
 #define kcsan_check_atomic_read_write(ptr, size)                               \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
+	__kcsan_nodiag(kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND))
 #endif
 
 /**
@@ -368,7 +378,7 @@ static inline void __kcsan_disable_current(void) { }
  * @var: variable to assert on
  */
 #define ASSERT_EXCLUSIVE_WRITER(var)                                           \
-	__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
+	__kcsan_nodiag(__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT))
 
 /*
  * Helper macros for implementation of for ASSERT_EXCLUSIVE_*_SCOPED(). @id is
@@ -380,9 +390,9 @@ static inline void __kcsan_disable_current(void) { }
 	struct kcsan_scoped_access __kcsan_scoped_name(id, _)                  \
 		__kcsan_cleanup_scoped;                                        \
 	struct kcsan_scoped_access *__kcsan_scoped_name(id, _dummy_p)          \
-		__maybe_unused = kcsan_begin_scoped_access(                    \
+		__maybe_unused = __kcsan_nodiag(kcsan_begin_scoped_access(     \
 			&(var), sizeof(var), KCSAN_ACCESS_SCOPED | (type),     \
-			&__kcsan_scoped_name(id, _))
+			&__kcsan_scoped_name(id, _)))
 
 /**
  * ASSERT_EXCLUSIVE_WRITER_SCOPED - assert no concurrent writes to @var in scope
@@ -449,7 +459,7 @@ static inline void __kcsan_disable_current(void) { }
  * @var: variable to assert on
  */
 #define ASSERT_EXCLUSIVE_ACCESS(var)                                           \
-	__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT)
+	__kcsan_nodiag(__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT))
 
 /**
  * ASSERT_EXCLUSIVE_ACCESS_SCOPED - assert no concurrent accesses to @var in scope
@@ -525,7 +535,7 @@ static inline void __kcsan_disable_current(void) { }
 #define ASSERT_EXCLUSIVE_BITS(var, mask)                                       \
 	do {                                                                   \
 		kcsan_set_access_mask(mask);                                   \
-		__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT);\
+		__kcsan_nodiag(__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT));\
 		kcsan_set_access_mask(0);                                      \
 		kcsan_atomic_next(1);                                          \
 	} while (0)
