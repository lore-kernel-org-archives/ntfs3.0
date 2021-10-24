Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08olkn2078.outbound.protection.outlook.com [40.92.46.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F02C8B
	for <ntfs3@lists.linux.dev>; Sun, 24 Oct 2021 11:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1yZmoGt2KMTvz+Z/o/ehns2f3aH7sutdDHC9/DmQcoR9Xz4n5VegtUcC/dJ0AOmyGC13noXqI+ZM7H2CkTv9MLgYJL/lvuladeGFvaZ9IvQ7cp9Gc91NHttGYxznunGY+xbfMmmVDVvVuINX2Ch7UFTtDljoGJIWSss17+WObDxVhIZxniCZ/WWVDe0BT/PBUkWVZqLGKBDyG5wqk2WpBT1c0PfN+qYpvmqWcwYzm3bBnfy9SpOSf9kvbHf0bp0b7t+w+BODBN6c5PjDwFGYKgAf14NHXhS5C5mF28JO13kS2LFF96LOKGabcBtdpwvpiTmz+CIa6riIDt/TtbcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuevuEi29fdpPK0003O6AlMrYwNNK76+Yu3UlICYFrQ=;
 b=m5nDUemNNqE3HRLbkL1eCLNBlxAx4/pGoeSiiDQGy9EYNJR4KZx4Gs+KXEqEaPyMtBY0fGeVqB1mBPmaxmJwWuSuxTMWqnCRUu9QbevcAWiqRxrCkNKlYqwkRDTrzaYnUdVFlur3Sc8/GtzQaflLdQN1FSTf2H98lMA7ovKWo/7zu9CjLZIm9sY4JJqoyzZQJsdguuf+elhisCr6JkGjDBIZUx+A4+FO17s9BrEREQI9LgqJ+cOUFpgph7jprdk7AgCGCvQrJgSUAh3qAYLEoI+GFKuvs1t1DRbH2ZnyUj8y0+mvQZbIqLk+yJun2lyf936zxp+kWI7g88/AEQDOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuevuEi29fdpPK0003O6AlMrYwNNK76+Yu3UlICYFrQ=;
 b=mjQgsZmlvaZpBn2U/vpKcR7JTfDXusgswVA7EUghhOJ9ddbvFR4izjB4QK4hzH9NulCmCPDFa2VBkRjh+Ukn4IPHiLmSjtUdQx1om6M1JPdDokku90UZBKrtzQaDxh13I1PTUTeGDKZaDtfidF8E3YEle9dL5K6Xna1/Dp++BVDkW5SdobPqpbcLPEDc8S0vBkWvJ8ebHKPkhaXlKAWAt8EyOgBhBTYOl1u3vIeWCExgS+4dMStOyzTn4U0qp8hA6lhEYuGZidu/lJhdaTlxgAj7aTnTKJBbe7Dkh9zgiF2kzeKI4VsecBvjfc7pv87VXPbZ8NvRdsKlR/jyMafUNQ==
Received: from DM6PR04MB4938.namprd04.prod.outlook.com (2603:10b6:5:fc::23) by
 DM6PR04MB7131.namprd04.prod.outlook.com (2603:10b6:5:246::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Sun, 24 Oct 2021 11:13:08 +0000
Received: from DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::1c82:324a:f152:a352]) by DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::1c82:324a:f152:a352%7]) with mapi id 15.20.4628.020; Sun, 24 Oct 2021
 11:13:08 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: Kari Argillander <kari.argillander@gmail.com>
CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Thread-Topic: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Thread-Index: AQHXx/QwXfS3myGGiU2JZpL3DfCDBKvhytJfgAAtK4CAAAgMOA==
Date: Sun, 24 Oct 2021 11:13:08 +0000
Message-ID:
 <DM6PR04MB493871E63529A6F0600090FCDA829@DM6PR04MB4938.namprd04.prod.outlook.com>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
 <aaf41f35-b702-b391-1cff-de4688b3bb65@paragon-software.com>
 <20211023095559.ythxb2z2ptdrlr5s@kari-VirtualBox>
 <DM6PR04MB49385E765EF33EF4E0B5FF32DA829@DM6PR04MB4938.namprd04.prod.outlook.com>
 <20211024104315.qb3fb6rxbibpk23g@kari-VirtualBox>
