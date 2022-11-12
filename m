Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F529A8
	for <ntfs3@lists.linux.dev>; Sat, 12 Nov 2022 18:08:51 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9E6B41FE4;
	Sat, 12 Nov 2022 18:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1668276357;
	bh=0eU5DIuZQNFAd0uUKiYOkSr47k/jFP7E3uvjVV1kks4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V2N1wwSL5YwXp7WeI/9i3M37V4SqAkPo+YSlZv6gxdBniWANIaXCcs873m2EgN7KK
	 ruoR/P0C8b97mpP+f6S7rs0ZKhXURuB8YQGbHJ2tTefJoHYNJuXZPphuuHG97IZHZy
	 Yh/DwTDuOS+RZFbRPdeW6x9PgFCOrlmbNfZSovbk=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 67E4126;
	Sat, 12 Nov 2022 18:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1668276529;
	bh=0eU5DIuZQNFAd0uUKiYOkSr47k/jFP7E3uvjVV1kks4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H4qY9lx5HP5CpntyIdwFawKWrSohLbYqdnRuf4yGat6MjQJ9rTn2xMoyHGKqpI4g6
	 0Wccy5O5jR8xyaeu5lxlZLXDCf8GTjaeRpcXiE3gC3/uhwaAhqQz8f4UC/a5rW+se7
	 3JWLe5dyZq5EdY38h1zjSRpvGNZ2O4NyCsPfHMjc=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 12 Nov 2022 21:08:49 +0300
Message-ID: <f55632ad-1479-286c-45b3-a32525fcc27c@paragon-software.com>
Date: Sat, 12 Nov 2022 21:08:48 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ntfs3: use __GFP_NOWARN allocation at ntfs_fill_super()
Content-Language: en-US
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: syzbot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <ntfs3@lists.linux.dev>
References: <00000000000067a9d105ea0b6304@google.com>
 <2405d6f0-3b1a-6405-610f-fd2efab86bdd@I-love.SAKURA.ne.jp>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <2405d6f0-3b1a-6405-610f-fd2efab86bdd@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 10/2/22 17:54, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at ntfs_fill_super() [1], for a
> crafted filesystem can contain bogus inode->i_size. Add __GFP_NOWARN in
> order to avoid too large allocation warning, than exhausting memory by
> using kvmalloc().
> 
> Link: https://syzkaller.appspot.com/bug?extid=33f3faaa0c08744f7d40 [1]
> Reported-by: syzot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>   fs/ntfs3/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 47012c9bf505..374f6e4774fa 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1141,7 +1141,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>   		goto put_inode_out;
>   	}
>   	bytes = inode->i_size;
> -	sbi->def_table = t = kmalloc(bytes, GFP_NOFS);
> +	sbi->def_table = t = kmalloc(bytes, GFP_NOFS | __GFP_NOWARN);
>   	if (!t) {
>   		err = -ENOMEM;
>   		goto put_inode_out;

Applied, thanks again for patch!
