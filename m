Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880085;
	b=odv02awgNfSF5oO5ej9Y7cNlUszC4kQQ2VJEnKgcUdfYZxMZk/z3+pV2eX8O8bcVCtOh
	 n4vQHbbJjTcG0qipK3zHq9YgKPgKNhXMLpynbW2pU22QdiPYrTEqQn38Fm+WxpgBjEojj
	 6fnAP59fr6GF6bQzwtUqejT50eNcIPVUDzzk+xTZXyyMe20/K1/lsdv2t8J44mdRIOvYC
	 tZFCizEVdhDd/er59U/08WB27Ndp2b6H8RczEBbGGCtVJpB46bJFUKmiEKxpgVp01Gl10
	 3/SgKPaDL+phwuk7LtSwLY5GeMBXj9lCVU4CdQHlZ52FrbW7BeLIAy5Ul8/ylWl/43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880085;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EiVJLxJgFeghQtfJY+1gfKUYkjkl8NmtePR2e2gRWJE=;
	b=Qp4rchn1DiiYHOTlLlOkBtwJd94hyafm5vkp2JdTDiHrvOauC6aZ4fBCTayO/t7tK5FU
	 m16jEQhd2GniGyNOV2PLwYzwS7LXVxU/82R3I/P3z4FsUaofeiksmceF9dwQUqIvLfWDi
	 hDKD6R1SfOCvlH3mPcfiVZ7HjwmbqsQFEZNvvAlq4hz/cqrK3sny6BP6h67A5EkfDS4Nl
	 1lfKyEYI8kT1EoDRiEhmGHnsimIIRAiiUpahcwXo8AB21MH7I6OvD3UStumG+xKuU+R7h
	 F1aqvqaPRE5m4eMFuF4bmeb3sHSsDBJewPNZ4aL6WR5wBX8/gg0p+py04XJW431BzSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=EEgaNDeg;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4E606A31C
	for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 01:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=EEgaNDeg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794880079; bh=EiVJLxJgFeghQtfJY+1gfKUYkjkl8NmtePR2e2gRWJE=;
	h=From:To:Cc:Subject:Date;
	b=EEgaNDegX44nei/gtE96kDg4yfXl/2+RPbVgigenQfS1yxCT9v8HVCpBT+p0+fgvv
	 YTQ/3rmpd8YxfUxY0/Fs33V+dCLDAloJ+5V/KcHHmBbNKSRCw3kCwQvDnGPY4jGUWx
	 STwSOhyE73OyohMvHWaaVUSM4J/1+czG7IIrqtJA=
Received: from [172.18.4.77] ([202.113.185.209])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id BF937C50; Tue, 17 Nov 2026 09:47:57 +0800
X-QQ-mid: xmsmtpt1794880077tc4ybi7vh
Message-ID: <tencent_65517E3E665127A973DF0B23554E9DA6A208@qq.com>
X-QQ-XMAILINFO: Mp62enUr7azu0hobwIOrSPK0cBn3nquaZFayBP0isucAMkZFyuF0WNHWLf5QgP
	 mUEEodM9ITtJFD6Up1euv8QrOcc25FqHhB24U1S3wBP1EZ7zN15P6sawfNIomR8M0uVT7/lCNUsm
	 xZcrOBLDVf+hZGh0Jvec0UEWIHDooqltZ3+riybXUy7aPD8Ka6B7a0GoMZa324IXSyNKXincvMuL
	 /3R7EQBtU7pQJxIXt843R4zpiXvg8lYggx4u6okLacy3vOVD64ax2/1e07AnDBQ4NwuHtGxG0yuJ
	 HB6UrA3V5ttSjj+gvweE3Id7gBtLE1Xq+ihZwjviHmqfx2FHTEpgFFOQN8wVANXXRR9Nkz0cG9za
	 KcQNfu8WZvNApHu3zciKe0/nCPsAOxJGZ4I1ywWkdkyIK3mJGhtlj95TR9He9Fr1tyL8dUp9VGl0
	 347OTUQzIWr8sQHhx8qqivReprKw7zpI1XcuMtqN7YW8ksJvh2SDH9e7qVKon90iMnVlcmX0QCED
	 UbALXvemCcDgtrnIs2hWvMlIHNC5zHGTUHdAQzEKnl6CFU0WDZkFuAU4gCH0nAuU/pn07QoA8IYf
	 GtF7+KYfLRRe+2GnPHvXuV3qbNfHuKGOdbMWaKWzX1ZocnXFMF2g3B548r2Mi7EXCLPlIjDwH25J
	 5kmUwUqzxjKnZRwOC1mxY8UGPapHkusrHTC9AIm8XgVCXLoMi2c9sYkcEqaoW4m8+x5TKK+BUUCd
	 zGG3qdvjDYnCIl6Hiyrimt9VoVDLHdDiZu/XaMI6S+zdM6H/d8/LulaTjABnc8PzG17BgYGmTvX/
	 E1zgT7RcKOF/mC94u0oZGodcP4Hui430AfibMrmOgOXY+f5Jx70bMPY3hh4AD/w9TZg6JUwKwL6a
	 GX1gdAfzK528K9AnRLx/uV32xHuLTbMVb5pBllEqXO4XWTXJ25AE0/ObT98DviHO54uuTyjzBAlD
	 MlNDEfj9E2MiH5Is6YckIF6L25nSveXfyXzpQaB4l95R9rEW73i2L5H0XfrDcZqB597slIeAqEbK
	 Ayr1bAJ5TS6NQJsIqsUhtpp6aPtgmjy+OckrEZ+K5lZYlzjPU4
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Guikun Yang <yangguikun19@qq.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Bug report] ntfs3: attr_insert_range() shifts nres.evcn of a
 resident attribute past the end of the MFT record buffer
