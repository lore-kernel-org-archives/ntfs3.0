Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801053D6CCD
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780713; cv=none; b=YM4pnoMfZ5rpjq3L8n8IveDedh9doHMGtN7tAROenCWXuTdqnXWgFtmPstYRtsUU8d27jmKvwENT8KS3+yC2R0qLFz6Hik39NbvlbVYZw2QESq8kHIxVmxpMtHL+/oI84lMAAK1vsG2etB0m4eNRaUsT2ndUgrJewLupW2wL7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780713; c=relaxed/simple;
	bh=UlfTdO+YsryuqWPCCxdEpeNCsmxL7wYXMVvelqAdrQI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ldgYLfnAieLyuG2kmTlyygjLYWhRIABr7qu1oCqRgcorElC/eK8fJGW2H8OrY3CzogjXj7ytMAjx2edPbBu9H0fiBcI9CMNAK4j/au8uW1w/HIc7/49e0HM2LH1aAI94QgYV+sdaTRJoNXTQOeaV7byZyuLRZ0SyPOKJSn9fI0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WAqN5y25; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gy9QYMoE; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WAqN5y25";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gy9QYMoE"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A842C1D00111;
	Tue, 21 Apr 2026 10:11:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 10:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776780709;
	 x=1776867109; bh=e7iiQBpUlRP4z08trzvyDoUfZDq3kiCCk46x9wcbd2k=; b=
	WAqN5y253I4TXyUwYUImZ5uF1WSjqE75Vw7ZfyY2BdfoAeueHn8UJuWh1GwyxIzA
	//Ob5Keec0HSmPqF5Jkhy245tEiMXjbq35MBz5g/AuYb66ZjSbd0iPop87LN2VwD
	+oXQpnRg4UUGC8EPmQzjScDEexsi1jXvZp+xthY3cQQSEGwLZlkxweHCm6fkAH5r
	fc2yPYehZdEGX6ITSTJ3v/jszSigid11kL1Z0ZVLNb/FBndw0N2VyEyATBIZqsbZ
	K/W5oXcnSEe/1JpFhY/2o5aJrx321YSucLVHbnw1M7jnbsEv8R0NwfxyawREld1l
	H1Rw2dhRdDoWpzGSKDz5hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776780709; x=
	1776867109; bh=e7iiQBpUlRP4z08trzvyDoUfZDq3kiCCk46x9wcbd2k=; b=G
	y9QYMoE5x1FsI/9/LquC1KA+j8jx+I1UPF1i77WprvjBYyYb8Em0aOiSZTo6m1ki
	4AhDTIH3TXTbJ4FDg+pdNHOnHRm1D2EuiE5dLKSSW1pLLAwxSYAM4iVSeasihcqk
	zyBe8eaeBlttRwpYRdzIf06BIeN7DHUCeVfYx0dHDMdeWLDcZY0oom1G1MHANAoG
	XXmbeRZDmn+hWNDPoGkrHrQdA9JDZw/G/mo5E9YMcyG39oekYeiMZ2DT2T59v4xi
	oPHhMNbMRkTbWkAjapMnVSm5aGimU5J4AfWljOPc4kpsRQKiewM/iQhHWKROvUe/
	KcDtmB2XHSkV4L4y9gQmA==
