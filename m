Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.245.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630474;
	b=L5cSO+WrvOXlPKjlgDtl0YfapvDq9gWm3ZtQUUuh+b2uttnmGvcxC/FXs4CbFlJeQRdW
	 r2liszz5h1a+1IwVV3trUlOdSsekxhLt+iirCT0CNp02a4vtf8r7Q6/yYP0ZV3rf7kedr
	 2Dgxo2i0zy7PNLqK0JQ4j4T7Jb52gNqDh1xBTt5lwwUJhOCY5uf3FOH61Dpl8SuBkAVi1
	 rRAF7UDA0pos1QpHl7wnx8bsw7bPRmmg0ybIF2WRVHioVqR81MTACquCMQumNnyc3Xvs6
	 h1NEH2r+f127YWFF1pz7ZMneYAqZdEYSD1w4mmzfgVOuenw9ryKaleEwLOVlE9cz6PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630474;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OMjVTvjZtZrTjrcI72ExCzD1i9afB7DwzHLxEXPZD7Y=;
	b=aRzJizfo3plm3A6pIVUhHUgzHt0UURtXBDz2+QazZFd6rtPjAxk46dAuMNvn406d3fdd
	 yvBmz3nx1S+vc++opmVyg9nKIqkHxhTSe//sXkS22GamKtOS+bx0qE3gc2S3XNRKJI+ML
	 AQgqR48NMZ/kr7tuWk+XDWqKfPol8C4ealefPeooOAlCi7eH3wwvTmIG3+luKhEPGvseX
	 9dDdlY8hl9QTQc+wcB5qk4fwwKBr9KB0croMlopy+I2VxFukpdp7GEJMV0voHAgjwp5OM
	 eRxSG7q/bk0eqy3mgy+TCfCLKZdagTNut0mSTr49aT7LB7w+A8ePxExvaibcuPI3GXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=strlen.de;
	spf=pass smtp.mailfrom=strlen.de;
	arc=none smtp.remote-ip=91.216.245.30
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1E607BDEC
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 14:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD1E607BDEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id B65DD60342; Mon, 02 Nov 2026 15:41:04 +0100 (CET)
Date: Mon, 2 Nov 2026 15:41:03 +0100
From: Florian Westphal <fw@strlen.de>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>,
	Chris Mason <mason@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>,
	Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>,
	Joel Granados <joel.granados@kernel.org>,
	Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>,
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, ntfs3@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
	kexec@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ibm-acpi-devel@lists.sourceforge.net,
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-mm@kvack.org, linux-sh@vger.kernel.org,
	linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
	sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-doc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org,
	Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH RFC 03/38] netfilter: xt_recent: don't remove the proc
 entries under a spinlock
Message-ID: <auig_zhd3L0HEis3@strlen.de>
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org>
 <20261102-work-procfs-bugfixes-v1-3-59422ed3e465@kernel.org>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-work-procfs-bugfixes-v1-3-59422ed3e465@kernel.org>

Christian Brauner <brauner@kernel.org> wrote:
> recent_proc_net_exit() removes the proc entries of all tables with
> recent_lock held. remove_proc_entry() waits until nobody calls into the
> entry anymore, and reading one of them takes recent_lock in
> recent_seq_start() while procfs has the entry pinned. So when a reader
> gets there while the network namespace goes away, the exit path sleeps
> with a spinlock held and bh disabled, waiting for a reader that spins
> on that very lock:

Yes, but note that this change is already part of a pending nf -> net
merge request.
