Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF127E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:34:09 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r13so16559112wrj.11
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeL0o0yVihRehcTsidItMwxwi4VSKF8819s3pNgUkoA=;
        b=bJkgt8XBMOYlvYMRd60SqsD5SsRRa2mD22nqQul7gLCyl3sVtJGeJak1zQE8e3Q5H/
         PMxmIeeit7bbDDmaasHyMKxQZPJ9NKiT2JVaaudImql6n0GSX98F35GMJt4q0ydiW0TA
         txD86vwQ4TRMmumInbvulZ+h0TjgEF270O6YZDGxhIH/yQCoL69sgNtp60v+dBFiYdtt
         7CuNjbJdSV/41sveFiN1ZfAM9M//seU6iBDwSx/0pH/QkPr8NDVcw9ZKloJ7NYxs3QQc
         2BgWyytVHjFQ6u9KC4jd6FBTGRS2lEpquLHkHEyMNl571mVNiEAq/yHSCvHohXGPvfbr
         wJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeL0o0yVihRehcTsidItMwxwi4VSKF8819s3pNgUkoA=;
        b=mtlHPxO6AQJesOXCsQ3MuZZOGJ7wFOz3mtrg5XLl17d0KLaGpk+RUy/u8Pttcptiht
         G+xdzb3149dS2WcjR+gQr2r6+NXsFiLOQMT2md/xfHa9fipD6/qThh6m+qKbcm8yPf2x
         Zb0Sra4irS5SLr1zNU9iWoLU1cokgUNsC4lUXO78SODnTT9GXwloG0Fi2hwbqVSowmMl
         u8mdkXTjg9KBircPgCPWqXJk/k7wNh9jfAUg4Obm01Cd85/dMI8nYTN4Ax/l6An9AFM4
         UitcUijV9Q1BlxvAutCUeAqpTqNIcz8K7QAYJBZOqvjPu/6tyO8dBl2b7BY8K/Bsw7/Z
         1GIQ==
X-Gm-Message-State: ACrzQf0CEfm2jS/4aqmkAYXbe3L5tFEBF/seBTFHdmWYZdd08c7FZBYK
	6UmSQ/6kCUOmmcW1zpqeyMo=
X-Google-Smtp-Source: AMsMyM6tGY6fRMNDLA/tSbtiGWuEd/ro4K+ih7XhEt3DRhNSFFITKmTKqGjonek1rDh8nRYdI/DpjQ==
X-Received: by 2002:a5d:490c:0:b0:22e:6545:996e with SMTP id x12-20020a5d490c000000b0022e6545996emr10729516wrq.523.1665401647825;
        Mon, 10 Oct 2022 04:34:07 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4305000000b0022ac1be009esm8680012wrq.16.2022.10.10.04.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:34:07 -0700 (PDT)
Message-ID: <d9a3544f-fa02-e232-f1f1-4317138a245b@gmail.com>
Date: Mon, 10 Oct 2022 12:34:06 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 3/5] fs/ntfs3: add hidedotfiles to the list of enabled
 mount options
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
In-Reply-To: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently, the ntfs3 driver does return the hidedotfiles mount
option in the list of enabled mount options. This can confuse
users who may doubt they enabled the option when not seeing in
the list provided by the mount command.

Add hidedotfiles mount option to the list of enabled options
provided by the mount command when it is enabled.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 fs/ntfs3/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index c6fd2afde172..d796541e2a67 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -561,6 +561,8 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 		seq_puts(m, ",showmeta");
 	if (opts->nohidden)
 		seq_puts(m, ",nohidden");
+	if (opts->hide_dot_files)
+		seq_puts(m, ",hidedotfiles");
 	if (opts->force)
 		seq_puts(m, ",force");
 	if (opts->noacsrules)
