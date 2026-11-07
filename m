Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069387;
	b=BMIG1HZn/muD9lN65K1E59ol+SBi4STLAwEGWmmy7fNzVoWH07FRYYxveqsZM9u1JiyZ
	 DgXx7/9Y5A9PcBpHB9Zz1z9ItKPxg2TW170EXBwaFUZ33ilo/Cm6bvayWKKHo3103cCu4
	 flE/zj2KYbiwmvK3jMMizczYzmFoi2/ZRXntOvPnFKK3ogGBQms/EeEwnzwZMsdzy/Pk7
	 YBJeaYYeGbRMI5fpRMtWdcdNshJFMVOzPfYySHYzjwguwVn1IytJgG+PpTorObWeC507Q
	 oN8Ox+LYUW7meZYwv6l8fj6fb5wfYlMopsPE/Bc8u5LoRUcldhsRhuDYn91Lep0xEig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069387;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:X-OQ-MSGID:In-Reply-To:
	 References:Date:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=lbX+sGdGYj2HVf7Yc5m9ZTpvypzt1imqSUa6cW9vpz4=;
	b=sx8P9lBq54cp2JTRUHISojUKOhjd3tWtywN8wtS0niPvf9gewfD8OoT4IBzuLDQK6cB0
	 S6LEK4buxOvCe/doiUvOr+s+jTurdqYOgzELgyusEXn/sctBTOwRhLh5dpisYReFZhjd4
	 bZXSyQ+7eisA+C8s2UcQdgNUJO/6MSMchs4A2wVPrp2aYhvNH/NqErmQ8lP6LTA8arONF
	 eexE4aXME+cPO8Z8Zuxs6fMl7N6uz5HiA+WoFaQaMUAlun0FsC1cye76yoaUggyE/pc+Q
	 E/fMu3e391Y2BC4xXeQw60/kxrAxNIWaiI5eX+LUaEMbE96gmpTaXlJ492NaQ81qrdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=T+jno8qd;
	arc=none smtp.remote-ip=203.205.221.191
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FADD606A32C
	for <ntfs3@lists.linux.dev>; Sat,  7 Nov 2026 16:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FADD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=T+jno8qd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794069382; bh=lbX+sGdGYj2HVf7Yc5m9ZTpvypzt1imqSUa6cW9vpz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=T+jno8qdaZ7FEzEVXvcm+IPRdhDePnJHRQzb6XpHEuVMTXH8RLOtIXveklLzAk5w/
	 M5Y9CfK7IuCjeZKspzyOphcnEGbuZ8un1VKBU7TuGktdg+bVp4clohyaUQtvTddQFv
	 TDgSzLpGONQHDdkjWNJYfS2Oepog6LChN6P5LbEE=
Received: from [172.18.4.77] ([202.113.185.209])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 9138B44A; Sun, 08 Nov 2026 00:36:19 +0800
X-QQ-mid: xmsmtpt1794069379travwr84g
Message-ID: <tencent_427FA63F51443E005106A901DF6223E04E08@qq.com>
X-QQ-XMAILINFO: OKZmdVNIw/gXnTM/i9jIuptosvaaslD27BAzXpUS3KVy2RKUZeJ9ErzG00x2QD
	 AuI9GXR/qW0fR7U0P8zrtj4S7cUV2SEusCpEmYbC1OtPv53+8UVgDR2OaQiEFltmer0ZiVJA0cJv
	 ndTITuVzykMQvNpTSF0zxXO0wQ5Z+KOUBIyERA5JVSUOxEEuMzXL7do1/gBIGCQqPxlBvMvi2SFa
	 jYBqh14+brIM5pvWTj323gJF5EaULWh/Nv9EY5zAdeRduazhTUgst4rFMNn2BgG3aYkGx815RDHM
	 ARxL2YFKhv5ruP4fFBgZ4VLiRCMvIOENPMuTnAe2F76NVCOp1ayMsS3zMm4yqSGxB6J739aF58fr
	 IgEYFbls7LHUNhZ/5ZZRlF2C6vCI9nIKVL5P75elNcUMhhwJv7K51zYdvmb+HWyXS1k0RcqYX+yo
	 qfBwm4NAhz5n+4MsVi17ppidfDSu/suS9SICGR0WgyQiEWk3gTC3r/r8G3IHMYSV/kiI6wyZpxeT
	 XCnHtx/H73tyLC7C6rMbZSc+wYTcvFeWh99pHBkTbTAvgtftU4B1+qjzSPBN54WxzzevUt4coO16
	 ZaQENIzXJ6xTjLv3KjKvOuDW0tPmRiJkKmnA5p3cUjiI+x6Ypn/1jbAEHB+uj3amXtBtfWIndDeA
	 xDYwp4/DhCKxISTpfhLVy1ga8pM292VdWkzQ2Y6xqoE+KBq647BGqDG5vPLZ6nQiG4s3dCQORsSH
	 nxWx18KjRPIfLZ/jUrxX19Br0tawegWYFYOolY0wcIxpnqwNmEvma843JPrcst8A28KNSX74mIzf
	 /jFq6uM4DrLrSWkQhR96zJ1eRN2psaYxFyjPD/n6FMSgUjq7JFxtIsVYpT+XQOAZ7lpJMtP0WRCl
	 ZVnMdFmShuYKFeXQ3T9AnH34nepgipOw21aQuIdNhrW8qyspnyxwJD9oQW5qXMTnASyVHoMqsjnW
	 s+48nK+pLK9hTdp7o0uDwYY8JdjSaN7JD4h/5HtdtV5KVynMEST91wc5hwXf6zd+Lwx/QjUqXjGw
	 MFxnEPEicqwMKtfmE7aIDOKtSuqd/T7W2dwbFF3A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Guikun Yang <yangguikun19@qq.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: ntfs3: two out-of-bounds reads in $LogFile replay (restart page
 resize, restart table offset)
