Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8E7E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:11:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso8327688wma.1
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g284Hwqas55uYSjGq3vvwN/bg9BNQaBmJr08O4Ly1GQ=;
        b=JMrM3DbAJpoWMS1inM2jvCxgnU7FfTrVT/1e7BBsGNQQamCIHKRvYy4dHvGNktfU7O
         +UhmiCq3mmKc15EGXxTZqQlhYtBO9+Ye1INyeUKOmZD0j0OdAXG61kon9s/MUSADeQOj
         2aoMHLlmXVMPi5ArvgJLNmctSUy0eCqaOsmC8Jdz/NndeaBL7dqPT7ikydXC3uLkS1Fd
         Zhu4l+qabqSRl/jVbUx6KuiHLmIHqmTJ0hy//hFb1dvm7pRjXrap+Q0WKDOn29ZyV//W
         26sOHMQdwEFJ2f79fKddOx0xtZ564VoT4jwnaDRNnSw7Qj9V6cD6ge1mJFyCDfFZXEkh
         +gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g284Hwqas55uYSjGq3vvwN/bg9BNQaBmJr08O4Ly1GQ=;
        b=hz36DTKU8Wm2mVp3/cyEtXzVuI1jpOu3Q752/twrmDKBklzVuNqqlaitT3mWR6P775
         EYCCBkkCqNUIPouVBQ+onjx1KFJH0jQ1byKnSAgkOgzdp510YDTL09CVjAK6qwXW+7pA
         wVNDOqG9Zx1CbmXNrxdaBEsZ+Q1SdgQVEhcacsqPZCKo8AySnxi+cLYhPDMyV6IUHK5M
         yOZBL4Ylo20S9BvGEQvdtjyHQaLfkjJjRgP6boIpmpCGvVevPdSN0RpSBxp6ZTB94qMt
         fh+cb9bQKG/UguLf0Z9IxqnWumXAk0aPsUt0+zKe28Thhi/YiY7isb2z8Qz3pzOcpQLT
         RNpA==
X-Gm-Message-State: ACrzQf1TgrgrNLKtbbne+6Toz8a/VXcO52rlJa/K5ClwNDrjWVEfwx84
	B6viqO2+SMOGieGmbYvY7NI=
X-Google-Smtp-Source: AMsMyM5+1N6+K6LeM5JpapeQokf1CUGnZeD/IoxuHXa6dPo4LFuuBYzY3FuRusstacq5MYD+DWLEWw==
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id bg4-20020a05600c3c8400b003b4eff4ab69mr19158807wmb.104.1665400281061;
        Mon, 10 Oct 2022 04:11:21 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4ac05a8a4sm22532297wmq.27.2022.10.10.04.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:11:20 -0700 (PDT)
Message-ID: <1b23684d-2cac-830e-88e3-1dc1c1567441@gmail.com>
Date: Mon, 10 Oct 2022 12:11:19 +0100
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
Subject: [PATCH v2 0/2] fs/ntfs3: Add windows_names mount option
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Changes v1->v2:
- Add documentation for windows_names mount option.

When enabled, the windows_names mount option prevents the creation
of files or directories with names not allowed by Windows. Use
the same option name as NTFS-3G for compatibility.

Daniel Pinto (2):
  fs/ntfs3: add windows_names mount option
  fs/ntfs3: document windows_names mount option

 Documentation/filesystems/ntfs3.rst |   8 +++
 fs/ntfs3/frecord.c                  |   7 +-
 fs/ntfs3/fsntfs.c                   | 104 ++++++++++++++++++++++++++++
 fs/ntfs3/inode.c                    |   7 ++
 fs/ntfs3/ntfs_fs.h                  |   2 +
 fs/ntfs3/super.c                    |   7 ++
 6 files changed, 134 insertions(+), 1 deletion(-)
