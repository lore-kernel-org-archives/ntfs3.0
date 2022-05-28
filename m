Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au [211.29.132.246])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35877B
	for <ntfs3@lists.linux.dev>; Sat, 28 May 2022 00:27:19 +0000 (UTC)
Received: from dread.disaster.area (pa49-181-2-147.pa.nsw.optusnet.com.au [49.181.2.147])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 7E642538FEE;
	Sat, 28 May 2022 10:06:21 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1nujyG-00HDH2-8o; Sat, 28 May 2022 10:06:20 +1000
Date: Sat, 28 May 2022 10:06:20 +1000
From: Dave Chinner <david@fromorbit.com>
To: Almaz Alexandrovich <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/3] fs/ntfs3: Refactoring of indx_find function
Message-ID: <20220528000620.GH3923443@dread.disaster.area>
References: <75a1215a-eda2-d0dc-b962-0334356eef7c@paragon-software.com>
 <0f9648cc-66af-077c-88e6-8650fd78f44c@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f9648cc-66af-077c-88e6-8650fd78f44c@paragon-software.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=6291677e
	a=ivVLWpVy4j68lT4lJFbQgw==:117 a=ivVLWpVy4j68lT4lJFbQgw==:17
	a=kj9zAlcOel0A:10 a=oZkIemNP1mAA:10 a=GFCt93a2AAAA:8 a=7-415B0cAAAA:8
	a=0CrOsYfU3WwKmZ_veyUA:9 a=CjuIK1q_8ugA:10 a=CZlV3fpBRwkA:10
	a=0UNspqPZPZo5crgNHNjb:22 a=biEYGPWJfzWAr4FL6Ov7:22

On Fri, May 27, 2022 at 05:21:03PM +0300, Almaz Alexandrovich wrote:
> This commit makes function a bit more readable
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

This looks wrong. The email is from

 "From: Almaz Alexandrovich <almaz.alexandrovich@paragon-software.com>"

So it looks like the S-o-B has the wrong email address in it. All
the patches have this same problem.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
