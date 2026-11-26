Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706112;
	b=hhhy/lW8+cNLcWy3ljvylWL530VVNDYjK+45ZseVYUkhsL18ERAcDToxwADNk6VhjHNM
	 tMzFkvO7cyFId3QTN1wJ5GYZe/Vw1fqnVt5XSd4T5Bdx3UfIEhyEvZN+MnykmxOY4X88C
	 aLNIFARvIJVgMYWRzKc+pU3uaq/9nARReqOKd+LjN88GfREaYhCj69hAM08C92sih7HB4
	 1WhZVhQnFpOmIFewh8VMJE9q/9kP3SmPEDCBuBOUM8XU4vBvbmjSNeW8Iayh9rtnnKsmm
	 Ka2VFvmTEF2btt2UOkJfDirjoY1IEqOqvRiPMWAJKqaSm2TD+ratxpAuRn58vwTVOQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706112;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=OBoGZF4L2oRdLe0c12sHffSnTKx2UbQ/FYAC5Q408Pw=;
	b=5qe8SGF/qrdS/GTPd1bDXAIj2lanNTrJAb3yRJpfOD+NCxaWTpaWvjaQW8pMKNPxJ0Db
	 JyDhGHLc0cAq4tNbRhEVNL3LTPVPZ/IHbtH03ZA4GQZX54ZCjwcW2uVlehEpNpymX3w1S
	 WFzItX4zTu6HdXpyIX1A46ZOJumlQihSRUo+Q0c6p2IiP/MhGhR/7T9Rvx0TGaAf9q2Ed
	 +WAK1nwqHZptAPUCYqYUXAO9MNLe8Mj6LiiV2PMiT9coaeWfiuhWZ08C57WBNMQXGhVxn
	 I5LrbywQVzK7567zxOlc5uqm795Y4gl/geWvUUL4S+Dp3sF9SYTmNr9XjTi4mEmvI1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=fgK+lDZK;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F2C606A31E
	for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F2C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=fgK+lDZK
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C583E1D38;
	Thu, 26 Nov 2026 15:15:51 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=fgK+lDZK;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E19622092;
	Thu, 26 Nov 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795706109;
	bh=OBoGZF4L2oRdLe0c12sHffSnTKx2UbQ/FYAC5Q408Pw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fgK+lDZKsHtalga5W1d1r3/PK6eKRghm67esDZX2NIJ73EgpgVVtsAoHTrkyQ/nt9
	 75kU4wJtCpTtBTIJPiM8TGcQAuBGQQD+2NDEZdxX2RR+Muoh+2vW+VviwGg0LxgpT1
	 qwRFehnQL1hpf5mMqNh+L9x6Pg7krQX1aH3VTSX4=
Received: from [192.168.95.128] (172.30.20.193) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 26 Nov 2026 18:15:09 +0300
Message-ID: <5788f8c3-d5b6-4acf-9b66-3209735416a9@paragon-software.com>
Date: Thu, 26 Nov 2026 16:15:07 +0100
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reject short restart table entries
To: Shawn <shawnq1@163.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <72bf4f2c.9eb3.1a08660120d.Coremail.shawnq1@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <72bf4f2c.9eb3.1a08660120d.Coremail.shawnq1@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/9/26 15:33, Shawn wrote:

