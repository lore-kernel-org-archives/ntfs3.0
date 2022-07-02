Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1C1FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 19:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656788454; x=1688324454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yvU0XF5WPIv08rLvOwNYp2E3/4NRlwUAnfDXcMlIHUk=;
  b=XnaKlipab4fN3AC7pB9r/8cV4uHrC0ZIkU5QH1OqTXdXa/90knfRTOm4
   ttdM8iwNxQJ9sXEltZ72cEqilo+HqNx7Qa8ZsYakVpVgFH8+DLujM1L6N
   f9eHic79KswIFVy5gGKkaNfYCYTyOlu88vQEJ1+8o8MlrHcsbstyPI2DE
   AhZrxFBKXlE8iNB5fA1NruyrbF778wcNkE1eANhLLXVrShfwYIC4VTpF0
   DiCZRHvu2l84cJEA5PCWRG719ALa157jlNio/U0aCtTYu9S7A/y1abiMO
   KOb/zdOYysVerbgFLlu31FoibRSVrKOqcrnURwKr6ta6Wt+QE5jUiL9rW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="281623138"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="281623138"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 12:00:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="542052848"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 12:00:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1o7iKB-0013px-1y;
	Sat, 02 Jul 2022 21:58:35 +0300
Date: Sat, 2 Jul 2022 21:58:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
	vneethv@linux.ibm.com, oberpar@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	almaz.alexandrovich@paragon-software.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, linux-s390@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/4] fs/ntfs3: Rename bitmap_size() as ntfs3_bitmap_size()
Message-ID: <YsCVW5Dt3YcE3TLL@smile.fi.intel.com>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <56a3cb896ec446ca24e4756042d9f0829afc671a.1656785856.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56a3cb896ec446ca24e4756042d9f0829afc671a.1656785856.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jul 02, 2022 at 08:29:27PM +0200, Christophe JAILLET wrote:
> In order to introduce a bitmap_size() function in the bitmap API, we have
> to rename functions with a similar name.

...

>  /* NTFS uses quad aligned bitmaps. */
> -static inline size_t bitmap_size(size_t bits)
> +static inline size_t ntfs3_bitmap_size(size_t bits)
>  {
>  	return ALIGN((bits + 7) >> 3, 8);

It would be easier to understand in a way

	return BITS_TO_BYTES(ALIGN(bits, 64));

>  }

-- 
With Best Regards,
Andy Shevchenko


