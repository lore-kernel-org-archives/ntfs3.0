Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957697B
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 20:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8MDpJ7jgFg08FdnKZsV+QprI8ywAQ6xn9uKTmLKEvxk=; b=qMJi22+CPh9NhYIdtTeP0G5M14
	cAFtG1rzZfME7H/xtRxMuT5M+sF2c5CaKswp0wzdgtvpvWYAR/UXRY26/MY1BS7WTjJIBXNwlDGKi
	Iv1MmPoSfb9r0IgtnR1lcyw4ZIF+/1DZcx1dVtahoqE0L0FP9rAlOJbVnkOWl1oHKSONmkY+2seX6
	TnkYgssRM1ExdsvPJiMFmvpEjUuPZczY/6xn3waDPijihgCU4jPM0AqO2NkqDsfE5dPwboUTHYp6o
	FRk7g2uFkvJfCJ6nCt1nEvd5ZQmgasdNox5cd98AzEk+tGdWl3klOv1qTLs0pKh2E2vFSTugy0TG2
	jcurReHA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkWpP-00Ckpk-B5; Fri, 29 Apr 2022 20:02:59 +0000
Date: Fri, 29 Apr 2022 21:02:59 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-fsdevel@vger.kernel.org,
	syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kari Argillander <kari.argillander@stargateuniverse.net>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH v2] fs/ntfs3: validate BOOT sectors_per_clusters
Message-ID: <YmxEc3jLLylGqxsD@casper.infradead.org>
References: <20220429200100.22659-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429200100.22659-1-rdunlap@infradead.org>

On Fri, Apr 29, 2022 at 01:01:00PM -0700, Randy Dunlap wrote:
> When the NTFS BOOT sectors_per_clusters field is > 0x80,
> it represents a shift value. Make sure that the shift value is
> not too large (> 31) before using it. Return 0xffffffff if it is.
> 
> This prevents negative shift values and shift values that are
> larger than the field size.
> 
> Prevents this UBSAN error:
> 
>  UBSAN: shift-out-of-bounds in ../fs/ntfs3/super.c:673:16
>  shift exponent -192 is negative
> 
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
