Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069415A8;
	Thu,  7 Dec 2023 02:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeEP4NeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701915718; x=1733451718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVxqwVKm+s2FEqwljT9eCIw46L09zJIYReaXbSqLTGM=;
  b=JeEP4NeRVKmsPYB+G7ZjqsN3db4aUsl9JbIPfYsJg+r/R3HDOaynUU9N
   6WdnRMSkWNpTqwN70ohO1TXVLt1fiTAqOW693p3A1CLXrEs3mhNigo62o
   WthuaVZuGUfVbjhCgtrd3HnUjiwYnRdHJOmv4E3TBOVkWAI0RDJkdeamT
   zOOOEexiYwJmDfryemlagxEdGcVFgHeCMQ0IjIUXJiPMugM454qqxyYn3
   /b8BgzlWC90lHBmiX4RBzTOF/u6Y8f+6gmRlweVQYNGeIlYbiuV5eqz0w
   q6J5OumO0X0teQjYps9b0RieaVlmkRW7JksnCqwMgzxbupn9AmASm2xJq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425313356"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="425313356"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 18:21:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915399127"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="915399127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2023 18:21:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB41Q-000Bik-0w;
	Thu, 07 Dec 2023 02:21:52 +0000
Date: Thu, 7 Dec 2023 10:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 8/16]
 include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct ATTR_LIST_ENTRY) == 0x20"
Message-ID: <202312071005.g6YrbaIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   652483bfbc45137e8dce556c9ddbd4458dad4452
commit: d155617006ebc172a80d3eb013c4b867f9a8ada4 [8/16] fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312071005.g6YrbaIe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312071005.g6YrbaIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312071005.g6YrbaIe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ntfs3/attrib.c:9:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct ATTR_LIST_ENTRY) == 0x20"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/ntfs3/ntfs.h:530:1: note: in expansion of macro 'static_assert'
     530 | static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
