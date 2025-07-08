Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBE49461
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 21:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752011155; cv=none; b=guMYIMxD9+4eof1q+9vkfOsHiC07WuoxjMIh9WKzcWhgRSMzZhGWVe9OMXKi4SIhC7Z2TzkFH0C77VvLXsGE/6HXPhZeH8OK5d39mALtNrNAPyw3i71UKLd3ZD+z0rmDOkJyT8z+CPcduIqT/NQ0frnrZThqDDDkTg29kfcsJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752011155; c=relaxed/simple;
	bh=AupsQCF0dWNjnaeNPs3+9yWwIfidJH7lNb8ftuw+vSk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NKae2QTIg/aVYb5Io7dmOF2pDGxCrCorkoG7Q1bnTVBjQVjzzjzgSVEP/RY9Mc456qkgNMsgvzw2ChFjPFdMW1CjL50rj9y5l3uNPSMPpdSlahgeLqlHLxI5YyGUvem+iHo5a2IaLsA+6vTn085//lbIN6/bmrs4jYoj/fuw3dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnOf/bx8; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnOf/bx8"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e75f30452so32744987b3.2
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752011153; x=1752615953; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0qfiTnhb6RgnIzn3Y/7jQJsasnXGa87k1HcGtvIkI6I=;
        b=ZnOf/bx8r2/luUiN1f/TQY7PkZ7oKCkH0g/gcp5U6cR0rL5+Jm112/DFFB7ddBhqGk
         EJcXbBHUxDtSnZ+VQe/A+OOWA38F7uBSnMRDq3kZAyeKX1gYsDjaTXQaS4yeT30QfdX8
         wijH5cR6pcccTyazv2qODhwBkdU7IKJL50CHLtisnEHML2KWcn2Pt85jqpW/LcPiSOvR
         jwKytghGIDTDS2DUvzl4+MSLrsE5z3pKrRZjhIi3vOt7UjO7T5+D8kjNbj9fWPFYz7JG
         xfgl3tnLMiPqQoVpBJ+tMxpkZsAN0kBTv5VhvQ968ASx+1v3hmTsNSNFMtpehpjIp6zV
         C5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752011153; x=1752615953;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qfiTnhb6RgnIzn3Y/7jQJsasnXGa87k1HcGtvIkI6I=;
        b=rIRY7JfLp72qGTG2mtQ7meNY8Qwq/KPPCHEUsgcD/DtTs9qyYmnTNED6Kqi4BzmPTG
         3lb6wtlepG6ZV+BzzrBHkGRT8e8YiMUWoM+3GHKPIZmoDZYbfD6mB8MuGzgbbUr1cl5i
         PFxGdD/7MIZCKRdJkS1N8w94j9nUnMQfMJg52vnHmq8fvtoS1Y6oPJozD7F2gROzuWS+
         J0tNGfeZfm1BnRSMKlWBaq+xEte4mp70KpIk/x0KrKlYuO+x80ZdBQ/hLbCTGB3PHoai
         jjpEa7X+zNuiYzO2PahRbjZ7Yi9K/pzJU530IrLMlUHIrpbmiFbdrKatgJ13E3uXV2Tj
         1q2w==
X-Forwarded-Encrypted: i=1; AJvYcCXNakjeIJR0wT7ZoK7ikVT2v2X1C6utR90XOujBwfqfr6soGhxf7DlrFEFVLEVvzK6CZRUtuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNzslXi+rLbGRomr0MYQ+IC42t8XofsTcHZrQYAJ1L3QLVE8TX
	EHR2x5eiATRJhO/N+kFUehM7DewjoMOBbS3o5J1Tg0pro7Ox7jVojs0sglRTq10fUOlYOfPeZ9n
	oWF3mNFZEuWnbvHSax/8RXtALrOUjoIQ=
X-Gm-Gg: ASbGnctM//KR7ijwFF0mibUurJpqP77kjk02U8JG8Nh5ukg49kNzis/tSPvRyPRO51L
	bDfw8Yogr10h3j4hcga6AXsFVU1lLBMSFUOcR0p8vaasKVbhJXAtIKftoc9x87MAPtfSVy8a0xS
	rWFZlm+4pcodWK7hKEBNrU5PR/pcN6S7gPMxuPA/jbiy358TgTxT6WxEiKilGuhv3495TZbQs72
	uYh
