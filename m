Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793786572;
	b=GKzofufch/5HLYzxYNAhbTpipr/hB/OkqsvnbQ46TTLP63IINrkUMQn5c+4zWQDUifUN
	 xE1Mw0qMP//bsTEX/z2mVHguEl8tjZgKaVZ8JhoSYD2rAQo+/ebHGJgzkrafQ/VurLK4Y
	 Hdw8vq9ZN9uYsLkqZufVUfN61botOPijOJKcTOuUcJQIOuSrYW/lrwu/hZyHqIo0fHyWT
	 uukC/6SwodqGkygkdTGQn5C2/7P40hqXKRWtAFYCaJEsYmQyY+5Oyy0wRlnYf0vXMKZEr
	 3lOK50J2QCVrHihy3i0oHwJEXrt3EvFh7DlMOtM18q04EIRxK94vR3KNPeY1pSTYbRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
	b=AahzU+lL1TA34kKo9iULPXgJCQnwVBEj1Zwsc3tWHOvv3mWEmake2+KkILXSIna02s0x
	 xftPjiBq8fTtQ7sg+rAMDlldomeRehJuaFf/UoJg5wpQDIi9awRKw89g0sojlSYPmcRzI
	 DwJQdcI+c7m94NVoUiC2wkexiEULqqo3JRukJL54l8KumeWxWh2yoSxS8YeU55e/QEgzO
	 +/dWPuK7Jsmco+favtjmj1K7RrtK2nhIJ5FkoCS+xbk6qPiYQqZeQwK96zXcC8n6M0EWA
	 dm1R2Q/rx1c2gBgNFBgBGcJMGfOzZJv7NiGBMPHgY51NnwTKp6N/F2ZzektDAubSUag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rirso6wN;
	arc=fail smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A8606A328
	for <ntfs3@lists.linux.dev>; Wed,  4 Nov 2026 10:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064A8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rirso6wN
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eb18f4da15so1718765ad.1
        for <ntfs3@lists.linux.dev>; Wed, 04 Nov 2026 02:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786571; cv=none;
        d=google.com; s=arc-20260327;
        b=oM51aOM0Q4yMG1o79db9fb4krNBilTWpG2XR4tas9A6hSPcrvOSW64N7JaWwJVjZ41
         Qdc0VH9RIQPVxTr+SI1sFIjoPsD3B5xkN7M9i2rN6WV4dEu5kvT0Dh/QQ7oXDqLiVNfk
         cA1dZFfxS/69J5weXqwvq98w351t/v2VL2p7LcqoUuyBNLveUIqDOBbZo/IEgwdd4mcx
         VuPdR2lys0o9cF02sv9PB4V3T+0AB+IbWOALLswD2OWt7+PNzn3dHVSn5CgGsIXeEcvG
         EJkJMWaDFCUs5MkJiQXYPpiNxkxPTVRSW3hb4fUI3aE2+AAAZRH7wiMiqJ2JxMONS7qJ
         pRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
        fh=8Mxx1paKBLL0xykYasOtZrCa9fkGidddz5kTCkBWAqo=;
        b=bo27m6yA73duU9F+ulggR1X2qvPCZKiWuonRtF2/tnF8mq4GIy8G7m+IDE3Rh1LcSN
         U+Le/HI/7Abu72ZsKyD0E28eLHDygHXFbDyoJxoV8kRXbtQqgGuJmjniaY3rgmYjqjRV
         hnrIggXhRD5ge/9LUkKf/LUUK+c7GPek+j3o6TQWEYAEvqHY136K3bNn42/lJAJO9Iu7
         Wb8X/Pz2xoTVUKbre5WmhW/mwee0g4KyuUhGmwQ7WOcVer2wJdNuZ8JaiQ+bxCEgSTWH
         +q2SOeWcP8xyYNzO1Kt1ZLN2Mx8Su2GdQI4dsrNIV3C40md8KOZqI3w2iebCxg+69GwF
         0ptw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786571; x=1794391371; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
        b=Rirso6wND5J8QF0W3tg24084oCod8pLMQt6He7QNZSJgQmXFVeVwCTpusu9Bgv00Lf
         I+LcWRoOcZ6g1SqreHgfAJOrhW92Y1zAcMcGPRa5j/GRAo+B/t7kqouCcjXtnZQlTBIi
         nskX0UjapIOnlUVEBEj05UqIDXFbVH8YNIHV01iJXPrcWYIm2nnN/HsTPdiPmP0jQHRT
         m3XxzOGvZqU0fJ2vEa4PNc557ocEHYJxwI7ChvigOT5ahai/IQ9dKkRk0df5ScYG2KSE
         nxe4SHrHHR2jc8l/5I8iNOZfA7TzcIgEw6AXdzcwbVnV3hOVvSY34P8mbG8TNlG+yAHN
         +//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786571; x=1794391371;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cpqm/3a8lUjOVJvoZhGrsk4YqERlk6vhpfycWBHl+MQ=;
        b=HgSHNeKet+WXYQ+Qtm6Y5mEQh4z7PG3T8vJ9gXFF8X85wJeDKCAjNJzKdE4PPuUWtn
         BanonaKZLvmu+o1cn9NpsBbwUf0j+odBpQFi5sCYNGGbgjqRjZz/I1FEeDbl5HjCZ7XO
         bsVrNMzy4fAPqADXO5EZKGSnSsGA+xqPIhpvekvFw3qT41dbid0wMI+SUeVT/sYwj4HB
         0M58uIgoS5T3Adtp6TqNrcvQljmallzddQ/Mhq4+5zp2lxIMtecXeYVohL9m8vM843B7
         QJH9tZoH09bX9x+GUfbKEKSaEe1yx4vxMWn+OQUAQ3chN4teJQFK3pnv+sq7yWKE+j5V
         uYcw==
