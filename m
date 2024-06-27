Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CAC1304A3;
	Thu, 27 Jun 2024 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478085; cv=none; b=VpOl2tWYNc8+x40Q3eyvgiaDRUYprDi7d2J8GeuA2v5Ar9WFpTiDmQkNnZexADfLIRMGBFEkxd5pcIaUpUH67POcRFWcwi1ZCq7STiYrNQiHLOJ/5p0OXTwmSEFB11j0X4TzC0ibf0Jusim/RlMWJaqDkmLXH9paY+nAJMg15X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478085; c=relaxed/simple;
	bh=r7ZTZQrKQmL+i9MYzOpAQe/COljgaRaDaty74UcNsZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1dbUzFkYcI9/67eWCvJLUIYIZLyls8kRMeQ6VZOmNs7scB6o5/Sv8qKu1YNPg6AA4io0mXzoeupj6NKoBq9l3lZDi0yt67+MHvJiIgOWof+NRpORasWF9ymD+/wSHCLgf2KwT329eKxayDPipOvLe4lCzMToW3vWrIbeiosBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVnsc5fr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVnsc5fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719478083; x=1751014083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7ZTZQrKQmL+i9MYzOpAQe/COljgaRaDaty74UcNsZw=;
  b=DVnsc5fr3+u7wlunNyDLprXnf8TRTJFHaWDYyxZ6VIfLBl89kJ0VXI0b
   Pd2rLPwFadcnHIbnRjAB3CcsvJ0V6tqz+IxNO9zujV568M01cXvd/W2w8
   WgY2kG5br3JRsQbXwmNuWk9TF24Uq73KWO5dD8T10rkywCD9IdjzPY0rK
   Cpc+SM2kzNkXNmYq5Wsjr62b3fYjw0OF9C+d+WKPE+9EDPn06DgmiWSpA
   qbvx12O1s/weC+iiNty9vwALDnEFRNU694zykx1LNgklQ03eo/fL2DMrL
   vDqWwivhXDQEB53fj0hwhBOLUav1I6gO6g+PoXugHKr8xMaOHz/+8xyUd
   w==;
X-CSE-ConnectionGUID: NXK02pxVSty7DTOzYxFZLg==
X-CSE-MsgGUID: /pQHDjvzQmGW8rLg7/mAng==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="42003623"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="42003623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 01:48:03 -0700
X-CSE-ConnectionGUID: 4772JSYYSkOk1AEZpAdTKw==
X-CSE-MsgGUID: tcO6UnolRq+aQZoVOMI/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44424602"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2024 01:48:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMknO-000G4U-2x;
	Thu, 27 Jun 2024 08:47:58 +0000
Date: Thu, 27 Jun 2024 16:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 35/42]
 fs/ntfs3/frecord.c:1934:9: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202406271606.Xd5k04bb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   bde63e8eae5d67582b32517229de11ef00223e34
commit: 27ba86795ed65b6f2f88f1b63786fe68c57b3b61 [35/42] fs/ntfs3: Do copy_to_user out of run_lock
config: x86_64-randconfig-121-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271606.Xd5k04bb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271606.Xd5k04bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271606.Xd5k04bb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/frecord.c:1934:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1934:9: sparse:     expected void const *
   fs/ntfs3/frecord.c:1934:9: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
>> fs/ntfs3/frecord.c:1934:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1934:9: sparse:     expected void const *
   fs/ntfs3/frecord.c:1934:9: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
>> fs/ntfs3/frecord.c:1934:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1934:9: sparse:     expected void *
   fs/ntfs3/frecord.c:1934:9: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
>> fs/ntfs3/frecord.c:2011:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct fiemap_extent [noderef] __user *fi_extents_start @@     got struct fiemap_extent *[assigned] fe_k @@
   fs/ntfs3/frecord.c:2011:35: sparse:     expected struct fiemap_extent [noderef] __user *fi_extents_start
   fs/ntfs3/frecord.c:2011:35: sparse:     got struct fiemap_extent *[assigned] fe_k
   fs/ntfs3/frecord.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   fs/ntfs3/frecord.c: note: in included file:
   fs/ntfs3/ntfs.h:461:21: sparse: sparse: self-comparison always evaluates to false

