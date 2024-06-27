Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C5148820;
	Thu, 27 Jun 2024 11:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487892; cv=none; b=p2HsfjjfUVVqmNl8lD4Io0UHX2iOPaQQvcyOFoVfA5Vyz+ohMFGrSN+2iX+BZyxlKjwH82W30BKtm2iDY0YlXz8Mb55fwJzno09vKbSbv8NA4Z2pLPAxOrzHsWu/cEZEoOVUhNf3VnsrpiT2mXzGeM0SMvFPwaam1QDk+o6xOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487892; c=relaxed/simple;
	bh=5Ej/EuTdRgA8+eq7eLUCqLCSDmSfe6lTfRipnyZy1cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mXZ4zHTr7BGY+a0ZHMh85HOPKqxNN+jsLtQjfz/UaPTuRmZGQtDejm9jRB0e7U/PWYrT0WO/XP81pHMR/UjwWtx9nO050imGTMDOZYv4xHYQuOWMzQsl5iSHmEB8yJTlYdu1pMGY3a/cTgo3Y46b1htv9lALBOFjKqSVVeqV0LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3L2wP57; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3L2wP57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719487892; x=1751023892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Ej/EuTdRgA8+eq7eLUCqLCSDmSfe6lTfRipnyZy1cI=;
  b=g3L2wP57AxFELLzwO3mLptR7EltMqlqFgQtVetfB2H2sk7/hPyc4IHHC
   zskKNEvcJUET9aAf2S0cQqAZtIPvBkHupX7Gv0Ou6+mxwTDiFB/7thGSw
   debV3KnQ34csBcHl2UP9Vu1qi1L502qtnMbTIr/tWN1M3sESCC+bIzlXi
   au6R/b1Iia77gRtAl8LeaPKeqCt3Uf4BXUhscKgm2Nf0pLEPXeFv+/Mcc
   tP4cZ977k2d7xKb7B829/GW+MQbpeL75YN5ZaM7apfPCxpE+Wg9E18KCI
   7axDa/Ibm9JS5bprIS1hsAj6wQps2VvT1hd3VQ2L4fXT3a9eP+HKW9veG
   A==;
X-CSE-ConnectionGUID: 4yq8tgzTREiycjRqlIv5tA==
X-CSE-MsgGUID: e0RPqLAoRjGPGjTKKsJRxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27197993"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="27197993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 04:31:29 -0700
X-CSE-ConnectionGUID: RM1mPVH7TcOkdn0S4IOU9w==
X-CSE-MsgGUID: qXJASOe3SdWSnP3+tPE2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="75100424"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2024 04:31:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMnLZ-000GA0-0A;
	Thu, 27 Jun 2024 11:31:25 +0000
Date: Thu, 27 Jun 2024 19:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 35/42]
 fs/ntfs3/frecord.c:1934:16: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202406271920.hndE8N6D-lkp@intel.com>
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
config: nios2-randconfig-r111-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271920.hndE8N6D-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406271920.hndE8N6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271920.hndE8N6D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/frecord.c:1934:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *d @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1934:16: sparse:     expected void *d
   fs/ntfs3/frecord.c:1934:16: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
   fs/ntfs3/frecord.c:2011:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct fiemap_extent [noderef] __user *fi_extents_start @@     got struct fiemap_extent *[assigned] fe_k @@
   fs/ntfs3/frecord.c:2011:35: sparse:     expected struct fiemap_extent [noderef] __user *fi_extents_start
   fs/ntfs3/frecord.c:2011:35: sparse:     got struct fiemap_extent *[assigned] fe_k
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
