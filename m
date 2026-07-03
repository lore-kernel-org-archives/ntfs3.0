Received: from libero.it (smtp-35.italiaonline.it [213.209.10.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82CA346E60
	for <ntfs3@lists.linux.dev>; Fri,  3 Jul 2026 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.209.10.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061367; cv=none; b=X3ttGsntV6xu8HtoCG6kWcq/WHczAlx7PrueZKY7DD/CDc3S6b3l/Ddr4tm1On+DfdXOJK2GAkdSDzLrkzjO+Clq6hlp9Big8NRmriA3vleIlOfc8+Ljs6n4b5hLW8aoNUfYgOnB5GcaatQPnE2eftYFW9JdYt++jyhKWa0WDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061367; c=relaxed/simple;
	bh=wWi6l0nPd1IVPlH1RIad3yjYWWWCn6E2OkRVHHoFERY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UDxcheE6/3fibePiA5hqFnkLR5DQNuhIFbByVErIuc7PiTAi2MGWZX46y14ULMNTgvniBxLwc7jz2dZdh0kGrJWS9Ck+dxGwecIi5S/zN0w++Lea4CSQu4f9IrWGHZ/bnBPt3036duQ+FjQZ4gLWqgDb/tEd1fif5PiWTjJfG3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it; spf=pass smtp.mailfrom=libero.it; dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b=iS1CDm6F; arc=none smtp.client-ip=213.209.10.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=libero.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b="iS1CDm6F"
Received: from oxapps-15-090.iol.local ([10.101.8.100])
	by smtp-35.iol.local with ESMTPA
	id fXfhwZjxr9xYCfXfhwJdKO; Fri, 03 Jul 2026 08:46:46 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
	t=1783061206; bh=wWi6l0nPd1IVPlH1RIad3yjYWWWCn6E2OkRVHHoFERY=;
	h=From;
	b=iS1CDm6FYrQpHQr08qlm7jyXpZfP5ZD5zLRRfd8rQZ3YBgReovpjJS4qvj4VNKJUp
	 yeI+eFCGWrr4iYQYtPwrzol6aTzaDdDMlvQYnvp68uAxmjDUvhZPU9JKlM8fmqrb4B
	 FU5+p4wfzPIby3x6gsRSt/bo5zR9I4OOUE7CCTUyoidBGmmisZ86I8mvBBch9pXMb/
	 hbkCcA4cF/DyFZmd0+BHPehiIxEUdKYiynk8c37KwAs3mY+/B06/BibFCO1uI3WDji
	 P7RT2U/dTai468WtEuv9mZ/dPK0bjDVKLF02+frXpoNVFE8fucAPZ50XHYYjXFEWm1
	 0UYWbU8vbe9TQ==
X-CNFS-Analysis: v=2.4 cv=XrbK/1F9 c=1 sm=1 tr=0 ts=6a475ad6 cx=a_exe
 a=1zo9O5OOLDVXMJ/sd9tkAw==:117 a=3XDHkd54CWoA:10 a=IkcTkHD0fZMA:10
 a=pGLkceISAAAA:8 a=pSRQw0l3yZd-r8pAL-UA:9 a=QEXdDO2ut3YA:10
 a=jDifsB9XUASgAWHV9MPB:22
Date: Fri, 3 Jul 2026 08:46:45 +0200 (CEST)
From: saarthal@libero.it
To: "J. Ortega O." <jorortega@gmail.com>
Cc: 2020820791.1843094.1777717495048@mail1.libero.it,
	almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Message-ID: <1645362126.2961413.1783061205915@mail1.libero.it>
In-Reply-To: <CAOSSAUAv5mJe5KLM4cY+q-DCehFPCMDZHBGAfcCbpZS7BjJnuA@mail.gmail.com>
References: <CAOSSAUAv5mJe5KLM4cY+q-DCehFPCMDZHBGAfcCbpZS7BjJnuA@mail.gmail.com>
Subject: Re: File operations on NTFS drives causes kernel BUG at
 fs/iomap/buffered-io.c:1061
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev87
X-Originating-Client: open-xchange-appsuite
x-libjamsun: pOChXYuBnyn/LC41f6HzeYDBBzbfy/Rj
x-libjamv: pufHek7N73o=
X-CMAE-Envelope: MS4xfFTop9C4uMF1BdTIn4t9YZHngP66by/0+UwsYht0fCTevJzWxHRRbBzYxEmGkQZWdnrYirk3yAvvsgvTvPHl1nZVNAs0LLiasedPx2QeRs2s1khBYOet
 MN9P0logxfM/5NTjwgE9l3GBCgD+kK9eXG79KbyLjJDJ3WPZlYyYRpOLB7thIz5rSxuhStJBpxbGJJpeqf6vP938w75EvpLeTCuUzF6XZZ++sUDgykPn6JkU
 GSE+0lk5cgDImP8fPr8Axh+b9HYs3Ke08n4wJb0C+HkjZ0YGUvr2adyc69I8ZS3D3EgaJ+K/xF3nbBmL5vR8YOSTOoZE8nQIW5dTKHtpqBZDAgHpUv02dAAd
 HLlkOJMN

Yes, I'm also noticing that bug again. It seems less severe (commands don't=
 freeze, they just fail and the device remains locked so I can't remove it =
without powering off.) Can't try 7.2 at the moment as I need this laptop fo=
r work.

> 29/06/2026 06:13 CEST J. Ortega O. <jorortega@gmail.com>:
>=20
>=20
> Not fixed at all.
>=20
> [ 208.706519]------------[ cut here ]------------
> [ 208.706522]kernel BUG at fs/iomap/buffered-io.c:1061!
> [ 208.706531]Oops:invalid opcode: 0000 [#1] SMP NOPTI
> [ 208.706536]CPU:1 UID: 1000 PID: 2437 Comm: KIO::WorkerThre Not tainted =
7.1.1-2-cachyos #1 PREEMPT(full) 2e307dde255357a39e9ab0cfb397fcc9f1cae78a
> [ 208.706541]Hardware name:System manufacturer System Product Name/ROG ST=
RIX X570-F GAMING, BIOS 5044 01/04/2026
> [ 208.706544]RIP:0010:iomap_write_end+0x205/0x210
> [ 208.706549]Code:7d 30 e8 6e a5 89 ff b0 01 48 83 c4 08 5b 41 5c 41 5d 4=
1 5e 41 5f 5d e9 d4 70 72 ff cc 0f 0b 31 c0 eb e6 0f 0b e9 ea fe ff ff <0f>=
 0b cc cc cc cc cc cc cc cc cc 90 9
> 0 90 90 90 90 90 90 90 90 90
> [ 208.706551]RSP:0018:ffffcfb8875b3958 EFLAGS: 00010206
> [ 208.706555]RAX:ffff8ec409324fc0 RBX: 0000000000000000 RCX: fffff51f9ac4=
ed00
> [ 208.706557]RDX:00000000000000b4 RSI: 0000000000000fc0 RDI: ffffcfb8875b=
39d8
> [ 208.706559]RBP:fffff51f9ac4ed00 R08: 0000000000000040 R09: ffff8ec9713b=
40b4
> [ 208.706560]R10:000000000000001a R11: 0000000000000000 R12: ffffcfb8875b=
39d8
> [ 208.706562]R13:0000000000000000 R14: 00000000000000b4 R15: ffffcfb8875b=
3be8
> [ 208.706564]FS:00007f3c419fe6c0(0000) GS:ffff8ed2f94c7000(0000) knlGS:00=
00000000000000
> [ 208.706566]CS:0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 208.706568]CR2:000056242ec0b000 CR3: 00000001871be000 CR4: 0000000000f5=
0ef0
> [ 208.706570]PKRU:55555554
> [ 208.706572]Call Trace:
> [ 208.706574]<TASK>
> [ 208.706578]iomap_file_buffered_write+0x283/0x490
> [ 208.706591]ntfs_file_write_iter.llvm.16129553710235337744+0x2eb/0xc60 [=
ntfs3 6e5706db17f49be1650504f8501b2bcbbe92d84b]
> [ 208.706603]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706606]? do_syscall_64+0xe4/0x3e0
> [ 208.706612]__x64_sys_write+0x251/0x440
> [ 208.706618]do_syscall_64+0xa6/0x3e0
> [ 208.706622]? __se_sys_close.llvm.3544849379875155963+0x76/0xa0
> [ 208.706625]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706628]? kmem_cache_free.cold+0x16d/0x291
> [ 208.706631]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706633]? __fput.llvm.13532003202072619244+0x1d9/0x2c0
> [ 208.706636]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706639]? __se_sys_close.llvm.3544849379875155963+0x76/0xa0
> [ 208.706641]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706644]? do_syscall_64+0xe4/0x3e0
> [ 208.706648]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706650]? do_syscall_64+0xe4/0x3e0
> [ 208.706654]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706656]? do_syscall_64+0xe4/0x3e0
> [ 208.706660]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706662]? do_syscall_64+0xe4/0x3e0
> [ 208.706665]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706668]? do_syscall_64+0xe4/0x3e0
> [ 208.706671]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706673]? do_syscall_64+0xe4/0x3e0
> [ 208.706676]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706678]? do_syscall_64+0xe4/0x3e0
> [ 208.706681]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706683]? do_syscall_64+0xe4/0x3e0
> [ 208.706686]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706688]? do_syscall_64+0xe4/0x3e0
> [ 208.706691]? srso_alias_return_thunk+0x5/0xfbef5
> [ 208.706693]? do_syscall_64+0x65/0x3e0
> [ 208.706697]entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [ 208.706699]RIP:0033:0x7f3c7bab4b42
> [ 208.706718]Code:08 0f 85 01 32 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 c=
e 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3>=
 66 2e 0f 1f 84 00 00 00 00 00 66 2
