Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D15EC2
	for <ntfs3@lists.linux.dev>; Thu, 28 Apr 2022 09:39:23 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e24so5927357wrc.9
        for <ntfs3@lists.linux.dev>; Thu, 28 Apr 2022 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:reply-to:to:cc:date:in-reply-to
         :content-transfer-encoding:user-agent:mime-version;
        bh=6ZKHGiDRzRbPXQHyr5VeHk6x4y/gIT70tGEEovHIImo=;
        b=PeHfrQr7jWNTLtX4c68wBxngwOTuc6NMSZlesvJOJtSY33jMGK1xGMQsMiFCXinjGw
         MS75GZe+n0mkK44PFTKNmKnl3KJN8OqrtQp59FO5P7sTHkcbRqSjAyfeULI6ezborhrm
         E+nHrGb2E8hBzTAikcfkXLMhQCLXNnONjR3+5xgcJq6D8ZBEw8iPxVpG+Ap9iC7B0fK/
         fnPsJHVIjwfdihDqsFnKv2Qtf/KhJexR5uFwI6pNDTLPEO+klzuh7npnpSvnShNvbGbs
         LS1tbiRj8GD3fy6nPgsFHtOWDN3P5u5FBS0b612O7SgX+7vA4WTLb3w+G5+R9a428qf8
         SS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
         :in-reply-to:content-transfer-encoding:user-agent:mime-version;
        bh=6ZKHGiDRzRbPXQHyr5VeHk6x4y/gIT70tGEEovHIImo=;
        b=Cv/Cc1rC946gRkdHaIQm4wJaP+LvyMeUCHcVyOIGPFNLUkhYIU6i41oeUT8CK1Lzr9
         y92Zm4nm7P/RWq5p6ue5LmzzQH25wjmoClbpPHmcp9/6kFJGFS1n6AtvkKwN1d2v1DDP
         acvGQ0ztDmO9U8bAxaREMhF+TUr93Ep/JAKFD/2dvXSyQTVZhJn6UZWOd8Y9nxOUEVdB
         zMlolnA5sVTK+pd1vibZvTX6UhG6Ce9m2qxtK7Ge22ybuozG/1bhkp0V0KZXMaKr9r3w
         6XjGSKftbRFCOodmV9d3L60rcBsAEtW5LRTiUhHqGLH6JdgjDunmXjBzBJLBEZnnQx5H
         cwuA==
X-Gm-Message-State: AOAM531YtPJ0iKmo8VouHfDwiHMbwk1VsN4cWbX0dnP4lq1b1rQ9/3DZ
	XDNrNmkwOWoZeLk7mZGqmGI=
X-Google-Smtp-Source: ABdhPJzq8Avm5kj5cxYcajFINUiU3+GPuk/6MpZQ3CFwCbRNxAjyTyWjHfcLKbugSSXMG2vEJZ97dQ==
X-Received: by 2002:a5d:59af:0:b0:20a:e9e7:5c12 with SMTP id p15-20020a5d59af000000b0020ae9e75c12mr8781894wrr.572.1651138761316;
        Thu, 28 Apr 2022 02:39:21 -0700 (PDT)
Received: from ?IPv6:2a02:587:7e0b:5403:d800:75d5:89c1:5d9c? ([2a02:587:7e0b:5403:d800:75d5:89c1:5d9c])
        by smtp.gmail.com with ESMTPSA id o21-20020adfa115000000b0020adea2767csm8944012wro.83.2022.04.28.02.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 02:39:20 -0700 (PDT)
Message-ID: <14ca7a53c11effb4e4f711b0dee60ebf041884b0.camel@gmail.com>
Subject: Re: NTFS3 driver is orphan already. What we do?
From: Leonidas-Panagiotis Papadakos <papadakospan@gmail.com>
Reply-To: CAHk-=wihuvzVTozzNLZT=uFzJH6uM7ZNKN7fYVpm0v2KkY6Jxg@mail.gmail.com
To: torvalds@linux-foundation.org
Cc: almaz.alexandrovich@paragon-software.com, christian.brauner@ubuntu.com, 
 djwong@kernel.org, ebiggers@kernel.org, hch@lst.de, 
 kari.argillander@stargateuniverse.net, linux-kernel@vger.kernel.org, 
 ntfs3@lists.linux.dev, tytso@mit.edu, viro@zeniv.linux.org.uk,
 willy@infradead.org
Date: Thu, 28 Apr 2022 12:38:48 +0300
In-Reply-To: <CAHk-=wihuvzVTozzNLZT=uFzJH6uM7ZNKN7fYVpm0v2KkY6Jxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

If Linux has to avoid having 2 unmaintained drivers, wouldn't it be better =
to
remove the old read-only one from (I think) 2001 and keep Paragon's version=
?
