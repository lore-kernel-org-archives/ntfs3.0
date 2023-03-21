Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A4D10E9
	for <ntfs3@lists.linux.dev>; Tue, 21 Mar 2023 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=buaa.edu.cn; s=buaa; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=or4bwdEEFq
	5tquBa1l4fSIdUzkZVkX4cQXb7BS3cWR4=; b=1YEJ9wH1CeElhowTrfzdCHYNvt
	P9/1Wu9AS0oCbVkLPE/d9W02BliSXBx7wZs4Ni0kDAFrvcGzli/3Ktzsy8NnrRw4
	sM6uDZiTT6jD8mVaTJYcO3+giJ4Cu2/DPH/iKhKF+7ughkL35vAbChEQhs2KBvDE
	u431KRZTMfl2Ok9gg=
Received: from oslab.. (unknown [10.130.159.144])
	by coremail-app1 (Coremail) with SMTP id OCz+CgB3WJWGrxlkHvm5Ag--.13004S4;
	Tue, 21 Mar 2023 21:22:14 +0800 (CST)
From: Jia-Ju Bai <baijiaju@buaa.edu.cn>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia-Ju Bai <baijiaju@buaa.edu.cn>
Subject: [PATCH] fs: ntfs3: Fix possible null-pointer dereferences in mi_read()
Date: Tue, 21 Mar 2023 21:22:11 +0800
Message-Id: <20230321132211.3103922-1-baijiaju@buaa.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:OCz+CgB3WJWGrxlkHvm5Ag--.13004S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW5Xr43KF48CF1rCr48JFb_yoW8Ww45pr
	9IkFyUArsFq3sF9FsFkryUur9Fq34kGFsFvrWDua4Syr15Ww12vryUtF1fWr1jkryrXrWf
	tF1q9r4xXFWq93JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Aw1UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
	UUUUU==
X-CM-SenderInfo: yrruji46exttoohg3hdfq/

In a previous commit 2681631c2973 ("fs/ntfs3: Add null pointer check to
attr_load_runs_vcn"), ni can be NULL in attr_load_runs_vcn(), and thus it
should be checked before being used.

However, in the call stack of this commit, mft_ni in mi_read() is
aliased with ni in attr_load_runs_vcn(), and it is also used in
mi_read() at two places:

mi_read()
  rw_lock = &mft_ni->file.run_lock -> No check
  attr_load_runs_vcn(mft_ni, ...)
    ni (namely mft_ni) is checked in the previous commit
  attr_load_runs_vcn(..., &mft_ni->file.run) -> No check

Thus, to avoid possible null-pointer dereferences, the related checks
should be added.

These bugs are reported by a static analysis tool implemented by myself,
and they are found by extending a known bug fixed in the previous commit.
Thus, they could be theoretical bugs.

Signed-off-by: Jia-Ju Bai <baijiaju@buaa.edu.cn>
---
 fs/ntfs3/record.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index defce6a5c8e1..dfa1fed9c0d9 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -124,7 +124,7 @@ int mi_read(struct mft_inode *mi, bool is_mft)
 	struct rw_semaphore *rw_lock = NULL;
 
 	if (is_mounted(sbi)) {
-		if (!is_mft) {
+		if (!is_mft && mft_ni) {
 			rw_lock = &mft_ni->file.run_lock;
 			down_read(rw_lock);
 		}
@@ -148,7 +148,7 @@ int mi_read(struct mft_inode *mi, bool is_mft)
 		ni_lock(mft_ni);
 		down_write(rw_lock);
 	}
-	err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, &mft_ni->file.run,
+	err = attr_load_runs_vcn(mft_ni, ATTR_DATA, NULL, 0, run,
 				 vbo >> sbi->cluster_bits);
 	if (rw_lock) {
 		up_write(rw_lock);
-- 
2.34.1

