Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE93C29
	for <ntfs3@lists.linux.dev>; Thu, 13 Oct 2022 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665678040; x=1697214040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JdM6fRjtfQFPJ08asGi0OyQ7Kn3mWk6zXePhD5kQRm0=;
  b=Hs4cGUKLWg3P7EZxDJO7OE8JArVzSpIec8Jv20aMYnKmrCrtofjzfaDR
   Z+BO4TCn1ejxq7ag1Jki7yssiraHYGR43VgfDfzkdJIFPL4ynLFvEBBSL
   v6o5BPK6S2HU4yaGOC/bNQksMurAvOBga57ZuMJQ9MxS1Hpcw2PWnDMoP
   HZXWe5I84O4wtP6Ba9WRT3Xxv7MKMef7QJoQbywDq9Nd35O1i1mHitvJh
   JBgfJ8tTOpu3EZRg/EGTrm5mLWbj5Yj14HbhjBZiDKp/QhgUjbPmxO+eE
   Tigbgz/nrfmb7RMcJv+SojZalRlj51JtRSzb5/j9T/+SX7DlNjPG/1hec
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="284855074"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="284855074"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 09:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="752581669"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="752581669"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2022 09:16:34 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj0sr-0005L8-14;
	Thu, 13 Oct 2022 16:16:33 +0000
Date: Fri, 14 Oct 2022 00:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ntfs3@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org,
 linux-ext4@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 56e8142dda103af35e1a47e560517dce355ac001
Message-ID: <634839db.CE/+5MHDyt/TjFSC%lkp@intel.com>
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
branch HEAD: 56e8142dda103af35e1a47e560517dce355ac001  Add linux-next specific files for 20221013

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
mm/mmap.c:802 __vma_adjust() error: uninitialized symbol 'next_next'.
vcpu.c:(.text+0xc56): undefined reference to `riscv_cbom_block_size'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-s051-20221012
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- arm64-alldefconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
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
|-- i386-randconfig-c021
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-m021
|   `-- mm-mmap.c-__vma_adjust()-error:uninitialized-symbol-next_next-.
|-- microblaze-randconfig-s033-20221012
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- riscv-randconfig-r016-20221012
|   `-- vcpu.c:(.text):undefined-reference-to-riscv_cbom_block_size
|-- s390-allmodconfig
|   |-- ERROR:devm_ioremap_resource-drivers-dma-fsl-edma.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-idma64.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-qcom-hdma.ko-undefined
|   |-- ERROR:devm_memremap-drivers-misc-open-dice.ko-undefined
clang_recent_errors
|-- arm64-buildonly-randconfig-r002-20221012
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|-- hexagon-randconfig-r032-20221012
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r041-20221012
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r045-20221012
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
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
|-- powerpc-mpc832x_rdb_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- riscv-randconfig-r001-20221012
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a005
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a012
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a014
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
`-- x86_64-rhel-8.3-rust
    `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg

elapsed time: 725m

configs tested: 83
configs skipped: 3

gcc tested configs:
riscv                randconfig-r042-20221012
arc                  randconfig-r043-20221012
s390                 randconfig-r044-20221012
arc                                 defconfig
alpha                               defconfig
x86_64                        randconfig-a004
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
alpha                             allnoconfig
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
arm                                 defconfig
riscv                             allnoconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
s390                                defconfig
csky                              allnoconfig
i386                          randconfig-a014
i386                          randconfig-a001
powerpc                           allnoconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
i386                          randconfig-a003
x86_64                        randconfig-a015
arc                               allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a005
i386                             allyesconfig
i386                          randconfig-a016
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
sh                               allmodconfig
powerpc                      cm5200_defconfig
arm                              allyesconfig
arc                        nsimosci_defconfig
arm64                            allyesconfig
sh                            hp6xx_defconfig
m68k                          amiga_defconfig
powerpc                   currituck_defconfig
m68k                       bvme6000_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                        generic_defconfig
arc                 nsimosci_hs_smp_defconfig
arm64                            alldefconfig
powerpc                     tqm8541_defconfig
xtensa                    smp_lx200_defconfig
sh                        edosk7705_defconfig

clang tested configs:
hexagon              randconfig-r045-20221012
hexagon              randconfig-r041-20221012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a014
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
mips                   sb1250_swarm_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64                          rhel-8.3-rust
powerpc                      walnut_defconfig
arm                         hackkit_defconfig
arm                         lpc32xx_defconfig
arm                      pxa255-idp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
