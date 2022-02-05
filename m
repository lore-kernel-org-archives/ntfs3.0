Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0DA2F21
	for <ntfs3@lists.linux.dev>; Sat,  5 Feb 2022 21:17:28 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id l5so21021835edv.3
        for <ntfs3@lists.linux.dev>; Sat, 05 Feb 2022 13:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=FqrKBPkHRfyho1U9UAA7ovLP2+cdIlL1lGjk1PM2E+k=;
        b=AdpD9edo4BTq7eAFF3UN+AYnwWAfE9CSS1XWkGGrkQZBedUugj6prvxj1+GsYU/EW/
         EBVFx6sXTlOHT8nijROAOD2UJijNSFlE/WOot8xkNC/AJYjxRJJnC6ignYyyb3o5A405
         vfsXLXjZE1akbvhBjXBSUO/gh24UBVHEAopvARaYj8yFXIzCNyJHdPw1udhM67tsk51R
         4q3N4nEOhpm8/JlbOljY9MTYUabxqdHolbs1CypJn1UctVrmtCkMtieziS489KWNO5bM
         rdMmid30uQCdbZ/+fJOCLGDx/Pg5PXwLo9TD9aJNbn7Tt5nolNQd2gQK42Dm4thJu/ht
         N5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=FqrKBPkHRfyho1U9UAA7ovLP2+cdIlL1lGjk1PM2E+k=;
        b=7Z+SVa8MhAYNfVyWiTf76dTc7dMZRnheolOkUx9DPeasmPz9HzBXzDoNMOSJ/LXQOO
         JUAgcLNAvNxBuoD7zH3ENM/hKP1ObZUk+poWtBtQKU4LeMsz/SyVUwhLNuiSs89+ew04
         ek81eq7/XVLa1yZ2vpGqokeArhVOy32mkG+JtF+EXYKJ5J8zGhWCmr7zoEvN7NEUpIxn
         R4B/D+QdEWqD1K582GysDAENdwJO/marwQqQD0UZicp3HMIZjlijACvNzsAssy3Gjwfj
         7vGZVR8FITNI13Z1OAFOViRXlAAJ4S0n/qTIn8ubU8iJFsC0VbGT0cYeJlwUpNbmsWCp
         gScA==
X-Gm-Message-State: AOAM531aGbgOq7c2eG6De2DotutXHBcd1vwBA6oAZOX0+ypphUnkUd4e
	Kp0DXX+CWoDTEWaWWDbAW+KXYU3od5qGz7yPiA+4HSAJQ4DRlg==
X-Google-Smtp-Source: ABdhPJwhWIf2lKypuWUUQo++QegA6w7AHDoEAACN/ZjaWjIQl7zRX0E4jsGZz1c7UmsUDVvzC7erf1SnkCyX1Y+CTcM=
X-Received: by 2002:aa7:cfcd:: with SMTP id r13mr5017375edy.55.1644095846928;
 Sat, 05 Feb 2022 13:17:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marius Cirsta <mforce2@gmail.com>
Date: Sat, 5 Feb 2022 23:17:04 +0200
Message-ID: <CANO0Vk4Qrgv-oHWqyJwW-TC-oHnsG-B3u=2ggvTiEg7xCoRMxQ@mail.gmail.com>
Subject: Long mount time using ntfs3
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

 Using Arch and the latest kernel :  5.16.5-arch1-1

 I am getting a really long mount time using ntfs3 ( about 50 seconds
)  for this ntfs partition :

 ntfsresize -i /dev/sda2
ntfsresize v2021.8.22 (libntfs-3g)
Device name        : /dev/sda2
NTFS volume version: 3.1
Cluster size       : 4096 bytes
Current volume size: 6001039241728 bytes (6001040 MB)
Current device size: 6001039245312 bytes (6001040 MB)
Checking filesystem consistency ...
100.00 percent completed
Accounting clusters ...
Space in use       : 5063774 MB (84.4%)
Collecting resizing constraints ...
You might resize at 5063773290496 bytes or 5063774 MB (freeing 937266 MB).
Please make a test run using both the -n and -s options before real resizing!

This is an external disk attached over USB 2.0 but for the same
partition I get a much faster mount time of less than 3 seconds using
ntf-3g.

Connecting the drive over USB 3.0 results in a faster mount but still
slower than with ntfs-3g on USB 2.0

If you need any further information let me know.

 Thank you
