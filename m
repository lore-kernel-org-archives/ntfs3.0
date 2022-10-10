Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C267E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:35:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bu30so16569690wrb.8
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jr6QUg4W3KCMgn//RzqzYopSrHaXWN6D/2F2E2n78+o=;
        b=AsEfPf2TiJbvEz92D8N3jlqaxcRRjPXuD/oxHfnN7m+ZjrqWMdPul708x1RwSyRzEU
         qt+ioz8N1jDj/WbDAJb068bSX8UHXgUcDPF12gSzrvYYIBv4O+ievYINUZUDXSEADcBX
         BzzhbxS0aResm8dd/83NVjHxdiPUyQ7vYPqbblVk7iIsu7T27YhG620ZA2hvrW32Vaw1
         M2SBUo8ck0gfpXfavGYpG4V+aOVtaPXSRkrhAZz5XZdpKcC61r3GLd8eV4pMTL9Nnh5w
         QotnJ9y7aEuYUclBw4PrkQzfQNhhg8A0qZZZqt/ukal0qcrX+dnlOtCgqNTKKaLboaUI
         1kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jr6QUg4W3KCMgn//RzqzYopSrHaXWN6D/2F2E2n78+o=;
        b=KDU7Q6zMHLpjTF07C8dj1JFmT+3qF5VR4UmDSPbOXV4Smhn1V6hhlxUHQOlSfABSw7
         2o+EaHpVjHuqZsEpHYUE2f2z7i49QyX8HtY3FIG52mgu0KrNyJSu4OcTR90md9E5ScUe
         taiGFS7eJal1u8R1E/8B9JXLMvAUH1c329pmLmt4OMPhBSD1DTsPVDZ8VXuuJkD4WHeO
         KuGlpF1tp+x1f71uPMnlUMwuDhlx5duW704+SWc76keWY/cGknx0BYOgB/BbxReaMGoe
         qpaVhGowpjwWX++RhPyLo1XhbV4/gW4IbBbKOJgid5YLnFcwRD+1ObVNS6CcnKApxZlu
         +oPg==
X-Gm-Message-State: ACrzQf0m1CSKeOQ+JUVhI8klFtwLMmNu9ee65LAXT1JVoC4q/xGInNtg
	Lt9yIpx0/wtq7QkOg5BQr8E=
X-Google-Smtp-Source: AMsMyM45nIQ+4isA/wR9XJ47XEZguYnuBIiLPwckYxxFL6SrsVMyMMFKTBJl6gLeGNn7t14z+Shsqw==
X-Received: by 2002:a5d:4950:0:b0:230:cc5a:f6b0 with SMTP id r16-20020a5d4950000000b00230cc5af6b0mr1643870wrs.656.1665401747925;
        Mon, 10 Oct 2022 04:35:47 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe9ca000000b002286670bafasm8622031wrn.48.2022.10.10.04.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:35:47 -0700 (PDT)
Message-ID: <f6101785-aff8-aadf-8ea7-35f60668bcf8@gmail.com>
Date: Mon, 10 Oct 2022 12:35:46 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 4/5] fs/ntfs3: document the hidedotfiles mount option
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
In-Reply-To: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add documentation for the hidedotfiles mount option.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 Documentation/filesystems/ntfs3.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index d67ccd22c63b..fa03165f2310 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -75,6 +75,12 @@ this table marked with no it means default is without **no**.
      - Files with the Windows-specific SYSTEM (FILE_ATTRIBUTE_SYSTEM) attribute
        will be marked as system immutable files.
 
+   * - hidedotfiles
+     - Updates the Windows-specific HIDDEN (FILE_ATTRIBUTE_HIDDEN) attribute
+       when creating and moving or renaming files. Files whose names start
+       with a dot will have the HIDDEN attribute set and files whose names
+       do not start with a dot will have it unset.
+
    * - discard
      - Enable support of the TRIM command for improved performance on delete
        operations, which is recommended for use with the solid-state drives
