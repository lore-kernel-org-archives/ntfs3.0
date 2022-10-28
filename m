Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10F2F44
	for <ntfs3@lists.linux.dev>; Fri, 28 Oct 2022 17:08:12 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D9FE9218D;
	Fri, 28 Oct 2022 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1666976731;
	bh=TVrq+vQGb+av6ii3jqQDdjetxf7DCNwUg01zC3qewKs=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=gAXYhGKxNxS9jnSw23PcRE5QSOyUUHsJS9hpwu6oX845dwVSgtxDTaYmuMZIQo+V9
	 6GcmRS4YmY7zplFzNuA4W1Vv6sY0QpIHvQvJNpuO91Or4DaZUNcpoAkRiW6iGxiPDW
	 4YOLMtZiCt+7tdxeyPSwh0Zp4SDG3KDHz2FDJmic=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D903FDD;
	Fri, 28 Oct 2022 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1666976890;
	bh=TVrq+vQGb+av6ii3jqQDdjetxf7DCNwUg01zC3qewKs=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=SP66XS7JeULWj/kAbmS0oBErTfmLbpWHzNenHpvvq2OrXoCm3M8C9xMZEWMk6qhZc
	 JBR1wBN9NqKS5jjlM0i0P5j/gKDLH4fqIkoa37jFcIioV6374q76PrLPFu3uV5N5ao
	 XEkH+gxx84TbiHvTDubs+tUbLMtrwJ0Qes6WjEvo=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 28 Oct 2022 20:08:10 +0300
Message-ID: <2f497702-ace1-9b3e-65d1-a7dc57623372@paragon-software.com>
Date: Fri, 28 Oct 2022 20:08:10 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 14/14] fs/ntfs3: Make if more readable
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <fc5957cc-a71b-cfa3-f291-cb63b23800d1@paragon-software.com>
In-Reply-To: <fc5957cc-a71b-cfa3-f291-cb63b23800d1@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This way it looks better.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/record.c | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index a952cd7aa7a4..defce6a5c8e1 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -265,10 +265,9 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
  		if (t16 + t32 > asize)
  			return NULL;
  
-		if (attr->name_len &&
-		    le16_to_cpu(attr->name_off) + sizeof(short) * attr->name_len > t16) {
+		t32 = sizeof(short) * attr->name_len;
+		if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
  			return NULL;
-		}
  
  		return attr;
  	}
-- 
2.37.0


