Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DD3C661C
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774534; cv=none; b=f/s54Ljn1mPsnQ3cxNIZvcE7mvtRnRRgatwC8GksesBdb71FgV2EfqN953/84layRov6RI2sjBOnVkaKGVCbtQrpkcpi1u5riJZT5eZa1ZeBDYsXGPv8Cf8X6ugl2rI+MueMzCZLyP29Sp6lpObh+IXU8fCNsdKfpPJNaNF5tzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774534; c=relaxed/simple;
	bh=E/To18PLKyBUMTtmPNqJnYXGQERQJ33zKyGE56k8wVI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ffW7uiqhfAmeiAMsKWmbTieQreb9DrFvC0rAp3E6PwqSYQ76RYy+w6PNZau29Tm0bYV/1kKYWoUbe3uiahak9HLNYp1Qy/hi3YzKZGJTLGYNZDF81bcmAqAF1YkB1datxzfN4AhHWkgoqLhH8cyXU5VZH70jEPj8X36tjGPW5+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Js8JbC4t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nPJDEz4C; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Js8JbC4t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nPJDEz4C"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 009501D002B5;
	Tue, 21 Apr 2026 08:28:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 08:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776774524;
	 x=1776860924; bh=5J/VMLp9yx28PS7xsT3n8prm1Nndfw47rnmcpT8UasQ=; b=
	Js8JbC4tWhO0uHIIoXGncOFyqycO5yCfZYgF8JNXgdMRUaNXacZ8OoMdpiJb+/dz
	XPUBdKaNL6O//r8DaYVIr2DibloOknQ9O5I0Kau0GCmD558zEifRAA8ZsEBq5gQ0
	b3Fj0DNvonN3mLpC6npdpNbZmyUtAK+bJwji1dJPaY8RWSvDzw5ub1jpxGERhF/o
	dUcCrvGsoFf3GjltTNuFDrnIyxIVedCE7ubVGowuWjPHXyaD2NuRZqThnTjD1lMC
	PpW3ymw5heLi4VsuLc+uQ+v9+KR9vkD8lf7c/Uza8Sg59tMW8WoPqgoVEQirGMXJ
	Yp0jTX3SejP8QRtDMKBKmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776774524; x=
	1776860924; bh=5J/VMLp9yx28PS7xsT3n8prm1Nndfw47rnmcpT8UasQ=; b=n
	PJDEz4CcLwErRgGBK4mzprHcNKK03BHn0+t4REXHd2OXqfkLDSEwVcMX8WfFWGos
	eX5o5zgneslOT0vPKSVU63Cn7cRzuK9acH1WKiq0/5xMGGqT7xU+cqpOWXeC8Dbm
	Q2em5CMsGrWkWmNTxlkeXAR09BfGX9mO0YQKQlo2vpaj1VZ3Fni1mHnIq63wmLec
	mnnf0ol4q5ZtUdGck2l1CTsIGh+O8unVEY8Y5/7uju0XTooHR/hAhJryYmVo/rg+
	yxgOqVi6pbc+iqCoNkqzVv4bWAAL8FQ0E1HgrJARCVDJWrv7V2Tp/ApaQcuFi6Hw
	Ce24/XYzkegQzWB9zy6wg==
X-ME-Sender: <xms:fG3nablLzYCKFGnn0MFrfzUMqzv2nWMBu8Y3H3tekgD0_nOXMYszJw>
    <xme:fG3naZpHjGHW9ajRh0pfXEnJVgiYcJYY2ZLRDxGqXyaT0OfoMt6-ud6Ou45Uo7Pf5
    B94hzvOrK_7tiFlhO4i567THqAsIX1zA2FZG5Phi-g9l1fQMrRf748>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeguvhihuhhkohhvsehgohhoghhlvgdrtghomhdprhgtphhtthhopegvlh
    hvvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkrghsrghnqdguvghvsehgohho
    ghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehnthhfshefsehlihhsthhsrdhlih
    hnuhigrdguvghvpdhrtghpthhtoheprghlmhgriidrrghlvgigrghnughrohhvihgthhes
    phgrrhgrghhonhdqshhofhhtfigrrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:fG3naeFH3mlv5la9o08NGPxll5Ve-U68EhFoDaMP7ypHw6LmE3dM6Q>
    <xmx:fG3naaTf1Li6u_GNzWzfB2FRzko_4lE5zXrJ5b6M98YB5AzBtEbfnQ>
    <xmx:fG3naXIHyWQxShBOWM2hOa5yxcO1UhaXkS9qxnD024l7-R2lRgZhfw>
    <xmx:fG3nadabLj5Gzmux4BHLJVrQuHKukxEE2CtKS6yGyWkKgaZvj8exwQ>
    <xmx:fG3naTAy6x4DiYWB776oPALc18gblOG6jSb2ZqmZghO2VIVW423l1sr1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8EC6A70006A; Tue, 21 Apr 2026 08:28:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ANrvNuJesXKZ
Date: Tue, 21 Apr 2026 14:28:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>
Cc: "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Message-Id: <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
In-Reply-To: 
 <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
 <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 21, 2026, at 13:35, Marco Elver wrote:
> On Tue, 21 Apr 2026 at 12:21, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> I ran into this during randconfig testing, I have attached a
>> reproducer .config here, but have not tried to narrow down the
>> configuration options that are required for triggering it.
>
> The attached .config is a KASAN config, still can't reproduce.

Odd, this is what I see in the attached file:

CONFIG_ARM64=y
CONFIG_KCSAN=y
CONFIG_KCSAN_SELFTEST=y
CONFIG_KCSAN_EARLY_ENABLE=y
CONFIG_KCSAN_NUM_WATCHPOINTS=64
CONFIG_KCSAN_UDELAY_TASK=80
CONFIG_KCSAN_UDELAY_INTERRUPT=20
# CONFIG_KCSAN_DELAY_RANDOMIZE is not set
CONFIG_KCSAN_SKIP_WATCH=4000
# CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE is not set
CONFIG_KCSAN_INTERRUPT_WATCHER=y
CONFIG_KCSAN_REPORT_ONCE_IN_MS=3000
CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN=y
CONFIG_KCSAN_STRICT=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

I forgot to mention that the reproducer was on arm64, if you
tried building for x86, that may have messed up the config.

I've reverted my workaround in the randconfig tree now to see if
I can find a reproducer for x86 as well, in case that is easier.

      Arnd
