Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92072C9D
	for <ntfs3@lists.linux.dev>; Thu, 13 Jan 2022 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
	s=42; h=Message-ID:Cc:To:From:Date;
	bh=nj5k3mlsUDDGuLxVB3qEkpQFS6rGFoeOraW+MaiB/Xo=; b=gBSu931hJouc0xwpLTHSdQgfFc
	2Uf3gAhZOCeTpcRU4tAg5rAp1APUp8FiLsMFus94HYwJG14n3Jh151WGaKmJ3P+cshZ4k3GZQBCRK
	hFmcTI4qMRoeUrdlGtPeF2U0DqRW/g0aPINmwSlHPbhXhneo6rfntXcGU313ITFsWDW2hRZ083c5R
	MqL4joDYnmkh8Teg4NSCmhd9Cvp+PDXVLm89lh7zrg0G7fLSjUWSW6hVw5uohPUAFfrDsKMUbd+CQ
	5q0mRSHmZsTp2bV8+UzXAUS8NRBaxIagoDhZ50huS8sxoR7uhVPqQczFZafIGZHFgrJAlVVQeg0Ae
	Rt/uXjyXj65Mv7ZpZNGccO8PkIUi5vY/tJVOpe7hLd99EneFehypO/FSXWI+h6ivwWo2IlQZHVvEK
	ERGc9exCYndN0oauBfMpUmBfE2gS4H3F5mH9qB3hibrLV2PJzD/yhF9wtu8mO1Nt1Unbo88zSW3ay
	BdUwcybj4QhvblLGZOwWxFap;
Received: from [127.0.0.2] (localhost [127.0.0.1])
	by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
	(Exim)
	id 1n7tda-0073Lw-Ji; Thu, 13 Jan 2022 06:31:07 +0000
Date: Wed, 12 Jan 2022 22:30:57 -0800
From: Jeremy Allison <jra@samba.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	richard.sharpe@primarydata.com,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	lance.shelton@hammerspace.com,
	Anna Schumaker <Anna.Schumaker@netapp.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux API <linux-api@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, ntfs3@lists.linux.dev,
	Steve French <sfrench@samba.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Ralph Boehme <slow@samba.org>
Subject: Re: [bug report] NFS: Support statx_get and statx_set ioctls
Message-ID: <Yd/HIYsCBPH5jPmS@jeremy-acer>
Reply-To: Jeremy Allison <jra@samba.org>
References: <20220111074309.GA12918@kili>
 <Yd1ETmx/HCigOrzl@infradead.org>
 <CAOQ4uxg9V4Jsg3jRPnsk2AN7gPrNY8jRAc87tLvGW+TqH9OU-A@mail.gmail.com>
 <20220112174301.GB19154@magnolia>
 <CAOQ4uxh7wpxx2H6Vpm26OdigXbWCCLO1xbFapupvLCn8xOiL=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAOQ4uxh7wpxx2H6Vpm26OdigXbWCCLO1xbFapupvLCn8xOiL=w@mail.gmail.com>

On Thu, Jan 13, 2022 at 05:52:40AM +0200, Amir Goldstein wrote:
>
>To add one more terminology to the mix - when Samba needed to cope
>with these two terminologies they came up with itime for "instantiation time"
>(one may also consider it "immutable time").

No, that's not what itime is. It's used as the basis
for the fileid return as MacOSX clients insist on no-reuse
of inode numbers when a file is deleted then re-created,
and ext4 will re-use the same inode.

Samba uses btime for "birth time", and will use statx
to get it from the filesystem but then store it in
the dos.attribute EA so it can be modified if the
client sets it.
