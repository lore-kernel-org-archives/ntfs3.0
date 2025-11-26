Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA123EAA4
	for <ntfs3@lists.linux.dev>; Wed, 26 Nov 2025 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764166087; cv=none; b=aPSEBYMMlyiZOVUu/k2yZBtbTcWUhInqQGGaS8S5ZoZxJRzgD7zKwqsyPKQhj8wrvn7pTm7DzVENpKPF8Afb+CEK9Q4obYdMXjCEKv4szqrVFzNR4P6wkMcud7GuV9Yl2pmQiAnZEAYo5SjFjGxr9dJowLTzUIKdlFTpmY8+2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764166087; c=relaxed/simple;
	bh=/02+L+V1h9n+tCWdSmuRBRKENOwldt19oWXHukGSoaw=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=Tv/cQw32ggbAB77GtfwnmYxz0ZiPsAY20/ul0I/k2ZfaXwd+N3/36HBiv4MI45Arf0rLrKFmk1eQ4mntcvHSKvn0v5yAb7qGsPKOJ2zSnK1DVra62eEWKwYzl5Gct+2yXLUhtLyyvlts7VgL1Q/fXVHN6DXFGcRDPZLLJY+ICos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com; spf=pass smtp.mailfrom=tutamail.com; dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b=b8q/npYo; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutamail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b="b8q/npYo"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id E2E4DE5386A2
	for <ntfs3@lists.linux.dev>; Wed, 26 Nov 2025 15:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764166082;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=/02+L+V1h9n+tCWdSmuRBRKENOwldt19oWXHukGSoaw=;
	b=b8q/npYoSEUto66OCtcWTiMzLt4gRQ0iPII65J8RvlYV0IcXmCOkn4pTo4cStZYy
	tf0Q+ovkRFo54NvRq1YlblWY4afqH+qir5gxDE9c9uzrAZ0GtRt6kqOPZmIj+cFslf9
	a3JFhBOH4sdiUE8LO8eL3KTrwG17XXsiQ1/2p/C06eQ3DXmL0kYZmeNpiGvRQipjw6z
	6v8ymivXefj960pmSbGU3PnIOQ4HiUsJfb3SZZ+J3H7u3Wu4xJCDCQCCBLjWREjswBk
	nAamv+I8z7qpdpTdvYIZcXJjyfrDkQADJd8lVDJpiY8RwrnEEOnSjkmrEsaNQs117Qz
	m3i6phEklA==
Date: Wed, 26 Nov 2025 15:08:02 +0100 (CET)
From: craftfever@tutamail.com
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Ntfs3 <ntfs3@lists.linux.dev>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <Of-UWrF--F-9@tutamail.com>
Subject: Re: [Bug] Memory allocation errors and system crashing due to
 buggy
 disk cache/inode allocations by ntfs3 kernel module.
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Nov 26, 2025, 12:09 by craftfever@tutamail.com:

>
> Nov 26, 2025, 09:54 by almaz.alexandrovich@paragon-software.com:
>
>> On 11/23/25 11:35, craftfever@tutamail.com wrote:
>>
>>> Nov 19, 2025, 16:11 by almaz.alexandrovich@paragon-software.com:
>>>
>>>> On 11/19/25 11:57, craftfever@tutamail.com wrote:
>>>>
>>>>> Nov 14, 2025, 10:39 by almaz.alexandrovich@paragon-software.com:
>>>>>
>>>>>> On 10/4/25 13:26, craftfever@tutamail.com wrote:
>>>>>>
>>>>>>> I'm posting there first time, so I through it like generic bug mail=
ing list, but I can say, that, for example, version 6.12.50-lts a little le=
ss pron to bug, but it occurs there as well. I'm using Linux 6.16.10 for no=
w. So, bug is present a while, but i hardly to tell, in what kernel version=
 it appeared, cause earlier, I didn't manage that big amount of files. Agai=
