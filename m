Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A666BB5B
	for <ntfs3@lists.linux.dev>; Fri, 24 Jul 2026 02:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784858675; cv=none; b=jAXU8wworeV7qgTNN5aJQpt6WaUOjD5OVSJ00p/ke0kfYeH0NrLKUjN58nw6QLNpuJayuQRixe38E6nVLEyAzNk5otEPQQPr7J3xN818yvP8mDamvd5ipcTL8rq3GCNT6wAv77StKV1VYtIC/rtcIFHtkz+NHh4zMj9pl+gttCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784858675; c=relaxed/simple;
	bh=fxkngOquKnwzmLxA+WH20uQ8WVHX0viy5+wF5zLThyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlXkTCQHvLjj9Y/HmmfzYzEfTdxfuvRMwEdkzPtuMm0I+uJe+zqsXTNOvtO1UEpZYtOhwdT2lBgQxCIVSBzY7NiJ2BRD7sE3jF/0LBHDmPy+ChsJgEPPwbNV7T8xmbCQMvB/A+y9t0i/2XAqsc3J7zHv/DTOGZPeVRX+dDNLYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KCG4IJoq; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KCG4IJoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=MsgL0Q2uA/2BsO/i1EgQmsGeMwRxKmjwvE2ROxymKKE=;
	b=KCG4IJoqcEOiOMN0iN8kGWI4VxccrQyJkMMk+S0h6YNaq3Jvw3G5i0WiwPeNH9
	xXOedDuBoJcLcB2ftdn4MfRmBYI0vABmR5ihV+hUDph7JtXaQv77CK7cqqMqeC8+
	uZc49b0p7tRgyFOBNgFUQbwNwXW/u5nIeyZk16Qk24GY8=
Received: from [IPV6:2409:8900:1ee3:1304:2999:ced2:9b83:997] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXVG7+x2Jq6LUIKw--.62461S2;
	Fri, 24 Jul 2026 10:03:45 +0800 (CST)
Message-ID: <565bbfaa-ac7b-488c-9819-34f522d094e0@163.com>
Date: Fri, 24 Jul 2026 10:03:42 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 v1 2/7] ntfs3: add namei tracepoints
To: Steven Rostedt <rostedt@goodmis.org>
Cc: almaz.alexandrovich@paragon-software.com, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
References: <20260717032248.3318208-1-liubaolin12138@163.com>
 <20260717032248.3318208-3-liubaolin12138@163.com>
 <20260721170952.26f79352@gandalf.local.home>
 <a36a7376-d750-4f07-a626-e916fe77ff77@163.com>
 <20260723101735.377f355c@gandalf.local.home>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260723101735.377f355c@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXVG7+x2Jq6LUIKw--.62461S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4rGF1fGr1UCFy5tw4UXFb_yoWktFg_XF
	4qvrZ7GanrXFnrGF43C3yUtFsI9r48JryUGry09r97X3s0vFn8Can5GrsIqrW5Kws5trn0
	krnxZ3y0kry3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_6wZDUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QFlMGpiyAEf5QAA3G

Dear Steve,
    Thanks for the review. I added name_len so the filename length could 
be shown directly in the trace output.
    However, it now seems redundant, since for a dynamic string field 
like __string(name, ...), the length information is already maintained 
by the trace event framework.
    I will update the patch to remove name_len and send a v2 as soon as 
possible. Thank you for the suggestion.

Best regards,
Baolin

在 2026/7/23 22:17, Steven Rostedt 写道:
> On Thu, 23 Jul 2026 17:30:33 +0800
> liubaolin <liubaolin12138@163.com> wrote:
> 
>> Dear Steve,
>>      dentry->d_name.len is the qstr length and does not include the
>> trailing NUL, so it corresponds to strlen(dentry->d_name.name), rather
>> than strlen(dentry->d_name.name) + 1.
> 
> But it is still tightly coupled with the actual length of the name.
> 
>> If you think the extra name_len field here is unnecessary, I can submit
>> a v2 patch to drop it. Looking forward to your feedback.
> 
> I'm wondering what the purpose of it is for. The length of the string is
> also stored in part of the meta data of the event which can be retrieved
> via:
> 
>    __get_dynnamic_array_len(name)
> 
> Although that will be strlen(name) + 1.
> 
> -- Steve

