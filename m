Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A46188733
	for <ntfs3@lists.linux.dev>; Wed, 16 Apr 2025 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744783444; cv=none; b=T6JOZ4CO36L2is9wfPvw1JowdZuYGn/6JWwA2kFwmTkudyrRjQTg0rx/hEeBjPAOVLNbVJV7h8smtJUOOWDAlAy4oL2OJU8Mclq5snQVBKefkxixZKJMH+GBmubI+aaIn6LW7R691CgiMyS4TX9IKp7xDfiA2sQJY0bd4PdzxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744783444; c=relaxed/simple;
	bh=4MDKCGkDUE/VV29m/nvWYOckWsDczyJcPwJQL/LFEGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXrBkr4gOizLZoM5/UHF7h/E7yb0YaeqXlOdA1rO013nOyUL/VJpH6LsJ8ZshU2xCDQq9BXfQNVTDNPlDYeFmKXA9IEz+WN8YXdxzNcTUwDMTRv8jE2jbQjncZSLD5fbGVv7nEf6lXPxlcyKhqQOVnM07N93L2s+/ecHn1ctamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G5T7WW003339;
	Wed, 16 Apr 2025 06:03:55 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2m8pfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Apr 2025 06:03:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 15 Apr 2025 23:03:54 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 15 Apr 2025 23:03:51 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <hch@infradead.org>
CC: <almaz.alexandrovich@paragon-software.com>, <brauner@kernel.org>,
        <jack@suse.cz>, <linux-fsdevel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lizhi.xu@windriver.com>,
        <ntfs3@lists.linux.dev>,
        <syzbot+e36cc3297bd3afd25e19@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>, <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V2] fs/ntfs3: Add missing direct_IO in ntfs_aops_cmpr
Date: Wed, 16 Apr 2025 14:03:51 +0800
Message-ID: <20250416060351.2971835-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z_9Bou858C-pJnmd@infradead.org>
References: <Z_9Bou858C-pJnmd@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cH3Omw0ffxpczzBLqApii_YH40AfYMjL
X-Proofpoint-GUID: cH3Omw0ffxpczzBLqApii_YH40AfYMjL
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=67ff484b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=b4dnZuen8jT_dhO8QXEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=758
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504160048

On Tue, 15 Apr 2025 22:35:30 -0700, Christoph Hellwig wrote:
> > > > The ntfs3 can use the page cache directly, so its address_space_operations
> > > > need direct_IO.
> > >
> > > This sentence still does not make any sense.
> > Did you see the following comments?
> > https://lore.kernel.org/all/20250415010518.2008216-1-lizhi.xu@windriver.com/
> 
> I did, but that changes nothing about the fact that the above sentence
> doesn't make sense.
In the reproducer, the second file passed in by the system call sendfile()
sets the file flag O_DIRECT when opening the file, which bypasses the page
cache and accesses the direct io interface of the ntfs3 file system.
However, ntfs3 does not set direct_IO for compressed files in ntfs_aops_cmpr.
