Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=189.12.193.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965844;
	b=aZ5qIxwm6RlOH/5h8/qAzzxvi//b6XgaArRQ1PBshyt33c2E9Um0zWxzghFtm2VRMmKI
	 Ml6f+mBdkRn0UadDrz47ZkztfDhloLlLZwFzPEcD8ciO2YnYu91WG7izh8UyGYQDXdtGz
	 LpE21Gu49T2eydBKsvbxVQgsU5C+CqRe5RqfgM5an55TmthxutyBBDrR/vUiPs0UuoDbR
	 i6C0kz+jitZGsbVPGt1xqErcEyGfPrxXzbF7ZV+p/8shdrbeXre/84zo3OXrBe8Tffhaa
	 DQv0HmulO1N1at91t6dfX9Q+kEf/4UlY98b9NrL5DPgNu2kfXCtHt5IruLCnJxj4lWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965844;
	h=DMARC-Filter:X-Hostinger-Mail-Ref:DKIM-Signature:Feedback-ID:
	 X-Hostinger-Mail-Id:Received:DKIM-Signature:Received:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:X-CM-Analysis:X-CM-Envelope;
	bh=LykHmQgAirmHdRdpYmnxGGe5Lq6TgH6FQkpalmB/QVM=;
	b=pz65ovNl+K7V8DByUNkyl6k323PYDd2Ld/TcHVQa3Ikn8tjp2N9BjerC/hFpGre2vDF3
	 hHVpT1fYZNXRTvIqXFjhts0LKBCqNDvY9GsU23CCGQXPJ90G0GJml8hmPqqe5MQkCvaSz
	 mnM6KbbuC2OyBMqa27Mk/hr2ehLVHlc6GPGuQicdgHSQ7XsTkdOmTFTwdApYvOc3tlt9/
	 gE4RgX2tkPx1TwsprimdWVbtcvApcKdCVMuQyZJHRmjUv9q35SK30TDcy/cpivBTHcDMu
	 9/lhqpPeqLte5MnWpv1rKKQOYoDZsjK9qUp1jf7HM35INSsD5sio5TQHn76CXiICs3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=espilon.net;
	spf=pass smtp.mailfrom=espilon.net;
	dkim=pass header.d=relay.mail.hostinger.com header.i=@relay.mail.hostinger.com header.a=rsa-sha256 header.s=elm202607 header.b=Grdigb0g;
	dkim=pass header.d=espilon.net header.i=@espilon.net header.a=rsa-sha256 header.s=hostingermail1 header.b=cHrmXtcu;
	arc=none smtp.remote-ip=189.12.193.8
