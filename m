Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A8FECF
	for <ntfs3@lists.linux.dev>; Fri,  7 Oct 2022 12:38:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id f11so7126946wrm.6
        for <ntfs3@lists.linux.dev>; Fri, 07 Oct 2022 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf7RCQeQguejwd2v0ikzLyew4+a8z+8COcAmUUx4Kto=;
        b=pFTLFPrCw71p6DcTapmqq+EZwVZNTAS7FWVeIaTb87anIQaBjgXYKAVyLXwLCM8wOp
         VOXkOoZn1rmL/6lwYFXXKv4Y7PaeDa89HhbW6VvQZQmLZ1aFHrK5Wy1I+zSwn4+6B8/f
         /Pz+ua9s4ctmoJCrgVSD9CfUxEuo5hmQZ2TVQ5dnwi6f6tZuuWNj40BB14uxGuAiaq/S
         oZzXmGBcAnKGcUmWhjwzWb6sPiIOfkyfni0M8INGieqp+8b6jOTy0s9kDrCIji7kHGWA
         +y7zEUFeRGopj5o9NSU7ythXuMeyKjLmyttPWHfLoksM7+g2G8IXne0Iu2aDYp4nUnv0
         W1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf7RCQeQguejwd2v0ikzLyew4+a8z+8COcAmUUx4Kto=;
        b=4dXGRL87YfRP4NkiWGuizz0HuDZYCtOu7qhfC+KZQiSOUzuA6LIX5Z8dEA1BMjHAt0
         1xbryt/PzYAknTgaVXom3fIBEAL0jwSfpSzEK1On6ieMzDqeb0dla66kST373RVix8h5
         /eizb3mciekUQW/QkutqlXMJOK1YzK5vEvj2xtimnerpobGlXJA3nXtqTC7I/JSxIaGG
         /g/ROKkeRrieuaxLJYF2nTLf14RSj0S2r4aT4a64YB0jf5ofysqE2BIkei6VP5etF94R
         CCCgI+DKLM7Y1/6xB4dB0MdJYs0GqTv9FN/+C3+dDGmdVluXqGJ8CqoIXav1Gj0hqT3l
         scFA==
X-Gm-Message-State: ACrzQf0zswvoUQhaP8AQRHwqO89SbDSlgczrfHBEDErztwWEsck/4ZOf
	FEBbBxWp459m0gJoOvc2ViA=
X-Google-Smtp-Source: AMsMyM41+hUD6dKXqSdLDCidvHYS4Y9pvZIdCJBvoPEG624ScV+bjnSkVSmKijrnbBJ/sjBMUlF+oQ==
X-Received: by 2002:a5d:47a8:0:b0:226:f124:ad74 with SMTP id 8-20020a5d47a8000000b00226f124ad74mr3313939wrb.18.1665146334345;
        Fri, 07 Oct 2022 05:38:54 -0700 (PDT)
Received: from [192.168.42.102] (mo-217-129-7-245.netvisao.pt. [217.129.7.245])
        by smtp.gmail.com with ESMTPSA id v12-20020adfe28c000000b0022e51c5222esm1902960wri.86.2022.10.07.05.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:38:53 -0700 (PDT)
Message-ID: <39664539-d881-9129-8213-ac6fad4e575b@gmail.com>
Date: Fri, 7 Oct 2022 13:38:52 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: [PATCH 2/4] fs/ntfs3: make hidedotfiles mount option work when
 renaming files
Content-Language: en-US
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
In-Reply-To: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently, the hidedotfiles mount option only has an effect when
creating new files. Removing or adding the starting dot when moving
or renaming files does not update the hidden attribute.

Make hidedotfiles also set or unset the hidden attribute when a file
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
