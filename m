Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707335;
	b=Sv8rnq71240EI/UrWJBdKq0TtkleqlBXD+gqw6TBePyHlbB/PixbYf9SbF0wjTqfecrF
	 Fk/8hjIVq6VX5xQsFn0o7Q5YVdlYtva/cW7NPgFF8Gzby27SUfe9k0P8sBCu44urwbvy9
	 cEGWVyeyLDWSBc+8iTHI1DjOY3yHjvLHg6Z2OvW4+8zN6yZiATTOoomBjYSTk2ZTa8EQL
	 Sgg4VvnwW+Hrkua48nJ+Y7lxKrTuBfaX2jF0P3cN0OndEA/4qCD8BIQ/tCzFv3X/9qAE2
	 Mq2f2ZsMvySViipDxV3WaZehftOFhLwwUpsy5iWh1Eq5VZDHwGHnoroIwPqLuLuHUQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707335;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=kdF7OwDmtb5Db3bRFDZ54dVkDzCQ2Q82JGknG1Npy3A=;
	b=Iheva5xgPJi5BpWkVZz6Pr+yEbZSMytk3jOHNrYNyt9l4WXeu/AzOWXh9KDRvrY+8dBd
	 9KmRw9WkxIwESGGmCpfSzJbiVhgbc01dCKAeQQdh3MQlVKOtvDrp32JUAE26YzjP3hDVT
	 eBYXlQsOD5nmI4xwLjvX+hd3e/jsijle/by+/X3ga2QLTItyOvVC/4agUPDBTht1HbFcN
	 mbllZu6WD06TtxCj54DA3jkFjtJ2zddVTO7gyJUowWawwiZvlVYhumq+F1bBwFvTETkdW
	 fSHmTFyNHPybY0G6rIqDMgZDeassyqMRH17SjjfVegsLohikMeIvNrcK+GftRJ5dGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=IWvBFtSN;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C88D606A33D
	for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 15:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C88D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=IWvBFtSN
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 309F31D38;
	Thu, 26 Nov 2026 15:36:14 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=IWvBFtSN;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 569892092;
	Thu, 26 Nov 2026 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795707332;
	bh=kdF7OwDmtb5Db3bRFDZ54dVkDzCQ2Q82JGknG1Npy3A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IWvBFtSNEUSV/fM3UG9eXpmF9zw+JcpeJwrizGpUqAZulf7tT7nwrtikpq3cSJqQw
	 kX5uFVybDKHLNeuoDocGMycDXdGuQPhzzprqwQgtSIwkvDsuHqi/IYMCXbWoABv0UT
	 op13RYRuB9D97l4wTwzYQ9BjaeNQuBPEq7dWrM5Y=
Received: from [192.168.95.128] (172.30.20.193) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 26 Nov 2026 18:35:31 +0300
Message-ID: <26e97827-8544-459a-94c0-cb53f76bd0fd@paragon-software.com>
Date: Thu, 26 Nov 2026 16:35:30 +0100
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
Subject: Re: [PATCH ntfs] fs/ntfs3: fix out-of-bounds write in UpdateFileName
 replay
To: Xue Boyang <fuchen.dust@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260929090452.224281-1-fuchen.dust@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260929090452.224281-1-fuchen.dust@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/29/26 11:04, Xue Boyang wrote:

> During $LogFile replay, do_action()'s UpdateFileNameRoot and
> UpdateFileNameAllocation cases write sizeof(NTFS_DUP_INFO) = 0x38 bytes
> into the ATTR_FILE_NAME structure that follows the target index entry:
>
>          e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>          fname = (struct ATTR_FILE_NAME *)(e + 1);
>          memmove(&fname->dup, data, sizeof(fname->dup));
>
> The gates that run before the write (check_if_index_root and
> check_if_root_index) only validate that the record and entry offsets
> land on boundaries.  Neither checks that the entry's key_size is large
> enough to hold a struct ATTR_FILE_NAME, whose minimum size is
> SIZEOF_ATTRIBUTE_FILENAME (0x44).  de_get_fname() applies exactly this
> check at every other call site; the replay path omits it.
>
> With a crafted $LogFile whose UpdateFileNameRoot record points at a
> 16-byte entry with key_size = 0 placed at the end of a crafted $I30
> INDEX_ROOT, the write lands past the end of the kmalloc(record_size)
> MFT record allocation:
>
>    BUG: KASAN: slab-out-of-bounds in do_action+0x14af/0x1d35
>    Write of size 56 at addr ffff888004046be8 by task mount/71
>     ...
>     __asan_memmove+0x3c/0x60
>     do_action+0x14af/0x1d35
>     log_replay (fs/ntfs3/fslog.c)
>     ntfs_loadlog_and_replay+0x2cb/0x300
>     ntfs_fill_super+0x1375/0x22d0
>     ...
>
> The write content is fully attacker-controlled (redo data from the log
> record) and the trigger is deterministic on every rw mount, no race.
>
> Reject the operation when key_size is below SIZEOF_ATTRIBUTE_FILENAME
> in both cases, matching de_get_fname().
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS3 filesystem")
> Assisted-by: GLM:zhipu-coding-plan/glm-5.3
> Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
> ---
>   fs/ntfs3/fslog.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 498f63da2b96..ba61767cab3f 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3557,8 +3557,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  }
>
>                  e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
> +               if (le16_to_cpu(e->key_size) < SIZEOF_ATTRIBUTE_FILENAME)
> +                       goto dirty_vol;
>                  fname = (struct ATTR_FILE_NAME *)(e + 1);
> -               memmove(&fname->dup, data, sizeof(fname->dup)); //
> +               memmove(&fname->dup, data, sizeof(fname->dup));
>                  mi->dirty = true;
>                  break;
>
> @@ -3742,6 +3744,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                          goto dirty_vol;
>                  }
>
> +               if (le16_to_cpu(e->key_size) < SIZEOF_ATTRIBUTE_FILENAME)
> +                       goto dirty_vol;
>                  fname = (struct ATTR_FILE_NAME *)(e + 1);
>                  memmove(&fname->dup, data, sizeof(fname->dup));
>
> --
> 2.53.0

Hello,

Thanks for the patch. Yunpeng Tian already addressed the same issue in
commit be477eb99013 (“fs/ntfs3: require a FILE_NAME key before the UpdateFileName* replay copy”).

Regards,
Konstantin

