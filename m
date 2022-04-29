Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77D1851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 17:30:23 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so8778609fac.7
        for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=pxm0dsgAzCk9wAwKBKmMz3LOeS/VE9qe1SAYtrlypBA=;
        b=Z40LuESLr0lD/LvE9lR9gaRy0TkxC7wFkAFDnYt2PzEzqN6FIIOXRblVuWbbHww8o+
         V+gmwHJk7O2tW/l/hiVqXE+TTMQms6u8KF4jKEZJ41Wfdgk+tJSlioHVuaBNRbjtGS3w
         8F0zgcixOIresLOFoZNkJK9P58cJukhNZq+fLfcz5h9ST6zP4UZ/HVpLTWjhT+yPhr5O
         Y6zBnU4XH/5260/45TRjAugCfcu2wk29vQevNvopRjgTRcGy2JVXabenN8GZLkLaEUQH
         3hqiKxr9dQMNpTmUvbKWLPbltE1+HKlesQJ//0mU4abfcRIYF0qTpSUN83M3jkRjw6WD
         5TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=pxm0dsgAzCk9wAwKBKmMz3LOeS/VE9qe1SAYtrlypBA=;
        b=3jkX8WOnOoMXd7k0rgML9GwsONB/vI5iqg6MmM0pgcTG7IxBODiY+70PTruzYms70f
         Of7q5pZf7ojhkHB+8THqDTv8NMjddLf9TDAo0SwkvXFcewTnWhqdsKcV5VPKA06wxN7k
         BxVVAqCA/NWfFBSHqLJwmsplWTwBI0ZzRX4I+n0xXDCEngnFqYIoOWIsnA2NZCxo/MRF
         6+DWhzZQ86xaa/B1oclnfP7TNebW512A2UkqHEwKI3Rb5squzdLse0xpfA1cNv80VKXe
         Uth/knRhGswd9BcbU9H4Aj4wjIbhBZoGO60ddRlo9lEfVlz61dc8QRjinkgtqARbTypB
         fo4Q==
X-Gm-Message-State: AOAM530GcY/ZdCqRAqPohH0DcEW0KAtP1M6SU9IcreEamn6CcYhy967Z
	Q1onGOgibZlq5AeHYPuLgl6E7sOM/rP05WkwlRyKda/dCCI=
X-Google-Smtp-Source: ABdhPJy/p9fncl/LEwhE6sDnWd/s+uLnpHPJ7Tocs2+EasCm6NRgQLCNgd4Lyaopwbso3CWF1x/s8vSTeJPisL5XcJE=
X-Received: by 2002:a05:6870:2103:b0:e9:6d65:4abb with SMTP id
 f3-20020a056870210300b000e96d654abbmr1977862oae.261.1651253422597; Fri, 29
 Apr 2022 10:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6851:2e1a:b0:2ec:a8a6:e1cf with HTTP; Fri, 29 Apr 2022
 10:30:22 -0700 (PDT)
In-Reply-To: <CAOzgRdZoovCTQHgoH+nKJEhwe28ZUmBJusFhptNuq_nTJhQGwQ@mail.gmail.com>
References: <CAOzgRdYrcfN-erA_EbD9+ci1WYvrEr=bS-5=Td0YZeeuGvqMEw@mail.gmail.com>
 <CAOzgRdZoovCTQHgoH+nKJEhwe28ZUmBJusFhptNuq_nTJhQGwQ@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Sat, 30 Apr 2022 01:30:22 +0800
Message-ID: <CAOzgRdYybkaBja-eBucy7YvJFXYSodXvKw2L15arxmo-1KhPqQ@mail.gmail.com>
Subject: Re: ntfs3 slow than ntfs-3g
To: ntfs3@lists.linux.dev, almaz.alexandrovich@paragon-software.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

700MB/S is sync speed, 1G/S is direct speed,
may be ntfs3 not support io direct.

2022-04-30 1:05 GMT+08:00, youling 257 <youling257@gmail.com>:
> 700MB/S is USB Mass Storage device speed, 1GB/S is usb uas speed,
> may be ntfs3 not support uas.
>
> 2022-04-30 1:03 GMT+08:00, youling 257 <youling257@gmail.com>:
>> [ 3193.462354] usb 4-1: new SuperSpeed Plus Gen 2x2 USB device number
>> 3 using xhci_hcd
>>                                                        [ 3193.501223]
>> scsi host9: uas
>> [ 3194.397127] scsi 9:0:0:0: Direct-Access     ASMT     ASM236X NVME
>>   0    PQ: 0 ANSI: 6
>>                                                       [ 3194.537445]
>> sd 9:0:0:0: Attached scsi generic sg0 type 0
>> [ 3194.537841] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks:
>> (256 GB/238 GiB)
>>                                                          [
>> 3194.537913] sd 9:0:0:0: [sda] Write Protect is off
>> [ 3194.537916] sd 9:0:0:0: [sda] Mode Sense: 43 00 00 00
>>
>>                                                       [ 3194.538036]
>> sd 9:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't
>> support DPO or FUA
>> [ 3194.538565] sd 9:0:0:0: [sda] Optimal transfer size 2097152 bytes
>>
>>                                                       [ 3194.563302]
>> sda: sda1 sda2 sda3
>> [ 3194.564255] sd 9:0:0:0: [sda] Attached SCSI disk
>>
>> in my test, ntfs3 slow than ntfs-3g.
>>
>> ntfs-3g /dev/block/sda3 /1
>>
>> /dev/block/sda3 on /1 type fuseblk
>> (rw,relatime,user_id=3D0,group_id=3D0,allow_other,blksize=3D4096)
>> root@localhost:~# cd /1
>> root@localhost:/1# time dd if=3D/dev/zero of=3Dtestw.dbf bs=3D1M count=
=3D1000
>> oflag=3Ddirect status=3Dprogress
>> 1018167296=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C971 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1 s=EF=BC=8C1.0 GB/s
>> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E8=AF=BB=E5=85=A5
>> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E5=86=99=E5=87=BA
>> 1048576000=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C1000 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1.03421 s=EF=BC=8C1.0 GB/s
>>
>>
>>
>> mount -t ntfs3 /dev/block/sda3 /1
>>
>> /dev/block/sda3 on /1 type ntfs3 (rw,relatime,uid=3D0,gid=3D0,iocharset=
=3Dutf8)
>> root@localhost:/# cd /1
>> root@localhost:/1# time dd if=3D/dev/zero of=3Dtestw.dbf bs=3D1M count=
=3D1000
>> oflag=3Ddirect status=3Dprogress
>> 707788800=E5=AD=97=E8=8A=82=EF=BC=88708 MB=EF=BC=8C675 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1 s=EF=BC=8C707 MB/s
>> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E8=AF=BB=E5=85=A5
>> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E5=86=99=E5=87=BA
>> 1048576000=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C1000 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1.50322 s=EF=BC=8C698 MB/s
>>
>
