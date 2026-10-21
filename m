Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.11.79.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558711;
	b=HuvhI18O6V7rAkGZr+OGItvwENuaOhz8YxNtdornALPnu9tPMV8xt1uA64bQiykKEF/f
	 C14YOG0qiW29fxBPOWyj9bYPST3DtpCcDNf641KbZT3USQvs3YxcZ9PWpCLCbRAQmc+jI
	 Sw5YVaI9x8zQqhi7ykQyJEh6ZsVsmfyQ+MDCgGP/nMj//frNCnJEN6T8XLqNq3Y2kfvOM
	 Kt2J9N4QSSVSRvmlg6vk/odHWujs3MvDUNcEu5/KwYllOh/rD4ws2SGLShTowKLCcuWA4
	 SeddgqQb1wtpRnRiO2BlXnDQoV5vZZrkzrWV/4/GxlcBJAYmyMcBwQ2pROWxRDjaaWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558711;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer-Info:Subject:
	 From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:
	 Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GK5DYawV3fS7qH49Jxdk4PU9MufYHyEhVsSUc+gLqw4=;
	b=G0c3RWpHdCaQnlHjO58LBzZf5KQxyxU5KfAHY1rvPYNRUZ5ThYV0QQxQ6CoOaXpG1t0b
	 HAkig5Te434dItmKlhvOHI1fZsRJYxXzDdf+c9ZQZdGFLPdnmQvdwcRjB4eZ7H6xfxETn
	 DlO++KpA6v4G9DZpJkQMcEoodRJz7HxZfOfjwC62kulZxUJ4c2wNHLN+7r1fmcgrs2qXd
	 5NOckTFbpFk9YvUN62eEElbiFosSWOemJneDYG3Lo/ki5mndms09vbx0FTf8cBzq7eloF
	 DGsXQ6sUy3B7d+fbxo7vEd0DqrUbN5YirbHWuBRehQ+VieTQA/iP9vLYxw8vrGI8mtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hatchling.org;
	spf=pass smtp.mailfrom=mta.hatchling.org;
	dkim=pass header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=157vbEKJ;
	dkim=pass header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=arvWccFh;
	arc=none smtp.remote-ip=212.11.79.132
Received: from mail132.mailersend.net (mail132.mailersend.net [212.11.79.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3163606A319
	for <ntfs3@lists.linux.dev>; Wed, 21 Oct 2026 04:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3163606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hatchling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mta.hatchling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hatchling.org header.i=@hatchling.org header.a=rsa-sha256 header.s=mlsend2 header.b=157vbEKJ;
	dkim=pass (2048-bit key, unprotected) header.d=mailersend.net header.i=@mailersend.net header.a=rsa-sha256 header.s=ms1 header.b=arvWccFh
DKIM-Signature: a=rsa-sha256; bh=GK5DYawV3fS7qH49Jxdk4PU9MufYHyEhVsSUc+gLqw4=;
 c=relaxed/relaxed; d=hatchling.org;
 h=DKIM-Signature:X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=mlsend2; t=1792558699; v=1;
 b=157vbEKJLIF9UdUG+bV3I9T+CjnrCAaD/4cSt3lIyimeJmlEdP65HNFTy0vOyAV5rHgdxPlb
 KzTVdqSv2ifYcSFfkjiC9I2lqlbWfyenekrEOFza9+Oz0zp4Bml5f1seJ8JiTN+r8nVlDWgAGcx
 C6j8PfxEm6LjROnbd4Iyt7is=
DKIM-Signature: a=rsa-sha256; bh=GK5DYawV3fS7qH49Jxdk4PU9MufYHyEhVsSUc+gLqw4=;
 c=relaxed/relaxed; d=mailersend.net;
 h=X-Mailer-Info:Subject:From:To:Cc:Date:Received:Message-ID:X-MailerSend-RecipientID:Feedback-ID:X-MailerSend-MessageID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
 s=ms1; t=1792558699; v=1;
 b=arvWccFhgCvWVcSp5mNvWBqIKgeSxzJRLzLhEzrdfYTF2TfRUr30lnLU0t1WOm0toWpZnHwh
 Ef0sj5FkySJpqbw6MpHyGLBnUifTOrfLhaISnXwk6P/HFFG1rISjjc8s0bOmn826VdKpN2QXura
 tpRMTkWP4LFUTxLaIefZOgip3//m72vB81xnVKGf32FxH3ZG2+LuUao+kUmxOWxNpGhnwGgm5iN
 400ysXHG3gbY30crs4BpsTeUkIlc3MCgBjSp7VkUtzu5STuXwDATa7+uMdt6ch+cb/zU+uEw/Ei
 kKDZRJMMKZbjesSC7iFyRmLplv6fjND6megdXioYgCMzw==
X-Mailer-Info: 10.AZlZWY1xGd.AZlZWY1xGd0MTN5UzN.uRnZzNDQsl2c0NnLslmb1hnLkVmd.
 gNhJDOmFWM0IGOmZjYhVzY2MmYjVDO4gzK0MTN5UzN....
Subject: [PATCH 0/2] fs/ntfs3: fix silent corruption reading compressed files
From: Senjin <senjin@hatchling.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Senjin <senjin@hatchling.org>,
 ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org
Date: 21 Oct 2026 04:58:19 -0000
Received: from 10.8.7.120 by 10.132.0.99 with http; 21 Oct 2026 04:58:19 +0000
Message-ID: <6ad8466bbdf840d3275c3428@mailersend.net>
X-MailerSend-RecipientID: 6ad8466bbdf840d3275c3428;6a28fa14b8f6ba5c6cbc5888;r9084zv9678gw63d
Feedback-ID: r9084zv9678gw63d:MailerSend
X-MailerSend-MessageID: 6ad8466b0cd662f40ac3541c
Reply-To: senjin@hatchling.org
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Reading WOF (LZX/XPRESS) compressed files on ntfs3 can silently return
wrong data: zeroes or garbage, no error from read(), nothing in dmesg.
The bad pages stay in the page cache until it is dropped.

It needs two bugs together:

1. ntfs_read_write_run() maps page 0 of the block device folio it gets
   from read_mapping_folio(), which is wrong for large folios. Those
   appear when userspace has read the block device (e.g. ntfs-3g tools),=

   so the compressed input comes from the wrong 4 KiB page and the
   decompressor fails. The same helper is used for compressed writes.

2. ni_read_frame() marks the frame's pages uptodate even when it fails,
   so the failure is turned into silently wrong data.

Found while copying a Windows drive whose files had been compacted with
"compact /exe:lzx". The data on disk is intact: decoding the
WofCompressedData streams independently with wimlib gives the right
contents, matching uncompressed copies of the same files.

Tested on 7.3 against 16,716 WOF-compressed files (LZX, 32K frames):
the reproducer in patch 1 fails for 1,051 files without the series and
for none with it. With only patch 2, the reproducer gets an error from
read() instead of wrong data.

The bug was introduced in 6.19, hence the stable tags. Both patches
apply to current master.

Senjin (2):
  fs/ntfs3: map the right page of large folios in ntfs_read_write_run()
  fs/ntfs3: don't mark pages uptodate when ni_read_frame() fails

 fs/ntfs3/frecord.c | 12 ++++++++----
 fs/ntfs3/fsntfs.c  | 11 ++++++++---
 2 files changed, 16 insertions(+), 7 deletions(-)

--=20
2.56.0
