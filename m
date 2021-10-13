Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC56D2C81
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kwfQLb7O9l96WELHgKkQp9uAWAHVStsZsqmvY42uDo4=; b=Js2OVKVfiBuoQhUaPUfmkclx7M
	vrcm9EA/k/58MnCVYR8evsjUq/8YSxHWrce4AslfsXGvyvTdhhqIyGJPATvDxpqQoD9IScte+hEkz
	DnB3FboglDfnuxse6DhZbT7kv4ybTwHy3r7ZExgrRfNsTj/EtZ/9HExURYmOO5GKGASY9oD12P8bt
	oLK99Yr3VXl9XkDp+Wc1ZhWpJWTkh33e4joQUxjU/cGOr5BdZGSsLck2z425Mw/QlOZ43bY9ROw+f
	Tq43ONvwIFJHr+HX+y1s/mwjBNvb8CC05HJyiYVwEqZEtf52eABp80sHiXOw2OyQ26fsS7F3Q7HqZ
	7cPBt4fA==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63] helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWzm-0078GH-5A; Wed, 13 Oct 2021 05:40:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Kees Cook <keescook@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	dm-devel@redhat.com,
	drbd-dev@lists.linbit.com,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	ntfs3@lists.linux.dev,
	reiserfs-devel@vger.kernel.org
Subject: [PATCH 25/29] ext4: use sb_bdev_nr_blocks
Date: Wed, 13 Oct 2021 07:10:38 +0200
Message-Id: <20211013051042.1065752-26-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013051042.1065752-1-hch@lst.de>
References: <20211013051042.1065752-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the sb_bdev_nr_blocks helper instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0775950ee84e3..3dde8be5df490 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4468,7 +4468,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto cantfind_ext4;
 
 	/* check blocks count against device size */
-	blocks_count = sb->s_bdev->bd_inode->i_size >> sb->s_blocksize_bits;
+	blocks_count = sb_bdev_nr_blocks(sb);
 	if (blocks_count && ext4_blocks_count(es) > blocks_count) {
 		ext4_msg(sb, KERN_WARNING, "bad geometry: block count %llu "
 		       "exceeds size of device (%llu blocks)",
-- 
2.30.2