n, it's okay with ntfs-3g.
>>>>>>>
>>>>>>> Oct 4, 2025, 14:12 by regressions@leemhuis.info:
>>>>>>>
>>>>>>>> On 10/4/25 13:03, craftfever@tutamail.com wrote:
>>>>>>>>
>>>>>>>>> Oct 4, 2025, 11:55 by craftfever@tutamail.com:
>>>>>>>>>
>>>>>>>>>> I'm expecting serious bug when writing large amount of files to
>>>>>>>>>> NTFS hard drive, shortly after memory allocation errors and syst=
em
>>>>>>>>>> crash occurs/ Firstly, I thought, than this is bug in linux kern=
el
>>>>>>>>>> itself, somewhat disk cache allocation error, but when I tested
>>>>>>>>>> same operations on ext4 drive or using NTFS-3G module, bug is no=
t
>>>>>>>>>> present.
>>>>>>>>>>
>>>>>>>>> To reproduce a bug, try cloning two big Git repositories to an
>>>>>>>>> external NTFS drive mounted with ntfs3 module.
>>>>>>>>>
>>>>>>>> Thx for the report.
>>>>>>>>
>>>>>>>> What kernel version are your using?
>>>>>>>>
>>>>>>>> You CCed the regression list, so I assume this used to work, which=
 leads
>>>>>>>> to two more questions: What was the last version where this works?=
 Could
>>>>>>>> you bisect?
>>>>>>>>
>>>>>>>> Ciao, Thorsten
>>>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> I tried to reproduce the problem by cloning multiple large Git repos=
itories
>>>>>> onto an ntfs3-mounted NTFS volume, but the issue did not trigger on =
my side
>>>>>> and no system crash occurred.
>>>>>>
>>>>>> Could you provide a bit more detail about your case?
>>>>>>
>>>>>> - What appears in the kernel logs before the crash or before the pro=
cess
>>>>>> enters the unkillable state? Any warnings, memory allocation errors,
>>>>>> stack traces, or lockdep messages from dmesg would be very useful.
>>>>>> - What mount options are you using for ntfs3?
>>>>>> - Roughly how much data or how many files are needed to trigger the
>>>>>> behavior?
>>>>>> - Does the problem happen immediately, or only after sustained I/O o=
r high
>>>>>> memory pressure?
>>>>>>
>>>>>> If you can capture the relevant portion of dmesg or the last message=
s
>>>>>> shown before the freeze/hang, that would help a lot in diagnosing th=
is.
>>>>>>
>>>>>> Regards,
>>>>>> Konstantin
>>>>>>
>>>>> Thanks for response. After that situation, I changed driver to NTFS-3=
G, so were with stable work, but degraded performance, but at least without=
 crashes. Today, after your response, I reverted again to ntfs3 to test cas=
