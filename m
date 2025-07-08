Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7D29E0F4
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964009; cv=none; b=UiZ6K8gfzrJHIzec9Mr8H73GfviF7YOzzjzh/D34wNRLnHHPx1fuZfL+pwiNsQgySEx0hwrgg7zB7uudzWvcjz5HcIdLAmmSn8MyAFPwrntHi7/G+mstrYHLmEj2PYHDYsx/NY6PznqRR8PJ1hKrInWetNZO4FVtCcwMwO/TUEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964009; c=relaxed/simple;
	bh=oaSnugCEdeQcBT4v6FEIbhEgdiJTD1Msrq8MfPMc5iU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mmTIOHu2+c46EGFq9ivQw2xbUyk8XGHf2R5XsowFivP6eR8H/ftUZiymxPYuarvtl5TkS87wriZRY/VC3Pi5AOkI8K//n6Ivvgs0w5XPHUUXcfmbwg1AU6DWG4t7HIvv+phMj3upJqXtbVAf9QyzDA8i2N4TDL9fuKlYT89s2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMNOW6TD; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMNOW6TD"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e77831d68so35204807b3.2
        for <ntfs3@lists.linux.dev>; Tue, 08 Jul 2025 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751964007; x=1752568807; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gl0QAD/tbVzDvZuawsafKO1HsSUYi+swaKefHPvsCQM=;
        b=WMNOW6TDamKfvunxxTBGXXA4Jc8juGjJRGrJHwTZ8OqSt5L7TLKvRFHWRJb0LVqStl
         9k9plSMfLKDB1ax8yAfa93fLgEUgkd9mZHYUZcJ7S36xdi9pnt2pLDW5fl+sU2v8c94b
         BjkQuyNPGejn2TpfjWmctkjloSoSJmGBxnd/7Pb7G0QJrWx567Wt3tY7BanohuKDBGZF
         UxBe1MMZNBEQBFtwuM4hWUgip6So4+VgFN77uM504BY7j9Jo2Mz5S4w3hLn2E4vC/xez
         Jr27ZV81SJ8ETjHcDiMCc3W9uLeNPxKFu9AUvJg9PdzaeqZKo37qPZ9SzecpBoZgv4S7
         YHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751964007; x=1752568807;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gl0QAD/tbVzDvZuawsafKO1HsSUYi+swaKefHPvsCQM=;
        b=NQbpnigan1XCE2EnRQ67rtIarh4EfEMh+EBMN81T+wJnmQf+b75VCgwKr13Az2/90S
         vqgRpRld7xk0nqecG82y86VHjBGUR0QGJS1vnYArZi+MlLVtEhYLRhWHi9Ut7gpH6IeK
         /cwNT5qD+IxMP2NrzTW14XrrKCM6+iMUY6wVWnMDqieeFe8eJfeudRX3QwLnEkxDmZGh
         72ZekpLm79OF9d+ZMVd/9tCklNOvnM6yjflIma/d9EEYFiKEDDSnoXPdBVGcPZaCT4lX
         vcGwvLWEIQZQHjwyjPqXW96mLxBHpiK1zWSFekcacEV14VoIVIqNUNViNyYqjPuqaIKw
         oJxw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ5zlP6fLwLo6BV34BEVd0i3G+npOoP7dY0ifo6X2nYUKygcFlGeo2rZGhxUwswKdtAvbBfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDbmGX8N53m0AB6OzosGWcxjhJIcHnMaTHNdN9Ndj0DTofpVua
	4JJKwy0md/Fjdpm/zzz+wWgTSu//HJEQ/KAUMurdZ3wQKD00PbbE8XrKh/2eJkBkILySqrYgd+E
	0uOIArhVJDgtMIxq/8QTWgyUW2FW6mJY=
X-Gm-Gg: ASbGncvIvtHJ0VuMJTyvtQL86hfs1KoP07pq0bbNxg25vx0kWrGnVv1AxPnTCIIAm8Q
	Kp55uejTDx8o605oHxVlkv2tBRY6UY9JbrByfWH0tRsYQlkWK4l8IG06hd9XiSw3YW2hTAyJLBs
	0yO8AuFZ+g+nQf/ERoWFh5xFBeMEn/uizlcPkG9jFH9AXQOKDvog7c3WPx+SatTWPna4PQJArfU
	YWV
X-Google-Smtp-Source: AGHT+IFVSqFV+JHejEaMrQ/AcobiDs3n3dnlQorVuoAZYAXAjM1srOc9PMjjID6k+C5uO2bRlqNjtZJkfHvqbDsFdLk=
X-Received: by 2002:a05:690c:60c1:b0:70f:83ef:ddff with SMTP id
 00721157ae682-71668d47390mr217482997b3.30.1751964007285; Tue, 08 Jul 2025
 01:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
Date: Tue, 8 Jul 2025 01:39:55 -0700
X-Gm-Features: Ac12FXzBCT5EBKeLYS0vb_uaT7F7BBoWv3Jo27oObiDeVLb3zges4wxI2j_RbzA
Message-ID: <CAF3JpA5UK1iRiHTbPZNej5izQZNVwi3phN5f0pzCzadqn7K0+Q@mail.gmail.com>
Subject: [syzbot] [ntfs3?] WARNING in ni_rename
To: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: multipart/mixed; boundary="000000000000507a1d063966e8b7"

