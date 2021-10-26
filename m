Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF292C9F
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 17:44:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j205so221087wmj.3
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version;
        bh=/AmK1INZwgpbu3TdbjGC8udW5frsQ094cuLGkeFBK9U=;
        b=lvmb5RXfgvG8ko6tNUBQx3RPos51PlUI56Pdi+BmGIQOxm4GmU7KNAWONMkckfzx85
         oJSAcSS5qvLdHR6Gbod17Nem9R9KxcbQLClGBQqzEE7X8/+TCzEKygCLjDeZRMityYZi
         pMt7auKOqTTyj4cq1yoPevz9BddlQ3/BJtOGpEw/EoE7ysNUQ7jw2CbRpscuukvwXTSk
         5DSCNPx3kPFXARmJd8wiaBbYNZSrgMApD7Q4Ko9YU59w6Bry00FX8qOenKDUioPv4oQK
         lTapxPZuxvmtTNCy/+gcrMIFL7Dwaf83Kr3sNq/nmwjgFOKteo9PIThlp0zuXGecqJNS
         i3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version;
        bh=/AmK1INZwgpbu3TdbjGC8udW5frsQ094cuLGkeFBK9U=;
        b=0FgUG4AAPIkkx2dLWrfz/1l+gpum0GQHKhoargOV7sO/sDL4WKVEfJJMNbljBhFOUu
         EGGTcO5KaEQ6EpTlhc8uel+u71T9L9PzRSs3hrmMv6tGdVpOpB/MzqhVWx/+YhOJrvOt
         07h76ErLrxfReRFR5MkjNlBJqaIoRsqWiIcS3Tv1F4hnHTDZ719U2JfTll2aQc5100mw
         dleIsm7Uc0jVtZcIc+ROops9HQ5SVed9u64gBzoCRfwW8DSVFc7jx6u8COfz8YXWJ88p
         pfuMYbo6rGreFzGiekljCn6sILgJJfQpV85DwcZo1y+3sfBaaiivz6Z5nPY/jU7Sy7wk
         9Uag==
X-Gm-Message-State: AOAM533TZ7eY191oM8txapfUrblXDIfbffKwND7m9cZSek26PKtg00Pm
	F5yxsuc9P178gqPsJLWlGG4Wzxq5fh8=
X-Google-Smtp-Source: ABdhPJwvopxZ/y0QuZn0rjxhlbi/9Hv4pdGyKsDA5kO5ogvmEe6Y/Z64t3iRdo4GYc4q5ZC69UrN8g==
X-Received: by 2002:a1c:8002:: with SMTP id b2mr134456wmd.124.1635270245694;
        Tue, 26 Oct 2021 10:44:05 -0700 (PDT)
Received: from mStation (h17-ipv4-77-240-224.mynet.it. [77.240.224.17])
        by smtp.gmail.com with ESMTPSA id z17sm1150536wml.15.2021.10.26.10.44.04
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 10:44:05 -0700 (PDT)
Date: Tue, 26 Oct 2021 19:44:04 +0200 (CEST)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: ntfs3@lists.linux.dev
Subject: (very low importance) NTFS version message
Message-ID: <c3cb4ca3-5c5a-626c-8fbb-41fdd5ecfff@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

Hello folks!!

in ntfs_extend_ini I would be more explicit when NTFS version is lower than 3.

I would replace
ntfs_notice(sb, "Skip $Extend 'cause NTFS version");
with
ntfs_notice(sb, "Skip $Extend initialization due to NTFS version lower than 3");
or something like that.
What do you think?

Enrico
