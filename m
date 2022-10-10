Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B97E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:27:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a3so16612776wrt.0
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eORThfCwUva1cFHbc3EqKdmKtUPJThTOAvohfNEg30=;
        b=ovGmz7VJJ+z7JTTJax93xxaTI4YfHUkE2wpeLYGcXX4TZvsZrlEAl/mJHQc04yIDVF
         TTfQEXK7RMysAuu+gi4gDfxceMP4o8Xgn3xm3F3Q9HYLHs2Twp03dmNJ3QyLsEO3+Hod
         hnGWvrs8BdpQ5XJTnptYYUykKLfzLukZ0nnLf8PAww+eYudr7+Z+29xNt39zaAO1WfGa
         uBuAYTTHfwff4bMsp6E9jYaYOt8q7P/CEtCvdlsRrp9wWa/Jbry+Q77EcG0lhm8aYrAX
         grBQ2LEj6gjmf1c7vSL0PPXpi50EfxY9Gr8kEcQECzn3STG92miJqbjvor/5KAj84ggz
         mluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4eORThfCwUva1cFHbc3EqKdmKtUPJThTOAvohfNEg30=;
        b=g42dWeW+16Ph/o1VS+JnuVk+mT4yBuGfeEns/H5cxtKwcbGsTIiJ4+pXTbHQGyZSkK
         GbN+O9Rcrp/lNm6hkCtVIuibqrAa/BUJm8NMgoe9ySaLKCcp/oITMCtG0JS3smxVL//c
         KgebMZp8mKatTHuKRYn3NqxeAuJjODfM6nhzeT6h043BR81vyiVd8OVvt/M3/van+QcE
         dqYfGoU60tM5AIJzkJK2IQSVRQkdrTRvYkWOPaZ1fP/5mC44FHL/+xmwEmpvc80vYK6H
         Qw4zIp9xnrcGBbbg2gfxgM8zk8+ewsvvNweIEAFLdw7jwq/o38TfANa4BiMKWSo3+/dF
         crmA==
X-Gm-Message-State: ACrzQf2M+WCAm/Lqz4vRiiyzW5Fp7KvpA0P3gSZZuIDt6jdlkGIjK85/
	zCj+fUlnMEsqVLqEAfTqDIw=
X-Google-Smtp-Source: AMsMyM74gcdhxOtXcR0YLV610oaQuaVu4aBmNKfscThPQIuYcqLbOgq/Dfg3UacTLuQemQD75kDEjg==
X-Received: by 2002:a5d:6da2:0:b0:22e:42ff:2f8 with SMTP id u2-20020a5d6da2000000b0022e42ff02f8mr10934771wrs.269.1665401239675;
        Mon, 10 Oct 2022 04:27:19 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c22c300b003b476cabf1csm240298wmg.26.2022.10.10.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:27:19 -0700 (PDT)
Message-ID: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Date: Mon, 10 Oct 2022 12:27:18 +0100
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
Subject: [PATCH v2 0/5] fs/ntfs3: Fix and rename hidedotfiles mount option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Changes v1->v2:
- Add documentation for hidedotfiles mount option.

The current implementation of the hidedotfiles has some problems, namely:
- there is a bug where enabling it actually disables it and vice versa
- it only works when creating files, not when moving or renaming them
- it is not listed in the enabled options list by the mount command
- its name differs from the equivalent hide_dot_files mount option
  used by NTFS-3G, making it incompatible with it for no reason

This series of patches tries to fix those problems.

Daniel Pinto (5):
  fs/ntfs3: fix hidedotfiles mount option by reversing behaviour
  fs/ntfs3: make hidedotfiles mount option work when renaming files
  fs/ntfs3: add hidedotfiles to the list of enabled mount options
  fs/ntfs3: document the hidedotfiles mount option
  fs/ntfs3: rename hidedotfiles mount option to hide_dot_files

 Documentation/filesystems/ntfs3.rst | 6 ++++++
 fs/ntfs3/frecord.c                  | 9 +++++++++
 fs/ntfs3/inode.c                    | 2 +-
 fs/ntfs3/super.c                    | 6 ++++--
 4 files changed, 20 insertions(+), 3 deletions(-)
