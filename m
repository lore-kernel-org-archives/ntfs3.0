Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128E442A
	for <ntfs3@lists.linux.dev>; Tue,  4 Oct 2022 21:22:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o5so9710157wms.1
        for <ntfs3@lists.linux.dev>; Tue, 04 Oct 2022 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=MBeztxG+T/+sAKzXrApPY5wTqy2P03wfdxdSIiSCo6s=;
        b=gUoVGj4t2QziOa7am2zum1d+q/o6w56i6RIUOdKZOFcWYEYFYGtZoT4ney6oh7RFa7
         HadQ7shyyVEYW4peoJSatplGdR/jPdlwnbIpOnrpnVdUwb5Vb4w8NKmujuac8Z0pKdZC
         6LBUu6pYTZlQa9LXF42bCFfp/zWW9oyhXDZ0DR8wLyA11aVJcgtwybK9uN75Pyk+Cr2m
         YstJ0lsz07uYbQK5J5qXx+q1xNYa4GFz7JVs8tJL9/aMx5dXo+ujNJ610qSbF5VNgWWu
         5y5gJbzI2a4wwm+IwiS/uY4u8jzhSIejlJTOrE9y5mFgNlpww8vFq59hTbEgCHZFVkZ2
         J/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=MBeztxG+T/+sAKzXrApPY5wTqy2P03wfdxdSIiSCo6s=;
        b=04PR5FX0rsa1AqgJWFuhXdJEfJxe1FJq+1vp9qPOosYEZCV8rkr6bKjoW5/lETmhlc
         SpmpCD5LkUm06N8AyzWshCaqqEzjWEiTtoGcwhQaIM0Ks+yF4EgTikp5byeFaPjLZoMa
         dZAipkVMj+a/V15T3IR2Fto/vh0LE00l6rVy+olMjCUSey0O3/owfgV6Y1UEuX0CZaUG
         h4gkrbpRvePZpwhBsU5EV1Fg3GCo7ohqbzOeD46epAKVmDL1SVdMM27sWR3sjX8LdiGO
         goMZLFz/FX57+yKCmlHI2ODcArmh3ujxiattLyjlQ2yOslPksy0xUmGPKg/yrT2W90U0
         2GbA==
X-Gm-Message-State: ACrzQf0dJXvrq/wU49j5Yql4EaK7A6rgOgewotdmMNdW3bbj3YYhzCLB
	UZhrVCaiiJmxw9+i4aF7BLmAtErk5TA4BxH/
X-Google-Smtp-Source: AMsMyM5P+HUH+oZADCDQokwKaZT14vAK7fJPP+tWkbvXiLAH3BnGR+omUTm/5JgfKxek5Lrtj2l49A==
X-Received: by 2002:a05:600c:5022:b0:3be:ed8:9a25 with SMTP id n34-20020a05600c502200b003be0ed89a25mr1053128wmr.194.1664918556279;
        Tue, 04 Oct 2022 14:22:36 -0700 (PDT)
Received: from [192.168.0.210] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id q18-20020a056000137200b0022cc7c32309sm13485044wrz.115.2022.10.04.14.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 14:22:35 -0700 (PDT)
Message-ID: <5799ca65-df15-274b-3319-984f5e1f0fd3@gmail.com>
Date: Tue, 4 Oct 2022 22:22:34 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: fs/ntfs3: Add option "nocase"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Static analysis with clang scan build has detected an issue in the 
following commit:

commit a3a956c78efaa202b1d75190136671cf6e87bfbe
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Sep 23 12:42:18 2022 +0300

     fs/ntfs3: Add option "nocase"


The issue is as follows in fs/ntfs3/index.c in function ntfs_d_compare:

         /* First try fast implementation. */
         for (;;) {
                 if (!lm--) {
                         ret = len1 == len2 ? 0 : 1;
                         goto out;
                 }

                 if ((c1 = *n1++) == (c2 = *n2++))
                         continue;

                 if (c1 >= 0x80 || c2 >= 0x80)
                         break;

                 if (toupper(c1) != toupper(c2)) {
                         ret = 1;
                         goto out;
                 }
         }

...
...

out:
         __putname(uni1);
         return ret;
}

The exits in the for-loop via label out are ending up with __putname() 
being called on an uninitialized uni1 pointer.

Colin

