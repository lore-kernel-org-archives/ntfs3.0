Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8502597
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:41:34 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bp11so3854569wrb.9
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLGq1+RUh3PrwecWDEEn4QoJ194t8Cm1swty2LFq2C0=;
        b=JHS1k+yRHEfegsCk2bQWqkr0ojnsmKytgZC8U/sabwKebvTBzbN6Cm3f9PcQGcBFhk
         jBvLVYtkTRr5qN+mirsCx9Xor2iap608amHqsGICh6ZfvwOZTSbl62w/OiJ5mAhqPLvV
         dynrMl1X+LXDW/kAaq+QvqkCiHds9G5kRpLJYr4hSzEhuigX280E0qtEEZQILa1weysp
         KWqcdSxKG0+UBORmRS+V2GV3zGWSI2I3vc5jloGIV9D1rfFZk+3Y5lN7H1WtZqIsf/14
         pI1ypXwfqMua7IH8NlVXYP2f1Bo00LROwoHrPEvD8jyFchi9EFNmB+vzcW6cduuOC67O
         /zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLGq1+RUh3PrwecWDEEn4QoJ194t8Cm1swty2LFq2C0=;
        b=J1ONgiOJUbhZFPRk+Y2VRxDF+rumJdZbQ2M5e6nue4CTX3QgpIc3ybh0mvNOmSKu2p
         p7UnwDPgFk9JX+OTGOwV4HjUtYXcmK4+5wndGcohFKRzzm+dujuorECndTQz9EAM6BHM
         +sSgis0jf7oPbLptrCuswDRA8rO4SK6xMxV7hvRuxxhuE8Dxa05AJOR7QdeIb6eUYsnM
         ZO9fDzKNnp9FnkocMkdpO4XOSsUpa4SchHnEVx8qswjfXM1FWITQLYUI4kM2UELKJSgJ
         MSvIuJ5QXVmfERSuOZKp/+M2TQP7jVnafti4QvDnOISJK0Ze4iytGq98y5bg8MvBiWQr
         u5kQ==
X-Gm-Message-State: ACrzQf3daEFLDU5HeOnKnkY2sTfcmtJOty4sJQCL+eU/7JhpKtSIBVqR
	afElxtHEa1l4y/JpnOxPuH8=
X-Google-Smtp-Source: AMsMyM5K65zbs1EdcjECCJ/+eItaJRr8U3ut88gE6prPBUkeB04tcwlWuTZOJqrthm3uKRj3hZyt0w==
X-Received: by 2002:adf:ec83:0:b0:22e:51e2:7fc7 with SMTP id z3-20020adfec83000000b0022e51e27fc7mr10832677wrn.229.1665402093059;
        Mon, 10 Oct 2022 04:41:33 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id j39-20020a05600c48a700b003a5537bb2besm9647924wmp.25.2022.10.10.04.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:41:32 -0700 (PDT)
Message-ID: <c9b467dd-9294-232b-b808-48f62c3c2186@gmail.com>
Date: Mon, 10 Oct 2022 12:41:31 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: pt-PT
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Daniel Pinto <danielpinto52@gmail.com>
Subject: [PATCH v2 0/2] fs/ntfs3: Add system.ntfs_attrib_be extended attribute
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Changes v1->v2:
- Add documentation for the system.ntfs_attrib_be extended attribute

Improves compatibility with NTFS-3G by adding the system.ntfs_attrib_be
extended attribute.

Daniel Pinto (2):
  fs/ntfs3: add system.ntfs_attrib_be extended attribute
  fs/ntfs3: document system.ntfs_attrib_be extended attribute

 Documentation/filesystems/ntfs3.rst |  5 +++++
 fs/ntfs3/xattr.c                    | 20 ++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)
