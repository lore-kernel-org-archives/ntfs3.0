Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CB81E4A1
	for <ntfs3@lists.linux.dev>; Sun,  7 Jul 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720362679; cv=none; b=bIQAsxzUvz6cbZTgZqly7d8KppAWV8p8dkGPe9+++MdRpLwWxwa6gqldxsEp74cbEMJhz/t6JpcW10zuNSfxE8eyEKqHx+vLQAvYyKOQwi6mnflmgEhxen4FCTlhGp78Z6CbllkTwxb6CehNvSxllw97No8ghv9hkJplEL7HIAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720362679; c=relaxed/simple;
	bh=T6i2utJN2cDTOv9GMVN6YOHHqr/DGlXIUlGC9v6r9AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qN88Vh08110K2O8BZZIrI0tVyAvZaLoDbXZ8b8aVNOOr6hzEA5d3nKboLJyaU2FqdVzGkIKDqRT2j80XOwr4WpVjMP16jVhf6v0lgTwiNxU8Huu3bIKDLHxaIQyTVGZ53EZtkZABsbtTOPTeMMzXwkYoTkWH+ZWm64h9uq+ZesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzOSbhao; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzOSbhao"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6fd513f18bso279922266b.3
        for <ntfs3@lists.linux.dev>; Sun, 07 Jul 2024 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720362676; x=1720967476; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FAhdIxS4NXzkF8cvq4jS8PZRsOiQskYp1q/cNMdQyZ8=;
        b=HzOSbhaoRwywdQggg+onoatCp9fxiSJty8dOZ7/xMsoWRPXiIUS4FHvvlSo/lJ6upg
         LyiQaJuEAwSBNJpvKHJHdytN4JbkbYNWpTATXs6tpl3K4TaQd97cgTZ9tvvriHd6nGC4
         5RkfaeT5IlQO6Wzdxua+qKUTZ/AOpdJV9fqC21yRAAtpu6Y3x+l6j+oOAYXfbIFUltaH
         PKk0Hj+8THa2N301QW3WNOke06EB0GyQ1/CmW/h5jgppsfV2FiDaZ//aMO6ddQ3QkAMV
         qVhlTQO+F++2kEi83raFl2Wc2fkWGmdR+MIXjg+140OQUAtxp3I1hY+TdtR+hLDw2mrT
         XnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720362676; x=1720967476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAhdIxS4NXzkF8cvq4jS8PZRsOiQskYp1q/cNMdQyZ8=;
        b=NEmj+IgMhGMzMQT6r1UkMXHW75BDRCnMkLkuRzFln83rc2UFGJjicTexVhRoyh1w/X
         4exS5gTiGFKyOOl/abfIUz25b4/R3rQe3cbHnKc30oAoOhGsWIUEFxS+1DqCNMduZvSw
         9i1WwDkhweY6f0PkFYOJy9rx2APgnO6eHMvoV2HCqqAHAyRRPO6qtP1SJDTBM21xDLec
         9m5YdAhmK10AYAAgKxP8rOiAf8WzHFMF1bgxbMYAELY9FWk7lWRFr2Pz082l2of1Oy77
         FYmsJ5at8Fb5rbSTqcdz01/zJJkp7sN4gJ7F1in41oC+iXWQesXoDaa6/aDtM8PpnBj/
         sJfQ==
X-Gm-Message-State: AOJu0Yw0+d3eNZC6vmjeCvdHgHN9N9zYNblOKCZmXijQvb3gmd3DFTke
	eNvzLvYlkbRECJ6/ijZNf1iAz/03nWCzIJyJdY9IPxyqI6+L2uJSXvG7UCD/EOlcpozVl4psR/e
	FLLZUASF5h5O+PjNVv2JwYROCE3h+h1Rq
X-Google-Smtp-Source: AGHT+IHWmpePKO/O/r1+Veq8ID9oIeYd9cp08LznDqQPktwSqokiIkNybHJdY9eSp0oSLTptfj/jfyYzET0uJyb74hc=
X-Received: by 2002:a17:906:2495:b0:a77:cacf:58b5 with SMTP id
 a640c23a62f3a-a77cacf5cdfmr433261166b.1.1720362676293; Sun, 07 Jul 2024
 07:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAHj5qgoDCcUBiCKPBHCDjZraqiy1dmTrHFwQzLaowjUPdLTyw@mail.gmail.com>
 <ZoasH_ozBpADJBjl@rivendell>
