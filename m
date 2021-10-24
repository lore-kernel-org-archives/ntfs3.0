Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2089.outbound.protection.outlook.com [40.92.22.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC632C9F
	for <ntfs3@lists.linux.dev>; Sun, 24 Oct 2021 08:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O81ngfrp22O2SZS2EOGgPaqmtXxFLwrgYgmxSbPOCyVtoSLOZW2z49Zlb1zdBSZ9G+l0RpFKkfjFgLeFD72ksNcm7z8FbE/TKbIEb4eQiRliK+nLQQaF57OBlamhtp1IlrEYf7CN4kyux4f5lDzfb4xccLzQS/DPJbBLNg97mvm2OtFGYTDJ/iF6lAcbflnGMEhqUlBcc6jlyPbs1ySv/mveEprvGCbZz5V2yZ69Xp22ZSn8UsdnCWGVa81027DzQaAAs+yKsAXes62qWP5nHf5osIa1CBPbBDDMkk/ZScehFk4SessLywUB65UC1MVIhILTOq8k1eLXnsHP49J31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUD63UEsALGqI0G2JE27gPt+jJVfnBhLsC8PDFmD0vE=;
 b=WaEVutSbjqThBiJYEUS2yuOLtoaIUtmRsZ4sU/E+relTWrtR57Jaj23a87WLH8P9cLbi6fYOg3TTBbu37AkYNC9jEmMQQY/dF9OWq7LBFyguO13HHRvL5sA+6id0WpwyMIXd7EIeHnYgfqLITF71e6DFzBcQcvBpuAsWPeuWK6jxGw9/99cR+sj4kUwSLRLcF9nz8ORR4J10kyIFAyPqi3Bv+64V25SCUeCRXDMQhLER3KFGIcs6lUdhI/4tUncwkH8jRT+P+OyKCEWAtNF41TE2yrQIbhK69ZV5ohcEmUVJb1SFCzthiLYoLpwu2BlBHsfZ0ZJrndr8pbMPglrOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUD63UEsALGqI0G2JE27gPt+jJVfnBhLsC8PDFmD0vE=;
 b=hI8JcuS/5O1SyGmuNxgku4+M2rxNlGN6v4rq5XSL/PDc+BXzIhFJxPqktJCsvOOqCIKaQcq8rxWVwGtvHOqq9Md9jgi2ALmh9hATLy9mDWIfsNGwiq1rX+ooQSM8+UjUmTTMZm/wqOg/7OXYq97Qh/REklh2LHh4IVk5vLe3xsbTlbaeR+cx1dZJOnAeJkiXXmvsbpxzf6vRbc1QzZjFxBusQDtKymIl0rIYmJ6ay6QoqJBZ0Qbh2t87aFeGuPby5il3qQDrEL8kS6+E/CLg92m9rz0V8rxfHrNjt/MS7hpV2znUQQphY6D30udJCSNBUW3vltXxqS3ZhsEP5DmGIw==
Received: from DM6PR04MB4938.namprd04.prod.outlook.com (2603:10b6:5:fc::23) by
 DM6PR04MB4555.namprd04.prod.outlook.com (2603:10b6:5:2c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.20; Sun, 24 Oct 2021 08:35:57 +0000
Received: from DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::1c82:324a:f152:a352]) by DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::1c82:324a:f152:a352%7]) with mapi id 15.20.4628.020; Sun, 24 Oct 2021
 08:35:57 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: Kari Argillander <kari.argillander@gmail.com>, Konstantin Komarov
	<almaz.alexandrovich@paragon-software.com>
CC: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Thread-Topic: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Thread-Index: AQHXx/QwXfS3myGGiU2JZpL3DfCDBKvhytJf
Date: Sun, 24 Oct 2021 08:35:57 +0000
Message-ID:
 <DM6PR04MB49385E765EF33EF4E0B5FF32DA829@DM6PR04MB4938.namprd04.prod.outlook.com>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
 <aaf41f35-b702-b391-1cff-de4688b3bb65@paragon-software.com>
 <20211023095559.ythxb2z2ptdrlr5s@kari-VirtualBox>
