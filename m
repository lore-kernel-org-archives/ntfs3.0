Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F163E95BB
	for <ntfs3@lists.linux.dev>; Fri,  6 Feb 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385273; cv=none; b=HorJ3QTLSyujqRBXAHDhrdH5rbmoQaUlFGN9okHJSUVEhyTW2pEnyUiTqYXvrQ2WVLlN89pfWcUv4o1ou8TIQuw1SW9jXNg7VPbytp2xcZToN2ZlIWM2JoNTM9VhbXxQfDh8HK3p27i3VrfD+4Nl4Phb7WjSbzfMhEorfhOW+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385273; c=relaxed/simple;
	bh=Se16SYw9UiWsxHmQcuBrF07X4CTaRKCkJsXTeMmSFXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=e1mRQcprjHNrCeIqRon80Cxe6eAiBZ2lDoGRC3RlSNQniemEEzg6hGYTpzePgbHqxZF9jOAreNJIMIK+S00dBMv60CfxJZ33S6oELKNaYua2rloXOjUpV2+ZKpMS2RlfEWZfUhYRb2vWeyCZkV43wGsNt98DAFSBlFmw0r4ksWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPEpDmV0; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPEpDmV0"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48327b8350dso4260705e9.1
        for <ntfs3@lists.linux.dev>; Fri, 06 Feb 2026 05:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385271; x=1770990071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kekx2xManmHxMH6vefZuXzCtRIfQAxhdGEAPx9mSs6k=;
        b=qPEpDmV0eAeUWhHT8UojAX79qdOuI6j15o6gS5rZF2qa3oJX4CEj5Cu045syd9yacr
         QwIyxR7E0HS3I+KCAIf8N64qfjbngoUJb/qce9f9vizR8c8TlqS5VA162GXDL1zFMtLu
         QZAd6VxhYQZE80Wsl8lRxKs8/ppvBA0l9IQDJeiDFlIyaVIKg/fsFw1h68IBlIqvO7Lk
         JLxMjAGHFI58u+iAQSH1+2LIRUxZiA1kPuEOvgJgcJ72nSLhyqazk7l+68/j7VY1aRUq
         nbO8Iwg1V0QN7tVDiei2B07ONgrClThBsSj9F6bnwcQS9dnfZir93qRMT0oedGmdjYS3
         wLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385271; x=1770990071;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kekx2xManmHxMH6vefZuXzCtRIfQAxhdGEAPx9mSs6k=;
        b=QzT24xo8rBaqSi76OJdjPfUoN84Bx3aIcCaJ2WwiF8ZIpYB9fdqwkUCtzZix0+Deun
         ch43Y7v6Y2xxCVT1YC3wETtiOq1d5iJxFLMH5Wtp6X2FJKffsyLXDQ8748XJR0SSKNVd
         rCt52COL1ur4vhiNQx3uDlsIysaY5DIfpaSGU4ibcm/cnWeatQcgQTrMasWubDguVf17
         pfRhcWr6LVvkZwkNjushDGpap7TJefz+0GVY08Xb9En9PboRCMNk0q9g+BXHPpJfA3hr
         +tnulWdeQ+KJSkfwVg/BP40MGkGXxSpaSSIgLv2Oivl/HrJ92n5ngryEdmxwffA5TwgI
         WLxA==
X-Gm-Message-State: AOJu0YyIXWX8f71+SiInKCpAk9WFG2mv/aRd/cXe9CtUl5rc/W38UzxU
	1PybjV30hWLteU65ZBbgyq9oCQvwKX9HEyZgmvPg+yztZDe7OyC3GkEEcMvk3Uio9Co=
X-Gm-Gg: AZuq6aL4Sf9l7pvAWA+ZsuGPYwCqzgIZUIqGZLtTswUVO83/irzFj60ej1aiz6NZZhY
	Y/btzudYVuMbOKHSAh9Cg6tEsV5JYD+zCvPIyKIMKyWYezVsj+l/F5LGEPulvpXHcQ97KWiWLHG
	8U/Gd2ZIz6iyTqzaepNkZho0/giQdAcMiKCRSruVsntUXMv8ZqBDNwFuxLT0roTERLymzPWXdAv
	YE5qAgLHPdCTckVD1tl1XUwmSMAxMRhhR3eUD36Wm9SZuSXq+Zvc0PHL/XXZ5ej9H/v0ENpV/dJ
	f6PtGF1tozMacutCa2KirQaQp0W0Z8j3p9HOpUQQKe17RefEpK6L/ekJOTAqBh7DCPKbN42Nq78
	36AQedrNmIv6qL+JRB7RU1Ys9A3koHe9p2vQS0RIBsAUSZ0P+HYhs3rS0q7E7pNo8j/K45ff/QV
	FHXMaQTkKCh+alnu9b
X-Received: by 2002:a05:600c:c16a:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4832021d98dmr38444515e9.31.1770385271129;
        Fri, 06 Feb 2026 05:41:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48323c0296dsm42310065e9.1.2026.02.06.05.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:10 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] fs/ntfs3: Add initialization of super block
Message-ID: <aYXvc_N3LzX3Ef7Q@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Konstantin Komarov,

Commit 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
from Aug 13, 2021 (linux-next), leads to the following Smatch static
checker warning:

fs/ntfs3/fsntfs.c:1260 ntfs_read_run_nb_ra() error: we previously assumed 'run' could be null (see line 1178)
fs/ntfs3/fsntfs.c:1259 ntfs_read_run_nb_ra() error: uninitialized symbol 'clen'.
fs/ntfs3/fsntfs.c:1260 ntfs_read_run_nb_ra() error: uninitialized symbol 'idx'.

fs/ntfs3/fsntfs.c
    1161 int ntfs_read_run_nb_ra(struct ntfs_sb_info *sbi, const struct runs_tree *run,
    1162                         u64 vbo, void *buf, u32 bytes, struct ntfs_buffers *nb,
    1163                         struct file_ra_state *ra)
    1164 {
    1165         int err;
    1166         struct super_block *sb = sbi->sb;
    1167         struct address_space *mapping = sb->s_bdev->bd_mapping;
    1168         u32 blocksize = sb->s_blocksize;
    1169         u8 cluster_bits = sbi->cluster_bits;
    1170         u32 off = vbo & sbi->cluster_mask;
    1171         u32 nbh = 0;
    1172         CLST vcn_next, vcn = vbo >> cluster_bits;
    1173         CLST lcn, clen;
    1174         u64 lbo, len;
    1175         size_t idx;
    1176         struct buffer_head *bh;
    1177 
    1178         if (!run) {
    1179                 /* First reading of $Volume + $MFTMirr + $LogFile goes here. */
    1180                 if (vbo > MFT_REC_VOL * sbi->record_size) {
    1181                         err = -ENOENT;
    1182                         goto out;
    1183                 }
    1184 
    1185                 /* Use absolute boot's 'MFTCluster' to read record. */
    1186                 lbo = vbo + sbi->mft.lbo;
    1187                 len = sbi->record_size;

If run is NULL then "clen" is uninitialized.

    1188         } else if (!run_lookup_entry(run, vcn, &lcn, &clen, &idx)) {
    1189                 err = -ENOENT;
    1190                 goto out;
    1191         } else {
    1192                 if (lcn == SPARSE_LCN) {
    1193                         err = -EINVAL;
    1194                         goto out;
    1195                 }
    1196 
    1197                 lbo = ((u64)lcn << cluster_bits) + off;
    1198                 len = ((u64)clen << cluster_bits) - off;
    1199         }
    1200 
    1201         off = lbo & (blocksize - 1);
    1202         if (nb) {
    1203                 nb->off = off;
    1204                 nb->bytes = bytes;
    1205         }
    1206 
    1207         if (ra && !ra->ra_pages)
    1208                 file_ra_state_init(ra, mapping);
    1209 
    1210         for (;;) {
    1211                 u32 len32 = len >= bytes ? bytes : len;
    1212                 sector_t block = lbo >> sb->s_blocksize_bits;
    1213 
    1214                 if (ra) {
    1215                         pgoff_t index = lbo >> PAGE_SHIFT;
    1216                         if (!ra_has_index(ra, index)) {
    1217                                 page_cache_sync_readahead(mapping, ra, NULL,
    1218                                                           index, 1);
    1219                                 ra->prev_pos = (loff_t)index << PAGE_SHIFT;
    1220                         }
    1221                 }
    1222 
    1223                 do {
    1224                         u32 op = blocksize - off;
    1225 
    1226                         if (op > len32)
    1227                                 op = len32;
    1228 
    1229                         bh = ntfs_bread(sb, block);
    1230                         if (!bh) {
    1231                                 err = -EIO;
    1232                                 goto out;
    1233                         }
    1234 
    1235                         if (buf) {
    1236                                 memcpy(buf, bh->b_data + off, op);
    1237                                 buf = Add2Ptr(buf, op);
    1238                         }
    1239 
    1240                         if (!nb) {
    1241                                 put_bh(bh);
    1242                         } else if (nbh >= ARRAY_SIZE(nb->bh)) {
    1243                                 err = -EINVAL;
    1244                                 goto out;
    1245                         } else {
    1246                                 nb->bh[nbh++] = bh;
    1247                                 nb->nbufs = nbh;
    1248                         }
    1249 
    1250                         bytes -= op;
    1251                         if (!bytes)
    1252                                 return 0;
    1253                         len32 -= op;
    1254                         block += 1;
    1255                         off = 0;
    1256 
    1257                 } while (len32);
    1258 
--> 1259                 vcn_next = vcn + clen;
                                          ^^^^
Used uninitalized here.

    1260                 if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen) ||

But also if we pass a NULL run to run_get_entry() it will crash.  I'm
a bit confused by this code.

    1261                     vcn != vcn_next) {
    1262                         err = -ENOENT;
    1263                         goto out;
    1264                 }
    1265 
    1266                 if (lcn == SPARSE_LCN) {
    1267                         err = -EINVAL;
    1268                         goto out;
    1269                 }
    1270 
    1271                 lbo = ((u64)lcn << cluster_bits);
    1272                 len = ((u64)clen << cluster_bits);
    1273         }
    1274 
    1275 out:
    1276         if (!nbh)
    1277                 return err;
    1278 
    1279         while (nbh) {
    1280                 put_bh(nb->bh[--nbh]);
    1281                 nb->bh[nbh] = NULL;
    1282         }
    1283 
    1284         nb->nbufs = 0;
    1285         return err;
    1286 }

regards,
dan carpenter
