Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C67E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:30:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l8so6666039wmi.2
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3gXHoOtP/G7cPHnJm5sliNg7u+93Tq1/waVlo7q5Aw=;
        b=Dc2nT/4q8/jBUtQ7KRFrVaRYynz7726UdERw2EVrft35KrVuLTb7nmRSMT8vSSO+0r
         WvZEzNZUg7yVN9JxcxHbahdTc3OVbtvsQM3OuvdXpC2zXIPZJW8MibYM79tnGacCUh/h
         7Key3Bbpt8SVl9iwM3aFWGrDBcRRMOH3sOP1NkH1zLNWa1h+4YSro/BoBW+/JWDE5f/G
         Y3dyaUck1t05h/fAKhiO8YXgwSpEbumBxWY7aQ2C6YWY+nex5rqsUrGnJdY2fo+HC6zd
         d/E+rGpVFGHE9C+B7PHpunITjgA3qIfup5hP028D9qDgCRbAt+y7G8ewp6ZHnl20xs77
         S7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3gXHoOtP/G7cPHnJm5sliNg7u+93Tq1/waVlo7q5Aw=;
        b=aTLLTdqF7n8eIERGjn3ZPMxQBNWQeOCGBK14em5RquMN1i6kj/VtwW83qvw16LRzFX
         vgB+MHAsc+bpVXgEfe8K9JDHm5hMM7Ekibxh0SVfz+Wny1QZEHNj8SgtBGHjAayPkb0Z
         5M8bF52i9K8aaJWULskCO6twSUd/54Xgtp8spqI+Tb3m+jzE6Z4Gzi7CL4ABVDNoI7ic
         O37FJFvqOZ8q9E8HTwWFF9xOf7M40uCmpLtmoyOtIUbvLsca26uMOANQS7NZzn8qR3Pq
         5ucljp+62dYl6i/uRaBjxrW9yk6TSwnJFLB2fymZ4Wy9x8SwgPupFW5IelpaYMX2j+Ov
         xWaw==
X-Gm-Message-State: ACrzQf1g0WouxB3LIoIA9E/JA940OP6jTIXIQmkx8ePVajm+tzGtgzpl
	j0hlYbukYDUU18mp9jfrvkcQfTMfPKY=
X-Google-Smtp-Source: AMsMyM7tOmkCJQGYoo8JZxnb/78cJD3WnQS0D3xmyynREYxFhKOPx4l/iKu4rWoyju7dzol8rwaPGQ==
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id z26-20020a05600c221a00b003b475b83f7fmr11998187wml.175.1665401416375;
        Mon, 10 Oct 2022 04:30:16 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id t128-20020a1c4686000000b003b4a699ce8esm7713297wma.6.2022.10.10.04.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:30:16 -0700 (PDT)
Message-ID: <51c60bcf-82a0-efbf-438d-4925c905503e@gmail.com>
Date: Mon, 10 Oct 2022 12:30:15 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 1/5] fs/ntfs3: fix hidedotfiles mount option by reversing
 behaviour
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
In-Reply-To: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently, the hidedotfiles mount option is behaving in the reverse
way of what would be expected: enabling it disables setting the
hidden attribute on files or directories with names starting with a
dot and disabling it enables the setting.

Reverse the behaviour of the hidedotfiles mount option so it matches
what is expected.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 1e2c04e48f98..c6fd2afde172 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -359,7 +359,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 		opts->nohidden = result.negated ? 1 : 0;
 		break;
 	case Opt_hide_dot_files:
-		opts->hide_dot_files = result.negated ? 1 : 0;
+		opts->hide_dot_files = result.negated ? 0 : 1;
 		break;
 	case Opt_acl:
 		if (!result.negated)