> e 0f 1f 84 00 00 00 00 00 66
> [ 208.706720]RSP:002b:00007f3c419fd138 EFLAGS: 00000246 ORIG_RAX: 0000000=
000000001
> [ 208.706723]RAX:ffffffffffffffda RBX: 0000000000000000 RCX: 00007f3c7bab=
4b42
> [ 208.706725]RDX:00000000000000b4 RSI: 00007f3c3402b330 RDI: 000000000000=
0016
> [ 208.706727]RBP:00000000000000b4 R08: 0000000000000000 R09: 000000000000=
0000
> [ 208.706728]R10:0000000000000000 R11: 0000000000000246 R12: 000000000000=
00b4
> [ 208.706730]R13:00007f3c34001a00 R14: 00007f3c3402b330 R15: 00007f3c3402=
b330
> [ 208.706734]</TASK>
> [ 208.706736]Modules linked in:ntfs3 snd_seq_dummy snd_hrtimer snd_seq sn=
d_seq_device vfat fat igb ptp pps_core dca snd_hda_codec_alc882 snd_hda_cod=
ec_realtek_lib snd_hda_codec_atihdm
> i snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_hda_codec jc=
42 amd_atl eeepc_wmi snd_hda_core asus_wmi intel_rapl_msr sparse_keymap snd=
_intel_dspcfg intel_rapl_common ee1004
> snd_intel_sdw_acpi asus_ec_sensors snd_hwdep snd_pcm aesni_intel rfkill g=
f128mul snd_timer aead snd i2c_piix4 wmi_bmof rapl ccp k10temp mxm_wmi soun=
dcore pcspkr i2c_smbus hid_logitech_h
> idpp mousedev joydev mac_hid ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt ipt=
_REJECT nf_reject_ipv4 xt_LOG nf_log_syslog nft_limit xt_limit xt_addrtype =
xt_tcpudp xt_conntrack nf_conntrack nf
> _defrag_ipv6 nf_defrag_ipv4 nft_compat x_tables nf_tables nfnetlink dm_mo=
d crypto_user pkcs8_key_parser ntsync i2c_dev uhid zram 842_decompress 842_=
compress lz4hc_compress lz4_compress a
> mdgpu drm_panel_backlight_quirks drm_buddy drm_suballoc_helper video i2c_=
algo_bit drm_exec gpu_sched
> [ 208.706816]amdxcp drm_ttm_helper ttm drm_display_helper uas nvme sr_mod=
 usb_storage cec hid_logitech_dj cdrom nvme_core nvme_keyring xhci_pci_rene=
