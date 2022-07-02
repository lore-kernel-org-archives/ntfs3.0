Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725741FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656788068; x=1688324068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lDzURSo5CuKZu50QeulKtsbmIB9obJq/v1OWj46XbM0=;
  b=WrtBhVD+uCDQ+StpwNSQVzFLRPrP2+wWBnJoEaLysM4mNNEtNNIFO2B4
   YRRklvXg7cuiWiRw24nr3vK4tcTivz4SJIVNwylxIOfIzWT9406yjU5/e
   zX994x+dYnhssHW+kQ9H4hOALog1k5PV6wQoo6hJUQrL5hFiH5jc49IEx
   BR8UQ3eQDbC2z7dHvLSvwunkUrIwS6ssL59T9XFjsxfQaDyxdHzWI0wEp
   n7g/DOfKM71uWvJgRdml8UxS/ETD+JfehzPhN1pVFJYWE7l7yljar9hSr
   3US8l5yu632rkwW3zM8N6TW53WBZpTaoyucYX4JO/hMZSDUWaavcvEcOn
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="283593059"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="283593059"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 11:54:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="681765037"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 11:54:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1o7iG4-0013pn-0n;
	Sat, 02 Jul 2022 21:54:20 +0300
Date: Sat, 2 Jul 2022 21:54:19 +0300
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
Subject: Re: [PATCH 1/4] s390/cio: Rename bitmap_size() as idset_bitmap_size()
Message-ID: <YsCUW6vT7LlAv2UE@smile.fi.intel.com>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f2ad7fb91948525f6c52e0d36ec223cd3049c88.1656785856.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jul 02, 2022 at 08:29:09PM +0200, Christophe JAILLET wrote:
> In order to introduce a bitmap_size() function in the bitmap API, we have
> to rename functions with a similar name.
> 
> Add a "idset_" prefix and change bitmap_size() into idset_bitmap_size().
> 
> No functional change.

...

> -		memset(set->bitmap, 0, bitmap_size(num_ssid, num_id));
> +		memset(set->bitmap, 0, idset_bitmap_size(num_ssid, num_id));

Why not to use bitmap_zero()?

...

> -	memset(set->bitmap, 0xff, bitmap_size(set->num_ssid, set->num_id));
> +	memset(set->bitmap, 0xff, idset_bitmap_size(set->num_ssid, set->num_id));

Why not to use bitmap_fill() ?


-- 
With Best Regards,
Andy Shevchenko


