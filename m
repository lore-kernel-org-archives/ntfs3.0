Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA53193
	for <ntfs3@lists.linux.dev>; Mon,  8 May 2023 12:48:57 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5D78421BF;
	Mon,  8 May 2023 12:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683549848;
	bh=y2C/94w1WUVaMLXfX+t2ydYB2jtU9ZHRgmlzLfkeLyU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sl7UnSoYORFDA7W9lWqzzZB8J6cAnRlNMBQIV63S/xtBc7yM/ayixz2BTDatYs/2Z
	 Zc+uhkKd2xU2MtE+ylwC0SfNUR1fST1Knm3DNl4ugURKKv3j7LRHEBPK+2HpRvq/sj
	 SOXK6mVQAYhRPWKxjEpnD0MCZr5swrt3QY7LQe+Q=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0D5F42192;
	Mon,  8 May 2023 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683550135;
	bh=y2C/94w1WUVaMLXfX+t2ydYB2jtU9ZHRgmlzLfkeLyU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mQdlVfum8/yiOX/EETRv/R8QJU8vn7hHs21JXD0oFWfH/DWW0IOHS+/IggPfOJYGY
	 p2x77s1s46TtyaNrOFyrELv0zIG8kYTIHplfm5tSy1zDZnA3boUXgUft49/kMw4qRT
	 l9qD6zS0WeUETgiA8DBoM+CmNI6YvmoBJFcQA9mk=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 8 May 2023 15:48:54 +0300
Message-ID: <e7c48f38-95bd-e7c6-8fb5-9fa3e85e57bc@paragon-software.com>
Date: Mon, 8 May 2023 16:48:53 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] fs/ntfs3: Use __GFP_NOWARN allocation at
 ntfs_load_attr_list()
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, <ntfs3@lists.linux.dev>
References: <00000000000027524405f1452ea8@google.com>
 <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 02.01.2023 18:53, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at ntfs_load_attr_list() [1], for
> a crafted filesystem can have huge data_size.
>
> Link: https://syzkaller.appspot.com/bug?extid=89dbb3a789a5b9711793 [1]
> Reported-by: syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>   fs/ntfs3/attrlist.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
> index c0c6bcbc8c05..81c22df27c72 100644
> --- a/fs/ntfs3/attrlist.c
> +++ b/fs/ntfs3/attrlist.c
> @@ -52,7 +52,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
>   
>   	if (!attr->non_res) {
>   		lsize = le32_to_cpu(attr->res.data_size);
> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
>   		if (!le) {
>   			err = -ENOMEM;
>   			goto out;
> @@ -80,7 +80,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
>   		if (err < 0)
>   			goto out;
>   
> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
>   		if (!le) {
>   			err = -ENOMEM;
>   			goto out;

I apologize for the delayed response.

Thanks, your patch has been applied.

