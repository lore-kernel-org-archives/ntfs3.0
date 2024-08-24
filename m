Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6AB65C;
	Sat, 24 Aug 2024 01:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724464676; cv=none; b=BbYotXDzE4eDHYyGOFBShtPjdQCNx+nGg4E/GMZFPnH2s0YAHWT2YPxwhhq5GzIuB+JyVhBpDTj48AkaovK81S12wzG2wgaIX8DPg7765WrI99xMqIqmEQ+Ur/eryhJ4UF2cWqpPcHlb3JaSVs40KVBldLLVxvV4LWAIFF9Lbxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724464676; c=relaxed/simple;
	bh=M7/mjt8XWi4YCryptwXhG81DsvRF/fmwQG8XrxrhFes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+d/MfMapOIGEsUOoHKoE9MzsFXePqyGv/saJCuQ71muiE3597fXziWgGLnNiJJRYLwv5ZfobDf/xnY0CDGn9e8i/fFxWSM7JgsCrG0gjZiNgWUSNHzVVRao6jOzBBv8H/vhlIjBGaMGBqWPLPS1prx+lkqL5xU7hFCMNKibFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THHqB6Az; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THHqB6Az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724464674; x=1756000674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7/mjt8XWi4YCryptwXhG81DsvRF/fmwQG8XrxrhFes=;
  b=THHqB6AzCPIblbRW0DesdONdMgoSnD+HK3xt99sul9xxz+xRFMyx6v26
   b1T1Z0Ydbe9tClF7B90V8AczZubGOH5OjHpKjS8LpDQGsH6bzwRUlzYu8
   ZVVsqiUizHBP41cuOQo71zLBHs9Tq9lwbk4ad+12/+u8gfH0WkXnVLJMI
   Dlpelx+bCE+mCHDv2LESsMMgQU7BFEXLih5lLcZ10oTbh9W+IGYU00zLg
   ts/NPqDkoF1wS7egLeKLlnMCe7/s6eySAi/RdjRc28nrTWgsYk+J/s+Np
   ahrRisAV52eOIWG5qviT0W20J/EldE7JiAqCLZZeYwRZdxaCTbYosqq9F
   Q==;
X-CSE-ConnectionGUID: snoD1ToPQ1uaD9UaXp2uQQ==
X-CSE-MsgGUID: i00A0C84Tu+0+49oaqD/eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="33524229"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="33524229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 18:57:53 -0700
X-CSE-ConnectionGUID: bF2farG5QlOe2elPew28uQ==
X-CSE-MsgGUID: vfgz5UTFTBeXfDnV84BuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="61663010"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Aug 2024 18:57:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shg2H-000ECe-15;
	Sat, 24 Aug 2024 01:57:49 +0000
Date: Sat, 24 Aug 2024 09:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 8/16]
 fs/ntfs3/frecord.c:1909:45: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202408240903.7Yk8oU2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   7529036a025ad8bbd664f3aad8bd726e664a6db7
commit: afeed485ef9286020da77b400f06894a0fe0ad1a [8/16] fs/ntfs3: Remove '__user' for kernel pointer
config: x86_64-randconfig-123-20240824 (https://download.01.org/0day-ci/archive/20240824/202408240903.7Yk8oU2k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408240903.7Yk8oU2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240903.7Yk8oU2k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/frecord.c:1909:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fiemap_extent *dest @@     got struct fiemap_extent [noderef] __user *fi_extents_start @@
   fs/ntfs3/frecord.c:1909:45: sparse:     expected struct fiemap_extent *dest
   fs/ntfs3/frecord.c:1909:45: sparse:     got struct fiemap_extent [noderef] __user *fi_extents_start
   fs/ntfs3/frecord.c:2011:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct fiemap_extent [noderef] __user *fi_extents_start @@     got struct fiemap_extent *[assigned] fe_k @@
   fs/ntfs3/frecord.c:2011:35: sparse:     expected struct fiemap_extent [noderef] __user *fi_extents_start
   fs/ntfs3/frecord.c:2011:35: sparse:     got struct fiemap_extent *[assigned] fe_k
   fs/ntfs3/frecord.c: note: in included file:
   fs/ntfs3/ntfs.h:461:21: sparse: sparse: self-comparison always evaluates to false

vim +1909 fs/ntfs3/frecord.c

  1900	
  1901	/*
  1902	 * fiemap_fill_next_extent_k - a copy of fiemap_fill_next_extent
  1903	 * but it accepts kernel address for fi_extents_start
  1904	 */
  1905	static int fiemap_fill_next_extent_k(struct fiemap_extent_info *fieinfo,
  1906					     u64 logical, u64 phys, u64 len, u32 flags)
  1907	{
  1908		struct fiemap_extent extent;
> 1909		struct fiemap_extent *dest = fieinfo->fi_extents_start;
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
  1934		memcpy(dest, &extent, sizeof(extent));
  1935	
  1936		fieinfo->fi_extents_mapped++;
  1937		if (fieinfo->fi_extents_mapped == fieinfo->fi_extents_max)
  1938			return 1;
  1939		return (flags & FIEMAP_EXTENT_LAST) ? 1 : 0;
  1940	}
  1941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
