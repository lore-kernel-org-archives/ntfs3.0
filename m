Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7367629CA
	for <ntfs3@lists.linux.dev>; Tue,  7 Dec 2021 10:40:20 +0000 (UTC)
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
	by mail.avm.de (Postfix) with ESMTP;
	Tue,  7 Dec 2021 11:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1638873099; bh=mEkW23Z2qwj44HxU2Tvdfgtn8elOwAvB6st6wLlG6Hc=;
	h=From:To:Cc:Subject:Date:From;
	b=SFx2AEioWVrV1ZzgEQ/xKxxPu3BCEHdDTcsVhTsm8yb4ByavarNqnlD0BkmsBW79T
	 HvX4Euu6LGFDKUBXbkIJUeS2XnOpUNmH7/lrdoDjQg3MRwADOE5r87kN32I7TMcq0N
	 NulvayxVOHSefOGQETfWtsu/F1E343eEPBenlomI=
Received: from tkh-linux.avm.de ([172.17.33.53])
          by mail-notes.avm.de (HCL Domino Release 11.0.1FP4)
          with ESMTP id 2021120711313889-7964 ;
          Tue, 7 Dec 2021 11:31:38 +0100 
From: =?UTF-8?q?Thomas=20K=C3=BChnel?= <thomas.kuehnel@avm.de>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Thomas=20K=C3=BChnel?= <thomas.kuehnel@avm.de>
Subject: [PATCH 0/3] fs/ntfs3: Fixes for big endian systems
Date: Tue, 7 Dec 2021 11:24:52 +0100
Message-Id: <20211207102454.576906-1-thomas.kuehnel@avm.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on ANIS1/AVM(Release 11.0.1FP4|October 01, 2021) at
 07.12.2021 11:31:38,
	Serialize by Router on ANIS1/AVM(Release 11.0.1FP4|October 01, 2021) at
 07.12.2021 11:31:38,
	Serialize complete at 07.12.2021 11:31:38
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: 149429::1638873099-0000056E-C86E274E/0/0
X-purgate-type: clean
X-purgate-size: 1146
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

I tried running the NTFS3 driver on a MIPS big endian system and
noticed various errors when it tried to access bitmaps structures
that are stored as little endian on disk.

These patches were mainly tested in a qemu mips environment.

I'm open for suggestions how to better implement the second patch
"add functions to modify LE bitmaps". It adds copies of two functions
from lib/bitmap.c but modified to work with little endian bitmaps.
Other filesystems seem to have similar functions defined locally like
le_bitmap_set in btrfs or ext4_set_bits in ext4 but no global
implementation exists.

Thomas Kühnel (3):
  fs/ntfs3: fix endian conversion in ni_fname_name
  fs/ntfs3: add functions to modify LE bitmaps
  fs/ntfs3: use _le variants of bitops functions

 fs/ntfs3/bitmap.c  | 56 +++++++++++++++++++++++++++++++++++++++-------
 fs/ntfs3/frecord.c |  4 +++-
 fs/ntfs3/fslog.c   |  4 ++--
 fs/ntfs3/fsntfs.c  |  8 +++----
 fs/ntfs3/index.c   | 14 ++++++------
 fs/ntfs3/ntfs_fs.h |  3 +++
 6 files changed, 67 insertions(+), 22 deletions(-)


base-commit: 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
-- 
2.25.1

