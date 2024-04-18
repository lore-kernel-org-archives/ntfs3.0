Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA8B4F5EC;
	Thu, 18 Apr 2024 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713410811; cv=none; b=Olu13GqsA64aD+wFdn/Ka+CCSBybmcev5mb6YoNfp8de2pMtHN9uaaRw9dio4VAZNn1gebSQCJiVPMTNsoVdEGFojUWNG5foyOZaHpo4WS3n6JCjFRgUpExxYY4vK0aIc5X1RurYVEJl/A/wewPuGq+D60lnz/NQzeHV+0RyxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713410811; c=relaxed/simple;
	bh=5aekoJC6yNzG/G41GtrPthg56QUrUuVa8/E9DnDE95s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZDNtHVeOTBF9LNPhY5Rt0nHe4OsbKKM4hxl+diGsomYILHhqWDVqp1nxI+BCBffOHTM9NpIlKYzGlyRtNxYRPqwDFQHDzYSF0hqtBqm+epqTqocTCx9meMYNayGQwpXitjWDLJqXR9D5tpFiJPJtWqn1jFgcZ4pBRZqKAaqevg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moBDJETo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moBDJETo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713410809; x=1744946809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5aekoJC6yNzG/G41GtrPthg56QUrUuVa8/E9DnDE95s=;
  b=moBDJEToMWigANpmiPN/jEHmZndE55kCjk6d4e8GPtQ2wOnly6+cAXNF
   x0ljkMr0MD72gJb0muDRf9O75EqptICpryTpUaGLE4IXcP6uPI/Qo/4gq
   H17BwQqzKoNb2z/1gRl4BHNlKay9nwq7hSnGMzJ99vScWKwzS1BVCMv48
   Cyg+DXtmnmPGSVflaUmrnuLCExL7lJOUvydeHAXTlGGCIwU4/T/vQEKAI
   ZSfXpeUaRLuO9ieQbBuGmzPNxHhuKYWPrMnYDMruZqz9qlMUKcFrgtccK
   XZHozVgm1oug4C7xQzEoOQbuItM9Bok4KmaK4D8IG9H/Y8V5pAhckfgW2
   w==;
X-CSE-ConnectionGUID: WnSToH0OSmKzLLvYRdoh8w==
X-CSE-MsgGUID: 9RMk65ZwRFq2BKudHKDQNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9054962"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="9054962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 20:26:48 -0700
X-CSE-ConnectionGUID: oXXvlaNfTi+NmXj7FMUpoA==
X-CSE-MsgGUID: BkJ6MC/8SNWDfZhpSTKLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22895924"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2024 20:26:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxIQ6-0007GS-1o;
	Thu, 18 Apr 2024 03:26:43 +0000
Date: Thu, 18 Apr 2024 11:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:master 11/13]
 fs/ntfs3/super.c:1473:40: sparse: sparse: incorrect type in initializer
 (different base types)
