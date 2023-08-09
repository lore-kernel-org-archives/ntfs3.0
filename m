Received: from sonic306-20.consmr.mail.gq1.yahoo.com (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAC24505
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 19:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1691608283; bh=pGk+ei7mVYIbtNDcxRYe+YaYkpkA0eLfuB7XwcQIIa8=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=RKEEgy/sqKXNMbhPmPOb2CCvK8pB9z8WUHTR9vJI/Mm3PpvIU9CT97gKbi/Yya6NdtNQAGNn7YndxNS7D5EQQ/4y0Ft2qLqQEIpGAICARKFN74mkx8ntuv8xegaPfKuIR200cApGuNb7eVTRkBruY2T82fMg+PaAv4beCASrefiCc6VkWjSJ9CDE4ht80N9rFeAiqo24XTpusvV0+7LvfodVqCGW/oOeen9wA2fgG8c7Ok9cn5mnPDs6KEaAJ5p0AAcs3L2uCU8fMVE+INVUpjErnWtgIBw6Or7vf6n44R+RCvVguGbWmeIsh9tQy+M8Nb60OZOD6CmxAep71hqrlQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1691608283; bh=WRUb2ovt7/Hy9kQebJzxs6oL5M2f7pBE4Z7IUplxDj5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=c8r58/LNjuNx8i70qlJFouoVrahyl09Odyr5yYFOv4OEqzuwzUbNpkfmQZmqzqRkU2crsAVRLhvGp08lzVMEMru+FJWgEcSXDnKMwN4BLJCsiojcCEe2XDRGt/xTG2JY/+SAy5tJhxsNAGmjt+95SB8TTB6t3gDvfcEl+qS8VuDm2wv3CNg1JBtFu99gtAw9TiSDCnu2+Gs4ZyzXvBrZnNuK3AoOlhnhajx0O5hE+I4w0qzEZb+t3vmi33plCcG8BfXZlS0PKYKN3ZqGPVBg0TFz3kh4FtVZS8P5KvA8uG9erm5WX4NcdcYKivrXDWtROLCzqUV+5q293hGOKtbx+g==
X-YMail-OSG: sBkDDwIVM1knv4TXbZWyee3uo.kLmLUCG5Cc_yJ0EoZzYo7XJVkNt3lawjLmMOo
 peEAIXahrv_nZoMJLirJKx7AEDGvCi.jhMGgj7xgAVz7qGdlDVjGFLarCLKJ.36iCckxJmEaKQle
 rPNhG8cQ8.JTXX117FVCyYNwOWngVyCEJibG_kpFA0qZ_xshBuYDhJeBKddGjjru260mNAYqOghL
 mUBoW4Twx7rRRdzZPOYTZbvr4uFZ0MassGOS6epFW0oz9ez_c8PMRRZciSYlFMycstgMvTOcHisn
 mk_Rf6n_abx4Aknr7NDgxfigbdH98l2SVONzVa8ES3N_h7ZjM6ZXq6_DpMhD6SMVsL6FG3RX1qnM
 bvqN_S4NhBGqFJ3fnze3Tvvy30A3P9tvO35aCdNrc8I.VFYFhCWpD.EpndKStC7tAuES.KH2.WQq
 vYiJMNXpgZ_ApNBMof.OVoPAMjr8bF9fX.8YQGtfSzMJp2HHH8x5IDI_RSGUJtcFE0TJYrAQPInk
 vOJ5Kf7FHIYoKv9Cw86SGci5fju0q_s_KfpraXovw5imRzPUy.BLbHnzwJB3btHWDj3cD6CnE6po
 39mvJaXzELxzDy1Op15Kq4CSxWOFLJzRqvJkBDl_hV1r8m24685uvwHX_.y4WqKlN09j7R8LPilk
 3dUIisVFYVYxuQeTiZ9Fv1VbFh2NM4PCAFnJNTKvtuYTY5E8gPdY56SobAfh5LwqhFm3yhGE5_QH
 aihIQ37GUtUjhIbGNJzAFP_aFuD4l74DhLuB98MKFVCLs28e2BGls.zBRwGyhLMl9tPBLRXY8Jlg
 PQHyv_0lJJJ3Da1qSyjAaWHnUCvOc1rNzMD19qW5z1zX_X4K6eEKYb3J5dHz0odT22q6gdGe1b4p
 ELy3uLU8StG0jUll.Yf6x7W2ICsLF_zMCEmAU.eU1h3_c4mdOuzHjqkpE.4UJby6qLkykNhVXnwC
 8BmkpimAzrBZwgeH76WR0vGCl.QoXP3RuIh4CSJ5yJR9MJivrEjGYQhY0G4eSt_ZwtL5JYOLkdVd
 yajLv2OJ7ETwWc4pGeFwxwk60AFbDVIsRvMzhS.ySGyTxWKSCufRbqLWzLt2JcvItY1Pkq_AMRFv
 vzGmHOB6RyCVZOA6vNPB9dLiSy.sjrBYgeVIFmyrw6HhyMSN8v3sixjeVhmeV7iIvYpNYXENWt2H
 bWOUYxqmOIIyI0S_0wDT4PPCaXo2ZH4rYxbkNc0vfUUgzla0iShlM8u1.87GD9hGElXTU6rMcWWv
 Jc1x9kyN6Zs293Bg5NDxqjnfhxP7eHMsYKZFVbEfO_9UTmvXkO8EHkK2LusqjjjD94Au8iJmavfa
 IZaITVumx9voTLs5wTWLKsC2WOPrFMXDGQkuCxAdVWAQ01yDsgUDhtudpC9eQ4iGtKKkoe3Vl1Jl
 q3su8URmyXzsAJjLIS7dJ38yRHRt5rGEo85Q9fiZ2hDgpOApSBzjhnuC8VPKjV9pYRxbvZjzbKm2
 bArQbWuh5IeAjV6NMmlUpDuD2k9nGcF6yXNO6Y_buqLvnuBhI.lXTITRoDCsHd_gs.KPH9J8pnJ5
 iF8cB4Qu.xLJl6GFk3Ucgk9Nh8pizx3Gk4ko.Rb1Kp1xwxdmN7Gw7pB6rFeQrJxzWwEWC.rOjvUI
 AQIVyIlnsphF6fRIpnBkhWRcRmzIsmVkCF2hGm4oJQsCMxxkbnnCt5epLUHCPvkvwABirLgvh1me
 MDaxX_Gz26NmqnuYoyf71VEOWkFCmsnlOeUeDFkjp9AQqS9B9aCcbNhmJDGcWGIFsCF4R17gQbdS
 .MC87T4M9Rnz.VecRNKiZFeRobNOu0uaDYMX4sARUpxmOM5ltfu8JHPQ7_88nN_XBFKjsu1sad27
 1Pm2U4HnLygUq98nFMWWJXS.eSGMeXI25HhaYO53ZG0LPtoWf15b9cyOi9B4GkKcy9Qd0GKkdY_c
 qFeUdz84_PdWYji3T2t8jnTnggPvq9EzpSQSOtKimroxfVttxjdHJTdvAV153F8EYUaz96NhE2bY
 UsTg9T.iod2SmXzwZfpu62AgBjDwFQbZNyb4rMX6_C184AEaCtJoxzyXALEyPDkyrNAt1H7ZNxz0
 FJbKXfVcW2YUpO9PEP5kZ7fCgRWMIn7KD8eeTX3lpljzJ5Z.D6xPVHiLRsfqBSWOWw2DzKg4fsbc
 uBd5FKQWQnXCBGk1oUfWyQfmNAsBzu65lMhVfa.Sc3kjgmPaDmNpqhGdoHFF7u9g7DkIBuIuKTFD
 dAsTC6IQaccGDvU8KgJD62AaCBbC0UU.JW4x4W0WKKPnJsK7KMC.4wuu9eWOGDi0-
X-Sonic-MF: <astrajoan@yahoo.com>
X-Sonic-ID: 2cd33dfc-c9a5-4927-89f0-921cf8815197
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Wed, 9 Aug 2023 19:11:23 +0000
Received: by hermes--production-gq1-6b7c87dcf5-j6k2s (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d02974745c6aab630ff007acd426ea3b;
          Wed, 09 Aug 2023 19:11:21 +0000 (UTC)
From: Ziqi Zhao <astrajoan@yahoo.com>
To: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com,
	almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	skhan@linuxfoundation.org,
	ivan.orlov0322@gmail.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Ziqi Zhao <astrajoan@yahoo.com>
Subject: [PATCH] fs/ntfs3: Fix possible null-pointer dereference in hdr_find_e()
Date: Wed,  9 Aug 2023 12:11:18 -0700
Message-Id: <20230809191118.30721-1-astrajoan@yahoo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0000000000009531dc0602016bb0@google.com>
References: <0000000000009531dc0602016bb0@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Upon investigation of the C reproducer provided by Syzbot, it seemed
the reproducer was trying to mount a corrupted NTFS filesystem, then
issue a rename syscall to some nodes in the filesystem. This can be
shown by modifying the reproducer to only include the mount syscall,
and investigating the filesystem by e.g. `ls` and `rm` commands. As a
result, during the problematic call to `hdr_fine_e`, the `inode` being
supplied did not go through `indx_init`, hence the `cmp` function
pointer was never set.

The fix is simply to check whether `cmp` is not set, and return NULL
if that's the case, in order to be consistent with other error
scenarios of the `hdr_find_e` method. The rationale behind this patch
is that:

- We should prevent crashing the kernel even if the mounted filesystem
  is corrupted. Any syscalls made on the filesystem could return
  invalid, but the kernel should be able to sustain these calls.

- Only very specific corruption would lead to this bug, so it would be
  a pretty rare case in actual usage anyways. Therefore, introducing a
  check to specifically protect against this bug seems appropriate.
  Because of its rarity, an `unlikely` clause is used to wrap around
  this nullity check.

Reported-by: syzbot+60cf892fc31d1f4358fc@syzkaller.appspotmail.com
Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
---
 fs/ntfs3/index.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 124c6e822623..cf92b2433f7a 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -729,6 +729,9 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	u32 total = le32_to_cpu(hdr->total);
 	u16 offs[128];
 
+	if (unlikely(!cmp))
+		return NULL;
+
 fill_table:
 	if (end > total)
 		return NULL;
-- 
2.34.1

