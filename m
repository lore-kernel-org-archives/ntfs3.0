Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFC2846C;
	Fri, 10 Mar 2023 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678458689; x=1709994689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z1w3Hy0U14lCt0H8sYoE0vClKKB4kCiFOcb2pSZnoOg=;
  b=gAKFhiuQF9tCfHqLT+D43bZj+2WOEwrHF5y+/35AqFfEAHP24sFJOJEh
   IHYoQ56UXZOW5mrhwQ/8J9DpAiY20iuaROUJZEfspGvfUO+Vt9KyVebrE
   orZEmNNL/KBNCE0xnKsVKgt9kDzjV2RtyuEPi2PDL7P+jB81Po5RYQ2tT
   GSIcPj8G3dqtyK3I3rCAzvDvKvGkVRX1qia338qzAL0hbe/wU68NhPJwI
   4j8EdzV/HAiI3UzOdvHaV+cQbTMFtNuyn0jzIESWadP8riaZV+/NbrEXg
   BkDA9/LheT0Nz+TaPafRvPTxfR7Q1HaWriLUvQ9AVI2ZVpCZO8y0vj5L1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423004451"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="423004451"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 06:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788029096"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="788029096"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 06:31:21 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1padmC-0003uv-1n;
	Fri, 10 Mar 2023 14:31:20 +0000
Date: Fri, 10 Mar 2023 22:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>,
	almaz.alexandrovich@paragon-software.com, jack@suse.com,
	dushistov@mail.ru, brauner@kernel.org, ntfs3@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH 1/3] fs/ntfs3: use wrapper i_blocksize() in
 ntfs_zero_range()
Message-ID: <202303102227.ih1dwtNV-lkp@intel.com>
References: <20230310030821.66090-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310030821.66090-1-frank.li@vivo.com>

Hi Yangtao,

I love your patch! Yet something to improve:

[auto build test ERROR on jack-fs/for_next]
[also build test ERROR on vfs-idmapping/for-next linus/master v6.3-rc1]
[cannot apply to next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/udf-use-wrapper-i_blocksize-in-udf_discard_prealloc/20230310-110943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
patch link:    https://lore.kernel.org/r/20230310030821.66090-1-frank.li%40vivo.com
patch subject: [PATCH 1/3] fs/ntfs3: use wrapper i_blocksize() in ntfs_zero_range()
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230310/202303102227.ih1dwtNV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/01c0c800dc0c15141eb3cb9d9e66cfc8b001be70
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/udf-use-wrapper-i_blocksize-in-udf_discard_prealloc/20230310-110943
        git checkout 01c0c800dc0c15141eb3cb9d9e66cfc8b001be70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102227.ih1dwtNV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/ntfs3/file.o: in function `ntfs_zero_range':
>> fs/ntfs3/file.c:195: undefined reference to `__divdi3'


vim +195 fs/ntfs3/file.c

   171	
   172	/*
   173	 * ntfs_zero_range - Helper function for punch_hole.
   174	 *
   175	 * It zeroes a range [vbo, vbo_to).
   176	 */
   177	static int ntfs_zero_range(struct inode *inode, u64 vbo, u64 vbo_to)
   178	{
   179		int err = 0;
   180		struct address_space *mapping = inode->i_mapping;
   181		u32 blocksize = i_blocksize(inode);
   182		pgoff_t idx = vbo >> PAGE_SHIFT;
   183		u32 from = vbo & (PAGE_SIZE - 1);
   184		pgoff_t idx_end = (vbo_to + PAGE_SIZE - 1) >> PAGE_SHIFT;
   185		loff_t page_off;
   186		struct buffer_head *head, *bh;
   187		u32 bh_next, bh_off, to;
   188		sector_t iblock;
   189		struct page *page;
   190	
   191		for (; idx < idx_end; idx += 1, from = 0) {
   192			page_off = (loff_t)idx << PAGE_SHIFT;
   193			to = (page_off + PAGE_SIZE) > vbo_to ? (vbo_to - page_off)
   194							     : PAGE_SIZE;
 > 195			iblock = page_off / i_blocksize(inode);
   196	
   197			page = find_or_create_page(mapping, idx,
   198						   mapping_gfp_constraint(mapping,
   199									  ~__GFP_FS));
   200			if (!page)
   201				return -ENOMEM;
   202	
   203			if (!page_has_buffers(page))
   204				create_empty_buffers(page, blocksize, 0);
   205	
   206			bh = head = page_buffers(page);
   207			bh_off = 0;
   208			do {
   209				bh_next = bh_off + blocksize;
   210	
   211				if (bh_next <= from || bh_off >= to)
   212					continue;
   213	
   214				if (!buffer_mapped(bh)) {
   215					ntfs_get_block(inode, iblock, bh, 0);
   216					/* Unmapped? It's a hole - nothing to do. */
   217					if (!buffer_mapped(bh))
   218						continue;
   219				}
   220	
   221				/* Ok, it's mapped. Make sure it's up-to-date. */
   222				if (PageUptodate(page))
   223					set_buffer_uptodate(bh);
   224	
   225				if (!buffer_uptodate(bh)) {
   226					lock_buffer(bh);
   227					bh->b_end_io = end_buffer_read_sync;
   228					get_bh(bh);
   229					submit_bh(REQ_OP_READ, bh);
   230	
   231					wait_on_buffer(bh);
   232					if (!buffer_uptodate(bh)) {
   233						unlock_page(page);
   234						put_page(page);
   235						err = -EIO;
   236						goto out;
   237					}
   238				}
   239	
   240				mark_buffer_dirty(bh);
   241	
   242			} while (bh_off = bh_next, iblock += 1,
   243				 head != (bh = bh->b_this_page));
   244	
   245			zero_user_segment(page, from, to);
   246	
   247			unlock_page(page);
   248			put_page(page);
   249			cond_resched();
   250		}
   251	out:
   252		mark_inode_dirty(inode);
   253		return err;
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