In-Reply-To: <ZoasH_ozBpADJBjl@rivendell>
From: Tom <tomasbortoli@gmail.com>
Date: Sun, 7 Jul 2024 16:31:04 +0200
Message-ID: <CAAHj5qhZ-9dtyX6jcC4e9gUPq5aeimnNvw=2wFbL7nW9meVFvg@mail.gmail.com>
Subject: Re: Unreadable files on NTFS partition
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello!

Nothing appears in dmesg when I try to read the file.
The file has no lock on the file manager.
The following appears in dmesg when I plug-in the disk:

[  209.554207] sd 0:0:0:0: [sda] Very big device. Trying to use READ
CAPACITY(16).
[  209.584067] sd 0:0:0:0: [sda] 7814037168 512-byte logical blocks:
(4.00 TB/3.64 TiB)
[  209.584575] sd 0:0:0:0: [sda] Write Protect is off
[  209.584578] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
[  209.584856] sd 0:0:0:0: [sda] No Caching mode page found
[  209.584858] sd 0:0:0:0: [sda] Assuming drive cache: write through
[  209.585405] sd 0:0:0:0: [sda] Very big device. Trying to use READ
CAPACITY(16).
[  209.643622]  sda: sda1 sda2
[  209.644494] sd 0:0:0:0: [sda] Attached SCSI disk
[  210.215945] ntfs3: Unknown parameter 'windows_names'



Il giorno gio 4 lug 2024 alle ore 16:05 Enrico Mioso
<mrkiko.rs@gmail.com> ha scritto:
>
> Hello!
>
> do you see any messages in the dmesg?
> Do the files appear with something like a padlock icon?
>
> Enrico
>
> On Thu, Jul 04, 2024 at 03:48:24PM +0200, Tom wrote:
> > Howdy,
> >
> > I have an NTFS partition which contains a few files which are
> > unreadable. All the other files are fine.
> >
> > This seems weird as I can't even read them as root.  I do not believe
> > the disk's physical blocks belonging to the files are damaged.
> >
> > I did run from a Windows system 'chkdsk /f d:' to check the partition
> > and try to fix it but no issue was detected.
> >
> > I am running Linux 6.1.90 x86_64.
> >
> > mount command excerpt:
> >
> > /dev/sda2 on /media/tomas/DiskWithTheIssue type fuseblk
> > (ro,nosuid,nodev,relatime,user_id=0,group_id=0,default_permissions,allow_other,blksize=4096,uhelper=udisks2)
> >
> > ls command excerpt:
> >
> > # ls -lh
> > total 1.5G
> > -rwxrwxrwx 1 tomas tomas 583M Nov 14  2014 TRE_8446.MOV
> > -rwxrwxrwx 1 tomas tomas 581M Nov 14  2014 TRE_8447.MOV
> > -rwxrwxrwx 1 tomas tomas 170M Nov 14  2014 TRE_8448.MOV
> > -rwxrwxrwx 1 tomas tomas  19M Nov 14  2014 TRE_8449.MOV
> > -rwxrwxrwx 1 tomas tomas  42M Nov 14  2014 TRE_8450.MOV
> > -rwxrwxrwx 1 tomas tomas 116M Nov 14  2014 TRE_8452.MOV
> >
> >
> > file command excerpt:
> >
> > # file *
> > TRE_8446.MOV: ERROR: cannot read `TRE_8446.MOV' (Permission denied)
> > TRE_8447.MOV: ERROR: cannot read `TRE_8447.MOV' (Permission denied)
> > TRE_8448.MOV: ERROR: cannot read `TRE_8448.MOV' (Permission denied)
> > TRE_8449.MOV: ERROR: cannot read `TRE_8449.MOV' (Permission denied)
> > TRE_8450.MOV: ERROR: cannot read `TRE_8450.MOV' (Permission denied)
> > TRE_8452.MOV: ERROR: cannot read `TRE_8452.MOV' (Permission denied)
> >
> >
> > Does anyone have an idea what's going on here? Is this due to some
> > weird NTFS feature to encrypt files or something which is not
> > implemented in the Linux driver? or what..?
> >
> >
> > Thanks all a lot.
> >