In-Reply-To: <20211023095559.ythxb2z2ptdrlr5s@kari-VirtualBox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 1bd63dc8-03eb-1ec2-b7fe-b050d057cd25
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [n4xxooH4sV2UWnP7K2wvNz9lmR4th1aAvyBBDOZBr3w=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d44ca8f-2020-4465-b6cc-08d996c94d1d
x-ms-traffictypediagnostic: DM6PR04MB4555:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FZo83FGYdO7b2AuLDZMOqb5a6mnKzbCXN+o9IMfj1w1yXAnpq7f2BYLbnpyYHFUj1oqkW4RTRy55/BZzXA9MgINOYOibjDI1P06w+e7AijbDZIpP7gzyEhBmYN6UTzvMJHrh+sLNGskCkjHJvoyJenwD2Q39UwSPlMv0YzMh3U2qfb3T/giK+A2wFCsZmklAcqOkCX3t2WmG0VX2c8fajhuB2y/eH/FCeaxbnzg4so/GMBBmgeaxUbVIVbWt2/7SrqBiN0NOPT1GC2QQ0glr59LPFxGrKcrSRk0JZ9rOip7jMtJUzm6f8ctgXz5EYsbEQWQ2lTXqAVW0aFltOkjbYTKwaBWsKefB5tc1qtAksVOQPdw48kPL4eoQZngpEoKlS1iitjO0Ghsv+8EiQOBA44agejbI6ad5NFd3VevIGmXD4/I6qg6GJedD1aypQk9TAKrJToNL3UoU/FyQR/usp2Wpmhq64iQMe1wt8kxgRsC7aiGGbCfqcY6V+nmpeYiKcu5blsjiTlrC/410Ujl3BCa5RS590Qke//IhwVqmYkQ+1j1rmMCaUO0b/gUUaopn+CrKtLDP0KhWn0jtgxkVBw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 cpbmGIlYTVbtE1PgVSKXaBDZ1q9cVl+kJy0le0DLr9MtExkxXsz0ZWV00Kj0ceSwvPvtAhqCXYpt2COpSfRNRf2VqbnFkmEe17etPl7p9Qb9qz9iU3dMtwr+ZMjaiOLHF2RY1i1kMPl3K9cVT9VpVg4pFY9gS4lAoHUiyYNcjN/DNh5dgNY2u5lXbPDdwlfz8JT7JySggt+irS1Yqc7GcbrBEGZv2FduFTzsT9cdyI7tXJXV+rZ9vKitDZsSAD+e/i71vcSEPfTYTxldSSmcCkixDS4NKYHs8y7xy0TQ2z+djKM0r+j6+MHbwojEDgvIofWSKT1wPI+67YMpK1AuSVfqvxry1mZ6UlOlJWI4dGisSlHaqakUi70QZXFxtJnfp19geqXSg08wsGtYPnFUvYvzP3EivZJSOwykU2Yg2RzN9LVqCUIgIXw39ctfW4ps49oob5ohDxynLEjyz4ZrVMr/Fkk1+japlkbXpcbCFLFoW2DwOu/c7SJ2LPnwHW30t3tN+EdZHMge/y1jnDxwQaSwmqUIgNrRqdjE0QAqhczUdBYIypGzfAbAhNU/BY6clTmjjj+dhN0XQKoJptzF9ALVG2d5yOrX6LWKO2n9dY3pBO9s+HAcmzqILBIaHdXhd5sWY4yHOSnpGasCn7OeLnECNzNc7+0uYl0PHtk93IxfiPsHvX5u0WnTGaPu+LqQddwVsIU8Btidj5xgcpOYIg==
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d44ca8f-2020-4465-b6cc-08d996c94d1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2021 08:35:57.4772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4555

Hellom =0A=
=0A=
While compiling, first time around, I got the below.=0A=
=0A=
fs/ntfs3/file.c: In function 'ntfs_truncate': =0A=
fs/ntfs3/file.c:498:60: error: invalid type argument of '->' (have 'struct =
ntfs_mount_options')=0A=
=A0 498 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &new_vali=
d, ni->mi.sbi->options->prealloc, NULL);=0A=
=A0 =A0 =A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^~=0A=
make[2]: *** [scripts/Makefile.build:277: fs/ntfs3/file.o] Error 1=0A=
make[1]: *** [scripts/Makefile.build:540: fs/ntfs3] Error 2=0A=
=0A=
So, in the file=0A=
=A0=A0=A0 fs/ntfs3/file.c=0A=
I changed=A0=0A=
=A0=A0=A0 ni->mi.sbi->options->prealloc=0A=
to=0A=
=A0=A0=A0 ni->mi.sbi->options.prealloc=0A=
=0A=
I don't really follow/understand the code, to understand what exactly the l=
ogic is, except that you are trying to set =0A=
boolean 'keep_prealloc' call-argument for attr_set_size() by using the ntfs=
_mount_option bit-field 'prealloc' which is to "Preallocate space when file=
 is growing", prototyped in the file fs/ntfs3/ntfs_fs.h=0A=
=0A=
* Built new 5.15.0-0.rc3.20211001git4de593fb965f.30.fc35.x86_64 kernel. (4 =
hrs on my machine)=0A=
* I was able to include patch into rpmbuild of kernel src patch, with afore=
mentioned correction=0A=
*=A0first reconfirmed/verified bug on old kernel=0A=
*=A0installed newly built kernel=0A=
* attempt reproduction no success meaning bug not present on new kernel, pa=
tch/fix makes file size on overwrite to be as expected.=0A=
=0A=
note, I am not an expert, and as a user, I don't know 100% what correct beh=
avior should be, only what seems reasonable expected behavior, But  you are=
 experts, so please excuse me for reiterating what you know. NTFS is a file=
system that was designed by microsoft for windows, and the way its fs-drive=
r must update is so that on-disk structures is suitable for windows in-kern=
el structures. A kernel driver for linux, only adapts on disk-ntfs structur=
es to something suitable for linux in-kernel structures, but must update th=
e on disk structures the way Windows expects/designed it to.=0A=
So if you defended old behavior, I wouldn't know.=0A=
So its your call, to decide if it is a bug, and whether your patch fixes. =
=0A=
On my side, my machine is one I work on. patch seems to fix claimed bug. So=
 I hope there is no side effect, nothing corrupts or becomes unstable. =0A=
=0A=
That was fast fix. congrats. =0A=
=0A=
Log:=0A=
[root@sirius gana]#=0A=
[root@sirius gana]# mount -t ntfs3 /dev/sda17 /mnt/a17/=0A=
[root@sirius gana]#=0A=
[root@sirius gana]# rm -f /mnt/a17/test1.bin /mnt/a17/test2.bin=0A=
[root@sirius gana]# dd if=3D/dev/zero of=3D/mnt/a17/test2.bin bs=3D1M count=
=3D3000=0A=
3000+0 records in=0A=
3000+0 records out=0A=
3145728000 bytes (3.1 GB, 2.9 GiB) copied, 5.40015 s, 583 MB/s=0A=
[root@sirius gana]# dd if=3D/dev/zero of=3D/mnt/a17/test1.bin bs=3D1M count=
=3D6000=0A=
6000+0 records in=0A=
6000+0 records out=0A=
6291456000 bytes (6.3 GB, 5.9 GiB) copied, 16.1809 s, 389 MB/s=0A=
[root@sirius gana]# ls -ls /mnt/a17/test1.bin /mnt/a17/test2.bin=0A=
6144000 -rw-r--r--. 1 root root 6291456000 Oct 24 13:42 /mnt/a17/test1.bin=
=0A=
3072000 -rw-r--r--. 1 root root 3145728000 Oct 24 13:41 /mnt/a17/test2.bin=
=0A=
[root@sirius gana]# cp /mnt/a17/test2.bin /mnt/a17/test1.bin=0A=
cp: overwrite '/mnt/a17/test1.bin'? y=0A=
[root@sirius gana]# ls -ls /mnt/a17/test1.bin /mnt/a17/test2.bin=0A=
3072000 -rw-r--r--. 1 root root 3145728000 Oct 24 13:42 /mnt/a17/test1.bin=
=0A=
3072000 -rw-r--r--. 1 root root 3145728000 Oct 24 13:41 /mnt/a17/test2.bin=
=0A=
[root@sirius gana]#  stat /mnt/a17/test1.bin=0A=
  File: /mnt/a17/test1.bin=0A=
  Size: 3145728000      Blocks: 6144000    IO Block: 4096   regular file=0A=
Device: 10301h/66305d   Inode: 44          Links: 1=0A=
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)=0A=
Context: system_u:object_r:unlabeled_t:s0=0A=
Access: 2021-10-24 13:41:59.265503300 +0530=0A=
Modify: 2021-10-24 13:42:44.738904000 +0530=0A=
Change: 2021-10-24 13:42:44.738904000 +0530=0A=
 Birth: 2021-10-24 13:41:59.265503300 +0530=0A=
