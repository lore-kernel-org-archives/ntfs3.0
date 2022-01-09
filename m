Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08olkn2030.outbound.protection.outlook.com [40.92.46.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D3168
	for <ntfs3@lists.linux.dev>; Sun,  9 Jan 2022 12:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay8emL6dulEhl5YPd4VEmgh7KI6F0nBztuFVqvFF0eysbAwH5ArqZofJqQn6PQd5fB/WPzyj0atprNXv1Kt1WGUKoci1GkKUDkix0PlxE+BuNlemSp4sRSon+2rxUbsusrNsafrjRml2341ctoLXJENEGhtBhQKL6NLy9M7eIcB+r7+wiimcqHvvMKtSGB8pjjRKyprYpGXM3Ktm3B+kEdzsrGbb/tMBcNaaGhK+qQPB1LE+0TPNLj5LB5fn0tvfeIFHq2efLSWb3VdkNzVKlYmUQn6M8qkbhUAkTHiq1ZrZF/bBewIvJPQH4W8pmMh6CwSB5W/LsZTrnS+k5P75Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YunxefWj49rV3kLPOAuNPvojgOGSLFiF5UnNc8/wTU8=;
 b=Az5TT88hyYo1y5YqqwhJuptN0DmUaWekoi7TrU7dJUHRnlU3vy73LKR9AMz85PVvjLHC6sUl3UX82rHynQLxtHaSy+3/v0ZwboU51UUe+fBcqpSftB9QuA8CjpkVNrxpyYe0zXJllqFnAejkU2vTu5Vo45NQJKUdqap1hyV/NlKss0F6UyN/CxUyLTguziPKYOvenDqlPChjtb+98AJ+CciG+W9NJGE4MAxM+SHu1zMbm3e1YXpG+QC2mviv71S7Fu2WrGShw8m/1Sp2IdKkU55IGfkWq5Vku+VxPCd6jDBw8F5+Pv8NeoQJxaBNWPNyp+i6oASvus7StYqn4OqYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YunxefWj49rV3kLPOAuNPvojgOGSLFiF5UnNc8/wTU8=;
 b=h17tEui+o9ZckgZp4pfb1T+J8dQeVfvSk820hnpzJwefCo+CWUWWwyo5lcogjuDCS4xheY87gcA7LT48q6PK6B26gF/95xNOOzQOgmlsR9jh7zEgVVjI93gRw0UY0w3JPrPifisupqXJ23zXOUlJu/XR9VLiy/YEk1OZiENOFYnKLrlRqgPzkjaKJEX5OmDgr6hBTFGOd65eXj1XxE/dC6ICxOcGI3rhOIAO54gsbRl/sP4IFUKkL2o9KVg+6iyP7WoDiCOhio+PxqNPzxYQnEX6CYyClY7YKZbKFjqWs7httfaf8hO+fF2yGURBP/rhDpt9p2PvmFjpcO0tVR5YjA==
Received: from DM6PR04MB4938.namprd04.prod.outlook.com (2603:10b6:5:fc::23) by
 DM6PR04MB4155.namprd04.prod.outlook.com (2603:10b6:5:a3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Sun, 9 Jan 2022 12:06:07 +0000
Received: from DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::609d:bbd3:b283:44e5]) by DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::609d:bbd3:b283:44e5%7]) with mapi id 15.20.4867.011; Sun, 9 Jan 2022
 12:06:07 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: Matthew Wilcox <willy@infradead.org>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
Subject: Re: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on
 Arch Linux)
Thread-Topic: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on
 Arch Linux)
Thread-Index: AQHX/l/CzzwGd3PWik2FMZXf0niOlKxao8U+
Date: Sun, 9 Jan 2022 12:06:07 +0000
Message-ID:
 <DM6PR04MB493866F0E97AD8DE883D0ECEDA4F9@DM6PR04MB4938.namprd04.prod.outlook.com>
References:
 <DM6PR04MB493813D5A09B3F03378E9398DA469@DM6PR04MB4938.namprd04.prod.outlook.com>
