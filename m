Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF902209F46
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631558; cv=none; b=eyRTWaeCVK14BVIir25zOyReXGcNeWrG3UxTfBoalcsDQZJNSyxAmetNAQr3cCWMIn0sFRpq14GVFqaFrCNg+3xwNoEmcTF5yOco3qyS1FjGe/wI/UkGQIKhhd6tXup1HZRQSmbRyHNSL5vLEGNqZX0OJtAsRL1U/t92qtuZ8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631558; c=relaxed/simple;
	bh=XBl6ypLiORAvs8NPk1hoG3+lBITsowqYPyqh0jSkN2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=phw3FCIB7lixn0a3aBeclzb17k43U4GnIkn+EKZMdxeEnds99mw3Bd3cH6yKbe5KxgSQOHStu+L2K6qezfB7QDtAmDrjXHlhSf4RY6FZpZipWnq7pXRttnnLicjlsPu50h14Y3CAcNRLj4Fzvtb3SHM/UkX97bCB5P6VE0oaTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XPyp73M3zz4f3m7L
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 287881A08FC
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
	by APP4 (Coremail) with SMTP id gCh0CgCn28f_0ghn744dDw--.8916S4;
	Fri, 11 Oct 2024 15:25:53 +0800 (CST)
From: Ye Bin <yebin@huaweicloud.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: yebin10@huawei.com,
	zhangxiaoxu5@huawei.com
Subject: [PATCH 0/3] fix 'proc_info_root' leak about ntfs procfs
Date: Fri, 11 Oct 2024 15:40:22 +0800
Message-Id: <20241011074025.3811053-1-yebin@huaweicloud.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCn28f_0ghn744dDw--.8916S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5d7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7
	xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==
X-CM-SenderInfo: p1hex046kxt4xhlfz01xgou0bp/

From: Ye Bin <yebin10@huawei.com>

Ye Bin (3):
  fs/ntfs3: factor out ntfs_{create/remove}_procdir()
  fs/ntfs3: factor out ntfs_{create/remove}_proc_root()
  fs/ntfs3: fix 'proc_info_root' leak when init ntfs failed

 fs/ntfs3/super.c | 89 ++++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 33 deletions(-)

-- 
2.31.1

