Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B472FFF85
	for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453962; cv=none; b=NS9ZkPfw90Hcb4BawqCcls4Ovy7Y/IxoW4EtPIciCSfmEDim2G3nGyc/IAzo+H4YNEuORJlBts346hmQJ2ZatLXfvF+6hMPd8e15olPRvhjjjEG+/lDEFUzvoQ+jcnJ/fhRMEKl9oWTc+0uyHhwyHDhIhMRUMmZQjG6WylgLgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453962; c=relaxed/simple;
	bh=Pe7SZtMJam45KWCoqEg7vdFDhTltPbuePEBl3c9BQGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIMN0JhjimpNhd/aTpCZH4RxSOQcoD9CVWZAX70q29C3mKiACFQIa95x38BWt6gmVMMyUKu1ku6rf5qhJGgJ0TJ6Y6XLwc1X6h6ihM3AI5X0y4GV+9+VcYIeWqBOa7KkIWZTAnOn4vJBlrgi3Pssiv5jeISjK8YyhdKPCjiIknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 59EEx9Qo002315;
	Tue, 14 Oct 2025 23:59:09 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 59EEx9cP002312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Oct 2025 23:59:09 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <04bd83f8-2a34-4756-8309-8f2fbdb0f239@I-love.SAKURA.ne.jp>
Date: Tue, 14 Oct 2025 23:59:06 +0900
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: prevent operations on NTFS system files
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
        syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com,
        almaz.alexandrovich@paragon-software.com
References: <20251014143942.643856-1-kartikey406@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20251014143942.643856-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/10/14 23:39, Deepanshu Kartikey wrote:
> NTFS system files (inode numbers below MFT_REC_FREE) should not have
> their size modified by userspace as this can corrupt the filesystem.

Excuse me, but how can truncate operation succeed? As far as I tested,
truncate operation on files in $Extend directory fails even without your patch
( https://lkml.kernel.org/r/842b3b43-0a1c-4fe8-adff-94fdb2cee59b@I-love.SAKURA.ne.jp ).
Are there other NTFS system files which do not belong to $Extend directory?

