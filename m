Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9316282F1
	for <ntfs3@lists.linux.dev>; Tue,  5 Nov 2024 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730797265; cv=none; b=Mk0agIaK5f3chmOVidTZzjzgggYM4jIWfrmevZ3IJ/0C+a56R+hv3pcVHbqC3FgbmuR17ppIZft7OOENMpqiFidVnbeUJXAxW28a8B5Bsg7nC2fVbo7uXgLMGHhx+koFCLtYHY+EeXGS3eXWxhbkymwjGBkTaEIv6IbmfzNdTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730797265; c=relaxed/simple;
	bh=SUwYBAsMJdzMRcY4A/Cdrs5yKIp/KVIk1RrISLjzNMs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QF9GfB5g9DUClEZxDsCeHUBCG2Yr77btFn2LG776jPgGJBWalHikl9DG2coHS7YD5CisiTSHfpG9c69HA8YSXbj5TIoTxUDt9/DIuLs4LmXXdCAzCbjoBCovx9CCkmf6/OnS+jgb13AJ7S3OGgCgKjG4HV6lhFMnJDGkW1Bm57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3b9c5bcd8so53492925ab.2
        for <ntfs3@lists.linux.dev>; Tue, 05 Nov 2024 01:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730797263; x=1731402063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwaf+/hRm/5NZhSkjzM6GsN75XYs+6QFBAabkdy80w8=;
        b=UXCvPIzWuW3u4PW/51vBJaH07NPrVpF92UlcjBnBllrsuIGzBObTN7BelTDPISMTiw
         Z0+11B7Aw4fM3A8Ks//QEYtCYWaEKbF3uI2Bt4YjGlFXs1ESRp1O4Rx3aPftqsnCEEFd
         0zh1DI+IG5ZZOWkt4dO9GOJEevxq+G/ReYiTzHDZU0hknmF/bvsDWAMFSF33RdOyM5HK
         c7Qvvyk32irA4sVtAyICipVM3V1jykrneI0Oo9gjaB6fBqYBpAUfoiVu9kL/F1rzNwNq
         URoHFWLn1C99WQ4ButSBuGHyFO/a4jB4V2DqyEdu2H9n6cHcS5UsBzFGFGObRq6pVu10
         nITA==
X-Forwarded-Encrypted: i=1; AJvYcCVyNcvQzWTZE2IWwFFt3x6z+F6p+NSYc0Zszr1wf+9FGO8Ulo7uN5Ftb9MmBEeYtOUvaw2nlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ljb2JCwiQzk0JibStMg2riYW+Vt1DYAlBELBZrchDeFFUErL
	MW9H2FuCJKrHX2r2+XYxxX285x/olbpWRXoecJeyu8sWs94904QdK/nvWTEYAvCivFX68MquNgS
	Fa4tBymUahjbKGm+yL6Ljnf2iI3ipqADSTlWfB53wtUk0gyWbs7/5nVY=
X-Google-Smtp-Source: AGHT+IGAwBGcpXB4arw/smUYOMAgFRHcsANn+rKyLJzajkWJtDYNBa6Balz+rL3y+yNi6AEpfwBbP+hegb56SjbW7uHfzjZpo24B
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:15c8:b0:3a3:b209:650d with SMTP id
 e9e14a558f8ab-3a4ed32a5efmr304101045ab.26.1730797262644; Tue, 05 Nov 2024
 01:01:02 -0800 (PST)
Date: Tue, 05 Nov 2024 01:01:02 -0800
In-Reply-To: <66ebefad.050a0220.92ef1.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6729dece.050a0220.2edce.1507.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] INFO: trying to register non-static key in
 ntfs3_setattr (2)
From: syzbot <syzbot+2e842ec1beb075a25865@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 1fd21919de6de245b63066b8ee3cfba92e36f0e9
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Thu Aug 22 11:43:32 2024 +0000

    fs/ntfs3: Stale inode instead of bad

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=122d3587980000
start commit:   0babf683783d Merge tag 'pinctrl-v6.11-4' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1c9e296880039df9
dashboard link: https://syzkaller.appspot.com/bug?extid=2e842ec1beb075a25865
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b9b0a9980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=155e9900580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs/ntfs3: Stale inode instead of bad

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
