Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C47BAEC
	for <ntfs3@lists.linux.dev>; Tue, 19 Mar 2024 03:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710819715; cv=none; b=gdKQK0r2JWfq6QNTVi7KaGZ2U+0Y9IqvT7kY+cjfSg45EoFRp8NvX42hLQ/e5/+nQjvFXGZ3qgZXqrnYAFjLv6SD06rymbpNRdZ8z1aZhK5UeJd0Yx+I5vNXI30U9qjn9vsX5xSuWn+86itVqFdeA5chkhanjd1v89I8tanUlso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710819715; c=relaxed/simple;
	bh=5IKGUsT604SarA2pp8tkcU2re0vSyfgx4KAPcX1TIRw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LxOqWLeUeuMuN4CJ/0/P6ZhlxSEzbawCjDPU95H9hpXFFi0OFs+cXZCqDDvko3RCvNyeYW8vNp/30ihaCDtMX0F6HbQaNB5COsA6tXvDAyVSS1L+dSuQyUGXjvhhH1emPC16luSj3sKSYZEpepEFMgBay6CYpvA+6NMTWOAtIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/lf00Ce; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/lf00Ce"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a46a7208eedso349666866b.0
        for <ntfs3@lists.linux.dev>; Mon, 18 Mar 2024 20:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710819712; x=1711424512; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mj4OaTRPaGpT+VE2SxHG492qkZ7v9cu6nzH2I5lHJo0=;
        b=N/lf00CegadyOrE8ycnrqrB7pel1EDn6fYQqdZRWxCW8ZgSwnwDm9oDnfORr3HVbI4
         Brlad/Pe3XDQ56ZZMtGTe4uzefGFXPtc2MH90vyLmt1XacqyZmILnrOLViXiZky77DtQ
         Ai6z+rHOKdsfOTht00aHi3SnKCmREZabnGyQ1U6MI6UBbPi1XWqWwg2HFM7dIniSv0wi
         5+PSHklAG6UUcqu7C9N97RBylBm3N5G2pSzdxTAXl02FG033+GUJjLMOgMRPLrvYk5Q+
         CRGsi7iPg4dudSVS8ciOzabJepHw8643pdEwd4y+ZQ1LujQ482gj9AM51EBGxZo7qXuf
         BKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710819712; x=1711424512;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mj4OaTRPaGpT+VE2SxHG492qkZ7v9cu6nzH2I5lHJo0=;
        b=F4KeCoGhyGY3rvF2LTxVjn6QGnH0CSeeyvnJntQKpwN9dFdrbHOfKFpt3vLyzKjoAq
         ygdtWxOVUgIeGrTWZ+b7n1fqHLUa+fEmru/T1ALHG0nvJtOU2H2tpgq4y7N+a25Ot6mY
         JaXTd5LPf+NjdT4l1YnjLF9ZwoqgjdhAKm9CwDqoVlthS7wRH090cby/zczEVQpi/Pr9
         mCeSpuvV9vspq7FuVBb0EW0ND8KTCw77v7zPGjFwHrEid2tqYov8O7NYU7q7BW+uHkTX
         lpZx6x41X5ixT9UJrx36OA2uhj55v4z0EMcOtQjdKfvrYF7atozGNvbTZB/UW8JXOZ2A
         iBxw==
X-Gm-Message-State: AOJu0YyOkzCK/zJh6rISLhzaZYtQO7Z2waocT444R8JJmt8FkIjHxPcG
	EvvQop+X+5GOYvjPXd1BVIrFKw4CDzEV4AJL2qs3sxeHYYZcrMFNumPFK7ozyc/1IWJjvJID2qC
	cta1axXG1TW5JO9d8YlNc3lqMoo30GH5z8OcU/g==
X-Google-Smtp-Source: AGHT+IGqcRxZMy5x4YNOXmmetPaMziE4M4LTRjPiPYX68i7FTii1YRYfgVWH2OzCnecKAK337z0msDxOUL01j+QQ1fQ=
X-Received: by 2002:a17:906:ef0c:b0:a46:c01b:7e2c with SMTP id
 f12-20020a170906ef0c00b00a46c01b7e2cmr3675532ejs.75.1710819711931; Mon, 18
 Mar 2024 20:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Russell Greene <russellgreene8@gmail.com>
Date: Mon, 18 Mar 2024 21:41:41 -0600
Message-ID: <CAAOCm6qrUu6n-oHK85hzFR5hWtf_NFckJZcDqHRBH6m1K6z38Q@mail.gmail.com>
Subject: PROBLEM: ntfs3: nocase option seems to be registered incorrectly, has
 strange behavior
To: ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The nocase ntfs3 mount option seems to be incorrectly registered and
requires passing nonocase. It seems this is because it was registered
like
fsparam_flag_no("nocase", Opt_nocase)
It is reported correctly in mtab because ntfs_show_options seems correct.

If you do go ahead and add nonocase to your mount options, there's
some interesting behavior. It feels a bit random, but here's one
surprising sequence of commands:

# mount -t ntfs3 -o nonocase /dev/nvme0n1p3  /mnt
# ls /mnt/ars/build/CMakeCacHe.txt
/mnt/ars/build/CMakeCacHe.txt
# ls /mnt/program\ files\llvm\bin\clang.exe
ls: cannot access '/mnt/program filesllvmbinclang.exe': No such file
or directory
# ls /mnt/program\ files/llvm/bin/clang.exe
ls: cannot access '/mnt/program files/llvm/bin/clang.exe': No such
file or directory
# ls /mnt/Program\ Files/LLVM/bin/clang.exe
'/mnt/Program Files/LLVM/bin/clang.exe'
# ls /mnt/program\ files/llvm/bin/clang.exe
'/mnt/program files/llvm/bin/clang.exe'

It's tricky to get exact reproduction instructions as if I ran this
sequence of events again, it would likely work. Maybe based on
something being cached or not? I kept my typos and commands that did
work in there as they may be relevant, idk. Again, it's quite random.

I discovered this when using my windows boot drive's MSVC install to
cross-compile some binaries, which depends on case-insensitive
behavior. I was able to compile all my code, but it would often fail
out because it could not find a header/library. Using a file search
program to find the file (and nothing else!) seems to circumvent the
issue, at least until likely some cache is dropped or something like
that.

Tested against latest linux-ntfs3/devel as of writing
(6.7.0-rc4-00028-g622cd3daa8ea) as well as 6.8.

Thanks for the time!
