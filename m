Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57DA33B6DC
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 01:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869464; cv=none; b=um79BBrGh453ZBRG1+V+Fil4UbYI9Zd0w8FvFm2tmHk7oAXXVAEmjpYXd12NGNOuUfxHwMnXFewxOTrSirI26KZWL0Tax3efKr+6eDpmKl2y5Muota92Zg+jCPM6Btwi9nl2q7Y7J2tMT0dJk5yvw/tc1yiIgn8fMM5djRGZVnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869464; c=relaxed/simple;
	bh=4KpdXzzaVuQ8uaR1iw2AWuloJ8QhNYCyziJ2hE2KnGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vdu18zwj7SpXd6yNFEr05mGPDFZbdmXPsKq9HJ6sTXZuPgXsazTfncMIbWHcxsukxP1U5AiTXnCkVpm9uglZfzc+Yv2Kvl27yOzp2l0kLzSxwlguX7kSOcJ0aClAUQ6Rzi/XpgmlU7k3y9yq5yJYLsS+d3WEGRkw9QMyaSCexDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Rt/dJKQm; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Rt/dJKQm"
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6610pZV92319285;
	Wed, 1 Jul 2026 01:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Anwjc64DIx4p53d2mV/l54+wt8qlWBAPKubWMwypbUk=; b=
	Rt/dJKQmFlgFcDr7e1m13v+Fngt0/yTIoJLEq3MiQcxzBkM1UJgJYXbhz7gTzidE
	A4vfDC9ZWOb3ppJ+eQHoV1t0SysfyMbiFTEE6O19Gumi+Xlf1AGHtMHN66zUtFOW
	LJiyGdq6P8TWKtwBVCvD1a/5Oq1Dl8E4cqEhNraA9B5u/XtqKCaHaUbSGIIMIxPY
	VaqoOR4zoYVCnXi3DbyyiLyRszjYws8feS3SXonKXJrSJqnFDltofpDP6D3r++hH
	PwbvE5QyOEgVyllQbZMiyvOJZdgPKI3NCD8wNdCOrn+bbORbTKEts2Nz9YpLNfgg
	dq+wiohcYmJajoK1cGmfQQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f23r0cx6k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 01 Jul 2026 01:30:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 18:30:53 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 18:30:51 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <yun.zhou@windriver.com>
Subject: [PATCH 1/2] ntfs3: remove ntfs_iget5 call in ntfs_dir_emit to fix recursive deadlock
Date: Wed, 1 Jul 2026 09:30:48 +0800
Message-ID: <20260701013049.3141386-2-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701013049.3141386-1-yun.zhou@windriver.com>
References: <20260701013049.3141386-1-yun.zhou@windriver.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=DNC/JSNb c=1 sm=1 tr=0 ts=6a446dce cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=DoessCCtehmJQwcKyzUA:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: uVqvejVxYk42a7oa_lzYxZ_jjG55ud-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxNCBTYWx0ZWRfX454Gaxrodi31
 gopg+0amitMs3syUyCsBl/IwJcAg3MtzYKAp+l6+EHpSwoydsQkTZbaU7HDfNDJavAs40cOI+dT
 pNnzrD+VrDkYG/pKaumjF4g6xl3ChchWEMYUKhjDo+JFt5NIpmX2bJbFh1hS1ONFQW3w66rlsbN
 cA7Vurc+ga0oOeaCHkbk4fXKTXmqbo7FWwSNp4ysyGqQy3lHKXzhvj+HUPFxiAiIM7NUsHY08vQ
 SPXStqqUP2d7bQGFP8VUlYYgLgPgrLLmY6OppRCWzTSf6J/t76O55wAHRNPWkCetoLM1Ob0zVVU
 YBjJSOYkAlpxI/+nwMsQtvT0nwCHJEuXrV0Q2nqDS06tKLguDtuTfEFrvA+74gSf3rXKA6179d3
 ZYamjDdEiEOmoEdmwHwqTdkWcmKisCQ5rRLson7skP33iCtNVCA60NRauHYN88OPrK1p9N8Vlmo
 AcrSRWukVLy2izqyPKQ==
X-Proofpoint-GUID: uVqvejVxYk42a7oa_lzYxZ_jjG55ud-N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxNCBTYWx0ZWRfX8yIC6boD7Rav
 6KcSvCbj48ZVVsAkYjMY70z3ASi+ieYK0ze2x7dyAWuW7fe4R4JA9SE98ePY4MouEr3jFBNzPIa
 jtBbzsuAoFFvQ1/AdkLwMXVENWIeTTGMY2WuJujxM0e7z26/RHpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010014

ntfs_dir_emit() calls ntfs_iget5() to refine the directory entry type
by reading the child inode's MFT record.  However, ntfs_dir_emit() is
called from ntfs_readdir() under the parent directory's ni_lock, and
ntfs_iget5() -> mi_read() tries to acquire ni_lock on the child inode
with the same lock class, triggering a recursive locking deadlock.

Remove the ntfs_iget5() call.  The dt_type derived from the directory
entry's FILE_ATTRIBUTE_DIRECTORY flag is sufficient for readdir.  The
original code's own comment noted this approach was "not good idea".

Reported-by: syzbot+17f812893d5906837f33@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 fs/ntfs3/dir.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 873d52233003..07de564a2c47 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -327,22 +327,6 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 	 */
 	dt_type = (fname->dup.fa & FILE_ATTRIBUTE_DIRECTORY) ? DT_DIR : DT_REG;
 
-	/*
-	 * It is not reliable to detect the type of name using duplicated information
-	 * stored in parent directory.
-	 * The only correct way to get the type of name - read MFT record and find ATTR_STD.
-	 * The code below is not good idea.
-	 * It does additional locks/reads just to get the type of name.
-	 * Should we use additional mount option to enable branch below?
-	 */
-	if (fname->dup.extend_data && ino != ni->mi.rno) {
-		struct inode *inode = ntfs_iget5(sbi->sb, &e->ref, NULL);
-		if (!IS_ERR_OR_NULL(inode)) {
-			dt_type = fs_umode_to_dtype(inode->i_mode);
-			iput(inode);
-		}
-	}
-
 	return dir_emit(ctx, (s8 *)name, name_len, ino, dt_type);
 }
 
-- 
2.43.0

