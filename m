Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12AA19D08C
	for <ntfs3@lists.linux.dev>; Tue,  1 Oct 2024 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773872; cv=none; b=rafPEYxqcsEiQAG7OncUWgrMlH9Ficb9swobXqMTJvBQYMn1Dey7VwcHUL1Nbkk1NIdqiz6KxRw+xjzU5hspDGI6dpVnzCxE9N3XReqxnNL1WL7qIvupYnn2vz3KqdGbnsi8v24oi3sBq5Whkg6Ygbs5AhU42m89+GEy/sdoyC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773872; c=relaxed/simple;
	bh=7k/5o1HAg5qN5PYpaV6stAZREYaSBDJ4AbVCql/Hvd8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XZ7ZSeGmW8kptEVpDuDfu3lbYjbRh/WOmEEiWQs+82mXrbUP3IuTZFX8sNde6imH0KZW7TIR7iRBZqBc1MrNEzbnrmOmEl86xRCJgffoKBKxu3IzBUPZinqizaNMW54SbnZ+s2zxy6q2pEUNpzX3Pbkdpld5vPH30UIyG6fjFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=NVvc2SKa; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=S9CpcJOn; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="NVvc2SKa";
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="S9CpcJOn"
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id A6FF41D0D;
	Tue,  1 Oct 2024 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1727772831;
	bh=lTL5kV1FaGlBjXGXe1kivpIvLiQYYeyM747ebz1mGJY=;
	h=From:To:CC:Subject:Date;
	b=NVvc2SKaE0mLiZ5toc/P7gTjNv2vXc5CLKjZcTor1EltdvC5wmJq6eYW07SbUTc1n
	 eFBPXNW0RLErj/dC93HIkH50AvwmDQAcIoU7P9aQGYQnxOvK+cLWtVelkIe8yEhGSn
	 62ocZ/gg6g6FekSJZUax8/ErsReFfIeP4bhQzyyM=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 4669421F1;
	Tue,  1 Oct 2024 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1727773285;
	bh=lTL5kV1FaGlBjXGXe1kivpIvLiQYYeyM747ebz1mGJY=;
	h=From:To:CC:Subject:Date;
	b=S9CpcJOnchoyWBpWvCpxdMbnq0uco2Mj/DlNyp13tERCd3R90kpSpV+VnUjXSZQus
	 rK94ZaK1nm6HCuDkPkqkQ81y3k0dHIeuOOoykzRiBYzhBCAd49HvawJKfc/SMUz/3I
	 7NWQ92EMf70f+YRZKS0BtUcGBROM+Zm58pANQ9eM=
Received: from ntfs3vm.paragon-software.com (192.168.211.162) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 1 Oct 2024 12:01:24 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/6] Syzbot bugfixes and refactoring
Date: Tue, 1 Oct 2024 12:00:58 +0300
Message-ID: <20241001090104.15313-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Mostly fixes of problems that syzbot shows.

Konstantin Komarov (6):
  fs/ntfs3: Fix possible deadlock in mi_read
  fs/ntfs3: Additional check in ni_clear()
  fs/ntfs3: Sequential field availability check in mi_enum_attr()
  fs/ntfs3: Fix general protection fault in run_is_mapped_full
  fs/ntfs3: Additional check in ntfs_file_release
  fs/ntfs3: Format output messages like others fs in kernel

 fs/ntfs3/file.c    |  9 ++++++++-
 fs/ntfs3/frecord.c |  4 +++-
 fs/ntfs3/inode.c   |  5 ++++-
 fs/ntfs3/namei.c   |  2 +-
 fs/ntfs3/record.c  | 15 +++++++--------
 fs/ntfs3/super.c   | 13 +++++++++----
 6 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.34.1