Message-ID: <202404181111.Wz8a1qX6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   21b6b5bc6774720b8298d9e362bec01a53ec693b
commit: ad4d82df0d44e558d23aba1954040e9b531796c4 [11/13] fs/ntfs3: Optimize to store sorted attribute definition table
config: parisc-randconfig-r133-20240418 (https://download.01.org/0day-ci/archive/20240418/202404181111.Wz8a1qX6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240418/202404181111.Wz8a1qX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181111.Wz8a1qX6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ntfs3/super.c:465:23: sparse: sparse: unknown escape sequence: '%'
>> fs/ntfs3/super.c:1473:40: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 const [usertype] *src @@     got unsigned short [usertype] *upcase @@
   fs/ntfs3/super.c:1473:40: sparse:     expected restricted __le16 const [usertype] *src
   fs/ntfs3/super.c:1473:40: sparse:     got unsigned short [usertype] *upcase

vim +1473 fs/ntfs3/super.c

  1339	
  1340		/* Check bitmap boundary. */
  1341		tt = sbi->used.bitmap.nbits;
  1342		if (inode->i_size < bitmap_size(tt)) {
  1343			ntfs_err(sb, "$Bitmap is corrupted.");
  1344			err = -EINVAL;
  1345			goto put_inode_out;
  1346		}
  1347	
  1348		err = wnd_init(&sbi->used.bitmap, sb, tt);
  1349		if (err) {
  1350			ntfs_err(sb, "Failed to initialize $Bitmap (%d).", err);
  1351			goto put_inode_out;
  1352		}
  1353	
  1354		iput(inode);
  1355	
  1356		/* Compute the MFT zone. */
  1357		err = ntfs_refresh_zone(sbi);
  1358		if (err) {
  1359			ntfs_err(sb, "Failed to initialize MFT zone (%d).", err);
  1360			goto out;
  1361		}
  1362	
  1363		/* Load $BadClus. */
  1364		ref.low = cpu_to_le32(MFT_REC_BADCLUST);
  1365		ref.seq = cpu_to_le16(MFT_REC_BADCLUST);
  1366		inode = ntfs_iget5(sb, &ref, &NAME_BADCLUS);
  1367		if (IS_ERR(inode)) {
  1368			err = PTR_ERR(inode);
  1369			ntfs_err(sb, "Failed to load $BadClus (%d).", err);
  1370			goto out;
  1371		}
  1372	
  1373		ni = ntfs_i(inode);
  1374		bad_len = bad_frags = 0;
  1375		for (i = 0; run_get_entry(&ni->file.run, i, &vcn, &lcn, &len); i++) {
  1376			if (lcn == SPARSE_LCN)
  1377				continue;
  1378	
  1379			bad_len += len;
  1380			bad_frags += 1;
  1381			if (ro)
  1382				continue;
  1383	
  1384			if (wnd_set_used_safe(&sbi->used.bitmap, lcn, len, &tt) || tt) {
  1385				/* Bad blocks marked as free in bitmap. */
  1386				ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
  1387			}
  1388		}
  1389		if (bad_len) {
  1390			/*
  1391			 * Notice about bad blocks.
  1392			 * In normal cases these blocks are marked as used in bitmap.
  1393			 * And we never allocate space in it.
  1394			 */
  1395			ntfs_notice(sb,
  1396				    "Volume contains %zu bad blocks in %zu fragments.",
  1397				    bad_len, bad_frags);
  1398		}
  1399		iput(inode);
  1400	
  1401		/* Load $AttrDef. */
  1402		ref.low = cpu_to_le32(MFT_REC_ATTR);
  1403		ref.seq = cpu_to_le16(MFT_REC_ATTR);
  1404		inode = ntfs_iget5(sb, &ref, &NAME_ATTRDEF);
  1405		if (IS_ERR(inode)) {
  1406			err = PTR_ERR(inode);
  1407			ntfs_err(sb, "Failed to load $AttrDef (%d)", err);
  1408			goto out;
  1409		}
  1410	
  1411		/*
  1412		 * Typical $AttrDef contains up to 20 entries.
  1413		 * Check for extremely large/small size.
  1414		 */
  1415		if (inode->i_size < sizeof(struct ATTR_DEF_ENTRY) ||
  1416		    inode->i_size > 100 * sizeof(struct ATTR_DEF_ENTRY)) {
  1417			ntfs_err(sb, "Looks like $AttrDef is corrupted (size=%llu).",
  1418				 inode->i_size);
  1419			err = -EINVAL;
  1420			goto put_inode_out;
  1421		}
  1422	
  1423		{
  1424			u32 bytes = inode->i_size;
  1425			struct ATTR_DEF_ENTRY *def_table = kmalloc(bytes, GFP_KERNEL);
  1426			if (!def_table) {
  1427				err = -ENOMEM;
  1428				goto put_inode_out;
  1429			}
  1430	
  1431			/* Read the entire file. */
  1432			err = inode_read_data(inode, def_table, bytes);
  1433			if (err) {
  1434				ntfs_err(sb, "Failed to read $AttrDef (%d).", err);
  1435			} else {
  1436				/* Check content and store sorted array. */
  1437				err = ntfs_check_attr_def(sbi, def_table, bytes);
  1438				if (err)
  1439					ntfs_err(sb, "$AttrDef is corrupted.");
  1440			}
  1441	
  1442			kfree(def_table);
  1443			if (err)
  1444				goto put_inode_out;
  1445		}
  1446		iput(inode);
  1447	
  1448		/* Load $UpCase. */
  1449		ref.low = cpu_to_le32(MFT_REC_UPCASE);
  1450		ref.seq = cpu_to_le16(MFT_REC_UPCASE);
  1451		inode = ntfs_iget5(sb, &ref, &NAME_UPCASE);
  1452		if (IS_ERR(inode)) {
  1453			err = PTR_ERR(inode);
  1454			ntfs_err(sb, "Failed to load $UpCase (%d).", err);
  1455			goto out;
  1456		}
  1457	
  1458		if (inode->i_size != 0x10000 * sizeof(short)) {
  1459			err = -EINVAL;
  1460			ntfs_err(sb, "$UpCase is corrupted.");
  1461			goto put_inode_out;
  1462		}
  1463	
  1464		/* Read the entire file. */
  1465		err = inode_read_data(inode, sbi->upcase, 0x10000 * sizeof(short));
  1466		if (err) {
  1467			ntfs_err(sb, "Failed to read $UpCase (%d).", err);
  1468			goto put_inode_out;
  1469		}
  1470	
  1471	#ifdef __BIG_ENDIAN
  1472		{
> 1473			const __le16 *src = sbi->upcase;
  1474			u16 *dst = sbi->upcase;
  1475	
  1476			for (i = 0; i < 0x10000; i++)
  1477				*dst++ = le16_to_cpu(*src++);
  1478		}
  1479	#endif
  1480	
  1481		shared = ntfs_set_shared(sbi->upcase, 0x10000 * sizeof(short));
  1482		if (shared && sbi->upcase != shared) {
  1483			kvfree(sbi->upcase);
  1484			sbi->upcase = shared;
  1485		}
  1486	
  1487		iput(inode);
  1488	
  1489		if (is_ntfs3(sbi)) {
  1490			/* Load $Secure. */
  1491			err = ntfs_security_init(sbi);
  1492			if (err) {
  1493				ntfs_err(sb, "Failed to initialize $Secure (%d).", err);
  1494				goto out;
  1495			}
  1496	
  1497			/* Load $Extend. */
  1498			err = ntfs_extend_init(sbi);
  1499			if (err) {
  1500				ntfs_warn(sb, "Failed to initialize $Extend.");
  1501				goto load_root;
  1502			}
  1503	
  1504			/* Load $Extend/$Reparse. */
  1505			err = ntfs_reparse_init(sbi);
  1506			if (err) {
  1507				ntfs_warn(sb, "Failed to initialize $Extend/$Reparse.");
  1508				goto load_root;
  1509			}
  1510	
  1511			/* Load $Extend/$ObjId. */
  1512			err = ntfs_objid_init(sbi);
  1513			if (err) {
  1514				ntfs_warn(sb, "Failed to initialize $Extend/$ObjId.");
  1515				goto load_root;
  1516			}
  1517		}
  1518	
  1519	load_root:
  1520		/* Load root. */
  1521		ref.low = cpu_to_le32(MFT_REC_ROOT);
  1522		ref.seq = cpu_to_le16(MFT_REC_ROOT);
  1523		inode = ntfs_iget5(sb, &ref, &NAME_ROOT);
  1524		if (IS_ERR(inode)) {
  1525			err = PTR_ERR(inode);
  1526			ntfs_err(sb, "Failed to load root (%d).", err);
  1527			goto out;
  1528		}
  1529	
  1530		/*
  1531		 * Final check. Looks like this case should never occurs.
  1532		 */
  1533		if (!inode->i_op) {
  1534			err = -EINVAL;
  1535			ntfs_err(sb, "Failed to load root (%d).", err);
  1536			goto put_inode_out;
  1537		}
  1538	
  1539		sb->s_root = d_make_root(inode);
  1540		if (!sb->s_root) {
  1541			err = -ENOMEM;
  1542			goto put_inode_out;
  1543		}
  1544	
  1545		if (boot2) {
  1546			/*
  1547		 	 * Alternative boot is ok but primary is not ok.
  1548		 	 * Volume is recognized as NTFS. Update primary boot.
  1549			 */
  1550			struct buffer_head *bh0 = sb_getblk(sb, 0);
  1551			if (bh0) {
  1552				if (buffer_locked(bh0))
  1553					__wait_on_buffer(bh0);
  1554	
  1555				lock_buffer(bh0);
  1556				memcpy(bh0->b_data, boot2, sizeof(*boot2));
  1557				set_buffer_uptodate(bh0);
  1558				mark_buffer_dirty(bh0);
  1559				unlock_buffer(bh0);
  1560				if (!sync_dirty_buffer(bh0))
  1561					ntfs_warn(sb, "primary boot is updated");
  1562				put_bh(bh0);
  1563			}
  1564	
  1565			kfree(boot2);
  1566		}
  1567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
