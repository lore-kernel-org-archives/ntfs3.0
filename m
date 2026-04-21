Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155220468E
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776758071; cv=none; b=VHxwtp6hs5D+eZbnRwXL6e9rPpOarikWV+XG+i9ncJhWIhVmYd+ubbFAlfwN+j30SpR/WVpAVCClOQQkv7eUt13/nw7U6uo3k1JpdvtY7xVgX6lzxYr1rJY//yviwEosQijwcOZMJZ2BgullheBVXiIo2GKhyfHSX9Ril6rHQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776758071; c=relaxed/simple;
	bh=FX5mXztTvEiT8y9AY+qUKwIyCkk8G64z2ffWhC60+OI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=V94T9eFbeaBILU0UdETUEDiNEr9HbAM7R9bfY+Ey+uxX4u1InVJdvmDD/MLMnik7EGOS9JmnTfmQdHARz4oexA/KxvuizbKo7VZ5WbIgmWgbm7iuuFQB3h9inqfuSvYjMVYkz00X1Ilv6QL3UDqrFRUbhvH2XxJfUUn6eqQBo9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=o8tGaNaL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BLrChJsG; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="o8tGaNaL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BLrChJsG"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BA8A77A002F;
	Tue, 21 Apr 2026 03:54:28 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 03:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1776758068; x=1776844468; bh=y0
	r/tPCjSECGdP0W7MdF7I/8EFQG+yp0H9dZdNXTcFo=; b=o8tGaNaLRTrkGHxer9
	VUSIc/Kr+Dr7GUQzgnZHTIrpMNqly1gSwzHv2F+7MgQlSRGoip+/u4w/2tRMx9q6
	PcR+RqBmNt70U+Nfj2BZvN5rIFe3/3rRs6nJ8DnadyWd0efkIETNHsqWznkna8hS
	Z52bOYTGaNdIkLFETHwrB0YCPUWB8ycFQ4GPh5QkzUmJb934/0giZ8iC3dfrtAqq
	oFR5miLeXkHaDEafwsw+iQOuIhCo7EtlgF1bM6sZGTWX/VPh6dVY5IEEaD2nkqVb
	ymHQNhEOz4BV5c4DwbZW9AICFu8JJDX5Yczett758MmNMDkG9tKB/Bd2jPDWd2Gl
	WTQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776758068; x=1776844468; bh=y0r/tPCjSECGdP0W7MdF7I/8EFQG
	+yp0H9dZdNXTcFo=; b=BLrChJsG1ObPZEJ0CwD5Kl2GdG726UMNrerPH0rcyiM/
	TDZmbK8kVy/1Ds5s8Dk4RpDoi3r+YB83dsZX2ZxTJ610ZArjMzcONHPnv0iz2KBL
	/1ZdLLIDtlQcUgaIwDZxO14HIMfCBzWYzEodYx2kGuN5t8Z+5SK1dkZHLIbeEdXJ
	HqjKsJJVZkHZolGIP8ohCn16guUPDE4w4uKJ4nX6EYuLXB4lwJUsaNvMOz6yy7tV
	GRZq0tJhowWt1j0RpVfL7eAZizSMZG63zEYcrOlk1QrTPgspAPfWutmNoJtQlQUx
	4xAThjL5qbAPsCYdwXP9diiNHqh98KpgoFU+0MFx1A==