Date: Sun, 15 Nov 2026 20:00:00 +0800
X-OQ-MSGID: <ntfs3-insert-range-evcn-20261115@qq.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

fallocate(FALLOC_FL_INSERT_RANGE) on a crafted NTFS image reaches a
segment-enumeration loop in attr_insert_range() that shifts the
svcn/evcn of every following DATA attribute without checking whether
the enumerated attribute is non-resident. A resident attribute placed
at the end of an extension MFT record makes le64_add_cpu(&nres.evcn,
len) do an 8-byte read-modify-write past the end of the 1024-byte
record buffer.

  BUG: KASAN: slab-out-of-bounds in attr_insert_range+0x14a1/0x1670 [ntfs3]
  Read of size 8 at addr ffff8880062d9400 by task init/1
  ...
  allocated 1024-byte region [ffff8880062d9000, ffff8880062d9400)
  The buggy address is located 0 bytes to the right

Reproduced 3/3. The negative control changes only that attribute's
type from ATTR_DATA to ATTR_END; fallocate() then returns 0 with no
KASAN report.

## This is the other branch of the function

bf9a6578e0 ("fs/ntfs3: fix slab-out-of-bounds write in
attr_insert_range()", in 7.4) fixed the **resident** branch: the
inline-data memmove used the insert length as both source offset and
copy size. The current tree has that fix:

  memmove(data + vbo + bytes, data + vbo, data_size - vbo);

The **non-resident** branch - the loop below it - is a separate path
that still has no bound (fs/ntfs3/attrib.c):

  next_svcn = le64_to_cpu(attr->nres.evcn) + 1;

  while ((attr = ni_enum_attr_ex(ni, attr, &le, &mi)) &&
         attr->type == ATTR_DATA && !attr->name_len) {
          le64_add_cpu(&attr->nres.svcn, len);
          le64_add_cpu(&attr->nres.evcn, len);
          ...
  }

The loop condition checks only the attribute type and name. The
attributes come from ni_enum_attr_ex(), which walks the attribute
list into extension MFT records, and does not imply any residency
check. nres.evcn has no meaning for a resident attribute: in that
layout the first four bytes at the same offset are res.data_size,
and the 8-byte RMW reaches past the record buffer when the attribute
is placed at its tail.

Both branches are reachable from the same fallocate() syscall; the
resident one is fixed, this one is not. Current mainline
(fs/ntfs3/attrib.c) still has the loop verbatim.

## Suggested fix

Reject resident attributes in the enumeration loop:

  while ((attr = ni_enum_attr_ex(ni, attr, &le, &mi)) &&
         attr->type == ATTR_DATA && !attr->name_len) {
+         if (!attr->non_res) {
+                 err = -EFSCORRUPTED;
+                 goto out;
+         }
          le64_add_cpu(&attr->nres.svcn, len);
          le64_add_cpu(&attr->nres.evcn, len);

Checking at the ni_enum_attr_ex() level would cover other callers
with the same assumption, but the local check is the minimal fix
for this path.

## Reproducer

The crafted image places a resident DATA attribute at the end of an
extension MFT record so that the enumerated attribute is resident and
tail-aligned. The image builder (mk_patch_record.py), positive and
negative images, a trigger program and a syzkaller-format
`syz_mount_image$ntfs3` reproducer (image embedded as zlib+base64,
followed by openat + fallocate) are in the test bundle.

Available on request.

Tested on 7.3.0 (KASAN, ntfs3 built-in). mainline 2026-11-15 checked.

Thanks,
Guikun Yang

