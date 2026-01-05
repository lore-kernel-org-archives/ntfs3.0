Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90229314D16
	for <ntfs3@lists.linux.dev>; Mon,  5 Jan 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611593; cv=none; b=mQdgDm2tRp0g61KxLu06fMSQEq2wkJ8EBmFKomHH263yIgy0DWm7J31KnZkmrW7Cu4kBLw8vj4w1D35jECsB3S8ToL+cB4w7j2wsmWgZsl/QCJOqtw/PYQZT4I+GiArEoEM05LmC379c45Wb22anjIxp5Nogo8ldNmPZWGLhebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611593; c=relaxed/simple;
	bh=wDEnx8py3cRoP5WSgMWu6tkoV48XyTkizUTd6hRARkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWDHg/HDS4sG/tSSzq/IWtyhrDvayMHJFuk2f4hqKTtfWgMpZ3csCJPFT5AoTZgfaHADBX/HaprIlUI8gcdfvtYpqbRw+BUO1LLn2YYaFVBJ3bkDxFLYWzHyMy6dUhEAUwntmeevHFFt4GwW3QJz1c+iE6hPlfkikRH4TY83AAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRcxyqiF; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRcxyqiF"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so7667195e9.0
        for <ntfs3@lists.linux.dev>; Mon, 05 Jan 2026 03:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767611584; x=1768216384; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sy36NtOWnUUNkuYlvTcG0nfyZwMeK2bqd85x3u4/JPg=;
        b=cRcxyqiFh/W15aA7RVdaGGJbiOpudvI+nPkL4CiQkHFuW0JgkTyYOgn/6VyhPCgrWp
         3/le7AK+mGNtCHovjKxB+griXUm2zQd6XAo1BBFXvi/lmKw4rkIhm1qLDDE9tanXubpx
         v4hjJtn2DIGB2BomUp2W2P8SDEHb0ibemIibDss+Q8T7XkgK2pOuvKNkbhat7KX5K9op
         piAtMIsSOxIijBOymEZVBIaE/h8wc4wLnmlzTfkl44+VR5JESKhXRQvf9iSmj8sM8Lzp
         DM4dqiEf67hETJrfsscKkcgML4btZES5VW688SOIe/9M6NiJSYkLTQzQdNDVIs5yGsoj
         RhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767611584; x=1768216384;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy36NtOWnUUNkuYlvTcG0nfyZwMeK2bqd85x3u4/JPg=;
        b=tmlTI2spPn688nfng0ZXerdeoGm4wGHyisa1hIXWtXjZ23EBMeMwDmKlQatM2bEloA
         1+MUlijYZiWrTbqr9AWrdoN55F7G4c7yM1+8zS5drJxnwEudKZS+8wD+/Id1fevz7g+X
         e/Qlq3MXY0draHJj+JYguSiLycA3GUvJRotqarGKRfmvJ20iL4Zl3oWQCRjC7om6+AY6
         dvkb1Gb37voDJ77yxZGLa9w14/pg4Wf4TfGTBxjVog1ndJ+mfFDnPcW3BbFxg/A0hD08
         Zt3Irzvo3MNnaiyO5z3lvhHaLJ8+EB+C1pYKHyCDUAwwMfR5nQhrLWAaWalW/BtcrYCh
         WmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsDK2JpGa8FH1JQsqjnISMr+VYi7NykYb+Yv8ZMdG8aSCU4L2fnj+3o4Eoj4V7Ct3FQsDyng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4vQotwYjU6tWG3JikXpKS+NewCw+KJtvKyjWBJWPNA2F1pazU
	vUVySUhkTex4ApoLGZcnjloipjajhZblP34fssA++BdqEH+PdJrLrYI2501FwhtKJXs=
