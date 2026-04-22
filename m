Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6B01FC7
	for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776891469; cv=none; b=BNhYdfbSXNtc+DDIPg6NejOYnLCfhBww8BrAXz4AANeOBXMcDgsZnS+NXyR/JKlidwaZYWUkZp4Gvfc8W9e0NLeQruGI+8P3c2wycaFOLffGy5JwNgGtxuJccRYvjXExyZv7gj1LcImcQ4LWXoxk/Nq3WqtGCeMggLpb+auSWaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776891469; c=relaxed/simple;
	bh=0mAxGwBYkzjaDebvmGEKFzJZ82q3gRMMto+gZNmuEr4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NfyxpiucRQQjPNNBEInxPj2FoF/wKrHfwi1nTRROMr0NDJtBx6B/bTfbgBlHkCyPg3668ByXtwJPYFfVktJjlteajh/TpHJ3WkjrvW0D6ddYsE+PQ8YDqcQar0VneHYmjiKBooWMAgFedMUh816cuQS8KX+CRJc3LajuIL3HWwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=mDGo8ygw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AMCLh8gf; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="mDGo8ygw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AMCLh8gf"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 007927A0148;
	Wed, 22 Apr 2026 16:57:46 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 22 Apr 2026 16:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1776891466;
	 x=1776977866; bh=aLAAOcvfd0JGYiGI2UeIAyO/wBncxcuOAUajBc1eUjI=; b=
	mDGo8ygw3xrgwOHmSdOYYqjxXXKxKZSixdZaRjtJsfMirExjiPHGWEZNTZnkVFd+
	lo91xhBlsUOLe71Arxb1QyVRzr3GeM8ngfqlgwWezRBkwyvCaSyet7u79qjgpWBJ
	+34HACcEAATuzr7A6OqUrNuYY/6SpQaW4AD01PiFqWmLxOHwCSkNp+xOf0nvJpAE
	YfMc+skeRLlxaH98fCYylrbx2vv7ESJBNicj/uE8/qopmD2UkP6D8YgL5QK7luRF
	hEHvbfMCOmGsJ3j+oLhfUBxUygprMSYEdI3THjb+erJP7LXJpH11lMDfs8UQfsx+
	abV3fIS6kM8qfbApWMSWdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776891466; x=
	1776977866; bh=aLAAOcvfd0JGYiGI2UeIAyO/wBncxcuOAUajBc1eUjI=; b=A
	MCLh8gf0hi+/Gvd9jsMRoRIvsZGHYcYdHnQjvu4Wge8GcGM+A5IFSiIFs0rjCZxC
	pBkj+RirGHZFSP0JhqDhORzAPLWym/RlDmaB7shHyYbeDsDXHjV0yoclLQZI4rsg
	IYLmp2DfAq2HYU6xYicLGP0kdhrZmLoP7U7OZlRPiSC1nTD2X9CuX2PG+Q/gEhUZ
	gFHGuMsLhSclhUjqZKSkRr5E3G/t9kUyEF/uAGZ0SfnG2bKj4t7xk2wghOYAdmoj
	G1n6cpKcmP0wx4BW+GC5WW1hNC9ivqU1FWvlBn4OdEjWHv0lPt2cGcmL2Hdla5pG
	Dg4mWZJYLrRXYo7zhKCmA==
X-ME-Sender: <xms:SjbpaQCeGl8q3yK55RdwrDPcSeWoD4vyB5sK3bSnxUEjN1XxCPX_sw>
    <xme:SjbpadUZ2Ov5RD55N0eWQ7FokGFEUJcrQdLbzUIrAOmbWOx6GrkMiZTNj7cBPzolD
    5DxqS1IVGLB7oI3svaUwmP_c72_lvBbguUWvolCR-iU16SzTt4W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeihedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughvhihukhhovhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepvghlvhgvrhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepkhgrshgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtg
    hpthhtohepnhhtfhhsfeeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegr
    lhhmrgiirdgrlhgvgigrnhgurhhovhhitghhsehprghrrghgohhnqdhsohhfthifrghrvg
    drtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:SjbpaWCdVRhYnIWsyMbHzSRS2ibaTzn1uR9a8Jr0Zvd30i0R8k6LVg>
    <xmx:SjbpabdgiCtTQREo_G36r4tBE62wf65S9uHGQHE6lTGz7Z6VDvQRtQ>
    <xmx:SjbpaYkOsviDLKxUbvZ6ICfjgIQy0f57gl57Tx4MGihZ76-cJEg37Q>
    <xmx:SjbpaaFK-Q9Tg3ZcSWjTuNo5OiuhbfA3ygrMluWXGaVSvXxOJW04hA>
    <xmx:SjbpaUN-6RyJ5OW3DzwoHwGJQWt06EqYsOUMrSp7YZhZLHRX0Q5yNp7E>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 61E4E700065; Wed, 22 Apr 2026 16:57:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ANrvNuJesXKZ
Date: Wed, 22 Apr 2026 22:57:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>
Cc: "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Message-Id: <f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com>
In-Reply-To: 
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
 <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
 <aed5LYnQvjgWm5Rc@elver.google.com>
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
 <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
 <49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com>
 <4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2026, at 10:23, Marco Elver wrote:
> On Wed, 22 Apr 2026 at 10:00, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Apr 21, 2026, at 21:12, Arnd Bergmann wrote:
>> > On Tue, Apr 21, 2026, at 21:06, Marco Elver wrote:
>> >> On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
>> >> [...]
>> >>> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
>> >>> > so you need to wrap that in a compiler version specific macro,
>> >>> > but since I only saw the warning with gcc-12 and higher, that
>> >>> > should be fine.
>> >>
>> >> Kindly test if you can:
>> >> https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/
>> >
>> > Applied to my randconfig tree and verified that this fixes the
>> > known warning (only one out of about 200 random configs). I'll
>> > let you know if something comes up by tomorrow.
>>
>> Unfortunately, there are new warnings after your patches using
>> gcc-11. In 500 randconfig builds with that compiler, I saw 7
>> configurations failing with one of these four messages:
>
> Looks like a compiler bug to me; can you check gcc-12+ ? Maybe we need
> to allow the __access attribute only for later GCC versions.

All gcc versions I tried that support kcsan run into some of
the warnings, but the exact set is not always the same.

The stringop-overread warnings are (like -Wmaybe-uninitialized)
a bit unpredictable and depend on the exact optimizations taken
by the compiler, to see exactly which object is passed into
a string operation and what its size is.

I'm guessing that by annotating a function argument as being
not accessed, gcc starts assuming that the object has zero
valid bytes if it cannot deduce the actual length in any
other way.

     Arnd

