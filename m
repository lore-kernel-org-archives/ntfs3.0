Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CA2C80
	for <ntfs3@lists.linux.dev>; Thu,  7 Oct 2021 18:26:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m22so21964364wrb.0
        for <ntfs3@lists.linux.dev>; Thu, 07 Oct 2021 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6sVapdn1VZBx8gBh0k3vSrADmejqz71N9R6RJJwzdV0=;
        b=T7ryRp/cuk7gi5kYRlQJtq5ss9LPOFKZNnCDeFIE5IrBNnZE5bDQferz0eQc7bNEjr
         ALi/i9ppi2ZGBQHDycnSNi7TMP8CCHf2EdwBDpvRbKRbti0Fe71QqO0qDK4jb3mJFMeT
         6ff6byKuLMqhElnGhAqNqygj9jq1xO0IHIV5yLfNJP3lJz9h3VBq9DRd6GtdNp82LN91
         pt3Q8d3hX8a1RQrcbsOVws3k+rKRkyS1w3hBEUr6kOMy6kBVaOxIV7St86KEG/ceXa2Y
         YyukruHD0dgvARePVoM/B3axn8RzQMN2LLd2qqsIcCPcYoOWRFkATU1MyP5fd5aS3v3B
         /vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6sVapdn1VZBx8gBh0k3vSrADmejqz71N9R6RJJwzdV0=;
        b=XVS47s3a8tt020LDFrYzQ4oo5XukN4l+hmRH9WquDstJK+nsp3zlusUsTW3acSgrBs
         eoBXNzyRvESBtf6rqnb4diPy1MyGUMyORSBfDOFbdub1K253S9SwWZdPWPKxXw3EEzwW
         rBkQtfZayO5vBNSyp6C0kdrDmPVOB2jEOg0ufjQw2+dV0vn0YYMfWiC4DK2gKobIHDaF
         hFOoTWjmetoZr4WQBZ7s6d1B9VfXq+dExMlJBKnOoC7k7l33PLaY6Um0dXzml+AMEX+1
         k6mb0OQ++5MscwKpfOTsfz+UFnqQS7PrvMtXSsJVj7OgLcONV0OLSi8eeCZXbWT3JnM/
         QS1Q==
X-Gm-Message-State: AOAM530OFdIlaHzOYTIgkw6roztsxPDRMhefSNzJmtOg0yE0kxRqrHjY
	7S7DSkv0SSJ9vEweg4Bnmsc=
X-Google-Smtp-Source: ABdhPJybSlYfopGkBsGddP8IxalUV95Rh9epfMuNKCtQpva6hq0Jz5DI1CQ8p2d7KUOY4qBugQ8YWQ==
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr6296991wmi.90.1633631187799;
        Thu, 07 Oct 2021 11:26:27 -0700 (PDT)
Received: from ?IPV6:2a02:8010:64ea:0:fad1:11ff:fead:57db? ([2a02:8010:64ea:0:fad1:11ff:fead:57db])
        by smtp.googlemail.com with UTF8SMTPSA id r18sm109223wrs.47.2021.10.07.11.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 11:26:27 -0700 (PDT)
Sender: Mark Harmstone <mark.harmstone@gmail.com>
Message-ID: <1068834b-5c16-84e4-2692-938dd4e91121@harmstone.com>
Date: Thu, 7 Oct 2021 19:26:26 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Content-Language: en-US
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Kari Argillander <kari.argillander@gmail.com>
Cc: ntfs3@lists.linux.dev
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
 <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
 <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
 <14130f55-f61f-fb39-c653-02b4dd39bc6b@paragon-software.com>
From: Mark Harmstone <mark@harmstone.com>
In-Reply-To: <14130f55-f61f-fb39-c653-02b4dd39bc6b@paragon-software.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/21 15:33, Konstantin Komarov wrote:

 > This is optimized way of this algorithm ( from comment to ntfs_cmp_names ):
 >   * Straight way to compare names:
 >   * - Case insensitive
 >   * - If name equals and 'upcase' then
 >   * - Case sensitive

You have your first and third bullet points the wrong way round there. Am I
right then that the current case-insensitivity stuff is purely to determine
where the name goes in the $I30 B-tree?

 > I think, that ntfs3 need to be case sensitive.
 > And listed things, that I think support my opinion.
 > That's why I've mentioned that ntfs.sys is case sensitive.
 > That's why I've mentioned FILE_FLAG_POSIX_SEMANTICS and
 > FileCaseSensitiveInformation.
 > I don't think, that copying win32 api behavior is good,
 > when Microsoft makes steps to make ntfs work in posix way.

I'm surprised that what I wrote is controversial... NTFS is a case-insensitive
filesystem, that allows specific directories to override this with a flag. You
might wish it were otherwise, but the NTFS specification is defined by what
Microsoft's driver does.

Your driver lets me create a file called foo.txt and one called FOO.TXT in a
normal directory, and when I double-click on one in Windows the wrong file gets
opened. That's 100% a bug.

It's worth pointing out that the Linux vfat driver handles case-sensitivity on
Microsoft's other filesystem correctly.