In-Reply-To:
 <DM6PR04MB493813D5A09B3F03378E9398DA469@DM6PR04MB4938.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 984dbee3-486b-4715-5496-a7d5302d04bf
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [n/WpnHE6IX2yp+AQAzwLF7fkEU1BfYw8I/EChAaPCo0=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0df170fa-8af7-4870-2b68-08d9d3686b00
x-ms-traffictypediagnostic: DM6PR04MB4155:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CbmbuNY/GiMYdWXm9AWozAkOQOuujKqVGXPdoQKCAj/6nXdiHTiu02AP341TPWmc95cTShZTurpfqG7YBt1rt5XWYjAlYUiHRwCO6UMwRFS81wDIYXJ5x1q5JlWiCuMG8wi04QBXgu4i4uhTfAmvAaVlyZ5jK1eWSyM4+B6N1AsBSyi6gFWEPoWcQ5oRPKZ8wUnsLmyhkgIcP8ZcNDEliYe6VQexwefkMU5PijIzNZJk/jT0xGFxo2FFKepqkSV5qYNCbTj3Hn9zO8p5vWggupKXUyuQmLGdWO18dvajQOxKkSLQH3CO2I/baSCMzVsmWo75YMFyp033EbjDqXWWiDpcHlc0QIkO8kJXXOJbVfcP/Yfxymlz3HXzKNWd0Biqi5nhdXzg3N4Ok/psLhOmsePey0wUy0v1oJGRgcEI63lvjIBIN7vY24++9qiNrQpi16FrgdwfngdmKe4NZdY9I70Ex3x2mfL2zy0yJvoukd8iUOGBs0IkcXXegoYbXdjUpO7dh9oaSOMRbkXFnscF6cmC/4WlWJ4m8RptQxst8DZyWpek8oEkfr2zJHW/nkIrAsCERDRFIsO0+KGk/02AAAQpOvIX6GCqG8uiFE8WCfwVW09nqTba1cfeGFWXs+8D5Dc/oHWIO9Qq/ZJWmt8bVT9PZkyqujV4DW7cRmW3Ab8=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
	=?iso-8859-1?Q?Pf13ltJpRFcaFPnu8VADEXZInt8Bj57NjsaztS2Vr6S/2m33qFGirv1cHz?=
 =?iso-8859-1?Q?lgCjVdfydQBFr/xAlIma7pfYCAF9rKi2FSixkUt3eeJ4nppPya8JBNNaRn?=
 =?iso-8859-1?Q?yymxEwtF3fxAgxk7W14ImiFsBZTjGF7Syw+SA9PTBqRrF6XoZjbZBwCreB?=
 =?iso-8859-1?Q?3CRPOmnIM9Nh1TvQp2eie0EmUTBPima9ds8o3kT8b9lTkPzpC20L7bu8Dh?=
 =?iso-8859-1?Q?wrHUwL6VYRM0MnfpGZ1/WqwzMEHbdvtD0uAoTZDN1PRZh/fA+etoYeRMJ7?=
 =?iso-8859-1?Q?bphqlVQA451uacioMAkn0R5YhgO5DA/dbmuIGvJ3eNJJx3NhCGSL3hSWHi?=
 =?iso-8859-1?Q?rWY1Q3JuS/RAK8ZsgpqwV/XiZjCCZgwxFvuf7IFN+z7LTuKtus+lVtN30X?=
 =?iso-8859-1?Q?YwV2n3QThY23qs7m4B1JQkb1lkeXC2n7tVBzY/NlB8FTlKGerOfOdQosvZ?=
 =?iso-8859-1?Q?cXpRQC+3d7FIPkvJfGDDh79xVAM73RDhHR3GfNpf1PSVgVPjNnHCK1wBOh?=
 =?iso-8859-1?Q?42iGayVqDhoLK6vA0RkCJWUO2+4stkZrZoEQVJ1nec6XY8wxgpKggDbFBS?=
 =?iso-8859-1?Q?QFk+mSMgjDsusxMGqVOwy0pR4QuBrNd9NnGq+oWm7aC9qG8b+1/dMbwM7H?=
 =?iso-8859-1?Q?dXfzu80ezpMWbWJW/Xm9xKIkv73IblFddgE3VP1tBjdaSBSGktTDZj5sgz?=
 =?iso-8859-1?Q?karA7BOVuyJREoWmjdVV9pGJU22wLAdwFAG9X+07pzzG0TddKr4lzpy6wk?=
 =?iso-8859-1?Q?tdKtOHbMnZC3cULzcW1jf33/evIn5v1ksruxlDmxvg9NUYGrxkhHNwTUV4?=
 =?iso-8859-1?Q?5c3PnEiKFABsdhWsUg08tcV4nlj518Pqqu5P08XdTt0WcoNGyWL9nck7Bt?=
 =?iso-8859-1?Q?2Uaj7Sy5ezNYYfXiDMtF8Cy7XTo+y8++p6J5n4e8SY155q8z1UEToWbKot?=
 =?iso-8859-1?Q?23Wz3SobSMHAF7NUzUHWLXtlUoxk6KzHlNwGtzPSjoJ8J5Mqr1JxEg=3D?=
 =?iso-8859-1?Q?=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-edb50.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4938.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df170fa-8af7-4870-2b68-08d9d3686b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2022 12:06:07.3729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4155

=0A=
I filed the bug in kernel.org bugzilla as=0A=
https://bugzilla.kernel.org/show_bug.cgi?id=3D215460=0A=
summary: fs/ntfs3: page_cache_ra_unbounded on rsync from ntfs3 to ext4 =0A=
=0A=
I hope someone is looking into this. =0A=
=0A=
In the below, email, I had to mention that to produce the trace as mentione=
d in the other emails=0A=
one should load manjaro or arch live-cds=0A=
* archlinux-2022.01.01-x86_64.iso (kernel-5.15.12)=0A=
* manjaro-gnome-21.2.0-211220-linux515.iso (kernel-5.15.7) =0A=
=0A=
The bug happens if the src partition is mounted as ntfs3 on vhdx.=0A=
So i believe it is triggered from the "read" side filesystem of rsync. =0A=
The dst partition/filesystem can be ext4 and is on a fixed qcow2 or raw dis=
k. =0A=
=0A=
Bug does not happen if src partition is mounted using ntfs-fuseblk driver.=
=0A=
=0A=
-Gana=0A=
=0A=
From: Ganapathi Kamath=0A=
Sent: Friday, December 31, 2021 11:22 AM=0A=
To: Matthew Wilcox <willy@infradead.org>; ntfs3@lists.linux.dev <ntfs3@list=
s.linux.dev>=0A=
Subject: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on A=
rch Linux) =0A=
=A0=0A=
Hello,=0A=
=0A=
A) Included below is I think a sure-way to reproduce the bug. (I wasn't sur=
e if you had done reproduction yet, and were looking only at provided kerne=
l traces) =0A=
B) Is there a specific kernel-bug ## I can cite and watch for progress/fix =
? =0A=
=0A=
I ran into the same while doing similar rsync tests related to qemu bug =0A=
https://gitlab.com/qemu-project/qemu/-/issues/727 =0A=
=0A=
1) =0A=
create empty qcow2 file=0A=
[root@sirius gana]# qemu-img create -f qcow2=A0 /mnt/a16/gkpics01.qcow2 997=
23771904=0A=
=0A=
2) =0A=
create another qcow2/vhdx containing sgdata, Ensure that data is good/not b=
e corrupt. (I prepare my vhdx on windows) =0A=
That issue filing mentioned earlier has scriptlets for "synthetic generated=
 data"=A0 (sgdata)=0A=