X-ME-Sender: <xms:pYXnaf2jLpeafL22NcWNp38HB3D_1cNp32OMnCmsAhMgfH4mtPy6Sw>
    <xme:pYXnaY70-7Rjsgbv1bq7X9FnNw_SOY8-0vJXGec7Z3Z6QfQLy9D-mUj98NIbGTxg9
    8hsQRDIfE6CNclSiaXVuIHV-timnpn0oPeQJXNOFX8pCinjG_74qKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeevueejtdfgtdejudeltddttdevffdvledugffhtdfgueekgfekhffgfeelkeeijeen
    ucffohhmrghinhepghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthho
    peeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvhihuhhkohhvsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegvlhhvvghrsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtth
    hopehnthhfshefsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghlmhgr
    iidrrghlvgigrghnughrohhvihgthhesphgrrhgrghhonhdqshhofhhtfigrrhgvrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:pYXnaUU-5ljfDNPAsRKPCWdhKCyBZGPuTmZE9Hl32zfbQFw0nSnG8g>
    <xmx:pYXnaTigxoK6M0TbmShBhV4WvOj2IJc9Uyg2grl0-pnp1zT6pNC2qw>
    <xmx:pYXnaXb-LHSvXKfPTr5XLr-0Q4Rp7Myo7jPsqVkz5KZmH3wNm-Rq7A>
    <xmx:pYXnaYpgXMvq-6nBKpDtjrsC7SDUQQPwLQBhvyg8VTawAxCs85wGjw>
    <xmx:pYXnacSmscmnQBc9TNGhUyB-DtguRK9Z_fKWg8dqdpiI-Wlr-ZLLx3UZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1DA59700069; Tue, 21 Apr 2026 10:11:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ANrvNuJesXKZ
Date: Tue, 21 Apr 2026 16:11:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>
Cc: "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Message-Id: <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
In-Reply-To: <aed5LYnQvjgWm5Rc@elver.google.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
 <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
 <aed5LYnQvjgWm5Rc@elver.google.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 21, 2026, at 15:18, Marco Elver wrote:
> On Tue, Apr 21, 2026 at 02:28PM +0200, Arnd Bergmann wrote:
>
> There appear to be 2 options to fix, see patch below:
>
> 1. __kcsan_nodiag wrapper to disable warnings for the kcsan_check
>    helpers. Tested and seems to work in this case.
>
> 2. __attribute__((access(none, 1))) per 
> https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html:
>    "The access attribute enables the detection of invalid or unsafe
>    accesses by functions or their callers, as well as write-only
>    accesses to objects that are never read from. Such accesses may be
>    diagnosed by warnings such as -Wstringop-overflow, -Wuninitialized,
>    -Wunused, and others."
>
> Option #2 seems a lot simpler. While KCSAN does read the accessed
> memory, for the purpose of diagnostics hiding this fact from the
> compiler is perfectly fine as it's not part of "normal" kernel code.
>
> Preferences?

To me, 2 makes more sense. The attribute requires gcc-11 or higher,
so you need to wrap that in a compiler version specific macro,
but since I only saw the warning with gcc-12 and higher, that
should be fine.

I assume that gcc would be allowed to reorder code like

     int i = 1;
     __kcsan_check_write(&i, sizeof(i));

to defer the initialization until after the check with
the attribute((access(none, 1))) annotation. Is that a
problem for kcsan?

Looking through your change I also see

> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index b041639ab406..088412189f16 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -73,6 +73,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info 
> *sbi, unsigned long arg)
>  	if (!bdev_max_discard_sectors(dev))
>  		return -EOPNOTSUPP;
> 
> +	kcsan_check_write(&range, sizeof(range));
>  	user_range = (struct fstrim_range __user *)arg;

This was probably not meant to be there.

> @@ -273,7 +283,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @ptr: address of access
>   * @size: size of access
>   */
> -#define __kcsan_check_read(ptr, size) __kcsan_check_access(ptr, size, 
> 0)
> +#define __kcsan_check_read(ptr, size) 
> __kcsan_nodiag(__kcsan_check_access(ptr, size, 0))

I don't think we need to do anything about the read and read_write
code paths: if the compiler can see that the data passed here
is uninitialized, warning about this is better than not warning.
 
The problem I see was specifically for __kcsan_check_write()
with an uninitialized pointer

> @@ -282,7 +292,7 @@ static inline void __kcsan_disable_current(void) { }
>   * @size: size of access
>   */
>  #define __kcsan_check_write(ptr, size)                                 
>         \
> -	__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
> +	__kcsan_nodiag(__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE))

So if we end up using __diag_ignore(), it should be sufficient to
add it here directly, instead of another indirection.

      Arnd
