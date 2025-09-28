Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D7223DCE
	for <ntfs3@lists.linux.dev>; Sun, 28 Sep 2025 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759073118; cv=none; b=BMF1/D07T9c00HoVobfyBPhWnMqfuxyF/8KkhW7Opx6NnB+3y/IYT2DcLNmnFebYiqZm+EDQ8aAfbgLM4Zqe/zmt7nFESsoEVQxK6vqBzeeCaMWvOoCy5zRLd1coaZlM/lSy2jpduw5l2c2qWBwLLHF2DEvE12JDUGiapBfDeR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759073118; c=relaxed/simple;
	bh=H+x7xeTP5Rlop6u846HTPlz3WDGleJxQQfSnJGaS35k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYa4hnABxNQ5T3n9fhGdYeI5asi33XzVhE2IqIvIY7q4uuX8df8DjJ5n4I5Y6Kdr7jDIkv7vbiQOlbR0zCYzOX8c4rsMveYgSpBRaQDls7TpiEvmRp/j5DG8k8eqb4FUKAq9S7yHxDmxTRId2E2s1ewKd3KufAbvXagQxw8VQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7p8opkc; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7p8opkc"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54bc6f33513so2824222e0c.2
        for <ntfs3@lists.linux.dev>; Sun, 28 Sep 2025 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759073116; x=1759677916; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGMYPzC49G0yAoq8KWoK1e/5gHShl7sG5H8YAVVDIFQ=;
        b=T7p8opkctoZsU8dHGxgYCq5Dpx/Q01qodOKXjlca78ADxxLwFfk+/q5nljQ0bwB+rD
         TT30e/EYyFsaPXzdf7AKoFnK8IW1d9BU8sj1mREbB9PiUqn2lO8tMXhKRpw7mpKRzgbh
         pmvynF8Lod7kD0u7UClV4/p7wMJOsbA8HXJI6lD05tVwoJQXNmrYG1iQdZLrQigu2O3q
         lNRZkOdxciMlAfKTmHS9lq9Dj9mONsCbw0tdFZNgcee7MRALHFIbHyImYoG73QHGVekM
         bF106fjLUgfRs47HTT9lxTyVJTyqmJyuc6BV/cz4iAI7LXWrrGxMGfwkesrPQ2iuegYi
         Bd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759073116; x=1759677916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGMYPzC49G0yAoq8KWoK1e/5gHShl7sG5H8YAVVDIFQ=;
        b=wkmM4jRud8e7zH1hW3XWE27RcqgsKFr5dsJKNT2RkxR5I5UWUWnl3R4Tu8vtbZ70X5
         Dt3b/1xV8UrLnyXwSMr60lWVuMr7Car/f6FJXcMxLZ3JAEwcOpLJO47x1UI7hyh8JFCA
         NCcHo/44gNktivW2bK2JERQGhONCPGwE9YLofKcViQY1QnQoEXwI5n7EiiYSusvvacOW
         uS5sd4JZdgghl40/A0r/pJhkrzASDDBodj/S+gYEhoEILdSUMfcXy9x8nTxm8D0+v3d+
         /vf0BoDl77lXuI3GU3Zio89XnYdnFBx/psD+7MkuKHxL1QaAk646XFVv92k8IKJmkGW3
         BUqw==
X-Gm-Message-State: AOJu0Yxmo+9QnGdOT5ZpjckexDYSmOm372/D4ReFSwMg6oA6EJPQmVHQ
	fbkxGtNwY7Kr+vlVmDO0gjkypfYtb3vGTQ9PcuQmzY2NxVnHvU7ZdVzU
X-Gm-Gg: ASbGnct7MXfpJZfxZGnmbiiSJ0AW6HjxvABwL+SjNKE/1h9xzXBfgU41Qu5BJt0NY/W
	/ckaQYuLTeVQKSTsusoeQT92aoxkG3+ChP/2oEBvJZtylYRFMRbBfLwCgM+rRlxFBC8mFOWWbC6
	UfHkV+ziC1fn28hUrOz48c297iR/cptn25SmBjS5xIUzWib8LSqzi39wMv93bkOyAHX6MNUljrv
	FE1BoekSifZConmtrj/tAn2NYF/iYKfHVlx6jaRtqgxlRwbPMlFE6GZX0s0AtrdsdhhKTDwvHrD
	x213B6l5L/4X4a4uwm7NAOAteaCiNQJqxJjijh+gktJ3cZWN8dgRli3x0ab1zDhUXiYkheFTF45
	5+HROQu4eVEF+1Bs0UYRloXGBaoGdRJRPFoBdKCxTREpfyiS9yg==
X-Google-Smtp-Source: AGHT+IF0xKF2bAVGZX6YLQnQJa6tiSFhgbcg/WEeQVm87W/X2LXfvblZ0Iq7cceCpPfrNrfPlWaS5A==
X-Received: by 2002:a05:6122:1e0b:b0:54a:a30e:188a with SMTP id 71dfb90a1353d-54e5f0fabe2mr319487e0c.14.1759073115611;
        Sun, 28 Sep 2025 08:25:15 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bedca058bsm1819366e0c.18.2025.09.28.08.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 08:25:15 -0700 (PDT)
Message-ID: <c5194ece-e402-49ba-8b15-674c782b1a6c@gmail.com>
Date: Sun, 28 Sep 2025 11:25:14 -0400
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

> -	} else if (mi_read(mi, is_mft)) {
> -		;
> -	} else if (rec->rhdr.sign == NTFS_FILE_SIGNATURE) {
> -		/* Record is reused. Update its sequence number. */
> -		seq = le16_to_cpu(rec->seq) + 1;
> -		if (!seq)
> -			seq = 1;
> +	} else {
> +		err = mi_read(mi, is_mft);
> +		if (err) {
> +			return err;
> +		}
> +
> +		if (rec->rhdr.sign == NTFS_FILE_SIGNATURE) {
> +			/* Record is reused. Update its sequence number. */
> +			seq = le16_to_cpu(rec->seq) + 1;
> +			if (!seq)
> +				seq = 1;
> +		}

How was this tested?

