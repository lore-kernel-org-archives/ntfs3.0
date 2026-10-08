Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236963A5452;
	Thu,  8 Oct 2026 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428114; cv=none; b=H7G05KIt5mTdjahIEsog+evmQQ4KrMcyeD1Jx0PAIho54p44hPIEsjZ3ab/Mnptq1j8DNCDglrbM1VKkQNsM5yKgo62jML+akH35sheZ4GdK4vlXSHXGbcXXe+okhZdnKguvqJtVIjN1ivxLhyuGkJ3nAf2k6D6XUV3Zg+/nxFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428114; c=relaxed/simple;
	bh=eR2KIOz9AvHe5s9OcVhfk4QXCR2J7oiFEAraWRreWck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZarT3kfkq3VCbaRsFWT4oDTyBTR3fH6j8Sv5jmkCpmzhpNC5IG1bLjCxljy6ePX+P02yojPd3oONt9eQKuRO9n+4FagE3ELFKR4au9PxifTQMiVEaonns1YIAKBXNoA2uj/xXPfBUVKuiuMJL04p39OaYMM4rX12i/kWP1k1f4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZ9L1T4I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZ9L1T4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791428113; x=1822964113;
  h=date:from:to:cc:subject:message-id;
  bh=eR2KIOz9AvHe5s9OcVhfk4QXCR2J7oiFEAraWRreWck=;
  b=SZ9L1T4IJdpdmpnvMsz0p97F4FcbHK+lq4yEGy9grHd3pFQu3LIjLYeP
   mip9LMFdsJJ++wvuDoDiwNZonkUmROdhvJOqVOx0XfCz+9ihuZSwqk594
   y7eFp8PWdJgjyYk3ksVBX4WPsGboO7lfi9OZ5z09mVod4EQKNuuUdfG/M
   Gi63Pmi/eZDeborYXrJaW6A2M5Utf2LcE7f79ExEixKCY5jhYYrATbyNQ
   BOmk6DI8YVFDGjeuhTDvI/KjVyVoZCelzmsWZD7r7vTgUF9vHh0wtnTTE
   4eHdy8l1Bvb6kSvUV0PaZQ0tlQ9fKNpC1Ck61s9K99KRaL4a891WYHBtI
   A==;
X-CSE-ConnectionGUID: pdBtyOt0QY20ioQdaov73g==
X-CSE-MsgGUID: m7Zf/u6HTeGdjmkXCrGA5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="198007"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="198007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 19:55:12 -0700
X-CSE-ConnectionGUID: 5ZDk42X2R++p7AcTFj78bA==
X-CSE-MsgGUID: 1gp7WCLWSMKICcf/H4tLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="342429"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 19:55:09 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEeHi-000000004dL-3vyO;
	Thu, 08 Oct 2026 02:55:06 +0000
Date: Thu, 08 Oct 2026 04:55:00 +0200
From: kernel test robot <lkp@intel.com>
To: Weiming Shi <bestswngs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [paragon-software-group-ntfs3:devel 26/26]
 fs/ntfs3/frecord.c:2293:22: warning: unused variable 'pg'
Message-ID: <202610080424.rUju7YHS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git devel
head:   a0612938d736fc7c3670ecf0bfbc78f2fd8ecdea
commit: a0612938d736fc7c3670ecf0bfbc78f2fd8ecdea [26/26] fs/ntfs3: do not mark frame pages uptodate on read error
config: nios2-randconfig-r2104-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080424.rUju7YHS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080424.rUju7YHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080424.rUju7YHS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ntfs3/frecord.c: In function 'ni_read_frame':
>> fs/ntfs3/frecord.c:2293:22: warning: unused variable 'pg' [-Wunused-variable]
    2293 |         struct page *pg;
         |                      ^~


vim +/pg +2293 fs/ntfs3/frecord.c

