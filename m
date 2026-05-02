Received: from libero.it (smtp-18.italiaonline.it [213.209.10.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA868175A92
	for <ntfs3@lists.linux.dev>; Sat,  2 May 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.209.10.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777717656; cv=none; b=rrG/hZJZy4oORtBV3vGMN66RgWKGzj7Ap5QObQgQxD4Sq9ErDRWF9bCxZzYqs4hA024k+37iagVJXX6gISQ924mkTP53e3dyznjaLAeonAP+os5xnmWC6SgfzcbgcGzrpK8kU7OS5eZiU1B5Fy6Bj6Ct6wgzxOIgjDwKj84egdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777717656; c=relaxed/simple;
	bh=VQNjjjIJJBVxz4owIDe+uW2uZarbbs6oW4Vh/Lgh3mA=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=TxcaQdoBSRJwH3apdlUCxgSXj4oNcLyN5kPBoHG++DijmBHfSP320LrMtcUsWQXB4ojk6wf28XnRIy961m28EnyQBQeybhr2EoOFIjwtRUufzqZl7G7Yx2cg/mnojvZONubgmFA0I69z+UbYGLsSmBxl+jsiIELyJFhQteJplDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it; spf=pass smtp.mailfrom=libero.it; dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b=et2O87+k; arc=none smtp.client-ip=213.209.10.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=libero.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b="et2O87+k"
Received: from oxapps-12-068.iol.local ([10.101.8.78])
	by smtp-18.iol.local with ESMTPA
	id J7WpwCEIAsKfoJ7Wpw4roB; Sat, 02 May 2026 12:24:55 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
	t=1777717495; bh=VQNjjjIJJBVxz4owIDe+uW2uZarbbs6oW4Vh/Lgh3mA=;
	h=From;
	b=et2O87+k8v9DgxyiNGJ3J/7rYayUodH/cNgE9Igr/T2PbRA1wQ42Nzv9k+862QCDQ
	 V5GIO8M1Kbr2yf3LW3jft6T//bqLhIOIu+Hnma+7fxdbMKZnhnX2oxOK0OdRzJu5St
	 s9cl7j0zjerPa4llEMnpWcQ4RKgUVolufuYsM+07Mvkq/cFECbpy416Ax38g1ooNau
	 cuMGwzAje0ifKVCRNe1fCX/u0zwVCdgRYLFonbbDaM6CJx3BRBGnzjAjSF2MyqaMhF
	 x7bP4K7037h3qvNxMDoMpqlNGHCrM1hmaFzGFlGaI9vGeMMeI4ex396ZnbPVadxQZN
	 w80rVDuI38bHA==
X-CNFS-Analysis: v=2.4 cv=LYM86ifi c=1 sm=1 tr=0 ts=69f5d0f7 cx=a_exe
 a=n+pnAVVcBqFe90Mb2df86A==:117 a=XLG3ByzG5RkA:10 a=IkcTkHD0fZMA:10
 a=mehdgkVfAAAA:8 a=BymIpmRElCISld9oZ7kA:9 a=QEXdDO2ut3YA:10
 a=aoB3cCb9gJwPvCHOvbIr:22 a=J1pP9gvGZaT0y92QayzM:22
Date: Sat, 2 May 2026 12:24:55 +0200 (CEST)
From: saarthal@libero.it
To: "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Message-ID: <2020820791.1843094.1777717495048@mail1.libero.it>
Subject: File operations on NTFS drives causes kernel BUG at
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
x-libjamsun: RswSYwB4teYuQVC4vu4gMPmQ7xACBRIA
x-libjamv: SfTsHUiFkgU=
X-CMAE-Envelope: MS4xfKJg1Jje40vZvznCtO0csvlmjPL5ecf7ekoZJob/k2DH3GFutrp/gkwVVmj01ceiP6767+VV5+BPYmXF4hzX4qPo0E0KSKgX5J1KlCs4VKHp9cmw3ZXH
 dzvT3yA+FxoCkcsf9DKBc1GtCdeZoq9gQTm59SB+g+7RTcuq0ZSOyKNHkdme9Rf9ykBnKKEV7JDmEFOWOmNZuIyrZPbxX0lY67U=

Greetings,

in the last few days (since updating to kernel 7.0), when I'm working with =
external NTFS-formatted usb drives, file operations randomly fail (e.g. git=
 clone, rm, etc. suddenly "freeze") and this is what I see in dmesg:

[17246.773355] ------------[ cut here ]------------
[17246.773369] kernel BUG at fs/iomap/buffered-io.c:1061!
[17246.773382] Oops: invalid opcode: 0000 [#2] SMP NOPTI
[17246.773387] CPU: 3 UID: 1000 PID: 295166 Comm: git Tainted: G =C2=A0 =C2=
=A0 =C2=A0D =C2=A0 =C2=A0OE =C2=A0 =C2=A0 =C2=A0 7.0.3-arch1-1 #1 PREEMPT(f=
ull) =C2=A0653fa807272d34162f0f7604ba64e0a2aa402e05
[17246.773394] Tainted: [D]=3DDIE, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[17246.773395] Hardware name: PCSpecialist Lafite Pro V 14M/X4SP4NAL, BIOS =
N.1.10PCS02 03/20/2025
[17246.773397] RIP: 0010:iomap_write_end+0x19b/0x1a0
[17246.773407] Code: 8b 38 e8 28 7f f9 ff e9 4b ff ff ff 48 8b 03 a8 08 74 =
10 e9 ce fe ff ff eb 8a 0f 0b e9 67 ff ff ff 0f 0b 31 c0 e9 32 ff ff ff <0f=
> 0b 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3
[17246.773409] RSP: 0018:ffffcd9becfff940 EFLAGS: 00010297
[17246.773412] RAX: 0000000000000040 RBX: ffffeeab172009c0 RCX: ffffeeab172=
009c0
[17246.773413] RDX: 0000000000000fc0 RSI: 0000000000000073 RDI: ffff8bc0835=
ecfc0
[17246.773414] RBP: 0000000000000073 R08: ffffcd9becfff9b8 R09: 00000000000=
00024
[17246.773415] R10: ffffcd9becfffb98 R11: ffff8bc8c8fe4380 R12: 00000000000=
00000
[17246.773415] R13: ffff8bc51615b5b0 R14: 0000000000000073 R15: 00000000000=
00000
[17246.773416] FS: =C2=A000007f897dfcc740(0000) GS:ffff8bd00d952000(0000) k=
nlGS:0000000000000000
[17246.773417] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 0000000080050033
[17246.773418] CR2: 00007f897e0d2007 CR3: 000000072d1de000 CR4: 0000000000f=
50ef0
[17246.773420] PKRU: 55555554
[17246.773421] Call Trace:
[17246.773423] =C2=A0<TASK>
[17246.773425] =C2=A0iomap_file_buffered_write+0x20f/0x420
[17246.773436] =C2=A0ntfs_file_write_iter+0x89d/0xc00 [ntfs3 38413653d82edd=
ff25f5aed43f273fd66f9943c1]
[17246.773447] =C2=A0? vfs_write+0x2e6/0x480
[17246.773452] =C2=A0? vfs_write+0x2e6/0x480
[17246.773453] =C2=A0? security_file_permission+0x48/0x130
[17246.773460] =C2=A0vfs_write+0x25d/0x480
[17246.773462] =C2=A0ksys_write+0x73/0xf0
[17246.773465] =C2=A0do_syscall_64+0x12b/0x15f0
[17246.773471] =C2=A0? filemap_map_pages+0x4e3/0x770
[17246.773478] =C2=A0? do_fault+0x353/0x5c0
[17246.773482] =C2=A0? __handle_mm_fault+0x956/0xf80
[17246.773484] =C2=A0? count_memcg_events+0xd7/0x190
[17246.773488] =C2=A0? handle_mm_fault+0x1d7/0x2d0
[17246.773489] =C2=A0? do_user_addr_fault+0x21a/0x680
[17246.773495] =C2=A0? exc_page_fault+0x82/0x1d0
[17246.773498] =C2=A0? __irq_exit_rcu+0x4c/0xf0
[17246.773502] =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
[17246.773505] RIP: 0033:0x7f897dc933be
[17246.773562] Code: 4d 89 d8 e8 64 bb 00 00 4c 8b 5d f8 41 8b 93 08 03 00 =
00 59 5e 48 83 f8 fc 74 11 c9 c3 0f 1f 80 00 00 00 00 48 8b 45 10 0f 05 <c9=
> c3 83 e2 39 83 fa 08 75 e7 e8 03 ff ff ff 0f 1f 00 f3 0f 1e fa
[17246.773563] RSP: 002b:00007ffe7bdc3b80 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000001
[17246.773565] RAX: ffffffffffffffda RBX: 0000000000000073 RCX: 00007f897dc=
933be
[17246.773566] RDX: 0000000000000073 RSI: 00007f897e0d2024 RDI: 00000000000=
00003
[17246.773567] RBP: 00007ffe7bdc3b90 R08: 0000000000000000 R09: 00000000000=
00000
[17246.773567] R10: 0000000000000000 R11: 0000000000000202 R12: 00007f897e0=
d2000
[17246.773568] R13: 0000000000000003 R14: 00007f897e0d2024 R15: 00000000000=
00073
[17246.773569] =C2=A0</TASK>
[17246.773570] Modules linked in: ntfs3 ses enclosure scsi_transport_sas ua=
s usb_storage rfcomm cmac algif_hash algif_skcipher af_alg snd_seq_dummy sn=
d_hrtimer snd_seq snd_seq_device nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft=
_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_ch=
ain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bnep vf=
at fat r8153_ecm snd_acp70 cdc_ether snd_acp_i2s snd_acp_pdm snd_acp_pcm us=
bnet snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_re=
mbrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp s=
nd_sof mt7921e snd_sof_utils snd_pci_ps snd_soc_acpi_amd_match mt7921_commo=
n snd_soc_acpi_amd_sdca_quirks snd_amd_sdw_acpi soundwire_amd mt792x_lib so=
undwire_generic_allocation soundwire_bus mt76_connac_lib snd_hda_codec_atih=
dmi snd_hda_codec_conexant snd_soc_sdca btusb mt76 snd_hda_codec_generic bt=
mtk snd_hda_codec_hdmi snd_soc_core btrtl uvcvideo btbcm videobuf2_vmalloc =
snd_compress snd_hda_intel ac97_bus uvc btintel
[17246.773619] =C2=A0snd_pcm_dmaengine videobuf2_memops snd_hda_codec snd_r=
pl_pci_acp6x videobuf2_v4l2 videobuf2_common snd_acp_pci amd_atl snd_amd_ac=
pi_mach intel_rapl_msr snd_hda_core intel_rapl_common snd_intel_dspcfg mac8=
0211 bluetooth dwmac_motorcomm spd5118 snd_acp_legacy_common videodev snd_i=
ntel_sdw_acpi snd_pci_acp6x stmmac_libpci snd_hwdep r8152 mii snd_pci_acp5x=
 mc asus_wmi stmmac snd_pcm snd_rn_pci_acp3x cfg80211 sparse_keymap wmi_bmo=
f rapl amd_pmf pcs_xpcs snd_timer snd_acp_config snd_soc_acpi i2c_piix4 amd=
tee phylink snd k10temp amdxdna rfkill mdio_devres soundcore snd_pci_acp3x =
joydev i2c_smbus libarc4 amd_sfh libphy platform_profile mousedev mdio_bus =
amd_pmc ptp pps_core mac_hid nfnetlink dm_crypt encrypted_keys trusted asn1=
_encoder tee ucsi_acpi nvme sdhci_pci typec_ucsi sdhci_uhs2 roles nvme_core=
 sdhci hid_multitouch typec cqhci nvme_keyring ghash_clmulni_intel aesni_in=
tel nvme_auth thunderbolt sp5100_tco mmc_core hkdf yt6801(OE) i2c_hid_acpi =
i2c_hid serio_raw amdgpu vboxnetflt(OE) vboxnetadp(OE) amdxcp
[17246.773676] =C2=A0i2c_algo_bit drm_ttm_helper ttm drm_exec drm_panel_bac=
klight_quirks gpu_sched drm_suballoc_helper video wmi drm_buddy vboxdrv(OE)=
 drm_display_helper cec dm_mirror kvm_amd dm_region_hash dm_log ccp dm_mod =
kvm ntsync irqbypass crypto_user pkcs8_key_parser sg
[17246.773695] ---[ end trace 0000000000000000 ]---
[17246.773699] RIP: 0010:iomap_write_end+0x19b/0x1a0
[17246.773700] Code: 8b 38 e8 28 7f f9 ff e9 4b ff ff ff 48 8b 03 a8 08 74 =
10 e9 ce fe ff ff eb 8a 0f 0b e9 67 ff ff ff 0f 0b 31 c0 e9 32 ff ff ff <0f=
> 0b 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3
[17246.773701] RSP: 0018:ffffcd9beac67870 EFLAGS: 00010293
[17246.773702] RAX: 0000000000000040 RBX: ffffeeab17389e00 RCX: ffffeeab173=
89e00
[17246.773703] RDX: 0000000000000fc0 RSI: 00000000000000b6 RDI: ffff8bc0851=
70fc0
[17246.773703] RBP: 00000000000000b6 R08: ffffcd9beac678e8 R09: 00000000000=
00000
[17246.773704] R10: ffffcd9beac67ac8 R11: ffff8bc0a0868000 R12: 00000000000=
00000
[17246.773705] R13: ffff8bc5212002e8 R14: 00000000000000b6 R15: 00000000000=
00000
[17246.773705] FS: =C2=A000007f897dfcc740(0000) GS:ffff8bd00d952000(0000) k=
nlGS:0000000000000000
[17246.773706] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 0000000080050033
[17246.773707] CR2: 00007f897e0d2007 CR3: 000000072d1de000 CR4: 0000000000f=
50ef0
[17246.773707] PKRU: 55555554

I also noticed a similar bug reported on this forum: https://discuss.cachyo=
s.org/t/kernel-bug-in-iomap-write-end-triggered-by-ntfs3-buffered-write-lin=
ux-7-0-1-cachyos/28546

I'm running Arch Linux with kernel 7.0.3, using gnome, wayland and vulkan (=
amd apu.)

raoul
