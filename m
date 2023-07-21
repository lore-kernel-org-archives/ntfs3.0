Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985327F00
	for <ntfs3@lists.linux.dev>; Fri, 21 Jul 2023 16:56:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E25EA218E3;
	Fri, 21 Jul 2023 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1689958602;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCHCmV+t244z1kZfQ0JSsPV8gh9gmYioeUKuDD/6rW0=;
	b=nvPP/TpGCryNzBPTDFdZ/0PBi6VfGbehe7S/1IKybjBNa1u+JASaasdqTqz5gQ6IohfTev
	7fAUBQVQtvz8l3xLHoiAjfAahltVLN2WN92fSNv6XBzTMOLc8tK6PG126Lc4MNCIvEa90x
	0Ty9Bz8URFLusa5fjnVYXh+IMZpjHaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1689958602;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FCHCmV+t244z1kZfQ0JSsPV8gh9gmYioeUKuDD/6rW0=;
	b=1NODJ6Tkjo1EtoPITbfZ61kMXqxJFlJqbg8upID14x/0D9KLASq5oIWF7z+zEJSd0Tfk2V
	wgPdpIX73CaDpPDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1B40134BA;
	Fri, 21 Jul 2023 16:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id LVKtJcq4umRfUgAAMHmgww
	(envelope-from <dsterba@suse.cz>); Fri, 21 Jul 2023 16:56:42 +0000
Date: Fri, 21 Jul 2023 18:50:01 +0200
From: David Sterba <dsterba@suse.cz>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Sterba <dsterba@suse.com>, linux-fsdevel@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Theodore Tso <tytso@mit.edu>,
	Jan Kara <jack@suse.com>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH 2/7] affs: Convert affs_symlink_read_folio() to use the
 folio
Message-ID: <20230721165001.GD20457@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20230713035512.4139457-1-willy@infradead.org>
 <20230713035512.4139457-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713035512.4139457-3-willy@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Thu, Jul 13, 2023 at 04:55:07AM +0100, Matthew Wilcox (Oracle) wrote:
> Remove use of the old page APIs.  That includes use of setting PageError
> on error; simply not setting the uptodate flag is sufficient.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: David Sterba <dsterba@suse.com>
