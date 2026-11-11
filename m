Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394058;
	b=GjjR8agt6+5agma6vm/pSocVIRNSzOp7el8V1zR7J2CL7ghv/4DCF+S0Vl9DejfaN39j
	 hhPd1g+yIENqe1ZauN4dXjBRhB9Ddmf9uHE4VICj2C/t6fItPy1pjLVj0ZIfVcA72FSB8
	 Kr/yM9qeY4XPGi69lauAq7vp0bKW8T9fKlGmaHNsIaNM6+X8LmQ52lKe9zyH3AwZpgo76
	 vzR3kNYplsZ4CTmupQ9xOxHCVKBRnJTs9yLCD7HEWdPByMt2y6mHtKXlsrTlB+xWzf/hG
	 mMXMyhG5mBlrmSwlnM6/6NNod73MWARilAgU8P8qC9jlUonr50abrDhvHe4abVxuqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394058;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=vuP1cQMJfVaVjVYw/27kHpoCiavhllPegZXximWZIa4=;
	b=SIKv61XROXFS4klUJwpnYfxssLdWxsD6MWf/WXr8hdMZ4kIwykFHuYJzWQMsgkZtJCzD
	 btIpl4dR+H/JZqBS4iU+PVjk65De4M0HNRtcN4DE3KWYoqwpFn84qr+M4Wh+UWhu8gB24
	 pXXBxU8CWrzyaqVh1ozdop0US58a+iv7u2u494SZUcYkCzdj3GQjLjPSLWTiWFjEtCc6A
	 inLab1LzEgikOGiW13Th/E79hXRRfwJ3wtaiLfgik+Qnq5ReefG3MaJnfiDDYn3LMWbpT
	 bH6ER6Pnh8o4bBFWqxQwxozUe/9i9J3QzlWUmilMoTcXWacC0o1TEqHdLxDwEfKufXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=nnZXuKB7;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A831606A327
	for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 10:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A831606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=nnZXuKB7
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 1581B1D28;
	Wed, 11 Nov 2026 10:48:21 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=nnZXuKB7;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 4797F1D27;
	Wed, 11 Nov 2026 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1794394056;
	bh=vuP1cQMJfVaVjVYw/27kHpoCiavhllPegZXximWZIa4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nnZXuKB7KKQg9Ip1Ql4z1CrGCkVsOaLHOrq8GPrhWaxXi29K+EEwVy4X3NVZDhrmo
	 X7b60/j5tAPwajJOEcgif9Q/yO/l7JRdSFM4ylziKZIrpDlYaXyUlr4V+Bd0woKFTx
	 pXLFxiyG26BnaFcrWqjJcW1UodxQfubTaJSScem0=
Received: from [192.168.95.128] (172.30.20.211) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Nov 2026 13:47:35 +0300
Message-ID: <1730cdd0-fb23-413c-b7b0-4270d7cffe14@paragon-software.com>
Date: Wed, 11 Nov 2026 11:47:33 +0100
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
Subject: Re: Fwd: InjectionBunny: NTFS3 SUID injection leading to local
 privilege escalation
To: vova tokarev <vladimirelitokarev@gmail.com>
CC: <security@kernel.org>, <ntfs3@lists.linux.dev>
References: <CAGBKPgMqBMsBH4mm2fwggA8rJZ3R15nPxuEh0emOeVpX2kgHPA@mail.gmail.com>
 <CAGBKPgPiXyKWtjgYSACnugmG1XPs=mPg-Zu-xQziUZ1k921+qA@mail.gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <CAGBKPgPiXyKWtjgYSACnugmG1XPs=mPg-Zu-xQziUZ1k921+qA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/7/26 12:39, vova tokarev wrote:

> Hi,
>
> It's been almost two months since I reported this, and I haven't heard
> back. I recently learned I should reach out to the subsystem maintainer
> directly, so forwarding this to you.
>
> I noticed that CVE-2026-63833 (commit f8d420949b33) was assigned and
> merged for a related issue -- blocking setxattr() writes to $LX*
> names. However, this only fixes one of the two attack vectors I
> reported. The primary vector in my original report remains open:
>
> A pre-crafted NTFS image (e.g. USB drive) with $LXUID=0, $LXGID=0,
> $LXMOD=0104755 already in the MFT produces a setuid-root binary the
> moment the volume is mounted. No setxattr() is involved -- the EAs
> are on disk. The -EPERM check doesn't help.
>
> The root cause is still at fs/ntfs3/xattr.c:1022:
>
>     inode->i_mode = le32_to_cpu(value[2]);
>
> This loads S_ISUID/S_ISGID directly from untrusted on-disk data.
> Desktop automounters (udisks) mount NTFS with suid by default, so
> plugging in a crafted USB gives any local user euid=0.
>
> Suggested one-line fix:
>
> -   inode->i_mode = le32_to_cpu(value[2]);
> +   inode->i_mode = le32_to_cpu(value[2]) & ~(S_ISUID | S_ISGID);
>
> I have a full PoC and working demo (included in my original report
> below). Would love to hear your thoughts.
>
> Thanks,
> Vladimir
>
> ---------- Forwarded message ---------
> From: *vova tokarev* <vladimirelitokarev@gmail.com>
> Date: Thu, Jun 25, 2026 at 2:18 PM
> Subject: InjectionBunny: NTFS3 SUID injection leading to local 
> privilege escalation
> To: <security@kernel.org>
>
>
> Hi,
>
> I found a local privilege escalation (InjectionBunny) in the ntfs3
> filesystem driver. The function ntfs_get_wsl_perm() in fs/ntfs3/xattr.c
> assigns the on-disk $LXMOD extended attribute directly to inode->i_mode
> without masking S_ISUID or S_ISGID bits.
>
> A crafted NTFS image (e.g., on a USB drive) with $LXUID=0, $LXGID=0,
> $LXMOD=0104755 on a binary makes it appear as a setuid-root executable
> when mounted. Executing the binary gives immediate root access.
>
> The attack is deterministic (no race condition, no heap spray), works
> on first attempt, and affects every Linux system with CONFIG_NTFS3_FS
> that mounts NTFS volumes without the nosuid option.
>
> The same pattern exists in the old ntfs driver (fs/ntfs/ea.c function
> ntfs_ea_get_wsl_inode).
>
> Affected versions: Linux 4.11+ (since ntfs3 WSL EA support)
> Confirmed on: 7.1.0 (aarch64)
>
> Attached files:
>   - InjectionBunny.mov             Video demo of full exploit
>   - injection_bunny.py             Creates malicious NTFS image
>   - suidhelper.c                   SUID payload (setuid(0) + shell)
>   - InjectionBunny_report.md       Detailed writeup with root cause,
>                                    reproduction, and suggested fix
>
> Suggested fix: mask S_ISUID/S_ISGID in ntfs_get_wsl_perm():
>   inode->i_mode = le32_to_cpu(value[2]) & ~(S_ISUID | S_ISGID);
>
> Thank you,
> Vladimir Tokarev
>
>
Hello,

Sorry for the late reply.

I'll look into it. Note, though, that this is not specific to ntfs3:
any filesystem that stores Unix permissions (ext4, xfs, ...) can carry
a setuid-root binary on removable media, and the usual protection is
mounting untrusted media with nosuid. As far as I know, udisks2 does
use nosuid for removable devices.

Unconditionally masking S_ISUID/S_ISGID would also break users who
legitimately keep Linux binaries on NTFS. I'm considering ignoring these
bits by default and honoring them only when explicitly requested by a
mount option.

Regards,
Konstantin