In-Reply-To: <20211024104315.qb3fb6rxbibpk23g@kari-VirtualBox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 41a65987-8f6e-5f0a-a1ff-619c714f5472
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [TST2w0Mw6ZNLFcNfMhUgUgOT910bDThdYacS0coB01Q=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88fbcf81-e696-4bdb-e07b-08d996df427e
x-ms-traffictypediagnostic: DM6PR04MB7131:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vrFrBuTE2dUn9/1XfTuQ2GpQhgpK1x7UU+5Xv6c3pJD7PLqbFTQgwmj4CUIPzuMDVXAW3aqu0AGhbyEb5DYbINb90CsEJdYj6LdqXACA2BHSIjDHnf7gUyr6/1sWNDXsHuz7arsE4sWSRBKra6V8IafLo7s+tgdMV7eT9yAuo8XnKcnOCNvLIvBabY3uH+AW0F0sSWxDmuE+DuY05Kygb+IeIIXZrQXbHRJWYkh7lbWDm4rGiAhtv0+dZ7tkIIR4mZVS3nAj90bxN1Rezjq0vZ6aQnTU6PhN8dTxW/nBK+6JeTKS+EpRgbiRvKFW0NFTjeOft3BMyo821Y5di0iQDiIUaC7vaBdTGIin0Akr2D2Bbc1PCU4sk+LD8I2HW4I/PNIverxIeQicu2nO2UUgwVFbLjF095yp7HsvMNZP0sC20RYTRj5vpjh+A9UycQ9SzbLwSqWdBpZWHrXuS5zLQlMm+hvyjw80mqzi8lXxYM3Vd3gSxbrAnBZElX0Y++amDBjGZk22XkULJry6mwVi7I7Pwu+UdPhxpd+/EP8+LGTitV2etF1yqcsdfsKpBjXJ4T6/NO1smBbbCJpIvsB8tg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 CkMtDIx+q5L2y2PSeX7QCmsitlDinOzge0mrbYclOFROIk0f8G3RXp8L9Jzk3iRsEptN1U/flbH4UCy5Fqz9HkDs8fjHJrLK2SQ2CVbHx+VZuKPGhkfaMFGKayaeZxFwQ/B/2bo1pXFfwvYax5HxuQDSTaUHQHjcIAm0uddhAUwJ5yqwlx3jH7aoAxi4dn8E0cBtHY5kD9pKJY/H4VWt8ZAwXXcjQ8deo7zHWgDo/NN5XjNoEC7uOYEte4pwSHeksjAni9wM09wptEZh/GluephviRpHYXovIj9RYXOilRZ3fp4kDtsoYhHQYT16nL2z7uZCVB0lX4J3AylPuCQFNNxBIMiZWynYg4hI0RMlKqf8ezeBt/nJj1BdeqdqVEtI9qpxKH50MfIu8LcnUmA051nLrn4OZ+45r2wQoobgFSqVplquSZ27x72fYCyNFNZcsa8jw2Vp+JH8FXTcUErWnD4nIw8sVujmysMJSCEwi2fXJFdNQHDMMolVvndgEOfimCGFKHokwH4cTovinN5hg9By4C499hBDKANH5a06lFd2emqrJCPkbVSvXwRGQa0mhYYn/du1HRtsEN3xsPm255ZS/wfxPg1CkqdRZR+Ke15ZBj7r0zhHSbZQ+EIoFYOyR9RdlINBX8LuuZnQzXQPxyPoC7f/IoNeZ5PASKSeu0ZlOaKIEY8N2NKJWoOWuz77b5NFMT0OPcp6rD7/jDWCzQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-529c7.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4938.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fbcf81-e696-4bdb-e07b-08d996df427e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2021 11:13:08.6181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7131

Sure, okay to tag, no problem, happy to have helped. -Gana=0A=
=0A=
=0A=
From: Kari Argillander <kari.argillander@gmail.com>=0A=
Sent: Sunday, October 24, 2021 6:43 AM=0A=
To: Ganapathi Kamath <hgkamath@hotmail.com>=0A=
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>; ntfs3@li=
sts.linux.dev <ntfs3@lists.linux.dev>; linux-kernel@vger.kernel.org <linux-=
kernel@vger.kernel.org>; linux-fsdevel@vger.kernel.org <linux-fsdevel@vger.=
kernel.org>=0A=
Subject: Re: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option preallo=
c enabled =0A=
=A0=0A=
On Sun, Oct 24, 2021 at 08:35:57AM +0000, Ganapathi Kamath wrote:=0A=
> Hellom =0A=
> =0A=
> While compiling, first time around, I got the below.=0A=
=0A=
Yeah. Patch was meant for ntfs3/master...=0A=
=0A=
> fs/ntfs3/file.c: In function 'ntfs_truncate': =0A=
> fs/ntfs3/file.c:498:60: error: invalid type argument of '->' (have 'struc=
t ntfs_mount_options')=0A=
> =A0 498 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &new_va=
lid, ni->mi.sbi->options->prealloc, NULL);=0A=
> =A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^~=0A=
> make[2]: *** [scripts/Makefile.build:277: fs/ntfs3/file.o] Error 1=0A=
> make[1]: *** [scripts/Makefile.build:540: fs/ntfs3] Error 2=0A=
> =0A=
> So, in the file=0A=
> =A0=A0=A0 fs/ntfs3/file.c=0A=
> I changed=A0=0A=
> =A0=A0=A0 ni->mi.sbi->options->prealloc=0A=
> to=0A=
> =A0=A0=A0 ni->mi.sbi->options.prealloc=0A=
=0A=
but with your change it also applies to rc3. Your change was correct and=0A=
it was totally ok to test top of rc3.=0A=
=0A=
> I don't really follow/understand the code, to understand what exactly=0A=
> the logic is, except that you are trying to set boolean=0A=
> 'keep_prealloc' call-argument for attr_set_size() by using the=0A=
> ntfs_mount_option bit-field 'prealloc' which is to "Preallocate space=0A=
> when file is growing", prototyped in the file fs/ntfs3/ntfs_fs.h=0A=
> =0A=
> * Built new 5.15.0-0.rc3.20211001git4de593fb965f.30.fc35.x86_64=0A=
> kernel. (4 hrs on my machine)=0A=
=0A=
I do not know if you used -j flag when making. Just if you did not know=0A=
about it use:=0A=
=0A=
=A0 make -j8=0A=
=0A=
This will example use 8 threads for compiling. You choose number based=0A=
on how many threads you have in your processor.=0A=
=0A=
> * I was able to include patch into rpmbuild of kernel src patch, with=0A=
> aforementioned correction *=A0first reconfirmed/verified bug on old=0A=
> kernel=0A=
> *=A0installed newly built kernel=0A=
> * attempt reproduction no success meaning bug not present on new=0A=
> kernel, patch/fix makes file size on overwrite to be as expected.=0A=
> =0A=
> note, I am not an expert, and as a user, I don't know 100% what=0A=
> correct behavior should be, only what seems reasonable expected=0A=
> behavior, But=A0 you are experts, so please excuse me for reiterating=0A=
> what you know. NTFS is a filesystem that was designed by microsoft for=0A=
> windows, and the way its fs-driver must update is so that on-disk=0A=
> structures is suitable for windows in-kernel structures. A kernel=0A=
> driver for linux, only adapts on disk-ntfs structures to something=0A=
> suitable for linux in-kernel structures, but must update the on disk=0A=
> structures the way Windows expects/designed it to.=0A=
=0A=
Ntfs file structure allows actually many things which even Windows does=0A=
not understand. This is new driver and it will be evolving that user can=0A=
decide what he wants. We will also have to define good defaults so that=0A=
user get good experience.=0A=
=0A=
> So if you defended old behavior, I wouldn't know.=A0 So its your call,=0A=
> to decide if it is a bug, and whether your patch fixes.=A0 On my side,=0A=
> my machine is one I work on. patch seems to fix claimed bug. So I hope=0A=
> there is no side effect, nothing corrupts or becomes unstable. =0A=
=0A=
This was bug. Thanks for reporting and testing it.=A0 We really appriciate=
=0A=
it. This is new driver and there will be bugs so early users who report=0A=
bugs and are even willing to test patches are gold mine for us.=0A=
=0A=
We will also add tags to patch:=0A=
Reported-by: Ganapathi Kamath <hgkamath@hotmail.com>=0A=
Tested-by: Ganapathi Kamath <hgkamath@hotmail.com>=0A=
=0A=
if it ok to you. This way if you report new bugs to kernel people will=0A=
know you are good reporter as you have also tested what you have=0A=
reported. If you wanna know more about these tags see [1].=0A=
=0A=
[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes=0A=
=0A=
=A0 Argillander=0A=
=0A=
> That was fast fix. congrats. =0A=
> =0A=
> Log:=0A=
> [root@sirius gana]#=0A=
> [root@sirius gana]# mount -t ntfs3 /dev/sda17 /mnt/a17/=0A=
> [root@sirius gana]#=0A=
> [root@sirius gana]# rm -f /mnt/a17/test1.bin /mnt/a17/test2.bin=0A=
> [root@sirius gana]# dd if=3D/dev/zero of=3D/mnt/a17/test2.bin bs=3D1M cou=
nt=3D3000=0A=
> 3000+0 records in=0A=
> 3000+0 records out=0A=
> 3145728000 bytes (3.1 GB, 2.9 GiB) copied, 5.40015 s, 583 MB/s=0A=
> [root@sirius gana]# dd if=3D/dev/zero of=3D/mnt/a17/test1.bin bs=3D1M cou=
nt=3D6000=0A=
> 6000+0 records in=0A=
> 6000+0 records out=0A=
> 6291456000 bytes (6.3 GB, 5.9 GiB) copied, 16.1809 s, 389 MB/s=0A=
> [root@sirius gana]# ls -ls /mnt/a17/test1.bin /mnt/a17/test2.bin=0A=
> 6144000 -rw-r--r--. 1 root root 6291456000 Oct 24 13:42 /mnt/a17/test1.bi=
n=0A=
> 3072000 -rw-r--r--. 1 root root 3145728000 Oct 24 13:41 /mnt/a17/test2.bi=
n=0A=
> [root@sirius gana]# cp /mnt/a17/test2.bin /mnt/a17/test1.bin=0A=
> cp: overwrite '/mnt/a17/test1.bin'? y=0A=
> [root@sirius gana]# ls -ls /mnt/a17/test1.bin /mnt/a17/test2.bin=0A=
> 3072000 -rw-r--r--. 1 root root 3145728000 Oct 24 13:42 /mnt/a17/test1.bi=
n=0A=
> 3072000 -rw-r--r--. 1 root root 3145728000 Oct 24 13:41 /mnt/a17/test2.bi=
n=0A=
> [root@sirius gana]#=A0 stat /mnt/a17/test1.bin=0A=
>=A0=A0 File: /mnt/a17/test1.bin=0A=
>=A0=A0 Size: 3145728000=A0=A0=A0=A0=A0 Blocks: 6144000=A0=A0=A0 IO Block: =
4096=A0=A0 regular file=0A=
> Device: 10301h/66305d=A0=A0 Inode: 44=A0=A0=A0=A0=A0=A0=A0=A0=A0 Links: 1=
=0A=
> Access: (0644/-rw-r--r--)=A0 Uid: (=A0=A0=A0 0/=A0=A0=A0 root)=A0=A0 Gid:=
 (=A0=A0=A0 0/=A0=A0=A0 root)=0A=
> Context: system_u:object_r:unlabeled_t:s0=0A=
> Access: 2021-10-24 13:41:59.265503300 +0530=0A=
> Modify: 2021-10-24 13:42:44.738904000 +0530=0A=
> Change: 2021-10-24 13:42:44.738904000 +0530=0A=
>=A0 Birth: 2021-10-24 13:41:59.265503300 +0530=0A=
> [root@sirius gana]#=A0 stat /mnt/a17/test2.bin=0A=
>=A0=A0 File: /mnt/a17/test2.bin=0A=
>=A0=A0 Size: 3145728000=A0=A0=A0=A0=A0 Blocks: 6144000=A0=A0=A0 IO Block: =
4096=A0=A0 regular file=0A=
> Device: 10301h/66305d=A0=A0 Inode: 43=A0=A0=A0=A0=A0=A0=A0=A0=A0 Links: 1=
=0A=
> Access: (0644/-rw-r--r--)=A0 Uid: (=A0=A0=A0 0/=A0=A0=A0 root)=A0=A0 Gid:=
 (=A0=A0=A0 0/=A0=A0=A0 root)=0A=
> Context: system_u:object_r:unlabeled_t:s0=0A=
> Access: 2021-10-24 13:42:40.610776900 +0530=0A=
> Modify: 2021-10-24 13:41:52.684315600 +0530=0A=
> Change: 2021-10-24 13:41:52.684315600 +0530=0A=
>=A0 Birth: 2021-10-24 13:41:47.284266100 +0530=
