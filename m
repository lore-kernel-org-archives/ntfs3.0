Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F4A10F2
	for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMUBf7ZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A681C433C7
	for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705318904;
	bh=AF4YEywEnYTlM03/Plpih4Pbca1bnQhXFsGI2ay5Fuk=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=aMUBf7ZMLDqZof18KXDBvK0s9WPm0D3E0ghUDuhizxd/BfOFxeWWCYrFeIFLfhO07
	 TyJLWgVhUOiupwm8vrR2Xa+HtKMSvvXmlamxDRmJLhaPKVyVaXbWeyJYjfafi/ryqK
	 shaN3tt79fcyW+84brxDufj4SMsudH0HnrzOKd95eZ8wsEfAdgvMUwpB5Yu59HmIHJ
	 pBuzWZSD9LsfsVcPA8YesVAX0SMPRu0D7rSDDVcwWJcF4QEzHnmmWmVvaj4ZlPhkQc
	 S81ph6gsBqHCYVzXm/v8h0xmAZHsw5OjyB4jca4yqVQPOm3GBz5Ixa+f9oBQlsDjtR
	 HnrNpN50UNy/A==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dde1f23060so3636277a34.2
        for <ntfs3@lists.linux.dev>; Mon, 15 Jan 2024 03:41:44 -0800 (PST)
X-Gm-Message-State: AOJu0YwPRdTZ8ynhRJhREHWHqpOVb5A0FePYd4oSW/hVmU44DOKhNll5
	4S/ikfti1wvcJxT8yF6ZkTnl1dVfb5TD9FU9RNs=
X-Google-Smtp-Source: AGHT+IEiRvxaR4ohvrGlVCarDoYEKSzqvASl5lVVjyuCUD5DqyMcukKlIlo9mROvXDrjf0Cv5m4OrTNrTzpKDP/Osy8=
X-Received: by 2002:a05:6870:ef84:b0:206:aca2:efae with SMTP id
 qr4-20020a056870ef8400b00206aca2efaemr5224717oab.118.1705318903363; Mon, 15
 Jan 2024 03:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:668c:0:b0:513:2a06:84a8 with HTTP; Mon, 15 Jan 2024
 03:41:42 -0800 (PST)
In-Reply-To: <8a5d4fcb-f6dc-4c7e-a26c-0b0e91430104@tuxera.com>
References: <20240115072025.2071931-1-willy@infradead.org> <8a5d4fcb-f6dc-4c7e-a26c-0b0e91430104@tuxera.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 15 Jan 2024 20:41:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9VcORULpRUGpBYpZKc=GTV4vOAvv-B-rVVxfbz-y1TOQ@mail.gmail.com>
Message-ID: <CAKYAXd9VcORULpRUGpBYpZKc=GTV4vOAvv-B-rVVxfbz-y1TOQ@mail.gmail.com>
Subject: Re: [PATCH] fs: Remove NTFS classic
To: Anton Altaparmakov <anton@tuxera.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
	ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2024-01-15 20:00 GMT+09:00, Anton Altaparmakov <anton@tuxera.com>:
> Hi Matthew,
>
> On 15/01/2024 07:20, Matthew Wilcox (Oracle) wrote:
>> The replacement, NTFS3, was merged over two years ago.  It is now time to
>> remove the original from the tree as it is the last user of several APIs,
>> and it is not worth changing.
>
> It was my impression that people are complaining ntfs3 is causing a
> whole lot of problems including corrupting people's data.  Also, it
> appears the maintainer has basically disappeared after it got merged.
What can replace this is not only ntfs3 but also ntfs3g. I think
read-only ntfs is obsolete.
I am in favor of remove it.

Acked-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks.
>
> Is it really such a good idea to remove the original ntfs driver which
> actually works fine and does not cause any problems when the replacement
> is so poor and unmaintained?
>
> Also, which APIs are you referring to?  I can take a look into those.
>
> Best regards,
>
> 	Anton
> --
> Anton Altaparmakov <anton at tuxera.com> (replace at with @)
> Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
> Linux NTFS maintainer
>