X-Gm-Gg: AY/fxX7U9PM6wOccsG3x5b3lDQW/j0OWHt+FpQTeilDz60oopbdfF7ouG7t2XbjYSXH
	gsfmhX/z8Gk26CrCvKhAJl2GgJACc0dwUmORV9NjsVsu+iY1ckuhvWvmOaFurqetKHNrR6QkwD+
	6WONfbBByuttjlhh3ZF2mJbQ81LHaXI98CYTxex9E53azcZ+xZCD+Z7dUZB97z0KTNUnBSW+Dsn
	t4K5GbynITzzYUpk1kqfciu8WG6+BHEe46ETA/pPekeVSREt8WzBQ9wiq9P+2K7ib89esqd79iC
	4QpNbhsP7BCnimK/Scu1fdaQMEJ88K0IBtwtvKLX8Fk4bpzh9hFROOB4fZ9LS8qktNn4ea62Z6u
	0fDGaCilHEIe0omkGR/yAedAYgle66WnHE6b5xcaANDNGVcn2YjOFGXJ8qwvru5jcPxeBV8Tv/6
	vbeO1t2wTOdL8MoB6v
X-Google-Smtp-Source: AGHT+IEJP/FgEZPj2KWjxlU5cLjyxJQY3xh0ilcQNpmede28a0I8ZSxO6DfSzSmdDBukFGb7vvgtPA==
X-Received: by 2002:a05:600c:3110:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47d6ba7e485mr109359645e9.2.1767611584285;
        Mon, 05 Jan 2026 03:13:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2e0sm180702655e9.1.2026.01.05.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:13:03 -0800 (PST)
Date: Mon, 5 Jan 2026 13:33:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:devel 7/9] fs/ntfs3/fsntfs.c:1265
 ntfs_read_run_nb_ra() error: uninitialized symbol 'clen'.
Message-ID: <202512230646.v5hrYXL0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git devel
head:   f7edab0cee03a1cbe0e55a7bcab8d2d8b6b74278
commit: 989e29450efaf4983c66b7a628f2ffc03b6d02e8 [7/9] fs/ntfs3: improve readahead for bitmap initialization and large directory scans
config: i386-randconfig-141-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230646.v5hrYXL0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512230646.v5hrYXL0-lkp@intel.com/

smatch warnings:
fs/ntfs3/fsntfs.c:1265 ntfs_read_run_nb_ra() error: uninitialized symbol 'clen'.
fs/ntfs3/fsntfs.c:1266 ntfs_read_run_nb_ra() error: uninitialized symbol 'idx'.

vim +/clen +1265 fs/ntfs3/fsntfs.c

