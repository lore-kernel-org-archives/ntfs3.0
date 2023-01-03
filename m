Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2068.outbound.protection.outlook.com [40.92.42.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C78F47
	for <ntfs3@lists.linux.dev>; Tue,  3 Jan 2023 18:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJGoSw/LfuCUDr5x2ith6Aam/OQQaxCmdXX2e7SQbyt4Zyw8SPo3NgPDdRV22iOIr4GH52NAXwoMp2/mNmLgEohMaROjT42N7pOI4jnCYZBLb8VX7zDz+YHti3KnHsqqiWixGd7NaqmjRhnHcl9Nf6iolVK9sOX8CR9bvJafbe5sXwZObz46vGhUSZDduYXTwsCodMsI+3TkN1y3d7cmKiseHkvenapJat9dXd18YuI2hQGeEs4dWXC6qNzw5b2phEOld8HErSUjk0YbPBAxoxRgtIuzi2aGhshyCcryEJd/zGsZkIAwSJQ8dj2jiY8n6enna99FqDV1wHjBtKHPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzbxuFcW8Aj6uCFmFogMqNMr+9b8Aj0bPzE1Z9tuWdY=;
 b=bFOYenxYJijSPYsFMLbuBiCK9hVNyJdZdx5hZEtIhUHHVvNvTwkCj2zC7urhX4rENulC6QXFNBSmOd3bK1ovEsDh8C4lABE7hB0EWYvWW6R0TAsllZuIyVMSxIYaDE8Aja9Ht57HK2Zc80faXfk2xeqss0c+dspW58XY9//hGvEhHMM1erTkuf+nYJF1yY3H+zq/D6PYCMJFteHgjfErwgjZLl8X5bJRON/gZ4V1ivl/frGUeWaCJ1huMn2yCsPM/0beDk30wByYdsaDXHY/I7dt0x3hbXy72lep70bq6kVuUpxnp3l6TKb40oZ3irIJjNJtEdG5I4SWH19RL9QfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzbxuFcW8Aj6uCFmFogMqNMr+9b8Aj0bPzE1Z9tuWdY=;
 b=t1HYzQGfKSqFL4uvMLOdLq53gnDoTOYwWvaMDXzSH4JJKL4UE09X92xmL49/DBRxtWiunvJ7R+xdgYUFLLot5zZY7Z/GPGiw+QuMMwGWI0L4qIJkwcSjXLRokTiEa6QCQ7+S5odXwbpECvE3xWn5xypoVhUJL12G3Zh6c9esGNH9c6WR+/FwHAgCBn8Iy8vJf+MgRgAxnHjPR8mzBFZqrEY6A6KwGeM+zvgKcJfIqulKU5MfeZLxdAMLo3/9xVVYrfa8EepYKHHpG7n+Inqe9Oz/WCSyEM8U1oKK74Lqi+hASaDuGdsKxO0JZDW5rLWNMktmp/5/tNnlbtyppkKcxA==
Received: from IA1PR20MB5743.namprd20.prod.outlook.com (2603:10b6:208:421::7)
 by BL1PR20MB4588.namprd20.prod.outlook.com (2603:10b6:208:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 18:18:02 +0000
Received: from IA1PR20MB5743.namprd20.prod.outlook.com
 ([fe80::d357:14a7:2dad:4747]) by IA1PR20MB5743.namprd20.prod.outlook.com
 ([fe80::d357:14a7:2dad:4747%4]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 18:18:02 +0000
From: Ganapathi Kamath <hgkamath@hotmail.com>
To: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-mm@linux-mm.kvack.org" <linux-mm@linux-mm.kvack.org>, Matthew Wilcox
	<willy@infradead.org>
Subject: ntfs3 folio related traceback
Thread-Topic: ntfs3 folio related traceback
Thread-Index: AQHZH4cZhoaY9AI6xUauDFefB0+Seq6M/5C5
Date: Tue, 3 Jan 2023 18:18:02 +0000
Message-ID:
 <IA1PR20MB57439D1A37B1A569E85009E1DAF49@IA1PR20MB5743.namprd20.prod.outlook.com>
References:
 <IA1PR20MB57439BE557F0062590F83979DAF49@IA1PR20MB5743.namprd20.prod.outlook.com>
In-Reply-To:
 <IA1PR20MB57439BE557F0062590F83979DAF49@IA1PR20MB5743.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2WYnVseg32da3FBWbqiw0agt0pMAf4kZ]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR20MB5743:EE_|BL1PR20MB4588:EE_
x-ms-office365-filtering-correlation-id: ce7caf06-9109-418a-34d3-08daedb6d9e9
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 znMbQkECWiBF99o7bTA5dOlw2hBFySrx0Zr8LpnCMIKTOgdW+xe0EVo+bfnKzLnYIOTwW42AX3IwPFYZ06R/ueNpBGdmQXo602bxKMuAtMaHxB/nm1B3ElwHzFmOfX3P/zMKLm/kmmeflf+8pgV7KkJzRVg35minBuUS/RsssJ6ZTFqwtG/uN0J3QYJVccviOIRJgHdF9ky5lZ+PtuhjgkEwz/Q10Ff336gWZfrrAKzxupIVwsPkDDyZl9rsxHMWY5jyxvhmMywm8sFr2OpDO5BBP2c6bs5K7QoEQqLyyRt20blZl0k+ewsy5esdtjpR9p/PWVT5VLHc4O5CbzJ7n8t7kYHWo1ubCqUkz51NB5IJGMytCUj1vl+Pjqvmm20HRJbHlEBLIvTGRqkYsIiZDItfgq9ENUa3Go2AO9/uTzDtxdUd7pFXGpDLCE2+esppGy5B0Uz9eMGmhd37EUkKn4CmCWtvckU3EzAzOmJlS0bN+y5BBYtq5SRsji2XBz3IBKc02DpRxe6XmWi/qhkZ35vyG7mOmRPjVReF+aSlzHdUSWH8TdPdjuzf3oUZVWZ06eR1yCSwvg5uQrzMtizc7A==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DJf6YOL43VWeAKebeFZ9INbOme2pXO8eqB6e2aPj/zAhIVHM0fTBMxUHBV?=
 =?iso-8859-1?Q?uyLjiFfaDe1NyiDeVBJ49t6EEe+fzCGX5SQs2g8uzEGX0wJIkieJOWv4ZR?=
 =?iso-8859-1?Q?/Agmuv5wcbeoryMEejX6Yt3W/rO1uud/zQWz8K/VamkPOd37dk6g+c4Q63?=
 =?iso-8859-1?Q?lMUD8lLnfXE0vF5YruDUxrXmRuK7vM+j09fXhUDfHC797hdsYFm1Xe+oDU?=
 =?iso-8859-1?Q?GsWt9Q2WM2Yws0G7hxlcyRVT/Q4x6JoiMlxMDJCwBEXMvjZPq1SihwnqOS?=
 =?iso-8859-1?Q?vgbT2Zfqqm0DvWAI9m/mdPM2nf0SwnNc1XpTFhIlVUOfcJy1vt7hJN6UxN?=
 =?iso-8859-1?Q?Vc40jYwyzPlwMp+0LzE6ZF8sbrGKTCIPsjR2ul8bpFf63Qeuv8O6dN3+4Y?=
 =?iso-8859-1?Q?0SEfQ7PuIxrdzoRNcp4ZiTe/Uou4pG37cBDvEUr5ZsvI/fkaibuoSEnw4w?=
 =?iso-8859-1?Q?5Chl4K3zB1QnekWserHbDEQKR0t2MINGpPVW9dtszWg9NWE/CbS1jlkJYe?=
 =?iso-8859-1?Q?MpGUElq9jcJc3BUbBqGO+OGjtEv56kISjzFzyKuQnj324H8rteEjIwu6HQ?=
 =?iso-8859-1?Q?6Ob46fR7ifNQ62nkQlcWZlYGIEV98dZc+DJYsKWFrghvtEHAESNdxMXc6B?=
 =?iso-8859-1?Q?AcIHpnrIWXODNmxRxETre6fZNU6wdfxoDPF4f+3ksF8JTQFe/zPK0/WjTX?=
 =?iso-8859-1?Q?ovcDqQVoDogXVEZD32qsfAiVAZGz7zocSq6cit8iQKgQqbfs6zEbH6wV4Z?=
 =?iso-8859-1?Q?q3Jvv99wee2ny3R1JxgtuoaR04CV55TlHlUEcovhgmsT3TAG+QpvJYEBw7?=
 =?iso-8859-1?Q?KpITou8hAvDh93i91nHKoNl+pHED1pBIRoGzSH9f4T6Co8nrSh7S8OOQhQ?=
 =?iso-8859-1?Q?IR6nlS7UTphaWCG1TQ8iDnL2Wa1CPN8YMQi6rLMwKlp0l63t/AvSxMZ+ID?=
 =?iso-8859-1?Q?b7gaPkJnvvG1/p6M6dFTxXJSppLbid+hpirznsTiO1NSkIxsTH/hjvmIMl?=
 =?iso-8859-1?Q?FytrYrY09ustSGtGdLQ09T8yJgb1wcS1w5TUQSIAn0UzuVQ6igl2jHPnep?=
 =?iso-8859-1?Q?f0l9IvGhXQjn6yGCdl9jxpxyEgtyqxVC51AXTPcbFc4HbssiRdeVgqSQgM?=
 =?iso-8859-1?Q?nQ9FBHXVWLwoJ+/9DDQjnlCyBgMYhY7CNtSd0OSHWRXtfJo9yjsUdJjsxz?=
 =?iso-8859-1?Q?F4LytxztxuTbFpIkxi/ZSZUZGxV9wx0Y2/lV+K2kanLYcGM49549BZWRWz?=
 =?iso-8859-1?Q?m2yPLpemJQSoGrBh8ShBzidUeeqTp4k4rnrVLvIR1XON3QpoLx7PDcUAjF?=
 =?iso-8859-1?Q?zoaJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-9803a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB5743.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7caf06-9109-418a-34d3-08daedb6d9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 18:18:02.1957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR20MB4588

=0A=
Hello, I'm including some kernel stack traces below.=0A=
They were spurious, so I hesitate to file bug. I have also filed some simil=
ar bugs before, which were back then more sure to occur. =0A=
I also see many recent posts mentioning similar kernel stack traces and rel=
ated to ntfs3 and folios.=0A=
Are there any bugs fixes/issue-nos related to this that are being addressed=
, already committed to kernel-6.1, 6.2, 6.3 that I should be aware of?=0A=
thx -Gana=0A=
=0A=
=0A=
Host: fedora-37/kernel-6.0.15-300.fc37.x86_64=0A=
qemu: 7.2.0=0A=
Guest: fedora-37/kernel-6.0.15-300.fc37.x86_64=0A=
=0A=
Prior similar bugs: =0A=
Bug 215460 fs/ntfs3: page_cache_Ra_unbounded on rsync from ntfs3 to ext4=0A=
=A0 https://bugzilla.kernel.org/show_bug.cgi?id=3D215460=0A=
Bug 215563 during rsync, vm guest kernel trace arising from memcg_kmem_char=
ge_page alloca_pages=0A=
=A0 https://bugzilla.kernel.org/show_bug.cgi?id=3D215563=0A=
=0A=
Essentially, I do the same standard steps as mentioned in those bugs.=0A=
The bug I am really stress testing for is https://gitlab.com/qemu-project/q=
emu/-/issues/727=0A=
In it, two vdisks are connected to a qemu vm. The destination vdisk starts =
of as an empty dynamic vdisk, the source vdisk contains synthetic generated=
 data=A0 =0A=
The empty dynamic vdisk is inflated from a tiny size to 85Gib in under 16 m=
inutes. =0A=
=0A=
reproducibility: Spurious=0A=
2 out of 6 testruns went to completion. =0A=
=0A=
Steps to reproduce:=0A=
same as before=0A=
On a qcow2-dynamic vdisk, that starts of empty, stress test copy about 85Gi=
b of data to inflate its size. =0A=
src: ntfs3/sdc/vhdx/ntfs3/hdd=0A=
dst: ntfs3/sdb/qcow2-dynamic/ntfs3/ssd=0A=
=0A=
Below are 6 testruns with 2 strack-traces.=0A=
Prior to these I have tested the destination vdisk being 93Gib-raw-img-fixe=
d, fixed-93Gib-qemu-fixed and 93Gib-vhdx-fixed. These did not give any prob=
lem.=0A=
The write stress on the expanding qcow2-dynamic vdisk is required. =0A=
=0A=
RUN1:=0A=
guest:=0A=
[root@sirius ~]# ls -l /mnt/a17/gkpics01.qcow2=0A=
-rw-r--r--. 1 gana gana 198096 Jan=A0 3 15:27 /mnt/a17/gkpics01.qcow2=0A=
=0A=
[root@sirius ~]# ls -l /mnt/a17/gkpics01.qcow2 # after gdisk=0A=
-rw-r--r--. 1 gana gana 524288 Jan=A0 3 15:34 /mnt/a17/gkpics01.qcow2=0A=
=0A=
[root@sirius ~]# run the rsync step=0A=
: =0A=
:=0A=
photos001/D0038_16ab9e88/File_0583.bin=0A=
Tue Jan=A0 3 03:42:36 PM IST 2023=0A=
rsync: connection unexpectedly closed (635379 bytes received so far) [gener=
ator]=0A=
rsync error: error in rsync protocol data stream (code 12) at io.c(231) [ge=
nerator=3D3.2.7]=0A=
Tue Jan=A0 3 03:57:57 PM IST 2023=0A=
=0A=
host:=0A=
[root@sirius ~]# ls -l /mnt/a17/gkpics01.qcow2=0A=
-rw-r--r--. 1 gana gana 90386464768 Jan=A0 3 15:28 /mnt/a17/gkpics01.qcow2=
=0A=
=0A=
=0A=
=0A=
:=0A=
[=A0 995.145136] BUG: unable to handle page fault for address: 000000004865=
01e3=0A=
[=A0 995.145162] #PF: supervisor write access in kernel mode=0A=
[=A0 995.145167] #PF: error_code(0x0002) - not-present page=0A=
[=A0 995.145172] PGD 0 P4D 0 =0A=
[=A0 995.145188] Oops: 0002 [#1] PREEMPT SMP PTI=0A=
[=A0 995.145199] CPU: 7 PID: 2531 Comm: rsync Not tainted 6.0.15-300.fc37.x=
86_64 #1=0A=
[=A0 995.145211] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS e=
dk2-20221117gitfff6d81270b5-8.fc37 unknown=0A=
[=A0 995.145216] RIP: 0010:io_schedule+0x41/0x70=0A=
[=A0 995.145231] Code: 8b ba 28 0d 00 00 89 c3 83 c8 04 c0 eb 02 88 82 90 0=
9 00 00 83 e3 01 48 85 ff 74 0a be 01 00 00 00 e8 e3 58 8b ff e8 be fe ff <=
ff> 83 e3 01 65 48 8b 14 25 c0 fb 01 00 0f b6 82 90 09 00 00 c1 e3=0A=
[=A0 995.145237] RSP: 0018:ffffb70c81343b98 EFLAGS: 00010246=0A=
[=A0 995.145243] RAX: 0000000000400000 RBX: 0000000000000000 RCX: 000000000=
0000000=0A=
[=A0 995.145248] RDX: 0000000000000001 RSI: ffffffffac7aac9a RDI: 00000000f=
fffffff=0A=
[=A0 995.145253] RBP: 0000000000000002 R08: 0000000000000000 R09: 000000000=
0000000=0A=
[=A0 995.145256] R10: 0000000000000001 R11: 0000000000000007 R12: 000000000=
0000102=0A=
[=A0 995.145260] R13: ffffffffad008f18 R14: ffffb70c81343c00 R15: fffffb1d8=
08c62c0=0A=
[=A0 995.145265] FS:=A0 00007fba69929c40(0000) GS:ffff9b2b3bdc0000(0000) kn=
lGS:0000000000000000=0A=
[=A0 995.145271] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[=A0 995.145276] CR2: 00000000486501e3 CR3: 0000000176606000 CR4: 000000000=
00006e0=0A=
[=A0 995.145285] Call Trace:=0A=
[=A0 995.145290]=A0 <TASK>=0A=
[=A0 995.145296]=A0 folio_wait_bit_common+0x12d/0x3a0=0A=
[=A0 995.145311]=A0 ? filemap_alloc_folio+0xc0/0xc0=0A=
[=A0 995.145322]=A0 filemap_get_pages+0x5f7/0x670=0A=
[=A0 995.145333]=A0 ? copy_page_to_iter+0x8a/0x2e0=0A=
[=A0 995.145342]=A0 ? workingset_activation+0xb1/0x1a0=0A=
[=A0 995.145352]=A0 filemap_read+0xbe/0x3d0=0A=
[=A0 995.145365]=A0 vfs_read+0x21a/0x2f0=0A=
[=A0 995.145374]=A0 ksys_read+0x5b/0xd0=0A=
[=A0 995.145380]=A0 do_syscall_64+0x5b/0x80=0A=
[=A0 995.145389]=A0 ? ksys_write+0x97/0xd0=0A=
[=A0 995.145392]=A0 ? syscall_exit_to_user_mode+0x17/0x40=0A=
[=A0 995.145397]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 995.145402]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 995.145407]=A0 ? syscall_exit_to_user_mode+0x17/0x40=0A=
[=A0 995.145411]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 995.145416]=A0 entry_SYSCALL_64_after_hwframe+0x63/0xcd=0A=
[=A0 995.145423] RIP: 0033:0x7fba6931e021=0A=
[=A0 995.148377] Code: 31 c0 e9 b2 fe ff ff 50 48 8d 3d 32 35 0a 00 e8 35 0=
8 02 00 0f 1f 44 00 00 f3 0f 1e fa 80 3d dd 05 0e 00 00 74 13 31 c0 0f 05 <=
48> 3d 00 f0 ff ff 77 57 c3 66 0f 1f 44 00 00 48 83 ec 28 48 89 54=0A=
[=A0 995.148384] RSP: 002b:00007fff3a2ff5f8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000000=0A=
[=A0 995.148392] RAX: ffffffffffffffda RBX: 000055f6ad9b9a10 RCX: 00007fba6=
931e021=0A=
[=A0 995.148396] RDX: 000000000003c5ff RSI: 000055f6ada138c0 RDI: 000000000=
0000003=0A=
[=A0 995.148399] RBP: 000000000003c5ff R08: 000000000003c5ff R09: 000000000=
003c5ff=0A=
[=A0 995.148403] R10: 000000000000000f R11: 0000000000000246 R12: 000000000=
0000000=0A=
[=A0 995.148406] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
003c5ff=0A=
[=A0 995.148417]=A0 </TASK>=0A=
[=A0 995.148427] Modules linked in: ntfs3 uinput snd_seq_dummy snd_hrtimer =
snd_seq snd_seq_device snd_timer snd soundcore nft_objref nf_conntrack_netb=
ios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fi=
b nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain=
_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tab=
les nfnetlink qrtr vfat fat ppdev iTCO_wdt intel_pmc_bxt iTCO_vendor_suppor=
t joydev parport_pc parport i2c_i801 pcspkr i2c_smbus lpc_ich zram virtio_n=
et net_failover virtio_console virtio_gpu failover serio_raw virtio_dma_buf=
 aacraid mvsas libsas vmw_pvscsi megaraid_sas megaraid smartpqi pmcraid uas=
 vhci_hcd usbip_core xhci_plat_hcd usb_storage nvme nvme_core nvme_common m=
