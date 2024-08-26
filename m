Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A256839EB
	for <ntfs3@lists.linux.dev>; Mon, 26 Aug 2024 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653739; cv=none; b=icNLrl49ywBQFBnqE6SLEk532bLJCk6KVskwCCX6a7KMC+G5HafRiyT43q4ioQO8Ebxf1tU7DaeNFpvyYAk1NhcRDOiuvDe3DMfB8LGKBIgIe14IAdAM1EizzR/brzf5l3YCCrhoCiKLihhY4RVcicR6nKi03JNIS1c6EZX4Rxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653739; c=relaxed/simple;
	bh=okdG2a0qJ8UIOBr5/EkVEr7iuWcYdW0zZQUTNXr3230=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELP8LIl+tATnCu4PW+ix1Zee+b3lKstXoClT5aUMLUPQSmYEuk52TTLxXnfQqMHW0rZUyRzmw2juudJ6g0fDofgXlX/wGO9xM444Bi/r1UpWpFCpA9QNxS8fD1MJsWJrYRuR8tQOKW52oNJSaY836Lgr2ctIhO93Piubs5Z2WX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OieeHyT/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OieeHyT/"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533488ffaddso4954586e87.1
        for <ntfs3@lists.linux.dev>; Sun, 25 Aug 2024 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724653735; x=1725258535; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqiBFey06gKWR64Nykb3hN0RcI8q8smd1b69ocWAqt8=;
        b=OieeHyT/4Bu24EwVLAWQrIFRAa2ozp384Z47Pwi4mqoL/F0P+66tVSk9ZuXwpABj+h
         /U2T0y58P/ffq+NmlgNnqL0uNbz1UzcWrfH3iAJvb6kyKui1rXDcrCYJmm6F8asA9opD
         iXZw8oGoVe7cMZpPdRfXoOSBKrf4vA5JLYMUysoGRyZmtPohWyg9jjQAA5PEW8darJc2
         J8rZZKTlRH04z9G6CccQnpx7NPxzv3e/jzp/HWzznXpjd5/yY7zSbWNzsninvmu/i9Wl
         333nNalb9Bel1Fdq1ICe0vqM5eSpYezHmbaESGh5m/3DAeLlYrxlir7+okPMUi4InLSC
         VUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653735; x=1725258535;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqiBFey06gKWR64Nykb3hN0RcI8q8smd1b69ocWAqt8=;
        b=O6StWjosWI0VhU8zXKOVHOB2j868UjDjFa8E6YjZqU0fPgyqkHIryi0xRM9O7vCbIx
         kp5PQgROZG59Uy6fu6cR1IAzN/E5Z4lgW0gtTSq1Wa1jvP1znJcF2WPxrCliwroqTXBz
         7zkf4cIAq2AshwFNWss/ez/1cclfXFjkOS82PVBZ7dEUqYD/LVkp7Rq8xNHq47eU6rx1
         oMPtDKsF5YpS3NmWRgIQcKk0rde1janITBMce7tQqqJOJxq8ZWea5f4QtxZgTr4oEr5N
         zWZRYJDXPSM1f9clmaqrY0g7u+xs7AXwpBUCxaxRGv3rXUA/90HpzLgsDAlYDVObzZdQ
         d41Q==
X-Forwarded-Encrypted: i=1; AJvYcCWd4rP2uZ/bpwZSVgzmedEGAihL+Oz96Mw7nSdc4a4TDWM3fdfdhSJ9+0yxhMPEhS8LoM0aIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgqrS4Da32cO9qq8CaY/CV27zx4MLSlMAlzrKYxR5zrMka2NZh
	0o54KYOPkArClRcT7NZYsezGxkVjurxq0X8B0qrV7sCMaRKzO9zLDgGBftBeAWbSj9Tu6k+9xZh
	1NXM=
X-Google-Smtp-Source: AGHT+IGKfB3saQUEIUkONKo/dp49P2vKf80IwyT5VPDbJqnXK30XKYgj+/J5OAL/1sx/3bSdT+jQZQ==
X-Received: by 2002:a05:6512:3dab:b0:533:1cb8:ec6b with SMTP id 2adb3069b0e04-53438784989mr6168500e87.27.1724653734684;
        Sun, 25 Aug 2024 23:28:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47d1c3sm617117966b.169.2024.08.25.23.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:28:54 -0700 (PDT)
Date: Mon, 26 Aug 2024 09:28:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thorsten Blum <thorsten.blum@toblux.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, ntfs3@lists.linux.dev,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [paragon-software-group-ntfs3:master 2/16]
 fs/ntfs3/lib/lzx_decompress.c:555 lzx_decompress_block() error:
 uninitialized symbol 'match_offset'.
