Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C203F2113
	for <ntfs3@lists.linux.dev>; Wed, 19 Aug 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128770; cv=none; b=MF3gJ5y8QSD60+IsRsI6+cZQs5RAT19dN9hLPQ6UuT9m7hjcY9nFBnyTpc7JLxNkF2nXSEPv1L3eGPGQ2Vc6v1g8PNPWWU8F2glHJJ641EkA6wUH0JpXJEncmVuEemhn9lRVegq/X5u56t+IRJAfG13Jie8lDI+/d3T2IQvt4wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128770; c=relaxed/simple;
	bh=jLmlnUcHDYuhrZ8ESSWKWCCkT1vA6/XPoEiEPBnNDw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWZdjfUfF1OHCDp2V0kPc3VeZx64jWCFRLdbY7BpLUtokhe/H1KmzB9+EsZgepyXcbPNYRyuGnNMh86g6VXG+HtKAbRUX4UH6PmUW1kclSbSvX39N4iCG2XxfZz5Q4uJXQRY+RYylGqwoV5ewNuUtqRLrqb8EEe4mMDi9PlGO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YRzXr8bk; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YRzXr8bk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=e6uPfsbvTjhACkzemw8lVbCJ4quqvdUcQ2keUVVTk34=;
	b=YRzXr8bkaWhkw9Yew20bHNSW0YYteDrbCEu1h7nakNI0C0EcM3GKV8s8IaEejF
	uWeGpSNq7xVr0wMYxUg9NcBZVTkvplTXbwLLxx/35bc21qX6cWF1JYEz3ilPAjBt
	ZwpypsLeygkvgW7Ctadv8WQQ8uKIdaqqcgm7LOmV5P5AM=
Received: from [IPV6:2409:8900:1ef9:dee:d4ad:8b9c:ebb5:20bf] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXfwqYa4Vq8Zm5Nw--.32605S2;
	Wed, 19 Aug 2026 16:38:51 +0800 (CST)
Message-ID: <f78d70dd-4120-4b04-9c41-d0710778cb3e@163.com>
Date: Wed, 19 Aug 2026 16:38:48 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 v3 5/7] ntfs3: add allocation tracepoints
To: Steven Rostedt <rostedt@goodmis.org>
Cc: almaz.alexandrovich@paragon-software.com, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
References: <20260807010354.2277156-1-liubaolin12138@163.com>
 <20260807010354.2277156-6-liubaolin12138@163.com>
 <20260811160424.09bfd609@gandalf.local.home>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260811160424.09bfd609@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXfwqYa4Vq8Zm5Nw--.32605S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xtry7KF1rCrWDAw4DCFg_yoW8Ar1kpF
	WUAFWF9FsrJrWUCw1vqw18tr4a9FW09r4jkr1UuFWUAr4xZrn3Jr4UKrnFyFZ2krZ0kw1a
	qa1jv34DWw45WrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zReWlPUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRv8x2qFa5uWLwAA3H

Dear Steven,
    Thanks for your review. You are right, I will fix it as suggested in v4.


Thanks,
Baolin

在 2026/8/12 04:04, Steven Rostedt 写道:
> On Fri,  7 Aug 2026 09:03:52 +0800
> Baolin Liu <liubaolin12138@163.com> wrote:
> 
>> @@ -960,6 +966,9 @@ int attr_data_get_block(struct ntfs_inode *ni, CLST vcn, CLST clen, CLST *lcn,
>>   	if (res)
>>   		*res = NULL;
>>   
>> +	trace_ntfs3_attr_data_get_block(&ni->vfs_inode, vcn, clen,
>> +					 new != NULL, zero, no_da);
> 
> Hmm, why not just pass new in. It looks like this is the only place that
> calls this tracepoint, right?
> 
> 
>> +TRACE_EVENT(ntfs3_attr_data_get_block,
>> +	TP_PROTO(struct inode *inode, u64 vcn, u64 clen, bool create,
>> +		 bool zero, bool no_da),
>> +	TP_ARGS(inode, vcn, clen, create, zero, no_da),
>> +	TP_STRUCT__entry(
>> +		__field(u64, vcn)
>> +		__field(u64, clen)
>> +		__field(unsigned long, ino)
>> +		__field(dev_t, dev)
>> +		__field(bool, create)
>> +		__field(bool, zero)
>> +		__field(bool, no_da)
>> +	),
>> +	TP_fast_assign(
>> +		__entry->vcn = vcn;
>> +		__entry->clen = clen;
>> +		__entry->ino = inode->i_ino;
>> +		__entry->dev = inode->i_sb->s_dev;
>> +		__entry->create = create;
> 
> Then you can have this be:
> 
> 		__entry->create = new != NULL;
> 
> and keep that logic out of the code and out of line in the trace event.
> 
> -- Steve
> 
>> +		__entry->zero = zero;
>> +		__entry->no_da = no_da;
>> +	),
>> +	TP_printk("dev=(%d,%d) ino=%lu vcn=%llu clen=%llu create=%d zero=%d no_da=%d",
>> +		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
>> +		  __entry->vcn, __entry->clen, __entry->create,
>> +		  __entry->zero, __entry->no_da)
>> +);
>> +
>>   #endif /* _TRACE_NTFS3_H */
>>   
>>   #include <trace/define_trace.h>

