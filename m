Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52A13D2BA
	for <ntfs3@lists.linux.dev>; Wed, 17 Apr 2024 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713359184; cv=none; b=gYfoXuI/PD3nvRnslL03tVWMC9m7eOZpRI+uNIBull8TXHBVtv0N2zaxZfzAqRwuevsqTgrewukFxFry8N5oAHfTlpcjrit2y+MTCdRzJpiu7tI5vA3N403Bgb04pUmW+fjyix2EK8yIrs8VKIhU0MET2nD41EhP4jf1tUKwmCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713359184; c=relaxed/simple;
	bh=o2Pgs/OHVyxb8mEbOBd0XpJqiR9GMrCKt0nOnueqKXY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QE9eR7vFQ1aRzmEq46e23roTa8Y4gRFkfDuHbM7zMahQGVowX1Yrff5c+CnIkTlifnRRfmB8fyFAvYhRtibrBE+7OF7qMlAMI0nmqUIKLS/cW6A/Zs0YdpdRvapXxgWEXYoylMe/wMWDNc6m3aNByAz7lp/66+rSELe2lCWBqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=LuZVpP1n; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=giFrNiZh; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="LuZVpP1n";
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="giFrNiZh"
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 4BA492126;
	Wed, 17 Apr 2024 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1713358732;
	bh=x+Bby5lC0g9OLE4iwMauFcXl4HfEIHzHrb5HCchtf4s=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=LuZVpP1nFq0Qm4yxVRUAhTHFcbjiLRXLtlC8bp3Dk6Tvhl1ArB/wR7hYOET2lw47d
	 LinyybqqDtpdqro4a6OXnGw6vpNpay44Cs6cHkNFfsyjFOL19SGChueGG2YulRrM2f
	 RPIIv/xe/lA/Fr19x12JdeXWPRgULHfSAfT0GdQE=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3B76035D;
	Wed, 17 Apr 2024 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1713359181;
	bh=x+Bby5lC0g9OLE4iwMauFcXl4HfEIHzHrb5HCchtf4s=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=giFrNiZhMuFUBviOnDgmEsuzFBpvUkRfrCC0Kb13mvyjf8Nn5S1vhgrWJBwoPEumw
	 ofiFcl9/9HfJY1OQwhUAWbj6iLkyrvrJb7ZZb+AfPQUnGuxok4quC1v6EiGnIDq9uS
	 dtOZuyKSOHX7Veu/4BvbbU5LifUVjUx1Jwsi756s=
Received: from [192.168.211.39] (192.168.211.39) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 17 Apr 2024 16:06:20 +0300
Message-ID: <02e53c60-92f6-4d43-a9a1-bf4c17ec021e@paragon-software.com>
Date: Wed, 17 Apr 2024 16:06:20 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 04/11] fs/ntfs3: Use variable length array instead of fixed
 size
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>
References: <6c99c1bd-448d-4301-8404-50df34e8df8e@paragon-software.com>
Content-Language: en-US
In-Reply-To: <6c99c1bd-448d-4301-8404-50df34e8df8e@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/ntfs.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 9c7478150a03..3d6143c7abc0 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -59,7 +59,7 @@ struct GUID {
  struct cpu_str {
      u8 len;
      u8 unused;
-    u16 name[10];
+    u16 name[];
  };

  struct le_str {
-- 
2.34.1