ptspi scsi_transport_spi mptsas mptscsih mptbase scsi_transport_sas sunrpc =
be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls cxgb3i cxgb3 mdio libcxgbi libcxgb=
 qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_is=
csi ip6_tables ip_tables fuse=0A=
[=A0 995.149789]=A0 qemu_fw_cfg=0A=
[=A0 995.149807] CR2: 00000000486501e3=0A=
[=A0 995.149883] ---[ end trace 0000000000000000 ]---=0A=
[=A0 995.149889] RIP: 0010:io_schedule+0x41/0x70=0A=
[=A0 995.149898] Code: 8b ba 28 0d 00 00 89 c3 83 c8 04 c0 eb 02 88 82 90 0=
9 00 00 83 e3 01 48 85 ff 74 0a be 01 00 00 00 e8 e3 58 8b ff e8 be fe ff <=
ff> 83 e3 01 65 48 8b 14 25 c0 fb 01 00 0f b6 82 90 09 00 00 c1 e3=0A=
[=A0 995.149902] RSP: 0018:ffffb70c81343b98 EFLAGS: 00010246=0A=
[=A0 995.149906] RAX: 0000000000400000 RBX: 0000000000000000 RCX: 000000000=
0000000=0A=
[=A0 995.149909] RDX: 0000000000000001 RSI: ffffffffac7aac9a RDI: 00000000f=
fffffff=0A=
[=A0 995.149912] RBP: 0000000000000002 R08: 0000000000000000 R09: 000000000=
0000000=0A=
[=A0 995.149914] R10: 0000000000000001 R11: 0000000000000007 R12: 000000000=
0000102=0A=
[=A0 995.149916] R13: ffffffffad008f18 R14: ffffb70c81343c00 R15: fffffb1d8=
08c62c0=0A=
[=A0 995.149918] FS:=A0 00007fba69929c40(0000) GS:ffff9b2b3bdc0000(0000) kn=
lGS:0000000000000000=0A=
[=A0 995.149920] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[=A0 995.149922] CR2: 00000000486501e3 CR3: 0000000176606000 CR4: 000000000=
00006e0=0A=
=0A=
RUN2:=0A=
system freeze=0A=
=0A=
RUN3:=0A=
sort of freeze, gui responsive, but can't start new terminal/shell/new proc=
ess =0A=
=0A=
RUN4:=0A=
traceback but operable =0A=
[=A0 131.484082] BUG: unable to handle page fault for address: 000000000000=
1001=0A=
[=A0 131.484091] #PF: supervisor write access in kernel mode=0A=
[=A0 131.484094] #PF: error_code(0x0002) - not-present page=0A=
[=A0 131.484096] PGD 0 P4D 0 =0A=
[=A0 131.484104] Oops: 0002 [#1] PREEMPT SMP PTI=0A=
[=A0 131.484110] CPU: 0 PID: 2558 Comm: rsync Not tainted 6.0.15-300.fc37.x=
86_64 #1=0A=
[=A0 131.484115] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS e=
dk2-20221117gitfff6d81270b5-8.fc37 unknown=0A=
[=A0 131.484117] RIP: 0010:copy_page_from_iter+0x76/0x170=0A=
[=A0 131.484123] Code: 4c 89 e2 4c 29 fe 4c 39 f6 49 0f 47 f6 48 2b 3d 40 a=
b 18 01 48 c1 ff 06 48 c1 e7 0c 48 03 3d 41 ab 18 01 4c 01 ff e8 09 fa ff <=
ff> 48 01 c5 49 29 c6 74 5f 48 85 c0 74 5a 49 01 c7 49 81 ff 00 10=0A=
[=A0 131.484125] RSP: 0018:ffffb70000c97bc8 EFLAGS: 00010286=0A=
[=A0 131.484127] RAX: 0000000000001000 RBX: ffffe5cfc0dc30c0 RCX: 000000000=
0004008=0A=
[=A0 131.484129] RDX: 0000000000004000 RSI: 00005616cc757138 RDI: ffff99ed7=
70c4000=0A=
[=A0 131.484130] RBP: 0000000000003000 R08: 326e73452c4e6cb7 R09: 7227a8304=
c2683b2=0A=
[=A0 131.484131] R10: cb3f3c018be49eba R11: 219097ff2b911ec9 R12: ffffb7000=
0c97d18=0A=
[=A0 131.484132] R13: 0000000000001000 R14: 0000000000005000 R15: 000000000=
0000000=0A=
[=A0 131.484134] FS:=A0 00007f1634972c40(0000) GS:ffff99eebbc00000(0000) kn=
lGS:0000000000000000=0A=
[=A0 131.484135] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[=A0 131.484137] CR2: 0000000000001001 CR3: 0000000019ec2000 CR4: 000000000=
00006f0=0A=
[=A0 131.484141] Call Trace:=0A=
[=A0 131.484143]=A0 <TASK>=0A=
[=A0 131.484147]=A0 skb_copy_datagram_from_iter+0x10e/0x1e0=0A=
[=A0 131.484153]=A0 unix_stream_sendmsg+0x29d/0x700=0A=
[=A0 131.484158]=A0 sock_sendmsg+0x5f/0x70=0A=
[=A0 131.484161]=A0 sock_write_iter+0x89/0xe0=0A=
[=A0 131.484164]=A0 vfs_write+0x34e/0x3e0=0A=
[=A0 131.484172]=A0 ksys_write+0x97/0xd0=0A=
[=A0 131.484174]=A0 do_syscall_64+0x5b/0x80=0A=
[=A0 131.484179]=A0 ? do_pselect.constprop.0+0xe9/0x150=0A=
[=A0 131.484184]=A0 ? syscall_exit_to_user_mode+0x17/0x40=0A=
[=A0 131.484187]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 131.484189]=A0 ? exit_to_user_mode_prepare+0x18f/0x1f0=0A=
[=A0 131.484196]=A0 ? syscall_exit_to_user_mode+0x17/0x40=0A=
[=A0 131.484198]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 131.484200]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 131.484203]=A0 ? do_syscall_64+0x67/0x80=0A=
[=A0 131.484206]=A0 entry_SYSCALL_64_after_hwframe+0x63/0xcd=0A=
[=A0 131.484209] RIP: 0033:0x7f163431e0c4=0A=
[=A0 131.484233] Code: 15 71 7d 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff e=
b b7 0f 1f 00 f3 0f 1e fa 80 3d 3d 05 0e 00 00 74 13 b8 01 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 48 83 ec 28 48 89 54 24 18 48=0A=
[=A0 131.484234] RSP: 002b:00007fff4a53a0f8 EFLAGS: 00000202 ORIG_RAX: 0000=
000000000001=0A=
[=A0 131.484237] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f163=
431e0c4=0A=
[=A0 131.484238] RDX: 0000000000008008 RSI: 00005616cc753130 RDI: 000000000=
0000004=0A=
[=A0 131.484239] RBP: 00005616ca8dc080 R08: 0000000000008008 R09: 000000000=
0000000=0A=
[=A0 131.484248] R10: 00007fff4a53a1d0 R11: 0000000000000202 R12: 00007fff4=
a53a150=0A=
[=A0 131.484250] R13: 0000000000000002 R14: 00007fff4a53a250 R15: 00007fff4=
a53a1d0=0A=
[=A0 131.484254]=A0 </TASK>=0A=
[=A0 131.484267] Modules linked in: ntfs3 uinput snd_seq_dummy snd_hrtimer =
snd_seq snd_seq_device snd_timer snd soundcore nft_objref nf_conntrack_netb=
ios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fi=
b nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain=
_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tab=
les nfnetlink qrtr vfat fat iTCO_wdt ppdev intel_pmc_bxt iTCO_vendor_suppor=
t parport_pc i2c_i801 parport pcspkr i2c_smbus joydev lpc_ich zram virtio_n=
et virtio_gpu net_failover serio_raw failover virtio_console virtio_dma_buf=
 aacraid mvsas libsas vmw_pvscsi megaraid_sas megaraid smartpqi pmcraid uas=
 vhci_hcd usbip_core xhci_plat_hcd usb_storage nvme nvme_core nvme_common m=
