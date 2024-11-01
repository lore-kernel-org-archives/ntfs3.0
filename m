Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F5153801
	for <ntfs3@lists.linux.dev>; Fri,  1 Nov 2024 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449590; cv=none; b=rxK8Lv3cKNbS3ttgm46M2APa5V9Wq0RO2ioC7pJu5t6WenspMWQdtXhgnCTFyJlQzkmHA9ocEbRAE+ywsiP8GyAyA7+XBEFLNWYdVjY4Fkmu6NOwv61Cf3lUXPJReLFYHXTT3g9u/P+RRU8Ns8foYBAC1xG6bh7BI7MaKR/7GUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449590; c=relaxed/simple;
	bh=g7eIdBsOsPzOm5qji0coNyVwB11i3SnzrvsU/3XmHLI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2FhjgR/I7JXw6yd3DJn2fhP353Ii74koOaimanNboBSxGIhOpcervEqX0NxuXsBHgkUT3qcgKt7stiRus4hdP3einidfU3wDkHSbL3FLSt5l0epEROCl9M+7SFKDUgprKYynJjyLlogbUerAkMry8IBJvCO4RkhuSi7hx9W/3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=SxO+gzkS; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="SxO+gzkS"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 8EECC2191;
	Fri,  1 Nov 2024 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1730448623;
	bh=z4djlGColZmet8W39kJokRepLwxRG/E52YDLYRzCWC4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SxO+gzkSCr3HTJR64qHLnkgMoNT9oCSpjUreOe6fu/TyoZ/5qgHpHAlCjqSXsAzoG
	 eOABgVtQwztWh+smrgt5X9g5jJFNHtOfxLvtjT42GmTTSB8P+rVMEZEVAEGRq5rLpO
	 MTjG4F0DSKyfRdypJdE4M65Vbm20p81URYtZRuy8=
Received: from ntfs3vm.paragon-software.com (192.168.211.142) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 1 Nov 2024 11:18:06 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Matthew Wilcox
	<willy@infradead.org>
Subject: [PATCH 3/7] fs/ntfs3: Equivalent transition from page to folio
Date: Fri, 1 Nov 2024 11:17:49 +0300
Message-ID: <20241101081753.10585-4-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101081753.10585-1-almaz.alexandrovich@paragon-software.com>
References: <20241101081753.10585-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

If using the proposed function folio_zero_range(), should one switch
from 'start + end' to 'start + length,' or use folio_zero_segment()

Fixes: 1da86618bdce ("fs: Convert aops->write_begin to take a folio")
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index e370eaf9bfe2..f704ceef9539 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -222,7 +222,7 @@ static int ntfs_extend_initialized_size(struct file *file,
 		if (err)
 			goto out;
 
-		folio_zero_range(folio, zerofrom, folio_size(folio));
+		folio_zero_range(folio, zerofrom, folio_size(folio) - zerofrom);
 
 		err = ntfs_write_end(file, mapping, pos, len, len, folio, NULL);
 		if (err < 0)
-- 
2.34.1

