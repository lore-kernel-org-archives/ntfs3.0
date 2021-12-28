Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-oln040092074053.outbound.protection.outlook.com [40.92.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA51173
	for <ntfs3@lists.linux.dev>; Tue, 28 Dec 2021 20:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbupdqffA4QZxNqnZ7mdpGHtOcMIR8wCCpptdzTitvr+IUrUmQNqfgN3O4u/Zm5NJCEvijq5JYJTPC2oguiFUNWVFtDPfrTwfig7gGywE9j4SFU9126WnK+n0IgV4v7Co7hswxjBxEY4C1d3OhYa/DMgXLLmN0M6AAAZeMcahOUSAOEa1+uu0kGYOFTgmSTEKLLn9zD8QKKI/YuI+7HhiMOwGx5ltaR5tWm4YhQgQHYspiqw5N/JNpULXuR7w/A7v8YzQijDPHqm/YI0Bj3jbS6BGyZKwCVuWcnxcRj/6nu/ap17lBFA5js7d4JMVfGriiQN41Xt0Xop7At9RmUG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qfv1GFXbJ7a8pEbEpYJxfrOL1Pmnq8aes9qF/WOkvjg=;
 b=IZmTR1mt24GUa3tu6Ta2Nq0lzSX+7gkpJu7JjJqdmQIrhjqAsVxAOnd6+i1eTcOSKhQJW7tbf0jqvlG3mS1tnETRnHEeV0D50mDzCYQOMDZn7gLOkZfPxTIMU/yWmUgD52KFqhl3v0mCG9CvgSTwxXhgsl2idk1luMA+AxSl7d1ix36qcdLcGJ927U9OSi7wITQ75G8tLIe6k6yqFlWMzsAKff/J/gjr8QtdIvxweGb/ka4H9rVrh+bWoeV6/CxwEo/Q7RfcmtsByM3wUZAJyq/zTv4HdZxF/MkVIXtxtHSnmRba6Ib4g3WuNdH11K4GiPAEVzBV4h6VczaqvNNNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfv1GFXbJ7a8pEbEpYJxfrOL1Pmnq8aes9qF/WOkvjg=;
 b=Xe6sBoXhjggZaSV4ZA4WwBwSLviMBXxlFkXiJ5/U2g9+K5gEwkgXLFLpLvFir6gvs8Az7Tw6F/nbj3T/gXkldiCpONFe04k1Zd85HfuX4N53u8B4UOZ5+JOYgPkWCs1vFPiuZuOps25V17M8qyZOqe+yLMlRI/G9bDNKNcZTrYl0qbIKeitgejYzWKkZjLD1HDGIRkJ/M3WmoQbOSuQt3KQYXT+LbivHmc/PRdbrCJ8XUldF8rc7HoT3RuzoEXRkHxf31rLSJxbRlHYKja7VCyfVuhgmK/Kvd19Hs8fbciSv9WB39rKmazLeVx7PBku9rbX+1I8NV9b0H/M65syMZA==
Received: from AM5P195MB0067.EURP195.PROD.OUTLOOK.COM (2603:10a6:203:8c::14)
 by AS8P195MB1384.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 20:45:08 +0000
Received: from AM5P195MB0067.EURP195.PROD.OUTLOOK.COM
 ([fe80::39d0:eff7:60c3:e5d]) by AM5P195MB0067.EURP195.PROD.OUTLOOK.COM
 ([fe80::39d0:eff7:60c3:e5d%12]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 20:45:08 +0000
From: August Wikerfors <august.wikerfors@outlook.com>
To: Matthew Wilcox <willy@infradead.org>
CC: Mohan R <mohan43u@gmail.com>, "uwe.sauter.de@gmail.com"
	<uwe.sauter.de@gmail.com>, "almaz.alexandrovich@paragon-software.com"
	<almaz.alexandrovich@paragon-software.com>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>
Subject: Re: Bug using new ntfs3 file system driver (5.15.2 on Arch Linux)
Thread-Topic: Bug using new ntfs3 file system driver (5.15.2 on Arch Linux)
Thread-Index: AQHX/Ao7+6Bvk4spQ0ycJTUwUFBv16xIbcOA
Date: Tue, 28 Dec 2021 20:45:08 +0000
Message-ID: <eebbb053-841e-b4f1-e030-4d4e860b70fb@outlook.com>
References:
 <CAFYqD2pe-sjPrHXGsNCHa2fcdECNm44UEZbEn4P5VgygFnrn7A@mail.gmail.com>
 <YaJFoadpGAwPfdLv@casper.infradead.org>
In-Reply-To: <YaJFoadpGAwPfdLv@casper.infradead.org>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: AM5P195MB0067.EURP195.PROD.OUTLOOK.COM
 (15.20.4823.023)
suggested_attachment_session_id: 179b3a58-d337-5e22-f273-0f609633e8aa
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [r3I2wenZpdMDuaw3VbzDm2nu7kTAAnRb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c55760f-d5be-4a0c-90ce-08d9ca42ef64
x-ms-traffictypediagnostic: AS8P195MB1384:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3QFZzBrS90bFK9EpDYe5Xo/zGuXAzPR3HOSi0IkqByPyJoFZtFrStlzGRpOSeMwjTQtotcOVxuyTmr1jyEitlRLLurZdbnA0Ubr2WEM0WPLrMP2ZQ6W/1Tl/zXF5cEzsAtIYyodOgnvF53QYpDD0w+Xs6ubCB9It3f/yFtfBufTiEdRKJbvSYTV+MREEa5VcVJbLKXtgZoBH+w9Vf9RhsbPinRg+5wT8JyVqsR8q5RiQ5MMXNKHULicD5VQbO5et/GR3Tz6Sv1WvpCQ4TrpST2DplESgPINWDb9745DcC27TcuefJMYHkBYXEXD7PYh872+8cQahOYiAyhIxBAD5JOua/bPIIwUKP8MLYCMUaeFg64212PDF53rW2t5urRooIlBWlLG3cn5ANZvM5T0X6Bk3FBIE6/cg1v30Vg693q2BadJkEHmEFK13svNIHgVUfcVV+96U1TxggUQzFdlurmmIkFs885AUNgvjHXlxzpSyZpMzPu/qMZxmF50KuwUX+RkR38KRjSOBtaX9rEIknSuxtxXAu4i74zZPg0BP4tseMNH/tNUXHDK6FeOngHJYjdEw0sCR0Af/avPBa9vdCw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 Mzdz2ar1JNEO0i6JZASouN09N42QMUNQoDQXSueUiHtyM7ngNoaB8Eiesfjt8ZqgeJWnrUgtn2NRZtYaUdKJZx1dfUyZRIWqS7nBZ/KyN22O9V3p0z1Y5Bg1ExtXgKekzcXxhT46S3Ig2SA0TPqexqkiXMK/V804PGDM77AxsuOwbMWlT7laJyZL4x1TrrkQfks9tivNm7kdj0jxGqK5rd1niXVhPVUCGaniakZ8lVw3C/YE5Tu5dkm70Sh/HZ8sp3peqcjx1UfkO7JXo+5WgpLhKJWKuWiPKmBkxJiBf/GVqBb0yx73kroJ9UkQdcR/59lv0UYocQqyVjTzHPsq/ERm7e0FKasVrXHaHjqThcBgw3UDoXM5imjzpa9UnWwl6Tzcv0RW3+dfY/Slypr2QQWsvc1Y/10N1K51kBB62PK7G1BPaLUBmim01M6ebohiHaRMDWc4jv3sJ4kKboXjOeAwF5OvOF4QmdMUQNyTJQy4H9IRITdVg0XXsh/5VjvmBXyHjXdoExP/bzWoXWfIPAFbW4zMUQZFcLLQUpQUYJircXC99F2n98Z4cai0rI7Q7yo7I7ZBXZtaBg157q6cFyala+04qqpaF0rDx0C9PjJoIUbrikNUnbFXdnOd6aspQzSsOAIevjKDZtoveRkkGseUw0K90HKZW/5rsfdpwLMg/L9F1VPqcl3B13UodCpfkcoaj5vp5wsWrkX9DFXmUDk7rOHxJx6Kc75sklSze36heOTPaio1rl56+JfMqNGEX2JYSDcDXIC5XZZ+qFv86fCeAA8mEHH1nE77H3O4YqQzmx4H5bXESAy2xfpUFIJJ0Yz21NUHMpP0BX10FBlobtmDvyl++BO1M/9XAW8YCR+AmqDi5EojbJYXZRNHksJGRjbO6xk/2lOa744uAQX6ypBHwpBmSJeDFy7Alxc8xWwz5qQ+TPzc2XcxsAnoAzII
Content-Type: text/plain; charset="iso-8859-1"
Content-ID:
 <3B682183016C8D459AC9E82948433CDB@sct-15-20-4755-11-msonline-outlook-49ed2.templateTenant>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5P195MB0067.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c55760f-d5be-4a0c-90ce-08d9ca42ef64
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2021 20:45:08.1873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1384

Hi, I ran into a bug with a very similar call trace, also when copying file=
s=0A=
with rsync from a filesystem mounted using ntfs3. I was able to reproduce i=
t=0A=
on both the default Arch Linux kernel (5.15.11-arch2-1) and on mainline=0A=
5.16-rc7.=0A=
=0A=
> This is where the real bug happened.  It would be helpful if you=0A=
> could run=0A=
> ./scripts/faddr2line /path/to/vmlinux page_cache_ra_unbounded+0x1c5/0x250=
=0A=
> =0A=
> It'll spit out something like:=0A=
> page_cache_ra_unbounded at mm/readahead.c:241=0A=
> =0A=
> but probably a different line number from that.=0A=
I had to rebuild the vmlinux of my kernels in order for this to work but th=
e=0A=
output for the page_cache_ra_unbounded line is below the dmesg outputs.=0A=
=0A=
5.15.11-arch2-1 dmesg:=0A=
[  486.360050] BUG: unable to handle page fault for address: ffffff8306d925=
ff=0A=
[  486.360083] #PF: supervisor instruction fetch in kernel mode=0A=
[  486.360113] #PF: error_code(0x0010) - not-present page=0A=
[  486.360142] PGD 171815067 P4D 171815067 PUD 0 =0A=
[  486.360160] Oops: 0010 [#1] PREEMPT SMP PTI=0A=
[  486.360177] CPU: 2 PID: 1129 Comm: rsync Tainted: G           OE     5.1=
5.11-arch2-1 #1 03010ffba27108079ccfa4d61c5b01422e5fb7c7=0A=
[  486.360216] Hardware name: ASUSTeK COMPUTER INC. S551LN/S551LN, BIOS S55=
1LN.209 07/08/2014=0A=
[  486.360243] RIP: 0010:0xffffff8306d925ff=0A=
[  486.360260] Code: Unable to access opcode bytes at RIP 0xffffff8306d925d=
5.=0A=
[  486.360302] RSP: 0018:ffffaa9ec0f8fb37 EFLAGS: 00010246=0A=
[  486.360322] RAX: 0000000000000000 RBX: 00000000000002ab RCX: 00000000000=
00000=0A=
[  486.360355] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000=0A=
[  486.360389] RBP: ffaa9ec0f8fbf800 R08: 0000000000000000 R09: 00000000000=
00000=0A=
[  486.360413] R10: 0000000000000000 R11: 0000000000000000 R12: ff99687f574=
6e000=0A=
[  486.360456] R13: 00000001112ccaff R14: fffcbb8097368000 R15: 00000000000=
001ff=0A=
[  486.360481] FS:  00007f9a38011580(0000) GS:ffff9968a6f00000(0000) knlGS:=
0000000000000000=0A=
[  486.360509] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  486.360529] CR2: ffffff8306d925d5 CR3: 000000013e140001 CR4: 00000000001=
706e0=0A=
[  486.360553] Call Trace:=0A=
[  486.360564]  <TASK>=0A=
[  486.360584] BUG: unable to handle page fault for address: ffffaa9ec0f900=
00=0A=
[  486.360608] #PF: supervisor read access in kernel mode=0A=
[  486.360626] #PF: error_code(0x0000) - not-present page=0A=
[  486.360644] PGD 100000067 P4D 100000067 PUD 1001be067 PMD 10ed20067 PTE =
0=0A=
[  486.360669] Oops: 0000 [#2] PREEMPT SMP PTI=0A=
[  486.360685] CPU: 2 PID: 1129 Comm: rsync Tainted: G           OE     5.1=
5.11-arch2-1 #1 03010ffba27108079ccfa4d61c5b01422e5fb7c7=0A=
[  486.360723] Hardware name: ASUSTeK COMPUTER INC. S551LN/S551LN, BIOS S55=
1LN.209 07/08/2014=0A=
[  486.360769] RIP: 0010:show_trace_log_lvl+0x1a4/0x32d=0A=
[  486.360789] Code: c7 c4 64 25 84 e8 0f be 00 00 4d 85 ed 74 41 0f b6 95 =
37 ff ff ff 4c 89 f1 4c 89 ee 48 8d bd 50 ff ff ff e8 dc fd ff ff eb 26 <4c=
> 8b 3b 48 8d bd 70 ff ff ff e8 2e 2e 52 ff 4c 89 ff 48 89 85 28=0A=
[  486.360866] RSP: 0018:ffffaa9ec0f8f8c8 EFLAGS: 00010012=0A=
[  486.360885] RAX: 0000000000000000 RBX: ffffaa9ec0f8ffff RCX: 00000000000=
00000=0A=
[  486.360910] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000=0A=
[  486.360934] RBP: ffffaa9ec0f8f9a8 R08: 0000000000000000 R09: 00000000000=
00000=0A=
[  486.360958] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9967a28=
01fc0=0A=
[  486.360983] R13: 0000000000000000 R14: ffffffff8427d77f R15: 00000000000=
02b00=0A=
[  486.361006] FS:  00007f9a38011580(0000) GS:ffff9968a6f00000(0000) knlGS:=
0000000000000000=0A=
[  486.361033] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  486.361053] CR2: ffffaa9ec0f90000 CR3: 000000013e140001 CR4: 00000000001=
706e0=0A=
[  486.361077] Call Trace:=0A=
[  486.361087]  <TASK>=0A=
[  486.361098]  __die_body.cold+0x1a/0x1f=0A=
[  486.361114]  page_fault_oops+0x19e/0x310=0A=
[  486.361142]  exc_page_fault+0xda/0x180=0A=
[  486.361159]  asm_exc_page_fault+0x1e/0x30=0A=
[  486.361177] RIP: 0010:0xffffff8306d925ff=0A=
[  486.361192] Code: Unable to access opcode bytes at RIP 0xffffff8306d925d=
5.=0A=
[  486.361214] RSP: 0018:ffffaa9ec0f8fb37 EFLAGS: 00010246=0A=
[  486.361232] RAX: 0000000000000000 RBX: 00000000000002ab RCX: 00000000000=
00000=0A=
[  486.361255] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000=0A=
[  486.361279] RBP: ffaa9ec0f8fbf800 R08: 0000000000000000 R09: 00000000000=
00000=0A=
[  486.361302] R10: 0000000000000000 R11: 0000000000000000 R12: ff99687f574=
6e000=0A=
[  486.361324] R13: 00000001112ccaff R14: fffcbb8097368000 R15: 00000000000=
001ff=0A=
[  486.361349]  ? page_cache_ra_unbounded+0x1c5/0x250=0A=
[  486.361369]  ? filemap_get_pages+0x117/0x730=0A=
[  486.361386]  ? make_kuid+0xf/0x20=0A=
[  486.361401]  ? generic_permission+0x27/0x210=0A=
[  486.361419]  ? walk_component+0x11d/0x1c0=0A=
[  486.361435]  ? filemap_read+0xb9/0x360=0A=
[  486.361451]  ? new_sync_read+0x159/0x1f0=0A=
[  486.361467]  ? vfs_read+0xff/0x1a0=0A=
[  486.361489]  ? ksys_read+0x67/0xf0=0A=
[  486.361503]  ? do_syscall_64+0x5c/0x90=0A=
[  486.361517]  ? __audit_syscall_exit+0x255/0x2c0=0A=
[  486.361533]  ? syscall_exit_to_user_mode+0x23/0x50=0A=
[  486.362508]  ? do_syscall_64+0x69/0x90=0A=
[  486.363455]  ? do_syscall_64+0x69/0x90=0A=
[  486.364401]  ? do_syscall_64+0x69/0x90=0A=
[  486.365322]  ? entry_SYSCALL_64_after_hwframe+0x44/0xae=0A=
[  486.366263]  </TASK>=0A=
[  486.367197] Modules linked in: 8021q garp mrp stp llc nls_iso8859_1 vfat=
 fat uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_c=
ommon videodev mc x86_pkg_temp_thermal intel_powerclamp mt76x0e snd_hda_cod=
ec_realtek coretemp snd_hda_codec_generic ledtrig_audio rtsx_usb_ms snd_hda=
_codec_hdmi memstick kvm_intel mt76x0_common ntfs3 snd_hda_intel kvm mt76x0=
2_lib joydev asus_nb_wmi intel_spi_platform intel_spi spi_nor asus_wmi mt76=
 mtd mousedev iTCO_wdt snd_intel_dspcfg sparse_keymap intel_pmc_bxt mei_hdc=
p intel_rapl_msr iTCO_vendor_support at24 irqbypass platform_profile mxm_wm=
i mac80211 snd_intel_sdw_acpi snd_hda_codec snd_hda_core crct10dif_pclmul i=
915 crc32_pclmul r8169 snd_hwdep libarc4 cfg80211 snd_pcm ghash_clmulni_int=
el aesni_intel crypto_simd snd_timer rfkill realtek cryptd mdio_devres proc=
essor_thermal_device_pci_legacy libphy rapl processor_thermal_device intel_=
cstate snd pcspkr processor_thermal_rfim processor_thermal_mbox intel_uncor=
e processor_thermal_rapl=0A=
[  486.367240]  mei_me intel_rapl_common soundcore ttm mei intel_soc_dts_io=
sf intel_gtt video lpc_ich i2c_i801 int3402_thermal i2c_smbus intel_pch_the=
rmal psmouse int3400_thermal int340x_thermal_zone wmi acpi_thermal_rel asus=
_wireless mac_hid vboxnetflt(OE) vboxnetadp(OE) vboxdrv(OE) crypto_user fus=
e bpf_preload ip_tables x_tables btrfs blake2b_generic libcrc32c crc32c_gen=
eric xor raid6_pq rtsx_usb_sdmmc mmc_core rtsx_usb serio_raw atkbd libps2 c=
rc32c_intel xhci_pci sr_mod i8042 cdrom xhci_pci_renesas serio=0A=
[  486.376305] CR2: ffffaa9ec0f90000=0A=
[  486.377512] ---[ end trace 2b657e7ade0f9e60 ]---=0A=
[  486.378748] RIP: 0010:0xffffff8306d925ff=0A=
[  486.380001] Code: Unable to access opcode bytes at RIP 0xffffff8306d925d=
5.=0A=
[  486.381220] RSP: 0018:ffffaa9ec0f8fb37 EFLAGS: 00010246=0A=
[  486.382432] RAX: 0000000000000000 RBX: 00000000000002ab RCX: 00000000000=
00000=0A=
[  486.383656] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000=0A=
[  486.384871] RBP: ffaa9ec0f8fbf800 R08: 0000000000000000 R09: 00000000000=
00000=0A=
[  486.386072] R10: 0000000000000000 R11: 0000000000000000 R12: ff99687f574=
6e000=0A=
[  486.387278] R13: 00000001112ccaff R14: fffcbb8097368000 R15: 00000000000=
001ff=0A=
[  486.388478] FS:  00007f9a38011580(0000) GS:ffff9968a6f00000(0000) knlGS:=
0000000000000000=0A=
[  486.389684] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  486.390890] CR2: ffffff8306d925d5 CR3: 000000013e140001 CR4: 00000000001=
706e0=0A=
=0A=
$ scripts/faddr2line vmlinux.5.15.11-arch2-1 page_cache_ra_unbounded+0x1c5/=
0x250=0A=
page_cache_ra_unbounded+0x1c5/0x250:=0A=
filemap_invalidate_unlock_shared at include/linux/fs.h:853=0A=
(inlined by) page_cache_ra_unbounded at mm/readahead.c:240=0A=
=0A=
5.16-rc7 dmesg:=0A=
[  258.570806] ------------[ cut here ]------------=0A=
[  258.570810] kernel BUG at mm/readahead.c:151!=0A=
[  258.570817] invalid opcode: 0000 [#1] PREEMPT SMP PTI=0A=
[  258.570822] CPU: 0 PID: 1136 Comm: rsync Not tainted 5.16.0-rc7-1-mainli=
ne #1 b49cff4185a0eb169c9f956a386eb3a9156e4796=0A=
[  258.570827] Hardware name: ASUSTeK COMPUTER INC. S551LN/S551LN, BIOS S55=
1LN.209 07/08/2014=0A=
[  258.570829] RIP: 0010:read_pages+0x26c/0x280=0A=
[  258.570836] Code: eb 87 48 8b 07 48 c1 e8 38 83 e0 07 83 f8 04 75 e4 48 =
8b 47 08 8b 40 68 83 e8 01 83 f8 01 77 d5 e8 39 18 00 00 e9 5f ff ff ff <0f=
> 0b 0f 0b e8 bb 4d 96 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f=0A=
[  258.570838] RSP: 0018:ffff9d59c0b1fa78 EFLAGS: 00010206=0A=
[  258.570842] RAX: ff9d59c0b1fb1000 RBX: ffff9d59c0b1fbc0 RCX: 00000000000=
00000=0A=
[  258.570844] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000=0A=
[  258.570846] RBP: ffff9d59c0b1fb0f R08: 0000000000000000 R09: 00000000000=
00000=0A=
[  258.570848] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000=0A=
[  258.570850] R13: 0000000000000000 R14: ffffc4ba4632d680 R15: 00000000000=
00002=0A=
[  258.570852] FS:  00007f9a9ec98580(0000) GS:ffff8b9f26e00000(0000) knlGS:=
0000000000000000=0A=
[  258.570855] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  258.570857] CR2: 00005646e709b000 CR3: 00000001361ee005 CR4: 00000000001=
706f0=0A=
[  258.570860] Call Trace:=0A=
[  258.570862]  <TASK>=0A=
[  258.570865]  page_cache_ra_unbounded+0x1d9/0x270=0A=
[  258.570872]  filemap_get_pages+0x11e/0x7e0=0A=
[  258.570878]  ? generic_permission+0x27/0x210=0A=
[  258.570885]  ? walk_component+0x11d/0x1c0=0A=
[  258.570891]  filemap_read+0xcc/0x380=0A=
[  258.570897]  new_sync_read+0x159/0x1f0=0A=
[  258.570902]  vfs_read+0xff/0x1a0=0A=
[  258.570907]  ksys_read+0x67/0xf0=0A=
[  258.570911]  do_syscall_64+0x5c/0x90=0A=
[  258.570919]  ? syscall_exit_to_user_mode+0x23/0x50=0A=
[  258.570923]  ? do_syscall_64+0x69/0x90=0A=
[  258.570927]  ? exit_to_user_mode_prepare+0x8d/0x180=0A=
[  258.570932]  ? syscall_exit_to_user_mode+0x23/0x50=0A=
[  258.570935]  ? do_syscall_64+0x69/0x90=0A=
[  258.570938]  ? do_syscall_64+0x69/0x90=0A=
[  258.570942]  ? do_syscall_64+0x69/0x90=0A=
[  258.570946]  entry_SYSCALL_64_after_hwframe+0x44/0xae=0A=
[  258.570951] RIP: 0033:0x7f9a9edb0862=0A=
[  258.570954] Code: c0 e9 b2 fe ff ff 50 48 8d 3d 5a 29 0a 00 e8 55 e4 01 =
00 0f 1f 44 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 0f 05 <48=
> 3d 00 f0 ff ff 77 56 c3 0f 1f 44 00 00 48 83 ec 28 48 89 54 24=0A=
[  258.570957] RSP: 002b:00007ffdd97ee518 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000000=0A=
[  258.570960] RAX: ffffffffffffffda RBX: 00005646e6850640 RCX: 00007f9a9ed=
b0862=0A=
[  258.570962] RDX: 000000000000219e RSI: 00005646e6f1cab0 RDI: 00000000000=
00003=0A=
[  258.570964] RBP: 000000000000219e R08: 0000000000000000 R09: 00007f9a9ee=
81a60=0A=
[  258.570966] R10: 00007f9a9ee821b0 R11: 0000000000000246 R12: 00000000000=
00000=0A=
[  258.570968] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
0219e=0A=
[  258.570971]  </TASK>=0A=
[  258.570972] Modules linked in: 8021q garp mrp stp llc nls_iso8859_1 vfat=
 fat uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_c=
ommon videodev mc ntfs3 intel_spi_platform intel_spi x86_pkg_temp_thermal s=
pi_nor intel_powerclamp mtd snd_hda_codec_realtek rtsx_usb_ms coretemp iTCO=
_wdt snd_hda_codec_generic memstick intel_pmc_bxt snd_hda_codec_hdmi kvm_in=
tel iTCO_vendor_support ledtrig_audio kvm joydev mousedev at24 asus_nb_wmi =
intel_rapl_msr mei_hdcp asus_wmi mt76x0e sparse_keymap platform_profile irq=
bypass crct10dif_pclmul snd_hda_intel mt76x0_common snd_intel_dspcfg crc32_=
pclmul mt76x02_lib ghash_clmulni_intel aesni_intel mt76 crypto_simd snd_int=
el_sdw_acpi mac80211 snd_hda_codec libarc4 cfg80211 cryptd snd_hda_core rfk=
ill r8169 rapl intel_cstate realtek intel_uncore mxm_wmi mdio_devres libphy=
 i915 processor_thermal_device_pci_legacy processor_thermal_device processo=
r_thermal_rfim snd_hwdep i2c_i801 processor_thermal_mbox snd_pcm snd_timer =
processor_thermal_rapl mei_me=0A=
[  258.571036]  video mei i2c_smbus ttm lpc_ich intel_rapl_common snd intel=
_gtt intel_pch_thermal soundcore mac_hid intel_soc_dts_iosf psmouse pcspkr =
int3400_thermal wmi int3402_thermal acpi_thermal_rel int340x_thermal_zone a=
sus_wireless crypto_user fuse bpf_preload ip_tables x_tables btrfs blake2b_=
generic libcrc32c crc32c_generic xor raid6_pq rtsx_usb_sdmmc mmc_core rtsx_=
usb serio_raw atkbd libps2 xhci_pci crc32c_intel sr_mod i8042 cdrom xhci_pc=
i_renesas serio=0A=
[  258.571071] ---[ end trace 685ffdce3faf85b7 ]---=0A=
[  258.571073] RIP: 0010:read_pages+0x26c/0x280=0A=
[  258.571077] Code: eb 87 48 8b 07 48 c1 e8 38 83 e0 07 83 f8 04 75 e4 48 =
8b 47 08 8b 40 68 83 e8 01 83 f8 01 77 d5 e8 39 18 00 00 e9 5f ff ff ff <0f=
> 0b 0f 0b e8 bb 4d 96 00 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f=0A=
[  258.571079] RSP: 0018:ffff9d59c0b1fa78 EFLAGS: 00010206=0A=
[  258.571081] RAX: ff9d59c0b1fb1000 RBX: ffff9d59c0b1fbc0 RCX: 00000000000=
00000=0A=
[  258.571083] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000=0A=
[  258.571085] RBP: ffff9d59c0b1fb0f R08: 0000000000000000 R09: 00000000000=
00000=0A=
[  258.571087] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000=0A=
[  258.571088] R13: 0000000000000000 R14: ffffc4ba4632d680 R15: 00000000000=
00002=0A=
[  258.571090] FS:  00007f9a9ec98580(0000) GS:ffff8b9f26e00000(0000) knlGS:=
0000000000000000=0A=
[  258.571093] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  258.571095] CR2: 00005646e709b000 CR3: 00000001361ee005 CR4: 00000000001=
706f0=0A=
=0A=
$ scripts/faddr2line vmlinux.5.16.0-rc7-1-mainline page_cache_ra_unbounded+=
0x1d9/0x270=0A=
page_cache_ra_unbounded+0x1d9/0x270:=0A=
filemap_invalidate_unlock_shared at include/linux/fs.h:850=0A=
(inlined by) page_cache_ra_unbounded at mm/readahead.c:239=0A=
