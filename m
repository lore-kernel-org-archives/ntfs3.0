Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70072C8E
	for <ntfs3@lists.linux.dev>; Wed,  6 Oct 2021 17:03:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j8so10859688wro.7
        for <ntfs3@lists.linux.dev>; Wed, 06 Oct 2021 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LN25yctqZqPI0kkxMtneqX2Fancu2gOVKtVhNmtpktI=;
        b=Ng9ld8juH6QNUrVjwHBKQsTy2bXqewIqg496+F7bXOOBJhAJBV/9HR4iTVBf0h/+82
         4JqMJhO6/eg+SCcSsv7VifYJLCzQJUNNyWgyltX2yB77CqN1w3eDh5n0KAGIR8YqQIHN
         K6UX8GFbAvPC3y9qKl3IgDS9xN5a0zcDD7C4ZqSTC4PxcL7/94CDGYE1xp9GMB3aSBNM
         r/Zm/HqpN6tRP5ivXhGOaqRPr2u/l9VPpx9VVVw3mTQHwq0S/vmvIUPgmwy6nF1Db9/I
         KbWRbCGwTQLxtMr6HGrGjeiyj3oV/9Eo6rD5ZS/Fny1rCyUG2eapMR/1cx98dtv8FAIs
         /hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LN25yctqZqPI0kkxMtneqX2Fancu2gOVKtVhNmtpktI=;
        b=nId3kmqluIQQ9UsT4DUdS6yNVNBFxjc5WtA/zYE/URz4EPRsXndUlsHaRS+l53DQcH
         QDbAccOGgyNyZVauz/Usfk0zRBMmupi5uA6g+B0cQfxP2nP49NVgpOeMRugWhv9aemMx
         uP46qWHxJNWFOf7YwBJaME7WNfsvgxWfmHJjDfK5GHSqlI6HpUTwig8VkVAXGHr3bl7B
         snU9m7w6q4Jeqpa6fQmA7gbmykuUXLnU97yu/mAfCNMJFibv1ud8NhRoKEI+sLCh4rs9
         HcOx45Ohu9ZJNr3Zc9G43BhIH+82X3uRTz9MbNR9PYD9zFwQiH50whpayduWE8JqRxnl
         dDDg==
X-Gm-Message-State: AOAM530Z2vRbT/gRp3b8q/t1oszmX88kjxV+bbBbNpZ0JSH3TW9Asa1X
	LBP8BNLz1XD+VPOSJDYiKXw=
X-Google-Smtp-Source: ABdhPJxBaEuw/nWDMd/1wL+aOG79CqBfHPcrzYmZdQfRLzCsrYXd7NbCKsB6hYZbIqmoGJqnofF/XQ==
X-Received: by 2002:adf:a390:: with SMTP id l16mr7894504wrb.291.1633539831107;
        Wed, 06 Oct 2021 10:03:51 -0700 (PDT)
Received: from ?IPV6:2a02:8010:64ea:0:fad1:11ff:fead:57db? ([2a02:8010:64ea:0:fad1:11ff:fead:57db])
        by smtp.googlemail.com with UTF8SMTPSA id s13sm20701767wrv.97.2021.10.06.10.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:03:50 -0700 (PDT)
Sender: Mark Harmstone <mark.harmstone@gmail.com>
Message-ID: <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
Date: Wed, 6 Oct 2021 18:03:49 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Kari Argillander <kari.argillander@gmail.com>
Cc: ntfs3@lists.linux.dev
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
 <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
From: Mark Harmstone <mark@harmstone.com>
In-Reply-To: <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/21 15:37, Konstantin Komarov wrote:
 > So it's expected for `ls WINDOWS` to fail.

I'm confused. If this deliberate, why does cmp_fnames pass the upcase pointer
to ntfs_cmp_names_cpu? Or for that matter, why do you bother loading the
upcase block at all?

 > The same behavior you can see in
 > CreateFileA function with FILE_FLAG_POSIX_SEMANTICS [1]
 > or in NtSetInformationFile function with FileCaseSensitiveInformation [2].

Two different things. AIUI, FILE_FLAG_POSIX_SEMANTICS passes the
SL_CASE_SENSITIVE flag through to the FS driver's IRP_MJ_CREATE function, doing
a case-sensitive lookup on what would otherwise be a normal directory. The
FileCaseSensitiveInformation flag is set on the inode and forces Windows 10 to
always do case-sensitive lookups for that directory (i.e. it's the inverse of
ext4's casefolding flag).

This issue came to my attention because I've been doing a lot of research into
NTFS recently, and want to add FileCaseSensitiveInformation support to your
driver. But obviously this issue is a blocker for that.

 > We must always compare filenames with bothcase == true.

You *really* need to rename this variable, it makes no sense at it is. As I
said, as far as I can make out it means "assume that one of the strings is
already uppercase".

 > There will be patch to fix this situation.

Not to be funny, but I've already provided you with one... You'll drive away
potential contributors if you ignore their patches without a good reason.
