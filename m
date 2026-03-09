Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D694C3D1CB4
	for <ntfs3@lists.linux.dev>; Mon,  9 Mar 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067960; cv=none; b=MBGW77SoD5SpUEtt/gp89g9tMG4Twse5BgU/wIPO+Y2ye4UDCH7+mWWD36tqqmoswoyV9/qIt520zEJfLZoDD+Pho/2do2hp1zg4GMe7miIO3U/r91OJZGmcSZYWIp1XoMv5vZTNr9dtF/oe8MnNaP3qYRdeqYolWlIoQ6gNJ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067960; c=relaxed/simple;
	bh=njW+dpSk10SuO1AcbH5tukD81vdWuhIyIPazhF2qfvk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V20fPD8ZW6PUZ6EFU+dQS9DHr5wLr9CtyWk95F55htSB72xbBMWBKi/i/BxrBKFxYOA+ntA78YyUYFkYjmpijXhuurgRfYXujchUqBjku4HZjHDgWbY2g9jdpmSisqpFyI8Xw81h1EVNOMApvNLxpmLPr5y9Pm7qTSPpAJg0deY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rCfPz1ys; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rCfPz1ys"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-509217e84a3so4406331cf.3
        for <ntfs3@lists.linux.dev>; Mon, 09 Mar 2026 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773067958; x=1773672758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M362llShL/olgkvofrhnarltpI/bzDs+ZoXPZquhvi8=;
        b=rCfPz1ysbjFoYMFoxa6XjrQS+GUoa/mYJNm4tsh+hCMnXn1haGC8U+bJC/VjdNeyI0
         h0HoAurJY+aocgenR0tqq9bhnYCWmXqDemsoRB7B8gLeTOsc8/rJAvoGBHJK0LiSl6N4
         91Inf+x69DKpzA+sgHV3N/wP543KG8fQOxg7RnhCIDpaOYnK/JtHBBFkiWyVfuEsfWBK
         i0tAP+ov1uuVPpcDFGbhIsDJiYkq9ttRXJ1ZxqNAEuE7EhushQrs0weVU32VpT1P4JdL
         wTZwpcvdNN8z3RiT1tLih0llDuA1wmZlI9dbX6NQyY/r0nXARDVPEx02ZbHSxaxi393M
         r0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067958; x=1773672758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M362llShL/olgkvofrhnarltpI/bzDs+ZoXPZquhvi8=;
        b=vvzMAXjl5fD9FUIUi6b9sASfODgeNSbVx281rEiSyC4rj5LevKq5gn9UTBxZynJ54a
         oMEIIBhbrZu5It5Fp/ak4oouGIkJaAzpsXb9+a8uk3ADDo96h4nC82J8fbtb7MPb4W6j
         k0HDCtPsCliPs0S1iCOc8GNuaANScwBpOk+FQwR3uOeTiXBd6Vy8PWTVQ7zVRmCKipJU
         TGBbDJ9yrfxy2tlcRJ1lEu8tt0u8bxUlVjPRvj2OJPJT3Z5aJ49lZ4iRdKKnd3LIH01I
         Bg0FIlcSF0gTchvBaaSBduCsYvJNF4yY44MZ0DmOpP3X7HQWpaR4nn91KpSU3Q1hFz41
         VdtA==
X-Forwarded-Encrypted: i=1; AJvYcCVO6pPPkV2aUVeYP8nqjfchu9RMPg/IE1O55aWd1TqZgsZPqXK/SAdYWjrIQnwr7iPZhvzLpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjLzwH6aLk3Cz09jllkCvAfzfnEfxgV7zFoYYhk3ej7CWKsDVj
	ZEMqmBD8Tw0EIYOzBEuwHEar2A01f3Jvavljtx8UjUXN2RnY8pyYs9XWkWUoYRYs2/Y=
