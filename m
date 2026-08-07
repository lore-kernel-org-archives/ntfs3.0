Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2764726CE32
	for <ntfs3@lists.linux.dev>; Fri,  7 Aug 2026 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064890; cv=none; b=KZfEDDPAkuF5FFD/HIrQrX+BqzRReyGQyg9/MPo3HIP6OuKgUhSq2wSH3nScnRT0VyjwNQiI9bl2DDheP2hcXYp9JVtqj8PzbqgIIuCHVv/S3kpbWBlByBqCGKi2Vf378/rydIp6uQVFsk2QOzFMte5Za+/bc5hWAQ/WWYc1l9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064890; c=relaxed/simple;
	bh=yHDpSyvqVcknEvcKuspAglWUf0Xdhjq2+RsBurWDlmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9ROWH5XDxsc/suGWvPsUzfxFf9XsBqRgv1bJpKe75mVlmdUMOvHtMQvYDSFLOeGHacybsfEk0GEdRN+0NbKhlV/S/gV9ddY2dV+nj8HLKlOdx66rEhrGTFvzj/UDfFNjwIx/fXlXY0oA354Ccgzd+ycY+2x9jLWzXDVkhQVb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZO29fy44; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZO29fy44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=x1LI5sxNt2gyAkyVZB2TRjIxLpPGXs1mvkS+j4b9RA0=;
	b=ZO29fy444LEn/p/vwXBg99vi89UHp9CFM2zewQe225qed5PWYXVDRROG43M+yW
	R5hr7Ka+F9ard4KXUjdRxpDkTxLbMCQ2NtU/htp+EG8bmWTyMTichYaf3cS8ELgT
	k3DneKGpHQ/TjBw+J25+5ROsHLH2lL3neLYWRzpnFxmEE=
Received: from [IPV6:2409:8900:1b94:9be6:3c1a:c5c1:9292:9c0e] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnc7_bL3VqaHQQLw--.46865S2;
	Fri, 07 Aug 2026 09:07:40 +0800 (CST)
Message-ID: <7800d0c3-e405-429f-8b3e-a7e7aa372085@163.com>
Date: Fri, 7 Aug 2026 09:07:38 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 v3 0/7] ntfs3: add tracepoints for core filesystem
 paths
To: almaz.alexandrovich@paragon-software.com, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com
Cc: linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, liubaolin12138@gmail.com,
 Baolin Liu <liubaolin@kylinos.cn>, liubaolin12138@163.com
References: <20260807010354.2277156-1-liubaolin12138@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260807010354.2277156-1-liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBnc7_bL3VqaHQQLw--.46865S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4xJr4fJFyDKF47Gry5XFb_yoW8Gr1rpr
	sxCrs3Kw1rArW2y3sIqF4DAr1Fvayku3y5try3uw13AryrtryxXr17t34jvr1vkr9xGry2
	gF1UCr13GryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU2PfdUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhz6xWp1L9yPJQAA3n


Dear Steve,

    I have reordered the tracepoint fields across the series as 
suggested to reduce padding on 64-bit systems. These changes are 
included in v3.
    Looking forward to your review and feedback.

Thanks,
Baolin

在 2026/8/7 09:03, Baolin Liu 写道:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> This series adds an initial set of tracepoints for ntfs3 core paths.
> 
> The tracepoints cover:
>     - mount and log replay
>     - namei operations
>     - directory index operations
>     - allocation and block mapping
>     - iomap operations
>     - file I/O entry points
> 
> Changes in v3:
>     - Reorder tracepoint fields across the series to reduce padding on
>       64-bit systems
> 
> Baolin Liu (7):
>    ntfs3: add mount and log replay tracepoints
>    ntfs3: add namei tracepoints
>    ntfs3: add create inode tracepoint
>    ntfs3: add directory index tracepoints
>    ntfs3: add allocation tracepoints
>    ntfs3: add iomap tracepoints
>    ntfs3: add file I/O tracepoints
> 
>   MAINTAINERS                  |   1 +
>   fs/ntfs3/attrib.c            |   9 +
>   fs/ntfs3/dir.c               |   3 +
>   fs/ntfs3/file.c              |   5 +
>   fs/ntfs3/fslog.c             |   3 +
>   fs/ntfs3/index.c             |   8 +
>   fs/ntfs3/inode.c             |   7 +
>   fs/ntfs3/namei.c             |   5 +
>   fs/ntfs3/super.c             |  11 +-
>   include/trace/events/ntfs3.h | 389 +++++++++++++++++++++++++++++++++++
>   10 files changed, 440 insertions(+), 1 deletion(-)
>   create mode 100644 include/trace/events/ntfs3.h
> 

