Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA83446CC
	for <ntfs3@lists.linux.dev>; Mon,  9 Feb 2026 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770632411; cv=none; b=nBdzmV1Vtkf5oUpZAwHhUWQ4u9yZnN23d2evLvDGUq/JoyeTU2UnaENwpJDOSk3CslDLziEWH2J9eSwhQ9iV9HTAgGfS9XqUccEVMffvTvLS95N/cOTnBRFiHvDO/Qbz2yxbYjGYBIxpOSi0lQijUBdJcH27tksSVQkI/A6N/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770632411; c=relaxed/simple;
	bh=VzaLGXVdh1Kc3mO25SLtHBwAPrHP+1CFUwJAnSI0nKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lOrNbX35tp7CeG+bK98iGe34AatrM39wJTpWtDU6zKjcg1wTwfh0WmMs9k8rKMfLjymOeB5i5bOl1QAm55HEJlfyJ7oJtFgukbAwbNeriZet57UZ26tSD14QzAmXReG6PuwjDmW7hzwM4sGDxPQKLWKfG9B/DclcgRkJRDFnB00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=UrVmYlTC; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="UrVmYlTC"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id CDAE3C4;
	Mon,  9 Feb 2026 10:18:01 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=UrVmYlTC;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 1079D218E;
	Mon,  9 Feb 2026 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1770632409;
	bh=3JE7gKF89KngMxETQHOq1M+o9cssyX5mo5rlkf4uhtY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UrVmYlTC64kV+YusQDXlAcVunVUk42hyoYxYn4LSwls/8gliNZZUMHvNqn7b/x43P
	 Qv+7TqQw4tpbtWW8kIw35pyp/LiMNShfPL6yFOo6oMuPA2LGkYSteMPXJ6uGvXmnxC
	 MLThm8EGZ9IVMvQjR5GCzEJUc5ZhxtmwaQRRVlUI=
Received: from [192.168.95.128] (172.30.20.148) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 9 Feb 2026 13:20:08 +0300
Message-ID: <32f85613-725e-4306-8be1-54a526436a46@paragon-software.com>
Date: Mon, 9 Feb 2026 11:20:06 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] fs/ntfs3: Add initialization of super block
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <ntfs3@lists.linux.dev>, linux-kernel <linux-kernel@vger.kernel.org>
References: <aYXvc_N3LzX3Ef7Q@stanley.mountain>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <aYXvc_N3LzX3Ef7Q@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 2/6/26 14:41, Dan Carpenter wrote:

