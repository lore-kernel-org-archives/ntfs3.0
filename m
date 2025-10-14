Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDA2561A2
	for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455327; cv=none; b=Frdwkvb4eCRzQRKk91U8qvAeNsifpHuJtu2Lb+R1oXtaPGnT/fj6ozFNoQZc/DnN/YB4bLsUhDKwGXr+HL469MXYcBnTzvjejZ0heupl/Azla6bS20R50qlQ6p+mHztA6ZsuA/Bd8rmyuLve6jtZsm9D6qw80JAuYqEl5hlB2JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455327; c=relaxed/simple;
	bh=JuysP1XZp2+WEfzp4GkcBSuCN/6dU0XTRD+b0F+kRdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvKvF3wGaDRxbIvkInModeHskWE6nBUlkuEfi6XWQBrmzYalEtsgJLTiF/cY3dTtsyyyM1h0UuU4xLzhwneF2kK9CIxM5DPvwUXLmPy6bcrY8+4SqW9StsHYaFp44TNb/d40JwFPRk443OaMOM8nqC3yCS26Rxcr/ni5kTGRKBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JK41jaWL; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK41jaWL"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6360397e8c7so5724752d50.0
        for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455325; x=1761060125; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JuysP1XZp2+WEfzp4GkcBSuCN/6dU0XTRD+b0F+kRdY=;
        b=JK41jaWLxVpr/5EGg5UYQP93bOUZIJl1e8XuRsEb3nLCWY1y1UbBMMywlbGxwVlFj+
         wQR6HF4LsibQ1zaJVeOVtieYmKdVGSbKjTsq7mLDHZZqhhsg/WeCZzjgZOBSurp7O+AP
         CikY7sm0LHNcfnqaW2Hu9q5jkbJIi0htHzt8yQI7SNJZ85SxSYWBPxFBMgF+A5CU/Ebi
         ndxFXXUTgz3gUNRb6be/2kHJRQqQRre3Aa7bG99a8GvN7vDUWiNRTaHdcTJUo5GkCquz
         YRy38Jc6W48YGK/rd07+Bcp2jG/gjvMb9Kp6LFH9f8v1kgaCHvSSrmNvWPG/TwxqkU8O
         WSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455325; x=1761060125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuysP1XZp2+WEfzp4GkcBSuCN/6dU0XTRD+b0F+kRdY=;
        b=Sf3kB6Ci8107Du+NmdtyDownQvvzz/cJh4A7iX6p7whV8vn1Hl+Vu5ufBmtk+a2249
         vNomOGvpB0/kGg7o4R7CpicAaPDme3sVoeBSN3MYAO7+mH1jyyAX8IhTNH2gEYa28ssk
         5r0vEOC3K187cincSc6+MkWBq+B2TGnAt2i/KPg3LEsrZaTpjVPhEf+f2nSH/Vcvk6Kl
         0mqeiFQB/6c4Xj8fcU9728JkdOea7UgfPyIWPXimgp/+jwwaMxRoQXBRF742oLOutpzL
         SqWsyQY5QvBQR6AcqCFdPZQ+3x38gBUU1btyO5alvlpMTCTnkzZswquWWmmdSZuZviWZ
         GqWQ==
X-Gm-Message-State: AOJu0YwHhIN/1jQBDtZpEGlaumiP+5JWdoD6cgSD7PbcCAkr5puk/5OT
	c18F/+AAOsjeaXBEQHSQt2dmQM9DrW14oQQzNxcmMZovfGHphWB6yy0v6UZEDWo32SmmF5fJ3Yl
	t8RYkfbwWWIQNSt8f10Sijn60T5wib1M=
X-Gm-Gg: ASbGncvhw9OY3vFMApYbsDcRJgq8Nc+exMhuazZ69FkqLu0shIl12i3s0liGoHd1WT4
	3hZKZQOeKjyOPV/IgmHc2yPfzyl0tRs8TIw/REQ307UYUhUyoBs5VRyKBrdM7p2mvBCmtl9UObN
	5jiyBfZeGHWWpZq73eo92Zhanrx2MrQ4lm0gzEiXqav47zdoAXmiggbbWnk2z2zG4g+fXKfcb8R
	pNc0BQz/CfLGa/KEzS7mKa5xtsKipIXZjvn82Tq8vBsiTVwWlot/ezwPA9qFT4/2Mk4qlOEjzuO
	VzKTfkUOkaXfJQ==
X-Google-Smtp-Source: AGHT+IERV5dkXUsA6PH8pJwqCjdZ1eXgQEpyOnGcHx77VYXj072DGb1WicKpR+KfiyDh3yoI8ZXSPK0rdZ/9oCTg4i4=
X-Received: by 2002:a05:690e:18e:b0:635:4ed0:572b with SMTP id
 956f58d0204a3-63ccb92c021mr17705016d50.47.1760455324924; Tue, 14 Oct 2025
 08:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014143942.643856-1-kartikey406@gmail.com>
In-Reply-To: <20251014143942.643856-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Tue, 14 Oct 2025 20:51:52 +0530
X-Gm-Features: AS18NWBwjfaDYJB5WmtkQrp5W16BLZdaiSVxrVnQ2U0n-pt0jFD_zwCWJEjGOmc
Message-ID: <CADhLXY6zA0EGhKjzBZXSv3QFC2OMHxTxzgZy2sObzNaaza7eLg@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: prevent operations on NTFS system files
To: almaz.alexandrovich@paragon-software.com, 
	penguin-kernel@i-love.sakura.ne.jp
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Tetsuo,

Thank you for testing on a legitimate filesystem and for your question.

I'm trying to understand the protection mechanism better. When I searched
for ENXIO in fs/ntfs3/, I didn't find any explicit checks. Could you help
me understand where the ENXIO is coming from in your test?

I noticed that in the $Extend code path, inode->i_fop doesn't appear to
be set (only i_op is set), unlike regular files. Could this be why
operations fail on legitimate filesystems?

Regarding the syzbot reproducer - it uses a malformed filesystem image
from the fuzzer. I'm wondering if such corrupted images might bypass the
normal protections and reach ntfs_setattr() in ways that don't happen on
proper filesystems.

Would it make sense to add an explicit check in ntfs_setattr() to reject
size changes on system inodes (rno < MFT_REC_FREE) as additional
protection? Or do you think Edward's patch (just initializing the lock)
is sufficient?

I'd appreciate your guidance on the right approach here.

Best regards,
Deepanshu
