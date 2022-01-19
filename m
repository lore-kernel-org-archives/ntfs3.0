Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE902CA3
	for <ntfs3@lists.linux.dev>; Wed, 19 Jan 2022 13:27:06 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id e8so2124492ilm.13
        for <ntfs3@lists.linux.dev>; Wed, 19 Jan 2022 05:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bOtjTSupMPdLeWMiVKrD7jaORGYKT+sk6BwRJT6YH5k=;
        b=7BEfqJqRzXAE088B+2bHOpvIL0UUVYOZUvHjaUycgtIQCZS6qJSTGhtIwa1Xa6EPfk
         oV2YXPGcxgiVF5LaQHluLKvgATLLAeZKgM3nn6DNYQRh6ifI6cdJPU7ZNOAzZ5g1fFkO
         MWYcErn30fkxjWY45t9Yboy2jcExTsCrzys7xQCWMUAHOZ2PvIOKEUon3RlzTMdRHOFW
         W8Ams8MdRsSgkRcx2W8R30267oa8zRJAWTCRB6MNRYIPNawBrTjM+yr6IoXc6oDoeZjs
         ao5paPXCdk//Rx9HxN4miEoGhchTg9VDu7RK7HyILmak+tgC3BqPCX5DU7MxKWRj66d8
         cjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bOtjTSupMPdLeWMiVKrD7jaORGYKT+sk6BwRJT6YH5k=;
        b=IVA50KQzxFYyMVVuldMIEf5Qk/x7MX2Gq1+GpMHj1QDVLDg54OJ8VDuVj79JadbDYj
         EivgNIAObTuWHEMJhDTlsjiEbLlouTgJD+oD6FAxfs8PeIllOE64Mq7gLkg5fO5Sghdm
         MuJN5VjYubZCqM4suI4vG3V7XbqyiCFqUB0skyvWXvDJoYaAmOFcvb9t0qoAZZAdGDkP
         AzMzn5mmvN8IDmJWmfhfrSG8axhxrjaM4qpBzAVtofJvWbbCW/F/vWbop3Os9t3J/8Xp
         tKix6nNyzT9eq3GR9ThfVQ2AFEJpWOFUHx9Xf3YHOEj4qkcVVnV8MZFuEMacF4j/E4xF
         9C/Q==
X-Gm-Message-State: AOAM533clMmOsRSIN/qY2UsiJzJ6RI5eVHXVI+7gXG/j3TZsySlRvuAi
	HD6iNx7aW5gMhl/iyHoiwgZPsg==
X-Google-Smtp-Source: ABdhPJy/gK+ACUkzeActiCIlSLAxm2cSY3hrzhU1AqADv9+8T7xomkwrCDZtFgg9hB/5uCyhH7Qi5A==
X-Received: by 2002:a05:6e02:144a:: with SMTP id p10mr9326688ilo.152.1642598825847;
        Wed, 19 Jan 2022 05:27:05 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id c7sm4569815ioi.18.2022.01.19.05.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 05:27:05 -0800 (PST)
Subject: Re: improve the bio allocation interface
To: Christoph Hellwig <hch@lst.de>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Mike Snitzer
 <snitzer@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang
 <jinpu.wang@ionos.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.co>, Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, xen-devel@lists.xenproject.org,
 drbd-dev@lists.linbit.com
References: <20220118071952.1243143-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2b9aedb6-4531-91fe-3493-133470ebee80@kernel.dk>
Date: Wed, 19 Jan 2022 06:27:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/18/22 12:19 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series is posted early because it has wide-ranging changes and
> could use some early ACKs before -rc1.
> 
> It changes the interface to the bio allocators to always pass a
> block_device and the operation, which is information needed for every
> bio submitted through bio_submit.  This means the fields can be
> directly initialized in bio_init instead of first being zeroed and
> thus should help to micro-optimize even better than the __bio_set_dev
> that Pavel proposed while also cleaning up code.

Looks pretty straight forward from the block core point of view. Didn't
look too closely at the fs/driver changes yet.

-- 
Jens Axboe