ptspi scsi_transport_spi mptsas mptscsih mptbase scsi_transport_sas sunrpc =
be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls cxgb3i cxgb3 mdio libcxgbi libcxgb=
 qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_is=
csi ip6_tables ip_tables fuse=0A=
[=A0 131.484334]=A0 qemu_fw_cfg=0A=
[=A0 131.484342] CR2: 0000000000001001=0A=
[=A0 131.484347] ---[ end trace 0000000000000000 ]---=0A=
[=A0 131.484349] RIP: 0010:copy_page_from_iter+0x76/0x170=0A=
[=A0 131.484353] Code: 4c 89 e2 4c 29 fe 4c 39 f6 49 0f 47 f6 48 2b 3d 40 a=
b 18 01 48 c1 ff 06 48 c1 e7 0c 48 03 3d 41 ab 18 01 4c 01 ff e8 09 fa ff <=
ff> 48 01 c5 49 29 c6 74 5f 48 85 c0 74 5a 49 01 c7 49 81 ff 00 10=0A=
[=A0 131.484355] RSP: 0018:ffffb70000c97bc8 EFLAGS: 00010286=0A=
[=A0 131.484357] RAX: 0000000000001000 RBX: ffffe5cfc0dc30c0 RCX: 000000000=
0004008=0A=
[=A0 131.484358] RDX: 0000000000004000 RSI: 00005616cc757138 RDI: ffff99ed7=
70c4000=0A=
[=A0 131.484359] RBP: 0000000000003000 R08: 326e73452c4e6cb7 R09: 7227a8304=
c2683b2=0A=
[=A0 131.484360] R10: cb3f3c018be49eba R11: 219097ff2b911ec9 R12: ffffb7000=
0c97d18=0A=
[=A0 131.484361] R13: 0000000000001000 R14: 0000000000005000 R15: 000000000=
0000000=0A=
[=A0 131.484363] FS:=A0 00007f1634972c40(0000) GS:ffff99eebbc00000(0000) kn=
lGS:0000000000000000=0A=
[=A0 131.484364] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[=A0 131.484365] CR2: 0000000000001001 CR3: 0000000019ec2000 CR4: 000000000=
00006f0=0A=
=0A=
=0A=
RUN5: success=0A=
copy:=0A=
Tue Jan=A0 3 07:16:29 PM IST 2023=0A=
Tue Jan=A0 3 07:32:07 PM IST 2023=0A=
16 min=0A=
verify:=0A=
Tue Jan=A0 3 07:32:53 PM IST 2023=0A=
Tue Jan=A0 3 07:48:19 PM IST 2023=0A=
Tue Jan=A0 3 07:57:29 PM IST 2023=0A=
Tue Jan=A0 3 08:13:25 PM IST 2023=0A=
16 min=0A=
=0A=
[root@sirius ~]# ls -l /mnt/a17/gkpics01.qcow2=A0 ; df | grep sda17=0A=
-rw-r--r--. 1 gana gana 91077017600 Jan=A0 3 19:56 /mnt/a17/gkpics01.qcow2=
=0A=
/dev/sda17=A0=A0=A0=A0=A0=A0 97517564=A0=A0 89051588=A0=A0 8465976=A0 92% /=
mnt/a17=0A=
=0A=
=0A=
=0A=
RUN6: success=0A=
mounted src vdisk using ntfs-3g fuseblk driver.=0A=
src: ntfs3g-fuseblk/sdc/vhdx/ntfs3/hdd=0A=
dst: ntfs3/sdb/qcow2-dynamic/ntfs3/ssd=0A=
=0A=
copy=0A=
Tue Jan=A0 3 09:12:17 PM IST 2023=0A=
Tue Jan=A0 3 09:28:51 PM IST 2023=0A=
16 min=0A=
verify=0A=
Tue Jan=A0 3 09:30:23 PM IST 2023=0A=
Tue Jan=A0 3 09:51:04 PM IST 2023=0A=
Tue Jan=A0 3 10:14:27 PM IST 2023=0A=
Tue Jan=A0 3 10:29:20 PM IST 2023=0A=
15 min=0A=
