Received: from mail.alarsen.net (mail.alarsen.net [144.76.18.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAC3A8FE1
	for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.18.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485764; cv=none; b=XQbrv3nyo7a+qBbxWiOMlxkdufbIJT1TPgP2/TM4Ypt/1Fac+uT6TBbnXGAzbKvi7AWtA6E0f0Ha6v+LUKYHvkId5bfYVaiJhTzRESfsOMD8oalFMl8M9a2f4yI/M3JqoVRn1P/RzkhNi7kys4SVB20gAWCsfG1hv9cEydJuP1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485764; c=relaxed/simple;
	bh=RJklagVOb01rdp6xmcQNCN1hMtp3NVfyHk5jSrEWMHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBl9OFKCQDByU8Sq72+vimXb99b9BIqiVD/jiyS1vNt/IkuqriSOvqUsJg2kIroax/PAeGyXJYsVA5mAQu70Tj5FOW7JyCr3aIvfEAaVCBeAq8omQAYXCKbpIeF71aJ4KJN7JqyloORtyJ+8pZWKgdfJTnATe+Ua1JkLukffkpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alarsen.net; spf=pass smtp.mailfrom=alarsen.net; dkim=pass (2048-bit key) header.d=alarsen.net header.i=@alarsen.net header.b=Cxe6v7yb; arc=none smtp.client-ip=144.76.18.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alarsen.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alarsen.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alarsen.net header.i=@alarsen.net header.b="Cxe6v7yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alarsen.net; s=joe;
	t=1778485369; bh=aVWz5H2wKxVX7vJW+AJpzWM7hyjI7IFWMJIAyMyWz+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cxe6v7yb6CvZryvKsQF54hnFqeySE7moiO1FHzfzlThSAjtBKh39fKa47XsB5jcev
	 PgS6+WigEvTY9f1yCo/rWJ85GlkE9chejMve/FwhpoHohkhIx/+DVw46w1nQZfvdtx
	 DbBMalQd2ejdsQ7R9PxgD7f2+2iXz+dkPwH7I5vHsI9wPb/Zp8QP1KD1v2hL+Fj1H5
	 7aE1pziMfU7Ya3z1CZAgSYX2ahErIaNqz4XS3hQpeoQssMeC1FXehcpf1CjBrz9UBC
	 F8zh2CD0rAvXV+xITlc20aZ2/4rPifos/SzApJLxbSdDxDtoa6JkiBdwpLEM2uCIyV
	 UXNkU/oyLHT/w==
Received: from oscar.alarsen.net (unknown [IPv6:fd8b:531:bccf:96:13c6:f483:161f:2523])
	by joe.alarsen.net (Postfix) with ESMTPS id B0769180593;
	Mon, 11 May 2026 09:42:49 +0200 (CEST)
Received: from oscar.localnet (localhost [IPv6:::1])
	by oscar.alarsen.net (Postfix) with ESMTP id A34DE6DA;
	Mon, 11 May 2026 09:42:49 +0200 (CEST)
From: Anders Larsen <al@alarsen.net>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.cz>, David Sterba <dsterba@suse.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Dave Kleikamp <shaggy@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Bob Copeland <me@bobcopeland.com>, linux-fsdevel@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net
Subject: Re: [PATCH 03/10] qnx4: handle set_blocksize failures
Date: Mon, 11 May 2026 09:42:49 +0200
Message-ID: <12893675.O9o76ZdvQC@oscar>
In-Reply-To: <20260511071701.2456211-4-hch@lst.de>
References:
 <20260511071701.2456211-1-hch@lst.de> <20260511071701.2456211-4-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

On 2026-05-11 09:16 Christoph Hellwig wrote:
> qnx4 uses buffer_heads, which don't handle block size > PAGE_SIZE well.

qnx4fs uses a fixed block size of 512 bytes, so this will never happen.

> -	sb_set_blocksize(s, QNX4_BLOCK_SIZE);
> +	if (!sb_set_blocksize(s, QNX4_BLOCK_SIZE))
> +		return -EINVAL;

QNX4_BLOCK_SIZE is a constant (512)...

Cheers
Anders


