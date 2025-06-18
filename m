Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AC14F98
	for <ntfs3@lists.linux.dev>; Wed, 18 Jun 2025 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750224872; cv=none; b=XpzDfvUaFjpLso1+hnGCqAKybkRa4RYwY1FTjuwYvMv0q4ERuMj55eUZhkSGr0G6eRFKsAJjvPI2u5vV6vGagYPmur81CW0mRy7CYtsNXxGbOBgz9HvdfIOw33eq6JYI3u4eYIGOg4vL4o911C1AsJOQmmAekf1r9lLRNwagSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750224872; c=relaxed/simple;
	bh=drwRVsq1D9HCEgfVG2exmBXKfcTJ78pOWC0Q/ERY1NM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=g+UfexwhOA6E16UvpDoglFyHBnaEmlBMaasi21n8BkAoGavTocFop3KBj3xb5haeqvzCjb6aST8pRFOSPuW10n9nBdJjXl2xS1C01kX0XvI8YS1gi8Pil61AgqbhNDkKZJJZi3d9aNUpPawGmDa57tZqR6GnLK7xWIQtTiZeRMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=NhU2Zxcg; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="NhU2Zxcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750224860; bh=iONSASwJQ5J5Bw7IaUISLLS33rv+vLFEwjuOkUKF1lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NhU2ZxcgTvgi0yvFq03Hm1frfGVjVqFtiJpnuPp2fFXT58NoceL+nYvC9rpSBErRe
	 t/NE8tcNIH6TlCGAIbPrsIYn+okw9SIgejNnpMFNvk+fyckV2k489yLl2sC/K6SlID
	 hTpfsACKvwebRiZhfgafVgvkRZB7O9zK3WuMTtKg=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 89132049; Wed, 18 Jun 2025 13:34:17 +0800
X-QQ-mid: xmsmtpt1750224857t3app1r4s
Message-ID: <tencent_9DDC9378E363A961A3BEA440376237718605@qq.com>
X-QQ-XMAILINFO: MyirvGjpKb1j68GC9Fp5X6/vCJwOlXaYoJW1t3bF4LU/BETGZiWftbGA9sH6IB
	 Hm1sd2ZTFxklv7ofJkATHEeYa7Dsx8CtJ9RmG6SC1qb9g9+fy4yFXv39BCMI0cENFJ0dP8weAggY
	 XbBSfpq0NJuTH8wUzbXUdaMpza6QciTZflWb/5eyFnvRt3cFAqu6vCOsNgQ7g0Qm4kHWbJbcyUwL
	 XIutEiNeqmEBVKA8Xq3lykR9T4pIPYcg8d237AazvOlYdYCO/V+CqsrkyXqm/IBC3DfjeGKNvoJ/
	 96EdkRwLTa7mwdEd47H1S4v/hvKvtNd7pFC58Zev7vqsp4mLpAbSBX/YbjeJlui4OrT2HF/AZRqj
	 GjUD6XMAsCKqdCdJgcShq3Ahs7ScuN6WfWCrKa9cGX0ionFAN7OdUf7ZmpFEwchG0VhNK8W4+Wxz
	 V9ujivp5R+EHl+ESeCscNmilhPvPFL3UENnzSLQrElFR/QHfmUOZpd5+lho5Mc5FbxNmtGpiYon4
	 I8G6dCrUDFg16msRtrCBadlZ+CFCLsB8+I4zNCOvq5Tv3sHE2CViWoDEyqIjOw2lmCMoO5uHQSMB
	 QzyAA9ywPeGdC33YcW+NCkrS27pVCfUsCycOG19IjmQwioi9Q6YDROCg3mkuTFtfQtisfPMYb/BI
	 RcyEWcY4YSMjAZZv5HHW3b0r3Qyut7Vglp766oH3ochBwyHQqSek3zFRZP93tEx5Sq3/Iy1i3mUK
	 skpOQDMlD4OigAG10re9i/oLcd9q/RMZQ6Gcyk4QToBPfVecyZ/VQPafJgNabUYZhqsX+jntCR33
	 FHwHjLFsLJCdCuOdTq92IR5mK5rNiyIatoKTIEUtkeB82Mgxram5I7pzIH/4FUv4Nxm8iVXwph/q
	 vOegtQW2gSeO82djukWyZ0I7hsQ0pzbXq4RdOB4LnnOYVKwl7uJL5eXphvQl/yhYADfC3hlFeLad
	 FYMJlCix+0L90kGib/t+wtUD7AO4dRdWP7/HBeQXs=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: viro@zeniv.linux.org.uk
Cc: almaz.alexandrovich@paragon-software.com,
	brauner@kernel.org,
	eadavis@qq.com,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fs: Prevent non-symlinks from entering pick link
Date: Wed, 18 Jun 2025 13:34:18 +0800
X-OQ-MSGID: <20250618053417.1250534-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618052747.GQ1880847@ZenIV>
References: <20250618052747.GQ1880847@ZenIV>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 06:27:47 +0100, Al Viro wrote:
> Note that anything that calls __d_add(dentry, inode) with is_bad_inode(inode)
> (or d_add(), or d_instantiate(), or d_splice_alias() under the same conditions)
> is also FUBAR.
> 
> So's anything that calls make_bad_inode() on a struct inode that might be
> in process of being passed to one of those functions by another thread.
> 
> This is fundamentally wrong; bad inodes are not supposed to end up attached
> to dentries.
As far as I know, pick_link() is used to resolve the target path of a
symbolic link (symlink). Can you explain why pick_link() is executed on
a directory or a regular file?