https://gitlab.com/qemu-project/qemu/-/issues/727#note_739930694 =0A=
=0A=
3) download a fedora rawhide iso=0A=
https://archive.fedoraproject.org/pub/fedora/linux/development/rawhide/Work=
station/x86_64/iso/=0A=
=0A=
4)=A0 =0A=
[root@sirius gana]# qemu-system-x86_64 -cpu qemu64 -m 4096 -machine "type=
=3Dq35" -accel "kvm" -smp "sockets=3D1,cores=3D8,threads=3D1" -boot "d" -cd=
rom "/vol/15KJ_Images/transcend/Fedora-Workstation-Live-x86_64-Rawhide-2021=
1230.n.0.iso" -hda "/mnt/a16/gkpics01.qcow2" -hdb "/vol/15KJ_Images/test/sg=
data.vhdx" -device "virtio-vga-gl" -display "gtk,gl=3Don" -rtc "base=3Dutc"=
 -net "user" -device "virtio-net,netdev=3Dvmnic" -netdev "user,id=3Dvmnic,n=
et=3D192.168.20.0/24,dns=3D192.168.20.3,dhcpstart=3D192.168.20.15"=0A=
=0A=
Inside VM, open a terminal tab=0A=
1) use gdisk make type-0700 partition /dev/sda1=0A=
2) format /dev/sda1 as=A0 ntfs=0A=
mkfs -t ntfs -Q -L fs_gkpics01 /dev/sda1=0A=
3) mount /dev/sda and /dev/sdb =0A=
mount /dev/sda1 /mnt/a=0A=
mount /dev/sdb2 /mnt/b =0A=
4) ( sdate=3D`date`; cd /mnt/b ; rsync -avH ./photos001 /mnt/a | tee /tmp/r=
synclog.txt ; echo $sdate ; date ) =0A=
=0A=
monitor dmesg -w in a second tab=0A=
=0A=
Basically, in the above test, I am trying to copy about 85GiB of data from =
/dev/sdb2 to /dev/sda1=0A=
=0A=
The kernel trace happens within less than a couple of Gb of transfer, after=
 which rsync bails out. =0A=
=0A=
-Gana=
