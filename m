Received: from sonic302-1.consmr.mail.bf2.yahoo.com (sonic302-1.consmr.mail.bf2.yahoo.com [74.6.135.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382B5A45
	for <ntfs3@lists.linux.dev>; Wed, 13 Sep 2023 04:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1694580663; bh=P69r2sgx0nstTNKfZmkHvrI5ECzRo16W79ECNLLok0Q=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=A+MitzWt/SeORJEQnBd4nYX/KRwndmDKQcPXdWI6c9rWQ/BgON0tT8/CPaZPa3GlRGwohIXuTTVYfgfwY74Hy/Hc9WqAgn6kD/V/daYcQexQOGF7sRRa0AyME0V2W1ONAX2yoOkYJgZyQNYkFeUsy2rO7iOmL+4lcRTB1JahpMtcOLHY3j1n9Bu2vpRH705khHjlz8/nyc1QOEygRYzHReGFG9AKN4AEWtqEFn7IvqQ+R5miA2mxkmpNR5JFsnpcevfQSAuUd3hGmbq+oaP8BdEmJorlNFkPPqtO0wqXai0Jd5YsUP5xkj8eLVJ2uapWSAWvU5a3Rvi2B8iSkqoFYA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1694580663; bh=F4oeXMV9x1tefRAboWgSqEEw/HQTE+aKbh6qo8umnhy=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=iM9tnJso07FPl3a0rhrURHGahy0CEHDyC0kkEZDQGpZMvAZE2+H+CQGj5aHKsVQTsa5Q1AgJQlNjwjGbUygzhIO5VR5Ffu/UkLgu6WAMHofINV6wZ+lFsT45MV4jy9LBUCZbeqV//bo6xQ6Mqm896rjVgdz5DCVqJ5M1ARAkh0j0qMwMkGgr56j08gzcQk+mZYhgqtJPryhXWr73xqMywyNtTdN0ZPXsFVIKZNnppDH8dmESBVKAJxlVt+a+uhW09fGFoUHtqIIKKOpXqw6IhMb3pVGE2kOE/Tv8GoC1ZnEfdz2Rd+lpVGcQ7YoDDJUlG3Ag8+Te44YSCZsfNON6wQ==
X-YMail-OSG: P3XrqEEVM1kIPIjBJh3IhGeQtqW2yqDKP_tcNlxLXwL3nNIrz2_p78.zm00_VcE
 2CXBvFnUtqKFgC7hjfJuIF9KMIi0t5rkMBtzeppXoOyg1.swF2vfhBW91m9wG2Dx6T0VdBhUdfzZ
 4JdTU2d4KCrc6hcqVlo1uoRV8bbLmbaEmtwy7tr3aUjVGQMwbYViPxmgfO5pVhwN_W5eFOBNOseQ
 p5ZFyA64TcixkhsvBTZTghfFmmSmFLtU3f35.05DRSqRV26Wc4rqzur_KRk60IfKcKxD5TuQEQwS
 A4n2IdF8FHUs4qpqjbwxAuq6Bx3tbeP19H78tzQOnAd2QixfHq3PvdFGtUL9_6A3iSyyDKg7Yyku
 HYgCmnHV7RsZaBWPqu33DjbV7GOxKhX7HlDidMYMlRo9hZu4zVjZ_HU5ghG2ILrJ5qPxAwo1RPyO
 NnugkluUcIc9LqUdLCB0YiEtI_M73Imq80XbvYSfNEut2Uy4vKjUMVYHBKG.Tze0o__mTSKjfjdT
 JtcUUV4S0QKmhIpk.DFwGeHcIVOeoqaDK.4wKDqeGvxm5Sow9Qkvxymf4TBVYLPB_sWM3nPJLJ0h
 z_ra849G.i9QHFcaMbl3B63jKcanAZnyJR2N6LiADAwPj3_i06OCzauVzZFpuxwZ9GMBUwN.6gTf
 1e059hDXy4sdpyR.m97PXjg0jkOgcUSvGXqyBRqv0QqHPtDey.WiY8sSFT_DG8cBqjSg5PUuCltr
 tfTdKWsBgtBOhyipkuZWycCNYLweIo2unWE5lFZM1mscJ6pEyA8sv4y1QKr8QbWtpOxe2B0H2cW8
 FrHJ.GLpzj7z3cyscvLgxw5UOWgDyA79K_Yj88ja4_g78XBcfVXjSHX0.yZ7ECsKp_hKwZX9iUsD
 kdeSQClVIfexTEw8hxPg1WmbLnIrDYDMtQbaWm1XNaldvxcTBW2bR7MB8wFHvDH.QsnASUv8009R
 _CL.m568Nt3TGD4IB.6AdjjAsZkBysbLGa0iK9Ph_vJ4GUOQb0OaXXlloZ2lVwCYN9p9u6aWDEbO
 xw4KafcXl_0lUHTAV9s0Xcm9jHCdAi.lsG.TthUb3VVCFBTh_NSdJiEtuAjCfUetlRGZAwZ2WyUm
 8O4guyuD1t5io9O1r6oFo9ispwtfj828r0oyRsyptdjiLqCQbWpUNT5KGFpmB.yOJCzFu04eQeAy
 0FXYQDhBLaeXpLUP5WbSY6_Z0WJaurBtfIPZHOTkDNbDwAKn1_iCrZpNwikbzUhLH.eB6Ji1GgZ8
 zI6avz_H.Q8nYrW5uw3JqO909ZGR_uvbj9b3mnFEx.Sseu3sgr8NmKCSJYS13qTaEq7O0u96zzCW
 u5P7jmXW7xMI6kmsrk3syBXFFH1WCkBZ8oynbKtxuiFjiIe9ImHPU4g3PxDQOQHDR0_sWquyO3fX
 EJHQrOqfCQ4QKZVMHR1EMzUKjPVykowaxRi9OmjPc7lwHgeg_QEqs1kpKzDix41A4H3XS9O9LaPu
 BbJGPopIdIFgnXN2FTKrkjGpEBKOwT72tq.iY2vmgfgqkr_U2h12m02oheyPsaBvgSL0v.jQ.824
 Xn7ZP_y.XBq57cu0b1tivKebk5aZ3PEfz45eKfTL_CUEynaTcdaBQeHettCx2jeDD.bGVD5.881k
 qLNgcwWAysvV5oJUHNVx.CdSvrgOjnCnb0YJu.NS3VRHgprnS6hIRoJF2k.uB0d_V_ln6mJl_iri
 6IRCqblsdmVRolFkY7nULwBlXh9O098FsFXvciQ2XNC41P7s3aMKA2Z.TmyKFTbRMBUaedNZxFSW
 jSzVnv51l6HhZEB9DOoseYwhv.MUyrVJOHiVDLiHSCZ8h9i2WenypZzGkeSlRrf9pvgU1LC0Kc8T
 0G.szzoBrePkvMVvmPiKCQZcREgt.fCezQQMJrFYNTnQEydmSGf7Hw0GZBe5pkXXR9DNWvEGpJyj
 jFzY92BWVY4aYqDz58V7TX.NPXLEEHMXvRAhgg96A8SfzjO4fdLAy77AqfQg_0i_ZetBKWvy_sKr
 ZjR7HC.tCeC21knjhgRn1mJfAzQw5_R5u6_sRKaExPTEECRIlbZSEYnZNxZGvSb5bblK6Yk6ACs5
 1yMU7N2DUb7tNwAn.OFbd2CcLz63V6wNBVrkNnhEblhpF1I4cM.823JuzB27xpQcQlEEhCO8Jo0N
 kCDYtH6cVZ99kxNj2ttqNXJPT5ywf7Y5h0D2xL9EyW1C0ccDymCFvHjlJhsk6Ax4jw63.iNzsqIS
 iYiIDijUv94myOOUAemmIEjv.Yyt2JXcAcj1qOXVueEnN184IfniTPQ0o2W60.aS72hlxhC_QXyq
 oJYe_rwkLUviTLgnSwU5O2w--
X-Sonic-MF: <gabemarcano@yahoo.com>
X-Sonic-ID: 91d3c56e-25e7-4206-b60e-ee961e3f4f25
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Wed, 13 Sep 2023 04:51:03 +0000
Received: by hermes--production-ne1-7b767b77cc-q899j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5a3f1a9ca35f31bea436e0654e91c2d5;
          Wed, 13 Sep 2023 04:50:57 +0000 (UTC)
From: Gabriel Marcano <gabemarcano@yahoo.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Marcano <gabemarcano@yahoo.com>
Subject: [PATCH 1/1] fs/ntfs3: fix directory element type detection
Date: Tue, 12 Sep 2023 21:50:32 -0700
Message-ID: <20230913045032.19651-2-gabemarcano@yahoo.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230913045032.19651-1-gabemarcano@yahoo.com>
References: <20230913045032.19651-1-gabemarcano@yahoo.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling stat() from userspace correctly identified junctions in an NTFS
partition as symlinks, but using readdir() and iterating through the
directory containing the same junction did not identify the junction
as a symlink.

When emitting directory contents, check FILE_ATTRIBUTE_REPARSE_POINT
attribute to detect junctions and report them as links.

Signed-off-by: Gabriel Marcano <gabemarcano@yahoo.com>
---
 fs/ntfs3/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 063a6654199b..ec0566b322d5 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -309,7 +309,11 @@ static inline int ntfs_filldir(struct ntfs_sb_info *sbi, struct ntfs_inode *ni,
 		return 0;
 	}
 
-	dt_type = (fname->dup.fa & FILE_ATTRIBUTE_DIRECTORY) ? DT_DIR : DT_REG;
+	/* NTFS: symlinks are "dir + reparse" or "file + reparse" */
+	if (fname->dup.fa & FILE_ATTRIBUTE_REPARSE_POINT)
+		dt_type = DT_LNK;
+	else
+		dt_type = (fname->dup.fa & FILE_ATTRIBUTE_DIRECTORY) ? DT_DIR : DT_REG;
 
 	return !dir_emit(ctx, (s8 *)name, name_len, ino, dt_type);
 }
-- 
2.42.0

