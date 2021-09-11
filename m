Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9BF3FC3
	for <ntfs3@lists.linux.dev>; Sat, 11 Sep 2021 19:46:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id n10so7707775eda.10
        for <ntfs3@lists.linux.dev>; Sat, 11 Sep 2021 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=ZDplAABJgIhd01M/CMMVDIcbLWux1TYHO9hIv9lijvg=;
        b=ZcZnkKXyWus3+fDg5u1m44VXx1fFMwBOLqMfzua9xkTvSeH/xY3h2MyXLcDL8PzzIP
         y2RnqPnJ+9tD7nHxytVLksPECrCEBZHRJPmclAY3votg384Ewm+2jUyrE4WxjICTSlVv
         i7EKMOyXxadw9bPQ4N9zeyCRHwoShRP8+zbPwbTmjRz23fYzXKM7GwU94g/A5wsrREam
         IrpoEGuMCsAl+wx+qDlxuKFUt3Uzd67L/l8VNU3pyxkPJ5YYnKL4aPDrlOfa8RHV2csB
         nKIW9Y5ve9+z0lW6LPT5R0HotbJ6SWzBqw81s//7RVS/jZnrsVfog9wayCohYPhLpgp+
         kZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=ZDplAABJgIhd01M/CMMVDIcbLWux1TYHO9hIv9lijvg=;
        b=rlk8zhZOXeFw0P8ousrwMMDdal6VvlswN18TvoUfjorcUBTLh1Jta5iL/om/PFfJWO
         mOSHhUkLi9qxxi0EPeknlFOtxYEv5j6+5KmQc0luwxfspAjlRZ6DOUNYgLm/gBwcXhNW
         5RTUKwhbWWwD1VQqsAZfX56505kGR/Rgj4T+MdeM7sN7fddHSwkBYuyO9gKEE3f1dYb7
         DaYWn5igUX9ojeF3cqHHWqdK4TVKUsEbAvnUE3139LlmOgv7bYG2dZptP1bx7F3Yj6gR
         KJs961Juo4NBIW1vscKB6IngXlZZ1+syQFbgdaEBciAjRovTLV7kxrJbtYjpZnD8RLmp
         4hgA==
X-Gm-Message-State: AOAM530wfP48+DFB8RA2zo7QswDyXbcmhh2xWZJDRLK0vII90b46IWCE
	+VjfMNaemzphx6Tf7bWMTzo4issBdH+gnw==
X-Google-Smtp-Source: ABdhPJyb8Xpe+qLfMCvxr+AckBfZ4UAZeg/6UuKYk2Ihf+YWl7wtpTayA8LhxMH7gy0Rm3WJLX5GYQ==
X-Received: by 2002:aa7:c9cd:: with SMTP id i13mr4774520edt.178.1631389610565;
        Sat, 11 Sep 2021 12:46:50 -0700 (PDT)
Received: from [192.168.0.163] ([37.239.218.45])
        by smtp.gmail.com with ESMTPSA id h2sm1342501edd.43.2021.09.11.12.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 12:46:50 -0700 (PDT)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [BUG] moving big tree of files to the ntfs partition causes kernel
 crash
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev
Message-ID: <f9de5807-2311-7374-afb0-bc5dffb522c0@gmail.com>
Date: Sat, 11 Sep 2021 22:46:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

I'm using the ntfs3 driver from the paragon git tree on the "5.10.59" 
kernel under Manjaro linux.

