Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FD820F3
	for <ntfs3@lists.linux.dev>; Mon, 26 Dec 2022 15:32:58 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 066941B7;
	Mon, 26 Dec 2022 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1672068563;
	bh=WT35hMT9jxm/IKBWPqha2GgcIHPteMyxzD8d33LTOfg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ank7OaIWU+Nt6zYsbdvQ7WhrLjhQkfxE48OhiX1xNQt0vwJATLuvbxwHgLRqZihKf
	 Uos3vniVdQc9dLyH+tCN15pm4+xMz0APXAmNTXFbuPcP3rkyb9nNoxoJI5NSbRqY80
	 1TrbWKeUciT/ThC2RyrAfPWu9H44E7JbyH4dSsas=
Received: from [192.168.211.153] (192.168.211.153) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 26 Dec 2022 18:32:51 +0300
Message-ID: <ee0d2ffb-d563-f823-967e-1869126d636a@paragon-software.com>
Date: Mon, 26 Dec 2022 19:32:50 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] fs/ntfs3: Validate attribute data and valid sizes
Content-Language: en-US
To: Abdun Nihaal <abdun.nihaal@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<skhan@linuxfoundation.org>,
	<linux-kernel-mentees@lists.linuxfoundation.org>,
	<syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com>
References: <20221114115314.183818-1-abdun.nihaal@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20221114115314.183818-1-abdun.nihaal@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.153]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 14.11.2022 15:53, Abdun Nihaal wrote:
> The data_size and valid_size fields of non resident attributes should be
> less than the its alloc_size field, but this is not checked in
> ntfs_read_mft function.
>
> Syzbot reports a allocation order warning due to a large unchecked value
> of data_size getting assigned to inode->i_size which is then passed to
> kcalloc.
>
> Add sanity check for ensuring that the data_size and valid_size fields
> are not larger than alloc_size field.
>
> Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
> Reported-and-tested-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
>
> Please apply this instead of my previous patch.
>
> Changes in v2:
>   Correct the format used for the Fixes tag.
>
>   fs/ntfs3/inode.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 970bb7c357c7..763dd982a43a 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -132,6 +132,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
>   	if (le16_to_cpu(attr->name_off) + attr->name_len > asize)
>   		goto out;
>   
> +	if (attr->non_res) {
> +		t64 = le64_to_cpu(attr->nres.alloc_size);
> +		if (le64_to_cpu(attr->nres.data_size) > t64 ||
> +		    le64_to_cpu(attr->nres.valid_size) > t64)
> +			goto out;
> +	}
> +
>   	switch (attr->type) {
>   	case ATTR_STD:
>   		if (attr->non_res ||
Hello. Your patch has been already applied.
