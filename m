Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D57E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:46:15 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b4so16653151wrs.1
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsnSeVEjMZcjnL6/NlJDc2TDG47KOTr9/3jGBVyFfu4=;
        b=V4koQH5PfgZ4cfQzB+jfdUrdh2P5AxTeXhG0JeIMZtmhW6ST47raSZ4v6hBWyakPNp
         jFNSeAVYH8dgzTUJT1T67SRGndIeKurUd6PDIhJ5iMyP8zIsyEWtYFHrAn1jH9zne6vI
         rDg4S+hg6vaRrJUoNNM6+zHQikWQ7nQZHpUIJAmOHwZG5wNFP4624lYUgN9xUM5C93gx
         xAkepZHstu0yPmjx5KmQNLi543GMYwLjinaG1Tv8l/6vNZfyno465u0vdTEIthf6rTHy
         3muBYw61N+X4tny8LZ6dFG9SOFP2JudrkcAnmwxsWTHPobocKwNeJENq6NGpxKFltYIl
         yZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsnSeVEjMZcjnL6/NlJDc2TDG47KOTr9/3jGBVyFfu4=;
        b=fnB20lOiJeyBERp9rMPPLa2nbR1Sg3fxDoMqnzexnbQrsWvjXKrNRgNvU6XmHoC/MS
         KLJzRwjb9uVx2HpkcS7W6VXbUXjJ4uovy4a2naxWCOXgfihn0IPbwUtPjhQU6XhJTWOA
         SbIK13iOHfAPsoBRQGVk8Kb+QxoVtrwKlalljCzDXtgVzoVnJjzxIOnEtAFsPbbSgw9B
         XaPwWQvYIc25TjIdNq9ObMeZv1WejPvbx5Jfw4QcLUQGou8GqXZc8Z4usHZqIQ9D9BAW
         8RDCD7PNzEOiIBZSatbHaD1AnFQelAITRhkPfkhZ12C9ORDKSo1VXwWRQ/ISlMr1O+/b
         rBTw==
X-Gm-Message-State: ACrzQf3nOkqOWKxkSzrke1DgNXhCmm84X/gyOiRAydHAayEVRrLmbOh/
	zB91vCQ1G0COFLS7AIfr9oM=
X-Google-Smtp-Source: AMsMyM4WZX71Z8e4s4reevWN6BC4ev4WUdvCd7/gogkoF7ELZ7KnKY7RCatXSa7DbyX05e43x8a9dQ==
X-Received: by 2002:a5d:4f10:0:b0:231:1c7b:e42 with SMTP id c16-20020a5d4f10000000b002311c7b0e42mr432011wru.568.1665402373719;
        Mon, 10 Oct 2022 04:46:13 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id k13-20020adff28d000000b0022ac672654dsm8500759wro.58.2022.10.10.04.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:46:13 -0700 (PDT)
Message-ID: <54400493-6179-c702-90b4-665b7e93467f@gmail.com>
Date: Mon, 10 Oct 2022 12:46:12 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 2/2] fs/ntfs3: document system.ntfs_attrib_be extended
 attribute
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c9b467dd-9294-232b-b808-48f62c3c2186@gmail.com>
In-Reply-To: <c9b467dd-9294-232b-b808-48f62c3c2186@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add documentation for system.ntfs_attrib_be extended attribute.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 Documentation/filesystems/ntfs3.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index d67ccd22c63b..fa6ca1babc60 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -25,6 +25,11 @@ versions up to 3.1. File system type to use on mount is *ntfs3*.
 	  Note: Applied to empty files, this allows to switch type between
 	  sparse(0x200), compressed(0x800) and normal.
 
+	- *system.ntfs_attrib_be* gets/sets ntfs file/dir attributes.
+
+	  Same value as system.ntfs_attrib but always represent as big-endian
+	  (endianness of system.ntfs_attrib is the same as of the CPU).
+
 Mount Options
 =============
