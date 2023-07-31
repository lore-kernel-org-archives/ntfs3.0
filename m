Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADF318C00
	for <ntfs3@lists.linux.dev>; Mon, 31 Jul 2023 14:44:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B6E41F74C;
	Mon, 31 Jul 2023 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1690814659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dwho/MXbKRpCcua51Z6iAvWEEmHSGnN+iX9Rx/4iTvQ=;
	b=0svLKFvtUSXdOMe4RMJpVPTb3f9Ry/fD5sEBlrbrD5YhzJQ6c2vjRQQZImP7VH7kaZ1MNS
	bJI5OjbDXBEf6HgQ6/qORvSFX3g5S4hA5UdvUBgjs60+svGjVVTKEntNQVBq5V2czHVJMo
	7S41KSIWnWyB7pxk4pdofRl8Knp+4Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1690814659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dwho/MXbKRpCcua51Z6iAvWEEmHSGnN+iX9Rx/4iTvQ=;
	b=7R1W4UVHwOh8+aMtjfABCnpQDlobxxPR/6Pq768T5Krbct0KHwUju7bRrrMOSpENSYBTv8
	OXytdgw8nabTm7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BCCD133F7;
	Mon, 31 Jul 2023 14:44:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OQNtFsPIx2S3XwAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 31 Jul 2023 14:44:19 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E4896A069C; Mon, 31 Jul 2023 16:44:18 +0200 (CEST)
Date: Mon, 31 Jul 2023 16:44:18 +0200
From: Jan Kara <jack@suse.cz>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Sterba <dsterba@suse.com>, linux-fsdevel@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Theodore Tso <tytso@mit.edu>,
	Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH 4/7] migrate: Use folio_set_bh() instead of set_bh_page()
Message-ID: <20230731144418.xksm5ieabi6licom@quack3>
References: <20230713035512.4139457-1-willy@infradead.org>
 <20230713035512.4139457-5-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713035512.4139457-5-willy@infradead.org>

On Thu 13-07-23 04:55:09, Matthew Wilcox (Oracle) wrote:
> This function was converted before folio_set_bh() existed.  Catch
> up to the new API.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index af8557d78549..1363053894ce 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -773,7 +773,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
>  
>  	bh = head;
>  	do {
> -		set_bh_page(bh, &dst->page, bh_offset(bh));
> +		folio_set_bh(bh, dst, bh_offset(bh));
>  		bh = bh->b_this_page;
>  	} while (bh != head);
>  
> -- 
> 2.39.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