X-OQ-MSGID: <c32-ntfs3-undo-unallocated-20261107@qq.com>
In-Reply-To: <c21c25-ntfs3-logfile-oob-20261106@qq.com>
References: <c21c25-ntfs3-logfile-oob-20261106@qq.com>
 <c26c27-ntfs3-logfile-more-20261106@qq.com>
Date: Sat, 07 Nov 2026 22:00:00 +0800
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi,

One more landing of the undo-pass lookup gap reported as item 3 - same
missing check, different field. The redo pass validates the
open-attribute table lookup three ways before using it; the undo pass
validates none of them.

Redo pass (fs/ntfs3/fslog.c:5105-5124):

  t16 =3D le16_to_cpu(lrh->target_attr);
  if (t16 >=3D bytes_per_rt(oatbl))              /* 1. bounds     */
          ... goto out;
  oe =3D Add2Ptr(oatbl, t16);
  if (oe->next !=3D RESTART_ENTRY_ALLOCATED_LE)  /* 2. allocated  */
          ... goto out;
  oa =3D oe->ptr;
  if (!oa) {                                   /* 3. non-NULL   */
          ... goto out;
  }

Undo pass (fslog.c:5251):

  oe =3D Add2Ptr(oatbl, le16_to_cpu(lrh->target_attr));
  oa =3D oe->ptr;
  t16 =3D le16_to_cpu(lrh->lcns_follow);
  if (!t16)
          goto add_allocated_vcns;
  is_mapped =3D run_lookup_entry(oa->run1, ...);

Item 3 in my previous mail was the missing bounds check (an index past
the table reads outside the allocation). The same PoC with one field
changed - lcns_follow from 0 to 1 - selects an in-bounds but unused
entry (target_attr 0x18 points at entry 0 of a table with used=3Dtotal=3D0,
so oe->ptr is NULL) and reaches run_lookup_entry(oa->run1, ...) with
oa =3D=3D NULL:

  Oops: general protection fault, probably for non-canonical address 0xdffffc=
0000000001
  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: 0010:log_replay+0xabe6/0xf580 [ntfs3]
   ntfs_loadlog_and_replay -> ntfs_fill_super

So one fix - mirroring all three redo-pass checks at the undo-pass
lookup, ideally in one helper shared by both - covers both landings and
the third one (in-bounds, allocated, but oe->ptr NULL) that I have not
built separately.

Both PoCs are the same four-record forged log as before, differing by
one field each; 3/3 with panic_on_warn=3D1, mount(2) alone, clean image
mounts fine. Unchanged in mainline as of 2026-11-07.

The reproducer bundle for items 3-5 plus this one is available on
request as a single archive - same base image, per-finding one-field
patches.

Thanks,
Guikun Yang

