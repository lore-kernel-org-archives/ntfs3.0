Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041833C7
	for <ntfs3@lists.linux.dev>; Tue,  5 Jul 2022 13:31:21 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D0F441E39;
	Tue,  5 Jul 2022 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1657027812;
	bh=tXgr5Hqp5H2iD+PQI9Vm2wRIGpuc9+y5lPyxRPwiv3E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oIlS1TPq5mkYb/ry3WG2OWTjFuwDFF7PnOnL526QB0ntSaonh78C64JwWRwjof4dv
	 ZAxNToo1e/t+4qL6ophbeOnGKfvxTkeeH71DlLb2QeWu9aH+jPy/A/55XOzgG5WC9s
	 NNOfOH2O/lSdlecziXhMV0tJ3dg+Wh6TOVG+FcO0=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 5 Jul 2022 16:31:13 +0300
Message-ID: <2a329e2e-d00b-28c5-7ab9-d9ce8bb543d2@paragon-software.com>
Date: Tue, 5 Jul 2022 16:31:12 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fs/ntfs3: unlock on error in attr_insert_range()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>
References: <Yr2g4N+3Xf9X7Hgn@kili>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <Yr2g4N+3Xf9X7Hgn@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/30/22 16:10, Dan Carpenter wrote:
> This error path needs to call up_write(&ni->file.run_lock) and do some
> other clean up before returning.
> 
> Fixes: aa30eccb24e5 ("fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This patch is based on static analysis.  I'm pretty sure that unlocking
> is the correct thing and, of course, I try to not send patches that
> introduce bugs.  But it's untested and needs to be reviewed extra
> carefully.
> 
>   fs/ntfs3/attrib.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index 86e688b95ad5..3e9aefcb3e6c 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -2153,8 +2153,10 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
>   		le_b = NULL;
>   		attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL,
>   				      &mi_b);
> -		if (!attr_b)
> -			return -ENOENT;
> +		if (!attr_b) {
> +			err = -ENOENT;
> +			goto out;
> +		}
>   		if (!attr_b->non_res) {
>   			err = -EINVAL;
>   			goto out;

Applied, thanks!
