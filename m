Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB67518B0F
	for <ntfs3@lists.linux.dev>; Wed, 27 May 2026 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779856490; cv=fail; b=DfUe30cABWvuO3ovbGgT+2LW6k7ThSDe4cq/4cnmY71kYkFjTKcPieODI1G32XT6jw9hWKzspSDuJc2x3ZmNV6ZKEvfgALxZkidhKYLDrCiXaRUdbUzDW4375jPcpBV1yOlhHLyr/UrIH+Fb6Ukt5GLb75nrb6RMWmgwgA/Hh3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779856490; c=relaxed/simple;
	bh=MfvUcdHzNrEf5tzuooSj1P8O6sz3zB5GrMkOSopaFTA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:Content-Type; b=rPPw5kpX0QdDtfnn5drY/xa/vVlz0oKUaUQgsfa0ckB6mxUEueBGkWxjdr22zLddwtUkyHciUcPcO2PNz5oNObvLQMHHUkKVxCHbtRRo8DvS71sdQXARF+XBt5rX/OrF+I5Mk/87GpcfxKZ2G++uKuZI6wfYGHW+81h1FgFkEfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=dog1lKg1; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="dog1lKg1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+nXQ/WLFmBfBqcsxKAfTylSA4CRx7E8QLnWYjiDKLclaeHHt5tf1sXBIwQCEwdyqlUuZ9J5hkDGNAYAUXcIw2JPGPkIWc+w+TAt54D7HDsTb7Ojgryr/04sJA6ZVAUUCNGotq/sY/sZbakGmlORjKWJbxh++n6RETX/vXTBnt+LNvp3YUtC9WFqG3qvozZmCOt+LSaGn3JOE/TWaZrRlp9x4jFNpp5UCegIox6ll2CaQ6DjDXqFHQ2O+Viq0+yH2dFXR2z2Ydfk8dnQYEWZTj9R3FQ+ByXmKVYAonfP2fbs8YDMYxmlDY5EQi2lOhOM98R1Fh4LHKDhR/LgOj9SOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F17fYE2PxZ0ugDuwO+sfjtfgrE0d9PJZGHGSyaNlfho=;
 b=R2cxGLHtbmsYFcMGOq2ZBAPP89ZQeu01WF0SZvwmLGpEhoomb5kOoWhSDwOylKUGgqWGM44FrwMUmjaR2xVdOYMIMteeXStaaBfI8mHRc3KGpxV0tNZSUVKNvI8wY+C45ygjf1Ajbk+QkRwUTcvTuywdLX+3rLuHiPSgvxkSTa/6l3FbWrgQXTSUzlZAbdnp/w9Yg8HXinALMknA2h6ljTSc1hES9t3TTjyFrK136Wct9cCPiKzPmKS15MK//2/gbQLwmzJP7NK6dGqusN5GX1SbxyqKkF/6DNXg4T4zH1IvRv0zzLK067RiEiqZgPkErH8BYozE4tXHtBYbY5CkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=paragon-software.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F17fYE2PxZ0ugDuwO+sfjtfgrE0d9PJZGHGSyaNlfho=;
 b=dog1lKg1QatviGut/nNiEqSBSEv4Ppuv9Irh+dWgqXfnN5BYEkY80ZavxVjKIKbuf16f4zC7oii9D5Mo6xhy3PMUr4qRp3fpFonBu+fYAAkIRBQ5WBSzhZov+6PtxqQ6wR+8Gd0TDfyawvPkJEWuyu7j6JZgxA3gaxeWT4C5XIe8P1VazK9wTwiXT+Hp9kWtkb3H4yVA+MAeYS0NL9FEzdo7ah8gkOU0f4y+AwZzvVjnS8RcEiglVaHeZwf7CB/UdoUnp5phasHd7/Y2g+MdV8Ev7yaDDBqEbtGIHkJZ+72mV9Rl1UO6VOuOaE4Dz+KVif5BRdTmiEcqJU3rYpl6Yg==