X-ME-Sender: <xms:NC3nafnTRzxb-_4w4OFF6jS1nZmDF0nzk6f6K930n0P0WeSkN8rg8Q>
    <xme:NC3nadrKIWZq97OXCZV5cO5wGWh1QDrbQPR2WL-xIDkCUwLb3O-wNGHzJPI6bKgLE
    m8CL-qaYFHW3qdpXjrhv1-eN7qfZItQtA0c00WSBOM7r8nNUJjLm4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeitdekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    ffffffheeugfefhfduvefgleeijeektdfffeeijedthfevgfeiieevjeeuteefvdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrg
    hrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeguvhihuhhkohhvsehgohhoghhlvgdrtghomhdprhgtphhtthhopegvlhhvvg
    hrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehktghsrghnqdguvghvsehgohhoghhl
    vghgrhhouhhpshdrtghomhdprhgtphhtthhopehnthhfshefsehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheprghlmhgriidrrghlvgigrghnughrohhvihgthhesphgr
    rhgrghhonhdqshhofhhtfigrrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NC3naSHSBrCAgb00AS27ntaSwMOvFIddQ_iLFEth-bWCQWfV46dWsw>
    <xmx:NC3naeQ8Tffn5jwOgvYaoEeKW6LUkvt6OLmg_3U4VYsC7KVmniIVTg>
    <xmx:NC3nabI70Jhd_-fa5LKGdpobwIQPAoiHVvjxIKWLQlK9-Dg0pHqaOA>
    <xmx:NC3naRZbMYk12H7Tw3gY8XWiWEQntOsYl9PEXp2WrOfxYXRtz1PiOw>
    <xmx:NC3naXDPIqGbbEKkuhFyDXakNEceVrAnTT8O0KYAJCnhpbi-Z7md_8lT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2BFFF700065; Tue, 21 Apr 2026 03:54:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 09:53:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 kcsan-dev@googlegroups.com
Message-Id: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
Subject: kcsan -Wmaybe-uninitialized warning in ntfs3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

ntfs3 started enabling -Wmaybe-uninitialized, a warning that is generally
useful but is normally disabled in the kernel because of too many
false positives when used with sanitizers and some other gcc options.

I ran into one such warning in today's linux-next:

  CC      fs/ntfs3/file.o
In file included from /home/arnd/arm-soc/include/asm-generic/rwonce.h:27,
                 from /home/arnd/arm-soc/arch/arm64/include/asm/rwonce.h:81,
                 from /home/arnd/arm-soc/include/linux/compiler.h:369,
                 from /home/arnd/arm-soc/include/linux/array_size.h:5,
                 from /home/arnd/arm-soc/include/linux/kernel.h:16,
                 from /home/arnd/arm-soc/include/linux/backing-dev.h:12,
                 from /home/arnd/arm-soc/fs/ntfs3/file.c:10:
In function 'instrument_copy_from_user_before',
    inlined from '_inline_copy_from_user' at /home/arnd/arm-soc/include/linux/uaccess.h:184:2,
    inlined from 'copy_from_user' at /home/arnd/arm-soc/include/linux/uaccess.h:221:9,
    inlined from 'ntfs_ioctl_fitrim' at /home/arnd/arm-soc/fs/ntfs3/file.c:77:6,
    inlined from 'ntfs_ioctl' at /home/arnd/arm-soc/fs/ntfs3/file.c:164:10:
/home/arnd/arm-soc/include/linux/kcsan-checks.h:220:28: error: 'range' may be used uninitialized [-Werror=maybe-uninitialized]
  220 | #define kcsan_check_access __kcsan_check_access
      |                            ^
/home/arnd/arm-soc/include/linux/kcsan-checks.h:311:9: note: in expansion of macro 'kcsan_check_access'
  311 |         kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
      |         ^~~~~~~~~~~~~~~~~~
/home/arnd/arm-soc/include/linux/instrumented.h:147:9: note: in expansion of macro 'kcsan_check_write'
  147 |         kcsan_check_write(to, n);
      |         ^~~~~~~~~~~~~~~~~
/home/arnd/arm-soc/include/linux/kcsan-checks.h: In function 'ntfs_ioctl':
/home/arnd/arm-soc/include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
   37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
      |      ^~~~~~~~~~~~~~~~~~~~
/home/arnd/arm-soc/fs/ntfs3/file.c:65:29: note: 'range' declared here
   65 |         struct fstrim_range range;
      |                             ^~~~~

