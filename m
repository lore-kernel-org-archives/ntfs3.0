Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2058.outbound.protection.outlook.com [40.92.18.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BC2C80
	for <ntfs3@lists.linux.dev>; Fri, 31 Dec 2021 16:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCTMUFO0JdNcnmHB+vOwEv/oK4KNav+np9xUIhQJ6anlImK+fyzjMNXGHkqmn1GDV5WvbqlY1Y6UO+fW9cbSw0t9HP/6XxSHMSrl7k/PTYai1CW/hMXLLjcWhLk92Jop9QWEloJ6MKNYhByVSCI3Q38pT4tRzhVP9YIK6/XyH5j5Z7PjQj3vWDNQRMWAm4jyD9NMzrmR2JH89xlyqUWE4+SHKRxKUuEBjTdPqx40mDuHOLl91IDqsVXnQIrYiDAFMlLWsPLzopq+2Wx3c+opKL63deRrRa3NXzj6srrQPEUN1eWAxRa0uKCz7ZlOI7nNZLd4zwzkAhafrOr8TFDugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BF8U/K5upnJiZa6Y1LQqx9tNciuogaJfW+Qu2oWIAj4=;
 b=MktzjfTg2DS2ve6j6UikPjr8s9EGuogjLRzwwi96osu52IVXYK6Bvt4rjftRJpHEGcbd35ihukndQXvOCD78l8ugiNCluaeu9oHIF53AKctv72aA6CA4ajTmRWstbVnR5SmIqgjTz4BMm2S4qLAe+i9jTNnimO8cOmrGqB5zK8xfVzXDQxOiYmLa+gDogtX97qJ08ZhK8G1y2NzpTl+RJ5FwKFCpNsxdd/4mwbiINK7oPmOMthPRPcUd64yHYxpdi9wMWIxozWSb6yMSSM0rtj5IefqYR5M9kq+6cWK1f3mMV+TCZ4cX27mNtt41QsjaFesIW72ZBBUMfdvjnaztbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF8U/K5upnJiZa6Y1LQqx9tNciuogaJfW+Qu2oWIAj4=;
 b=U7c4MLKP5sswxpfzJbXdqTB7DX3W4rTT4B3eylrYzjoX/D62XBhZu7gePfcm8zaI4vqa1HcHhPVetP7qY0HyJh8s1/JI5ZOrYJ1YCsG7P8e48DXt7xRFB4fP4Ldxe8UmAoWxiX1efLntPk3E425IKu1Hzn3+tBPEYJrhB+dhY2vsjFDKqWw0aXR9fHgw31s8w3Csy/WNYaKQLAsAf2Ut7HbU5wPxXmS4nuA4XfDK32bP/zHbe0QCnT5lPj7h7VRqDCX19e0fh6Gno7ZkyTtbkGR6w+LqbatYIwQTYg4ccImWtj9VxfKPcXa9CLZbLioWDFF6rp4nxvAiIZTjxrUsdQ==
Received: from DM6PR04MB4938.namprd04.prod.outlook.com (2603:10b6:5:fc::23) by
 DM6PR04MB6969.namprd04.prod.outlook.com (2603:10b6:5:240::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Fri, 31 Dec 2021 16:22:20 +0000
Received: from DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::609d:bbd3:b283:44e5]) by DM6PR04MB4938.namprd04.prod.outlook.com
 ([fe80::609d:bbd3:b283:44e5%7]) with mapi id 15.20.4844.014; Fri, 31 Dec 2021
 16:22:20 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: Matthew Wilcox <willy@infradead.org>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
Subject: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on Arch
 Linux)
Thread-Topic: regarding: Re: Bug using new ntfs3 file system driver (5.15.2 on
 Arch Linux)
Thread-Index: AQHX/l/CzzwGd3PWik2FMZXf0niOlA==
Date: Fri, 31 Dec 2021 16:22:20 +0000
Message-ID:
 <DM6PR04MB493813D5A09B3F03378E9398DA469@DM6PR04MB4938.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: b7ec1593-5e2c-1d70-987b-68d0d2a605bf