Received: from CWLP123CA0102.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::18)
 by VI0PR10MB8865.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 04:34:44 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:401:5f:cafe::20) by CWLP123CA0102.outlook.office365.com
 (2603:10a6:401:5f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 04:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 27 May 2026 04:34:44 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 06:34:37 +0200
Received: from [10.34.218.123] (10.34.218.123) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 06:34:36 +0200
Message-ID: <7b82c995-a469-4e9c-98cd-4424285310aa@de.bosch.com>
Date: Wed, 27 May 2026 06:34:30 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: ntfs3: Use after free race condition in ntfs_read_folio()?
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	<ntfs3@lists.linux.dev>
CC: <Antony.Ambrose@in.bosch.com>
Content-Language: en-GB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|VI0PR10MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 011e0f20-94c5-40a0-90ff-08debba94696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|5023799004|11063799006|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	jFcDE0ZBlUePDwpn0nWu0WklQiD9NnSTlr3LD0T4DPDZlR1s+ES8Ga31F3eDrKw+J5lsvqXKLRCkQcPC8zB7wefqhoxhT37JY+mXXgW6acvX2yNQm8XNNiTwCMhs6VqEv19RrC4yGUZxca1w/QV4p8t/ZAqG3xzwQ5T4qHCnSvREjXPNvX31fYsQtftviy6cxHOQNsWgifmpklCERTQw5HCEmuluCI05ikybMMS+IyE0YzDk1wUN5zj8BXDWJ3eQCUGMERVoHynsUbK7D+Y4d46G2GwA+pTOnEyjWzvHybV6tEv155LOD5snrbhKWcuY0CTzkBGNi7TdBlt+6GeenWhaNmVx4iHuN2IMz5IxWU9AIRxKbQJkSA80co3MRMj7hXdWnHkBvylPf0ZbTb1TTngOafuRKc23lIzylEDqCg+40BLh2RqaytiC7bQuZmaBHNtnf52WubOaGgSQ1hE36q7bs12XUhZQTtUNZjjqOA+RyUrO2k9qioEqOf96pgi4VlUzU6pv/kNtUGHWA28IH1z0kz3EwyIHhCKMh+UeFqGg5BWvVyL902djFX3x9VLDthpTk9LrRfRVFvZtY+yv4cjIHUrBspifA8H1JYDiX/CtzPUpWdR8A6U4tyGKAIY4OVnYe8CqULDELO0ueoGJ0Fei8ZhrO4BdEXhzeRb9Nss3hoe/IpzlNd6gTWSlsSge39BMipwOtuQy0ldqzMEaRrMi+qiBlXlV0QCcq06wdIQ=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(5023799004)(11063799006)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PEI3HmvGE10KvkCVU8YGA+oEpL5ua7l/N6cNxhUxPdLYNxrpaZoiiJ8+/ncyjPiNynW1/p8gdXqZfGyGCqXmOCD8zuE7XG+cgxcC6KHdY4O45Vzpo/BIW/llyviZDWFZTC9K+3i800MMq22LAsyazA1vBr12zzFzyabb6clTx1bVd8iJjOaXOo3eaIhEPb+8bixQPLKTkVaiKobd/uQRrpTsqdNlPSgto3lCBdj1sTdj+CqW2tin3g2eD1D+1Lmd9s5z+n5RA7bb2NaZhILDqwwPQSbcedJAM5H8cidqdJzUCjhPG9n3J+URl+hvJPSiK8VlEdEOzB64kpYMiqC0fHVqna2QglofvmNL/XrZMrfSXvUkChm1EPhEgp0/lIo8v2jav0yulSeUMC9euJmB7ej2p/JrAYk+bnHwewp2EabR0oWs54tkkiLuDLOduj6K
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 04:34:44.0517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 011e0f20-94c5-40a0-90ff-08debba94696
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8865

Hi,

on a custom ARM64 board with kernel 6.1.157 we got a report about a data 
abort Oops [1] in ntfs_read_folio() [2]. The disassembly is [3].

Analysing this the failing instruction is

385f82e8 	ldurb	w8, [x23, #-8]

with x23: ffff8d623ef35800 - 8 matching the fault address ffff8d623ef357f8.

Matching this to the C code we think the compiler summarises

struct ntfs_inode *ni = ntfs_i(inode);
if (is_resident(ni)) {

to one assembly instruction to access the ni_flags in struct ntfs_inode 
via the inode [4].

Getting a data abort trying to access the ni_flags, we assume that the 
whole struct ntfs_inode has been freed, already. While missing to reset 
/ clear some reference to it. What in sum looks like a use after free 
race condition accessing struct ntfs_inode in ntfs_read_folio().

We have searched for something obvious in more recent commits but 
couldn't find anything what looks related. Have we missed anything?

What do you think? Any idea?

Thanks

Dirk

[1]

Unable to handle kernel paging request at virtual address ffff8d623ef357f8
Mem abort info:
   ESR = 0x0000000096000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000004
   CM = 0, WnR = 0
[ffff8d623ef357f8] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: ... ntfs3 ...
CPU: 3 PID: 9611 Comm: binder:529_A Tainted: G           O       6.1.157 #1
Hardware name: ARM64 custom board
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : ntfs_read_folio+0x24/0xe0 [ntfs3]
lr : filemap_read_folio+0x6c/0x15c
sp : ffffffc01c05bad0
x29: ffffffc01c05bad0 x28: 00000000fffffa00 x27: 0000000000080001
x26: 00000000ffffffff x25: ff00000000000000 x24: ffffff8d623ef4e8
x23: ffff8d623ef35800 x22: 0000000000000000 x21: ffffffc001591414
x20: fffffffe378c42c0 x19: fffffffe378c42c0 x18: ffffffc0109a0080
x17: 000000001b98ee9a x16: 000000001b98ee9a x15: ffffffc00158ed90
x14: 0000000000000007 x13: 000000000001d3a2 x12: ffffffce57fbe000
x11: 0000000000000001 x10: 0000000000000001 x9 : 0000000000000100
x8 : ffffff8d623ef4e7 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffffff8ca937808c x4 : ffffffc01c05bb50 x3 : 0000000006100cca
x2 : fffffffe378c42c0 x1 : fffffffe378c42c0 x0 : 0000000000000000
Call trace:
  ntfs_read_folio+0x24/0xe0 [ntfs3]
  filemap_read_folio+0x6c/0x15c
  do_read_cache_folio+0x144/0x338
  read_cache_page+0x1c/0x58
  ntfs_fill_super+0xde8/0xf20 [ntfs3]
  get_tree_bdev+0x1c4/0x258
  ntfs_fs_get_tree+0x18/0x28 [ntfs3]
  vfs_get_tree+0x48/0xfc
  do_new_mount+0x154/0x36c
  path_mount+0x270/0x4e4
  __arm64_sys_mount+0x1b4/0x3dc
  invoke_syscall+0x58/0x118
  el0_svc_common+0xb4/0xf4
  do_el0_svc+0x24/0x80
  el0_svc+0x2c/0x90
  el0t_64_sync_handler+0x68/0xb4
  el0t_64_sync+0x1a4/0x1a8
Code: 910003fd f9400c28 aa0103f3 f9400117 (385f82e8)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception
SMP: stopping secondary CPUs

[2]

static int ntfs_read_folio(struct file *file, struct folio *folio)
{
	struct page *page = &folio->page;
	int err;
	struct address_space *mapping = page->mapping;
	struct inode *inode = mapping->host;
	struct ntfs_inode *ni = ntfs_i(inode);

	if (is_resident(ni)) {
		ni_lock(ni);
		err = attr_data_read_resident(ni, page);
		ni_unlock(ni);
		if (err != E_NTFS_NONRESIDENT) {
			unlock_page(page);
			return err;
		}
	}

	if (is_compressed(ni)) {
		ni_lock(ni);
		err = ni_readpage_cmpr(ni, page);
		ni_unlock(ni);
		return err;
	}

	/* Normal + sparse files. */
	return mpage_read_folio(folio, ntfs_get_block);
}

[3]

000000000001e934 <ntfs_read_folio>:
    1e934:	d503233f 	paciasp
    1e938:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1e93c:	f9000bf7 	str	x23, [sp, #16]
    1e940:	a90257f6 	stp	x22, x21, [sp, #32]
    1e944:	a9034ff4 	stp	x20, x19, [sp, #48]
    1e948:	910003fd 	mov	x29, sp
    1e94c:	f9400c28 	ldr	x8, [x1, #24]
    1e950:	aa0103f3 	mov	x19, x1
    1e954:	f9400117 	ldr	x23, [x8]
    1e958:	385f82e8 	ldurb	w8, [x23, #-8]

[4]

struct ntfs_inode {
	....

	size_t ni_flags; // NI_FLAG_XXX

	struct inode vfs_inode;
};

