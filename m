Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7D77E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:32:15 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a3so16631934wrt.0
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGcpwMtrr4F0Rl9cO3XqszINhBjZp294W8XfrrtEik8=;
        b=Czw7WsXz6I0DhvuBx8oLZnLaTVnNrk2eYPyEIj8Jx9mSUWqqoc1uwvuJbhH67iKcKz
         NtcWdn1u6DrW2JhFsqQHnme3ignfqeUlgcHy0GOwwXU7xnTQDzfkhvGc6rxDDsfUScU/
         qcZv446AA23ofK85cz2urgiOae4tQlVoxDzYpiIcBPaKLDUteC/ycIW3kQ9O9tUZ772Q
         0AGNs9mIPAH6+vnG8rzyTMq6K6GbX7lWRuBKW/tV10n33czStFoJIohzG/g3TimIMTte
         Jvo4jAA8jtliNbD2GvaFcy02DpOzCzJQw5GswLiinjK7h0HrPsotb/Jx+f9ubHAmj818
         +jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGcpwMtrr4F0Rl9cO3XqszINhBjZp294W8XfrrtEik8=;
        b=ZVLaDMDqbPn4LYZwEJJoC+MAjh8+ad/+O5mCNiLoZrJLRZOhdCenIC0JVVyDDsXngd
         JA7FvYSIETFbJbswFkPsIKDMxV+7x4DvR8eQJjpzamX3YD4HFb7+QMjPHDa5qSYbegKp
         akSnyIThWE5cQ0c2Hu0TMTYTT1gq/IpPaueA5afh3gyaluluzp6ydHbhfDTUyrEddQQo
         qNAW3G3FF/p0bszYgGsdiiWLMksnc/VczSaL9LPjHIN3Po6e4jdXlOiANwNJl2JYBXx8
         AnHE1aVPkjbzcbHsQwXWErvbCLchiiu3Efww9zG8xfA1mGa3rFUCy8jyXPCtZfVX8UX2
         t5nQ==
X-Gm-Message-State: ACrzQf1XmchoiY1uG1jG5wIb+WMMXAn8q319g3i2ru1LrHjY8i1SinHr
	y86te+5DSirpcJYJ4tl6NHMe9sVYsB4=
X-Google-Smtp-Source: AMsMyM6uVMrIO38uJtkfTAO5XLP7z6K4gFiOwMWvtXt+2oLX1fKOwCWF1vBsdrNqDwCjwQlhqQcz4Q==
X-Received: by 2002:a5d:6384:0:b0:22e:6027:9da4 with SMTP id p4-20020a5d6384000000b0022e60279da4mr10653619wru.686.1665401534087;
        Mon, 10 Oct 2022 04:32:14 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4305000000b0022ac1be009esm8675317wrq.16.2022.10.10.04.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:32:13 -0700 (PDT)
Message-ID: <232b8d40-eb93-6a73-86bb-c664d7b2ccee@gmail.com>
Date: Mon, 10 Oct 2022 12:32:12 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 2/5] fs/ntfs3: make hidedotfiles mount option work when
 renaming files
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
In-Reply-To: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently, the hidedotfiles mount option only has an effect when
creating new files. Removing or adding the starting dot when moving
or renaming files does not update the hidden attribute.

Make hidedotfiles also set or uset the hidden attribute when a file
gains or loses its starting dot by being moved or renamed.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 fs/ntfs3/frecord.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 70a80f9412f7..41a20d71562a 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3018,6 +3018,15 @@ int ni_add_name(struct ntfs_inode *dir_ni, struct ntfs_inode *ni,
 	struct ATTR_FILE_NAME *de_name = (struct ATTR_FILE_NAME *)(de + 1);
 	u16 de_key_size = le16_to_cpu(de->key_size);
 
+	/* If option "hidedotfiles" then set hidden attribute for dot files. */
+	if (ni->mi.sbi->options->hide_dot_files) {
+		if (de_name->name_len > 0 &&
+		    le16_to_cpu(de_name->name[0]) == '.')
+			ni->std_fa |= FILE_ATTRIBUTE_HIDDEN;
+		else
+			ni->std_fa &= ~FILE_ATTRIBUTE_HIDDEN;
+	}
+
 	mi_get_ref(&ni->mi, &de->ref);
 	mi_get_ref(&dir_ni->mi, &de_name->home);