Trying to move a big tree of files ("buildroot" git tree) from an ext4 
partition to the ntfs partition is causing a kernel crash

 1.
    [ 952.614014] BUG: kernel NULL pointer dereference, address:
    000000000000000e
 2.
    [ 952.614017] #PF: supervisor read access in kernel mode
 3.
    [ 952.614018] #PF: error_code(0x0000) - not-present page
 4.
    [ 952.614018] PGD 0 P4D 0
 5.
    [ 952.614020] Oops: 0000 [#1] PREEMPT SMP NOPTI
 6.
    [ 952.614022] CPU: 3 PID: 182 Comm: kworker/u64:8 Tainted: G OE
    5.10.59-1-MANJARO #1
 7.
    [ 952.614023] Hardware name: Micro-Star International Co., Ltd
    MS-7C02/B450 TOMAHAWK MAX (MS-7C02), BIOS 3.B0 05/12/2021
 8.
    [ 952.614026] Workqueue: writeback wb_workfn (flush-8:16)
 9.
    [ 952.614030] RIP: 0010:ni_write_inode+0xe6b/0xed0 [ntfs3]
10.
    [ 952.614031] Code: 4f 06 44 8b 40 04 41 8b 37 48 89 c3 44 0f b7 48
    0a 48 8b 7c 24 20 4c 01 fa 44 89 44 24 38 e8 2c 38 01 00 8b 54 24 38
    48 89 de <44> 0f b7 48 0e 48 89 c7 44 89 4c 24 30 e8 13 fd 42 d2 44
    8b 4c 24
11.
    [ 952.614032] RSP: 0018:ffffb668007e7ac0 EFLAGS: 00010286
12.
    [ 952.614033] RAX: 0000000000000000 RBX: ffff9b4880ddfc30 RCX:
    0000000000000000
13.
    [ 952.614034] RDX: 0000000000000050 RSI: ffff9b4880ddfc30 RDI:
    ffff9b46283865a4
14.
    [ 952.614034] RBP: ffff9b461990c2c8 R08: ffff9b462b380000 R09:
    0000000000000001
15.
    [ 952.614035] R10: 0000000000000002 R11: 0000000000000002 R12:
    0000000000000000
16.
    [ 952.614035] R13: ffff9b458553c800 R14: ffff9b473a5c5100 R15:
    ffff9b4880dddc60
17.
    [ 952.614037] FS: 0000000000000000(0000) GS:ffff9b4c9eac0000(0000)
    knlGS:0000000000000000
18.
    [ 952.614037] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
19.
    [ 952.614038] CR2: 000000000000000e CR3: 00000004009d2000 CR4:
    0000000000350ee0
20.
    [ 952.614039] Call Trace:
21.
    [ 952.614044] ? ntfs_get_block_vbo+0x490/0x490 [ntfs3]
22.
    [ 952.614046] ? sched_clock+0x5/0x10
23.
    [ 952.614048] ? sched_clock_cpu+0xc/0xb0
24.
    [ 952.614049] __writeback_single_inode+0x268/0x320
25.
    [ 952.614051] writeback_sb_inodes+0x1fc/0x480
26.
    [ 952.614052] __writeback_inodes_wb+0x4c/0xe0
27.
    [ 952.614054] wb_writeback+0x1ff/0x2f0
28.
    [ 952.614055] wb_workfn+0x2f8/0x510
29.
    [ 952.614056] ? __update_idle_core+0x20/0xa0
30.
    [ 952.614058] ? __switch_to_asm+0x42/0x70
31.
    [ 952.614061] process_one_work+0x1ad/0x370
32.
    [ 952.614062] worker_thread+0x50/0x3b0
33.
    [ 952.614063] ? rescuer_thread+0x380/0x380
34.
    [ 952.614064] kthread+0x133/0x150
35.
    [ 952.614066] ? kthread_associate_blkcg+0xc0/0xc0
36.
    [ 952.614067] ret_from_fork+0x22/0x30
37.
    [ 952.614068] Modules linked in: xt_CHECKSUM xt_MASQUERADE
    xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat
    nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
    nft_counter nf_tables libcrc32c bridge stp llc rfcomm ntfs3(OE)
    nfnetlink md4 rpcrdma rdma_cm iw_cm nls_utf8 ib_cm cifs ib_core
    dns_resolver fscache libdes ccm cmac algif_hash algif_skcipher
    af_alg joydev mousedev bnep btusb btrtl btbcm btintel bluetooth
    usbhid ecdh_generic ecc uas usb_storage iwlmvm mac80211 libarc4
    snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
    snd_hda_codec_hdmi iwlwifi snd_hda_intel snd_intel_dspcfg
    edac_mce_amd soundwire_intel soundwire_generic_allocation
    soundwire_cadence nct6775 hwmon_vid snd_hda_codec kvm_amd
    snd_hda_core kvm snd_hwdep soundwire_bus irqbypass wmi_bmof cfg80211
    snd_soc_core crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
    snd_compress ac97_bus snd_pcm_dmaengine snd_pcm aesni_intel r8169
    snd_timer crypto_simd ccp cryptd nls_iso8859_1 snd glue_helper realtek
38.
    [ 952.614099] vfat mdio_devres rapl fat rfkill libphy rng_core
    soundcore sp5100_tco mac_hid i2c_piix4 k10temp wmi acpi_cpufreq
    gpio_amdpt pinctrl_amd gpio_generic pcspkr nfsd vboxnetflt(OE)
    vboxnetadp(OE) auth_rpcgss nfs_acl lockd vboxdrv(OE) grace uinput
    i2c_dev sunrpc sg crypto_user fuse nfs_ssc ip_tables x_tables ext4
    crc32c_generic crc16 mbcache jbd2 crc32c_intel xhci_pci amdgpu
    gpu_sched ttm i2c_algo_bit drm_kms_helper syscopyarea sysfillrect
    sysimgblt fb_sys_fops cec drm agpgart
39.
    [ 952.614119] CR2: 000000000000000e
40.
    [ 952.614121] ---[ end trace f5cc69b33954c423 ]---
41.
    [ 952.614123] RIP: 0010:ni_write_inode+0xe6b/0xed0 [ntfs3]
42.
    [ 952.614124] Code: 4f 06 44 8b 40 04 41 8b 37 48 89 c3 44 0f b7 48
    0a 48 8b 7c 24 20 4c 01 fa 44 89 44 24 38 e8 2c 38 01 00 8b 54 24 38
    48 89 de <44> 0f b7 48 0e 48 89 c7 44 89 4c 24 30 e8 13 fd 42 d2 44
    8b 4c 24
43.
    [ 952.614125] RSP: 0018:ffffb668007e7ac0 EFLAGS: 00010286
44.
    [ 952.614125] RAX: 0000000000000000 RBX: ffff9b4880ddfc30 RCX:
    0000000000000000
45.
    [ 952.614126] RDX: 0000000000000050 RSI: ffff9b4880ddfc30 RDI:
    ffff9b46283865a4
46.
    [ 952.614127] RBP: ffff9b461990c2c8 R08: ffff9b462b380000 R09:
    0000000000000001
47.
    [ 952.614127] R10: 0000000000000002 R11: 0000000000000002 R12:
    0000000000000000
48.
    [ 952.614128] R13: ffff9b458553c800 R14: ffff9b473a5c5100 R15:
    ffff9b4880dddc60
49.
    [ 952.614128] FS: 0000000000000000(0000) GS:ffff9b4c9eac0000(0000)
    knlGS:0000000000000000
50.
    [ 952.614129] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
51.
    [ 952.614130] CR2: 000000000000000e CR3: 00000004009d2000 CR4:
    0000000000350ee0
52.
    [ 970.534491] kauditd_printk_skb: 1 callbacks suppressed