Received: from elm1.relay.mail.hostinger.com (elm1.relay.mail.hostinger.com [189.12.193.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611DC606A31A
	for <ntfs3@lists.linux.dev>; Sun, 25 Oct 2026 22:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=espilon.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espilon.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=relay.mail.hostinger.com header.i=@relay.mail.hostinger.com header.a=rsa-sha256 header.s=elm202607 header.b=Grdigb0g;
	dkim=pass (2048-bit key, unprotected) header.d=espilon.net header.i=@espilon.net header.a=rsa-sha256 header.s=hostingermail1 header.b=cHrmXtcu
X-Hostinger-Mail-Ref: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibnRmczNAbGlzdHMubGludXguZGV2IiwidGVuYW5
	0IjoiZXVuMHVzPWVzcGlsb24ubmV0IiwieF9jdXN0b21lciI6ImV1bjB1c0Blc3BpbG9uLm5ldC
	J9
DKIM-Signature: v=1; a=rsa-sha256; d=relay.mail.hostinger.com; s=elm202607;
	c=relaxed/relaxed; bh=LykHmQgAirmHdRdpYmnxGGe5Lq6TgH6FQkpalmB/QVM=;
	h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:
		content-type:date:date:feedback-id:feedback-id:from:from:in-reply-to:
		list-id:list-unsubscribe:list-unsubscribe-post:message-id:message-id:
		mime-version:mime-version:references:reply-to:subject:subject:to:to:
		x-hostinger-mail-id:x-hostinger-mail-id; t=1792965836;
	b=Grdigb0gKmJyBx26voFY8tjaV1vt+AduunlrsXKPKbGnNrnTpQG9rcq6Vf6h0SGIDq5pBcfQ8
	MkNrsgQ0DimGKFSiKUccW4/BuFOM/R5HLf5oJpFO5wAQXdSGMPRou8sxcD7ChrypHXvC9SYAI2V
	cYBfFXqYSJBkeHMmHwfzV59vUsV4PK5kmAMQf7CmW4IMAz8hoeT0j4Qnvx0ni0DZoziDGaAgUBW
	ty6Jyf3byicdY56trK0X4w+7P/Ag4j3RBz1ewnn9MSGRUUOpaOcVo8u/41vH1+Kl+kfZgIv5e/g
	RHgsPzQMbCSeaScZPk7KexeWx03yOqYM7dS71ckT6XZQ==;
Feedback-ID: elm202607:espilon.net:hmail
X-Hostinger-Mail-Id: f91371e4d0bf11f1884bbc2411537836
Received: from fr-int-smtpout22.hostinger.io (::ffff:148.222.54.26)
  by fr-int-hmail-krelay1.hostinger.io (KumoMTA ::ffff:148.222.54.53) 
  with ESMTPS (TLSv1_3:TLS13_AES_256_GCM_SHA384)  id f91371e4d0bf11f1884bbc2411537836 for <ntfs3@lists.linux.dev>;
  Sun, 25 Oct 2026 22:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=espilon.net;
	s=hostingermail1; t=1792965835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LykHmQgAirmHdRdpYmnxGGe5Lq6TgH6FQkpalmB/QVM=;
	b=cHrmXtcuMek7tzJ/XJOHkbwX0HfhWW+r73c+0LJjDunSW0jOPEh+rzAOCp8jxMBwZQEZEo
	hlrq14jo8CjmjH7MMHWIeiixSftccOF1nb2Wvm3yFWCtDqhwF41mlm7ED2OwtMvI1TZt/4
	1qzG9fZCUfi2rcfQhFg3ahSm+oIwFcWCDHUZG8aricdfv++tD4E3LKnN3pSSSjHlz0WI4M
	DQLEbBawxACn3TJFXidvWk5Tu6gevbPjizdPeAm0M3UEzEHjaT/2JNLEzogVO3B48Qd/1j
	zxWX4mGsdljpObQCIJv0QI9msLXHxoSoZ3CosceSi68fE2CotdxJQHCUSGpNow==
Received: from [127.0.1.1] (unknown [IPv6:2001:861:5b02:4810:d535:8293:aee4:a9e])
	(Authenticated sender: eun0us@espilon.net)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4jCW4C270gzypS;
	Sun, 25 Oct 2026 22:03:55 +0000 (UTC)
From: Marouane El Moufid <eun0us@espilon.net>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: bound FILE_NAME name_len in ntfs_read_mft()
Message-ID: <179296581973.931625.13252978361798627418@espilon.net>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Sun, 25 Oct 2026 22:03:55 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=UdEDS7SN c=1 sm=1 tr=0 ts=6ade7ccb a=NNrdi8j+18+XpAC5aQBFGw==:617 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=ICNSGLm3AAAA:8 a=7ZULHuQFvs6KFiE_kvcA:9 a=CjuIK1q_8ugA:10 a=-W5iAdWQbIJCsXvgvhpT:22
X-CM-Envelope: MS4xfJxFNKp+gHPa42C+Qxbci0Kt3BQm40sK7dgGdDdcotMVquTsRUyUSbczcHD46d+Eb3S0qgRahE00mamURInGkJmVGcZKv5kj1z3AxEod4TIsiAFSbdiC vRYzoNoyTjuiiUxpLZy6Pe8+A8d/9VZ0jUwL2kQNnaGV+yXVG3wsXlzO7FIxzfjP6YLmVSZU4ghK2n27HYGo0b5J2U2YddJE7fGZjPKK2pyfVQin3wLpWtlx Ra18ThDkUr9Z0EY0jPev5k8VpgqSQFHvwZ4A40fIfjOLZVLKbmKfHzj4OlvA054kqwJm3KnpHWA9LLm277rEYBg149gK2EVEVXUIt/sK46HSzKXKTneo9aRL BqstMcCP0eqokhd0m6cXpcUz4kreDx/cSATBYF8B8uQvz2zsx88OVl+STRsfUJ81TPhaIR7k

When reading an MFT record attribute of type ATTR_NAME, ntfs_read_mft()
validates only the fixed FILE_NAME header (SIZEOF_ATTRIBUTE_FILENAME)
against the resident attribute size, but never bounds the variable name
length. A crafted record with fname->name_len up to 255 and a minimal
resident size then makes ntfs_cmp_names_cpu() read fname->name past the
end of the MFT-record buffer (KASAN: slab-out-of-bounds, read of size 2),
reachable from a mounted crafted NTFS image by a stat() of the name.

The directory enumeration path (ntfs_dir_emit) already bounds the name
against the entry size; apply the same bound here using the existing
fname_full_size() helper.

Signed-off-by: Marouane El Moufid <eun0us@espilon.net>
---
 fs/ntfs3/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -202,6 +202,8 @@

 		names += 1;
 		fname = Add2Ptr(attr, roff);
+		if (fname_full_size(fname) > rsize)
+			goto out;
 		if (fname->type == FILE_NAME_DOS)
 			goto next_attr;