X-Gm-Gg: ATEYQzzIyfpN5oM1Oh/eW1UKS/9p2oAFKfq8ofSxgbdQMb4YsouvmMLUoBZ2ELvVRcn
	ZHyukyDeCrGvvg7XMftO/3YsJE58nc3EDPnZpCWMfTyE/VNfCgHYXAGWdfsTPeyKgpayoBHbKHF
	jZF+lZsoIT8ce1i23W5OXz0aOltQ0X9vvrGqUkFGve2nFAlHlXqJURFTKgtg5xTqGokY4nGky4S
	JXqtINrqP9SVlC2Aanzeo6ANh7n01WqmqbPCSJaYq0emxToglqEI8QhvZMXsuD/PIW20z+CcCzi
	WAm2n24M00BL7oQcDpT1QBNogEDbkSoiw6sAaa9i534iDSFIUZcelS8FtnUUF8LPKhRvEdpjBE2
	VBh9PjsHUnjqCtWJwnzBUVyynl0jgQPNCXUkik2HeElRXU6CZjU/Ns84uHNunPQjHc4kV+79acw
	lHbxys8iii7+GaG9WHg1tIn2iSuTbgr2jEE8GldAQyXtvx6s4=
X-Received: by 2002:ac8:5fd6:0:b0:4f4:de66:5901 with SMTP id d75a77b69052e-508f46c9079mr149938371cf.5.1773067957796;
        Mon, 09 Mar 2026 07:52:37 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.133.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-508f651440dsm65793431cf.5.2026.03.09.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:52:36 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anuj Gupta <anuj20.g@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 ntfs3@lists.linux.dev, linux-block@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org
In-Reply-To: <20260223132021.292832-1-hch@lst.de>
References: <20260223132021.292832-1-hch@lst.de>
Subject: Re: (subset) support file system generated / verified integrity
 information v4
Message-Id: <177306794392.32482.9164747646721806111.b4-ty@kernel.dk>
Date: Mon, 09 Mar 2026 08:52:23 -0600
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 23 Feb 2026 05:20:00 -0800, Christoph Hellwig wrote:
> this series adds support to generate and verify integrity information
> (aka T10 PI) in the file system, instead of the automatic below the
> covers support that is currently used.
> 
> There two reasons for this:
> 
>   a) to increase the protection enveloped.  Right now this is just a
>      minor step from the bottom of the block layer to the file system,
>      but it is required to support io_uring integrity data passthrough in
>      the file system similar to the currently existing support for block
>      devices, which will follow next.  It also allows the file system to
>      directly see the integrity error and act upon in, e.g. when using
>      RAID either integrated (as in btrfs) or by supporting reading
>      redundant copies through the block layer.
>   b) to make the PI processing more efficient.  This is primarily a
>      concern for reads, where the block layer auto PI has to schedule a
>      work item for each bio, and the file system them has to do it again
>      for bounce buffering.  Additionally the current iomap post-I/O
>      workqueue handling is a lot more efficient by supporting merging and
>      avoiding workqueue scheduling storms.
> 
> [...]

Applied, thanks!

[01/16] block: factor out a bio_integrity_action helper
        commit: 7ea25eaad5ae3a6c837a3df9bdb822194f002565
[02/16] block: factor out a bio_integrity_setup_default helper
        commit: a936655697cd8d1bab2fd5189e2c33dd6356a266
[03/16] block: add a bdev_has_integrity_csum helper
        commit: 7afe93946dff63aa57c6db81f5eb43ac8233364e
[04/16] block: prepare generation / verification helpers for fs usage
        commit: 3f00626832a9f85fc5a04b25898157a6d43cb236
[05/16] block: make max_integrity_io_size public
        commit: 8c56ef10150ed7650cf4105539242c94c156148c
[06/16] block: add fs_bio_integrity helpers
        commit: 0bde8a12b5540572a7fd6d2867bee6de15e4f289
[07/16] block: pass a maxlen argument to bio_iov_iter_bounce
        commit: a9aa6045abde87b94168c3ba034b953417e27272

Best regards,
-- 
Jens Axboe



