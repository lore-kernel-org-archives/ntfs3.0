Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB47D360
	for <ntfs3@lists.linux.dev>; Mon,  8 May 2023 12:42:03 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B8E2721BF;
	Mon,  8 May 2023 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683549018;
	bh=9begeHXraN6fo2OStpq54sEXJ2GZ2yKBbkYdZ+ALqSI=;
	h=Date:To:CC:From:Subject;
	b=WZK6NzzwX0zGm1dTq7VLEVZd8DNjIMkEL6ZocCOh277Z6HcwFienO2gaNkwvCYf8j
	 7IgKAXygJP5j+hfL4qkaZgRYLQ3DechvcFIyE/EUMbqbuwu6e9d+RruKvAzm46ZRHN
	 dmLjIBTD1YVkdpKzYme7Y9xmsxZo4PubflItDp1E=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 69342218A;
	Mon,  8 May 2023 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1683549305;
	bh=9begeHXraN6fo2OStpq54sEXJ2GZ2yKBbkYdZ+ALqSI=;
	h=Date:To:CC:From:Subject;
	b=PQx5VbI2bJrfsBUbl7lsC6ghYs77Fc1hDyRkQacBDPTBlqyPDTcRRPCggLqHBXHy0
	 i6QgLRZsDQin8BlqbupQzvnQCRIgJdoTc2ulWYrgjw85ZSqra86jE4BPyGUs8FtwBD
	 Qs5OfztonrHZBxIQi7wKNDiXnlfNaSiQ7QWn3LrI=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 8 May 2023 15:35:04 +0300
Message-ID: <b21a4bc9-166d-2631-d73b-cb4e802ff69e@paragon-software.com>
Date: Mon, 8 May 2023 16:35:04 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 00/10] Refactoring and bugfix
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This series contains various fixes and refactoring for ntfs3.
The loading has been slightly revised.
Added support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label.

Konstantin Komarov (10):
   fs/ntfs3: Correct checking while generating attr_list
   fs/ntfs3: Fix ntfs_atomic_open
   fs/ntfs3: Mark ntfs dirty when on-disk struct is corrupted
   fs/ntfs3: Alternative boot if primary boot is corrupted
   fs/ntfs3: Do not update primary boot in ntfs_init_from_boot()
   fs/ntfs3: Code formatting
   fs/ntfs3: Code refactoring
   fs/ntfs3: Add ability to format new mft records with bigger/smaller
     header
   fs/ntfs3: Fix endian problem
   fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and
     /proc/fs/ntfs3/<dev>/label

  fs/ntfs3/attrib.c   |   2 +-
  fs/ntfs3/attrlist.c |   3 +-
  fs/ntfs3/bitmap.c   |  10 +-
  fs/ntfs3/file.c     |   4 +-
  fs/ntfs3/frecord.c  |  54 +++++----
  fs/ntfs3/fslog.c    |  40 +++----
  fs/ntfs3/fsntfs.c   |  99 ++++++++++++----
  fs/ntfs3/index.c    |  20 ++--
  fs/ntfs3/inode.c    |  23 ++--
  fs/ntfs3/lznt.c     |   6 +-
  fs/ntfs3/namei.c    |  31 ++---
  fs/ntfs3/ntfs.h     | 117 +++++++++++--------
  fs/ntfs3/ntfs_fs.h  |  31 ++---
  fs/ntfs3/record.c   |  10 +-
  fs/ntfs3/run.c      |   4 +-
  fs/ntfs3/super.c    | 279 ++++++++++++++++++++++++++++++++++++++------
  fs/ntfs3/xattr.c    |  16 ++-
  17 files changed, 516 insertions(+), 233 deletions(-)

