Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007E3542F8
	for <ntfs3@lists.linux.dev>; Wed, 27 May 2026 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878280; cv=fail; b=s0LIsaSvO+JEMTejmBiZBtpypN3V+BeUz0LWfvuJKAvNlW51o49sSEi7lOC7APbiIRQOGJMcaPJA8/brnfO2M/6s1C7wtSqwFZwajMv4LEkSuFJOml8rS9JSu6wPVopTmO/l4UxG8abzSv2Ugzlchv/BOpJLBLZUcG+Dab965Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878280; c=relaxed/simple;
	bh=y3DOYNDJ4NJcJEy1KNFjYyAEq0m6P6KDv6zqAqytqc0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QDtZ2MpzBegD11hzUt5kNhcxQNiHD9Vmu7B9Uh+X8dykAwFjG0p+lnOWvj5UOpGyoYk9KBpRSlFtkqyV+HHCQOmiHpMX7UVjdKS7LmBiYu6qjXZ/Gx641TUe6sup3KT6Wx6HN4Ex/mLRLAHmXPk0fbLTM4vT78Erty1mSgmg9Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=vgsvjLb9; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="vgsvjLb9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCuH/VU2JtU/BE1ux5G1a91J3FyZkAxID96aRaUYj9Q/5yPWzh9I4hBQvwvnbOPJOCGz98kCRk7rP+3j//tvRLayHfO432xiTjMcBnhjLn+skmQlqcTg83gNa5ekmgGclcysDeX3Y7WdukhieqxNi8olnxUMu8wmOXDwZs4RNKlrxVxBNfWh3H8eNkTll9DfhZJbvKBtxIxQJ95aNYw/pMlNFZRWQWIj505QQ6SZWqjlbDknOIdxsxWsG5EtTcUu9SDfzh4WiksQHC/JsuLZJBkFfbzwe/9QxSXQfGkb3Eva1xObSN5IlyVorMj6lfc0cfvSTom6KZLPfQVcdjlYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0MdmBPepim0Ku393MaCH66NiH4AP5WCFzVmdX68rRQ=;
 b=BmWEIuWxXmMeh2RhV5oi1AUXpLu35aM1zwdSTyeKIKl+/Jm+bg8M33lj95/LpiZXto/qnD0UAE7qPBNzuLf3rcRR2NhY/3KZfsK4auNiRwzHRdu3/ip+++pT6ObVl4F6DuvOLJdReGszT3ESW50upg8XJDCKJzVcM28/H5d48IIknxfEuQTiE2Vd1kqZEMuoY1qhNjhFYbT5V+h2RE3Y5es1v7URqndvR8bCX1JldXiWNwNF/UhS2somqL7SQQm1wSbT2sj7DO/LSkP4iPZ0Ccgdn6jmrpdIs0/KfbJ1T+lzf7cYfHOIfOic/fM8TIWAY2fhPg8/02sqH96dBlk/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=paragon-software.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0MdmBPepim0Ku393MaCH66NiH4AP5WCFzVmdX68rRQ=;
 b=vgsvjLb9OOkI+craStLxRtKD3+mbO5Ix/bUExIJuy/R0zdEpmxPhxCJne0hEGKmTn7aHvzRMJbsFkdhMYnaWX0coE5pGvCMRa8FsCq/LV9oNVgEyUlqPi2GHjK8z/tAjIX4bUJX9S2VnsD2lS0EW9h2Ih8m63m6X1Ow4CqRPoX3COCdei73taTF/XsSVVn/hhlHamlqeKM/Z5fS1jpG7GirtDs4L9rUtwZdbLTBlXXmLvoR29rF0Y7RYF6ut3k/L1xSE6St+rOtRZBRzHOpy0IhwvQy2Fmow2P8e+jaKoryOTLRnQAOm/o7BnjMowHg0yoKfhX7izFQSTV4esTB0sQ==
