Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19DAA4C
	for <ntfs3@lists.linux.dev>; Fri,  7 Oct 2022 12:32:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso4513576wmq.4
        for <ntfs3@lists.linux.dev>; Fri, 07 Oct 2022 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWxMysi2/3NJWXxgKPp/Nbbb+bbU2AmdShH4qAYKTNU=;
        b=GBk+e/ZbyR9pyYD92T8WZXqcfpv0AYJdivhb9bP37beyU5deYRHWOSvZJoKxHKA+w8
         +8kefxZBKK0EQSlqogTLCVSEvETxznxQ474tJsi7StHDRe0QuTBBGeI3jMppQ3ZkD0d4
         2380BcgpJ5qv4Eg2jEYcaE0ZprVNQXqH74zbYgxtpqdNOSQcy0/OAH2Nym8/R7aswuGr
         BysKs9S6+Y9ctd/PwvikDg+tUUktftVA6UiKFHi8KTlCVblgdYYLeEcAH+zW7unrRo8h
         M7sbz+8uNkbrjyaFoGxzhmDpLfOXf2QM/VScVHM7wmklUDnlni08keP0sXTR+XuNK5vE
         xKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWxMysi2/3NJWXxgKPp/Nbbb+bbU2AmdShH4qAYKTNU=;
        b=0pchIvo+N4sxuh9IOkXD5Igl2QB95qm74TOSvnFBMudmCFW0GfQBFz27aCnhe4LFFW
         k0edRWSIggq7uqF0jn6kfzrX4TFjahDoIsdsbL1S93VSlrxbGTKBLC6RexpoD5SzPIu1
         oLEVBbiD0kTvmSCim3fEptllwMpGJLiBGv3asDWqmmxU1P9g1/qumF0lj0uaknaw1Un4
         wV6fcWQeSg+aWDhW12pZcZUppARPkTve3WdAoC0dgiiJkc8SH+Pt3N+FPoIpCPvS0Fp0
         GpZrA9HbHyfGV+2T+ZeassLbXY9r372zcvkLrbsMZWS/4KHTbhD3TSr7FM5sbYCGEAGA
         O+xg==
X-Gm-Message-State: ACrzQf1stub4RuviuAGmyZCch5LxBIEbvnsijKMgCvJjlFfW5HCbCK9b
	/C8+VLHSUVUosdJS8Ciwb9c=
X-Google-Smtp-Source: AMsMyM40/cmUUKJSQhA9fKALLFjxRz2K05UOQV4IUgHzZ06EpuiOTvvXYNAbMOwT4laroryKKHnWtQ==
X-Received: by 2002:a05:600c:3483:b0:3b4:99f4:1191 with SMTP id a3-20020a05600c348300b003b499f41191mr3000557wmq.147.1665145943067;
        Fri, 07 Oct 2022 05:32:23 -0700 (PDT)
Received: from [192.168.42.102] (mo-217-129-7-245.netvisao.pt. [217.129.7.245])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c154b00b003a3442f1229sm9002422wmg.29.2022.10.07.05.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:32:22 -0700 (PDT)
Message-ID: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
Date: Fri, 7 Oct 2022 13:32:21 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Daniel Pinto <danielpinto52@gmail.com>
Subject: [PATCH 0/4] fs/ntfs3: Fix and rename hidedotfiles mount option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The current implementation of the hidedotfiles has some problems, namely:
 - there is a bug where enabling it actually disables it and vice versa
 - it only works when creating files, not when moving or renaming them
 - is is not listed in the enabled options list by the mount command
 - its name differs from the equivalent hide_dot_files mount option
   used by NTFS-3G, making it incompatible with it for no reason

This series of patches tries to fix those problems.

Daniel Pinto (4):
  fs/ntfs3: fix hidedotfiles mount option by reversing behaviour
  fs/ntfs3: make hidedotfiles mount option work when renaming files
  fs/ntfs3: add hidedotfiles to the list of enabled mount options
  fs/ntfs3: rename hidedotfiles mount option to hide_dot_files

 fs/ntfs3/frecord.c | 9 +++++++++
 fs/ntfs3/inode.c   | 2 +-
 fs/ntfs3/super.c   | 6 ++++--
 3 files changed, 14 insertions(+), 3 deletions(-)
