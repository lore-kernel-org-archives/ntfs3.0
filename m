Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80269ECF
	for <ntfs3@lists.linux.dev>; Fri,  7 Oct 2022 12:36:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w18so7107139wro.7
        for <ntfs3@lists.linux.dev>; Fri, 07 Oct 2022 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3gXHoOtP/G7cPHnJm5sliNg7u+93Tq1/waVlo7q5Aw=;
        b=W/By9sT1B0l37Szu1oY35mVdTCtdmZkfO9z5iyy9KYOfafScHvXUDb/l9KeO8JwC1u
         5UM/ELQpZrHnNxYd5YxZUuHwaOqWl7iReJkVMzhuWM6Axsnc3/2S0mFjKyYY1mPnalmi
         w+9qZQNeeR7r/1hhLtfR1JzH9Kr4gAPI9ABearYLn7jgIWeH5eUr+HrnRpruV2CJwQlq
         y5toeuXlmvSj+DZRpQ7MOxOWWmYNnYWb0LMCAptHVfnYO+6+vxdqw5GaRZHoNFGIUrOJ
         PQpHIf+Fict0z8xe5C3YH/FZ+U+PBSm+e22NiptTdtsj1ik/mW0y+nLhYlPn51pos9Ju
         PiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3gXHoOtP/G7cPHnJm5sliNg7u+93Tq1/waVlo7q5Aw=;
        b=x5WJElnkzD+90yuZXrP6D88eoTDgeDjsa4WNK5Dz1/gnDsd8+5xL24hiKfG2mv3Klm
         IxQeOtWf2g8Wh1Cj/BZFq2Cccc/wuLa0x/65qjo3FYI47dXRmTbPbpUbtVRS0cLhk6Lr
         vZ+pHM7RAEruZa6qh0yt2TmjK/hzA/i+xMYVBnz8ppVckNwhIFZv40F3Greb6H8HakZQ
         oWko2rz8UZWS5gQptUf5Ip6gUAWIPEIXeuib6Wzap1yiLCy11+u47So7JG3+U07/y4zu
         J97NFDZTVvHtU4fQaG1cfyNXC06Tzi1yj/gWIeNsQ9cchdHb1nTkccgWTpIc/g/sYu+C
         swzA==
X-Gm-Message-State: ACrzQf09WczV7DOUSNbZUdHQwp9n/0ImSgjs2AB5xAooHm+IKc37sPIJ
	gJ87aqqWTFuiWU+Y6An7cVc=
X-Google-Smtp-Source: AMsMyM5ejhzR9Km12OJn+zM8m9X1QRG6cw2SCRQv+JKQ3MdO2sPDGxOL3MmOuOFz9awJ1yci7zxScw==
X-Received: by 2002:adf:d4cb:0:b0:22e:489d:e0e3 with SMTP id w11-20020adfd4cb000000b0022e489de0e3mr3228129wrk.653.1665146201846;
        Fri, 07 Oct 2022 05:36:41 -0700 (PDT)
Received: from [192.168.42.102] (mo-217-129-7-245.netvisao.pt. [217.129.7.245])
        by smtp.gmail.com with ESMTPSA id bt7-20020a056000080700b0022e62529888sm2049929wrb.67.2022.10.07.05.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:36:41 -0700 (PDT)
Message-ID: <ca14dc16-a00e-bff3-500f-4c9227a30674@gmail.com>
Date: Fri, 7 Oct 2022 13:36:39 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: [PATCH 1/4] fs/ntfs3: fix hidedotfiles mount option by reversing,
 behaviour
Content-Language: en-US
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
In-Reply-To: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
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