4342306f0f0d5f Konstantin Komarov 2021-08-13  2273  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2274  /*
4342306f0f0d5f Konstantin Komarov 2021-08-13  2275   * ni_read_frame
4342306f0f0d5f Konstantin Komarov 2021-08-13  2276   *
d3624466b56dd5 Konstantin Komarov 2021-08-31  2277   * Pages - Array of locked pages.
4342306f0f0d5f Konstantin Komarov 2021-08-13  2278   */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2279  int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
f35590ee26f572 Konstantin Komarov 2025-10-14  2280  		  u32 pages_per_frame, int copy)
4342306f0f0d5f Konstantin Komarov 2021-08-13  2281  {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2282  	int err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2283  	struct ntfs_sb_info *sbi = ni->mi.sbi;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2284  	u8 cluster_bits = sbi->cluster_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2285  	char *frame_ondisk = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2286  	char *frame_mem = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2287  	struct ATTR_LIST_ENTRY *le = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2288  	struct runs_tree *run = &ni->file.run;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2289  	u64 valid_size = ni->i_valid;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2290  	u64 vbo_disk;
10d7c95af043b4 Konstantin Komarov 2026-02-16  2291  	size_t unc_size = 0;
f35590ee26f572 Konstantin Komarov 2025-10-14  2292  	u32 frame_size, i, ondisk_size;
4342306f0f0d5f Konstantin Komarov 2021-08-13 @2293  	struct page *pg;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2294  	struct ATTRIB *attr;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2295  	CLST frame, clst_data;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2296  
be310476e8868e Konstantin Komarov 2026-07-30  2297  	ni = ni->base;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2298  	/*
e8b8e97f91b80f Kari Argillander   2021-08-03  2299  	 * To simplify decompress algorithm do vmap for source
e8b8e97f91b80f Kari Argillander   2021-08-03  2300  	 * and target pages.
4342306f0f0d5f Konstantin Komarov 2021-08-13  2301  	 */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2302  	frame_size = pages_per_frame << PAGE_SHIFT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2303  	frame_mem = vmap(pages, pages_per_frame, VM_MAP, PAGE_KERNEL);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2304  	if (!frame_mem) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2305  		err = -ENOMEM;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2306  		goto out;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2307  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2308  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2309  	attr = ni_find_attr(ni, NULL, &le, ATTR_DATA, NULL, 0, NULL, NULL);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2310  	if (!attr) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2311  		err = -ENOENT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2312  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2313  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2314  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2315  	if (!attr->non_res) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2316  		u32 data_size = le32_to_cpu(attr->res.data_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2317  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2318  		memset(frame_mem, 0, frame_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2319  		if (frame_vbo < data_size) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2320  			ondisk_size = data_size - frame_vbo;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2321  			memcpy(frame_mem, resident_data(attr) + frame_vbo,
4342306f0f0d5f Konstantin Komarov 2021-08-13  2322  			       min(ondisk_size, frame_size));
4342306f0f0d5f Konstantin Komarov 2021-08-13  2323  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2324  		err = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2325  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2326  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2327  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2328  	if (frame_vbo >= valid_size) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2329  		memset(frame_mem, 0, frame_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2330  		err = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2331  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2332  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2333  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2334  	if (ni->ni_flags & NI_FLAG_COMPRESSED_MASK) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2335  #ifndef CONFIG_NTFS3_LZX_XPRESS
4342306f0f0d5f Konstantin Komarov 2021-08-13  2336  		err = -EOPNOTSUPP;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2337  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2338  #else
c8e314624a1666 Mark O'Donovan     2024-02-21  2339  		loff_t i_size = i_size_read(&ni->vfs_inode);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2340  		u32 frame_bits = ni_ext_compress_bits(ni);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2341  		u64 frame64 = frame_vbo >> frame_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2342  		u64 frames, vbo_data;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2343  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2344  		if (frame_size != (1u << frame_bits)) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2345  			err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2346  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2347  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2348  		switch (frame_size) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2349  		case 0x1000:
4342306f0f0d5f Konstantin Komarov 2021-08-13  2350  		case 0x2000:
4342306f0f0d5f Konstantin Komarov 2021-08-13  2351  		case 0x4000:
4342306f0f0d5f Konstantin Komarov 2021-08-13  2352  		case 0x8000:
4342306f0f0d5f Konstantin Komarov 2021-08-13  2353  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2354  		default:
e8b8e97f91b80f Kari Argillander   2021-08-03  2355  			/* Unknown compression. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2356  			err = -EOPNOTSUPP;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2357  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2358  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2359  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2360  		attr = ni_find_attr(ni, attr, &le, ATTR_DATA, WOF_NAME,
4342306f0f0d5f Konstantin Komarov 2021-08-13  2361  				    ARRAY_SIZE(WOF_NAME), NULL, NULL);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2362  		if (!attr) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2363  			ntfs_inode_err(
4342306f0f0d5f Konstantin Komarov 2021-08-13  2364  				&ni->vfs_inode,
4342306f0f0d5f Konstantin Komarov 2021-08-13  2365  				"external compressed file should contains data attribute \"WofCompressedData\"");
4342306f0f0d5f Konstantin Komarov 2021-08-13  2366  			err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2367  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2368  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2369  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2370  		if (!attr->non_res) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2371  			run = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2372  		} else {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2373  			run = run_alloc();
4342306f0f0d5f Konstantin Komarov 2021-08-13  2374  			if (!run) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2375  				err = -ENOMEM;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2376  				goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2377  			}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2378  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2379  
4fd6c08a16d7f1 Konstantin Komarov 2024-01-26  2380  		frames = (i_size - 1) >> frame_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2381  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2382  		err = attr_wof_frame_info(ni, attr, run, frame64, frames,
4342306f0f0d5f Konstantin Komarov 2021-08-13  2383  					  frame_bits, &ondisk_size, &vbo_data);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2384  		if (err)
f35590ee26f572 Konstantin Komarov 2025-10-14  2385  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2386  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2387  		if (frame64 == frames) {
4fd6c08a16d7f1 Konstantin Komarov 2024-01-26  2388  			unc_size = 1 + ((i_size - 1) & (frame_size - 1));
4342306f0f0d5f Konstantin Komarov 2021-08-13  2389  			ondisk_size = attr_size(attr) - vbo_data;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2390  		} else {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2391  			unc_size = frame_size;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2392  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2393  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2394  		if (ondisk_size > frame_size) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2395  			err = -EINVAL;
f35590ee26f572 Konstantin Komarov 2025-10-14  2396  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2397  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2398  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2399  		if (!attr->non_res) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2400  			if (vbo_data + ondisk_size >
4342306f0f0d5f Konstantin Komarov 2021-08-13  2401  			    le32_to_cpu(attr->res.data_size)) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2402  				err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2403  				goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2404  			}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2405  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2406  			err = decompress_lzx_xpress(
4342306f0f0d5f Konstantin Komarov 2021-08-13  2407  				sbi, Add2Ptr(resident_data(attr), vbo_data),
4342306f0f0d5f Konstantin Komarov 2021-08-13  2408  				ondisk_size, frame_mem, unc_size, frame_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2409  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2410  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2411  		vbo_disk = vbo_data;
e8b8e97f91b80f Kari Argillander   2021-08-03  2412  		/* Load all runs to read [vbo_disk-vbo_to). */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2413  		err = attr_load_runs_range(ni, ATTR_DATA, WOF_NAME,
4342306f0f0d5f Konstantin Komarov 2021-08-13  2414  					   ARRAY_SIZE(WOF_NAME), run, vbo_disk,
4342306f0f0d5f Konstantin Komarov 2021-08-13  2415  					   vbo_data + ondisk_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2416  		if (err)
f35590ee26f572 Konstantin Komarov 2025-10-14  2417  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2418  #endif
4342306f0f0d5f Konstantin Komarov 2021-08-13  2419  	} else if (is_attr_compressed(attr)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  2420  		/* LZNT compression. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2421  		if (sbi->cluster_size > NTFS_LZNT_MAX_CLUSTER) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2422  			err = -EOPNOTSUPP;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2423  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2424  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2425  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2426  		if (attr->nres.c_unit != NTFS_LZNT_CUNIT) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2427  			err = -EOPNOTSUPP;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2428  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2429  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2430  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2431  		down_write(&ni->file.run_lock);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2432  		run_truncate_around(run, le64_to_cpu(attr->nres.svcn));
4342306f0f0d5f Konstantin Komarov 2021-08-13  2433  		frame = frame_vbo >> (cluster_bits + NTFS_LZNT_CUNIT);
e2705dd3d16d10 Konstantin Komarov 2024-10-08  2434  		err = attr_is_frame_compressed(ni, attr, frame, &clst_data,
e2705dd3d16d10 Konstantin Komarov 2024-10-08  2435  					       run);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2436  		up_write(&ni->file.run_lock);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2437  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13  2438  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2439  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2440  		if (!clst_data) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2441  			memset(frame_mem, 0, frame_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2442  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2443  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2444  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2445  		frame_size = sbi->cluster_size << NTFS_LZNT_CUNIT;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2446  		ondisk_size = clst_data << cluster_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2447  
4342306f0f0d5f Konstantin Komarov 2021-08-13  2448  		if (clst_data >= NTFS_LZNT_CLUSTERS) {
e8b8e97f91b80f Kari Argillander   2021-08-03  2449  			/* Frame is not compressed. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2450  			down_read(&ni->file.run_lock);
f35590ee26f572 Konstantin Komarov 2025-10-14  2451  			err = ntfs_read_run(sbi, run, frame_mem, frame_vbo,
f35590ee26f572 Konstantin Komarov 2025-10-14  2452  					    ondisk_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2453  			up_read(&ni->file.run_lock);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2454  			goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2455  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2456  		vbo_disk = frame_vbo;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2457  	} else {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2458  		__builtin_unreachable();
4342306f0f0d5f Konstantin Komarov 2021-08-13  2459  		err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2460  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2461  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2462  
f35590ee26f572 Konstantin Komarov 2025-10-14  2463  	/* Allocate memory to read compressed data to. */
f35590ee26f572 Konstantin Komarov 2025-10-14  2464  	frame_ondisk = kvmalloc(ondisk_size, GFP_KERNEL);
f35590ee26f572 Konstantin Komarov 2025-10-14  2465  	if (!frame_ondisk) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  2466  		err = -ENOMEM;
f35590ee26f572 Konstantin Komarov 2025-10-14  2467  		goto out1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2468  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  2469  
e8b8e97f91b80f Kari Argillander   2021-08-03  2470  	/* Read 'ondisk_size' bytes from disk. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  2471  	down_read(&ni->file.run_lock);
f35590ee26f572 Konstantin Komarov 2025-10-14  2472  	err = ntfs_read_run(sbi, run, frame_ondisk, vbo_disk, ondisk_size);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2473  	up_read(&ni->file.run_lock);
4342306f0f0d5f Konstantin Komarov 2021-08-13  2474  	if (err)
f35590ee26f572 Konstantin Komarov 2025-10-14  2475  		goto out2;
4342306f0f0d5f Konstantin Komarov 2021-08-13  2476  

:::::: The code at line 2293 was first introduced by commit
:::::: 4342306f0f0d5ff4315a204d315c1b51b914fca5 fs/ntfs3: Add file operations and implementation

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
