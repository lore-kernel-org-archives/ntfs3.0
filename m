Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D6044C7C;
	Sun, 11 Feb 2024 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707636503; cv=none; b=D74yySbcImPnxwetcq0Lu4tdq69FF4oRbDGN+aWimo7L/AUmG7dDweSXhUCMG/2YxXPtMMbYE66kwMbpiO0phVVj6g0OZHvoyXuq2rSawKgzygX7PMCkzPOv+kwAZIDVdmp4446Yy6rJcZsSBmap49EhRkmg6BRXqsU3fn1nhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707636503; c=relaxed/simple;
	bh=6flaA0HBM0nfxu8OycT7I+8Yx1fIzIh2mHVEu2mMEOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RfxfVX1m4yiZjnWiFOdym2OPANJZ5DAYhvJEKvSLtxO/LlJancA5RPPzhhTPV0TNzKgdOPb/Ns4H5FF9YmkgNwjqfx1q1AnfP2U8Z+wNwKnh3J7oUHSdnf+MIFbNXfluKVP74QFrdn0oJAVkjRSSi6MbzzLJ4rw7r17qYtNF0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rZ4GA-0004Ow-Ps; Sun, 11 Feb 2024 08:28:18 +0100
Message-ID: <64261685-1f82-4ba5-98f5-6d76178db53a@leemhuis.info>
Date: Sun, 11 Feb 2024 08:28:18 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regressions] ntfs3: empty file on update without forced cache
 drop
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: ntfs3@lists.linux.dev
References: <138ed123-0f84-4d7a-8a17-67fe2418cf29@leemhuis.info>
In-Reply-To: <138ed123-0f84-4d7a-8a17-67fe2418cf29@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707636501;54858668;
X-HE-SMSGID: 1rZ4GA-0004Ow-Ps

On 27.11.23 07:18, Thorsten Leemhuis wrote:
> 
> Konstantin, I noticed a regression report in bugzilla.kernel.org.
> Apparently it's cause by a change of yours.
> 
> As many (most?) kernel developers don't keep an eye on bugzilla, I
> decided to forward it by mail. Note, you have to use bugzilla to reach
> the reporter, as I sadly[1] can not CCed them in mails like this.
> 
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=218180 :

#regzbot fix: d68968440b1a75dee0
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
