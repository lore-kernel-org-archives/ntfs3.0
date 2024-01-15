Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE571AADB
	for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="EP5vyN7f"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3608bd50cbeso37841505ab.3
        for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1705357241; x=1705962041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1e97FCLCiaJtKaM8A2COfDOTaSxHrLETGTHNR2Gz2g0=;
        b=EP5vyN7f2ZP3KoXwia7/+tW+wP/sAL5437ERH2SP6opsVOC4Gd7+cT9c/HNX4xcV9k
         RorDcVRihWU7c1ueqLC+VsSUoIPv/+SsyIQPjNKVs41gjwAwm+gUezzV7pNcCJuaoPQS
         itJTevDLBOo4Kzj6ihY+6pln/WXO5QQQjKHMOTqteQ/4ewESNm2aduZYSPbfDlQb9V0I
         ia3PXzrBJN/DxtAW5yDMTAU0+bkXaMwVDAMQdU7v02jAgFZDZnoZlgNGyfyp1E9wYOOc
         Jw0FbkjHIe/BdSLAbhHw4bzDA919UJo+VgvMBy7W7DVyawPmH8KgXe4mPvCQw5JJtjI2
         MOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705357241; x=1705962041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e97FCLCiaJtKaM8A2COfDOTaSxHrLETGTHNR2Gz2g0=;
        b=IVspKEymYObf0J5MH5aEwgUuDaf8OVytQuQrPOPaPEg/6xfxiC7NlT4T71HibMTSmR
         SHJ8AFB5fexhhhdst7OaM75LFOiRUnObRRVzZgYSFgQdNy7zVQMsQO3f5+WX7i3Ov2EQ
         cseIMC4kivUY6DO+NWmn93ubUzoZd3qP0zkneRaJowru4P1gXPUV844SuqyjIyAG6YAi
         hkLp2KLLeUXNwbFl/cFQTO6XmPV0EduKhTSjVNR9oT8ksVNBhZEOv8MCD4Mf8gjIUvDe
         VIHE+yXbQemfyAMPCY2RsQ4gp+NkSkUGRWPB0BDeWElRf+P3pK6zwwGdlIpMQ4ZmPPXW
         dmzA==
X-Gm-Message-State: AOJu0YxAxwKVaPx9yeVHJONOVAw9V2ayl1BTQc57P5NzKny7d9arU49C
	UAp/mTqaQyzS0SBV7gSuheGlSF2VUqejOQ==
X-Google-Smtp-Source: AGHT+IEakymELxTP8tP1+uJr4la+L3kGSc1S57KZxO+IjJWRQ7o3tOzQsgoBElifHzj0+fepJu8f5g==
X-Received: by 2002:a92:d981:0:b0:35f:f425:520b with SMTP id r1-20020a92d981000000b0035ff425520bmr5550056iln.42.1705357241458;
        Mon, 15 Jan 2024 14:20:41 -0800 (PST)
Received: from dread.disaster.area (pa49-180-249-6.pa.nsw.optusnet.com.au. [49.180.249.6])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902e98300b001d5dbd68290sm548079plb.246.2024.01.15.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 14:20:40 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rPVJt-00AsOX-0I;
	Tue, 16 Jan 2024 09:20:37 +1100
Date: Tue, 16 Jan 2024 09:20:37 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
	Anton Altaparmakov <anton@tuxera.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH] fs: Remove NTFS classic
Message-ID: <ZaWvtfFMftPXg92X@dread.disaster.area>
References: <20240115072025.2071931-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115072025.2071931-1-willy@infradead.org>

On Mon, Jan 15, 2024 at 07:20:25AM +0000, Matthew Wilcox (Oracle) wrote:
> The replacement, NTFS3, was merged over two years ago.  It is now time to
> remove the original from the tree as it is the last user of several APIs,
> and it is not worth changing.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Anton Altaparmakov <anton@tuxera.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>

I agree - this is largely untestable code and given the newer,
better featured functionality we have (ntfs3, ntfs3g), we should
just get rid of this old code.

Acked-by: Dave Chinner <david@fromorbit.com>

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
