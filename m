Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9681213B792
	for <ntfs3@lists.linux.dev>; Mon, 26 Aug 2024 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661489; cv=none; b=nOqr5yoYzkaKYFlPVN6X5TwdSycfIFenQbygrQlKMHkJ1tGymb+8luXuQaFwiDhZQz2aCEYbNBUY4penJiC7vhOEcNe5zzSKfLqtORvQXJepym75uwxfpdtk+CcliSS/qngNjTyWXzS7EGISvTxgnJoEzaTlapmL4VzILqBX8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661489; c=relaxed/simple;
	bh=f6WOKgUZX0rd1q010kiIRrMVJGZK+oOgf0rw6HjJRd8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEeKoqOik1P6NtuHkJpVCAZ1rqx64vl8tnMbN6PRU54ehNRm6r4iI0XWsuo3VoYIxBlCYnl+Rq7R9BT4k795tsnOmkDPswqUQIbVTqAsrjtzI/APwJNffwQk+ODGfzCPAlxRCsH3j3xA238KCzVPstdjU1LKYmXAcT9sETzqJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=o82HGZfq; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=HTkJhELW; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="o82HGZfq";
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="HTkJhELW"
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3A9582140;
	Mon, 26 Aug 2024 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724661011;
	bh=GicoWd5fQBsfs00lq6bWLZ+mh02c48OxcW4/4s0XrdE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o82HGZfqiiwJ9FAOWiW0j4Mg1KGM7GXqGZSu4q+0NUioMPCOSvOXBgJLyeHG3av0Q
	 VD76odA2YS0BSUkaqQeCe2KuuTdxAwbjYMNki0UzUSxBOPwRoDmJ2yOHCCkhMuVBgR
	 W7/QTAhthCAVgc31tw2GPSJNiYFsK9GJnw0X6emw=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E3AA3211A;
	Mon, 26 Aug 2024 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724661484;
	bh=GicoWd5fQBsfs00lq6bWLZ+mh02c48OxcW4/4s0XrdE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HTkJhELWXNyyt08IaEflxoLtnyl0qER1KXUI6xs7/lFu8q0a9hU7vAJbRJHK27pob
	 OFbJa6inOpV/Ntdtm2xU/LsgXvn3SMQfjjIS/cLVEHkceVzJVi5WEltXGSj0MVTTkb
	 pyHGK7Lu2oX2yYaH7j2b695QHBl0yCTmaYC1F3us=
Received: from ntfs3vm.paragon-software.com (192.168.211.172) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 26 Aug 2024 11:38:04 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <hoditohod@gmail.com>
CC: <ntfs3@lists.linux.dev>, <almaz.alexandrovich@paragon-software.com>
Subject: RE: Crash in ntfs_iget5 on mounting
Date: Mon, 26 Aug 2024 11:37:57 +0300
Message-ID: <20240826083757.10048-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAG3GjfM2o9nEutyF0fO_tv1tid8mhmAR0GvXNEBkWFEx7TKojw@mail.gmail.com>
References: <CAG3GjfM2o9nEutyF0fO_tv1tid8mhmAR0GvXNEBkWFEx7TKojw@mail.gmail.com>
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

Hello, Gyorgy.
At the moment, I can't say with 100% certainty whether this is an issue
with the ntfs3 driver.
Patch
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6f861765464f43a71462d52026fbddfc858239a5
at the filesystem level seems to indeed resolve the problem (with a code that is far ahead of 6.1.83).
The second, independent cause might be incorrect attributes enumeration.
As Lei Lu points out, there is an issue here:
  https://lore.kernel.org/ntfs3/20240823133944.211852-1-llfamsec@gmail.com/T/#u

Regards, Konstantin