x-tmn: [vyYEAcUiRN/8NV+4vbWgn7zB5VvBTlvvj7vLS3fxJfY=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd4ef868-18b5-4445-6677-08d9cc79b828
x-ms-traffictypediagnostic: DM6PR04MB6969:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3whzOvwY36R8YzL6x3/Z6FSPGKfJxZUqmd4l5+ZHgQ2EfToQdahwQuJ45FlX9K6EYaLIxmG32Dge0MN0LvxvkPOcxYCXSAUJq/UNTPzx1sHEaGWKYKsszuswCcnaHTdDMtQQ+1lXWSp32mj2y6cBF50/eHhXGJY7CsMJnZVfcrE9tdIPkdKtYaFD/I87fcKCFL9DivRTlUHeQjIM0CgLp2owVRA1oXqG2ukRRqLosSfQnmhiOD73lLmJMqWxkrCQo9IbdC/mdIHnF0mYsCd3zrB7PQ76Tw3/Inp5Cym5jZkVeYuZIhb1h2mqkgmxf8VD9/H6Hyc4L+46B/t2crxv7pJWF9OIqR7lsQSpE34689wEkxQ1ba1XeF6vPPzfgXmecJKcBaqKfg0Ui49Cpj00dCnb/jCOIkcdb+3zn26e/uffHueyWQc1JjynichwEQ3az5tPOfNOh2rHqiQ35sfZRneOZxRZ3LEjdtbd2MrEBr6TezhINFjwchAJVCw1dmbDL2uYKhSv2J0ivzYJh1ApLD+d1pZfa9iBCZRKFxP7MXClC/2ViehbcolcR7+t27RWEV3b2ChoARh4youTFlKHvyhoqJT+4Pk/NXDTdd2+J7m4cJVZ96dppHo7c91hPSpBmhBuh7q+sLRzMYJ7euf9a3OAdRnarF7ALJs1EbD9H/Q=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
	=?iso-8859-1?Q?09zHhoedczB6fMBGj/8jtS3sv6NtFz5FLF8/JpSDSNomoYiNkma8rp8655?=
 =?iso-8859-1?Q?G1QZWFnG3z/drXGg0oOparC+/I/aur9fH8w0sSVkg2PG9Uy/owRsKPGNtA?=
 =?iso-8859-1?Q?OL5R1etkMQtvqzzrkZPQGYflBbCYyw4e1FCjX77FEy51WtQ2yBmW5ZU+ZM?=
 =?iso-8859-1?Q?0kSAtQEsnp/WrdtEKCR2oxVtHaPdLXU2G+nsxfsuy/nqUi3g6KzOgu/15k?=
 =?iso-8859-1?Q?yNn/jlq7sSmLiloG1j6hj4bJR3lBkRcMYy5RU3Uw4x5de+W3RpiUbk5VxP?=
 =?iso-8859-1?Q?6Tkfrc9Ntr7FY8ExHxmmpdsZkQHkFhW0bH5qNHRgbdgc7n5eqsH5bHIn22?=
 =?iso-8859-1?Q?QQV1MjvE2q/lxX0gE4pzEBU17uzYnTI+b5x3kVad9EQqMYw0Hqx0sZFOv8?=
 =?iso-8859-1?Q?yY6b3FJfV6NW6sAy5is+4Qr4oDd2dpD4vALFe/QaG7gop0ZeUpvO0kgPIZ?=
 =?iso-8859-1?Q?NtOXATdkQtoYf9HH/0O0P1qMlo9Pg8kzxq/eYzccvEcZW41mk/Vzvpuf8N?=
 =?iso-8859-1?Q?EHmxyXBy74fQg22/cMOouusyyws//70P7+++60rZ5eCHU3D+8ZWbtGur/J?=
 =?iso-8859-1?Q?qC6A10LQ/DasF7YPx9MiU9ZE11qfgKArKEfxPIlyBKWaqG9DqPWaH0758W?=
 =?iso-8859-1?Q?yDwyNSMa4OByTW4+thtgkHICzGx0I/Z1iuVjT8yanoQbf+YoHc1yGd4I/b?=
 =?iso-8859-1?Q?VSQyNwLHrew4mXTk2XDWD9Y6VL+Rl7udAVrLJJ4N2vhl+W0jqhqML1UkR1?=
 =?iso-8859-1?Q?0ELewieAN33pt3j7+7MM/3PgVnri6xgDRhxGDB1djyG5/RghUzox0J6UBM?=
 =?iso-8859-1?Q?0QXv12j9vUkse9hZDYU0/8PgMUlOUmV0JZnrVaqbBnjzMuxj8B8M92jIK/?=
 =?iso-8859-1?Q?1mIH0k9PNVDVM5QJyUYFV18/+eKlD3FrK9PB1MyU5O7PQwyw+HC7JQT2Df?=
 =?iso-8859-1?Q?lev3ZdNdET4fSusI/LwiS5KDmnlHNvLPgheDYPPrzsPKHnIK57obiQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4ef868-18b5-4445-6677-08d9cc79b828
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2021 16:22:20.1251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6969

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
[root@sirius gana]# qemu-img create -f qcow2  /mnt/a16/gkpics01.qcow2 99723=
771904=0A=
=0A=
2) =0A=
create another qcow2/vhdx containing sgdata, Ensure that data is good/not b=
e corrupt. (I prepare my vhdx on windows) =0A=
That issue filing mentioned earlier has scriptlets for "synthetic generated=
 data"  (sgdata)=0A=
https://gitlab.com/qemu-project/qemu/-/issues/727#note_739930694 =0A=
=0A=
3) download a fedora rawhide iso=0A=
https://archive.fedoraproject.org/pub/fedora/linux/development/rawhide/Work=
station/x86_64/iso/=0A=
=0A=
4)  =0A=
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
2) format /dev/sda1 as  ntfs=0A=
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
