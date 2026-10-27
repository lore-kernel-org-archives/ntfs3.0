Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114205;
	b=lQBxHFfK8/lgW00sSAuk0FsEwiSUxgbNh5Rv6wwIzNThTXBkiOf3/EcZrz6GblRyHu/O
	 3y2TyNBA1qQ4DWNgNcGu/RQPHxhzwF4p3VUQrWYexu6ZcmWeQiyYp1e5L05Rw0JIC2x3o
	 534Lv20TJ5LpVPLfUgAENIR6f0FJd/fLT1ovL3SY169V0Tvk5GqiC46kgaMwiZHyKibf/
	 83g/5LMv7Rvtf+2TmbE3U6pdqyf5jk/ID8eQgw+QnW+5SRnTuCfXteJ5PeNi79UyGjIzk
	 sHSgL76D9eWKGYiVlgffW140v3stbNqu7NTpP4HCRzOWNvIQZXlHzlJBXCvQR14aNkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IFHTFkFZHATvDyA9vMl3gA5TnmzEIZlmMLjprD1MJL8=;
	b=OyVOjYc1lCoz0cLxGGmSZ4OL49eHzqVOa0kEaDqKDQyb/3WcrwSrf0bexfMM9ZaY2BEG
	 TqcNaI9iJXWaAY6zrab62aN4dW8dxxJ5vKI9h/clj0A1kpfYn9ahDVhi5n3uaFYoLbw5q
	 ywuXpVCRZx5sFuo8kMguoj/5zNSr3GLuRO2CpXn6cYfCeN23VIItJAqH+H5k8/IoTMyFz
	 05Djuw8mntLPP7Vl/L2amAxCECqGOsXPHHsReMoTSfSV3c6f+9VmNotejNSmB8a9V0c2F
	 EcKkJd+RBYN7djna/iwDgX3BCa++qrOXOfDucMafOdKS+FSxGIox2RzpDT79tnAiiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSrcMtDt;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58787606A320
	for <ntfs3@lists.linux.dev>; Tue, 27 Oct 2026 15:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58787606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSrcMtDt
Received: by mail-oo2-f9.google.com with SMTP id 46e09a7af769-821a4a69647so2153993a34.0
        for <ntfs3@lists.linux.dev>; Tue, 27 Oct 2026 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114204; x=1793719004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFHTFkFZHATvDyA9vMl3gA5TnmzEIZlmMLjprD1MJL8=;
        b=MSrcMtDthe1XLQcek2DPbCUFpiyjINSufbdpiRl2qMvzI/GDw8YDigVDneiCdG6XSs
         Nt66WuRmmL7MPd1EgB//k3OeMfae9MHgsGvdraHYNM0ob2I/ni4DPgdGJqh1dTCN/vAp
         XujaqdkpcKG2MZiCfE0M3V5SxVlZn963QVD7bJchwLbxga0FACWMI2f8i6dofiI2vkVo
         I+hmtc8WUeRzqDS/am9eLgTk0T0lx7ldl9PRM8N/3zxTzXf3VGq5Bjv6osv17WGTbM4V
         nOBGKqn/2HcZCuJTIZXyP2C6oEFqojqG6pYgeGTSMSXj9Kvwwya6aN9K3AU2G+3uewP7
         JeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114204; x=1793719004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFHTFkFZHATvDyA9vMl3gA5TnmzEIZlmMLjprD1MJL8=;
        b=N8J142lNeGjvdnUD++r1zBpZH8Q0v14IW0JHmChhX0misXwAAcR88bgxi7p2t5X0/a
         8vIFIDKuo+NcqdQ0JR5/7EcPcQ5ojW7S50PkI5XMws9woxaCO1iSSQV12SrRbu+ZLgp7
         NeafCg/5GqwW7JD+FAU89glGyPVBpZBwphXlAvUcvAh4PDdOurOoD3/mVvwB1a9Yw8RO
         E/VwbpZsoaXXBtmQAPwJf7tbKojnYAC1loSSDTPuCnYQ5hqRljwj4R7/mjbuLSTTCC+k
         MYA4g2k2XIEcbOhKc9xWyc1k2YszsRlivcU28Hm1YP+AAWEMwNiotM1wkbQEUnXGmBk3
         JvkA==