--000000000000507a1d063966e8b7
Content-Type: text/plain; charset="UTF-8"

#syz test

--000000000000507a1d063966e8b7
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ntfs3-reject-zero-length-BITMAP-when-index-blocks-ar.patch"
Content-Disposition: attachment; 
	filename="0001-ntfs3-reject-zero-length-BITMAP-when-index-blocks-ar.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mcu9wgkq0>
X-Attachment-Id: f_mcu9wgkq0

RnJvbSBhN2U5NGFkNDk1OWU0NmFjZjM4NjFmYTBjNzI1YTJkMGMzMzczZWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb29uIEhlZSBMZWUgPG1vb25oZWUubGVlLmNhQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCA4IEp1bCAyMDI1IDAxOjE3OjEzIC0wNzAwClN1YmplY3Q6IFtQQVRDSF0g
bnRmczM6IHJlamVjdCB6ZXJvLWxlbmd0aCAkQklUTUFQIHdoZW4gaW5kZXggYmxvY2tzIGFyZQog
YWxsb2NhdGVkCgpBIG5vbi1lbXB0eSBpbmRleCBhbGxvY2F0aW9uIHJlcXVpcmVzIGF0IGxlYXN0
IG9uZSBiaXQgaW4gJEJJVE1BUAp0byB0cmFjayB1c2FnZS4gUmVqZWN0IG1hbGZvcm1lZCBvbi1k
aXNrIHN0cnVjdHVyZXMgd2l0aCB6ZXJvLWxlbmd0aApiaXRtYXBzIGFuZCBhbGxvY2F0ZWQgaW5k
ZXggYmxvY2tzLgoKU2lnbmVkLW9mZi1ieTogTW9vbiBIZWUgTGVlIDxtb29uaGVlLmxlZS5jYUBn
bWFpbC5jb20+Ci0tLQogZnMvbnRmczMvaW5kZXguYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9udGZzMy9pbmRleC5j
IGIvZnMvbnRmczMvaW5kZXguYwppbmRleCAxYmYyYTY1OTNkZWMuLjE1ZjNhNzExZWEwYSAxMDA2
NDQKLS0tIGEvZnMvbnRmczMvaW5kZXguYworKysgYi9mcy9udGZzMy9pbmRleC5jCkBAIC00Nzgs
NiArNDc4LDcgQEAgc3RhdGljIGludCBpbmR4X2ZpbmRfZnJlZShzdHJ1Y3QgbnRmc19pbmRleCAq
aW5keCwgc3RydWN0IG50ZnNfaW5vZGUgKm5pLAogCXN0cnVjdCBBVFRSX0xJU1RfRU5UUlkgKmxl
ID0gTlVMTDsKIAljb25zdCBzdHJ1Y3QgSU5ERVhfTkFNRVMgKmluID0gJnNfaW5kZXhfbmFtZXNb
aW5keC0+dHlwZV07CiAJaW50IGVycjsKKwl1NjQgYm1fc2l6ZTsKIAogCWIgPSBuaV9maW5kX2F0
dHIobmksIE5VTEwsICZsZSwgQVRUUl9CSVRNQVAsIGluLT5uYW1lLCBpbi0+bmFtZV9sZW4sCiAJ
CQkgTlVMTCwgTlVMTCk7CkBAIC00ODgsNiArNDg5LDE3IEBAIHN0YXRpYyBpbnQgaW5keF9maW5k
X2ZyZWUoc3RydWN0IG50ZnNfaW5kZXggKmluZHgsIHN0cnVjdCBudGZzX2lub2RlICpuaSwKIAkq
Yml0bWFwID0gYjsKIAkqYml0ID0gTUlOVVNfT05FX1Q7CiAKKwlibV9zaXplID0gYi0+bm9uX3Jl
cyA/IGxlNjRfdG9fY3B1KGItPm5yZXMudmFsaWRfc2l6ZSkgOgorCQkJICAgICAgIGxlMzJfdG9f
Y3B1KGItPnJlcy5kYXRhX3NpemUpOworCisJLyoKKwkgKiBBbGxvY2F0ZWQgaW5kZXggYmxvY2tz
IHJlcXVpcmUgJEJJVE1BUCB0byBjb250YWluIGF0IGxlYXN0CisJICogb25lIGJpdCBmb3IgdXNh
Z2UgdHJhY2tpbmcuIEEgemVyby1sZW5ndGggYml0bWFwIGluIHRoaXMKKwkgKiBjYXNlIGluZGlj
YXRlcyBhIG1hbGZvcm1lZCBvbi1kaXNrIHN0cnVjdHVyZSBhbmQgY2Fubm90IGJlIHVzZWQuCisJ
ICovCisJaWYgKHVubGlrZWx5KGJtX3NpemUgPT0gMCAmJiBpbmR4LT5hbGxvY19ydW4uY291bnQp
KQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCWlmICghYi0+bm9uX3JlcykgewogCQl1MzIgbmJpdHMg
PSA4ICogbGUzMl90b19jcHUoYi0+cmVzLmRhdGFfc2l6ZSk7CiAJCXNpemVfdCBwb3MgPSBmaW5k
X25leHRfemVyb19iaXRfbGUocmVzaWRlbnRfZGF0YShiKSwgbmJpdHMsIDApOwotLSAKMi40My4w
Cgo=
--000000000000507a1d063966e8b7--
