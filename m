Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908F3D61
	for <ntfs3@lists.linux.dev>; Wed, 14 Sep 2022 11:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1663154217; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=BJwEfHEXjRmXkFkHW+Om2xekj3PQzcIMUuwislfMvWQu9fzA4tgFJWYEmJMVbDniPhluuUjCcScGBZrJ89VHk1mhYtxa36Y2OcYuNgp/9f2LHgNtYGLXxQAS3/BFSINlssSO3SZto7acP1XcN/RkFX6i26yuDFUeSOK5SGqMGDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1663154217; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=+llC5L3toh5m6/IGcaq3njngvo8xvm7Ec+Uc9KcqTeM=; 
	b=XOopyJWXFsVIZu9yxu905UBMM2nvyHpnl4CDtGH/h0lJV3VZQ5gLxwtkNdE0jjLUg/JT8VZBakNXYSJAE2zG90N0GFxy2TJmX8ZPmHygMYwWH9itWyv2qC53RxnQVXZksbX+NSfcSCEaPIjCI2RxOdJyknCnu4GYiPj86Tsjl74=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=siddh.me;
	spf=pass  smtp.mailfrom=code@siddh.me;
	dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663154217;
	s=zmail; d=siddh.me; i=code@siddh.me;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+llC5L3toh5m6/IGcaq3njngvo8xvm7Ec+Uc9KcqTeM=;
	b=bRobQpH2xTOa2z5qKvwtR1SAvxlVlVypTbSu8XuKnhGq+8S8hA64iIm2+7nCF+4j
	eNRBQLVEMlivAIu7j/UXzR3NNbJJrWl+NlFVoagjt3ewUfNi5jCh18sgW3aQPJYN+o6
	V6Ux/LjmYINQMhMRNFN1I5xrHaLlJ4ybU4gqXkrA=
Received: from localhost.localdomain (43.241.144.117 [43.241.144.117]) by mx.zoho.in
	with SMTPS id 1663154216126366.814546035366; Wed, 14 Sep 2022 16:46:56 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3 <ntfs3@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Message-ID: <20220914111643.14411-1-code@siddh.me>
Subject: [PATCH] ntfs3: Fix memory leak in ntfs_fill_super()
Date: Wed, 14 Sep 2022 16:46:43 +0530
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8

Mount options ptr wasn't freed before putting the superblock in
ntfs_fill_super(), which resulted in a memory leak.

Bug report: https://syzkaller.appspot.com/bug?id=3D332ba47915d0e39e94b42a62=
2f195f0804ecb67f

Fixes: 9b75450d6c58 ("fs/ntfs3: Fix memory leak if fill_super failed")
Reported-and-tested-by: syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.c=
om
Cc: stable@vger.kernel.org # 5.15
Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 fs/ntfs3/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 47012c9bf505..c0e45f170701 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1281,6 +1281,7 @@ static int ntfs_fill_super(struct super_block *sb, st=
ruct fs_context *fc)
 =09 * Free resources here.
 =09 * ntfs_fs_free will be called with fc->s_fs_info =3D NULL
 =09 */
+=09put_mount_options(sbi->options);
 =09put_ntfs(sbi);
 =09sb->s_fs_info =3D NULL;
=20
--=20
2.35.1


