Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE4F340406
	for <ntfs3@lists.linux.dev>; Mon, 31 Aug 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186249; cv=none; b=Yk7vusvrPSEzrN502CCekYIS7tLhzjLORGMtPylLWx/+m97rH0mH55Y83rfFdGKvqmz1ju40OdJjxg53M4NE0Jt+RZx6zFyJ/meJOT468pr10IPZM2mwWIclkSZv+ErhxJEnieKQSZy5MbF+njHNRDiDHqyc7TTD6INymZp8Gz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186249; c=relaxed/simple;
	bh=9mlgq9kswA383J6vVWIkDQP86PxyZMrEWKdREvtgIGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xh7eOt0at3Tvclam5fHTShflFOGmdzXFIbHiDdgzxiZBLg/yS0C/0kTfZDngJhvj0chg48vgncd00FXX/oCKW3hUJ5tGVMQ9PqlvTW+QNENzuB83dPnyh04e9NgE2zpvKitn1HnWal9upUSE3309xi3DqUpDsI6W/xH1pnzRgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYnVJAyD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYnVJAyD"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4af4be667so3152019e87.0
        for <ntfs3@lists.linux.dev>; Mon, 31 Aug 2026 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186245; x=1788791045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaVEwReoXhJ6W9rZ7l7CMc6ajDjovCb+0lJwxGj7ri8=;
        b=eYnVJAyD+LQnA8ylFgOhSUpPRDsVDTWoEbo3PNFhE5pxqi+w7cXvNJ/VOLYaL44R8N
         8UA74uRrDBx5UiOrob4B4wpHMcxSQFWhphOtimndsHtMjJ3LUX1YABUoKknUipSjSvzM
         +y+awNwndntPKIuL5OuEb8cuvMsqGO49pHIcJs/PBQCpy823+92TzJ1snTQGAsSx4fnR
         4C0LsNWJkjZc3fFc1ORG10KZPf+2vhIO3Upv12H2d8S/+IoJQrJMpOVeZ/mzr2DsxRl9
         iL7Rsca3h/kyeSXhyMEf0EJmE3ky8LV5LMR4qD5LilNcT4iBKpD0ypBxhiMsCJ5tGUIg
         Al1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186245; x=1788791045;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaVEwReoXhJ6W9rZ7l7CMc6ajDjovCb+0lJwxGj7ri8=;
        b=kJtQEycRgo7DqTN7hvZxly8vY7GFKaD188eokqf1ZC0WFpwuhoO+cVdO4l0RigLvdu
         E3lq+MXFbX5rKEr/E4fXSo/mreUSozrEIBX7d6n0DZkgof/5SHSwj664+SPY4832CnyK
         sDU3bc0ZtZIeGALALE4vHEf4h8Mt/OMciSnP7wcd7rlcrlt0AmpvwxcyTNmaVerrybPf
         qNV1kuwfOIEY/9I4ug9r8ZsAd+vGQy6SyEKaaxUZwIvZPoZVEpIlWcSGC8tp+bPaMkRA
         PJ6jnyaBG16WfpYSjkRfjz9Ac7O43fmRd86EytfDK0Rq48IvzRaxey7A6LDo21+rg10j
         k/dA==
X-Forwarded-Encrypted: i=1; AKwUvBwLV09IBIOQHp7PFfmjxTvhdtrLSxLPkWqqEzYc2a2lT3XzOUBxgQhouuViOHZNJm036vFyCg==@lists.linux.dev
X-Gm-Message-State: AFuF++njx7wtDb2gyS24+Bssg+Ae3Kl7n2g0yEa7uM1LOk3I+Y0Pugqz
	MW2+o/PtiXq0PCzD1nGhhzuTOL5TjEvt8nkdnVO7uwxWYoVs9pTrNQv+
X-Gm-Gg: AYBFou26prACAAzme6ZH0+5lsRISbFbp8D6DK+oXqT02ENFhHkdZqEAvYSAeIY0yWUZ
	jg0Xen0po1uG0qr3sXIkerXpk52pmnw9UydoFyBHWQr9Pz+QJmJuStD47mM+xFRU7gBfUPaDn12
	TJj8/pkdawyucbF9fSP7H7YSSQGC2sC1ECijkzwRV68xR/azsRgXvpN3NZScR5MraWOiDAypGEN
	cPQhUbJMt3fDrFvMDgcq7vpTUgcsGfRPA5ibqL/dsCNegk3rcf+62xRcvjFLk2c6qMZrO9V82IT
	ANeXyhFBZu2Hb0F2iAU/NbGL7b4Wa/zxhkCNkOxox4BIeEGWpdbAaG560uVi37ddxsrKNyEdOOI
	8kvBv/5ZqviEFfhlVja8nhadIR21A1FJ3KM173yjn1Ba0hOT5ojvwNX/qy/8HF9G44fcZblkQyX
	T8lhcpwNFUM26SynyGyOWUIZslzgA9+jenMUrQnrhqZHomah59bb1PKBMayGwFA7BpRQ==
X-Received: by 2002:a05:6512:244f:b0:5b4:9d34:eb7a with SMTP id 2adb3069b0e04-5b5e68ec8ddmr7131619e87.12.1788186245049;
        Mon, 31 Aug 2026 07:24:05 -0700 (PDT)
Received: from kali ([37.114.129.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5c8fsm2292919e87.9.2026.08.31.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:24:04 -0700 (PDT)
From: Tabriz Hasanli <cybersec467@gmail.com>
To: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	w@1wt.eu,
	Tabriz Hasanli <cybersec467@gmail.com>
Subject: [PATCH 0/1] fs/ntfs3: fix OOB writes in do_action() log replay via unvalidated trailing index entry
Date: Mon, 31 Aug 2026 10:23:43 -0400
Message-ID: <20260831142344.472594-1-cybersec467@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Willy, Konstantin,

Thank you for the quick and detailed feedback.

First, apologies about the display name — it was a placeholder from
when I first created the account.  I have since updated it to my real
name: Tabriz Hasanli.

As requested, here is the fix as a proper git format-patch against
mainline (cf72cbb39).  A single patch addresses both check_if_alloc_index()
and check_if_root_index() since they share the same root cause and
the same fix pattern.

Per your note that crafted-FS issues are outside the private
disclosure threat model, I am sending this to the public lists.

Summary of the bug:

check_if_alloc_index() and check_if_root_index() do not stop at
de_is_last() and do not validate the target entry at attr_off.
This allows a crafted NTFS image's $LogFile to direct four
do_action() write operations to an attacker-controlled fake entry
in the trailing gap, producing heap OOB writes of 8 or 56 bytes
during mount.

These are variant siblings of the view.data_off fix (3e127829e57f)
and the DeleteIndexEntryAllocation fix (fc4626bb3656).

Confirmed with userspace ASan harnesses using kernel-faithful
512-byte INDEX_BUFFER geometry (fix_off=0x28, fix_num=2, full
check_index_buffer gate chain).  Harness source files are
available on request.

Thanks,
Tabriz

Tabriz Hasanli (1):
  fs/ntfs3: validate target index entry in
    check_if_alloc_index/check_if_root_index

 fs/ntfs3/fslog.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

--
2.53.0