Message-ID: <38752402-3a41-45f0-97ba-4f208d17337b@stanley.mountain>
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
commit: 7495ce846bbe4f38d7ea5e023e44ad864b6348ad [2/16] fs/ntfs3: Use swap() to improve code
config: x86_64-randconfig-161-20240824 (https://download.01.org/0day-ci/archive/20240824/202408242247.tSSqBPqy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408242247.tSSqBPqy-lkp@intel.com/

smatch warnings:
fs/ntfs3/lib/lzx_decompress.c:555 lzx_decompress_block() error: uninitialized symbol 'match_offset'.

vim +/match_offset +555 fs/ntfs3/lib/lzx_decompress.c

522e010b58379f Konstantin Komarov 2021-08-13  471  static int lzx_decompress_block(const struct lzx_decompressor *d,
522e010b58379f Konstantin Komarov 2021-08-13  472  				struct input_bitstream *is,
522e010b58379f Konstantin Komarov 2021-08-13  473  				int block_type, u32 block_size,
522e010b58379f Konstantin Komarov 2021-08-13  474  				u8 * const out_begin, u8 *out_next,
522e010b58379f Konstantin Komarov 2021-08-13  475  				u32 recent_offsets[])
522e010b58379f Konstantin Komarov 2021-08-13  476  {
522e010b58379f Konstantin Komarov 2021-08-13  477  	u8 * const block_end = out_next + block_size;
522e010b58379f Konstantin Komarov 2021-08-13  478  	u32 ones_if_aligned = 0U - (block_type == LZX_BLOCKTYPE_ALIGNED);
522e010b58379f Konstantin Komarov 2021-08-13  479  
522e010b58379f Konstantin Komarov 2021-08-13  480  	do {
522e010b58379f Konstantin Komarov 2021-08-13  481  		u32 mainsym;
522e010b58379f Konstantin Komarov 2021-08-13  482  		u32 match_len;
522e010b58379f Konstantin Komarov 2021-08-13  483  		u32 match_offset;
522e010b58379f Konstantin Komarov 2021-08-13  484  		u32 offset_slot;
522e010b58379f Konstantin Komarov 2021-08-13  485  		u32 num_extra_bits;
522e010b58379f Konstantin Komarov 2021-08-13  486  
522e010b58379f Konstantin Komarov 2021-08-13  487  		mainsym = read_mainsym(d, is);
522e010b58379f Konstantin Komarov 2021-08-13  488  		if (mainsym < LZX_NUM_CHARS) {
522e010b58379f Konstantin Komarov 2021-08-13  489  			/* Literal  */
522e010b58379f Konstantin Komarov 2021-08-13  490  			*out_next++ = mainsym;
522e010b58379f Konstantin Komarov 2021-08-13  491  			continue;
522e010b58379f Konstantin Komarov 2021-08-13  492  		}
522e010b58379f Konstantin Komarov 2021-08-13  493  
522e010b58379f Konstantin Komarov 2021-08-13  494  		/* Match  */
522e010b58379f Konstantin Komarov 2021-08-13  495  
522e010b58379f Konstantin Komarov 2021-08-13  496  		/* Decode the length header and offset slot.  */
522e010b58379f Konstantin Komarov 2021-08-13  497  		mainsym -= LZX_NUM_CHARS;
522e010b58379f Konstantin Komarov 2021-08-13  498  		match_len = mainsym % LZX_NUM_LEN_HEADERS;
522e010b58379f Konstantin Komarov 2021-08-13  499  		offset_slot = mainsym / LZX_NUM_LEN_HEADERS;
522e010b58379f Konstantin Komarov 2021-08-13  500  
522e010b58379f Konstantin Komarov 2021-08-13  501  		/* If needed, read a length symbol to decode the full length. */
522e010b58379f Konstantin Komarov 2021-08-13  502  		if (match_len == LZX_NUM_PRIMARY_LENS)
522e010b58379f Konstantin Komarov 2021-08-13  503  			match_len += read_lensym(d, is);
522e010b58379f Konstantin Komarov 2021-08-13  504  		match_len += LZX_MIN_MATCH_LEN;
522e010b58379f Konstantin Komarov 2021-08-13  505  
522e010b58379f Konstantin Komarov 2021-08-13  506  		if (offset_slot < LZX_NUM_RECENT_OFFSETS) {
522e010b58379f Konstantin Komarov 2021-08-13  507  			/* Repeat offset  */
522e010b58379f Konstantin Komarov 2021-08-13  508  
522e010b58379f Konstantin Komarov 2021-08-13  509  			/* Note: This isn't a real LRU queue, since using the R2
522e010b58379f Konstantin Komarov 2021-08-13  510  			 * offset doesn't bump the R1 offset down to R2.  This
522e010b58379f Konstantin Komarov 2021-08-13  511  			 * quirk allows all 3 recent offsets to be handled by
522e010b58379f Konstantin Komarov 2021-08-13  512  			 * the same code.  (For R0, the swap is a no-op.)
522e010b58379f Konstantin Komarov 2021-08-13  513  			 */
7495ce846bbe4f Thorsten Blum      2024-07-31  514  			swap(recent_offsets[offset_slot], recent_offsets[0]);

match_offset not set on this path

522e010b58379f Konstantin Komarov 2021-08-13  515  		} else {
522e010b58379f Konstantin Komarov 2021-08-13  516  			/* Explicit offset  */
522e010b58379f Konstantin Komarov 2021-08-13  517  
522e010b58379f Konstantin Komarov 2021-08-13  518  			/* Look up the number of extra bits that need to be read
522e010b58379f Konstantin Komarov 2021-08-13  519  			 * to decode offsets with this offset slot.
522e010b58379f Konstantin Komarov 2021-08-13  520  			 */
522e010b58379f Konstantin Komarov 2021-08-13  521  			num_extra_bits = lzx_extra_offset_bits[offset_slot];
522e010b58379f Konstantin Komarov 2021-08-13  522  
522e010b58379f Konstantin Komarov 2021-08-13  523  			/* Start with the offset slot base value.  */
522e010b58379f Konstantin Komarov 2021-08-13  524  			match_offset = lzx_offset_slot_base[offset_slot];
522e010b58379f Konstantin Komarov 2021-08-13  525  
522e010b58379f Konstantin Komarov 2021-08-13  526  			/* In aligned offset blocks, the low-order 3 bits of
522e010b58379f Konstantin Komarov 2021-08-13  527  			 * each offset are encoded using the aligned offset
522e010b58379f Konstantin Komarov 2021-08-13  528  			 * code.  Otherwise, all the extra bits are literal.
522e010b58379f Konstantin Komarov 2021-08-13  529  			 */
522e010b58379f Konstantin Komarov 2021-08-13  530  
522e010b58379f Konstantin Komarov 2021-08-13  531  			if ((num_extra_bits & ones_if_aligned) >= LZX_NUM_ALIGNED_OFFSET_BITS) {
522e010b58379f Konstantin Komarov 2021-08-13  532  				match_offset +=
522e010b58379f Konstantin Komarov 2021-08-13  533  					bitstream_read_bits(is, num_extra_bits -
522e010b58379f Konstantin Komarov 2021-08-13  534  								LZX_NUM_ALIGNED_OFFSET_BITS)
522e010b58379f Konstantin Komarov 2021-08-13  535  							<< LZX_NUM_ALIGNED_OFFSET_BITS;
522e010b58379f Konstantin Komarov 2021-08-13  536  				match_offset += read_alignedsym(d, is);
522e010b58379f Konstantin Komarov 2021-08-13  537  			} else {
522e010b58379f Konstantin Komarov 2021-08-13  538  				match_offset += bitstream_read_bits(is, num_extra_bits);
522e010b58379f Konstantin Komarov 2021-08-13  539  			}
522e010b58379f Konstantin Komarov 2021-08-13  540  
522e010b58379f Konstantin Komarov 2021-08-13  541  			/* Adjust the offset.  */
522e010b58379f Konstantin Komarov 2021-08-13  542  			match_offset -= (LZX_NUM_RECENT_OFFSETS - 1);
522e010b58379f Konstantin Komarov 2021-08-13  543  
522e010b58379f Konstantin Komarov 2021-08-13  544  			/* Update the recent offsets.  */
522e010b58379f Konstantin Komarov 2021-08-13  545  			recent_offsets[2] = recent_offsets[1];
522e010b58379f Konstantin Komarov 2021-08-13  546  			recent_offsets[1] = recent_offsets[0];
522e010b58379f Konstantin Komarov 2021-08-13  547  			recent_offsets[0] = match_offset;
522e010b58379f Konstantin Komarov 2021-08-13  548  		}
522e010b58379f Konstantin Komarov 2021-08-13  549  
522e010b58379f Konstantin Komarov 2021-08-13  550  		/* Validate the match, then copy it to the current position.  */
522e010b58379f Konstantin Komarov 2021-08-13  551  
522e010b58379f Konstantin Komarov 2021-08-13  552  		if (match_len > (size_t)(block_end - out_next))
522e010b58379f Konstantin Komarov 2021-08-13  553  			return -1;
522e010b58379f Konstantin Komarov 2021-08-13  554  
522e010b58379f Konstantin Komarov 2021-08-13 @555  		if (match_offset > (size_t)(out_next - out_begin))
                                                                    ^^^^^^^^^^^^
Uninitialized.

522e010b58379f Konstantin Komarov 2021-08-13  556  			return -1;
522e010b58379f Konstantin Komarov 2021-08-13  557  
522e010b58379f Konstantin Komarov 2021-08-13  558  		out_next = lz_copy(out_next, match_len, match_offset,
522e010b58379f Konstantin Komarov 2021-08-13  559  				   block_end, LZX_MIN_MATCH_LEN);
522e010b58379f Konstantin Komarov 2021-08-13  560  
522e010b58379f Konstantin Komarov 2021-08-13  561  	} while (out_next != block_end);
522e010b58379f Konstantin Komarov 2021-08-13  562  
522e010b58379f Konstantin Komarov 2021-08-13  563  	return 0;
522e010b58379f Konstantin Komarov 2021-08-13  564  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