Received: from DUZPR01CA0284.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::22) by VI0PR10MB9056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:233::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 10:37:50 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::e) by DUZPR01CA0284.outlook.office365.com
 (2603:10a6:10:4b7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 10:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 10:37:50 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:37:48 +0200
Received: from [10.34.218.123] (10.34.218.123) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:37:48 +0200
Message-ID: <ddb3ba4f-6c62-4775-a2d6-ab443d126ca1@de.bosch.com>
Date: Wed, 27 May 2026 12:37:48 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ntfs3: Use after free race condition in ntfs_read_folio()?
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	<ntfs3@lists.linux.dev>
CC: <Antony.Ambrose@in.bosch.com>, "Huang Weiliang (XC-CP/ECC2.3)"
	<Weller.HUANG@us.bosch.com>
References: <7b82c995-a469-4e9c-98cd-4424285310aa@de.bosch.com>
Content-Language: en-GB
In-Reply-To: <7b82c995-a469-4e9c-98cd-4424285310aa@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C4:EE_|VI0PR10MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: de9fab8e-0a52-4c92-1d8f-08debbdc0024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|5023799004|11063799006|6133799003|3023799007|18002099003|56012099006|13003099007|22082099003;
X-Microsoft-Antispam-Message-Info:
	5I6Ksl4JqEdvdGS0XemIC8m7jAAqWhrLVqPISDp7JXrVs8KM5cIn0Czn2PhhqKi+GUnzRGt4+FD6RjtbHUftIYMQJfm7XigtwPnCHl5lL2kqAVG0r4vkFBDCXQU/b3F1BunKChrSUvQkKJSL8HXWPsanvTVSHC3FSaOJ0fua7EHX4JdX9hNBl3kl9rPBn0LpFz/TQUlSNDp5ifQcD8uG8TGHhC7dBvD3GRFDP/Y/f4if3OqJ/TkxMyGfm33RqJkEdXhuzxdeGHjvWic4epZedGeLv5iwvR5kIbPwDN8TUwithmVzgDMfZ3ebIfh+z3tGVT4MFWS2ARCxEXzwSsWpmjz7V+un1QUcSKmgue5fphXrS8WpwbpfIiFlG0Ajef8ogzbSJCCeukIRsYPTncH03Zbr7Fifp+aJZ87NssK9I2OE4UNUGVCxkuzOZfPk2QTfTl3amvpHznoIUmzNdu1JgsQB9sh2R+kfVUHGqtpOfbDojmUYmzy8W7sOb/PDyyNjuxNJcYzbhZntJCF41/vFCFVbkT4O6hKbyItZ9LvgCC3Rpq6ow8+RNQLvrPKTXh3etFJg0b4HBwq+R6YvRmWrW59VaHYPG9vwmHs/2ZC4xHw/SbveHWbWiPWrHLkQgWtpmClVdJWq82EdDY3tXYK+P41ssNA+t3QSwKj7iV7F0ZkDPtTgprEJh6inLoux6mvC
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(5023799004)(11063799006)(6133799003)(3023799007)(18002099003)(56012099006)(13003099007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XfkgpGKe7xoi3uY2EZlwVcZJgDRumyQFN9DLRSiBeWCsxGkASn+u5EZuIAn+C7ySP88KFE2FZG5/3XjutTa4c5qn1WnER7oQXbhrPqS0mcotx8RrBgGiDar4Ha7VTDlVD/QXYJMU0+iS2dFNO4qcltRhe2xFQTn3nlhCNMhFeuAkbc9OVywXu/M6fQn4B1/6sRNhdCk2D/xQJ9XRapTWxc5Suna0IkdecIqC1eEf5ZfBJ52PVcdwBN/6BxtyVnOYxFPMCkDJgVRiZu/zxtcpDLMNWrZN4sJZAWTUGTlNLo9aYM/Fn6zh+Y3ya5Jw/YBoo6hBItbbvHwmS6ewPwFkY9ge1J4XooCoLijyb2uXPSvyWMijYwvqjGuZVmvrP2Lju7fT5lluXZZFhpXzL8G1RQcT7/pePJn0RFMB4qBAysZbuZDTd2TIE/MJS4EB3f3b
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:37:50.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de9fab8e-0a52-4c92-1d8f-08debbdc0024
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9056

On 27.05.2026 06:34, Dirk Behme wrote:
> Hi,
> 
> on a custom ARM64 board with kernel 6.1.157 we got a report about a data 
> abort Oops [1] in ntfs_read_folio() [2]. The disassembly is [3].
> 
> Analysing this the failing instruction is
> 
> 385f82e8     ldurb    w8, [x23, #-8]
> 
> with x23: ffff8d623ef35800 - 8 matching the fault address ffff8d623ef357f8.
> 
> Matching this to the C code we think the compiler summarises
> 
> struct ntfs_inode *ni = ntfs_i(inode);
> if (is_resident(ni)) {
> 
> to one assembly instruction to access the ni_flags in struct ntfs_inode 
> via the inode [4].
> 
> Getting a data abort trying to access the ni_flags, we assume that the 
> whole struct ntfs_inode has been freed, already. While missing to 
> reset / clear some reference to it. What in sum looks like a use after 
> free race condition accessing struct ntfs_inode in ntfs_read_folio().
> 
> We have searched for something obvious in more recent commits but 
> couldn't find anything what looks related. Have we missed anything?
> 
> What do you think? Any idea?
> 
> Thanks
> 
> Dirk
> 
> [1]
> 
> Unable to handle kernel paging request at virtual address ffff8d623ef357f8
> Mem abort info:
>    ESR = 0x0000000096000004
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x04: level 0 translation fault
> Data abort info:
>    ISV = 0, ISS = 0x00000004
>    CM = 0, WnR = 0
> [ffff8d623ef357f8] address between user and kernel address ranges
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in: ... ntfs3 ...
> CPU: 3 PID: 9611 Comm: binder:529_A Tainted: G           O       6.1.157 #1
> Hardware name: ARM64 custom board
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : ntfs_read_folio+0x24/0xe0 [ntfs3]
> lr : filemap_read_folio+0x6c/0x15c
> sp : ffffffc01c05bad0
> x29: ffffffc01c05bad0 x28: 00000000fffffa00 x27: 0000000000080001
> x26: 00000000ffffffff x25: ff00000000000000 x24: ffffff8d623ef4e8
> x23: ffff8d623ef35800 x22: 0000000000000000 x21: ffffffc001591414
> x20: fffffffe378c42c0 x19: fffffffe378c42c0 x18: ffffffc0109a0080
> x17: 000000001b98ee9a x16: 000000001b98ee9a x15: ffffffc00158ed90
> x14: 0000000000000007 x13: 000000000001d3a2 x12: ffffffce57fbe000
> x11: 0000000000000001 x10: 0000000000000001 x9 : 0000000000000100
> x8 : ffffff8d623ef4e7 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffffff8ca937808c x4 : ffffffc01c05bb50 x3 : 0000000006100cca
> x2 : fffffffe378c42c0 x1 : fffffffe378c42c0 x0 : 0000000000000000
> Call trace:
>   ntfs_read_folio+0x24/0xe0 [ntfs3]
>   filemap_read_folio+0x6c/0x15c
>   do_read_cache_folio+0x144/0x338
>   read_cache_page+0x1c/0x58
>   ntfs_fill_super+0xde8/0xf20 [ntfs3]
>   get_tree_bdev+0x1c4/0x258
>   ntfs_fs_get_tree+0x18/0x28 [ntfs3]
>   vfs_get_tree+0x48/0xfc
>   do_new_mount+0x154/0x36c
>   path_mount+0x270/0x4e4
>   __arm64_sys_mount+0x1b4/0x3dc
>   invoke_syscall+0x58/0x118
>   el0_svc_common+0xb4/0xf4
>   do_el0_svc+0x24/0x80
>   el0_svc+0x2c/0x90
>   el0t_64_sync_handler+0x68/0xb4
>   el0t_64_sync+0x1a4/0x1a8
> Code: 910003fd f9400c28 aa0103f3 f9400117 (385f82e8)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops: Fatal exception
> SMP: stopping secondary CPUs
> 
> [2]
> 
> static int ntfs_read_folio(struct file *file, struct folio *folio)
> {
>      struct page *page = &folio->page;
>      int err;
>      struct address_space *mapping = page->mapping;
>      struct inode *inode = mapping->host;
>      struct ntfs_inode *ni = ntfs_i(inode);
> 
>      if (is_resident(ni)) {
>          ni_lock(ni);
>          err = attr_data_read_resident(ni, page);
>          ni_unlock(ni);
>          if (err != E_NTFS_NONRESIDENT) {
>              unlock_page(page);
>              return err;
>          }
>      }
> 
>      if (is_compressed(ni)) {
>          ni_lock(ni);
>          err = ni_readpage_cmpr(ni, page);
>          ni_unlock(ni);
>          return err;
>      }
> 
>      /* Normal + sparse files. */
>      return mpage_read_folio(folio, ntfs_get_block);
> }
> 
> [3]
> 
> 000000000001e934 <ntfs_read_folio>:
>     1e934:    d503233f     paciasp
>     1e938:    a9bc7bfd     stp    x29, x30, [sp, #-64]!
>     1e93c:    f9000bf7     str    x23, [sp, #16]
>     1e940:    a90257f6     stp    x22, x21, [sp, #32]
>     1e944:    a9034ff4     stp    x20, x19, [sp, #48]
>     1e948:    910003fd     mov    x29, sp
>     1e94c:    f9400c28     ldr    x8, [x1, #24]
>     1e950:    aa0103f3     mov    x19, x1
>     1e954:    f9400117     ldr    x23, [x8]
>     1e958:    385f82e8     ldurb    w8, [x23, #-8]
> 
> [4]
> 
> struct ntfs_inode {
>      ....
> 
>      size_t ni_flags; // NI_FLAG_XXX
> 
>      struct inode vfs_inode;
> };

I just learned that this is the same topic as the previously sent

https://lore.kernel.org/ntfs3/PAVPR10MB71635C5EF1E4FED2FF9C8107B60A2@PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM/

Sorry for sending it twice!

An additional observation is

x8 : ffffff8d623ef4e7

being unaligned. Assuming that this is

struct address_space *mapping = page->mapping

we wonder if we are talking about a broken *mapping instead of a use 
after free we assumed initially above.

Sorry again for sending two times,

Dirk




