Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A21FA8
	for <ntfs3@lists.linux.dev>; Fri, 30 Dec 2022 07:17:22 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 1E6D0439;
	Fri, 30 Dec 2022 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1672384422;
	bh=Nc/tI0OEKN91jndqGsVsCKucExM7cJrY6OW6bUqxtNU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QD4YJCeLGtlfT5I4lQMzLy84Jfvc6IL9gwrLnab+VvqWbHosu/SiRDBmdn/IrkmlH
	 B3mrHziIh7fX/GIrAjn5dXMtiyXDS4WXdrSXKhypg3wWteATYERlom71VA2m5KcWNr
	 f/ltdxvdxUPoHU3j15XEcp5uYQYCNX4sN9MGyhrU=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Dec 2022 10:17:14 +0300
Message-ID: <db403920-d3ef-8fc6-959f-46edd314a989@paragon-software.com>
Date: Fri, 30 Dec 2022 11:17:13 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] fs/ntfs3: Fix slab-out-of-bounds read in hdr_delete_de()
Content-Language: en-US
To: Zeng Heng <zengheng4@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<xiexiuqi@huawei.com>, <liwei391@huawei.com>
References: <20221212013134.2133231-1-zengheng4@huawei.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20221212013134.2133231-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 12.12.2022 05:31, Zeng Heng wrote:
> Here is a BUG report from syzbot:
>
> BUG: KASAN: slab-out-of-bounds in hdr_delete_de+0xe0/0x150 fs/ntfs3/index.c:806
> Read of size 16842960 at addr ffff888079cc0600 by task syz-executor934/3631
>
> Call Trace:
>   memmove+0x25/0x60 mm/kasan/shadow.c:54
>   hdr_delete_de+0xe0/0x150 fs/ntfs3/index.c:806
>   indx_delete_entry+0x74f/0x3670 fs/ntfs3/index.c:2193
>   ni_remove_name+0x27a/0x980 fs/ntfs3/frecord.c:2910
>   ntfs_unlink_inode+0x3d4/0x720 fs/ntfs3/inode.c:1712
>   ntfs_rename+0x41a/0xcb0 fs/ntfs3/namei.c:276
>
> Before using the meta-data in struct INDEX_HDR, we need to
> check index header valid or not. Otherwise, the corruptedi
> (or malicious) fs image can cause out-of-bounds access which
> could make kernel panic.
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Reported-by: syzbot+9c2811fd56591639ff5f@syzkaller.appspotmail.com
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   fs/ntfs3/fslog.c   | 2 +-
>   fs/ntfs3/index.c   | 4 ++++
>   fs/ntfs3/ntfs_fs.h | 1 +
>   3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 0d611a6c5511..0de2bbb42721 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2597,7 +2597,7 @@ static int read_next_log_rec(struct ntfs_log *log, struct lcb *lcb, u64 *lsn)
>   	return find_log_rec(log, *lsn, lcb);
>   }
>   
> -static inline bool check_index_header(const struct INDEX_HDR *hdr, size_t bytes)
> +bool check_index_header(const struct INDEX_HDR *hdr, size_t bytes)
>   {
>   	__le16 mask;
>   	u32 min_de, de_off, used, total;
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 440328147e7e..6f5d8dd6659d 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -798,6 +798,10 @@ static inline struct NTFS_DE *hdr_delete_de(struct INDEX_HDR *hdr,
>   	u32 off = PtrOffset(hdr, re);
>   	int bytes = used - (off + esize);
>   
> +	/* check INDEX_HDR valid before using INDEX_HDR */
> +	if (!check_index_header(hdr, le32_to_cpu(hdr->total)))
> +		return NULL;
> +
>   	if (off >= used || esize < sizeof(struct NTFS_DE) ||
>   	    bytes < sizeof(struct NTFS_DE))
>   		return NULL;
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index 2c791222c4e2..c5c022fef4e0 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -574,6 +574,7 @@ int ni_rename(struct ntfs_inode *dir_ni, struct ntfs_inode *new_dir_ni,
>   bool ni_is_dirty(struct inode *inode);
>   
>   /* Globals from fslog.c */
> +bool check_index_header(const struct INDEX_HDR *hdr, size_t bytes);
>   int log_replay(struct ntfs_inode *ni, bool *initialized);
>   
>   /* Globals from fsntfs.c */
Thanks for patch, applied!
