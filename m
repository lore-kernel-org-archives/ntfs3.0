Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640172;
	b=skeG7PD4Eh9Hogp+jZZ0c427nI86n4Yml5595uGxPeanUFwZV2a1RUrpwgNgFS5VaPCP
	 aUnqv2X5p94DKEoZDhD7MPoiRUA9Rj98c6mCqGcG6PJLnCvEKulzCyTtl/NBjldsTyaKh
	 SwjvuHW3m4ueTFsnYJv3Dx8p0+PyflzMNmu7bG36apaapHFwHfGtDBAAGX4FmwssJiMvF
	 3JBb4m7v/+CArX/TrPIxwAgyS91uYUGuOOXMv/4zB2iCyAOpCMhjobm5CgAFsvZsVksin
	 QuoP2XMebHV1NlQJCcG/LKY5AqmWlccaXAdJfykzWlry1iZUxr7Twheyv00HsAy2ncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640172;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Status:X-Spam-Checker-Version;
	bh=GemoAJ3Z9yvwRRBlFGwLRVr4LorqE6trrN/CR7hKuuw=;
	b=P6JNZSJxCguo8cerT7MsSPXmrucBl9S9rl90X/YbQBjpspvK8CKvCK60Qzt10Z6FQM+V
	 MF38Drb+Cr2BxYGm8dw8RU6aGXaqe76NVuclPkmYBty/iUajZtexEOhZeJgTJ4ubSE++r
	 1Wh24V4PYy8q2fb4xvm/MpYSpcbarlujE/Rw+N1tsi0DD8aJ8Iqut3Sqcqw0iSgzm8gIG
	 ooiqzDZi5q2/u96mfmLSs+w9JrH0CXUrT4mNc5CWJ6jjLOYXZ1IHId1yknS6x5ARuoPSI
	 xvREnVZzSc0wtTwRbFN+QFxV+ZQjlsRlKGbsRBMCrRFQIbdn7FWXFp3Znb/wsbDOJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	dkim=pass header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=r3Ai1HxN;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61F8606B0E7;
	Mon,  2 Nov 2026 17:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61F8606B0E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=r3Ai1HxN
Received: from CPC-namja-026ON.localdomain (unknown [4.213.232.21])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6A3FA20B7167;
	Mon,  2 Nov 2026 09:22:33 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6A3FA20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793640157;
	bh=GemoAJ3Z9yvwRRBlFGwLRVr4LorqE6trrN/CR7hKuuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3Ai1HxNbWb3kZc4YpHHnwyB78qJED3cJGIzV/bToDtYwEpr98VNzVmUp9+1kiLWk
	 dZcZ1liJefSKJgjTKMNKZvng1Jrqiw+a/ND3e5GT88xYQf+jjuLbmRWiC7/acABq6w
	 q4+yOeght4ytzHjxfCRDYA3BTCwYDa3KhniGNwvk=
From: Naman Jain <namjain@linux.microsoft.com>
To: elliotjb@elliotjb.com
Cc: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	sashal@kernel.org,
	willy@infradead.org,
	almaz.alexandrovich@paragon-software.com,
	gregkh@linuxfoundation.org,
	jack@suse.cz,
	sunyongjian1@huawei.com,
	tomberek@gmail.com,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH 6.1.y 0/2] Fix NULL folio dereferences from IS_ERR() checks in 6.1.191
Date: Mon,  2 Nov 2026 17:22:43 +0000
Message-ID: <20261102172243.2183638-1-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102-ext4-ntfs3-null-folio-v1-0-4fd91ee23a4a@elliotjb.com>
References: <20261102-ext4-ntfs3-null-folio-v1-0-4fd91ee23a4a@elliotjb.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Elliot Berman <elliotjb@elliotjb.com>
>
> We hit a kernel oops in 6.1.191 in ext4_mb_regular_allocator(), When
> ext4's s_buddy_cache pages are evicted, the next block allocation
> dereferences a NULL folio.
> The cause is a mismatch in these backports first released in 6.1.191:
>     d34e4fd4e73f ("ext4: convert bd_bitmap_page to bd_bitmap_folio")
>     862483175d3d ("ext4: convert bd_buddy_page to bd_buddy_folio")
>
> The ext4 mballoc folio conversions were written for v6.4 and later,
> where __filemap_get_folio() returns ERR_PTR() on failure. 6.1 does
> not have commit 66dabbb65d67 ("mm: return an ERR_PTR from
> __filemap_get_folio") and returns NULL instead. The backports should
> check for NULL and not IS_ERR.
> Since the same mistake could exist elsewhere, I ran a Coccinelle script
> over the tree to flag similar missed backports. Besides ext4, I found
> one more case in ntfs3:
>     95b917a14b15 ("ntfs: Do not overwrite uptodate pages")
>
> That one needs a folio allocation failure while reading a compressed
> file, so it required crafting a fault injection in
> __filemap_add_folio to reproduce. I've fixed this one as well.

I actually sent a similar patch a little later to fix the same issue :)
We can now ignore that. For ntfs3, there is already a patch fixing the
same issue:

https://lore.kernel.org/all/20261029031815.2783998-1-cmllamas@google.com/

For the series:
Reviewed-by: Naman Jain <namjain@linux.microsoft.com>

Regards,
Naman Jain
