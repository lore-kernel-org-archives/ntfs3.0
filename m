Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0D1851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 17:05:58 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id y63so9141059oia.7
        for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=meKqzQ+COpVn/YgeTj0z1COcKoPaIYm5nnEbjdOIuxQ=;
        b=ajckROsEeKey3Y0Rj2QCdE1Rmdq6u0QSk/CYDXOYwBnLIpEHpCdaZMXIwQyT8KdZ6J
         3WaB7I6sQQprtUYCvSRXZIDLE3Z2ukW6RvO6Qo2PsFuQjPOh6s/osdGZzcQM3hlqztgO
         5ntrpgkRtGTtM21MAULD/jxxJbAIeH8sx0O8E3BKVoO+VYfgCr+XU9sMjRcX+IxOPcAG
         MkJlU8K6mWRVeb4lFYJjDLOYlrLMuCyodKZUd6WWXPugz4NawcPWRDLfInj3adp4wakE
         2gTKzCbfZdy2YdGa3YfDRZ89dQ75Bozqw9pyzHaGLEpKL7E/mrHWJmnbhKS/YcK0Cn/f
         HcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=meKqzQ+COpVn/YgeTj0z1COcKoPaIYm5nnEbjdOIuxQ=;
        b=ztpjUm7pKTs85nhgqqnPBtTqecrZiH9WK1UakYN5WT5hlPGX1d0X2s1Z4spmJ+OCJ4
         toIrQ8kR9Xg8XcqIkHQRWlXOXoO17ecM7P5IZ1V3v5YO0WsPBJSsoVUfR7lSJv25M6pc
         EKwaAqq49V/WLLk0tRFmD168DdIMNYs7wBmEM/RZ6kq2Z4Q9zgWIqs3qlmrcRH77X2wX
         MHZs8L0ix7LC8NJitR9oGWUbzxEmKFrtqtYZZb3oXeHjIySq2NBQzJCKJbOioAPQ0QKL
         IlUNj+HXdCpUXxGBl+kcmBzLuJKGHENvpp6tJjtgTg/ze6q5+bUhs2AMorvSeLZ0vqY6
         qhvw==
X-Gm-Message-State: AOAM532lJ8Ctd5aKQQkwbCKE9D3i/ot47Y6EGRsfAQFzga1IFTGtShEh
	Tq5esJH/5CY0JXj9UQym3y04r/ApjMSXShu9eSfJXOiC/5s=
X-Google-Smtp-Source: ABdhPJyv9k1HSo97nOJBZPK4mGoUkBE0AHCtVQ/sKyWihZoWdD7gfcRBWTLJKFisc+cJ6hy9L31SrNmKNwQPJG2iWxE=
X-Received: by 2002:a54:4f12:0:b0:325:e:49ff with SMTP id e18-20020a544f12000000b00325000e49ffmr2120066oiy.261.1651251957625;
 Fri, 29 Apr 2022 10:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6851:2e1a:b0:2ec:a8a6:e1cf with HTTP; Fri, 29 Apr 2022
 10:05:57 -0700 (PDT)
In-Reply-To: <CAOzgRdYrcfN-erA_EbD9+ci1WYvrEr=bS-5=Td0YZeeuGvqMEw@mail.gmail.com>
References: <CAOzgRdYrcfN-erA_EbD9+ci1WYvrEr=bS-5=Td0YZeeuGvqMEw@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Sat, 30 Apr 2022 01:05:57 +0800
Message-ID: <CAOzgRdZoovCTQHgoH+nKJEhwe28ZUmBJusFhptNuq_nTJhQGwQ@mail.gmail.com>
Subject: Re: ntfs3 slow than ntfs-3g
To: ntfs3@lists.linux.dev, almaz.alexandrovich@paragon-software.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

700MB/S is USB Mass Storage device speed, 1GB/S is usb uas speed,
may be ntfs3 not support uas.

2022-04-30 1:03 GMT+08:00, youling 257 <youling257@gmail.com>:
> [ 3193.462354] usb 4-1: new SuperSpeed Plus Gen 2x2 USB device number
> 3 using xhci_hcd
>                                                        [ 3193.501223]
> scsi host9: uas
> [ 3194.397127] scsi 9:0:0:0: Direct-Access     ASMT     ASM236X NVME
>   0    PQ: 0 ANSI: 6
>                                                       [ 3194.537445]
> sd 9:0:0:0: Attached scsi generic sg0 type 0
> [ 3194.537841] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks:
> (256 GB/238 GiB)
>                                                          [
> 3194.537913] sd 9:0:0:0: [sda] Write Protect is off
> [ 3194.537916] sd 9:0:0:0: [sda] Mode Sense: 43 00 00 00
>
>                                                       [ 3194.538036]
> sd 9:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't
> support DPO or FUA
> [ 3194.538565] sd 9:0:0:0: [sda] Optimal transfer size 2097152 bytes
>
>                                                       [ 3194.563302]
> sda: sda1 sda2 sda3
> [ 3194.564255] sd 9:0:0:0: [sda] Attached SCSI disk
>
> in my test, ntfs3 slow than ntfs-3g.
>
> ntfs-3g /dev/block/sda3 /1
>
> /dev/block/sda3 on /1 type fuseblk
> (rw,relatime,user_id=3D0,group_id=3D0,allow_other,blksize=3D4096)
> root@localhost:~# cd /1
> root@localhost:/1# time dd if=3D/dev/zero of=3Dtestw.dbf bs=3D1M count=3D=
1000
> oflag=3Ddirect status=3Dprogress
> 1018167296=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C971 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1 s=EF=BC=8C1.0 GB/s
> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E8=AF=BB=E5=85=A5
> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E5=86=99=E5=87=BA
> 1048576000=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C1000 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1.03421 s=EF=BC=8C1.0 GB/s
>
>
>
> mount -t ntfs3 /dev/block/sda3 /1
>
> /dev/block/sda3 on /1 type ntfs3 (rw,relatime,uid=3D0,gid=3D0,iocharset=
=3Dutf8)
> root@localhost:/# cd /1
> root@localhost:/1# time dd if=3D/dev/zero of=3Dtestw.dbf bs=3D1M count=3D=
1000
> oflag=3Ddirect status=3Dprogress
> 707788800=E5=AD=97=E8=8A=82=EF=BC=88708 MB=EF=BC=8C675 MiB=EF=BC=89=E5=B7=
=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1 s=EF=BC=8C707 MB/s
> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E8=AF=BB=E5=85=A5
> =E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E5=86=99=E5=87=BA
> 1048576000=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C1000 MiB=EF=BC=89=E5=
=B7=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1.50322 s=EF=BC=8C698 MB/s
>
