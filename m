Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78431459E8
	for <ntfs3@lists.linux.dev>; Fri,  5 Jul 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720187584; cv=none; b=RnmQbkdGpVb+4Gnnm90SNyCvEojssPzyCNY5G/ztYTxRXoVxuBA0dGy7RWhchYXyF7x1ROVUwQ05gS4CillRgSISdKWIne+vUl4NrvfAEyNJu+kWIO3QJBryerVvaQKU52uULfNeYwMqwqNyTNpsgWdSbSuzrb4kT2W3ds5pExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720187584; c=relaxed/simple;
	bh=sm118sAxchGuKFASZW6P4OZONsrrpdlZZiLkYDBahYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHoF//bC/qM8uqIPeNDTviQsaO0pCQKyU2k4bwtpyRvtl4OA3RgSvZizmlycCipE1/Q1gtePV5ZgZ9lZ7DXN3nbo61fDNXrtRkXLcQ7I7iYHw2IU7ptqf8fiqSG7k8R+fHHiQDUr9Ln4Y5Ye1Feh9s0OJ1U/hjfvV50DfeERIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465DfQnK032117;
	Fri, 5 Jul 2024 06:52:53 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jp1hfp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 05 Jul 2024 06:52:53 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 06:52:52 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 5 Jul 2024 06:52:50 -0700
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <dvyukov@google.com>
CC: <almaz.alexandrovich@paragon-software.com>, <linux-kernel@vger.kernel.org>,
        <ntfs3@lists.linux.dev>, <linux-fsdevel@vger.kernel.org>,
        <syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in mi_enum_attr
Date: Fri, 5 Jul 2024 21:52:50 +0800
Message-ID: <20240705135250.3587041-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACT4Y+ZWjUE6-q1YF=ZaPjKgGZBw4JLD1v2DphSgCAVf1RzE8g@mail.gmail.com>
References: <CACT4Y+ZWjUE6-q1YF=ZaPjKgGZBw4JLD1v2DphSgCAVf1RzE8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mYGhZTdY-0RCetm-QbEqRWmKnBK1oLTg
X-Proofpoint-ORIG-GUID: mYGhZTdY-0RCetm-QbEqRWmKnBK1oLTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=760 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407050099

On Thu, 4 Jul 2024 15:44:02 +0200, Dmitry Vyukov wrote: 
> > index 53629b1f65e9..a435df98c2b1 100644
> > --- a/fs/ntfs3/record.c
> > +++ b/fs/ntfs3/record.c
> > @@ -243,14 +243,14 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
> >                 off += asize;
> >         }
> >
> > -       asize = le32_to_cpu(attr->size);
> > -
> >         /* Can we use the first field (attr->type). */
> >         if (off + 8 > used) {
> >                 static_assert(ALIGN(sizeof(enum ATTR_TYPE), 8) == 8);
> >                 return NULL;
> >         }
> >
> > +       asize = le32_to_cpu(attr->size);
> > +
> >         if (attr->type == ATTR_END) {
> >                 /* End of enumeration. */
> >                 return NULL;
> 
> Hi Lizhi,
> 
> I don't see this fix mailed as a patch. Do you plan to submit it officially?
Hi Dmitry Vyukov,
Here: https://lore.kernel.org/all/20240202033334.1784409-1-lizhi.xu@windriver.com

--
Lizhi