vim +1934 fs/ntfs3/frecord.c

  1900	
  1901	/*
  1902	 * fiemap_fill_next_extent_k - a copy of fiemap_fill_next_extent
  1903	 * but it accepts kernel address for fi_extents_start
  1904	 */
  1905	static int fiemap_fill_next_extent_k(struct fiemap_extent_info *fieinfo,
  1906					     u64 logical, u64 phys, u64 len, u32 flags)
  1907	{
  1908		struct fiemap_extent extent;
  1909		struct fiemap_extent __user *dest = fieinfo->fi_extents_start;
  1910	
  1911		/* only count the extents */
  1912		if (fieinfo->fi_extents_max == 0) {
  1913			fieinfo->fi_extents_mapped++;
  1914			return (flags & FIEMAP_EXTENT_LAST) ? 1 : 0;
  1915		}
  1916	
  1917		if (fieinfo->fi_extents_mapped >= fieinfo->fi_extents_max)
  1918			return 1;
  1919	
  1920		if (flags & FIEMAP_EXTENT_DELALLOC)
  1921			flags |= FIEMAP_EXTENT_UNKNOWN;
  1922		if (flags & FIEMAP_EXTENT_DATA_ENCRYPTED)
  1923			flags |= FIEMAP_EXTENT_ENCODED;
  1924		if (flags & (FIEMAP_EXTENT_DATA_TAIL | FIEMAP_EXTENT_DATA_INLINE))
  1925			flags |= FIEMAP_EXTENT_NOT_ALIGNED;
  1926	
  1927		memset(&extent, 0, sizeof(extent));
  1928		extent.fe_logical = logical;
  1929		extent.fe_physical = phys;
  1930		extent.fe_length = len;
  1931		extent.fe_flags = flags;
  1932	
  1933		dest += fieinfo->fi_extents_mapped;
> 1934		memcpy(dest, &extent, sizeof(extent));
  1935	
  1936		fieinfo->fi_extents_mapped++;
  1937		if (fieinfo->fi_extents_mapped == fieinfo->fi_extents_max)
  1938			return 1;
  1939		return (flags & FIEMAP_EXTENT_LAST) ? 1 : 0;
  1940	}
  1941	
  1942	/*
  1943	 * ni_fiemap - Helper for file_fiemap().
  1944	 *
  1945	 * Assumed ni_lock.
  1946	 * TODO: Less aggressive locks.
  1947	 */
  1948	int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
  1949		      __u64 vbo, __u64 len)
  1950	{
  1951		int err = 0;
  1952		struct fiemap_extent __user *fe_u = fieinfo->fi_extents_start;
  1953		struct fiemap_extent *fe_k = NULL;
  1954		struct ntfs_sb_info *sbi = ni->mi.sbi;
  1955		u8 cluster_bits = sbi->cluster_bits;
  1956		struct runs_tree *run;
  1957		struct rw_semaphore *run_lock;
  1958		struct ATTRIB *attr;
  1959		CLST vcn = vbo >> cluster_bits;
  1960		CLST lcn, clen;
  1961		u64 valid = ni->i_valid;
  1962		u64 lbo, bytes;
  1963		u64 end, alloc_size;
  1964		size_t idx = -1;
  1965		u32 flags;
  1966		bool ok;
  1967	
  1968		if (S_ISDIR(ni->vfs_inode.i_mode)) {
  1969			run = &ni->dir.alloc_run;
  1970			attr = ni_find_attr(ni, NULL, NULL, ATTR_ALLOC, I30_NAME,
  1971					    ARRAY_SIZE(I30_NAME), NULL, NULL);
  1972			run_lock = &ni->dir.run_lock;
  1973		} else {
  1974			run = &ni->file.run;
  1975			attr = ni_find_attr(ni, NULL, NULL, ATTR_DATA, NULL, 0, NULL,
  1976					    NULL);
  1977			if (!attr) {
  1978				err = -EINVAL;
  1979				goto out;
  1980			}
  1981			if (is_attr_compressed(attr)) {
  1982				/* Unfortunately cp -r incorrectly treats compressed clusters. */
  1983				err = -EOPNOTSUPP;
  1984				ntfs_inode_warn(
  1985					&ni->vfs_inode,
  1986					"fiemap is not supported for compressed file (cp -r)");
  1987				goto out;
  1988			}
  1989			run_lock = &ni->file.run_lock;
  1990		}
  1991	
  1992		if (!attr || !attr->non_res) {
  1993			err = fiemap_fill_next_extent(
  1994				fieinfo, 0, 0,
  1995				attr ? le32_to_cpu(attr->res.data_size) : 0,
  1996				FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_LAST |
  1997					FIEMAP_EXTENT_MERGED);
  1998			goto out;
  1999		}
  2000	
  2001		/*
  2002		 * To avoid lock problems replace pointer to user memory by pointer to kernel memory.
  2003		 */
  2004		fe_k = kmalloc_array(fieinfo->fi_extents_max,
  2005				     sizeof(struct fiemap_extent),
  2006				     GFP_NOFS | __GFP_ZERO);
  2007		if (!fe_k) {
  2008			err = -ENOMEM;
  2009			goto out;
  2010		}
> 2011		fieinfo->fi_extents_start = fe_k;
  2012	
  2013		end = vbo + len;
  2014		alloc_size = le64_to_cpu(attr->nres.alloc_size);
  2015		if (end > alloc_size)
  2016			end = alloc_size;
  2017	
  2018		down_read(run_lock);
  2019	
  2020		while (vbo < end) {
  2021			if (idx == -1) {
  2022				ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
  2023			} else {
  2024				CLST vcn_next = vcn;
  2025	
  2026				ok = run_get_entry(run, ++idx, &vcn, &lcn, &clen) &&
  2027				     vcn == vcn_next;
  2028				if (!ok)
  2029					vcn = vcn_next;
  2030			}
  2031	
  2032			if (!ok) {
  2033				up_read(run_lock);
  2034				down_write(run_lock);
  2035	
  2036				err = attr_load_runs_vcn(ni, attr->type,
  2037							 attr_name(attr),
  2038							 attr->name_len, run, vcn);
  2039	
  2040				up_write(run_lock);
  2041				down_read(run_lock);
  2042	
  2043				if (err)
  2044					break;
  2045	
  2046				ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
  2047	
  2048				if (!ok) {
  2049					err = -EINVAL;
  2050					break;
  2051				}
  2052			}
  2053	
  2054			if (!clen) {
  2055				err = -EINVAL; // ?
  2056				break;
  2057			}
  2058	
  2059			if (lcn == SPARSE_LCN) {
  2060				vcn += clen;
  2061				vbo = (u64)vcn << cluster_bits;
  2062				continue;
  2063			}
  2064	
  2065			flags = FIEMAP_EXTENT_MERGED;
  2066			if (S_ISDIR(ni->vfs_inode.i_mode)) {
  2067				;
  2068			} else if (is_attr_compressed(attr)) {
  2069				CLST clst_data;
  2070	
  2071				err = attr_is_frame_compressed(
  2072					ni, attr, vcn >> attr->nres.c_unit, &clst_data);
  2073				if (err)
  2074					break;
  2075				if (clst_data < NTFS_LZNT_CLUSTERS)
  2076					flags |= FIEMAP_EXTENT_ENCODED;
  2077			} else if (is_attr_encrypted(attr)) {
  2078				flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
  2079			}
  2080	
  2081			vbo = (u64)vcn << cluster_bits;
  2082			bytes = (u64)clen << cluster_bits;
  2083			lbo = (u64)lcn << cluster_bits;
  2084	
  2085			vcn += clen;
  2086	
  2087			if (vbo + bytes >= end)
  2088				bytes = end - vbo;
  2089	
  2090			if (vbo + bytes <= valid) {
  2091				;
  2092			} else if (vbo >= valid) {
  2093				flags |= FIEMAP_EXTENT_UNWRITTEN;
  2094			} else {
  2095				/* vbo < valid && valid < vbo + bytes */
  2096				u64 dlen = valid - vbo;
  2097	
  2098				if (vbo + dlen >= end)
  2099					flags |= FIEMAP_EXTENT_LAST;
  2100	
  2101				err = fiemap_fill_next_extent_k(fieinfo, vbo, lbo, dlen,
  2102								flags);
  2103	
  2104				if (err < 0)
  2105					break;
  2106				if (err == 1) {
  2107					err = 0;
  2108					break;
  2109				}
  2110	
  2111				vbo = valid;
  2112				bytes -= dlen;
  2113				if (!bytes)
  2114					continue;
  2115	
  2116				lbo += dlen;
  2117				flags |= FIEMAP_EXTENT_UNWRITTEN;
  2118			}
  2119	
  2120			if (vbo + bytes >= end)
  2121				flags |= FIEMAP_EXTENT_LAST;
  2122	
  2123			err = fiemap_fill_next_extent_k(fieinfo, vbo, lbo, bytes,
  2124							flags);
  2125			if (err < 0)
  2126				break;
  2127			if (err == 1) {
  2128				err = 0;
  2129				break;
  2130			}
  2131	
  2132			vbo += bytes;
  2133		}
  2134	
  2135		up_read(run_lock);
  2136	
  2137		/*
  2138		 * Copy to user memory out of lock
  2139		 */
  2140		if (copy_to_user(fe_u, fe_k,
  2141				 fieinfo->fi_extents_max *
  2142					 sizeof(struct fiemap_extent))) {
  2143			err = -EFAULT;
  2144		}
  2145	
  2146	out:
  2147		/* Restore original pointer. */
  2148		fieinfo->fi_extents_start = fe_u;
  2149		kfree(fe_k);
  2150		return err;
  2151	}
  2152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