X-Gm-Message-State: AFq9FYJLOpim4apBWy36y5pFX6wU+pCO0R08nywnupaHwePUCpd1M6j/
	WFWxdpOTTs0/c7XI2EmH+Cy7TS/uRQcuOMAV/soSSpxQyStgSDvfKWsY
X-Gm-Gg: AYBFou3TZCTseDvPY9VzFnyOrEFC9mB4EO1JuWz1YqUta1ZmIJ1lEE4fR90oRhU8b9x
	mm+Z/5zgUk2BDEZCU66YMDWs6qo+lfpGYO7sv2c+fRZhYOrj0pQb6eiXnjMAjWjwnFCyrTDkxcH
	qUmQNgmnskmrIdqTdHNdtBEI4tsM1Xr9x5B4t2NBMTaqHf75KF3QOGWxfeCa1fphOnxUDR640ZE
	rHZOXWf2YEkXBhvmuzMPKmQpy2ByCgROGt5KmPP5mzZekwjLkX8sy5MxN2DdnuMrTs+OhzMxiSY
	Rr2kMRIHlQ96eO1+K41J5/VdX/RL7E3nlTG3reSrVLDzIcPKMNPoannEswLFpGmS0Kb8JFnUvYR
	Brp5zytKdoyQ0HXlXsFlOwUl94Gh2Ez3szjrXiq45gp5cKQhfNcnirqf4vgXCIViXb/7a/5hLH5
	SHa6cXNma6Rph9RnEziPsjq//zwljOqyZZTVEPNKAYRiOB6DEIfxjdyFKQBVlxU2AT+lQFs9cEV
	pk3AKkHHy9odKtsGnOwKxQHm3WboabtF9/DyuYGRf0iQideMF5gcgO/o3i54joZTvCypu5JB4N8
	rFuYs8nCP9KlwOQWIky9/N3IvYQSpXBdKNoPpFCLTQ==
X-Received: by 2002:a05:6830:2b10:b0:821:c75e:5309 with SMTP id 46e09a7af769-850fdb42781mr8911434a34.7.1793114204118;
        Tue, 27 Oct 2026 08:16:44 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d7fsm10768970a34.2.2026.10.27.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:16:43 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix NULL deref in ni_std5() on stream inodes
Date: Tue, 27 Oct 2026 23:16:15 +0800
Message-ID: <20261027151615.971171-2-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261027151615.971171-1-bsdhenrymartin@gmail.com>
References: <20261027151615.971171-1-bsdhenrymartin@gmail.com>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_std5() looks up the standard information attribute in the inode's
own MFT record:

    attr = mi_find_attr(ni, &ni->mi, NULL, ATTR_STD, NULL, 0, NULL);

without redirecting to the base inode.  For an ADS stream inode,
ni->mi.mrec is never initialized (ntfs_init_ads_node() in
fs/ntfs3/inode.c leaves mi.mrec NULL), so mi_find_attr() ->
mi_enum_attr() dereferences rec == NULL:

    BUG: unable to handle kernel NULL pointer dereference
    RIP: mi_enum_attr+0x18/0x180

The SYSTEM_NTFS_SECURITY xattr path calls ni_std5() without a guard
for stream inodes (fs/ntfs3/xattr.c): ntfs_set_acl()/ntfs_xattr_set()
reach it via ntfs_insert_security -> ni_lock(ni) -> ni_std5(ni) on the
stream inode, and the stream inode inherits the base's i_mode/uid/gid,
so the may_write_xattr() ownership check passes for the file owner.
The default stream-name parsing (colons) is enabled, so an
unprivileged local user can open("file:stream"), set the security
descriptor xattr on it and panic the kernel.

Redirect stream inodes to their base record in ni_std5().

This issue was discovered by Tencent CodeBuddy Security.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 fs/ntfs3/frecord.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a953f3f..dce6400195aee 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -89,6 +89,13 @@ struct ATTR_STD_INFO5 *ni_std5(struct ntfs_inode *ni)
 {
 	const struct ATTRIB *attr;
 
+	/* Stream inodes have no MFT record of their own (mi.mrec is
+	 * NULL); the standard information attribute lives in the base
+	 * record.
+	 */
+	if (ni->base && ni->base != ni)
+		ni = ni->base;
+
 	attr = mi_find_attr(ni, &ni->mi, NULL, ATTR_STD, NULL, 0, NULL);
 
 	return attr ? resident_data_ex(attr, sizeof(struct ATTR_STD_INFO5)) :
-- 
2.43.7
