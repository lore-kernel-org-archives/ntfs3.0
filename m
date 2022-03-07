Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45FB3674
	for <ntfs3@lists.linux.dev>; Mon,  7 Mar 2022 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1646651004;
	bh=GgtQcQmWltsL+DTQ4+/2PKq9bNkfsgt48CXhfwCgW+k=;
	h=X-UI-Sender-Class:Date:From:Subject:To;
	b=Y1VE7VTmFE55B66xJJoY9y+Aeg3v4sxFfSGRBnyMp0i++aF68ztkVHqBnvvzhdraI
	 BhGsCd1TU5mZYIbz+bX1XBIiHO6ZwAMxFst00OZY+yWuLePbYvQ+F+sJqAAzKAkjw6
	 7kyUSNVdrONSuHHBMoUFSDKUqLPdQ/ZrAw6QpOb8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.252] ([5.166.188.159]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MTRMi-1nayki2u6e-00Tpis for
 <ntfs3@lists.linux.dev>; Mon, 07 Mar 2022 12:03:24 +0100
Message-ID: <e039b7ff-8ff0-a05a-eede-4ae74f3a5cc1@gmx.com>
Date: Mon, 7 Mar 2022 11:03:23 +0000
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: [BUG REPORT] kernel oops on trying to list $Extend
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oHN7bp7Qd+VNp0uqjD1391lRW+INKgsaxNTR1LGdcrq2MSzMmiB
 oMk0j3I50KeTf0d1P3FchB9EZlVEvjn/6Ha5+gMIR2i8iWNsMNxgAd0TT71tKpDN47oRBRb
 Pwh+XslSSy9ZN2r2mt3JW/4QJ5gIDtnfAwG1gosMwxV739L0gzLKDeMjsB6wVaUCQMu8ebV
 XQ4U3h+5BT9fzbJeNEe/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9YNd/5gn5+E=:FYsrj0b7KViLdRcTa+IL2K
 Kym8fz/b+8a28hNtT3AV6gGtJyowMjFqesFsnzwnP3y6N66hrUgvzjS4siHdFtwzCtKvLflSt
 jlHaRl7PvvXrp+uYe6fEBvs+N27glXi/R2SFIqwXa1bhbNTaKUFER3k5o/8whwm9N2AJJMp+3
 OLrqP23+igjysHMSsboiey29Wb/Cgr5G3YS3MYpmrVZ8R1btxz1F696t34se4nD2pBoa5UQ4s
 NlkBnGXN+2inQXQ1zN9crzD0cblILYWlEZvd4WXk0Fm/wfnpAU+sZ5m7QHd9TyEOhV7hU6uq4
 Aycjm1NYqWem3yjbBibzqPi4ZcVjkVnzSnvbs7LcDwD0n7777nXkQL5RDYnY7pE2G1yZFhg4A
 WEQbZwpxpzi2QP/C74FFWOAl00APtnRgyfGx3K1jbPXJnn1ZBOivyc50xbnC6wHfD7PD0/0tI
 zfRuKEUnGjWgh599iAINaEj+85cddsaUSrdfgWrS/8NAGJpWXEOX9EkOzQAQf8Qaww4al3GrO
 hn7I5cXbUNCbiwdq/QM2Wdp1915xfNcZggsJy1V+NLV181Z4/NSvziDogQenvWys0EIkrKFRE
 S4a7fKqG3QGOq+cAf8Hf0UYHkUHEX1XmIjQUi07QsHrwXV4wPfwgr5qUlHwvw7IwopA+aMpQL
 F+vgoBlPIzdZ5FKsQQsKKgVlewSc3JUd/Oga64/Dbdv9kb46OFC8wHrySoSxnQBwrqQK6PaKi
 bCxDAwxQXeCzCRMJ1f0aCgc1Nw0JWIRh2Drw9mXBFZXtHeJuXx0V4hKbp+0GAZs5Mhv8zmxhf
 t6Fox2M3PSSAcrpsPb/5nwDK10S7p/n8/dHBLczsWQzcKlDR9LBb6I5DG8ttydc43fxvbdcDE
 +0NAkfHjVePZRHbjOVHiJUcJGZEOxL0uaHmK1nmfSIEStkaAq8rUY7sxA7yMin7KQdj95VOZk
 /71iOVl+pp4qRC18haIxgZm8S9GkrBofyXIin488Mp0nCYduZWBVzgq4rXyiC9KGw3+R3s9HN
 AY7T32QTahDTl+bgQy65OAhgwwSkBblbGpZbvZio1ihRMbMgH3zg7PDnLgr5/nL/oQ==

Hello,

I tried to enter the $Extend directory of my flash drive which led to
the task trying to enter it being killed by the kernel and kernel
reporting a ton of errors.

The kernel version is 5.15.19

The partition was mounted as

# mount -t ntfs3 -o noatime,showmeta,prealloc,noacsrules /dev/sdc1
/media/flash

ntfs3: Max link count 4000
ntfs3: Read-only LZX/Xpress compression included
BUG: kernel NULL pointer dereference, address: 0000000000000008
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 7 PID: 559766 Comm: mc Tainted: P           O      5.15.19-az2 #1
Hardware name: System manufacturer System Product Name/TUF GAMING
X570-PLUS (WI-FI), BIOS 4021 08/10/2021
RIP: 0010:d_flags_for_inode+0x60/0x80
Code: 0d 08 0f 45 c2 c3 31 c0 c3 b8 00 00 20 00 f6 c2 02 75 e3 48 8b 4f
20 48 83 39 00 74 24 83 ca 02 66 89 57 02 eb d0 48 8b 4f 20 <48> 83 79
08 00 75 09 83 ca 04 66 89 57 02 eb ab b8 00 00 60 00 eb
RSP: 0018:ffffb40a01ffbb20 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000008 RSI: ffffa2561af0b5b0 RDI: ffffa256badac350
RBP: ffffb40a01ffbb60 R08: ffffb40a01ffbb98 R09: ffffb40a01ffba98
R10: ffffa256e6a00000 R11: 0000000000000006 R12: ffffa2561af0b500
R13: ffffa256badac350 R14: 0000000000000000 R15: ffffa2561af0b558
FS:  00007f1f5e8a0740(0000) GS:ffffa261eefc0000(0000) knlGS:00000000000000=
00
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 0000000405d92000 CR4: 0000000000350ee0
Call Trace:
  <TASK>
  ? d_splice_alias+0xcc/0x4c0
  ? kmem_cache_free+0x96/0x240
  ntfs_lookup+0x6d/0xb0 [ntfs3]
  __lookup_slow+0x70/0x110
  walk_component+0x113/0x180
  ? path_init+0x2bc/0x3e0
  path_lookupat+0x69/0x1b0
  filename_lookup+0xb7/0x1a0
  ? strncpy_from_user+0x53/0x140
  ? getname_flags.part.0+0x47/0x1b0
  user_path_at_empty+0x3a/0x60
  vfs_statx+0x66/0x100
  __do_sys_newfstatat+0x27/0x50
  ? __do_sys_newfstatat+0x3a/0x50
  __x64_sys_newfstatat+0x17/0x20
  do_syscall_64+0x5c/0x80
  ? exit_to_user_mode_prepare+0x150/0x1d0
  ? syscall_exit_to_user_mode+0x17/0x40
  ? do_syscall_64+0x69/0x80
  ? sysvec_reschedule_ipi+0x6c/0x80
  ? asm_sysvec_reschedule_ipi+0xa/0x20
  entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f1f5eaf9cde
Code: 48 89 f2 b9 00 01 00 00 48 89 fe bf 9c ff ff ff e9 07 00 00 00 0f
1f 80 00 00 00 00 f3 0f 1e fa 41 89 ca b8 06 01 00 00 0f 05 <3d> 00 f0
ff ff 77 0b 31 c0 c3 0f 1f 84 00 00 00 00 00 48 8b 15 11
RSP: 002b:00007ffe753a3508 EFLAGS: 00000246 ORIG_RAX: 0000000000000106
RAX: ffffffffffffffda RBX: 0000556b29e173a0 RCX: 00007f1f5eaf9cde
RDX: 00007ffe753a3590 RSI: 0000556b29dd6270 RDI: 00000000ffffff9c
RBP: 0000556b29df3e70 R08: 0000556b292f5ac0 R09: 0000000000000032
R10: 0000000000000100 R11: 0000000000000246 R12: 00007ffe753a3590
R13: 00007ffe753a358c R14: 00007ffe753a3588 R15: 0000000000000000
  </TASK>
Modules linked in: ntfs3 usb_storage xfs rfcomm snd_hrtimer tun
nf_log_syslog nft_limit nft_ct nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 vboxnetadp(O) vboxnetflt(O) nfnetlink_log nft_log
nft_counter vboxdrv(O) cmac algif_hash algif_skcipher af_alg bnep
nf_tables libcrc32c nfnetlink nct6775 hwmon_vid input_leds hid_generic
usbhid hid btusb btbcm btintel bluetooth ecdh_generic ecc rfkill
nvidia_drm(PO) nvidia_modeset(PO) nvidia(PO) snd_hda_codec_realtek
snd_hda_codec_generic kvm_amd ledtrig_audio wmi_bmof led_class
snd_hda_codec_hdmi kvm irqbypass snd_hda_intel crct10dif_pclmul
crc32_pclmul snd_intel_dspcfg crc32c_intel aesni_intel snd_hda_codec
crypto_simd snd_hwdep snd_hda_core snd_seq cryptd snd_seq_device r8169
efi_pstore pcspkr snd_pcm realtek ccp sr_mod mdio_devres snd_timer
sha256_generic tpm_crb libphy libsha256 xhci_pci cdrom 8250 tpm_tis snd
sha1_generic xhci_hcd i2c_nvidia_gpu i2c_piix4 k10temp wmi 8250_base
tpm_tis_core serial_core tpm rng_core evdev msr fuse
  ip_tables x_tables ipv6
CR2: 0000000000000008
=2D--[ end trace a02c464e86038187 ]---
RIP: 0010:d_flags_for_inode+0x60/0x80
Code: 0d 08 0f 45 c2 c3 31 c0 c3 b8 00 00 20 00 f6 c2 02 75 e3 48 8b 4f
20 48 83 39 00 74 24 83 ca 02 66 89 57 02 eb d0 48 8b 4f 20 <48> 83 79
08 00 75 09 83 ca 04 66 89 57 02 eb ab b8 00 00 60 00 eb
RSP: 0018:ffffb40a01ffbb20 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: 0000000000000008 RSI: ffffa2561af0b5b0 RDI: ffffa256badac350
RBP: ffffb40a01ffbb60 R08: ffffb40a01ffbb98 R09: ffffb40a01ffba98
R10: ffffa256e6a00000 R11: 0000000000000006 R12: ffffa2561af0b500
R13: ffffa256badac350 R14: 0000000000000000 R15: ffffa2561af0b558
FS:  00007f1f5e8a0740(0000) GS:ffffa261eefc0000(0000) knlGS:00000000000000=
00
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 0000000405d92000 CR4: 0000000000350ee0
note: mc[559766] exited with preempt_count 2



Best regards,
Artem