X-Gm-Message-State: APuU4Z8Ix/ofz6AVigGgjeJO/KSoDAUjI/PHPw9lMPXwTK4D8edUYIJm
	JaENgs62I7ytcIr6VsVZwfvYp++9anVlvDSV0FDVLGpV/YQ3/O5Si9AXyimX/7JseyJlmkF1kKu
	lkVi8iscbfmPDD5z3N+0yYlfUMcLltTg=
X-Gm-Gg: AYBFou2qDhXWfaYqJhEF8WmEKWNclnF3lSS6y+BG1gwujfwp4w5moiHTM2Ij5Wt/klQ
	2s/GZGi1ftuOobGQHd1jkXSplkkxB5LnU/NPymvsJXyfRLrd8HUf/BnCJp3fE6CENeH5e62FviE
	j/3OUL0bGuSXW9OvdgEL7bBJFXnaRG+wtq6DbBgXb0VtlLtlOUqu65xSkodAcio8KVXs1W7y8aZ
	NGlDO4xqbpogKRoQICUEJCKvFTIBtjTBF1zYJUrJirFYc7T9hH4uvhXgDSLWk+JY7Zjmw01UeGX
	IGF57EA6V7x0RgpT2B4+CH9ocXgaWMQyXOO+Gk2t6ZxTMsJMiJvrOFjFETwLTbJ4vLMbZZGxD5N
	nLoDgocYFinMoibo46cvDlMst3z0GvoR0tDAejL2oc6vogsOpmQgJjF8Xk1fQQ8wBZg==
X-Received: by 2002:a17:903:2a86:b0:2ed:acb:aa95 with SMTP id
 d9443c01a7336-2ed0acbcedfmr13163315ad.32.1793786571396; Wed, 04 Nov 2026
 02:02:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 02:02:49 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 02:02:49 -0800
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Pavel Zun <pavel.zun@gmail.com>
Date: Wed, 4 Nov 2026 02:02:49 -0800
X-Gm-Features: AclHuK-HMpmke_qng3LB-Hx29bUBWQIyqvZYp6J0_LRzwul-CpSli9OzlMcV_0U
Message-ID: <CADEvP=2NtUENNJyNeE3i1jqV56tTtL5x14fwE=1tFu_qqozBzQ@mail.gmail.com>
Subject: [RFC PATCH RESEND] fs/ntfs3: avoid recursive MFT bitmap locking for
 external attributes (patch attachment)
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006431bf065f707beb"

--0000000000006431bf065f707beb
Content-Type: text/plain; charset="UTF-8"

