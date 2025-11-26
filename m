Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D131DDB8
	for <ntfs3@lists.linux.dev>; Wed, 26 Nov 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764155399; cv=none; b=eaSvV6QusniFmxNFPdoPuyuoWscQeItspSDFMwmvapc8eBdj2sanK9iqAFgqv1Wb40JWkwDlxdW41sQu7Q9LWncjsGHz7LejPY6bdhR8aOvXAxm/3fKrTZzwaVYM+XvlYk4E06wFGOAwrbj/k7xYViLXZiJtm6qCwdO8qjDg4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764155399; c=relaxed/simple;
	bh=EaAb0aFlQhs7r6u/6WRPWahW0YqC/Hkve9kyxuW5aF8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=MQml4o1SNc3xa+yjbo3amjRGuWq0uTS0XmUmYxbAFLes/a0PL8wwXEBvg0x/x96+NoYeC2TDrcnFN5XH5215UUmP88/t4t/EGD4lHr2Z73NHeFnaPbu3Ady03iDBJCOpOxoN4baR46JJmVLANp/WcPrWqx5XfmS9UWiVjAeUigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com; spf=pass smtp.mailfrom=tutamail.com; dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b=U8Ph1WLt; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutamail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b="U8Ph1WLt"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 8C0C5E521475
	for <ntfs3@lists.linux.dev>; Wed, 26 Nov 2025 12:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764155390;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=AMaaboW/KtxgO6EGA5bCRGeTdqg0kPRSL/IP16HNw6E=;
	b=U8Ph1WLtKsYAq2hT6u8aRQ3/8SIWqiYGpqgpCImFZUB1Cmt0GtqQdByW7c/9P4vu
	snoS1I1peLZKYQIwujFdW15am3scmBSGbTSNsldp7UR96vADa48yWt9E+ZRH2J+ongx
	VKKCWTNNrpZehShIXb3c68u8aiz0cSPptHZwLVhbd358cAMf4ue1GjKUWg1OXmgW4LY
	WPOob11wf+8CQWYRHiL5o3mKtC05gV1qz1IlcODRgNUcb5iI1Q3EQrFoal6il9y2qCY
	HAHzpRgi5HI1luZJMQQY2mMBSvhjuSdBW2PNJme5WS8PIxgUoAL5OVWKVmMpFuwwm1a
	CeI+OitkKQ==
Date: Wed, 26 Nov 2025 12:09:50 +0100 (CET)
From: craftfever@tutamail.com
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Ntfs3 <ntfs3@lists.linux.dev>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <OezqjWl--J-9@tutamail.com>
In-Reply-To: <b106b4d4-0e0f-44d3-82aa-925919f7bb41@paragon-software.com>
References: <OaiQgS3--F-9@tutamail.com> <Oait04j--F-9@tutamail.com> <d9ae2341-b385-45f4-9359-550d1118efb7@leemhuis.info> <OaiyHa1----9@tutamail.com> <ee9a1718-7feb-4ff4-8b1e-582b8aca85b4@paragon-software.com> <OeQkrcD--F-9@tutamail.com> <9c1bf8e4-669e-468c-b16c-aa2b6197ca69@paragon-software.com> <OekHC5p--F-9@tutamail.com> <b106b4d4-0e0f-44d3-82aa-925919f7bb41@paragon-software.com>
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


Nov 26, 2025, 09:54 by almaz.alexandrovich@paragon-software.com:

> On 11/23/25 11:35, craftfever@tutamail.com wrote:
>
>> Nov 19, 2025, 16:11 by almaz.alexandrovich@paragon-software.com:
>>
>>> On 11/19/25 11:57, craftfever@tutamail.com wrote:
>>>
>>>> Nov 14, 2025, 10:39 by almaz.alexandrovich@paragon-software.com:
>>>>
>>>>> On 10/4/25 13:26, craftfever@tutamail.com wrote:
>>>>>
>>>>>> I'm posting there first time, so I through it like generic bug maili=
ng list, but I can say, that, for example, version 6.12.50-lts a little les=
s pron to bug, but it occurs there as well. I'm using Linux 6.16.10 for now=
. So, bug is present a while, but i hardly to tell, in what kernel version =
it appeared, cause earlier, I didn't manage that big amount of files. Again=
, it's okay with ntfs-3g.
>>>>>>
>>>>>> Oct 4, 2025, 14:12 by regressions@leemhuis.info:
>>>>>>
>>>>>>> On 10/4/25 13:03, craftfever@tutamail.com wrote:
>>>>>>>
>>>>>>>> Oct 4, 2025, 11:55 by craftfever@tutamail.com:
>>>>>>>>
>>>>>>>>> I'm expecting serious bug when writing large amount of files to
>>>>>>>>> NTFS hard drive, shortly after memory allocation errors and syste=
m
>>>>>>>>> crash occurs/ Firstly, I thought, than this is bug in linux kerne=
l
>>>>>>>>> itself, somewhat disk cache allocation error, but when I tested
>>>>>>>>> same operations on ext4 drive or using NTFS-3G module, bug is not
>>>>>>>>> present.
>>>>>>>>>
>>>>>>>> To reproduce a bug, try cloning two big Git repositories to an
>>>>>>>> external NTFS drive mounted with ntfs3 module.
>>>>>>>>
>>>>>>> Thx for the report.
>>>>>>>
>>>>>>> What kernel version are your using?
>>>>>>>
>>>>>>> You CCed the regression list, so I assume this used to work, which =
leads
>>>>>>> to two more questions: What was the last version where this works? =
Could
>>>>>>> you bisect?
>>>>>>>
>>>>>>> Ciao, Thorsten
>>>>>>>
>>>>> Hello,
>>>>>
>>>>> I tried to reproduce the problem by cloning multiple large Git reposi=
tories
>>>>> onto an ntfs3-mounted NTFS volume, but the issue did not trigger on m=
y side
>>>>> and no system crash occurred.
>>>>>
>>>>> Could you provide a bit more detail about your case?
>>>>>
>>>>> - What appears in the kernel logs before the crash or before the proc=
ess
>>>>>  enters the unkillable state? Any warnings, memory allocation errors,
>>>>>  stack traces, or lockdep messages from dmesg would be very useful.
>>>>> - What mount options are you using for ntfs3?
>>>>> - Roughly how much data or how many files are needed to trigger the
>>>>>  behavior?
>>>>> - Does the problem happen immediately, or only after sustained I/O or=
 high
>>>>>  memory pressure?
>>>>>
>>>>> If you can capture the relevant portion of dmesg or the last messages
>>>>> shown before the freeze/hang, that would help a lot in diagnosing thi=
s.
>>>>>
>>>>> Regards,
>>>>> Konstantin
>>>>>
>>>> Thanks for response. After that situation, I changed driver to NTFS-3G=
, so were with stable work, but degraded performance, but at least without =
crashes. Today, after your response, I reverted again to ntfs3 to test case=
s, that I mention and I can't reproduce it either. As it didn't response fr=
om you for so long before now, I changed so many Linux OS settings, disable=
d USB autosuspend, disabled rtkit-daemon canary-thread, so there no more hi=
ghest RT threads, changed some scheduling and memory management options, so=
 now it's stable. I'm not expecting any crashes and lockups even with large=
 amount of files. Unfortunately, during bug presenting I didn't able catch =
