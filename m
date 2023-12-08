Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E248366
	for <ntfs3@lists.linux.dev>; Fri,  8 Dec 2023 00:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qsvGsWdR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0dMr3UkO/xZ14hLIkPHKwGl9vSnEwn8/Nn738r3Lcgo=; b=qsvGsWdRMG1IFVegIsanG0fYJO
	/SQY4qU3xmZIbFEXhrl3Btn9cqxxrP+HdKEDSQmMyMsAvMj4iJDSkE+KF2HTt1X2RcZHezwu9C8q8
	C3K9psZNYFrD3Qbqwv4Ymd+XtztubvEYmxPIiZ4mvvqZb8Kas+0GmxwbVthEC8kJMM4YnDuNe6zm0
	tt9iSTEoAH4Taqtb8ubeB7ZmNFV47wZaFVLiVjFF6+oEUHgB8W7emCI6nYTyGpmnb42KjB6KITTzK
	Br5AlfG43qTLE0rSPikQrbxcpXJj/Fbmm/KzBBhBepb74VjWCD4YW3UKLX84YNo+eIB9RIrqLKDNn
	OvXqdUBA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOrv-00ELI9-0l;
	Fri, 08 Dec 2023 00:37:28 +0000
Message-ID: <926cddcc-2604-4d88-b9c9-91ad1d148c6c@infradead.org>
Date: Thu, 7 Dec 2023 16:37:26 -0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: align struct ATTR_LIST_ENTRY
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231207142838.960725-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231207142838.960725-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/7/23 06:28, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On architectures like i386 that don't enforce natural alignment of u64
> struct members, so the recent change to remove the final 48 bits
> reduced the structure size from 32 to 28 bytes:
> 
> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct ATTR_LIST_ENTRY) == 0x20"
> fs/ntfs3/ntfs.h:530:1: note: in expansion of macro 'static_assert'
>   530 | static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
>       | ^~~~~~~~~~~~~
> 
> Add an alignment attribute that makes the structure the same across
> all architectures again.
> 
> Fixes: d155617006eb ("fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  fs/ntfs3/ntfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
> index c8981429c721..2d409ac94cbb 100644
> --- a/fs/ntfs3/ntfs.h
> +++ b/fs/ntfs3/ntfs.h
> @@ -525,7 +525,7 @@ struct ATTR_LIST_ENTRY {
>  	__le16 id;		// 0x18: struct ATTRIB ID.
>  	__le16 name[];		// 0x1A: To get real name use name_off.
>  
> -}; // sizeof(0x20)
> +} __aligned((8)); // sizeof(0x20)
>  
>  static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
>  

-- 
~Randy
