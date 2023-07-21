Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734627F00
	for <ntfs3@lists.linux.dev>; Fri, 21 Jul 2023 16:58:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A40A1F85D;
	Fri, 21 Jul 2023 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1689958675;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrzPZpSaVoCP+8io5V8tI2s+2rYCOJmgpsq/AAzzvLU=;
	b=a6XyrwyRPOPIclQGGRhE3+nHK266wKHylKFlALQTh3TNr774SOfrWsbqQUA5OLvqb6qQI5
	QidEdnySKeahGgyp3AZQzAzv+d8FD/6sUqPwlSQXpmIAJ9YT7gY65Kvj/NimyiLJyAwkny
	asbRyBKpDYeOHqG150VOb0Ce5/et8oE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1689958675;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrzPZpSaVoCP+8io5V8tI2s+2rYCOJmgpsq/AAzzvLU=;
	b=Ine59GKzWadncqG/Mt+WBG/0y6QCERy/YbB8FAQhLuOeDckVk6z37Lb6XWJea2hnSilt/C
	YaCXppdq38fHahAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59A1F134BA;
	Fri, 21 Jul 2023 16:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 64gDFRO5umQMUwAAMHmgww
	(envelope-from <dsterba@suse.cz>); Fri, 21 Jul 2023 16:57:55 +0000
Date: Fri, 21 Jul 2023 18:51:14 +0200
From: David Sterba <dsterba@suse.cz>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Sterba <dsterba@suse.com>, linux-fsdevel@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Theodore Tso <tytso@mit.edu>,
	Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH 3/7] affs: Convert data read and write to use folios
Message-ID: <20230721165114.GE20457@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20230713035512.4139457-1-willy@infradead.org>
 <20230713035512.4139457-4-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713035512.4139457-4-willy@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Thu, Jul 13, 2023 at 04:55:08AM +0100, Matthew Wilcox (Oracle) wrote:
> We still need to convert to/from folios in write_begin & write_end
> to fit the API, but this removes a lot of calls to old page-based
> functions, removing many hidden calls to compound_head().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: David Sterba <dsterba@suse.com>
