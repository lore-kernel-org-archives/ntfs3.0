Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C500349CDF
	for <ntfs3@lists.linux.dev>; Thu,  3 Sep 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442828; cv=none; b=RS9b/wu1TBdwTRfLvTwIXY2DP3WmUcUvnull0bk5JCjVhQfVrWZUMWz7BUnPns/hkf9xXwo2IQh8HJsYQkQxU5y3TfwrFDeY7B2V4hIwPzWe1ESQcbchHL1UOeiTEneCYGdg+UTIBvM77Kv6vduSrbGOSqnHbgskOltzsSN0v1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442828; c=relaxed/simple;
	bh=IaPZFKIsXVlRy/q+9aMR6onmT9LGR43bYe73Axjduco=;
	h=To:cc:From:Subject:Date:Message-ID; b=QtBY0eiPmSZI8ZO9bMZ13xSXPEaZbH6IazyAyEXcEduqyIKJxnyyw8Hv3C1yO454+o+kPBySSmxawRDvI31vSdITdcBqM6rYYXQR6fAxkExPQ+5kpHxVvhvf6DpNjAcumEQd+z6bDJxMGSpzvt5CymPxpkluf+PZbSkJS9XyooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=hkJBiRky; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="hkJBiRky"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:To:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3Dn4vwCfjy4BAp9cY5Zs2fmV2pCLX6jWEhD/gQ7yQtk=; t=1788442810; x=1789306810; 
	b=hkJBiRkycUv9EETM9WTOlfcCdRVmsOH+O8h1xnyW7xpIiw9QvAZkeBWKZ0NPd0Jtq1EBaJhR00U
	Dj28x1XqJoBqD7xDqzcS//OlUBspyrR7CTPo9rUj/+eIZ157QqF2VGoirYWBHpANpvNB04ScgXjU9
	5jnswGAXFYYai+pmD/R4qna8gh+FE8CpFL+YleV9szMa804cHzY0dSt9GysYp5FljJJ2U3EI0mrfS
	YfhKzha+IKkPJxaTwIa60VEz0uCmlckgzlXaditzStVfnXOxt4Au3G7wlEAIZM+tiOmHQ8HnaB6QF
	4so4ClAXkk0kmR9uu/rT+D7B1CJ1Pz6ww9Vg==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1x27HC-00EK3t-0A;
	Thu, 03 Sep 2026 09:14:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 3D62C3C91BA1;
	Thu, 03 Sep 2026 09:14:45 -0400 (EDT)
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
cc: ntfs3@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: write past end of buffer in ntfs3's mi_pack_runs()
Date: Thu, 03 Sep 2026 09:14:45 -0400
Message-ID: <26453.1788441285@localhost>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

If the NTFS file system is corrupt, it's possible for this memmove()
in mi_pack_runs() to write past the end of mi->mrec:

        memmove(next + new_run_size - run_size, next + dsize, tail);

Here's a demo; the overflow happens during attempted file creation,
but the redzone violation is only discovered during unmount.

# uname -a
Linux xxx 7.3.0-rc1-00099-g89a312991dc6 #42 SMP PREEMPT_DYNAMIC Wed Sep  2 12:17:14 EDT 2026 x86_64 x86_64 x86_64 GNU/Linux
# wget http://www.rtmrtm.org/rtm/ntfs19b.img.gz
# gunzip ntfs19b.img.gz
# mount -t ntfs3 -o loop ntfs19b.img /mnt 
# echo z > /mnt/z
ntfs3(loop0): ino=0, mi_enum_attr
ntfs3(loop0): ino=0, attr_set_size_ex
/mnt/z: No such file or directory.
# umount /mnt
[Right Redzone overwritten] 0xffff888103350800-0xffff888103350806 @offset=2048. First byte 0x0 instead of 0xcc
=============================================================================
BUG kmalloc-1k (Not tainted): Object corrupt
-----------------------------------------------------------------------------
Allocated in mi_init+0x21/0x40 age=14359 cpu=4 pid=4860
Freed in ni_clear+0xf7/0x1e0 age=14359 cpu=4 pid=4860

Here's a back-trace at the overflowing call to memmove():

#0  __pi___memmove () at arch/riscv/lib/memmove.S:28
#1  0xffffffff8049c35e in mi_pack_runs (mi=0xffffffd6022e9388, 
    attr=0xffffffd603872900, run=run@entry=0xffffffd6022e94b8, 
    len=<optimized out>) at fs/ntfs3/record.c:705
#2  0xffffffff8047b704 in attr_set_size_ex (ni=ni@entry=0xffffffd6022e9388, 
    type=type@entry=ATTR_DATA, name=name@entry=0x0, 
    name_len=name_len@entry=0 '\000', run=run@entry=0xffffffd6022e94b8, 
    new_size=new_size@entry=1179648, new_valid=new_valid@entry=0x0, 
    keep_prealloc=keep_prealloc@entry=false, ret=ret@entry=0xffffffc60024b950, 
    no_da=no_da@entry=false) at fs/ntfs3/attrib.c:680
#3  0xffffffff80484130 in ntfs_extend_mft (sbi=sbi@entry=0xffffffd603ba0800)
    at fs/ntfs3/fsntfs.c:544
#4  0xffffffff8048439c in ntfs_look_free_mft (
    sbi=sbi@entry=0xffffffd603ba0800, rno=rno@entry=0xffffffc60024bae0, 
    mft=mft@entry=false, ni=ni@entry=0x0, mi=mi@entry=0x0)
    at fs/ntfs3/fsntfs.c:759
#5  0xffffffff804955c2 in ntfs_create_inode (
    idmap=0xffffffff816b7208 <nop_mnt_idmap>, dir=0xffffffd6022ec1c0, 
    dentry=0xffffffd60217ad70, uni=uni@entry=0x0, mode=33206, dev=dev@entry=0, 
    symname=symname@entry=0x0, size=size@entry=0, fnd=fnd@entry=0x0)
    at fs/ntfs3/inode.c:1526
#6  0xffffffff8049abb4 in ntfs_create (idmap=<optimized out>, 
    dir=<optimized out>, dentry=<optimized out>, mode=<optimized out>)
    at fs/ntfs3/namei.c:117
#7  0xffffffff8030b3f0 in lookup_open (nd=nd@entry=0xffffffc60024bce8, 
    file=file@entry=0xffffffd603a9b1c0, op=op@entry=0xffffffc60024be10)
    at fs/namei.c:4575

Robert Morris
rtm@mit.edu

