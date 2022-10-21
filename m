Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493417D7
	for <ntfs3@lists.linux.dev>; Fri, 21 Oct 2022 05:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666329213; x=1697865213;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tSgW7eWdGSIprhy1GtLWEOVyBo94BWT87FvHLv7N54g=;
  b=kkXnWFvevtPGdYmlYkX/1evyHO4yTv+tBofTewqjH9THX+t7hj1pAdMt
   AXcLyCj5disDbLiVkOaLbI4+DY/CeI+M+aeesOMlECuusVAZo7+Xdgkv2
   VQrvaGOROhIYyEtmbIWzGbo32+tEqCN5sYI78yJL+Z3CKwmrRpjTdCdt/
   LF2BBtei0IZlIy/O6vXiCZHkLQ/DUMQvkMQrxL67MsNo3UHLeqC0PoAgK
   sIaSEbAgg7AKWnvOLxy8HMXkimkNFQl87iEiz0yw+bQ4zgqVqpsLSkNmG
   YgatWJJHCQze8hFmdd5YWIYzXUl03sSOsfKlPaQeD/rFXKmA2X8btmcb1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="333485792"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="333485792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 22:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="625138409"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="625138409"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2022 22:13:28 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1olkLX-0002DY-1V;
	Fri, 21 Oct 2022 05:13:27 +0000
Date: Fri, 21 Oct 2022 13:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ntfs3@lists.linux.dev, linux-parisc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 acee3e83b493505058d1e48fce167f623dac1a05
Message-ID: <63522a57.pwxlK8v2/w+DMFI9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: acee3e83b493505058d1e48fce167f623dac1a05  Add linux-next specific files for 20221020

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
arch/parisc/kernel/drivers.c:337 print_hwpath() warn: impossible condition '(path->bc[i] == -1) => (0-255 == (-1))'
arch/parisc/kernel/drivers.c:410 setup_bus_id() warn: impossible condition '(path.bc[i] == -1) => (0-255 == (-1))'
arch/parisc/kernel/drivers.c:486 create_parisc_device() warn: impossible condition '(modpath->bc[i] == -1) => (0-255 == (-1))'
arch/parisc/kernel/drivers.c:759 hwpath_to_device() warn: impossible condition '(modpath->bc[i] == -1) => (0-255 == (-1))'
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a005
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a012
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a014
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a016
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- parisc-randconfig-m041-20221019
|   |-- arch-parisc-kernel-drivers.c-create_parisc_device()-warn:impossible-condition-(modpath-bc-i-)-(-)
|   |-- arch-parisc-kernel-drivers.c-hwpath_to_device()-warn:impossible-condition-(modpath-bc-i-)-(-)
|   |-- arch-parisc-kernel-drivers.c-print_hwpath()-warn:impossible-condition-(path-bc-i-)-(-)
|   `-- arch-parisc-kernel-drivers.c-setup_bus_id()-warn:impossible-condition-(path.bc-i-)-(-)
|-- s390-allmodconfig
|   |-- ERROR:devm_ioremap_resource-drivers-dma-idma64.ko-undefined
|   `-- ERROR:devm_ioremap_resource-drivers-dma-qcom-hdma.ko-undefined
|-- x86_64-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a002
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a006
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a011
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-a015
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-randconfig-m001
|   `-- arch-x86-kernel-apic-apic.c-generic_processor_info()-warn:always-true-condition-(num_processors-()-)-(-u32max-)
|-- x86_64-rhel-8.3
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-func
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-kselftests
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-kunit
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- x86_64-rhel-8.3-kvm
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
`-- x86_64-rhel-8.3-syz
    `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
clang_recent_errors
|-- arm-mmp2_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm-s3c2410_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm64-randconfig-r013-20221019
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r006-20221019
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r041-20221019
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r045-20221019
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- i386-randconfig-a002
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a004
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a011
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a013
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a015
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- powerpc-allmodconfig
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- powerpc-mpc512x_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- s390-randconfig-r044-20221019
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a005
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true

elapsed time: 1482m

configs tested: 74
configs skipped: 3

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a001
x86_64                              defconfig
i386                          randconfig-a003
x86_64                           rhel-8.3-syz
alpha                               defconfig
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
i386                          randconfig-a005
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                               rhel-8.3
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64                           allyesconfig
s390                                defconfig
arc                  randconfig-r043-20221019
m68k                             allmodconfig
x86_64                        randconfig-a004
s390                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                                defconfig
x86_64                        randconfig-a013
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a015
i386                          randconfig-a016
x86_64                        randconfig-a011
arm                              allyesconfig
arm64                            allyesconfig
xtensa                    smp_lx200_defconfig
mips                         db1xxx_defconfig
arc                        vdk_hs38_defconfig
powerpc                      ppc40x_defconfig
sh                           se7712_defconfig
m68k                         apollo_defconfig
loongarch                           defconfig
nios2                         10m50_defconfig
sh                           se7343_defconfig
sh                           se7750_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
riscv                randconfig-r042-20221019
hexagon              randconfig-r045-20221019
hexagon              randconfig-r041-20221019
x86_64                        randconfig-a005
s390                 randconfig-r044-20221019
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                          rhel-8.3-rust
i386                          randconfig-a015
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
arm                       mainstone_defconfig
powerpc                      obs600_defconfig
arm                            mmp2_defconfig
mips                           ip28_defconfig
s390                             alldefconfig
arm                         s3c2410_defconfig
powerpc                     mpc512x_defconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