[root@sirius gana]#  stat /mnt/a17/test2.bin=0A=
  File: /mnt/a17/test2.bin=0A=
  Size: 3145728000      Blocks: 6144000    IO Block: 4096   regular file=0A=
Device: 10301h/66305d   Inode: 43          Links: 1=0A=
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)=0A=
Context: system_u:object_r:unlabeled_t:s0=0A=
Access: 2021-10-24 13:42:40.610776900 +0530=0A=
Modify: 2021-10-24 13:41:52.684315600 +0530=0A=
Change: 2021-10-24 13:41:52.684315600 +0530=0A=
 Birth: 2021-10-24 13:41:47.284266100 +0530=0A=
=0A=
=0A=
=0A=
From: Kari Argillander <kari.argillander@gmail.com>=0A=
Sent: Saturday, October 23, 2021 5:55 AM=0A=
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>; hgkamath=
@hotmail.com <hgkamath@hotmail.com>=0A=
Cc: ntfs3@lists.linux.dev <ntfs3@lists.linux.dev>; linux-kernel@vger.kernel=
.org <linux-kernel@vger.kernel.org>; linux-fsdevel@vger.kernel.org <linux-f=
sdevel@vger.kernel.org>=0A=
Subject: Re: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option preallo=
c enabled =0A=
=A0=0A=
On Fri, Oct 22, 2021 at 06:54:31PM +0300, Konstantin Komarov wrote:=0A=
> If size of file was reduced, we still kept allocated blocks.=0A=
> This commit makes ntfs3 work as other fs like btrfs.=0A=
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214719=0A=
=0A=
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D214719=0A=
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")=
=0A=
> =0A=
> Reported-by: Ganapathi Kamath=0A=
=0A=
Add <hgkamath@hotmail.com>=0A=
=0A=
I also added to loop here. Ganapathi can you test if this patch fix your=0A=
problem?=0A=
=0A=
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.c=
om>=0A=
> ---=0A=
>=A0 fs/ntfs3/file.c | 2 +-=0A=
>=A0 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c=0A=
> index 43b1451bff53..3ac0482c6880 100644=0A=
> --- a/fs/ntfs3/file.c=0A=
> +++ b/fs/ntfs3/file.c=0A=
> @@ -494,7 +494,7 @@ static int ntfs_truncate(struct inode *inode, loff_t =
new_size)=0A=
>=A0 =0A=
>=A0=A0=A0=A0=A0=A0=A0 down_write(&ni->file.run_lock);=0A=
>=A0=A0=A0=A0=A0=A0=A0 err =3D attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->f=
ile.run, new_size,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 &new_valid, true, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 &new_valid, ni->mi.sbi->options->prealloc, NULL);=0A=
>=A0=A0=A0=A0=A0=A0=A0 up_write(&ni->file.run_lock);=0A=
>=A0 =0A=
>=A0=A0=A0=A0=A0=A0=A0 if (new_valid < ni->i_valid)=0A=
> -- =0A=
> 2.33.0=0A=
> =0A=
> =
