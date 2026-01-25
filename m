Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C61DDC3F
	for <ntfs3@lists.linux.dev>; Sun, 25 Jan 2026 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769380806; cv=none; b=m+LFu2lUOMzPmrVp1AvUrTqZx3yoGxGD6tCz/g/QpMUXUY5gzWuiEpUxyOpmDIOlT+8GQcJrj9atuOXwIqYehhpRZvCfS3lBB3hwVUKkf3pCuZmqpQQn8nTGHhWQV++r3hCmOQnwZ8vMc+zJVU3vCJ9dZEhoOocJ79gCogRySvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769380806; c=relaxed/simple;
	bh=m/ubB69nPmq/H/DPG8IesKDisv3BNgPPP/yjK8cuytw=;
	h=to:cc:From:Subject:Date:Message-ID; b=RzYvIBHUsUPRbm/wRRYfcEIZrgyKHvs14DKNB9lxN+PYQt9pfja7OH/1mii2VRUKE92XZBs6yaiSNrGI0V+kQy/YxUuRTg+FpjqKI/2/ZiswHT9yDzNGgh9Md+pI16KYJEZSmK7Y3sjdjh1LrmixluBIEN8Qg3r22WUuSB7zKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=e+moPlrX; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="e+moPlrX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:to:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L6PtF5QUaYCNuZVCn/zo5gkaq8wJNH+h/cooqLrjkiY=; t=1769380804; x=1770244804; 
	b=e+moPlrXWdRgPJ6QcI2gXDWzP1ycg5o76xqAGTTJ8WUCLDPCdrifiCA48rOSqL27dH+i2kAkzfA
	4rntFtHEgO+q9kh9bZZ9zARle9HeSxZDNiPvC4kz8hb4use6r4uY9993q31LKOTK5h45xnToxNMML
	WAqXOzmzOiQ11YTTHj0pdDLVZqB40MCISJaN+X8NWujpa2TN/OuEJOAnZgDnaSVCk6fdLuqSoLeLV
	pyu/m3loDWvvicrdZIjTje0I7a0ZtPKtcdV4hQPocukQKwpF4XRKOBMkYVr6QGBykZ+Mdil/u699x
	bxbAaz8JUhEQvIwcfGwmLFgapueqrvNfqk2g==;
Received: from [24.147.175.133] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1vk8NN-009ou1-0p;
	Sun, 25 Jan 2026 17:14:33 -0500
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 4FA522FE99BA;
	Sun, 25 Jan 2026 17:14:32 -0500 (EST)
to: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
cc: ntfs3@lists.linux.dev
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: buffer overflow in ntfs3's log_replay()
Date: Sun, 25 Jan 2026 17:14:32 -0500
Message-ID: <42774.1769379272@localhost>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

Below is a demo in which a corrupt NTFS image mounted r/w with ntfs3
causes log_replay() to allocate 112 bytes for ra at line 4029:

        ra = kzalloc(log->restart_size, GFP_NOFS);

but then copies 96 bytes to ra at offset 64 at line 4041:

                memcpy(ra->clients, Add2Ptr(ra2, t16),
                       le16_to_cpu(ra2->ra_len) - t16);

log->restart_size is 112, ra2->ra_len is 112, and t16 (really
ra2->client_off) is 16.

To reproduce:

# uname -a
Linux ubuntu66 6.19.0-rc6-00447-g4dc00a84391e #39 SMP PREEMPT_DYNAMIC Sun Jan 25 16:32:13 EST 2026 x86_64 x86_64 x86_64 GNU/Linux
# wget http://www.rtmrtm.org/rtm/ntfs30a.img.gz
# gunzip ntfs30a.img.gz 
# mount -t ntfs3 -o loop,rw ntfs30a.img /mnt
[Right Redzone overwritten] 0xffff8881097bd600-0xffff8881097bd607 @offset=5632. First byte 0xff instead of 0xcc
=============================================================================
BUG kmalloc-128 (Not tainted): Object corrupt
-----------------------------------------------------------------------------
Allocated in 0xffffffffffffffff age=0 cpu=4294967295 pid=1330
Freed in free_rb_tree_fname+0x42/0x70 age=20073 cpu=1 pid=413
Slab 0xffffea000425ef00 objects=21 used=15 fp=0xffff8881097bda00 flags=0x200000000000240(workingset|head|node=0|zone=2)
Object 0xffff8881097bd580 @offset=5504 fp=0xffffffffffffffff
Redzone  ffff8881097bd500: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd510: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd520: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd530: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd540: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd550: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd560: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Redzone  ffff8881097bd570: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
Object   ffff8881097bd580: 7f 08 00 e0 ff ff ff ff 01 00 ff ff 00 00 ff ff  ................
Object   ffff8881097bd590: 43 00 00 00 a0 00 40 00 00 00 00 00 00 00 00 00  C.....@.........
Object   ffff8881097bd5a0: ff ff ff ff f8 ff f8 ff 42 ad 60 44 ff ff ff ff  ........B.`D....
Object   ffff8881097bd5b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
Object   ffff8881097bd5c0: 43 00 00 00 70 00 10 00 00 00 00 00 00 00 00 00  C...p...........
Object   ffff8881097bd5d0: ff ff ff ff f8 ff f8 ff ff ff ff ff ff ff ff ff  ................
Object   ffff8881097bd5e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
Object   ffff8881097bd5f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
Redzone  ffff8881097bd600: ff ff ff ff ff ff ff ff                          ........
Padding  ffff8881097bd654: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
Padding  ffff8881097bd664: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
Padding  ffff8881097bd674: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a              ZZZZZZZZZZZZ

Robert Morris
rtm@mit.edu

