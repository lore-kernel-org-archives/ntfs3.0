Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30073174CC
	for <ntfs3@lists.linux.dev>; Tue, 11 Jul 2023 08:04:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso59125185e9.3
        for <ntfs3@lists.linux.dev>; Tue, 11 Jul 2023 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689062681; x=1691654681;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MyXTu0GFMpAK+j+CMbl53ijk/xN7GIcHsoEJorLBJ8=;
        b=o7pmjZnd/Dt67RgxkOnp+KxzT4qI9J27s5rOJ4a2WQARwfARaD8JvTtutaS/OdFVc5
         7wPJXJov6KTaKT9HOsyrkIlsRIm3DfxuvhgvCvlbbGpVK+ODsdpE5Pfua+nbJ/8pUz6r
         Ebot5mJmAFo2/hz7ouNzrsmb50u+fuHIWznSZW5/7okMFspxBtEcKhXg3Z/AhBtNvF7C
         UOb8uvn/wHGyMY4uchNDpnmNBg+mtz5fvnbUIGu1F+lP8FYwoiXEwXd8ZN7qJ3Xj3MTC
         zZ+ZhEPehgkEVQM8fYEn8SiNfwpRO9tVkX1VZlaWhuaz0DYGA9wEHjXYi7f3zPcLS/MN
         ZKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689062681; x=1691654681;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MyXTu0GFMpAK+j+CMbl53ijk/xN7GIcHsoEJorLBJ8=;
        b=WaEtN+N6SaN2Z3vnU7gZ8EIJusN6I2RB/GInntltiE2SVSDmTOn1hxyvnSS7jbAO8w
         N0arzsY3HkDwXO8+6kNROhdMIKMhJYg2LBS+k1CQXdjfl+FBcKlPeY8+tuAZ4/7P7VwT
         bujIYl7zsfehMZWIPU8hzMJVG4tjQuMupCr4NcXSjFmhHJ3jSX/AMaK/v27qBepy24dV
         BnkvwXP0BdzVxS3ywGw/3y69FAv2FYuC7FzeVHogSy5AlNI2EB00mxFY6jAOtu9g7k7F
         HFJKJ0q0jp9o9ReeH8NA0gzpnzTW7L3inbvg6yMkcZWQ4jU66ShvTz14ItZK7NWrCn8V
         WFeQ==
X-Gm-Message-State: ABy/qLZV1TxhEoYjbpnviemIYFd9mSthnda6cGl8uBnXrPSwPU6OOBgm
	qHpenllWTQ0MONGv3mqbTVm2fnitbPY=
X-Google-Smtp-Source: APBJJlGdJzRrt7RgvK2atTlBn9QexHXhwEo9puL3O1BUtvSypIu/ZBKCfkCGWc73iO1wzTMEHU72wA==
X-Received: by 2002:a7b:c409:0:b0:3fb:e206:ca5f with SMTP id k9-20020a7bc409000000b003fbe206ca5fmr14025999wmi.31.1689062680473;
        Tue, 11 Jul 2023 01:04:40 -0700 (PDT)
Received: from ?IPV6:2a02:908:1983:ea0::ab3? ([2a02:908:1983:ea0::ab3])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bcb94000000b003fbfea1afffsm1784091wmi.27.2023.07.11.01.04.39
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 01:04:39 -0700 (PDT)
Message-ID: <edcd6eb8-8682-6552-a5f6-584ac103d0e9@gmail.com>
Date: Tue, 11 Jul 2023 10:04:39 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: ntfs3@lists.linux.dev
Content-Language: en-US
From: Julian Sikorski <belegdol@gmail.com>
Subject: ntfs3: Folders mounted with 555 permissions?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

with linux-6.4, now that noacsrules option is gone, an old issue has 
become problematic. When I mount my windows drive, some of the folders 
in Users are mounted with 555 permissions, including the ones I would 
like to edit:

$ ls -l /mnt/windows/ | grep Users
lrwxrwxrwx. 1 julas julas          8  1. Dez 2018  Documents and 
Settings -> ./Users
lrwxrwxrwx. 1 julas julas          8  9. Okt 2022  Dokumente und 
Einstellungen -> ./Users
dr-xr-xr-x. 1 julas julas       4096  9. Okt 2022  Users

$ ls -l /mnt/windows/Users/beleg/ | grep Documents
dr-xr-xr-x. 1 julas julas    8192  7. Jul 15:28 Documents
lrwxrwxrwx. 1 julas julas      24  9. Okt 2022  Eigene Dateien -> 
./../../Users/beleg/Documents
lrwxrwxrwx. 1 julas julas      24  1. Nov 2021  Moje dokumenty -> 
./../../Users/beleg/Documents

Is this intended behaviour? It appears to be quite an old issue [1]. If 
so, is there any other fix than running a recursive chmod?

Best regards,
Julian

[1] 
https://www.reddit.com/r/archlinux/comments/r325t3/permissions_problems_with_the_new_ntfs3_driver/