> [ Smatch checking is paused while we raise funding.  #SadFace
>    https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
>
> Hello Konstantin Komarov,
>
> Commit 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> from Aug 13, 2021 (linux-next), leads to the following Smatch static
> checker warning:
>
> fs/ntfs3/fsntfs.c:1260 ntfs_read_run_nb_ra() error: we previously assumed 'run' could be null (see line 1178)
> fs/ntfs3/fsntfs.c:1259 ntfs_read_run_nb_ra() error: uninitialized symbol 'clen'.
> fs/ntfs3/fsntfs.c:1260 ntfs_read_run_nb_ra() error: uninitialized symbol 'idx'.
>
> fs/ntfs3/fsntfs.c
>      1161 int ntfs_read_run_nb_ra(struct ntfs_sb_info *sbi, const struct runs_tree *run,
>      1162                         u64 vbo, void *buf, u32 bytes, struct ntfs_buffers *nb,
>      1163                         struct file_ra_state *ra)
>      1164 {
>      1165         int err;
>      1166         struct super_block *sb = sbi->sb;
>      1167         struct address_space *mapping = sb->s_bdev->bd_mapping;
>      1168         u32 blocksize = sb->s_blocksize;
>      1169         u8 cluster_bits = sbi->cluster_bits;
>      1170         u32 off = vbo & sbi->cluster_mask;
>      1171         u32 nbh = 0;
>      1172         CLST vcn_next, vcn = vbo >> cluster_bits;
>      1173         CLST lcn, clen;
>      1174         u64 lbo, len;
>      1175         size_t idx;
>      1176         struct buffer_head *bh;
>      1177
>      1178         if (!run) {
>      1179                 /* First reading of $Volume + $MFTMirr + $LogFile goes here. */
>      1180                 if (vbo > MFT_REC_VOL * sbi->record_size) {
>      1181                         err = -ENOENT;
>      1182                         goto out;
>      1183                 }
>      1184
>      1185                 /* Use absolute boot's 'MFTCluster' to read record. */
>      1186                 lbo = vbo + sbi->mft.lbo;
>      1187                 len = sbi->record_size;
>
> If run is NULL then "clen" is uninitialized.
>
>      1188         } else if (!run_lookup_entry(run, vcn, &lcn, &clen, &idx)) {
>      1189                 err = -ENOENT;
>      1190                 goto out;
>      1191         } else {
>      1192                 if (lcn == SPARSE_LCN) {
>      1193                         err = -EINVAL;
>      1194                         goto out;
>      1195                 }
>      1196
>      1197                 lbo = ((u64)lcn << cluster_bits) + off;
>      1198                 len = ((u64)clen << cluster_bits) - off;
>      1199         }
>      1200
>      1201         off = lbo & (blocksize - 1);
>      1202         if (nb) {
>      1203                 nb->off = off;
>      1204                 nb->bytes = bytes;
>      1205         }
>      1206
>      1207         if (ra && !ra->ra_pages)
>      1208                 file_ra_state_init(ra, mapping);
>      1209
>      1210         for (;;) {
>      1211                 u32 len32 = len >= bytes ? bytes : len;
>      1212                 sector_t block = lbo >> sb->s_blocksize_bits;
>      1213
>      1214                 if (ra) {
>      1215                         pgoff_t index = lbo >> PAGE_SHIFT;
>      1216                         if (!ra_has_index(ra, index)) {
>      1217                                 page_cache_sync_readahead(mapping, ra, NULL,
>      1218                                                           index, 1);
>      1219                                 ra->prev_pos = (loff_t)index << PAGE_SHIFT;
>      1220                         }
>      1221                 }
>      1222
>      1223                 do {
>      1224                         u32 op = blocksize - off;
>      1225
>      1226                         if (op > len32)
>      1227                                 op = len32;
>      1228
>      1229                         bh = ntfs_bread(sb, block);
>      1230                         if (!bh) {
>      1231                                 err = -EIO;
>      1232                                 goto out;
>      1233                         }
>      1234
>      1235                         if (buf) {
>      1236                                 memcpy(buf, bh->b_data + off, op);
>      1237                                 buf = Add2Ptr(buf, op);
>      1238                         }
>      1239
>      1240                         if (!nb) {
>      1241                                 put_bh(bh);
>      1242                         } else if (nbh >= ARRAY_SIZE(nb->bh)) {
>      1243                                 err = -EINVAL;
>      1244                                 goto out;
>      1245                         } else {
>      1246                                 nb->bh[nbh++] = bh;
>      1247                                 nb->nbufs = nbh;
>      1248                         }
>      1249
>      1250                         bytes -= op;
>      1251                         if (!bytes)
>      1252                                 return 0;
>      1253                         len32 -= op;
>      1254                         block += 1;
>      1255                         off = 0;
>      1256
>      1257                 } while (len32);
>      1258
> --> 1259                 vcn_next = vcn + clen;
>                                            ^^^^
> Used uninitalized here.
>
>      1260                 if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen) ||
>
> But also if we pass a NULL run to run_get_entry() it will crash.  I'm
> a bit confused by this code.
>
>      1261                     vcn != vcn_next) {
>      1262                         err = -ENOENT;
>      1263                         goto out;
>      1264                 }
>      1265
>      1266                 if (lcn == SPARSE_LCN) {
>      1267                         err = -EINVAL;
>      1268                         goto out;
>      1269                 }
>      1270
>      1271                 lbo = ((u64)lcn << cluster_bits);
>      1272                 len = ((u64)clen << cluster_bits);
>      1273         }
>      1274
>      1275 out:
>      1276         if (!nbh)
>      1277                 return err;
>      1278
>      1279         while (nbh) {
>      1280                 put_bh(nb->bh[--nbh]);
>      1281                 nb->bh[nbh] = NULL;
>      1282         }
>      1283
>      1284         nb->nbufs = 0;
>      1285         return err;
>      1286 }
>
> regards,
> dan carpenter

Hello,

Thanks for the Smatch report. I’ll examine the warnings, prepare a fix,
and post a patch.

Regards,
Konstantin

