Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D62372B3D
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798953; cv=none; b=pZ7a/cqEPOS1jpfxVtgyZBfQat0AujZ9+1Qz6JBuYJvDgEWkQjsJhtAjT6gGnsVYLPTUSOncjc1anFPFfCspL/rsrTZPVqOzJd2mtGc8CJeUoAmpC2uRVRiK9Qqv6/LbUS6FnE/lcvAwvloZ3eTKFuQM3yyulvCLJnAcK1j0tX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798953; c=relaxed/simple;
	bh=KEzWUq/nd6VUMiB+m86D2CujdVB5TDjE7vzMLQNLsng=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RymryReE2v1XXYxF1jnhdK5A43vPyOIcxLYE5nekVqeG6ewWg7riiDnKdFFG+714cbMSnMw9gqeLFRmbEwnx/10yH1OQ1CTont337dpzkjN82z2a3lkbORo0i1tKFPY2IHb51BoSj9QTLrXbf4V3XRFBNpJyMo/2K2ogPoV1gJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EpU//YkK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LP2tfx1A; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EpU//YkK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LP2tfx1A"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A4C307A0089;
	Tue, 21 Apr 2026 15:15:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 15:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776798949;
	 x=1776885349; bh=KEzWUq/nd6VUMiB+m86D2CujdVB5TDjE7vzMLQNLsng=; b=
	EpU//YkKhA4fwOqImJQYdYLpAli30LZpWxOrgNH2eE9OYT7TEFW2h2mocUp/XgEy
	wFTAcn3mu29xy+Z2MHBf8VJzmL+WsL0EF4HcfakxFLdkmdWQTJfeqXg7DrN6VOBs
	4H4cghdGcZBtpMVjDAsv3otQw+Qz8r1qWDEecaaIHM5QZs7e4CxrGWJWt5ArA9/1
	Ratl8fT1aUr3QFb8dgQRlMhYp+rZA/F9bBKrN5PCuE4klOviI7ipZvdqSQssO3SJ
	oNQzTwE0F6LO7MX55LnEwIQbe3CIFcqhAgSU3VJ/RyOpcmFvQHv5JjmO4HPXGspB
	p0T4ec3e77M61Uwjl95NIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776798949; x=
	1776885349; bh=KEzWUq/nd6VUMiB+m86D2CujdVB5TDjE7vzMLQNLsng=; b=L
	P2tfx1AShT4AXU7EecoFGV1Mayu/HF0l9mlEoUWpcigl7hsBIKzvTVosUzajkFiO
	uTUn4oLZANAQUoFPrQBONAaoYoeEYDJ5VJkkuQ68FWFId0Z4smRxl96tWoJ5mwmq
	Cb4qn4Vy5vCbaHfMsgzcE/8Ijq3ojNpyvgbOtwmHOZbb3s2SwjZityV19HSS+HFj
	3u4s56sQ3u9k7hTjc+jZCz7CscLJIJgydOqH9xUf1pRP7GiuoDMQ/tYET+Kpm+Ha
	7U/zxVHBK/9H/sQ+3gwk6j1Jnn8E8O2RN8YkDRIbsJq5gwqfsYzfj6neWB2FkT43
	DIdpm73J/QJE4+JNwFquw==
X-ME-Sender: <xms:5cznabw5E7vvPX_98sCA7IiTO2fqwCngfjET8MFUFa-oNWeAqtyAFA>
    <xme:5cznaeFQ7Ql7SWNdVFP0FU2Hu9zE8GHFiyaMgNd1rNhWiQwBIcEYvhDUla1IP3pC_
    i477gGjvQHTnPN2VlB0VymPpMCPqsdEt1mjsdV_I-k-hktQkyPrxQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeivddvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:5cznafw6I24jdIbhrKssvF1hIsnY8-rpmDlY86m5AMWYHc1rUXM35w>
    <xmx:5cznaSOkfgPdy0EGy75lizreQd9Iem7t3e2Jkb76cYtozmwrF2xOJg>
    <xmx:5cznaYXLr_yg3YOPNa5UFZsZ8qTmzpd8_NiKouYGVZz8eJnDnG1qWg>
    <xmx:5cznae0pHXssobgjOcLgme8DRYcf__D1w9T5DA84utqOhH8kOm2Amg>
    <xmx:5cznaa8NrzXLEj5cWTARw07ih_jySkgCdcqSYQ4mlPBmWWEK5ZzN0PPS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 137A4700069; Tue, 21 Apr 2026 15:15:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ANrvNuJesXKZ
Date: Tue, 21 Apr 2026 21:12:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>
Cc: "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Message-Id: <49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com>
In-Reply-To: 
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
 <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
 <aed5LYnQvjgWm5Rc@elver.google.com>
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
 <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 21, 2026, at 21:06, Marco Elver wrote:
> On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
> [...]
>> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
>> > so you need to wrap that in a compiler version specific macro,
>> > but since I only saw the warning with gcc-12 and higher, that
>> > should be fine.
>
> Kindly test if you can:
> https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/

Applied to my randconfig tree and verified that this fixes the
known warning (only one out of about 200 random configs). I'll
let you know if something comes up by tomorrow.

Both patches

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks a lot for addressing the warning!
