Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF7ECF
	for <ntfs3@lists.linux.dev>; Fri,  7 Oct 2022 12:40:59 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a10so7096740wrm.12
        for <ntfs3@lists.linux.dev>; Fri, 07 Oct 2022 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeL0o0yVihRehcTsidItMwxwi4VSKF8819s3pNgUkoA=;
        b=BZkYYzZyw4zycnScyBtEpNLIX899gEQlS/5rsH17mcUdljcvuhkugTpSyomVciEvYd
         wKDRA11s19JcqtbScccYcptzSiMnZrLw3CS62J8Vg/sFGMNYfNVm1TyvYSs8wLPR8lbP
         As5xxidFsWEB+juHN8+HNirKyttXP1m0ctIjy61NRh/81jCm2VIVVVbNjtdl5gv9IhS7
         mj1toYktfaCJ/2SUdiBU7NyRGjd+zB/lZPSW0l0KvHUgy3FPdNIIQZ7TSTms0bXdmgUl
         7RcbIa3B9flzP7KBVwjEBzW4xsN6wAUvu13UNHwykJjuZVPojmEgAZihCB6QPLkyePq/
         YwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeL0o0yVihRehcTsidItMwxwi4VSKF8819s3pNgUkoA=;
        b=LzQ72HbVuvnJULqNqsj859yK82ysmLhAPATMSj2FFM17RWvforXj8zroe0MpCJwkK3
         bCmd9oRT1cCrJOwENTQPn8+3alWkuT0Avq8HkRs/4wQQQv1lGEbIUzphNg9ypmHAWfmJ
         sZBWswqztF0SG5QpGh9K7zh556V41JPlaFp00+snf6e9+QrRTs5VwISSUake6pGbdeLA
         KQn5ntCKaisCNC/5T/O+EgpGg1uFhm94jqthzwaEi1bQw8hcHNKoNM+l0IgTldqui+Sm
         yIHNTG+xqnFEna/aKM/gOzzaG/ukBcZkq4nl0Oovy/6M8Aha8Teay8GWiphx5+eZZ5FR
         VSJA==
X-Gm-Message-State: ACrzQf0dDiMVPIBMviompH9L1YFa7VLpvbin8/jPFWxXfw9MCvDz8/mL
	+gcKhZ2DrKiLuskrig1eFAA=
X-Google-Smtp-Source: AMsMyM5h2+D1e4uZKFLYgE5UyqCFtnQcMChNkepEFjKek393OI6sH7ESwap5tdOXasiNQJ6grRl5YQ==
X-Received: by 2002:adf:df82:0:b0:22c:dba0:1eff with SMTP id z2-20020adfdf82000000b0022cdba01effmr3147434wrl.13.1665146457788;
        Fri, 07 Oct 2022 05:40:57 -0700 (PDT)
Received: from [192.168.42.102] (mo-217-129-7-245.netvisao.pt. [217.129.7.245])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c3b8b00b003a540fef440sm8959584wms.1.2022.10.07.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:40:57 -0700 (PDT)
Message-ID: <89694a7f-42ba-dcbb-4eb3-b1700f21e9c9@gmail.com>
Date: Fri, 7 Oct 2022 13:40:55 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: [PATCH 3/4] fs/ntfs3: add hidedotfiles to the list of enabled mount
 options
Content-Language: en-US
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
In-Reply-To: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
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