> Hello,
>
> check_rstbl() in fs/ntfs3/fslog.c accepts a restart-table entry size smaller
> than the four bytes it unconditionally reads for every entry.  A crafted NTFS
> $LogFile can therefore cause a kernel heap out-of-bounds read while mounting a
> read-only filesystem image.
>
> This is a manually constructed reproducer and does not use syzkaller.
>
> HEAD commit:    940de590b839f71d6dc846160534bf202401b8b7
> git tree:       upstream Linux checkout, local branch master
> source version: Linux 7.3.0-rc1-00101-g940de590b839
> compiler:       gcc (Ubuntu 11.4.0-1ubuntu1~22.04.3), GNU ld 2.38
>
> console output:
> https://gist.githubusercontent.com/shaos26/a7382d96d2a86c51c279fd994d9a2a1c/raw/6dce660d99e244275dcc87ef79391e10ab66b9f3/console-output.txt
> kernel config:
> https://gist.githubusercontent.com/shaos26/a7382d96d2a86c51c279fd994d9a2a1c/raw/6dce660d99e244275dcc87ef79391e10ab66b9f3/kernel-config.txt
> reproducer:
> https://gist.githubusercontent.com/shaos26/a7382d96d2a86c51c279fd994d9a2a1c/raw/6dce660d99e244275dcc87ef79391e10ab66b9f3/poc.c
>
> The experiment uses QEMU TCG only.  No hardware, kernel module, kprobe,
> address leak, or modified kernel code is required for the trigger.
>
> To reproduce, create a clean NTFS image on the host and apply the on-disk log
> mutation with poc.c:
>
>      cc -O2 -Wall -Wextra -o ntfs3_make_restart poc.c
>      truncate -s 32M ntfs3-candidate-base.img
>      mkntfs -F -Q ntfs3-candidate-base.img
>      cp ntfs3-candidate-base.img ntfs3-candidate.img
>      ./ntfs3_make_restart ntfs3-candidate.img --candidate
>
> Boot the unpatched KASAN kernel in a disposable QEMU guest, pass
> ntfs3-candidate.img as a read-only second virtio disk, and run:
>
>      mount -t proc proc /proc
>      mount -t tmpfs tmpfs /tmp
>      mkdir -p /tmp/ntfs
>      mount -o ro -t ntfs3 /dev/vdb /tmp/ntfs
>
> Use the following QEMU command for the disposable guest:
>
>      qemu-img create -f qcow2 -F raw \
>        -b <buildroot-base-image> /tmp/ntfs3-repro-root.qcow2
>
>      qemu-system-x86_64 -m 2G -smp 1 \
>        -kernel <linux-tree>/arch/x86/boot/bzImage \
>        -append 'quiet loglevel=1 acpi=off console=ttyS0 root=/dev/vda1 init=/bin/sh' \
>        -drive file=/tmp/ntfs3-repro-root.qcow2,format=qcow2,if=virtio \
>        -drive file=/tmp/ntfs3-candidate.img,format=raw,if=virtio,readonly=on \
>        -nographic -monitor none -machine pc -no-reboot \
>        -virtfs local,path=<research-root>,mount_tag=research,security_model=none
>
> Replace <buildroot-base-image>, <linux-tree>, and <research-root> with local
> paths.  The second virtio disk is /dev/vdb in the guest.
>
> The vulnerable kernel reports:
>
>      BUG: KASAN: slab-out-of-bounds in log_replay+0x6fc8/0xf290
>      Read of size 4 at addr ffff88802a5cfec4 by task mount/4914
>      Call Trace:
>        log_replay
>        ntfs_loadlog_and_replay
>        ntfs_fill_super
>        get_tree_bdev_flags
>        vfs_get_tree
>        path_mount
>        __x64_sys_mount
>      The buggy address belongs to the cache kmalloc-64 of size 64
>      The buggy address is located 4 bytes to the right of
>      allocated 64-byte region
>
> The access is reached through the normal mount path:
>
>      mount(2)
>        -> ntfs_fill_super()
>        -> ntfs_loadlog_and_replay()
>        -> log_replay()
>        -> read_log_rec_lcb()
>        -> find_log_rec()
>        -> check_rstbl()
>        -> 4-byte out-of-bounds read
>
> The crafted DPT restart table has these relevant fields:
>
>      client_data_len = 0x40
>      restart-table bytes = 0x20
>      restart-table size = 1
>      restart-table used = 8
>      restart-table total = 8
>      entries = 0xff x 8
>
> check_rstbl() computes:
>
>      ts = 1 * 8 + sizeof(struct RESTART_TABLE) = 0x20
>
> The existing checks reject size == 0, but accept size == 1.  The loop then
> advances by one byte while loading a __le32 from each entry.  For the final
> entry, the four-byte load extends beyond the allocated kmalloc-64 object.
>
> This is distinct from the existing restart-table growth and DPT-specific
> page_lcns[] capacity checks: the generic check_rstbl() four-byte load happens
> before those later validations.
>
> Impact and privilege boundary:
>
> This is a kernel heap out-of-bounds read caused by a malicious NTFS filesystem
> image.  A read-only mount is sufficient; the image does not need to be
> writable and no special hardware is required.  The current reproducer used
> root/CAP_SYS_ADMIN in the disposable guest to attach the block image and mount
> it.  An unprivileged direct mount path has not been established.  No privilege
> escalation, information disclosure, or code execution has been demonstrated.
>
> Reject restart-table entry sizes smaller than the width used by the validation
> loop:
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Cc: stable@vger.kernel.org
> Signed-off-by: shaos <YOUR_EMAIL>
> ---
>   fs/ntfs3/fslog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index ed50c1d0c23e3..c24a0713b8599 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -745,7 +745,7 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
>
>      ts = rsize * ne + sizeof(struct RESTART_TABLE);
>
> -   if (!rsize || rsize > bytes ||
> +   if (rsize < sizeof(__le32) || rsize > bytes ||
>          rsize + sizeof(struct RESTART_TABLE) > bytes || bytes < ts ||
>          le16_to_cpu(rt->total) > ne || ff > ts - sizeof(__le32) ||
>          lf > ts - sizeof(__le32) ||
>
> Validation results:
>
>      unfixed KASAN kernel:  1/1 trigger, KASAN slab-out-of-bounds
>      unfixed stability:     20/20 mount/umount entries completed; one same-site KASAN report
>      fixed KASAN kernel:     1/1 A/B run, mount_exit=0, no KASAN/OOB/BUG report
>
> The 20/20 figure is the successful mount/umount entry count, not 20
> independent KASAN reports; KASAN suppresses repeated reports from the same
> site.
>
> Thanks,
>
> shaos

Hello,

Your patch is applied, thanks.

Regards,
Konstantin

