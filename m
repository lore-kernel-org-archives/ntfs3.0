Received: from mail135.mailersend.net (mail135.mailersend.net [212.11.79.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89C3FFAC1
	for <ntfs3@lists.linux.dev>; Mon, 29 Jun 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.11.79.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736883; cv=none; b=BQVzTHH76dhVzxRGGb6IRqrNsDQPq9nenD8buDAMHhWAFbKf6GGF3kxZu5ZmiwIyrHHf4GSeMZJQfuCF4nxGd2x0GeBhKpDhyTwH+TchFDK8MfKCK3wsyTvSXUvSWvjBS+e16HGlWtTt0OCYBmWUiP9ruvxva40ega44638AQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736883; c=relaxed/simple;
	bh=Gq9iQbpZkz+jEMZjlaS0jJ3TLW9htBGlOjn/Nb+HRis=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SX7yiicRTyuYyX0UYA0R5Ew8fY2Gt5DSKkV1W4YV1JDEpqsU9BVdIHyvfI67BQFlHuiGctG0hQovsZuIjgXdASZYgnXgb90bq3udwaQAjqN7HDO92yChh7slBNR32Ei7YpFADOrbbW06sLd5WPNbWia70l7DFurtRK2J21yDx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org; spf=pass smtp.mailfrom=mta.hatchling.org; dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b=MXVQEa/X; dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b=X/0m4jmj; arc=none smtp.client-ip=212.11.79.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b="MXVQEa/X";
	dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b="X/0m4jmj"
DKIM-Signature: a=rsa-sha256; bh=Gq9iQbpZkz+jEMZjlaS0jJ3TLW9htBGlOjn/Nb+HRis=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1782721162; v=1;
 b=MXVQEa/XbyB1GAWiYzRqYbXpt9HDUZ4xr7RIvmkahUi4QI9ve5lYeSYQ3xn6QAuuPyMVr58Z
 si09usUHOH0w5Mddr4tr2biJdrV/JX0FPEqOPtNvCmPODuFTDp3bIo2RVvu1Qrq8+Jymvq0pGW4
 qgZggM1R5Azsztd9YQLvt9S4=
DKIM-Signature: a=rsa-sha256; bh=Gq9iQbpZkz+jEMZjlaS0jJ3TLW9htBGlOjn/Nb+HRis=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:In-Reply-To:References:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend; t=1782721162; v=1;
 b=X/0m4jmj8w3WtSna6MQ1JUDzmoX1hs2935tOIKJ3HXFnSGNAZnqimxy1chSH7E0LXMGs6fHb
 kb7SQM7RDDOL4KYdn3KzlZuJ/1b6o5CQHv70AKc1f0u+IhVAZ3skx5kITIT46OshPCDMqGBMnCV
 Gw2J9Wtg12PeMo7OMSejwOpc=
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: Re: [PATCH v2 1/2] fs/ntfs3: load ATTR_BITMAP run extents from $MFT
 extension records
From: Senjin <senjin@hatchling.org>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
 linux-kernel@vger.kernel.org
Date: 29 Jun 2026 08:19:22 -0000
Received: from 10.32.14.148 by 10.132.0.99 with http; 29 Jun 2026 08:19:22 +0000
Message-ID: <6a422a8a49961f1e45692573@mailersend.net>
X-MailerSend-RecipientID: 6a422a8a49961f1e45692573;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6a422a89bbe1cb544a722785
In-Reply-To: <20260613201610.14467-2-senjin@hatchling.org>
References: <20260613201610.14467-1-senjin@hatchling.org> <20260613201610.14467-2-senjin@hatchling.org>
Reply-To: senjin@hatchling.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Gentle ping on this two-patch series (v2, sent 2026-06-13). Any feedback=
 welcome.

--=20
Senjin
