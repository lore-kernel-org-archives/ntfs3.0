Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B76C7E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:16:32 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so6203148wmb.0
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9giZufS4y5/shKHrpokess7OrPrf6cZViJH9fhLHRYo=;
        b=cZVy/fEQmhoCZNL+hOCJRs8BQhYwfCrMjqXDoDWz54B23MA2dTMrHXKjaOtpEGWWVz
         BfvgQeNUB8plvHgywOnLpl+4f3pM4cBM0M/1tck+LXZxnDxjuj0EmQdC6rZUCZwojrQc
         jDiPdpGpNIW5Fe7/FbHUn4QIVY9bILYdoZFcC9ylAXZO8xvfBul3N67MksH+/VgCg7bx
         s5otZaKWbkQdv2IUTapERckff4DmZ9EaVlpZGasI39Yqk0rQQo//Pvw8vW2upCDCuK7C
         7YnjVEjpfoCqaA26E8OirBZQbpARlcpYZlqe1CjUjVkQ7PQXEOxNrgjb74L3xeJvJjor
         MAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9giZufS4y5/shKHrpokess7OrPrf6cZViJH9fhLHRYo=;
        b=ipjBtiOQrqStjkgVvC3cb1bBTPMgDpiDUhIs2BECukblD8bkJFxys9t/Hio3eGCOih
         RrgFpiXFE9lFfiPe9vv+4O6UlONY1W2pM3Hs5zuAVnscAbYge8r9YvD38e2w/0KNjbPH
         t2uDWwfbJ7HMDMOX1s3bF8B/wtb7xKeP601UldmI8TiLnVT7f8VZL5iwJaCUIV74y1DH
         WxH5uCjd1qxaA3EeOhqjsbTgJLiOzOSogY+yBfCG/PTDd9oq6j86KsEfZR/dpHJJhb8g
         XTb5Lr0btBJOPriuepi9eaHUCuBDkcZUFIQISB/OTjAw1YA98upSHat7F2SSX9qgy9AV
         eZTw==
X-Gm-Message-State: ACrzQf0q2geJ9P9jl9K434ruR1j3i9cC9dGJgirc7loZVYn3W/DkMfYa
	UUMYYIpthc5iX3yNKN6sE6kDifmErw4=
X-Google-Smtp-Source: AMsMyM4lAU8ZnSLDHTk0XpHri2yGkuyh7WJJAXZtqmN2jC4n6EW1AnU5q9Ekt+9Frcd6B8e1eRilYQ==
X-Received: by 2002:a05:600c:3b1f:b0:3b4:b1fc:4797 with SMTP id m31-20020a05600c3b1f00b003b4b1fc4797mr19493484wms.129.1665400590309;
        Mon, 10 Oct 2022 04:16:30 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id q67-20020a1c4346000000b003c6b67426b0sm2283795wma.12.2022.10.10.04.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:16:30 -0700 (PDT)
Message-ID: <f9f0fd00-9881-6a3f-6534-3b97358b22d4@gmail.com>
Date: Mon, 10 Oct 2022 12:16:29 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 2/2] fs/ntfs3: document windows_names mount option
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1b23684d-2cac-830e-88e3-1dc1c1567441@gmail.com>
In-Reply-To: <1b23684d-2cac-830e-88e3-1dc1c1567441@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add documentation for windows_names mount option.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 Documentation/filesystems/ntfs3.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index d67ccd22c63b..cda8e0e010d4 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -75,6 +75,14 @@ this table marked with no it means default is without **no**.
      - Files with the Windows-specific SYSTEM (FILE_ATTRIBUTE_SYSTEM) attribute
        will be marked as system immutable files.
 
+   * - windows_names
+     - Prevents the creation of files and directories with a name not allowed
+       by Windows, either because it contains some not allowed character (which
+       are the characters " * / : < > ? \\ | and those whose code is less than
+       0x20), because the name (with or without extension) is a reserved file
+       name (CON, AUX, NUL, PRN, LPT1-9, COM1-9) or because the last character
+       is a space or a dot. Existing such files can still be read and renamed.
+
    * - discard
      - Enable support of the TRIM command for improved performance on delete
        operations, which is recommended for use with the solid-state drives
