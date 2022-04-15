Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589377A
	for <ntfs3@lists.linux.dev>; Fri, 15 Apr 2022 05:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649999376; x=1681535376;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6js5zQuBI=;
  b=ZSvt3T8OQ2Jm2/Xfxgrk/uVbw7y49fZfGvJ4GiWDoRq4bIXAVHddFrqp
   frzmY79dJgOJMC3dLLRPg9ZopZK/RjU7vHU1miL3Wl2zHgR18o5Uk04mM
   aWiEO9FR7d7MnU/wJ8S/xTMddAI1bGlAv7yadtHeX9nMYym1RiL2rsHU8
   VLqE/MSDtgc01uz5LoIRWA8WHeFR+u8eUQdtcUnoMDNpJHIq4y6dc6lia
   X5E4v2yk63S2lHtgYLpgW4LnLsIJK3g+/vudri9h99FurVjVmiMWbGc/q
   oHQufLJgcWaqkJHE2CUDaNKLj12mpBCp5XuNVagbRt2k8iN2FsfPDtV1M
   g==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; 
   d="scan'208";a="198866561"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 13:08:29 +0800
IronPort-SDR: FHgERS8KOIIRGBSL3BGvaf5Z1gFPfd0ggrHxe6SAM6n7KSiJXDgBoSUvoySuGvh6aa73gxPgRd
 +khkhpPsiwT3x8Hfb+9akztC3JXA5ALWh2MYLg+8SY7Rmbn0T10go6niunfQ8qY+renDa0Rtxi
 A8Zgf3RWmjIsS9vvr5GrmMoEwY/IQ56DJuDU+B9Arlc7znWt6lIUGMFaM05vXX1d1qsvDoID4d
 J9yz3MEy/fK/k8bEf6DRSJebuc+vbz/0PMngjq+jSdirGlowZ7+iio46sRWv7p4FzN9iXfUUE1
 7mtCVJ9Qv4n263TsvqsL0Wrq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2022 21:39:39 -0700
IronPort-SDR: 98ZV1nWfudwPOzr6+40En8gQWowCxF7vlbTPqOTzWbV650uiD1GlBA8lLZfdjJ1VxT/RCSrfVn
 NYwiXcwLM1pFkGvhmT43CYa13HbkohuV2NZMgL/+hoajJhkZtvn1xYRbwVEU7n6Vvx5o2DHT3j
 GOhzSLD1tSQ8/zi0omrauPkBfeQNGf9LfkL4+PHb5k2lkHFMAVuoKlKlMKPa48W5CTGwXJQs4z
 AtbvVnZA6+qCGeSv/EobdLjvlvVrdRL6+8s7I3usc110O1iMzCyfHBE3ih3AeZ0pEfiCSFwUME
 BMk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2022 22:08:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kfkqv63f7z1Rwrw
	for <ntfs3@lists.linux.dev>; Thu, 14 Apr 2022 22:08:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1649999307; x=1652591308; bh=Fza98p6Hk/Oo3R5YjAQC2Nws92s1JhenlM6
	js5zQuBI=; b=PnLGxxEK3pLyssa8yxGNdC4XjW2wbor1ccVbtGFYLuF6J3cLtHd
	AbpMYH7aDhgG/pTbCzP2Jz5UXeITA2uAAyiR/Fy6attbFAobIm77MiZ1d9JwxmK8
	shfFnnjg3a2RytIj37jVhbyrF9O4v+hLyhCzQz2dnHJygtOnBuY0SiH0emrVEC5V
	37Q51RwNl9CEkvSI7J63mNoy2HlvXkxHid/Xl33/pVaD25Hfmrh/cyibuFKv7AtS
	/tmUO1ElBPCNJo60JkfPy33eMUDO0eae+UlOxVUV5CwFdxfl0b0VIs1osnbs2TmY
	qPuOzeMMi/kXJvdALFOBXWDwdlihcT0EYFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kyUCwL3vygvr for <ntfs3@lists.linux.dev>;
	Thu, 14 Apr 2022 22:08:27 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kfkqn6sCZz1Rvlx;
	Thu, 14 Apr 2022 22:08:21 -0700 (PDT)
Message-ID: <d7a39cfc-9b28-f0d6-bf62-4351c55daec2@opensource.wdc.com>
Date: Fri, 15 Apr 2022 14:08:20 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 27/27] direct-io: remove random prefetches
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-28-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220415045258.199825-28-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/22 13:52, Christoph Hellwig wrote:
> Randomly poking into block device internals for manual prefetches isn't
> exactly a very maintainable thing to do.  And none of the performance
> criticil direct I/O implementations still use this library function

s/criticil/critical

> anyway, so just drop it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research
