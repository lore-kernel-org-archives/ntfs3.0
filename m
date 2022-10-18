Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C855386
	for <ntfs3@lists.linux.dev>; Tue, 18 Oct 2022 21:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9ACC433C1;
	Tue, 18 Oct 2022 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1666126957;
	bh=JDhxV9cE13wlutpbfNljUnqD44+JRDKvWdOIX7KOd/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=idDLL4RT67Sjajpxw+ttUmOc9YmTfDmZqrqlHXN51XeJ41bzqMmUjKERDU7gPUAYt
	 tfRRHEUZ/U+aUqw7/ED82CckMzY5/bN7ukjeWfrynZKOQ5rUavxXyZkdpEQt/s16N/
	 GY7U3DckdJVdwsEbUbxKvBTYdDCRJh7IwBbH9L6w=
Date: Tue, 18 Oct 2022 14:02:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: ntfs3@lists.linux.dev, linux-mm@kvack.org, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 Liam Howlett <liam.howlett@oracle.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 4ca786ae6681b90b0ec3f4c55c89d12f835f8944
Message-Id: <20221018140236.f55b76d77f5b872edf9bfdce@linux-foundation.org>
In-Reply-To: <634eca23.ML3KLI/hjp2jt28w%lkp@intel.com>
References: <634eca23.ML3KLI/hjp2jt28w%lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Oct 2022 23:45:39 +0800 kernel test robot <lkp@intel.com> wrote:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 4ca786ae6681b90b0ec3f4c55c89d12f835f8944  Add linux-next specific files for 20221018
> 
> ...
>
> mm/mmap.c:802 __vma_adjust() error: uninitialized symbol 'next_next'.
> 

The code's OK but I guess we should make this warning go away.

--- a/mm/mmap.c~a
+++ a/mm/mmap.c
@@ -618,7 +618,8 @@ int __vma_adjust(struct vm_area_struct *
 	struct vm_area_struct *expand)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	struct vm_area_struct *next_next, *next = find_vma(mm, vma->vm_end);
+	struct vm_area_struct *next_next = NULL;	/* uninit var warning */
+	struct vm_area_struct *next = find_vma(mm, vma->vm_end);
 	struct vm_area_struct *orig_vma = vma;
 	struct address_space *mapping = NULL;
 	struct rb_root_cached *root = NULL;
_


