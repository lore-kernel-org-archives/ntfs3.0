Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B86322559
	for <ntfs3@lists.linux.dev>; Mon, 18 Aug 2025 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523100; cv=none; b=XdFjh8sEL4aLaHp7ZfmU73Ro4bxEyJbYFKjL4Unb1e6WMSvg4Gxct+fuUrHwxJF02JU7Z5W+seiqQ8hxG5v/hZC37r5DQvdArcG8A4hNMJL65uj8Id1VyaF81oURQhnjTQX/hcntxK/6J+X3oGJ9/zHwJhVP+Nic4J4ADdomqlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523100; c=relaxed/simple;
	bh=WgauoUWQT8jtKVybl1FQjLAo5ru9YepKL7+pAbrIews=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbqIBicfzo+2g3Czt5rAmhS7VqCBEj/L6CFdPYxe4SZ2bYH+r4o/RGgKKW5LBayRYDgmUA69bMydFwQN0WjdGm/mqJYtJ+w9Nrj8cfyOIMDGeebC94NDR8k1Ml5RdGjAfjNdkk99RlcXSAqowxwNLVlCBNub2FMnunPFeYPoTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNYNErkR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNYNErkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755523096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EI+lwS0pOMLisQZ2H6RwpS7sAotb8pPEp3ZpZSihh10=;
	b=FNYNErkREw469fQtp6I4fzWSBXwBzpFe4B0hHoOrF2sfIE6mYywoyTUiFu+NIFVMN05yGk
	onH3Cs5iqBXnQz8tLsTn9xzNJ8OFzci06kvyNfAF0RA7znSrLSJTyB2xi6Z0sXShYDld/A
	q0+Zjv4qj3yH25qvqS1PywhUkNjLQOo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-g7pvTCx1Ncu8ee4qqYWSrQ-1; Mon, 18 Aug 2025 09:18:14 -0400
X-MC-Unique: g7pvTCx1Ncu8ee4qqYWSrQ-1
X-Mimecast-MFC-AGG-ID: g7pvTCx1Ncu8ee4qqYWSrQ_1755523093
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b0b14daso13566805e9.2
        for <ntfs3@lists.linux.dev>; Mon, 18 Aug 2025 06:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523093; x=1756127893;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EI+lwS0pOMLisQZ2H6RwpS7sAotb8pPEp3ZpZSihh10=;
        b=on4CiHn+zf6JG4HwVqexrVrwIevgnL76IuAu48Gh1nxBjnByh3gP/wRf7pJmvMoBG+
         lSeXnJzEBqfEX9BQpD6Ti0Gn9v7t+jfqgPkHFzvIk8N+SUlcyxOC+2lHzIrBRwzlg6rV
         OnZTK30LsFRcqjbtbIJbOQYcafsATMV9dWV3vBWifATqbOBdUbxoIsaAmkLH5xKjd3Sm
         r2w7zGIVf4XoBcTl8GiOMthg+tS9/3DT21cDM2q6HRGTF/OLKoNhKYmsxZUQYPiJUcja
         uy7e3TKqUiS7dxJcvFoS3L6hfX4/sTXZx+0FJIxmEg1r0Kxm6zcw/M4POzxLrfj3TU1A
         uc6w==
X-Forwarded-Encrypted: i=1; AJvYcCV0x51vpLKlSpJ0XLm3CeiemxzNmuiypQ5+xb34gEQi4f7NmUma0Hd23sxDTBH2wmZWxhAIFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgS9NZ3nQmFuuwLrUNleiNzLAXw27taudNP/ZMrPKbl+OjWZm4
	q2uVNbxV0vrK0qHO7CC2AbS6KhcOrdB6uAleZYLD+49p2FtsmoMVS26Z+CXmOTayVIKB8Za0KBB
	7XsBcps6VcYtfdAAI+iRcFdHSClZFizmr0LQFhvfmpG+xbDx+P2JuVuYT
X-Gm-Gg: ASbGncuzgtCqyNmECM3XVwbDPc/7iRmOf4XydMkqvPwv5CC9FjqBQ7tepA2AQiwgbgQ
	huohzepnLpvdy4C2fAG/VWOwVQFJ4zfL9ohBNwWbbRW0EPqoJ37Z01jLybOkCSOUV2SMtveC1u8
	h7ZEQKMFhoUJ/AYtsOgGG1GkYD2IR6JqTD7dAiln1NO2nEmRofKs5A2+Cb/k9i1frWrgGEgmcak
	Xw2Sl6zMjtljxf2W4Kag8apmt9ebRi19s/cfPsJezW/A0W8nis54u6R6YbPovpUpHzB4oVkxIRC
	vjD1eFUe624/K6buybAAbYPrMGsqoK0dnqSudhfI6F8F+m2SWtUjnc78ONh/3nciNnQyeiS4lzM
	0+EaH3JPEM11E1ci0875KNzfat4hO1pn6iNGm0rjCgqrIyBXTeSGyzydtwTOhWdiW
X-Received: by 2002:a05:600c:4f02:b0:459:ddad:a3a3 with SMTP id 5b1f17b1804b1-45a25d5f37dmr66229585e9.25.1755523093079;
        Mon, 18 Aug 2025 06:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvCChE+JR/YLl5igJTrgibt6OaLIWASKnwzJNFN0U4+Ia5ln7iG9FJAn8iRzHdw5mUIB0cBw==
X-Received: by 2002:a05:600c:4f02:b0:459:ddad:a3a3 with SMTP id 5b1f17b1804b1-45a25d5f37dmr66229165e9.25.1755523092684;
        Mon, 18 Aug 2025 06:18:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:600:53c7:df43:7dc3:ae39? (p200300d82f22060053c7df437dc3ae39.dip0.t-ipconnect.de. [2003:d8:2f22:600:53c7:df43:7dc3:ae39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9431sm13351453f8f.40.2025.08.18.06.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:18:12 -0700 (PDT)
Message-ID: <092a4ef3-c97c-4a94-b857-a443fb5f8568@redhat.com>
Date: Mon, 18 Aug 2025 15:18:11 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm: remove write_cache_pages
To: Christoph Hellwig <hch@lst.de>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-bcachefs@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250818061017.1526853-1-hch@lst.de>
 <20250818061017.1526853-4-hch@lst.de>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250818061017.1526853-4-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PPN8A_L1C7P5L4SV-aMEHx2boKYrTMC6ZtU_vhBvE4E_1755523093
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.08.25 08:10, Christoph Hellwig wrote:
> No users left.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb

