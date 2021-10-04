Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9897E3FC9
	for <ntfs3@lists.linux.dev>; Mon,  4 Oct 2021 18:25:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id j27so14193405wms.0
        for <ntfs3@lists.linux.dev>; Mon, 04 Oct 2021 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Tf2JDbnUKLvA2+hi+yFbjMF+eKPKl0BTOnv3TI38vKE=;
        b=EgBmG7mgbMocr10jcanAwDUTTXLbVCd0PreT2sK48Z1oCHDq6AldvAqD2vnuVaJ+Vo
         U1INh3i7m1+Dhoomq+u9FWmCPqjEUYQ84u4Ix0Skvj4vag12veGRO6HVytu6jhGztBd7
         Z3wd1EDn1WxrRhs9cIxIGPApZDaAcEpp1iQ7xSCcVTNRKMpO1240y5cgyW+rWIo6yny0
         BmDsAsbQq0m8wQd7nyFFO1Itq6slb5KS1AftA/p1ZsJHZPnjSQaPbIIKRa79QtbAQpo4
         794zG0VKO50Fuw2uCjk4j+NgqzcY2NshbY3lVZai7zRhbTcqblK0VKNW920iyXvbkN8h
         8KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Tf2JDbnUKLvA2+hi+yFbjMF+eKPKl0BTOnv3TI38vKE=;
        b=QQv+vXbr6QXkUNfme8YCGWKZ/n/OKwOoeOfJt9ACh2j/NhK4yGcBhZmBtPVxAXePZC
         Ze5Hb3HwgMURx3IExk1t8EuQhtB9ag7LKvxs5PDzw8+DaakSBw2+b3rtcmlFtMinBOu9
         UXfeQt8vflr4cTJhFPj9kYQTCBcuyE/cbeT2ih0PI8jG5yLz2kbDAyJlsMvwahoR19i+
         puuenGGVSj2YutTWLMo6LMGP9wqOntkIl8qM1CN1uXzgVDXKCH+dsxr/uyXXVB7Pw6cJ
         jMvRyZ9W6UMzlNzotM0/5v1g7Jg/9G6wmvdep3wDBgshZOH5Hm8yMgPq/t0ykBxc2oeX
         OYQg==
X-Gm-Message-State: AOAM532N2rqN1FB47dC8614rR5eOFym8/o1IVhhIaTkKrUP0VwtT1WKs
	/YH+x4KSU/B/txXrs3Q9J5I=
X-Google-Smtp-Source: ABdhPJwBLMF+hhJcsVj8LpJeoUJ9Ar+GCwi5lP25fHeM7sjbpe36RQWi+8wLEfKT/QIky+L94zS3VQ==
X-Received: by 2002:a05:600c:510a:: with SMTP id o10mr20074382wms.81.1633371935813;
        Mon, 04 Oct 2021 11:25:35 -0700 (PDT)
Received: from ?IPV6:2a02:8010:64ea:0:fad1:11ff:fead:57db? ([2a02:8010:64ea:0:fad1:11ff:fead:57db])
        by smtp.googlemail.com with UTF8SMTPSA id r27sm14952640wrr.70.2021.10.04.11.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 11:25:35 -0700 (PDT)
Sender: Mark Harmstone <mark.harmstone@gmail.com>
Message-ID: <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
Date: Mon, 4 Oct 2021 19:25:34 +0100
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
From: Mark Harmstone <mark@harmstone.com>
To: Kari Argillander <kari.argillander@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
In-Reply-To: <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Kari, Konstantin, what's your conclusion on this? Do you agree that
case-insensitivity is broken at present, or is there something screwy
going on with my set-up?

Mark
