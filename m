Received: from smtprelay.hostedemail.com (smtprelay0025.hostedemail.com [216.40.44.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67253FC2
	for <ntfs3@lists.linux.dev>; Wed,  1 Sep 2021 04:36:13 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id D88101801273C
	for <ntfs3@lists.linux.dev>; Wed,  1 Sep 2021 02:41:07 +0000 (UTC)
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 2F702100E7B45;
	Wed,  1 Sep 2021 02:41:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 6A68B13D97;
	Wed,  1 Sep 2021 02:41:00 +0000 (UTC)
Message-ID: <5197939870d1867dd2131a8fdff8842b777c6016.camel@perches.com>
Subject: Re: [PATCH 1/5] fs/ntfs3: Use kmalloc_array over kmalloc with
 multiply
From: Joe Perches <joe@perches.com>
To: Kari Argillander <kari.argillander@gmail.com>, Konstantin Komarov
	 <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Date: Tue, 31 Aug 2021 19:40:58 -0700
In-Reply-To: <20210831181505.1074767-2-kari.argillander@gmail.com>
References: <20210831181505.1074767-1-kari.argillander@gmail.com>
	 <20210831181505.1074767-2-kari.argillander@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=6.31
X-Stat-Signature: ocpfoi6u79nnsuqi3qfgc1bwhd7u4rmf
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 6A68B13D97
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18uSKCNe+O15Z6+tqeiXjSvmPXVWSJxc2w=
X-HE-Tag: 1630464060-919141

On Tue, 2021-08-31 at 21:15 +0300, Kari Argillander wrote:
> If we do not use kmalloc_array we get checkpatch warning. It is also
> little safer if something goes wrong with coding.
[]
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
[]
> @@ -707,7 +707,7 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
>  		u16 *ptr;
>  		int new_slots = ALIGN(2 * nslots, 8);
>  
> 
> -		ptr = kmalloc(sizeof(u16) * new_slots, GFP_NOFS);
> +		ptr = kmalloc_array(new_slots, sizeof(u16), GFP_NOFS);
>  		if (ptr)
>  			memcpy(ptr, offs, sizeof(u16) * max_idx);

This multiplication could also overflow.

Maybe use krealloc?


