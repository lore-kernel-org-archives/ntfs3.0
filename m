Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3C27707
	for <ntfs3@lists.linux.dev>; Sun, 28 Sep 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759072652; cv=none; b=h2E4umyH+4y9L8NrRBQ6ZJWdtbipaEs25DdUC+K96xy+c6Bms5aT3tHr3qOf0hvGwTHMRKMkLHD6E/OvBpO/V4UlZK3d30kO4HHq8EJXF8sK38O8fwzCUW9rg/h94Cusx9FitjHIB3IklKnG4PGqUZv6YdVLQR1BmEb2YkJh2WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759072652; c=relaxed/simple;
	bh=gNKSetNlSBaBKHWx6dCZg9eil+3R4RosFQhrPYIVI1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TD/+9IZ3JpMaccivnXkSL1Lc5VMblMG9gLG72WXq/G3SUeFlHm89BzDs6V8DCPnmvooxiO7tsH/rFXX98TxvqRiD5nqmSI0lekkDSUTpVo73DRO80ENQMyl5ArFoTiMC/+canneYX4Q+gLYq+n5+c0Eypvat408uP44jgXJppgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBbrUiHz; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBbrUiHz"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa0792200so2502176e0c.3
        for <ntfs3@lists.linux.dev>; Sun, 28 Sep 2025 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759072649; x=1759677449; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vqHkUy8fuyVbj5suFT081UY64ZPTEl5grQdmncLLbw=;
        b=YBbrUiHzSumkoX5SW/HpQXc7Z0JyiZ/lt06Y51tUILve896DE3uyLxUPYZ54gqnUWg
         9iV7qyiRh5RJNVb/xyNliok6n5Dt+ixwMVPfPXLvBEB0s0B/MqYmgniJcjrtdm9BP9gk
         IOOZQnw28wluDpOGfWxan4U3cgmVzR2qkIlAZymNEwugp5Y0Xil9PSPqEF7XghChT4ch
         uXLYJqRljDgcKSlR8S9pKaKhM29Dyse696VYiJvA1vm0RgH7lgr7oimz415xjtlfhqK0
         DFz0m/XiceModHptg0PiXrz4Yjj/MV416dfY88Z3vlEiRiZSeRAw/20AFcy6JMxTqgKj
         bZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759072649; x=1759677449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vqHkUy8fuyVbj5suFT081UY64ZPTEl5grQdmncLLbw=;
        b=n6+IyBaP9pVcEQknB2HQDmobJH44bmLcskgBuKN8uuzDenCqqIq4bX0HwzPiNNVES9
         gGTlLV5ZEvBZ5SaWdjhL3aa5qDFXrM1na/QrbkXiDXKrmgLnM9K0Bhl/88nfMrzqnjuy
         qkhA37/ASc2FjTpBxnjmqyBgXTpxkV3Z5x8m5wHmA2wpN3PurAcJ/U4FDlQOV8A0zWlo
         08PSOVirU7JvR6sHFnAz+LCyyk3J5tahOG60hCCFsEDXObe3zjwnmCK/Me9taOWtHVGb
         MmIwzSsfGom/uXgirDYDZu5XItwggO2JBWLxBlEjc5H1MW2BfR7j1JU4oJE/Ca5UC5uJ
         bIlw==
X-Gm-Message-State: AOJu0YzekNAbmKHWyQkzQ6F+Ig+MjZs/BwwFXKP0On2R2Qyb+2FSXG0l
	xO2iDAWH6vun9v5zveOBAOzxlWWm9FJIAz2kgFpibfKQA5ut9y/GkWpn
X-Gm-Gg: ASbGncvKJPlyW1BdMC4Z3iDuBjvlzYaxzYJvq4d3FzT70bg4Tf+uNxPtmh3SpGK58VD
	QLRtOSe4cUGBVL6AQKyOid/QYx7eEiMXh2ZKzmuS+bJBMu32GfLWTNYpblfYLqOPNqjCeJWzWjg
	6Br/nVAUY70la0B2i7IOkqaKN3d5QJmKE5CqB4zFZrXj44PTmsrAlretSWb4TvtR9m+XaaeLhiU
	KJ2gWNUJIC5At9ggzC4+V65aFtXkbsGhK8Vao2ndprSN3s+YV5AqvUCeBTb8Hfc2RhbCYIzQ2Kk
	RimdFgZigOursmyD56APJkpbng+E8FSNcR9/0PnRbKS1oPfiRNJunulFUVh30B0rWLGXbwZxwy+
	EmzdXi+hca79EktwZF53XHK8OY/2k/ykUMO2OWcc=
X-Google-Smtp-Source: AGHT+IF8pnH4LYbG6wywYAE+rCN8FpqtNuwStfp46rg0IEu+rwT49OwVM0C6uY5V1Kl8rA0DIg5drg==
X-Received: by 2002:a05:6122:3109:b0:54a:8690:719b with SMTP id 71dfb90a1353d-54e6086099cmr290197e0c.11.1759072649431;
        Sun, 28 Sep 2025 08:17:29 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed8a4e77sm1806934e0c.10.2025.09.28.08.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 08:17:28 -0700 (PDT)
Message-ID: <56d8cad5-d8ab-436d-bad0-c631e414c70d@gmail.com>
Date: Sun, 28 Sep 2025 11:17:26 -0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: fix uninit memory after failed mi_read in
 mi_format_new
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
 almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org,
 syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
References: <20250925203701.223744-2-rpthibeault@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20250925203701.223744-2-rpthibeault@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/25 16:36, Raphael Pinsonneault-Thibeault wrote:
> attr_insert_range() called from ntfs_fallocate() has 2 different
> code paths that trigger mi_read() (which calls ntfs_read_bh).
> If the first mi_read() -> ntfs_read_bh() fails with an IO error, it
> leaves an uninitialized buffer in the buffer cache.
> The second mi_read() -> ntfs_read_bh() then uses that buffer,
> where we get KMSAN warning "uninit-value in ntfs_read_bh".
> 
> The fix is to check if mi_read failed in mi_format_new.
> 


Did you do any testing for this patch?

David Hunter