82cae269cfa9530 Konstantin Komarov 2021-08-13  1166  
989e29450efaf49 Konstantin Komarov 2025-12-08  1167  int ntfs_read_run_nb_ra(struct ntfs_sb_info *sbi, const struct runs_tree *run,
989e29450efaf49 Konstantin Komarov 2025-12-08  1168  			u64 vbo, void *buf, u32 bytes, struct ntfs_buffers *nb,
989e29450efaf49 Konstantin Komarov 2025-12-08  1169  			struct file_ra_state *ra)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1170  {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1171  	int err;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1172  	struct super_block *sb = sbi->sb;
989e29450efaf49 Konstantin Komarov 2025-12-08  1173  	struct address_space *mapping = sb->s_bdev->bd_mapping;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1174  	u32 blocksize = sb->s_blocksize;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1175  	u8 cluster_bits = sbi->cluster_bits;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1176  	u32 off = vbo & sbi->cluster_mask;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1177  	u32 nbh = 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1178  	CLST vcn_next, vcn = vbo >> cluster_bits;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1179  	CLST lcn, clen;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1180  	u64 lbo, len;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1181  	size_t idx;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1182  	struct buffer_head *bh;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1183  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1184  	if (!run) {
e8b8e97f91b80f0 Kari Argillander   2021-08-03  1185  		/* First reading of $Volume + $MFTMirr + $LogFile goes here. */
82cae269cfa9530 Konstantin Komarov 2021-08-13  1186  		if (vbo > MFT_REC_VOL * sbi->record_size) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1187  			err = -ENOENT;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1188  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1189  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1190  
e8b8e97f91b80f0 Kari Argillander   2021-08-03  1191  		/* Use absolute boot's 'MFTCluster' to read record. */
82cae269cfa9530 Konstantin Komarov 2021-08-13  1192  		lbo = vbo + sbi->mft.lbo;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1193  		len = sbi->record_size;

clen is not initialized when run is false.

82cae269cfa9530 Konstantin Komarov 2021-08-13  1194  	} else if (!run_lookup_entry(run, vcn, &lcn, &clen, &idx)) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1195  		err = -ENOENT;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1196  		goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1197  	} else {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1198  		if (lcn == SPARSE_LCN) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1199  			err = -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1200  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1201  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1202  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1203  		lbo = ((u64)lcn << cluster_bits) + off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1204  		len = ((u64)clen << cluster_bits) - off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1205  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1206  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1207  	off = lbo & (blocksize - 1);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1208  	if (nb) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1209  		nb->off = off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1210  		nb->bytes = bytes;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1211  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1212  
989e29450efaf49 Konstantin Komarov 2025-12-08  1213  	if (ra && !ra->ra_pages)
989e29450efaf49 Konstantin Komarov 2025-12-08  1214  		file_ra_state_init(ra, mapping);
989e29450efaf49 Konstantin Komarov 2025-12-08  1215  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1216  	for (;;) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1217  		u32 len32 = len >= bytes ? bytes : len;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1218  		sector_t block = lbo >> sb->s_blocksize_bits;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1219  
989e29450efaf49 Konstantin Komarov 2025-12-08  1220  		if (ra) {
989e29450efaf49 Konstantin Komarov 2025-12-08  1221  			pgoff_t index = lbo >> PAGE_SHIFT;
989e29450efaf49 Konstantin Komarov 2025-12-08  1222  			if (!ra_has_index(ra, index)) {
989e29450efaf49 Konstantin Komarov 2025-12-08  1223  				page_cache_sync_readahead(mapping, ra, NULL,
989e29450efaf49 Konstantin Komarov 2025-12-08  1224  							  index, 1);
989e29450efaf49 Konstantin Komarov 2025-12-08  1225  				ra->prev_pos = (loff_t)index << PAGE_SHIFT;
989e29450efaf49 Konstantin Komarov 2025-12-08  1226  			}
989e29450efaf49 Konstantin Komarov 2025-12-08  1227  		}
989e29450efaf49 Konstantin Komarov 2025-12-08  1228  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1229  		do {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1230  			u32 op = blocksize - off;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1231  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1232  			if (op > len32)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1233  				op = len32;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1234  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1235  			bh = ntfs_bread(sb, block);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1236  			if (!bh) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1237  				err = -EIO;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1238  				goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1239  			}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1240  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1241  			if (buf) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1242  				memcpy(buf, bh->b_data + off, op);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1243  				buf = Add2Ptr(buf, op);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1244  			}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1245  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1246  			if (!nb) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1247  				put_bh(bh);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1248  			} else if (nbh >= ARRAY_SIZE(nb->bh)) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1249  				err = -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1250  				goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1251  			} else {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1252  				nb->bh[nbh++] = bh;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1253  				nb->nbufs = nbh;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1254  			}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1255  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1256  			bytes -= op;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1257  			if (!bytes)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1258  				return 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1259  			len32 -= op;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1260  			block += 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1261  			off = 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1262  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1263  		} while (len32);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1264  
82cae269cfa9530 Konstantin Komarov 2021-08-13 @1265  		vcn_next = vcn + clen;
                                                                                 ^^^^
Uninitialized.

82cae269cfa9530 Konstantin Komarov 2021-08-13 @1266  		if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen) ||
82cae269cfa9530 Konstantin Komarov 2021-08-13  1267  		    vcn != vcn_next) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1268  			err = -ENOENT;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1269  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1270  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1271  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1272  		if (lcn == SPARSE_LCN) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1273  			err = -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1274  			goto out;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1275  		}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1276  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1277  		lbo = ((u64)lcn << cluster_bits);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1278  		len = ((u64)clen << cluster_bits);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1279  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1280  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1281  out:
82cae269cfa9530 Konstantin Komarov 2021-08-13  1282  	if (!nbh)
82cae269cfa9530 Konstantin Komarov 2021-08-13  1283  		return err;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1284  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1285  	while (nbh) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  1286  		put_bh(nb->bh[--nbh]);
82cae269cfa9530 Konstantin Komarov 2021-08-13  1287  		nb->bh[nbh] = NULL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1288  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  1289  
82cae269cfa9530 Konstantin Komarov 2021-08-13  1290  	nb->nbufs = 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1291  	return err;
82cae269cfa9530 Konstantin Komarov 2021-08-13  1292  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

