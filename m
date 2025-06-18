Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014025A341
	for <ntfs3@lists.linux.dev>; Wed, 18 Jun 2025 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230019; cv=none; b=OunbcmnMjipQwhuUkBgQIYsu8rqFMAFTrf639ODU87GCv3XWvdgTmYbpGGF5b3X695TfRhGIeXnctX61E2RhlnrA62AlVOmKlurKive9OKoqp0DkR7po3/TQSBMiijtxZdXHsW2YDkd6V72U+q3SUeHTaS82MZ9WnDg+nxSDNvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230019; c=relaxed/simple;
	bh=6O4E31IFWhwT1mKncIIfB5M0IyKaYLlTTLmgubkQWeM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=QJbyJTtyHT5j8P7soqz/SusU+ns/3Y9EROV+1pVHheo82nYeCIoXfQb36FCcmjdieSrh4AgIUEMEGKWfk+5SQ6f5LjP3v8o/QByOpZ+v6Rm+W6ehUg5Q4z9MvR47T9Z66J7zqOiKmdsaX6QwplSNp7tj+ccA7GcpGDb0g3VLmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dhNxogrs; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dhNxogrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750230001; bh=g79FYQgOsNwSl3tOaXLz/txIsFLP64rs0sArg9v4BXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dhNxogrsoPLWEsq4ta2uw8mifWCpGI9KFbjY4/UJjbOSOBldRU0bj2DKXuXXXFCg0
	 nS+kOMwOAXRNLVZrA2cK2bElL1Dm01qZ7emQEakBFV0pyCg6JgEdWBXZf8sTA4gTPx
	 MUZbLg72uTsEn6pweUFycJoh4sJYU8/0UJVWtcYw=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id D7617201; Wed, 18 Jun 2025 14:53:54 +0800
X-QQ-mid: xmsmtpt1750229634tc8wvgidz
Message-ID: <tencent_ED33789EDE1B3B4BB21B4325EDBA10BB7F08@qq.com>
X-QQ-XMAILINFO: MIAHdi1iQo+z16kuYiyj/ZhQ2a4rFDdwa0nU5mpjxpLJbUzgrj7FxujSkmVaje
	 5U3JMIsus966+z4oYcGSR1EZRDXl+nr6GdFBtHn8PIA4IEMlkDJC9BNx/NaWwPIHEXe2WnG0QHfN
	 FK7cxaEZ6O+il1tEFEsuveQs/ybmUQBqTls1k1nrdgciJhKPRT4b0Om2ZzfBTehXCW0RPsTydQSL
	 JDImCKWop+jpq0M6EXNmTsJ2hitv9mB/JcTUZBwWW1fXet8ysgf4vFhO5Gf/w37LMDiTGnYKinHj
	 TqieJYwoDrx+EzwM0ItXH3oB1FhY76pNzPPjoZ+IUDoYRtObZnAMlHIg2VRs/fm8UhBwlTNE8vqI
	 pnBNjDrqUZ8LmwP6OiD+hMyTP3e6g1XQ3VYq89NizwH1W+MxhNX/u+F8oogct04GDFNhXcMuu3jd
	 6gVcLbD02NkDm9HiT3zhxOgBQOB6z1Oc+hO/CjdNF8MQmCOXhBRY6jrp+5LaVdgY9r6wa6EEzvV2
	 yPZMZQttlLzSye1m9I/5y2/Cxg5V7GDbGwLQxNgbyxiQTWqkihLrn6yyLPjAIXunkH20WTm9/0lY
	 1lFm1XxHC5F77ABAOnrsTbpBas1Fg+q0FLLhUPLfITxr0iakG8ehgBJtTteQU0KopFext5SfhlfC
	 GKr6t50rOjKo1S2TmbAD56iPTH+m/BuDwt1ElW2cgnBbnL+vZs70rhBBj0LMLB9GX0eExidLoygg
	 csofFNjijbhBKgO/VHzbdXmrpPUQGpf51crGp4cj5MzV5dlz+SU+y0ygDfqkpz93cshQxgwVvvbD
	 Lce1yGaT4iUIUMJP1opDGq5qezgfcyrOGV439m7sXdYyk66mrH7hN6OQ4z1lQmQB1fsZ9jLnDhdL
	 eCAN763HFgLutlOaug0ZBBlpe3W/7wmKcuoiUiZATD0x2H8YbTLHacKUWR8omxW9/vy0baGOTvvu
	 Qc2AEEhSXpXqZZXfiS6sQWvNbXTww03m3tQwGrDJc=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Date: Wed, 18 Jun 2025 14:53:55 +0800
X-OQ-MSGID: <20250618065354.1322589-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618061815.GR1880847@ZenIV>
References: <20250618061815.GR1880847@ZenIV>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 07:18:15 +0100, Al Viro wrote:
> > On Wed, 18 Jun 2025 06:27:47 +0100, Al Viro wrote:
> > > Note that anything that calls __d_add(dentry, inode) with is_bad_inode(inode)
> > > (or d_add(), or d_instantiate(), or d_splice_alias() under the same conditions)
> > > is also FUBAR.
> > >
> > > So's anything that calls make_bad_inode() on a struct inode that might be
> > > in process of being passed to one of those functions by another thread.
> > >
> > > This is fundamentally wrong; bad inodes are not supposed to end up attached
> > > to dentries.
> > As far as I know, pick_link() is used to resolve the target path of a
> > symbolic link (symlink). Can you explain why pick_link() is executed on
> > a directory or a regular file?
> 
> Because the inode_operations of that thing contains ->get_link().
I removed _ntfs_bad_inode() and it fixed the problem.
I should have thought more carefully about what you said about the bad inode.
> Again, the underlying bug is that make_bad_inode() is called on a live inode.
> In some cases it's "icache lookup finds a normal inode, d_splice_alias() is called
> to attach it to dentry, while another thread decides to call make_bad_inode() on
> it - that would evict it from icache, but we'd already found it there earlier".
> In some it's outright "we have an inode attached to dentry - that's how we got
> it in the first place; let's call make_bad_inode() on it just for shits and giggles".

BR,
Edward