sas nvme_auth wmi
> [ 208.706834]---[ end trace 0000000000000000 ]---
> [ 208.706837]RIP:0010:iomap_write_end+0x205/0x210
> [ 208.706840]Code:7d 30 e8 6e a5 89 ff b0 01 48 83 c4 08 5b 41 5c 41 5d 4=
1 5e 41 5f 5d e9 d4 70 72 ff cc 0f 0b 31 c0 eb e6 0f 0b e9 ea fe ff ff <0f>=
 0b cc cc cc cc cc cc cc cc cc 90 9
> 0 90 90 90 90 90 90 90 90 90
> [ 208.706842]RSP:0018:ffffcfb8875b3958 EFLAGS: 00010206
> [ 208.706844]RAX:ffff8ec409324fc0 RBX: 0000000000000000 RCX: fffff51f9ac4=
ed00
> [ 208.706846]RDX:00000000000000b4 RSI: 0000000000000fc0 RDI: ffffcfb8875b=
39d8
> [ 208.706848]RBP:fffff51f9ac4ed00 R08: 0000000000000040 R09: ffff8ec9713b=
40b4
> [ 208.706849]R10:000000000000001a R11: 0000000000000000 R12: ffffcfb8875b=
39d8
> [ 208.706851]R13:0000000000000000 R14: 00000000000000b4 R15: ffffcfb8875b=
3be8
> [ 208.706853]FS:00007f3c419fe6c0(0000) GS:ffff8ed2f94c7000(0000) knlGS:00=
00000000000000
> [ 208.706855]CS:0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 208.706856]CR2:000056242ec0b000 CR3: 00000001871be000 CR4: 0000000000f5=
0ef0
> [ 208.706858]PKRU:55555554
>=20
> ~
> =E2=9D=AF
>=20
> Kernel 7.1.1, Internal SATA hard drive
>=20
> --
>=20
>
