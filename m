Received: from mail132.mailersend.net (mail132.mailersend.net [212.11.79.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D4F199920
	for <ntfs3@lists.linux.dev>; Fri, 31 Jul 2026 01:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.11.79.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785462538; cv=none; b=te2gtLoDN4IBDzSj/nD+pKmUnMLrIHXc/tpicy7naAkhiVKOHdboNWP5MGMwHp+97nEQQJf79d0x8rt5tOXJZkEds7huutDgYfjSwxTZCRZSvxvmrPImw8cASpC7HXPVD7zTCzAihqRa76OShZ5ldDhRpv2GRF32tvkMYCAmDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785462538; c=relaxed/simple;
	bh=b+XddcyceE3Vx5mRfg1OwLj1luiST11CO9ZnW7OYxWk=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=t7sdHDLpSgn8qqjc+49oOsKOl1kS16ookru4qIiRw0JVAKqGq5crSpkk70hvozY2+ZYaN2/gn5PfZXj4wl3FJAzavOzvAeQRsU2Gd57qs8KPPkw9hDL0oi6FV6/cXih1TRCIpMJ5dSUu8WmtrcVzt5YdK9V9CBchKytt71zm5fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org; spf=pass smtp.mailfrom=mta.hatchling.org; dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b=h+svnuB2; dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b=jDax4pO4; arc=none smtp.client-ip=212.11.79.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hatchling.org header.i=@hatchling.org header.b="h+svnuB2";
	dkim=pass (1024-bit key) header.d=mailersend.net header.i=@mailersend.net header.b="jDax4pO4"
DKIM-Signature: a=rsa-sha256; bh=TG9Tv2idfL7EeCxHWXgFV/cAOqB0FkzFxCzyZRgOapU=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1785462340; v=1;
 b=h+svnuB2Fzv6kBmIcqtH/7abEDMRUCemWOhznoQg81c0vx6+iAFpkuZis6cOVfROcXNla1nP
 bzMT4Cynx5YfVs1ffAl2ieo8E+2rxyEpYV1Yh+T6Brw+KnIfLV+TZGDozYEK4eVeCQvKJV0jQa6
 Zw+CHqNsCO2VvQqElyyD0Ttc=
DKIM-Signature: a=rsa-sha256; bh=TG9Tv2idfL7EeCxHWXgFV/cAOqB0FkzFxCzyZRgOapU=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend; t=1785462340; v=1;
 b=jDax4pO4/l8LCw/cvp0sbXvU8fI//6P9chnLrLuIqCKiKWy1aMXmr86dME/EDuodzgJLx5J3
 Aov1Odmt3BRRvtLOsPMz/ifYLEu/R+0FzEGIbcbpfuSU8GzHpoLP/xgiNO/jixDlb47VO4I+fYn
 V2FpK7RNC1nhLT1GnXhj9Jb8=
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: fs/ntfs3: possible redundant MFT bitmap extent merging (ntfs_fill_super
 vs ntfs_read_mft)
From: "senjin@hatchling.org" <senjin@hatchling.org>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
 linux-kernel@vger.kernel.org,
 Ruslan Elishev <relishev@gmail.com>
Date: 31 Jul 2026 01:45:40 -0000
Received: from 10.32.6.204 by 10.132.0.99 with http; 31 Jul 2026 01:45:40 +0000
Message-ID: <6a6bfe44c36dda3a13e38dca@mailersend.net>
X-MailerSend-RecipientID: 6a6bfe44c36dda3a13e38dca;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6a6bfe4491fb42e1ebb9efdd
Reply-To: senjin@hatchling.org
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Konstantin, Hi Ruslan,

I don't have any filesystem or kernel background, so please excuse me
if I'm misreading something here. I just happened to notice this
while looking back at my own small "load ATTR_BITMAP run extents from
$MFT extension records" patch out of curiosity, and wanted to flag it
rather than assume it's already known.

Ruslan's patch (which I found here, I wasn't otherwise aware of it:
https://lkml.iu.edu/hypermail/linux/kernel/2603.3/10383.html) looks
like it fixes the same underlying issue mine does: fragmented $MFT
bitmap runs causing wnd_init()/wnd_rescan() to fail with -ENOENT. It
does this through a different code path though, and both now seem to
be present at the same time:

1. My patch extends the existing non-primary attribute segment
   handling in ntfs_read_mft() (inode.c) so that ATTR_BITMAP
   extension segments (not just the existing ATTR_DATA case) get
   routed into sbi->mft.bitmap.run. This happens as part of the
   normal $MFT inode read.

2. Ruslan's patch adds a separate loop in ntfs_fill_super()
   (super.c), just before wnd_init(), that walks the attribute list
   via ni_enum_attr_ex() looking for ATTR_BITMAP extents with
   svcn > 0 and calls run_unpack_ex() to merge them into
   sbi->mft.bitmap.run directly.

As far as I can tell, ntfs_fill_super() has to read $MFT's own inode
before it can walk its attribute list at all, so by the time Ruslan's
loop runs, ntfs_read_mft() (with my change) would already have merged
those same extension-record runs into sbi->mft.bitmap.run once
already. If I'm reading that right, every mount of a volume with a
fragmented MFT bitmap would now unpack and merge the same ATTR_BITMAP
extents twice.

I looked at run_add_entry() and it seems to merge/consolidate
overlapping ranges rather than reject them, so I don't think this
causes any actual corruption. Both passes would be unpacking the same
VCN/LCN data, so the second pass should just reconfirm the same thing
and consolidate back down harmlessly. But I could easily be missing
something, since I'm genuinely just someone who ran into this bug on
my own drive and patched the one function I could see was wrong. I
have no real experience with the rest of the driver or with how these
two changes are supposed to interact.

Apologies if this is already known or if I've misunderstood how the
two pieces fit together. Just didn't want to assume it had been
noticed. Happy to help however's useful, including sending a
follow-up patch if it turns out one of the two paths should be
removed.

Thanks,
Senjin