X-Google-Smtp-Source: AGHT+IFDLywOhIoTBUVsoUXWMjLAi/bix2Ut3Dp8N3IqRRXkqv60tAX3F1JWBWLSzGhwiJM/NwjKVWrmeXn+BAiuCho=
X-Received: by 2002:a05:690c:8d05:b0:712:de91:53d4 with SMTP id
 00721157ae682-717b1999941mr4403417b3.24.1752011152881; Tue, 08 Jul 2025
 14:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
Date: Tue, 8 Jul 2025 14:45:41 -0700
X-Gm-Features: Ac12FXy6yZ6UCj-hjSdotBfvazCVnQYha1jcywIWZh69lrvJ-Cm7wQoK6JdoTQk
Message-ID: <CAF3JpA7yXEB_Fj3AMtFG1OYLX2g9P3LFQ5f3qSSEcheB4axVKg@mail.gmail.com>
Subject: [syzbot] [ntfs3?] WARNING in ni_rename
To: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: multipart/mixed; boundary="0000000000006965b2063971e29b"

--0000000000006965b2063971e29b
Content-Type: text/plain; charset="UTF-8"

#syz test

--0000000000006965b2063971e29b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ntfs3-validate-BITMAP-size-when-index-blocks-are-pre.patch"
Content-Disposition: attachment; 
	filename="0001-ntfs3-validate-BITMAP-size-when-index-blocks-are-pre.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mcv24lot0>
X-Attachment-Id: f_mcv24lot0

RnJvbSA3ZmExZjRiMzk5YzJkNDdkMWFiMzAxYzI2NjJmNmE2MGMyMDk4YzQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb29uIEhlZSBMZWUgPG1vb25oZWUubGVlLmNhQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCA4IEp1bCAyMDI1IDE0OjM5OjQzIC0wNzAwClN1YmplY3Q6IFtQQVRDSF0g
bnRmczM6IHZhbGlkYXRlICRCSVRNQVAgc2l6ZSB3aGVuIGluZGV4IGJsb2NrcyBhcmUgcHJlc2Vu
dAoKUmVqZWN0IGRpcmVjdG9yaWVzIHdpdGggYWxsb2NhdGVkIGluZGV4IGJsb2NrcyBidXQgemVy
by1sZW5ndGggJEJJVE1BUCwKYXMgdGhpcyBpbmRpY2F0ZXMgYW4gaW5jb25zaXN0ZW50IG9uLWRp
c2sgc3RydWN0dXJlLgoKU2lnbmVkLW9mZi1ieTogTW9vbiBIZWUgTGVlIDxtb29uaGVlLmxlZS5j
YUBnbWFpbC5jb20+Ci0tLQogZnMvbnRmczMvaW5kZXguYyB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvbnRmczMvaW5kZXgu
YyBiL2ZzL250ZnMzL2luZGV4LmMKaW5kZXggMWJmMmE2NTkzZGVjLi42ZDFiZjg5MDkyOWQgMTAw
NjQ0Ci0tLSBhL2ZzL250ZnMzL2luZGV4LmMKKysrIGIvZnMvbnRmczMvaW5kZXguYwpAQCAtMTUw
OCw2ICsxNTA4LDE2IEBAIHN0YXRpYyBpbnQgaW5keF9hZGRfYWxsb2NhdGUoc3RydWN0IG50ZnNf
aW5kZXggKmluZHgsIHN0cnVjdCBudGZzX2lub2RlICpuaSwKIAkJCWJtcF9zaXplID0gYm1wX3Np
emVfdiA9IGxlMzJfdG9fY3B1KGJtcC0+cmVzLmRhdGFfc2l6ZSk7CiAJCX0KIAorCQkvKgorCQkg
KiBJbmRleCBibG9ja3MgZXhpc3QsIGJ1dCAkQklUTUFQIGhhcyB6ZXJvIHZhbGlkIGJpdHMuCisJ
CSAqIFRoaXMgaW1wbGllcyBhbiBvbi1kaXNrIGNvcnJ1cHRpb24gYW5kIG11c3QgYmUgcmVqZWN0
ZWQuCisJCSAqLworCQlpZiAoaW4tPm5hbWUgPT0gSTMwX05BTUUgJiYKKwkJICAgIHVubGlrZWx5
KGJtcF9zaXplX3YgPT0gMCAmJiBpbmR4LT5hbGxvY19ydW4uY291bnQpKSB7CisJCQllcnIgPSAt
RUlOVkFMOworCQkJZ290byBvdXQxOworCQl9CisKIAkJYml0ID0gYm1wX3NpemUgPDwgMzsKIAl9
CiAKLS0gCjIuNDMuMAoK
--0000000000006965b2063971e29b--
