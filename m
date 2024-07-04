Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1851ACE7F
	for <ntfs3@lists.linux.dev>; Thu,  4 Jul 2024 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100919; cv=none; b=hFfjG9i9ENDpwoVoyW2wd7ILWp8WLoS3ToZe6y8bFIwXqhYvyHuOs1ZEPz8i38Gwv2MKUHp7PthsAzRCCi0MqV3EdQJVsWwWrqM2nXDwhNpt4Poc6iPgsmgBym8qWlbIqMujkeYpvBH4TLbJHyBvU3t7bvl3bl5g6b8vOTI4Y94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100919; c=relaxed/simple;
	bh=zBOpXyvwIS3huxyg9OvwpPo+zMCGOcSIvJKe7SPPeNs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tgPqVqQCNHXMr1Vl3KegRgFm2ZLQ+30b/Qlp+C61k7OPOupcxQziFRIs6RzXCrNBz8C6GmwQqKijriGUVtZf9UYhIC2dP0ryvh2TklVqrwQQOP2NZBAwltmlbMHjotBuUkZTe5zqmDu+abGE/SVNAcfozyqI+JzaIQGUqgieer4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaSJl/4v; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaSJl/4v"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a75131ce948so80064366b.2
        for <ntfs3@lists.linux.dev>; Thu, 04 Jul 2024 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720100916; x=1720705716; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fl/u3jPx0gHIfeyGGqcMtr0eNVfRN2u0uNzmYXWN2rs=;
        b=XaSJl/4vqxnOoTCdpA5pPtxugqGzbT3eH2i7WPfmDZnBPaNAsGq9gc92tZU1gjIj/R
         7vkvA1pvEnVrRnHxRx19aMTwcwFI7UIS6bXRc5+kUYt8XcSc5DaMzy6GVcbTOEWTbNe5
         +OJNH3VHamquZaW+TqrmB240e1mZQDoU+fIh8XW8KU3AptNOxA14xYR3qC5juM/GV6T9
         xrcdq+Sb2jTkH4QI6mGH6Jbh54WIK7/56NLrRj4Y22R8mU/u9wlCn3ao7NSufAMlHdKm
         DjxgkDItPw2HOIDXgm14N43DCspEfOZ2IeO7wn6IqCfppEEOOoEz7i3VF17gTw+8YrEs
         fBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100916; x=1720705716;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fl/u3jPx0gHIfeyGGqcMtr0eNVfRN2u0uNzmYXWN2rs=;
        b=ks4QGwQTysQSXtyXMPRBHzgBMpuk33SMlzu5K8XMNEMXFklHLBv4hu0qXdddsn4GIX
         Xlk7c8CdmAGxX7sZUnOx1RMps9kEP1T/vBT1eGk9dua6O1NFHUZMP4sJe6bQVgMuAPWx
         5rK0Yj7s5VUrGeSC6MFaMM5Eftb+RZvDVlFBKwe/5dZ+D9or2uglTtYkixBai17HkINB
         4O5NKLwg1WWoXeAzzrMoVLnJO+zYod8g6AM7ElirVLAaV/noJZHbctFYPsYuUDj84lJB
         3qbhEWzGJeQ01cmKXSoQWoV8w0/iMHDXDj9wTGXmpZxEwMrCEJiigwt98hVpb7B/KWut
         WskA==
X-Gm-Message-State: AOJu0YxiPBHGQUeT3iX0bgxeSPbbYZm1lhMIV2KEAZlrilnUPyQuWS/d
	s6YX7wGCBGULhtNNPLzjXeZHtA/SlXcI+8IOIhhQiLPC1xIc0jbC5fVk3ZsED/b4TULRXU6EIm5
	ivemo3B3JkMMwqJr+qhYxaz5E7qIxL8Hm
X-Google-Smtp-Source: AGHT+IHPM8FYCmpCMcHO7AvV7sUajzwxZjrcQ4VtLJXarlPna594616TXAFUw3WpMI3xc+Fu3ey/dGvQ87zTD4uuWBo=
X-Received: by 2002:a17:907:94d0:b0:a72:b804:566f with SMTP id
 a640c23a62f3a-a77ba711c83mr139177666b.52.1720100916097; Thu, 04 Jul 2024
 06:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tom <tomasbortoli@gmail.com>
Date: Thu, 4 Jul 2024 15:48:24 +0200
Message-ID: <CAAHj5qgoDCcUBiCKPBHCDjZraqiy1dmTrHFwQzLaowjUPdLTyw@mail.gmail.com>
Subject: Unreadable files on NTFS partition
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Howdy,

I have an NTFS partition which contains a few files which are
unreadable. All the other files are fine.

This seems weird as I can't even read them as root.  I do not believe
the disk's physical blocks belonging to the files are damaged.

I did run from a Windows system 'chkdsk /f d:' to check the partition
and try to fix it but no issue was detected.

I am running Linux 6.1.90 x86_64.

mount command excerpt:

/dev/sda2 on /media/tomas/DiskWithTheIssue type fuseblk
(ro,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096,uhelper=udisks2)

ls command excerpt:

# ls -lh
total 1.5G
-rwxrwxrwx 1 tomas tomas 583M Nov 14  2014 TRE_8446.MOV
-rwxrwxrwx 1 tomas tomas 581M Nov 14  2014 TRE_8447.MOV
-rwxrwxrwx 1 tomas tomas 170M Nov 14  2014 TRE_8448.MOV
-rwxrwxrwx 1 tomas tomas  19M Nov 14  2014 TRE_8449.MOV
-rwxrwxrwx 1 tomas tomas  42M Nov 14  2014 TRE_8450.MOV
-rwxrwxrwx 1 tomas tomas 116M Nov 14  2014 TRE_8452.MOV


file command excerpt:

# file *
TRE_8446.MOV: ERROR: cannot read `TRE_8446.MOV' (Permission denied)
TRE_8447.MOV: ERROR: cannot read `TRE_8447.MOV' (Permission denied)
TRE_8448.MOV: ERROR: cannot read `TRE_8448.MOV' (Permission denied)
TRE_8449.MOV: ERROR: cannot read `TRE_8449.MOV' (Permission denied)
TRE_8450.MOV: ERROR: cannot read `TRE_8450.MOV' (Permission denied)
TRE_8452.MOV: ERROR: cannot read `TRE_8452.MOV' (Permission denied)


Does anyone have an idea what's going on here? Is this due to some
weird NTFS feature to encrypt files or something which is not
implemented in the Linux driver? or what..?


Thanks all a lot.
