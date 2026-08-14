Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D5342CBA
	for <ntfs3@lists.linux.dev>; Fri, 14 Aug 2026 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689893; cv=none; b=eYSgeWLHxt8QHXu/E+9iSPAV0UxRaUR29/lprecsyhLpsAAEyL//xCWuFEMHHR01Yob9Ap7laqpjLuUExThScuLxO3YOSMaYV0k9N7JnaHDYvP68CG/KRCowsnqIuLPO1zdpiUvkczc4OaicFylfVbq0KdIU+LR3rgp0J3JsT7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689893; c=relaxed/simple;
	bh=CQ/gvm4neNyucjA4ym5eJfnABbTVlfdvzZG167TFfmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y/fRcNg4aaR6wgEW8INz3nbVtp1JV7sM0HYC3TIQcJaW4nriMd1WM+1xBPV1v45diahA0kRTJCaHssmJlU++Mml3e+n2imH5qCy/tc1MEWNRsvz9bYKIWn4cPKYdPpb4Z0nzAvBMfFoTBm5jlxTcKXWr4FOF4sij/zJTVniwnKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=eHxkpESu; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="eHxkpESu"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 51C8A31;
	Fri, 14 Aug 2026 06:40:18 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=eHxkpESu;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0C66121EF;
	Fri, 14 Aug 2026 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1786689574;
	bh=CQ/gvm4neNyucjA4ym5eJfnABbTVlfdvzZG167TFfmQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eHxkpESuaUbELRmxv9ingWjISHZAbML72EmpVUr5c/hYn0HRG3Js4OOPrJ0OjMQFK
	 v7ajEJ/oJaphcWC1VdZmPR8vrclAplVcl+HqiO/GNXx1YpJxrewJhwkkorEx8hBe8K
	 M9+dIqempM/Bn35nNZOmKRCZmbkIJYsJHbvQkg6w=
Received: from [192.168.95.128] (172.30.20.208) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Aug 2026 09:39:32 +0300
Message-ID: <3c73a024-444f-4a5e-b742-2e6ca604bc34@paragon-software.com>
Date: Fri, 14 Aug 2026 08:39:31 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: validate dirty page table entry sizes
To: Kyle Zeng <kylebot@openai.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<outbounddisclosures@openai.com>
References: <20260611213304.16654-1-kylebot@openai.com>
 <26836018-9333-440d-9c3b-ae626148bfae@paragon-software.com>
 <amT_iV4roArHh_Vx@com-75606>
 <9755258b-11f1-410f-815b-4d32abf3d5a3@paragon-software.com>
 <anE9WhCkRSUa6l66@com-75606>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <anE9WhCkRSUa6l66@com-75606>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/4/26 03:16, Kyle Zeng wrote:

> Hi Konstantin,
>
> I tried to mount this image after the patch using the following command
> and it works (I adapted the patch for the master branch).
> ~~~
> mount -t ntfs3 -o loop,ro image /tmp/test
> ~~~
> Can you share your setup (tree, commit, command) so I can reproduce and
> fix the issue?
>
> Best,
> Kyle

Hello,

No need - the problem is on my side. The patch conflicted with other
changes touching the same lines, and I think I resolved the conflicts
incorrectly. Please disregard my report; there is no issue with your
patch.

I'll re-apply it properly and re-test, and will follow up with the
result.

Regards,
Konstantin