dmesg messages, `cause system crashed. The only my assumption, that it may =
had MFT allocation bug, when disk is practically full and driver have to ha=
ndle MFT allocation, additional space, where new pieces is stored. I guess =
it, 'cause when I tested new ntfsplus driver, I expected this bug, when dow=
nloading multiple chunks of files, but without system crashing, just the do=
wnload manager aborted file downloading with "memory allocation error" with=
 corresponding dmesg errors. Right now, I don't expecting any issues with n=
tfs3, so I'll respond, if there will be any. Thank you.
>>>>
>>> Hello,
>>>
>>> Thanks for the update and for taking the time to retest. Even though th=
e
>>> issue is not currently reproducible, I=E2=80=99ll keep your report and =
the
>>> possible MFT allocation cause in mind. If it happens again and you=E2=
=80=99re
>>> able to capture any logs, please let me know - any extra information wo=
uld
>>> be very helpful.
>>>
>>> Regards,
>>> Konstantin
>>>
>> I copied folder with many small files to ext. disk with ntfs with 4 GB f=
ree space. I got MFT allocation error ntfsplus driver again, so when I retu=
rned to regular ntfs3 driver, files copied correctly and no file corruption=
s and issues visually at all, but just in case, i looked in dmesg logs and =
there massive kernel warning:
>>
>> [=C2=A0 305.576860] memmove: detected field-spanning write (size 3552) o=
f single field "re" at fs/ntfs3/index.c:863 (siz
>> e 0)
>> [=C2=A0 305.576882] WARNING: CPU: 2 PID: 10325 at fs/ntfs3/index.c:863 i=
ndx_delete_entry+0x1790/0x1870 [ntfs3]
>> [=C2=A0 305.576901] Modules linked in: ntfs3 snd_seq_dummy snd_hrtimer s=
nd_seq snd_seq_device nfnetlink_queue udp_diag n
>> f_conntrack_netlink tcp_diag inet_diag nft_masq nft_reject_ipv4 act_csum=
 cls_u32 sch_htb nft_queue bridge nft_chain
>> _nat nf_nat stp llc ccm algif_aead crypto_null des3_ede_x86_64 cbc des_g=
eneric libdes algif_skcipher cmac md4 algif
>> _hash af_alg overlay nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_r=
eject nft_limit nft_ct nf_conntrack nf_defr
>> ag_ipv6 nf_defrag_ipv4 nf_tables libcrc32c mousedev ums_realtek joydev u=
as usb_storage intel_rapl_msr intel_rapl_co
>> mmon x86_pkg_temp_thermal intel_powerclamp coretemp iTCO_wdt snd_hda_cod=
ec_realtek intel_pmc_bxt iwldvm kvm_intel s
>> nd_hda_codec_generic at24 snd_hda_codec_hdmi snd_hda_scodec_component kv=
m mei_pxp snd_hda_intel iTCO_vendor_support
>> mei_hdcp mac80211 irqbypass snd_intel_dspcfg snd_intel_sdw_acpi libarc4 =
psmouse rapl snd_hda_codec serio_raw atkbd
>> intel_cstate iwlwifi snd_hda_core libps2 i2c_i801 vfat intel_uncore fat =
r8169 vivaldi_fmap pcspkr snd_hwdep
>> [=C2=A0 305.576964]=C2=A0 i2c_smbus cfg80211 i2c_mux snd_pcm realtek mdi=
o_devres rfkill snd_timer lpc_ich libphy mei_me snd m
>> ei soundcore fujitsu_laptop sparse_keymap mac_hid sch_cake vboxnetflt(OE=
) vboxnetadp(OE) vboxdrv(OE) usbip_host usb
>> ip_core tcp_bbr pkcs8_key_parser i2c_dev sg crypto_user ntsync loop dm_m=
od nfnetlink zram 842_decompress 842_compre
>> ss lz4hc_compress lz4_compress bpf_preload ip_tables x_tables polyval_cl=
mulni(E) aesni_intel(E) polyval_generic(E)
>> ghash_clmulni_intel(E) crypto_simd(E) i8042(E) cryptd(E) crc32_pclmul(E)=
 sha256_ssse3(E) sha512_ssse3(E) gf128mul(E
>> ) sha1_ssse3(E) crct10dif_pclmul(E) serio(E) i915(E) ext4(E) video(E) dr=
m_display_helper(E) wmi(E) jbd2(E) mbcache(
>> E) usbhid(E) crc32c_intel(E) i2c_algo_bit(E) crc32c_generic(E) crc16(E) =
cec(E) intel_gtt(E) hid_generic(E) ttm(E) d
>> rm_buddy(E)
>> [=C2=A0 305.577018] CPU: 2 UID: 0 PID: 10325 Comm: pool-2 Tainted: G S=
=C2=A0=C2=A0 U=C2=A0 W=C2=A0 OE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.12.58-1-cac=
hyos-lts #1 09c56554
>> d06e0af6d4f01298236cdf5f899167af
>> [=C2=A0 305.577024] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER, [W]=3DWA=
RN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
>> [=C2=A0 305.577026] Hardware name: FUJITSU LIFEBOOK AH532/G21/FJNBB1D, B=
IOS Version 1.12 06/10/2019
>> [=C2=A0 305.577027] RIP: 0010:indx_delete_entry+0x1790/0x1870 [ntfs3]
>> [=C2=A0 305.577039] Code: ff 48 c7 c2 90 e3 a4 c1 48 c7 c7 b8 e3 a4 c1 4=
c 89 54 24 70 4c 89 44 24 68 48 89 74 24 60 c6 0
>> 5 45 f4 00 00 01 e8 70 6f ea c4 <0f> 0b 4c 8b 54 24 70 4c 8b 44 24 68 48=
 8b 74 24 60 e9 b4 fd ff ff
>> [=C2=A0 305.577041] RSP: 0018:ffffd4b4204479b0 EFLAGS: 00010246
>> [=C2=A0 305.577043] RAX: 0000000000000000 RBX: ffff8d851754a200 RCX: 000=
0000000000027
>> [=C2=A0 305.577045] RDX: ffff8d86ef3218c8 RSI: 0000000000000001 RDI: fff=
f8d86ef3218c0
>> [=C2=A0 305.577046] RBP: ffff8d85f9eecbd0 R08: 00000000ffffefff R09: 000=
0000000000003
>> [=C2=A0 305.577048] R10: ffffffff88a5d760 R11: ffffd4b420447800 R12: 000=
0000000000002
>> [=C2=A0 305.577049] R13: 0000000000000000 R14: ffff8d85f9eecca0 R15: fff=
f8d851754b800
>> [=C2=A0 305.577051] FS:=C2=A0 00007ae95eb086c0(0000) GS:ffff8d86ef300000=
(0000) knlGS:0000000000000000
>> [=C2=A0 305.577053] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
>> [=C2=A0 305.577055] CR2: 00005ddc06731088 CR3: 000000021e9ac003 CR4: 000=
00000001706f0
>> [=C2=A0 305.577057] Call Trace:
>> [=C2=A0 305.577059]=C2=A0 <TASK>
>> [=C2=A0 305.577064]=C2=A0 ni_remove_name+0x10b/0x270 [ntfs3 ffcddedc8a07=
8abf7548ec42d6d01f0087e2d815]
>> [=C2=A0 305.577078]=C2=A0 ntfs_unlink_inode+0x15e/0x360 [ntfs3 ffcddedc8=
a078abf7548ec42d6d01f0087e2d815]
>> [=C2=A0 305.577090]=C2=A0 ntfs_unlink+0x44/0x70 [ntfs3 ffcddedc8a078abf7=
548ec42d6d01f0087e2d815]
>> [=C2=A0 305.577100]=C2=A0 vfs_unlink+0x114/0x2a0
>> [=C2=A0 305.577105]=C2=A0 do_unlinkat+0x2ea/0x380
>> [=C2=A0 305.577110]=C2=A0 __x64_sys_unlink+0xb7/0x1e0
>> [=C2=A0 305.577114]=C2=A0 do_syscall_64+0x7b/0x190
>> [=C2=A0 305.577120]=C2=A0 ? __x64_sys_futex+0x353/0x550
>> [=C2=A0 305.577125]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1b=
0
>> [=C2=A0 305.577130]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>> [=C2=A0 305.577134]=C2=A0 ? do_syscall_64+0x87/0x190
>> [=C2=A0 305.577138]=C2=A0 ? __x64_sys_futex+0x2cc/0x550
>> [=C2=A0 305.577141]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1b=
0
>> [=C2=A0 305.577144]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>> [=C2=A0 305.577148]=C2=A0 ? do_syscall_64+0x87/0x190
>> [=C2=A0 305.577151]=C2=A0 ? vfs_write+0x114/0x4b0
>> [=C2=A0 305.577154]=C2=A0 ? __call_rcu_common+0xd4/0xab0
>> [=C2=A0 305.577158]=C2=A0 ? evict+0x1ec/0x390
>> [=C2=A0 305.577161]=C2=A0 ? mntput+0x61/0x3e0
>> [=C2=A0 305.577164]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1b=
0
>> [=C2=A0 305.577168]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>> [=C2=A0 305.577171]=C2=A0 ? do_syscall_64+0x87/0x190
>> [=C2=A0 305.577174]=C2=A0 ? syscall_exit_to_user_mode_prepare+0x11e/0x1b=
0
>> [=C2=A0 305.577177]=C2=A0 ? syscall_exit_to_user_mode+0x37/0x190
>> [=C2=A0 305.577181]=C2=A0 ? do_syscall_64+0x87/0x190
>> [=C2=A0 305.577184]=C2=A0 ? do_syscall_64+0x87/0x190
>> [=C2=A0 305.577187]=C2=A0 ? do_syscall_64+0x87/0x190
>> [=C2=A0 305.577189]=C2=A0 ? irqentry_exit_to_user_mode+0x2c/0x190
>> [=C2=A0 305.577193]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [=C2=A0 305.577198] RIP: 0033:0x7ae96950e39b
>> [=C2=A0 305.577220] Code: ff 67 e8 08 93 01 00 0f 1f 84 00 00 00 00 00 f=
3 0f 1e fa b8 5f 00 00 00 0f 05 c3 0f 1f 40 00 f
>> 3 0f 1e fa b8 57 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 00=
 48 8b 15 41 99 0f 00 f7 d8
>> [=C2=A0 305.577221] RSP: 002b:00007ae95eb07728 EFLAGS: 00000206 ORIG_RAX=
: 0000000000000057
>> [=C2=A0 305.577224] RAX: ffffffffffffffda RBX: 00007ae948002e70 RCX: 000=
07ae96950e39b
>> [=C2=A0 305.577226] RDX: 0000000000000055 RSI: 00007ae948179220 RDI: 000=
07ae948002e70
>> [=C2=A0 305.577227] RBP: 00007ae95eb07740 R08: 0000000000000000 R09: 000=
05ddc05ec28e0
>> [=C2=A0 305.577228] R10: aaaaaaaaaaaaaaab R11: 0000000000000206 R12: 000=
07ae95eb077b0
>> [=C2=A0 305.577230] R13: 00007ae9481786c0 R14: 00005ddc06b78be0 R15: 000=
0000000000008
>> [=C2=A0 305.577233]=C2=A0 </TASK>
>> [=C2=A0 305.577234] ---[ end trace 0000000000000000 ]---
>>
>> Again there is no any visual error and file corruptions error, if I didn=
't go to dmesg logs, I didn't notice any issues, but there is some reason f=
or this warning.
>>
>
> Hello,
>
> Thanks for the report. To look into this, I need a bit more detail.
> Could you provide the kernel version you were running when the warning
> occurred, as well as the exact mount options used? This information
> would be very helpful for diagnosing the issue.
>
> Regards,
> Konstantin
>
Hello, kernel version was 6.12.58 and mount options was (rw,nosuid,nodev,no=
exec,noatime,uid=3D0,gid=3D0,iocharset=3Dutf8,uhelper=3Dudisks) at the time=
 of warning occurring.=C2=A0
