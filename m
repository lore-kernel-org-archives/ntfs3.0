Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C661851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 17:03:24 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-e5e433d66dso8713466fac.5
        for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=CYAe+5gliQMnqvwlhaNog4k7Nh5pIJ9rg3MT1olZ8E8=;
        b=WBACzcGAxqJkaALh1Yt+2CvKua0qe+WR/UIdARBfQCNDvhE9wNw1SB36ON31kaeyHr
         bPtNak3j2s09iRSsg+N8TFV8oT2xC00N6lPwFgBapY7pKYfhmRGwbvJIZlv41DP3EXgD
         PSvKNk8Nc7JJPnrb/0jEIRii4OLrEqbdepTT/lmDOM33Oo2aSnDXrMYIt3kTqYVq5SDP
         Fcy7/LxoIw/IvLbjuaWKgbbRka9MdmKJAeaS2RdYRUC8Z/H9WH3mW4vxiBdS/YFzS97z
         TZcM2wPo9xTixcipP0d4Oow3J8phgqOHYfzdTEi78/ncq1n6fc1la4F4kg/PRyaqSMNe
         TYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=CYAe+5gliQMnqvwlhaNog4k7Nh5pIJ9rg3MT1olZ8E8=;
        b=o4TGfc/XxfYLzeOzQ0UkAgYhYCQdi91ne18ih2xcqIjKLbl0c2t/l5RqxToiCMkGFo
         eADxviCGKTeSi/dYYshlvmZArlaKjHooznz3UdBeMyjAm+XNErsc/p1m2u83fpvkeZbh
         C/sfFyJKAyp62QF0CuvjJKLVV4OXwYiHfCZuidvE4ET6Tf4kyLzYTbw69jVp5AOsL9I4
         T58Me4ihtj39Mxf+yXZvvoP08NymQwGhch6lEmm+T53Fe2AN28liAA9QHg2zeZi5izsK
         7pwpBLsCuM4Zq7XFZH2N5Xl3Bv+gu+6AOKC5MjufH9CsJ77IoYOtQ4dUsLR1o4biGlnO
         GWsg==
X-Gm-Message-State: AOAM531etFJFIAcfI0faBAX6tu3EfImFG6ljgYGEj5Ua9xCU4IVvCA0j
	OGMAxQlB7RACnBeef3YbYrgFiXbMBmTnDA38/8FlGl3nNbY=
X-Google-Smtp-Source: ABdhPJxQKZZr0Ex7tyiHfeevkDt0y2p0YP0IiJ3RBl2SYIrsCguXilaCYd2NWQ6980d5NnsRevVMBLYqO9hYpK69Ng8=
X-Received: by 2002:a05:6870:2103:b0:e9:6d65:4abb with SMTP id
 f3-20020a056870210300b000e96d654abbmr1917020oae.261.1651251803526; Fri, 29
 Apr 2022 10:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6851:2e1a:b0:2ec:a8a6:e1cf with HTTP; Fri, 29 Apr 2022
 10:03:23 -0700 (PDT)
From: youling 257 <youling257@gmail.com>
Date: Sat, 30 Apr 2022 01:03:23 +0800
Message-ID: <CAOzgRdYrcfN-erA_EbD9+ci1WYvrEr=bS-5=Td0YZeeuGvqMEw@mail.gmail.com>
Subject: ntfs3 slow than ntfs-3g
To: ntfs3@lists.linux.dev, almaz.alexandrovich@paragon-software.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ 3193.462354] usb 4-1: new SuperSpeed Plus Gen 2x2 USB device number
3 using xhci_hcd
                                                       [ 3193.501223]
scsi host9: uas
[ 3194.397127] scsi 9:0:0:0: Direct-Access     ASMT     ASM236X NVME
  0    PQ: 0 ANSI: 6
                                                      [ 3194.537445]
sd 9:0:0:0: Attached scsi generic sg0 type 0
[ 3194.537841] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks:
(256 GB/238 GiB)
                                                         [
3194.537913] sd 9:0:0:0: [sda] Write Protect is off
[ 3194.537916] sd 9:0:0:0: [sda] Mode Sense: 43 00 00 00

                                                      [ 3194.538036]
sd 9:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't
support DPO or FUA
[ 3194.538565] sd 9:0:0:0: [sda] Optimal transfer size 2097152 bytes

                                                      [ 3194.563302]
sda: sda1 sda2 sda3
[ 3194.564255] sd 9:0:0:0: [sda] Attached SCSI disk

in my test, ntfs3 slow than ntfs-3g.

ntfs-3g /dev/block/sda3 /1

/dev/block/sda3 on /1 type fuseblk
(rw,relatime,user_id=3D0,group_id=3D0,allow_other,blksize=3D4096)
root@localhost:~# cd /1
root@localhost:/1# time dd if=3D/dev/zero of=3Dtestw.dbf bs=3D1M count=3D10=
00
oflag=3Ddirect status=3Dprogress
1018167296=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C971 MiB=EF=BC=89=E5=B7=
=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1 s=EF=BC=8C1.0 GB/s
=E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E8=AF=BB=E5=85=A5
=E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E5=86=99=E5=87=BA
1048576000=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C1000 MiB=EF=BC=89=E5=B7=
=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1.03421 s=EF=BC=8C1.0 GB/s



mount -t ntfs3 /dev/block/sda3 /1

/dev/block/sda3 on /1 type ntfs3 (rw,relatime,uid=3D0,gid=3D0,iocharset=3Du=
tf8)
root@localhost:/# cd /1
root@localhost:/1# time dd if=3D/dev/zero of=3Dtestw.dbf bs=3D1M count=3D10=
00
oflag=3Ddirect status=3Dprogress
707788800=E5=AD=97=E8=8A=82=EF=BC=88708 MB=EF=BC=8C675 MiB=EF=BC=89=E5=B7=
=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1 s=EF=BC=8C707 MB/s
=E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E8=AF=BB=E5=85=A5
=E8=AE=B0=E5=BD=95=E4=BA=861000+0 =E7=9A=84=E5=86=99=E5=87=BA
1048576000=E5=AD=97=E8=8A=82=EF=BC=881.0 GB=EF=BC=8C1000 MiB=EF=BC=89=E5=B7=
=B2=E5=A4=8D=E5=88=B6=EF=BC=8C1.50322 s=EF=BC=8C698 MB/s
