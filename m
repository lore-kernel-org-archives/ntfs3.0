Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BE3FF890;
	Wed,  8 Jul 2026 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498593; cv=none; b=lsFzyW4v1PJKDkL4DFMIPkc1SOZcFmWTC5lRBiN1ProtUKsYItO+XfA+mWxhb+YPY0wK/MvfkP5hoyH0lbjfBwN8NBz+G1m9Nf2ivDMDQ3yK7+RM4SyLj7a5pawgmXDHTP0cjUzO/UOCHfqs4UPJAEFMYlG1QVahgFEsLNj40bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498593; c=relaxed/simple;
	bh=rDGnNy2GIUC166rIAQADIBqQo88D0BD4tSEmZGUtXT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WARQ8ryo0MyMlUTUPJsx43nj87LCDJc6v4L8kN19RJC9AaN2kasddyBsoMYGjmhIGgdADerM53qDvft8DBc2d4CDnEQXjIosuGZgvJ0yCN7koz0Cr8ZegEPQ30FewuWkJjcZIhKXPOBW/1SjYmk2H8PreMUMKaWJ44TgGwpf1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIbya93J; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIbya93J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783498591; x=1815034591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rDGnNy2GIUC166rIAQADIBqQo88D0BD4tSEmZGUtXT4=;
  b=EIbya93JCBM9TZQKSNyioramFITSK4zwcUm9f8eNWW2jT6eyZwf7g5Xa
   QA5Va5kFCfTWtIgApJ2crUp4Gzx3GaV8H25TgysHHCzO9bHSTryYSx2FD
   brZPri+aGKMNmZ6JM4NaYtnqNlGpnOX1rZVQ9mn4ZgPXqO8532BRUCrUS
   jnz5QMDWJmwJoXTWNJLAKbjAhENmr8aEQppzIjQRa4ROljbInHvtJURdg
   TyyM0fUKYcctJoWtr0kHUvs8Bc0f8BAP2296T3zc/ZmoRDskZCVDaDUcp
   TvgKXlCNAvoAZxRagJkaKtsMM4NADc/euACC9GFqfPjW25kySjw1ny98L
   g==;
X-CSE-ConnectionGUID: oj+iv57GTBWkFBNZzGPGaA==
X-CSE-MsgGUID: OhR2BusCQMunn/z8FdDBzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95311713"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95311713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:16:15 -0700
X-CSE-ConnectionGUID: CFGTGHLHSGu5CTdQcmPV9w==
X-CSE-MsgGUID: xzHaRxEZTZWZqSEtUP53zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250868959"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2026 01:16:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whNRp-00000000G9r-1a8o;
	Wed, 08 Jul 2026 08:16:03 +0000
Date: Wed, 8 Jul 2026 16:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandro =?iso-8859-1?Q?Cal=F2?= <alexandro.calo@nozominetworks.com>,
	"almaz.alexandrovich@paragon-software.com" <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>
Subject: Re: [PATCH] fs/ntfs3: Fix OOB write if ret == buf_len in
 ntfs_utf16_to_nls()
Message-ID: <202607081615.v0kQjQMH-lkp@intel.com>
References: <3EFE7695-DA5B-4A28-8E39-4853BBA784FC@nozominetworks.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3EFE7695-DA5B-4A28-8E39-4853BBA784FC@nozominetworks.com>

Hi Alexandro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandro-Cal/fs-ntfs3-Fix-OOB-write-if-ret-buf_len-in-ntfs_utf16_to_nls/20260708-001557
base:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
patch link:    https://lore.kernel.org/r/3EFE7695-DA5B-4A28-8E39-4853BBA784FC%40nozominetworks.com
patch subject: [PATCH] fs/ntfs3: Fix OOB write if ret == buf_len in ntfs_utf16_to_nls()
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260708/202607081615.v0kQjQMH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081615.v0kQjQMH-lkp@intel.com/

smatch warnings:
fs/ntfs3/dir.c:32 ntfs_utf16_to_nls() warn: inconsistent indenting

vim +32 fs/ntfs3/dir.c

    17	
    18	/* Convert little endian UTF-16 to NLS string. */
    19	int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
    20			      u8 *buf, int buf_len)
    21	{
    22		int ret, warn;
    23		u8 *op;
    24		struct nls_table *nls = sbi->options->nls;
    25	
    26		static_assert(sizeof(wchar_t) == sizeof(__le16));
    27	
    28		if (!nls) {
    29			/* UTF-16 -> UTF-8 */
    30			ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
    31					      buf, buf_len);
  > 32	        if (ret >= buf_len) {
    33	            ret = buf_len-1;
    34	        }
    35			buf[ret] = '\0';
    36			return ret;
    37		}
    38	
    39		op = buf;
    40		warn = 0;
    41	
    42		while (len--) {
    43			u16 ec;
    44			int charlen;
    45			char dump[5];
    46	
    47			if (buf_len < NLS_MAX_CHARSET_SIZE) {
    48				ntfs_warn(sbi->sb,
    49					  "filename was truncated while converting.");
    50				break;
    51			}
    52	
    53			ec = le16_to_cpu(*name++);
    54			charlen = nls->uni2char(ec, op, buf_len);
    55	
    56			if (charlen > 0) {
    57				op += charlen;
    58				buf_len -= charlen;
    59				continue;
    60			}
    61	
    62			*op++ = '_';
    63			buf_len -= 1;
    64			if (warn)
    65				continue;
    66	
    67			warn = 1;
    68			hex_byte_pack(&dump[0], ec >> 8);
    69			hex_byte_pack(&dump[2], ec);
    70			dump[4] = 0;
    71	
    72			ntfs_err(sbi->sb, "failed to convert \"%s\" to %s", dump,
    73				 nls->charset);
    74		}
    75	
    76		*op = '\0';
    77		return op - buf;
    78	}
    79	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
