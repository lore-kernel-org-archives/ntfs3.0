Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC91714B3
	for <ntfs3@lists.linux.dev>; Wed, 16 Apr 2025 06:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784320; cv=none; b=KG4Vt5T4itMw38Ruv07gIcSbQriu8LBxNAGbdcC/TIJ9mkM9JrcNcMHbFGKK841sqnHZdMBRc7FGWlnbDBnNNpwton7vO8o18ib7sMIc27Nn5OduwELoJ13mK60RPkifs8njDOiIaZzZ7pwNjdVGktQ/JM/CcNC6fkFwPF8QDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784320; c=relaxed/simple;
	bh=suSMq9iVHxQM5u7UB4YBN9mUydNJQLH2Jg1AhbkJWHs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJaXJ2ED+IcNDiJrC4AelhNOwFDYHbBuPp1tsx9RBcUW6r3TnWp6mTOqx5S680weUKND6BdKXT/d9f2rn9fCG8/+JhTcbDVF3JDF8dxXG19icbFoCaKKWaXrtIPpYuO8yyMMFMn67E2eQmazqR0B6MqEkRaYB8rAFNmgFGWlrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G5thZ9013510;
	Tue, 15 Apr 2025 23:18:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkm3dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Apr 2025 23:18:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 15 Apr 2025 23:18:31 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 15 Apr 2025 23:18:28 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <hch@infradead.org>
CC: <almaz.alexandrovich@paragon-software.com>, <brauner@kernel.org>,
        <jack@suse.cz>, <linux-fsdevel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <ntfs3@lists.linux.dev>,
        <syzbot+e36cc3297bd3afd25e19@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>, <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V2] fs/ntfs3: Add missing direct_IO in ntfs_aops_cmpr
Date: Wed, 16 Apr 2025 14:18:27 +0800
Message-ID: <20250416061827.2995095-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z_9IxOypdO5Ks44N@infradead.org>
References: <Z_9IxOypdO5Ks44N@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BnqVxG8VK0WFqjPmkANnMIqWHjR1nEQU
X-Proofpoint-GUID: BnqVxG8VK0WFqjPmkANnMIqWHjR1nEQU
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=67ff4bb8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=Lu9379bB4VU3hevTGzEA:9
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=736 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504160050

On Tue, 15 Apr 2025 23:05:56 -0700, Christoph Hellwig wrote:
> > In the reproducer, the second file passed in by the system call sendfile()
> > sets the file flag O_DIRECT when opening the file, which bypasses the page
> > cache and accesses the direct io interface of the ntfs3 file system.
> > However, ntfs3 does not set direct_IO for compressed files in ntfs_aops_cmpr.
> 
> Not allowing direct I/O is perfectly fine.  If you think you need to
> support direct I/O for this case it is also fine.  But none of this
> has anything to do with 'can use the page cache' and there are also
The "The ntfs3 can use the page cache directly" I mentioned in the patch
is to explain that the calltrace is the direct I/O of ntfs3 called from
generic_file_read_iter().
