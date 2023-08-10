Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F398200BC
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 15:51:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8CD7567373; Thu, 10 Aug 2023 17:51:16 +0200 (CEST)
Date: Thu, 10 Aug 2023 17:51:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 01/13] xfs: reformat the xfs_fs_free prototype
Message-ID: <20230810155116.GC28000@lst.de>
References: <20230809220545.1308228-1-hch@lst.de> <20230809220545.1308228-2-hch@lst.de> <20230810-unmerklich-grandios-281ae311e396@brauner>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810-unmerklich-grandios-281ae311e396@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)

I think the btrfs hunk (below) in "fs: use the super_block as holder when
mounting file systems" needs to be dropped, as we dropped the prep patch
that allows to use the sb as a holder for now.  I'll add it to my resend
of the btrfs conversion.

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f1dd172d8d5bd7..d58ace4c1d2962 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -69,8 +69,6 @@ static const struct super_operations btrfs_super_ops;
  * requested by subvol=/path. That way the callchain is straightforward and we
  * don't have to play tricks with the mount options and recursive calls to
  * btrfs_mount.
- *
- * The new btrfs_root_fs_type also servers as a tag for the bdev_holder.
  */
 static struct file_system_type btrfs_fs_type;
 static struct file_system_type btrfs_root_fs_type;
@@ -1515,7 +1513,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
 		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
-		btrfs_sb(s)->bdev_holder = fs_type;
+		fs_info->bdev_holder = s;
 		error = btrfs_fill_super(s, fs_devices, data);
 	}
 	if (!error)