What happens here is that copy_from_user() is used in a very
normal way to copy a user space structure into a previously
uninitialized on-stack buffer. With KCSAN enabled, this passes
the pointer to that buffer into __kcsan_check_access(), which
takes a 'const volatile void *' pointer. Gcc correctly notices
that there is no way to access the data behind this pointer
when it hasn't been initialized yet, as both read and write
would cause undefined behavior.

I'm not sure what a good solution would be to avoid this,
but I assume this should be fixed in the kcsan instrumentation.
I tried changing that code to pass non-const pointers for
any instrument_write variant, which does avoid the warning,
but also adds a bit of complexity, see below.

Any other ideas?

     Arnd

diff --git a/include/linux/instrumented.h b/include/linux/instrumented.h
index a1b4cf81adc2..d28aa6b0aeb8 100644
--- a/include/linux/instrumented.h
+++ b/include/linux/instrumented.h
@@ -36,7 +36,7 @@ static __always_inline void instrument_read(const volatile void *v, size_t size)
  * Instrument a regular write access. The instrumentation should be inserted
  * before the actual write happens.
  */
-static __always_inline void instrument_write(const volatile void *v, size_t size)
+static __always_inline void instrument_write(volatile void *v, size_t size)
 {
 	kasan_check_write(v, size);
 	kcsan_check_write(v, size);
@@ -50,7 +50,7 @@ static __always_inline void instrument_write(const volatile void *v, size_t size
  * Instrument a regular write access. The instrumentation should be inserted
  * before the actual write happens.
  */
-static __always_inline void instrument_read_write(const volatile void *v, size_t size)
+static __always_inline void instrument_read_write(volatile void *v, size_t size)
 {
 	kasan_check_write(v, size);
 	kcsan_check_read_write(v, size);
@@ -92,7 +92,7 @@ static __always_inline void instrument_atomic_read(const volatile void *v, size_
  * Instrument an atomic write access. The instrumentation should be inserted
  * before the actual write happens.
  */
-static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
+static __always_inline void instrument_atomic_write(volatile void *v, size_t size)
 {
 	kasan_check_write(v, size);
 	kcsan_check_atomic_write(v, size);
@@ -107,7 +107,7 @@ static __always_inline void instrument_atomic_write(const volatile void *v, size
  * Instrument an atomic read-write access. The instrumentation should be
  * inserted before the actual write happens.
  */
-static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
+static __always_inline void instrument_atomic_read_write(volatile void *v, size_t size)
 {
 	kasan_check_write(v, size);
 	kcsan_check_atomic_read_write(v, size);
@@ -141,7 +141,7 @@ instrument_copy_to_user(void __user *to, const void *from, unsigned long n)
  * variants). The instrumentation should be inserted before the accesses.
  */
 static __always_inline void
-instrument_copy_from_user_before(const void *to, const void __user *from, unsigned long n)
+instrument_copy_from_user_before(void *to, const void __user *from, unsigned long n)
 {
 	kasan_check_write(to, n);
 	kcsan_check_write(to, n);
diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index 92f3843d9ebb..e598fd9679a9 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -34,7 +34,8 @@
  * @size: size of access
  * @type: access type modifier
  */
-void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
+void __kcsan_check_read_access(const volatile void *ptr, size_t size, int type);
+void __kcsan_check_write_access(volatile void *ptr, size_t size, int type);
 
 /*
  * See definition of __tsan_atomic_signal_fence() in kernel/kcsan/core.c.
@@ -186,8 +187,8 @@ void kcsan_end_scoped_access(struct kcsan_scoped_access *sa);
 
 #else /* CONFIG_KCSAN */
 
-static inline void __kcsan_check_access(const volatile void *ptr, size_t size,
-					int type) { }
+static inline void __kcsan_check_read_access(const volatile void *ptr, size_t size, int type) { }
+static inline void __kcsan_check_write_access(volatile void *ptr, size_t size, int type) { }
 
 static inline void __kcsan_mb(void)			{ }
 static inline void __kcsan_wmb(void)			{ }
@@ -217,7 +218,8 @@ static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
  * Only calls into the runtime when the particular compilation unit has KCSAN
  * instrumentation enabled. May be used in header files.
  */
-#define kcsan_check_access __kcsan_check_access
+#define kcsan_check_write_access __kcsan_check_write_access
+#define kcsan_check_read_access __kcsan_check_read_access
 
 /*
  * Only use these to disable KCSAN for accesses in the current compilation unit;
@@ -226,8 +228,8 @@ static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
 #define __kcsan_disable_current kcsan_disable_current
 #define __kcsan_enable_current kcsan_enable_current_nowarn
 #else /* __SANITIZE_THREAD__ */
-static inline void kcsan_check_access(const volatile void *ptr, size_t size,
-				      int type) { }
+static inline void kcsan_check_read_access(const volatile void *ptr, size_t size, int type) { }
+static inline void kcsan_check_write_access(volatile void *ptr, size_t size, int type) { }
 static inline void __kcsan_enable_current(void)  { }
 static inline void __kcsan_disable_current(void) { }
 #endif /* __SANITIZE_THREAD__ */
@@ -273,7 +275,7 @@ static inline void __kcsan_disable_current(void) { }
  * @ptr: address of access
  * @size: size of access
  */
-#define __kcsan_check_read(ptr, size) __kcsan_check_access(ptr, size, 0)
+#define __kcsan_check_read(ptr, size) __kcsan_check_read_access(ptr, size, 0)
 
 /**
  * __kcsan_check_write - check regular write access for races
@@ -282,7 +284,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define __kcsan_check_write(ptr, size)                                         \
-	__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
+	__kcsan_check_write_access(ptr, size, KCSAN_ACCESS_WRITE)
 
 /**
  * __kcsan_check_read_write - check regular read-write access for races
@@ -291,7 +293,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define __kcsan_check_read_write(ptr, size)                                    \
-	__kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
+	__kcsan_check_read_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
 
 /**
  * kcsan_check_read - check regular read access for races
@@ -299,7 +301,7 @@ static inline void __kcsan_disable_current(void) { }
  * @ptr: address of access
  * @size: size of access
  */
-#define kcsan_check_read(ptr, size) kcsan_check_access(ptr, size, 0)
+#define kcsan_check_read(ptr, size) kcsan_check_read_access(ptr, size, 0)
 
 /**
  * kcsan_check_write - check regular write access for races
@@ -308,7 +310,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define kcsan_check_write(ptr, size)                                           \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
+	kcsan_check_write_access(ptr, size, KCSAN_ACCESS_WRITE)
 
 /**
  * kcsan_check_read_write - check regular read-write access for races
@@ -317,7 +319,7 @@ static inline void __kcsan_disable_current(void) { }
  * @size: size of access
  */
 #define kcsan_check_read_write(ptr, size)                                      \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
+	kcsan_check_write_access(ptr, size, KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE)
 
 /*
  * Check for atomic accesses: if atomic accesses are not ignored, this simply
@@ -329,11 +331,11 @@ static inline void __kcsan_disable_current(void) { }
 #define kcsan_check_atomic_read_write(...)	do { } while (0)
 #else
 #define kcsan_check_atomic_read(ptr, size)                                     \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC)
+	kcsan_check_read_access(ptr, size, KCSAN_ACCESS_ATOMIC)
 #define kcsan_check_atomic_write(ptr, size)                                    \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
+	kcsan_check_write_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE)
 #define kcsan_check_atomic_read_write(ptr, size)                               \
-	kcsan_check_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
+	kcsan_check_write_access(ptr, size, KCSAN_ACCESS_ATOMIC | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND)
 #endif
 
 /**
@@ -368,7 +370,7 @@ static inline void __kcsan_disable_current(void) { }
  * @var: variable to assert on
  */
 #define ASSERT_EXCLUSIVE_WRITER(var)                                           \
-	__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
+	__kcsan_check_write_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
 
 /*
  * Helper macros for implementation of for ASSERT_EXCLUSIVE_*_SCOPED(). @id is
@@ -449,7 +451,7 @@ static inline void __kcsan_disable_current(void) { }
  * @var: variable to assert on
  */
 #define ASSERT_EXCLUSIVE_ACCESS(var)                                           \
-	__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT)
+	__kcsan_check_read_access(&(var), sizeof(var), KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT)
 
 /**
  * ASSERT_EXCLUSIVE_ACCESS_SCOPED - assert no concurrent accesses to @var in scope
@@ -525,7 +527,7 @@ static inline void __kcsan_disable_current(void) { }
 #define ASSERT_EXCLUSIVE_BITS(var, mask)                                       \
 	do {                                                                   \
 		kcsan_set_access_mask(mask);                                   \
-		__kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT);\
+		__kcsan_check_read_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT);\
 		kcsan_set_access_mask(0);                                      \
 		kcsan_atomic_next(1);                                          \
 	} while (0)
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 8a7baf4e332e..289634c3de5c 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -953,11 +953,17 @@ void kcsan_end_scoped_access(struct kcsan_scoped_access *sa)
 }
 EXPORT_SYMBOL(kcsan_end_scoped_access);
 
-void __kcsan_check_access(const volatile void *ptr, size_t size, int type)
+void __kcsan_check_read_access(const volatile void *ptr, size_t size, int type)
 {
 	check_access(ptr, size, type, _RET_IP_);
 }
-EXPORT_SYMBOL(__kcsan_check_access);
+EXPORT_SYMBOL(__kcsan_check_read_access);
+
+void __kcsan_check_write_access(volatile void *ptr, size_t size, int type)
+{
+	check_access(ptr, size, type, _RET_IP_);
+}
+EXPORT_SYMBOL(__kcsan_check_write_access);
 
 #define DEFINE_MEMORY_BARRIER(name, order_before_cond)				\
 	void __kcsan_##name(void)						\
diff --git a/kernel/kcsan/debugfs.c b/kernel/kcsan/debugfs.c
index 2af39ba5b70b..665a06bc37a7 100644
--- a/kernel/kcsan/debugfs.c
+++ b/kernel/kcsan/debugfs.c
@@ -75,7 +75,7 @@ static noinline void microbenchmark(unsigned long iters)
 		unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
 		int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
 				(!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
-		__kcsan_check_access((void *)addr, sizeof(long), type);
+		__kcsan_check_write_access((void *)addr, sizeof(long), type);
 	}
 	cycles = get_cycles() - cycles;
 
diff --git a/mm/slub.c b/mm/slub.c
index 161079ac5ba1..b1dcfc575407 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2621,8 +2621,8 @@ bool slab_free_hook(struct kmem_cache *s, void *x, bool init,
 
 	/* Use KCSAN to help debug racy use-after-free. */
 	if (!still_accessible)
-		__kcsan_check_access(x, s->object_size,
-				     KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT);
+		__kcsan_check_write_access(x, s->object_size,
+				   	   KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ASSERT);
 
 	if (kfence_free(x))
 		return false;
diff --git a/mm/vma_init.c b/mm/vma_init.c
index 3c0b65950510..248e9042a6af 100644
--- a/mm/vma_init.c
+++ b/mm/vma_init.c
@@ -125,7 +125,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 	if (!new)
 		return NULL;
 
-	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
+	ASSERT_EXCLUSIVE_WRITER(orig->flags);
 	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
 	vm_area_init_from(orig, new);
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9b11cf3193b9..7a3650fb10db 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1155,7 +1155,8 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store8_noabort",
 	"__asan_report_store16_noabort",
 	/* KCSAN */
-	"__kcsan_check_access",
+	"__kcsan_check_read_access",
+	"__kcsan_check_write_access",
 	"__kcsan_mb",
 	"__kcsan_wmb",
 	"__kcsan_rmb",
