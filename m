Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104AB247280
	for <ntfs3@lists.linux.dev>; Sun, 30 Nov 2025 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764543823; cv=none; b=aUj30E2910StTRHmKERQQnWdVRNiquHyFHjKj2zM2dtL/cnbp7aGA5Tj8D8p+Zljd1ccRhbc60oybiK0zRfQkwkAcahyZmy8/lROvTNoOR0KrRjWGQmLOZuaXQlmnuKLJfa9QTFPLOZNt2MLH4OexjQyQXDE/ArnfEmOs+GhN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764543823; c=relaxed/simple;
	bh=+KhrMhcJSvItbb/04gtqwcqQ9SN2qd7j6u0HCMyKS6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6ubpOGQCBsiB4K6DO/Ns7Jq5daS3IUAXlPS7qFzap3CiOAc779seUlDNyRJGltkmqGq8GHrayi1SH6/sI+rayXLtaPB7oemax7OEhL/X5N0RkQmKA4PRNfUxF1f2Ls8GvCzMJQgJmxzhrI716EZSd8xjB1ikigrpEwCeobpEWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2ce8681eso795823f8f.0
        for <ntfs3@lists.linux.dev>; Sun, 30 Nov 2025 15:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764543820; x=1765148620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KhrMhcJSvItbb/04gtqwcqQ9SN2qd7j6u0HCMyKS6E=;
        b=vhnm3aptIV8EIy/xXCsS26lP6niBDMWBjbT2M03zB1AKfGTR4rObvzHtZou7cOAKRK
         S9vbzwB4ZcErqgiTMOprbKCL60VCNEhwIGac9hWN3smd3cJMxNK/gYFK+dSfrktKu83H
         jGkcgXGOVmH6ldQ5zbP7U69TCm+LzoGjnUNFAy4JX1aoBs49vk4svdVavzItzku3OIWY
         EsulSNpih11dziQAVrRS9qqXQnc2Y9NoPZDUB8zwkzQogLnoJzujX7CYukFY/Z0TxK2Z
         QnJDPP2ZZpt1CMYeWitwrr3R16WlU1WHWbn3bj9CPQiRslenf7Esd5Ogu12u9gYUUS49
         XU2g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ46ZwvThD0FmZnw37B4i9pdrUAEer80AmUc7XDZCrxCKSWvuKf35GI3fSKN3RD2QqK/vbmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzng8zi4w8qIuGUbiLRc5sX1+Qoq19IyNUdKam+p3NNkaGOdvr+
	cs8SAGMD7dIbhyoQpKkOOHgvO7uGZSpquYMrgKfy2fRuLLrUkHFcFu/v
X-Gm-Gg: ASbGncvORDu55X1R7zqh0PiWbVF9ZuF3ACsIiLdvO89HBxhns+Y6wq8dvAf/TTYtNmT
	LDROd/FQCAILOjQ051fAaxpe2NcDRPwTUrNgSsRodXpeO2p2eLZ/Ws7zrCwPjK1G1Z6F3/uQ4gR
	BsUoB1uGp3qAmHYAgGqU9ENFQrXijGtc92uRYHXysv7qajGVYwpdBU1Hk4HFTjznvDXq0eOMXZ6
	ILnKj5oGmfA8QgTEmmgFFaK2XNIMjzbaLHucYjZU5TWucdvGTfDeLYCFPhJDtiySOyBnj+pKnTi
	405sIo3UQzJiYGZhn9ixmk2u0ThM5nxLRgOSca9zfWXKtIcnDqiuPvdhIQSdnsnDvISq3vG4tyb
	Ygfo7gug29zObJwNE99L0XKLKgDqZRuD0wAandYAZqgDhh7y3Ygkb7Xsof07pxptLcSUCdtGUNB
	OAqpi1+sRrAWY5Vi8IIDxFwMUd/zZY4mujEAu17mDN
X-Google-Smtp-Source: AGHT+IG0kUJO7SYN4V6YpXy8uJxkqAm9wDLe/yTWTady0nKXHIsEefrNGBZg2POKGw5qhetClLnvgw==
X-Received: by 2002:a05:6000:2484:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42cc1d0cf34mr37257663f8f.30.1764543820316;
        Sun, 30 Nov 2025 15:03:40 -0800 (PST)
Received: from [10.100.102.74] (89-138-71-2.bb.netvision.net.il. [89.138.71.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caae37esm22401721f8f.40.2025.11.30.15.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 15:03:39 -0800 (PST)
Message-ID: <b33b3587-edb0-4f30-a8ee-baaa2b631ed9@grimberg.me>
Date: Mon, 1 Dec 2025 01:03:37 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] nvmet: use bio_chain_and_submit to simplify bio
 chaining
To: zhangshida <starzhangzsd@gmail.com>, Johannes.Thumshirn@wdc.com,
 hch@infradead.org, gruenba@redhat.com, ming.lei@redhat.com,
 siangkao@linux.alibaba.com
Cc: linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 nvdimm@lists.linux.dev, virtualization@lists.linux.dev,
 linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhangshida@kylinos.cn
References: <20251128083219.2332407-1-zhangshida@kylinos.cn>
 <20251128083219.2332407-13-zhangshida@kylinos.cn>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20251128083219.2332407-13-zhangshida@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Sagi Grimberg <sagi@grimberg.me>
