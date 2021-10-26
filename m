Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E192CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 21:38:02 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bp15so1719534lfb.4
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TIHrps6JiOzeLQIEPEeB6Myv5l+xHPIBmw2UFFzGFO4=;
        b=N6EBwUks7cf6mmhJfql0FYYO7bBkJygq2VsYxdIXyyEPnFN9UKc7a5irXSeCBhG+2F
         rAbQOqlwlK0qx89nlJJ9UoLLK4GYS4n7Akwn+7W9c2aMdcC4m3CjDp+R7itTffIVb5Js
         9A9mlCvEtgLvZimhvgyUgOfVcDRlDdKxKArVLKHy7Ps1rT1mZiuc3vTI5YkCeQtzS5QD
         uWlTc/8aW6jwH0E6PVWQjZq6mbMvRZrQUQYhurVxK2SmPq7CSkjzjtve+gF742ECG6OI
         snhIEABgjA3JCmXN3U62Ry/H0ZoQRCk6JSargL3XbsP30KDABziMxT06V7w72qA7hCJE
         a/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TIHrps6JiOzeLQIEPEeB6Myv5l+xHPIBmw2UFFzGFO4=;
        b=eAGTBmi/YuSa2omJgp9mUpG70qj+rCBY56ZvLSwTOkpQ16olrfUDTThExJUZPjO2pj
         N6AB0Yip9m0Grux8Onb9hvz/diqxM/GSCJ570I7+d2uQN0IfXBiD5X1kyJK/3Nz1Hwsb
         Gkgxhb6y8gyWFIx5f/ZHPtodE2jGF7CSX2YBXbjbUUUqbuE8y5aecAije41etUqIt9m5
         l0zV7JCVAb0nAKDvpeIjxTOrkRPJnMnTkjPABdYii8K14UyOHflVNxfFXp8RbaNSzpJY
         QYXBrwcCNP79tpuH0tb45yK1dfafh0UMkzbunkDAAPJr8wF/9pVjf6NF3fNB/qwlg7Vz
         QVjQ==
X-Gm-Message-State: AOAM532QdHmvHTNbtuk0RHvaFXUPpiLCNncVOi3wp1ExqHUjC53I6EeP
	hbzw31PwxGshGLoe1j12aPY=
X-Google-Smtp-Source: ABdhPJygEa663LGGoKEsOzBLTneQzfW9FEIe8ke8PqQ2pN4pjYP46/zwSwGxpeJn7W1eNR0MM8hEBw==
X-Received: by 2002:ac2:538d:: with SMTP id g13mr18073540lfh.644.1635284281150;
        Tue, 26 Oct 2021 14:38:01 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id j15sm2035119lfe.252.2021.10.26.14.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:38:00 -0700 (PDT)
Date: Wed, 27 Oct 2021 00:37:58 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/4] fs/ntfs3: Various fixes for xfstests problems
Message-ID: <20211026213758.z5f6yuzgrdtedxqr@kari-VirtualBox>
References: <25b9a1b5-7738-7b36-7ead-c8faa7cacc87@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25b9a1b5-7738-7b36-7ead-c8faa7cacc87@paragon-software.com>

On Mon, Oct 25, 2021 at 07:57:30PM +0300, Konstantin Komarov wrote:
> This series fixes generic/444 generic/092 generic/228 generic/240

Now that 5.15 is just behind corner we need to start think about stable
also. Please read [1]. So basically this kind of fixes needs also 

Cc: stable@vger.kernel.org

to sign-off-area. I know that stable team will try to pick also fixes
automatically, but this is "right" way. You can add this Cc lable also
when you make git am, but it is good the be there right away people can
discuss if it should be stable or not.

Please also add cc tag to other patch series 1-3 patches.

[1]: https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rst

> Konstantin Komarov (4):
>   fs/ntfs3: In function ntfs_set_acl_ex do not change inode->i_mode if
>     called from function ntfs_init_acl
>   fs/ntfs3: Fix fiemap + fix shrink file size (to remove preallocated
>     space)
>   fs/ntfs3: Check new size for limits
>   fs/ntfs3: Update valid size if -EIOCBQUEUED
> 
>  fs/ntfs3/file.c    | 10 ++++++++--
>  fs/ntfs3/frecord.c | 10 +++++++---
>  fs/ntfs3/inode.c   |  9 +++++++--
>  fs/ntfs3/xattr.c   | 13 +++++++------
>  4 files changed, 29 insertions(+), 13 deletions(-)
> 
> -- 
> 2.33.0
> 
