Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA19B33F59D
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869462; cv=none; b=f3grI8StGoeBPIu9iVMRP0UrZB6P1cBRsxx0UhS7Ds6hI3/g2zR4vA0PUzpOm6wECg2T/rENv3+j3FvNl9JdBdStBS50UBLO7+/yHMO2k2stp+a6YpLZttQ5eaqd5zWvqG77tbI/qQTUbe9rUjEs/q/XrJ6+1Vf+c5ukU+SkMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869462; c=relaxed/simple;
	bh=wxGD9cWc2azet8gGKWEHDd1rHgspbfOicn5WEJylvi4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SkWMPJUVVC82ZeH0MKpHH3X0VpghX303xpP6T1k6vHiOZFdiwNgbU0RLxtxnm8mmgaKlaqi7tQXZ2hw1djc8xUkxY2Wm0IURHO0UXh1El7L7rhblZm+1AgkveEQuNR0UcGgHskVHQTFJ0VxCzz4oofHveyIT7r07GAKNOw6O8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NWjkvk7X; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="NWjkvk7X"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661105Qi2350936;
	Tue, 30 Jun 2026 18:30:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ebrj4tiGf
	/wKmYtx2SAxQ8143BlM+MTHINyc19ejgjk=; b=NWjkvk7XjT/4u+IJA7lkTD2LS
	XoIzrF3hGFO+HQ580tjkg4VWd7C7jw0Bcm6evtFWPaoMHhyky6EfBEIrWkj4Q8Zu
	z8PhTTzjZMHfARKjtz237c6iWPGKrDKjfa3GsOuPTjT/i7nbz8u4m6XbcdN3qnQc
	KVCuIXPhQ4yh47P5nrausl4qeJ0sK2mqVYr05WezQCBTGdXJiSlKbNwQLQMrzz9e
	XtC+WS7l0amVmcJ0fyEOuKLzl8gWoeAvUvMQVcOdTU3iZ355sihTCoZpk4GR3EJo
	C4zUBCD4z9vryEuxvUeKpfM+CPPKJwGkCf2fYobAd1lQkIfUqxq4oE+/jgxuw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f2e1gvqag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2026 18:30:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 18:30:51 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 18:30:50 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <almaz.alexandrovich@paragon-software.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <yun.zhou@windriver.com>
Subject: [PATCH 0/2] ntfs3: fix deadlocks in ntfs_readdir caused by ni_lock held across dir_emit
Date: Wed, 1 Jul 2026 09:30:47 +0800
Message-ID: <20260701013049.3141386-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dUp9CooZofAziEdGPyNBZpXFdAjAPuY4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxNCBTYWx0ZWRfX30hKVg4f1XUg
 VS5tnh+9AhX4lB3OLzybZ/qZsUX1J6qwNLVqNY/kEdkz56piK9c0/rItJLJ5d2HaWwIZP3HNlei
 2dqDB209tTDrzF9unqsgRn3Onu3hB+tmJBVarIW9nDATRF2iAIPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxNCBTYWx0ZWRfX3R8UKlILJKMR
 jTlQTW3PksE0HdyzenK8sK2ScG/4fIArSBSewrZrU9mSr+uN4VSgxvK8exzpljmJxz/PZ4dNu5k
 gNVA8Kf/O7iCaP96qXF+Vh9/R9kIMeo14bFtKL89xDEjw0E3S9XXWlDqE/61tuCrkHv6+Dz5VDe
 Oo6W2A/GpenJtCtlqqHitC8ZaHKDrdtJXV3Y0hAvR6AAq0lPfcCy+OVS3xabJcToj9Ed3R05ofd
 wW+CwQGmTInCpbfW+m+U7NZ6W8pKnQUkRMzVwz3dkW/Ty5TvfjUg19c4M3BsA2ThdgrYHue0w4F
 2OcwT8OvQn2BaXnnebwfZS1/6b6VT2PN3MO9jIzlarfsidjdOAToRkPhj1FhbSWnDgO7AvEhUEr
 P7/bo5fv1nNlQsXugZRXm8SKPfyNzF2M0hil35F6E6ZOYFcH5Ac1vZF6jCtYn7bddk1OydvPE/e
 aBgfnpfJr6zJRU70ukg==
X-Proofpoint-GUID: dUp9CooZofAziEdGPyNBZpXFdAjAPuY4
X-Authority-Analysis: v=2.4 cv=GsByPE1C c=1 sm=1 tr=0 ts=6a446dcc cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=spbit3rD88FpXyyur84A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010014

Commit d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata
walk") extended ni_lock to cover the entire directory walk in
ntfs_readdir(), including dir_emit() calls that copy data to userspace.
This introduced multiple deadlocks reported by syzkaller:

1. Recursive ni_lock: ntfs_dir_emit() -> ntfs_iget5() -> mi_read()
   tries to acquire ni_lock on a child inode with the same lock class
   while the parent's ni_lock is already held.

2. Lock-order inversions: dir_emit() may trigger page faults that need
   mmap_lock or mapping->invalidate_lock, conflicting with paths that
   acquire those locks before ni_lock (ntfs_fallocate, mmap).

This series fixes both issues:
- Patch 1 removes the ntfs_iget5() call that caused recursive locking.
- Patch 2 releases ni_lock before calling dir_emit(), using the XFS
  approach of reading data into stable buffers under the lock, then
  emitting to userspace after releasing it.

Yun Zhou (2):
  ntfs3: remove ntfs_iget5 call in ntfs_dir_emit to fix recursive
    deadlock
  ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix
    deadlocks

 fs/ntfs3/dir.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

-- 
2.43.0

