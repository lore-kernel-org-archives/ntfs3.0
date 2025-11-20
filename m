Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BD1EEA3C;
	Thu, 20 Nov 2025 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763628411; cv=none; b=KsuUQsVpu+CJzSILfUUU4sCw5dYhZ4OXuVaUWzgxtL8S/AJDr5oi7X0n0Dd5bKfOab1hEp6JSpFSpAcWZvW7WrCpxi1vJJBpNgGTfhuAsPknq5D6tZSci+51TD+HexH+dRRKONkFHhuxuxAFFjNdZlXgOdiCV21dXHtmJIXupb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763628411; c=relaxed/simple;
	bh=l3mjIO9hACtSsl9DOyZapEVUfSdfw6kwiXyNsNC+0Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZRF8hXSc3OxxmkBqhqRejQmx8MLO8LEiQAVXqVYa0rRcG3Br6I7W2irPDvqlmFn5jJUuG5CHOO+Ou/lDrGKYbpUTTY/pzGrORDYoM/eJm1JKoLq4Yiw4jflMNILuRl1lGfUi0tap5R3z1YXOwwrD0QzbGzK9MmcBmov2Mffq3bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=tLx99VWa; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="tLx99VWa"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0F6D326;
	Thu, 20 Nov 2025 08:43:19 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=tLx99VWa;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 894DB1FA3;
	Thu, 20 Nov 2025 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763628406;
	bh=jOCjSAED0ZhZdaYclzVInOSOFItaiptGx5fsnmde14A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tLx99VWamtABEjEDz5/zA0LvR4F1vaLHPVmOdSzW9nNSSe+xfC9adx64sy9bI9z9k
	 VJe5aj9R5biUzKQ5rg+Oi9gwl2QUA4yxc9F62QnXs+GePp6s56doQ25o0mn9bY91ca
	 ZqZIWjly6h6M0vS8gtLR3M3AVLWgjMveBUd96NyU=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 11:46:44 +0300
Message-ID: <1c018215-0ce2-48dd-aced-1fe373a42358@paragon-software.com>
Date: Thu, 20 Nov 2025 09:46:43 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs3: fix uninit memory after failed mi_read in
 mi_format_new
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com>,
	<linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
	<david.hunter.linux@gmail.com>, <khalid@kernel.org>
References: <20251012201635.378419-2-rpthibeault@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251012201635.378419-2-rpthibeault@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10/12/25 22:16, Raphael Pinsonneault-Thibeault wrote:

> Fix a KMSAN un-init bug found by syzkaller.
>
> ntfs_get_bh() expects a buffer from sb_getblk(), that buffer may not be
> uptodate. We do not bring the buffer uptodate before setting it as
> uptodate. If the buffer were to not be uptodate, it could mean adding a
> buffer with un-init data to the mi record. Attempting to load that record
> will trigger KMSAN.
>
> Avoid this by setting the buffer as uptodate, if it’s not already, by
> overwriting it.
>
> Reported-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7a2ba6b7b66340cff225
> Tested-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com
> Fixes: 4342306f0f0d5 ("fs/ntfs3: Add file operations and implementation")
> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
> ---
>
> v1:
> https://lore.kernel.org/all/20250925203701.223744-2-rpthibeault@gmail.com/
> Differences from v1:
> In the previous version, I thought that mi_read() returning an error was
> a genuine reason to stop trying to format the record. That was wrong. If
> we find that mi_read() fails and that therefore we cannot reuse an old
> record, we should try to make a new one. It then follows that
> ntfs_get_bh() should provide an uptodate bh for the new record.
>
> On testing:
> I could not get xfstests-bld to work for ntfs3. Config nightmare. So I
> first tested with the syzkaller repro, then tested for regressions manually
> with a program that called all the syscall code paths touched by my change:
> mkdir, fallocate (FALLOC_FL_COLLAPSE_RANGE), and
> fallocate (FALLOC_FL_INSERT_RANGE).
>
>   fs/ntfs3/fsntfs.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 938d351ebac7..0c07502fdb0f 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -1373,7 +1373,14 @@ int ntfs_get_bh(struct ntfs_sb_info *sbi, const struct runs_tree *run, u64 vbo,
>   				}
>   				if (buffer_locked(bh))
>   					__wait_on_buffer(bh);
> -				set_buffer_uptodate(bh);
> +
> +				lock_buffer(bh);
> +				if (!buffer_uptodate(bh))
> +				{
> +					memset(bh->b_data, 0, blocksize);
> +					set_buffer_uptodate(bh);
> +				}
> +				unlock_buffer(bh);
>   			} else {
>   				bh = ntfs_bread(sb, block);
>   				if (!bh) {

Applied to my tree, thanks for the patch.

Regards,
Konstantin

