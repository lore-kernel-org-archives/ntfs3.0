Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33215697F
	for <ntfs3@lists.linux.dev>; Mon, 29 Jan 2024 21:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706562003; cv=none; b=tFw/Z+yudhBrZXYqnJ11/I0/XOwBuF+Np3ElPVJeb+ficFZJSFiSrd6u+wHknHOdwjJevkaVaWj7ddt6dYq30uLZYEg+LYyzyfQ68FpSTAvXoEwAHulP+Rh4L56Vk8H/nRHl6Dh7JSTIszSTY+omuTZpyXlcLkaejF0Yr0/FatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706562003; c=relaxed/simple;
	bh=ibokadCESHSA11HDDNlCAcaBxiIM5GHQthJ33p4hMt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CQulcIpoak7Azm7qIekAyMucvVuvY6DdBpkHkGAkhtkKD8NNBOjD9TNovvloZiqzK64pVe7LLsk0OTBxT/MoF+2IlGRpq4RpMwhY77Ugllv6UL3P4ehF8HRd76ZwUWF6C+oa9Nq6/fwh20D2XcTwGOqCDAXqIAR3IU5pzgNs+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ByLf6tgA; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ByLf6tgA"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7beeeb1ba87so49652439f.0
        for <ntfs3@lists.linux.dev>; Mon, 29 Jan 2024 13:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1706562000; x=1707166800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LSn6LBXM31HvHqvEALdWkrsVvyHsbFeG4dy64fSTfE=;
        b=ByLf6tgAJnHbCyk6Egu4ZcriOMIFRZLhUXVOQ17Td17L4BtPDcbIexMh5WEcLzxw4c
         tZPzdgMnuLk/d/yn93DWTSE6obX9JoQqkwfncGHfYPu3NP9d1gytCrHJ98mtcQlW2JUZ
         /VKcHlKHfMyQ+DIFtt0cptBfc23qGloaAKpQjGXHuDLMLRQFz3UFg0Zqi2fGow5RFgtz
         cT7THml8C0PQWKLCk6f9Wu+WiLEyl5fG5FwI6O/ZACFqSwDVb4c+wBjvYor9giropkyT
         jgQ3rSNDeslf8PAKF2y6dXvQTkOKIbfqc4REQSOsNmdQxAf/IBH/hk6/XqXPqQyzSvyx
         IzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706562000; x=1707166800;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LSn6LBXM31HvHqvEALdWkrsVvyHsbFeG4dy64fSTfE=;
        b=vC1e7eQd8VChEXFzJFuUyIvMLHN14vY16MUTdy/WdCLFpXHD2L0FOhIQQYFlf7wclP
         1fPcu1lU6NIoGbu/DqkbqTqzzLGDD1eQE48+cBiJejlukzLPUN2UXZcBUmy+7/+/q7PF
         /AGkOJ3XJodCdKnO4cYfswDEX2e7kOrQ1doS+nD1yRm30mP/PNHdR2bDjVCV4emr5lfR
         SatnWiuGFQGjlijKgMZlNCDVg8IAuaQCY+T9e6t9V0DztLWovSOT2OZnufP5AOFzYr/1
         O+zwxYnAbcNBhKqIcRNspbqBusISve7LDYzIpos+ZxfbBfxCkUM/aurkMzrL4GID/DKG
         +WbA==
X-Gm-Message-State: AOJu0YzWWqoYpcL5kxOPqRV5Fu4S4mjg2TDTxk6DsGBn5GnJumM7+LYn
	r7V6f/MQFBvSx10uVH9qWTD6b77X+XXuevxeqfaxBXjLaPs5DUm7Qir1zNAMX6U=
X-Google-Smtp-Source: AGHT+IHPTdM7bWCC3uKdOyS9KP89WOgaIyn9pl+DIsnhjC44TMW7G+ElMdFDPse7HJKfD3zVMCK0Dg==
X-Received: by 2002:a6b:c953:0:b0:7bf:60bc:7f1e with SMTP id z80-20020a6bc953000000b007bf60bc7f1emr8003144iof.1.1706561999898;
        Mon, 29 Jan 2024 12:59:59 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d9911000000b007bf0e4b4c63sm2339741iol.31.2024.01.29.12.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:59:59 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: brauner@kernel.org, Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240129180024.219766-1-aleksandr.mikhalitsyn@canonical.com>
References: <20240129180024.219766-1-aleksandr.mikhalitsyn@canonical.com>
Subject: Re: (subset) [PATCH 1/2] ntfs3: use file_mnt_idmap helper
Message-Id: <170656199924.3224941.3075763153914506438.b4-ty@kernel.dk>
Date: Mon, 29 Jan 2024 13:59:59 -0700
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Mon, 29 Jan 2024 19:00:23 +0100, Alexander Mikhalitsyn wrote:
> Let's use file_mnt_idmap() as we do that across the tree.
> 
> No functional impact.
> 
> 

Applied, thanks!

[2/2] io_uring: use file_mnt_idmap helper
      commit: 712fc7e5862c2b9af7cf37418e4b398c5493ffb5

Best regards,
-- 
Jens Axboe