es, that I mention and I can't reproduce it either. As it didn't response f=
rom you for so long before now, I changed so many Linux OS settings, disabl=
ed USB autosuspend, disabled rtkit-daemon canary-thread, so there no more h=
ighest RT threads, changed some scheduling and memory management options, s=
o now it's stable. I'm not expecting any crashes and lockups even with larg=
e amount of files. Unfortunately, during bug presenting I didn't able catch=
 dmesg messages, `cause system crashed. The only my assumption, that it may=
 had MFT allocation bug, when disk is practically full and driver have to h=
andle MFT allocation, additional space, where new pieces is stored. I guess=
 it, 'cause when I tested new ntfsplus driver, I expected this bug, when do=
wnloading multiple chunks of files, but without system crashing, just the d=
ownload manager aborted file downloading with "memory allocation error" wit=
h corresponding dmesg errors. Right now, I don't expecting any issues with =
ntfs3, so I'll respond, if there will be any. Thank you.
>>>>>
>>>> Hello,
>>>>
>>>> Thanks for the update and for taking the time to retest. Even though t=
he
>>>> issue is not currently reproducible, I=E2=80=99ll keep your report and=
 the
>>>> possible MFT allocation cause in mind. If it happens again and you=E2=
=80=99re
>>>> able to capture any logs, please let me know - any extra information w=
ould
>>>> be very helpful.
>>>>
>>>> Regards,
>>>> Konstantin
>>>>
>>> I copied folder with many small files to ext. disk with ntfs with 4 GB =
free space. I got MFT allocation error ntfsplus driver again, so when I ret=
urned to regular ntfs3 driver, files copied correctly and no file corruptio=
ns and issues visually at all, but just in case, i looked in dmesg logs and=
 there massive kernel warning:
>>>
>>> [=C2=A0 305.576860] memmove: detected field-spanning write (size 3552) =
of single field "re" at fs/ntfs3/index.c:863 (siz
>>> e 0)
>>> [=C2=A0 305.576882] WARNING: CPU: 2 PID: 10325 at fs/ntfs3/index.c:863 =
indx_delete_entry+0x1790/0x1870 [ntfs3]
>>> [=C2=A0 305.576901] Modules linked in: ntfs3 snd_seq_dummy snd_hrtimer =
snd_seq snd_seq_device nfnetlink_queue udp_diag n
>>> f_conntrack_netlink tcp_diag inet_diag nft_masq nft_reject_ipv4 act_csu=
m cls_u32 sch_htb nft_queue bridge nft_chain
>>> _nat nf_nat stp llc ccm algif_aead crypto_null des3_ede_x86_64 cbc des_=
generic libdes algif_skcipher cmac md4 algif
>>> _hash af_alg overlay nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_=
reject nft_limit nft_ct nf_conntrack nf_defr
>>> ag_ipv6 nf_defrag_ipv4 nf_tables libcrc32c mousedev ums_realtek joydev =
uas usb_storage intel_rapl_msr intel_rapl_co
>>> mmon x86_pkg_temp_thermal intel_powerclamp coretemp iTCO_wdt snd_hda_co=
dec_realtek intel_pmc_bxt iwldvm kvm_intel s
>>> nd_hda_codec_generic at24 snd_hda_codec_hdmi snd_hda_scodec_component k=
vm mei_pxp snd_hda_intel iTCO_vendor_support
>>> mei_hdcp mac80211 irqbypass snd_intel_dspcfg snd_intel_sdw_acpi libarc4=
 psmouse rapl snd_hda_codec serio_raw atkbd
>>> intel_cstate iwlwifi snd_hda_core libps2 i2c_i801 vfat intel_uncore fat=
 r8169 vivaldi_fmap pcspkr snd_hwdep
>>> [=C2=A0 305.576964]=C2=A0 i2c_smbus cfg80211 i2c_mux snd_pcm realtek md=
io_devres rfkill snd_timer lpc_ich libphy mei_me snd m
>>> ei soundcore fujitsu_laptop sparse_keymap mac_hid sch_cake vboxnetflt(O=
E) vboxnetadp(OE) vboxdrv(OE) usbip_host usb
>>> ip_core tcp_bbr pkcs8_key_parser i2c_dev sg crypto_user ntsync loop dm_=
mod nfnetlink zram 842_decompress 842_compre
>>> ss lz4hc_compress lz4_compress bpf_preload ip_tables x_tables polyval_c=
lmulni(E) aesni_intel(E) polyval_generic(E)
>>> ghash_clmulni_intel(E) crypto_simd(E) i8042(E) cryptd(E) crc32_pclmul(E=
) sha256_ssse3(E) sha512_ssse3(E) gf128mul(E
>>> ) sha1_ssse3(E) crct10dif_pclmul(E) serio(E) i915(E) ext4(E) video(E) d=
rm_display_helper(E) wmi(E) jbd2(E) mbcache(
>>> E) usbhid(E) crc32c_intel(E) i2c_algo_bit(E) crc32c_generic(E) crc16(E)=
 cec(E) intel_gtt(E) hid_generic(E) ttm(E) d
>>> rm_buddy(E)
>>> [=C2=A0 305.577018] CPU: 2 UID: 0 PID: 10325 Comm: pool-2 Tainted: G S=
=C2=A0=C2=A0 U=C2=A0 W=C2=A0 OE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.12.58-1-cac=
hyos-lts #1 09c56554
>>> d06e0af6d4f01298236cdf5f899167af
>>> [=C2=A0 305.577024] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER, [W]=3DW=
ARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>>> [=C2=A0 305.577026] Hardware name: FUJITSU LIFEBOOK AH532/G21/FJNBB1D, =
BIOS Version 1.12 06/10/2019
>>> [=C2=A0 305.577027] RIP: 0010:indx_delete_entry+0x1790/0x1870 [ntfs3]
>>> [=C2=A0 305.577039] Code: ff 48 c7 c2 90 e3 a4 c1 48 c7 c7 b8 e3 a4 c1 =
4c 89 54 24 70 4c 89 44 24 68 48 89 74 24 60 c6 0
>>> 5 45 f4 00 00 01 e8 70 6f ea c4 <0f> 0b 4c 8b 54 24 70 4c 8b 44 24 68 4=
8 8b 74 24 60 e9 b4 fd ff ff
>>> [=C2=A0 305.577041] RSP: 0018:ffffd4b4204479b0 EFLAGS: 00010246
>>> [=C2=A0 305.577043] RAX: 0000000000000000 RBX: ffff8d851754a200 RCX: 00=
00000000000027
>>> [=C2=A0 305.577045] RDX: ffff8d86ef3218c8 RSI: 0000000000000001 RDI: ff=
ff8d86ef3218c0
>>> [=C2=A0 305.577046] RBP: ffff8d85f9eecbd0 R08: 00000000ffffefff R09: 00=
00000000000003
>>> [=C2=A0 305.577048] R10: ffffffff88a5d760 R11: ffffd4b420447800 R12: 00=
00000000000002
>>> [=C2=A0 305.577049] R13: 0000000000000000 R14: ffff8d85f9eecca0 R15: ff=
ff8d851754b800
>>> [=C2=A0 305.577051] FS:=C2=A0 00007ae95eb086c0(0000) GS:ffff8d86ef30000=
0(0000) knlGS:0000000000000000
>>> [=C2=A0 305.577053] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
>>> [=C2=A0 305.577055] CR2: 00005ddc06731088 CR3: 000000021e9ac003 CR4: 00=
000000001706f0
>>> [=C2=A0 305.577057] Call Trace:
>>> [=C2=A0 305.577059]=C2=A0 <TASK>
>>> [=C2=A0 305.577064]=C2=A0 ni_remove_name+0x10b/0x270 [ntfs3 ffcddedc8a0=
78abf7548ec42d6d01f0087e2d815]
>>> [=C2=A0 305.577078]=C2=A0 ntfs_unlink_inode+0x15e/0x360 [ntfs3 ffcddedc=
8a078abf7548ec42d6d01f0087e2d815]
>>> [=C2=A0 305.577090]=C2=A0 ntfs_unlink+0x44/0x70 [ntfs3 ffcddedc8a078abf=
7548ec42d6d01f0087e2d815]
>>> [=C2=A0 305.577100]=C2=A0 vfs_unlink+0x114/0x2a0
>>> [=C2=A0 305.577105]=C2=A0 do_unlinkat+0x2ea/0x380
>>> [=C2=A0 305.577110]=C2=A0 __x64_sys_unlink+0xb7/0x1e0
>>> [=C2=A0 305.577114]=C2=A0 do_syscall_64+0x7b/0x190
>>> [=C2=A0 305.577120]=C2=A0 ? __x64_sys_futex+0x353/0x550
>>> [=C2=A0 305.577125]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1=
b0
>>> [=C2=A0 305.577130]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>>> [=C2=A0 305.577134]=C2=A0 ? do_syscall_64+0x87/0x190
>>> [=C2=A0 305.577138]=C2=A0 ? __x64_sys_futex+0x2cc/0x550
>>> [=C2=A0 305.577141]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1=
b0
>>> [=C2=A0 305.577144]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>>> [=C2=A0 305.577148]=C2=A0 ? do_syscall_64+0x87/0x190
>>> [=C2=A0 305.577151]=C2=A0 ? vfs_write+0x114/0x4b0
>>> [=C2=A0 305.577154]=C2=A0 ? __call_rcu_common+0xd4/0xab0
>>> [=C2=A0 305.577158]=C2=A0 ? evict+0x1ec/0x390
>>> [=C2=A0 305.577161]=C2=A0 ? mntput+0x61/0x3e0
>>> [=C2=A0 305.577164]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1=
b0
>>> [=C2=A0 305.577168]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>>> [=C2=A0 305.577171]=C2=A0 ? do_syscall_64+0x87/0x190
>>> [=C2=A0 305.577174]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1=
b0
>>> [=C2=A0 305.577177]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>>> [=C2=A0 305.577181]=C2=A0 ? do_syscall_64+0x87/0x190
>>> [=C2=A0 305.577184]=C2=A0 ? do_syscall_64+0x87/0x190
>>> [=C2=A0 305.577187]=C2=A0 ? do_syscall_64+0x87/0x190
>>> [=C2=A0 305.577189]=C2=A0 ? irqentry_exit_to_user_mode+0x2c/0x190
>>> [=C2=A0 305.577193]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> [=C2=A0 305.577198] RIP: 0033:0x7ae96950e39b
>>> [=C2=A0 305.577220] Code: ff 67 e8 08 93 01 00 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa b8 5f 00 00 00 0f 05 c3 0f 1f 40 00 f
>>> 3 0f 1e fa b8 57 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 0=
0 48 8b 15 41 99 0f 00 f7 d8
>>> [=C2=A0 305.577221] RSP: 002b:00007ae95eb07728 EFLAGS: 00000206 ORIG_RA=
X: 0000000000000057
>>> [=C2=A0 305.577224] RAX: ffffffffffffffda RBX: 00007ae948002e70 RCX: 00=
007ae96950e39b
>>> [=C2=A0 305.577226] RDX: 0000000000000055 RSI: 00007ae948179220 RDI: 00=
007ae948002e70
>>> [=C2=A0 305.577227] RBP: 00007ae95eb07740 R08: 0000000000000000 R09: 00=
005ddc05ec28e0
>>> [=C2=A0 305.577228] R10: aaaaaaaaaaaaaaab R11: 0000000000000206 R12: 00=
007ae95eb077b0
>>> [=C2=A0 305.577230] R13: 00007ae9481786c0 R14: 00005ddc06b78be0 R15: 00=
00000000000008
>>> [=C2=A0 305.577233]=C2=A0 </TASK>
>>> [=C2=A0 305.577234] ---[ end trace 0000000000000000 ]---
>>>
>>> Again there is no any visual error and file corruptions error, if I did=
n't go to dmesg logs, I didn't notice any issues, but there is some reason =
for this warning.
>>>
>>
>> Hello,
>>
>> Thanks for the report. To look into this, I need a bit more detail.
>> Could you provide the kernel version you were running when the warning
>> occurred, as well as the exact mount options used? This information
>> would be very helpful for diagnosing the issue.
>>
>> Regards,
>> Konstantin
>>
> Hello, kernel version was 6.12.58 and mount options was (rw,nosuid,nodev,=
noexec,noatime,uid=3D0,gid=3D0,iocharset=3Dutf8,uhelper=3Dudisks) at the ti=
me of warning occurring.=C2=A0
>
Today the same dmesg warning occur with same case of writing multiple chunk=
s of files, same mount options, but with kernel version 6.17.9:

[ 1643.344671] memmove: detected field-spanning write (size 2032) of single=
 field "re" at fs/ntfs3/index.c:863 (size 0)
[ 1643.344705] WARNING: CPU: 3 PID: 30215 at fs/ntfs3/index.c:863 indx_dele=
te_entry+0x179d/0x1880 [ntfs3]
[ 1643.344728] Modules linked in: nft_redir nft_nat tun xt_MASQUERADE nft_c=
ompat veth ntfs3 snd_seq_dummy snd_hrtimer snd_seq snd_seq_device nfnetlink=
_queue udp_diag nf_conntrack_netlink tcp_diag inet_diag nft_masq nft_reject=
_ipv4 act_csum cls_u32 sch_htb nft_queue nft_chain_nat nf_nat bridge stp ll=
c ccm algif_aead des3_ede_x86_64 des_generic libdes algif_skcipher cmac md4=
 algif_hash af_alg overlay nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nf=
t_reject nft_limit nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tab=
les ums_realtek uas iwldvm usb_storage mousedev intel_rapl_msr mac80211 lib=
arc4 mei_pxp intel_rapl_common mei_hdcp x86_pkg_temp_thermal intel_powercla=
mp at24 iTCO_wdt iwlwifi vfat intel_pmc_bxt fat coretemp iTCO_vendor_suppor=
t r8169 kvm_intel realtek rapl intel_cstate mdio_devres snd_hda_codec_intel=
hdmi cfg80211 snd_hda_codec_nvhdmi snd_hda_codec_alc269 snd_hda_scodec_comp=
onent snd_hda_codec_hdmi libphy intel_uncore snd_hda_codec_realtek_lib snd_=
hda_codec_generic snd_hda_intel mdio_bus rfkill snd_hda_codec
[ 1643.344819]=C2=A0 snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_h=
wdep snd_pcm joydev mei_me snd_timer fujitsu_laptop i2c_i801 snd sparse_key=
map mac_hid psmouse i2c_smbus pcspkr mei soundcore i2c_mux lpc_ich sch_cake=
 vboxnetflt(OE) vboxnetadp(OE) vboxdrv(OE) kvm irqbypass usbip_host usbip_c=
ore tcp_bbr pkcs8_key_parser i2c_dev sg crypto_user ntsync loop dm_mod nfne=
tlink zram 842_decompress 842_compress lz4hc_compress lz4_compress ip_table=
s x_tables aesni_intel(E) ghash_clmulni_intel(E) polyval_clmulni(E) serio_r=
aw(E) i915(E) video(E) wmi(E) drm_display_helper(E) intel_gtt(E) drm_buddy(=
E) ttm(E) i2c_algo_bit(E) cec(E)
[ 1643.344863] CPU: 3 UID: 1000 PID: 30215 Comm: filec Tainted: G S=C2=A0=
=C2=A0 U=C2=A0=C2=A0=C2=A0=C2=A0 OE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.1=
7.9-zen1-1-zen #1 PREEMPT(voluntary)=C2=A0 63aa26d4b39f24c743d2811fd066d702=
705167eb
[ 1643.344869] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER, [O]=3DOOT_MODULE=
, [E]=3DUNSIGNED_MODULE
[ 1643.344870] Hardware name: FUJITSU LIFEBOOK AH532/G21/FJNBB1D, BIOS Vers=
ion 1.12 06/10/2019
[ 1643.344873] RIP: 0010:indx_delete_entry+0x179d/0x1880 [ntfs3]
[ 1643.344888] Code: c2 b0 b5 88 c1 48 89 c6 4c 89 54 24 70 48 c7 c7 d8 b5 =
88 c1 4c 89 44 24 68 48 89 44 24 60 c6 05 98 b1 1f 00 01 e8 93 b2 ee ed <0f=
> 0b 4c 8b 54 24 70 4c 8b 44 24 68 48 8b 44 24 60 e9 b1 fd ff ff
[ 1643.344891] RSP: 0018:ffffcfc0eaa6b8c8 EFLAGS: 00010246
[ 1643.344895] RAX: 0000000000000000 RBX: ffff888a13088a00 RCX: 00000000000=
00000
[ 1643.344897] RDX: ffff888bef39cfc8 RSI: 0000000000000001 RDI: ffff888bef3=
9cfc0
[ 1643.344899] RBP: ffff88890f8543f0 R08: ffffffffb1ab8b01 R09: 00000000000=
00000
[ 1643.344900] R10: ffffffffb1a60be0 R11: ffffcfc0eaa6b6f8 R12: 00000000000=
00001
[ 1643.344901] R13: 0000000000000000 R14: ffff88890f8544c0 R15: ffff888a130=
89200
[ 1643.344903] FS:=C2=A0 00007f5fd99b9b38(0000) GS:ffff888c3cc46000(0000) k=
nlGS:0000000000000000
[ 1643.344905] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1643.344907] CR2: 00007f5fd8ee0000 CR3: 00000001d5546006 CR4: 00000000001=
706f0
[ 1643.344909] Call Trace:
[ 1643.344912]=C2=A0 <TASK>
[ 1643.344917]=C2=A0 ni_remove_name+0x10a/0x250 [ntfs3 64facacbcfd9013cf87d=
7a9536a0f059d924d72e]
[ 1643.344931]=C2=A0 ntfs_unlink_inode+0x15d/0x380 [ntfs3 64facacbcfd9013cf=
87d7a9536a0f059d924d72e]
[ 1643.344942]=C2=A0 ntfs_unlink+0x4d/0x80 [ntfs3 64facacbcfd9013cf87d7a953=
6a0f059d924d72e]
[ 1643.344953]=C2=A0 vfs_unlink+0x114/0x2a0
[ 1643.344958]=C2=A0 do_unlinkat+0x2b6/0x350
[ 1643.344962]=C2=A0 __x64_sys_unlink+0xb7/0x1e0
[ 1643.344964]=C2=A0 do_syscall_64+0x81/0x970
[ 1643.344968]=C2=A0 ? mntput+0x60/0x360
[ 1643.344972]=C2=A0 ? _copy_to_user+0x31/0x40
[ 1643.344976]=C2=A0 ? __x64_sys_newlstat+0x24f/0x2e0
[ 1643.344979]=C2=A0 ? ntfs_read_hdr+0x1d4/0x2a0 [ntfs3 64facacbcfd9013cf87=
d7a9536a0f059d924d72e]
[ 1643.344992]=C2=A0 ? syscall_exit_work+0xe8/0x1b0
[ 1643.344997]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345000]=C2=A0 ? syscall_exit_work+0xe8/0x1b0
[ 1643.345002]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345005]=C2=A0 ? do_unlinkat+0x317/0x350
[ 1643.345008]=C2=A0 ? syscall_exit_work+0xe8/0x1b0
[ 1643.345011]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345013]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345015]=C2=A0 ? syscall_exit_work+0xe8/0x1b0
[ 1643.345018]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345020]=C2=A0 ? syscall_exit_work+0xe8/0x1b0
[ 1643.345023]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345025]=C2=A0 ? do_syscall_64+0x244/0x970
[ 1643.345027]=C2=A0 ? irq_exit_rcu+0x55/0x100
[ 1643.345030]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 1643.345033] RIP: 0033:0x7f5fd9f4a7a8
[ 1643.345054] Code: 0c e8 98 ed ff ff 48 83 c4 18 83 e8 01 c3 e9 dd e3 ff =
ff 48 8d 35 28 0b 04 00 e9 d1 e3 ff ff 48 83 ec 08 b8 57 00 00 00 0f 05 <89=
> c2 83 f8 eb 74 0d 48 63 fa e8 ef da fd ff 48 83 c4 08 c3 b8 54
[ 1643.345056] RSP: 002b:00007f5fd99b8d00 EFLAGS: 00000206 ORIG_RAX: 000000=
0000000057
[ 1643.345058] RAX: ffffffffffffffda RBX: 00007f5fd9dee160 RCX: 00007f5fd9f=
4a7a8
[ 1643.345060] RDX: 0000000000000000 RSI: 00007f5fd99b8d30 RDI: 00007f5fd98=
1d690
[ 1643.345061] RBP: 00007f5fd99b8d30 R08: 00007f5fd99b8c70 R09: 00000000fff=
fff9c
[ 1643.345062] R10: 0000000000000000 R11: 0000000000000206 R12: 00007f5fd98=
1d5d0
[ 1643.345064] R13: 00007f5fd99b8d30 R14: 0000000000000000 R15: 00007f5fd99=
b8ed0
[ 1643.345067]=C2=A0 </TASK>
[ 1643.345068] ---[ end trace 0000000000000000 ]---

But no visible warnings or error in the interface.