The previous resend reached the lists, but Gmail wrapped a long diff
header during outbound delivery. The attached patch preserves the
original diff bytes. The proposed change and RFC notes are unchanged.

Sorry for the mail-format noise.

--0000000000006431bf065f707beb
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-fs-ntfs3-avoid-recursive-MFT-bitmap-locking.patch"
Content-Disposition: attachment; 
	filename="0001-fs-ntfs3-avoid-recursive-MFT-bitmap-locking.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 77810fb52e3477ba_0.1

RnJvbTogUGF2ZWwgWnVuIDxwYXZlbC56dW5AZ21haWwuY29tPgpUbzogYWxtYXouYWxleGFuZHJv
dmljaEBwYXJhZ29uLXNvZnR3YXJlLmNvbQpDYzogbnRmczNAbGlzdHMubGludXguZGV2LCBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnClN1YmplY3Q6IFtSRkMgUEFUQ0ggUkVTRU5EXSBmcy9u
dGZzMzogYXZvaWQgcmVjdXJzaXZlIE1GVCBiaXRtYXAgbG9ja2luZyBmb3IgZXh0ZXJuYWwgYXR0
cmlidXRlcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKbnRmc19sb29rX2ZyZWVf
bWZ0KCkgaG9sZHMgdGhlIE1GVCBiaXRtYXAgd3JpdGUgbG9jayB3aGlsZSBleHRlbmRpbmcKJE1G
VC4gR3Jvd2luZyAkTUZUOjokQklUTUFQIGNhbiByZXF1aXJlIGFuIGV4dGVybmFsIGF0dHJpYnV0
ZSByZWNvcmQsCndoaWNoIG1ha2VzIG5pX2luc19hdHRyX2V4dCgpIGNhbGwgbnRmc19sb29rX2Zy
ZWVfbWZ0KCkgYWdhaW4uCgpuaV9pbnNfYXR0cl9leHQoKSBwYXNzZXMgaXNfbWZ0X2RhdGEgdG8g
dGhlIGFsbG9jYXRvciwgc28gdGhlIG5lc3RlZApjYWxsIGZvciBBVFRSX0JJVE1BUCB0YWtlcyB0
aGUgb3JkaW5hcnktZmlsZSBwYXRoIGFuZCBhdHRlbXB0cyB0bwphY3F1aXJlIHRoZSBzYW1lIHJ3
c2VtLiBUaGlzIGxlYXZlcyB0aGUgYWxsb2NhdGluZyB0YXNrIGJsb2NrZWQgb24KaXRzIG93biBs
b2NrIGFuZCBibG9ja3Mgb3RoZXIgdXNlcnMgb2YgdGhlIGZpbGVzeXN0ZW0gYmVoaW5kIGl0LgoK
VGhlIGZvbGxvd2luZyBzdGFjayB3YXMgb2JzZXJ2ZWQgb24gNy4xLjEzLTItTUFOSkFSTyBkdXJp
bmcgZmlsZQpjcmVhdGlvbiwgd2l0aCB0aGUgaHVuZy10YXNrIHJlcG9ydCBpZGVudGlmeWluZyB0
aGUgc2FtZSB0YXNrIGFzIHRoZQpsaWtlbHkgcndzZW0gb3duZXI6CgogIGRvd25fd3JpdGUKICBu
dGZzX2xvb2tfZnJlZV9tZnQrMHgxZTcKICBuaV9pbnNfYXR0cl9leHQrMHgxYWMKICBuaV9pbnNl
cnRfYXR0cgogIG5pX2luc2VydF9ub25yZXNpZGVudAogIGF0dHJfc2V0X3NpemVfZXgKICBudGZz
X2V4dGVuZF9tZnQrMHhlZgogIG50ZnNfbG9va19mcmVlX21mdCsweDI2MgogIG50ZnNfY3JlYXRl
X2lub2RlCgpEaXNhc3NlbWJseSBvZiB0aGUgbWF0Y2hpbmcgbnRmczMgbW9kdWxlIGlkZW50aWZp
ZXMgdGhlIGV4dGVuc2lvbiBhcwpBVFRSX0JJVE1BUCwgbm90IEFUVFJfREFUQS4KClBhc3MgaXNf
bWZ0IGluc3RlYWQuIFRoaXMgc2VsZWN0cyB0aGUgY2FsbGVyLWxvY2tlZCwgcmVzZXJ2ZWQtcmVj
b3JkCmFsbG9jYXRpb24gcGF0aCBmb3IgYWxsICRNRlQgYXR0cmlidXRlcywgbWF0Y2hpbmcgbmlf
Y3JlYXRlX2F0dHJfbGlzdCgpCmFuZCB0aGUgbnRmc19tYXJrX3JlY19mcmVlKCkgZXJyb3IgcGF0
aC4gS2VlcCBpc19tZnRfZGF0YSBmb3IgdGhlCnVubmFtZWQgJERBVEEgYm9vdHN0cmFwcGluZyBj
b25zdHJhaW50cywgd2hpY2ggZG8gbm90IGFwcGx5IHRvIEJJVE1BUC4KCkZpeGVzOiA0MzQyMzA2
ZjBmMGQgKCJmcy9udGZzMzogQWRkIGZpbGUgb3BlcmF0aW9ucyBhbmQgaW1wbGVtZW50YXRpb24i
KQotLS0KUkZDIG5vdGVzOgoKVGhpcyBpcyBhIHJlcXVlc3QgZm9yIHJldmlldyBvZiB0aGUgbG9j
a2luZy9yZWNvcmQtYWxsb2NhdGlvbiBmaXguCkkgaGF2ZSBub3QgeWV0IGJvb3RlZCBhIHBhdGNo
ZWQga2VybmVsIG9yIHJlcHJvZHVjZWQgdGhlIG9yaWdpbmFsCmZhaWx1cmUgb24gYSBkaXNwb3Nh
YmxlIE5URlMgaW1hZ2UuIFBsZWFzZSBkbyBub3QgdHJlYXQgdGhlIGZvbGxvd2luZwpob3N0LXNp
ZGUgY2hlY2tzIGFzIG5hdGl2ZSBmaWxlc3lzdGVtIHZhbGlkYXRpb24uCgpWYWxpZGF0aW9uIGNv
bXBsZXRlZCBvbiBtYWlubGluZSBhdAo3MzRiZWY1NDhhOTZlODc3NGQ2ZWVmNWRmYTIwMjZjNmVk
YzRlODBiIGFuZCBzdGFibGUgdjcuMS4xMzoKLSBDb21wbGV0ZSBmcy9udGZzMy8gb2JqZWN0IGJ1
aWxkcywgeDg2LTY0IGRlZmNvbmZpZyBwbHVzIE5URlMzLAogIFBPU0lYIEFDTCBhbmQgTFpYL1hQ
UkVTUywgR0NDIDE2LjIuMSwgVz0xOiBubyB3YXJuaW5ncy4KLSBBIGhvc3QgaGFybmVzcyBjb21w
aWxlZCB0aGUgYWN0dWFsIG5pX2luc19hdHRyX2V4dCgpLAogIG50ZnNfbG9va19mcmVlX21mdCgp
IGFuZCBudGZzX21hcmtfcmVjX2ZyZWUoKSBmdW5jdGlvbnMgd2l0aAogIGluc3RydW1lbnRlZCBs
b2NrL2JpdG1hcCBkZXBlbmRlbmNpZXMuIFNldmVuIHRhcmdldGVkIGNhc2VzIGRldGVjdAogIHJl
Y3Vyc2l2ZSBsb2NraW5nIGJlZm9yZSB0aGUgY2hhbmdlOyBhbGwgMTcgc2NlbmFyaW9zIHBhc3Mg
YWZ0ZXIgaXQuCiAgQ29udHJvbHMgY292ZXIgb3JkaW5hcnkgYWxsb2NhdGlvbnMsIERBVEEgYm9v
dHN0cmFwcGluZyBhbmQgY2xlYW51cC4KLSBjaGVja3BhdGNoIC0tc3RyaWN0IC0tbm8tc2lnbm9m
Zjogbm8gZXJyb3JzIG9yIHdhcm5pbmdzLgoKVGhlIGFmZmVjdGVkIG1vZHVsZSdzIGJ1aWxkIElE
IG1hdGNoZXMgdGhlIGh1bmctdGFzayB0cmFjZToKMWY2MDExMzUyZjE5NjE5NmQyNjYwNjkwMjM3
MDRmZGY2MTAzMDI0OC4gSXRzIGRpc2Fzc2VtYmx5IG1hcHMKbnRmc19leHRlbmRfbWZ0KzB4ZWYg
dG8gdGhlIEFUVFJfQklUTUFQIHJlc2l6ZSBjYWxsLCBhbmQgdGhlIGlubmVyCm50ZnNfbG9va19m
cmVlX21mdCsweDFlNyB0byB0aGUgcmVwZWF0ZWQgd3JpdGUtbG9jayBhY3F1aXNpdGlvbi4KVGhl
IG9yaWdpbmFsIGtlcm5lbCByZXBvcnRlZCB0YWludHMgUCBXIE8gRS4KClRoZSBpbnZlc3RpZ2F0
aW9uIGFuZCBwYXRjaCB3ZXJlIHByZXBhcmVkIHdpdGggQUkgYXNzaXN0YW5jZS4KVGhlIG9yaWdp
bmFsIHByb2R1Y3Rpb24gdm9sdW1lIHdhcyBub3QgdXNlZCBmb3IgZXhwZXJpbWVudGFsIHRlc3Rp
bmcuCkEgZGV0YWlsZWQgcmVwb3J0LCBzYW5pdGl6ZWQgdHJhY2UvZGlzYXNzZW1ibHkgYW5kIGhv
c3QgaGFybmVzcyBhcmUKYXZhaWxhYmxlIGZvciBmb2xsb3ctdXAuIFRoaXMgUkZDIGhhcyBubyBE
Q08gc2lnbi1vZmYgYW5kIGlzIGZvcgp0ZWNobmljYWwgZGlzY3Vzc2lvbiwgbm90IGEgcmVxdWVz
dCB0byBtZXJnZSBhcy1pcy4KCkRvZXMgdXNpbmcgdGhlIGV4aXN0aW5nIGlzX21mdCBhbGxvY2F0
aW9uIHBhdGggZm9yIEJJVE1BUCBtYXRjaCB0aGUKaW50ZW5kZWQgbG9ja2luZy9yZXNlcnZlZC1y
ZWNvcmQgY29udHJhY3QsIG9yIGlzIHRoZXJlIGFub3RoZXIgTUZUCmF0dHJpYnV0ZSBwYXRoIHRo
YXQgbmVlZHMgdG8gYmUgaGFuZGxlZCBiZWZvcmUgdGhpcyBpcyBzdWJtaXR0ZWQKZm9yIGluY2x1
c2lvbj8KCiBmcy9udGZzMy9mcmVjb3JkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9udGZzMy9mcmVjb3JkLmMg
Yi9mcy9udGZzMy9mcmVjb3JkLmMKaW5kZXggYmVhZDAxYTk1Li5hNGM2ZmEwMTkgMTAwNjQ0Ci0t
LSBhL2ZzL250ZnMzL2ZyZWNvcmQuYworKysgYi9mcy9udGZzMy9mcmVjb3JkLmMKQEAgLTEwMTks
NyArMTAxOSw3IEBAIHN0YXRpYyBpbnQgbmlfaW5zX2F0dHJfZXh0KHN0cnVjdCBudGZzX2lub2Rl
ICpuaSwgc3RydWN0IEFUVFJfTElTVF9FTlRSWSAqbGUsCiAKIGluc2VydF9leHQ6CiAJLyogV2Ug
aGF2ZSB0byBhbGxvY2F0ZSBhIG5ldyBjaGlsZCBzdWJyZWNvcmQuICovCi0JZXJyID0gbnRmc19s
b29rX2ZyZWVfbWZ0KHNiaSwgJnJubywgaXNfbWZ0X2RhdGEsIG5pLCAmbWkpOworCWVyciA9IG50
ZnNfbG9va19mcmVlX21mdChzYmksICZybm8sIGlzX21mdCwgbmksICZtaSk7CiAJaWYgKGVycikK
IAkJZ290byBvdXQ7CiAKLS0gCjIuNTUuMAoK
--0000000000006431bf065f707beb--
