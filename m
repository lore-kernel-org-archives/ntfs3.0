Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358591;
	b=wuJirKIjx65SlT43purG8syIUfpmQpYJTOB3lGxTuFKt31dnqiisPU0U7n171lOradiq
	 0U8PQoo6CHQdXzl7GZLeM/k6oHyWEDu9ypu8esDoKW/kK9sfFnu0J1jqXNCJWJNlsnKSe
	 KABBV7SWpNxNkuUjxuG0Lp12kOPpKJf0X5EE+A4SH+BbO/iGoqmow25KLXZO0H5X0zaCm
	 l92FHskxQUvkQ3FIkJ8Xi2axha/otz4U5v3/H1bLDPYacF9ospSWsWLzlGZQSoE/QYIKQ
	 WOWoRw+lpYRPu/ia0O5ilPVhkNIEOqgDse7Ji38JUEa1Um1Bipxz7PwQ+kL9rd/fozg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358591;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=PCwvu/7c8j6/O2ejlxj9OlUzPL9S8uniZszqbdRiRso=;
	b=qW46+Mn5lAwTUEB6tfjX3ftqWS2K8B0+A4WXLqv0MXh0RvGbr6gHTsdhbakXPXOh17Y/
	 0b59M9Bt6yqx6Jhm+5/RFJ644BICh7VbXY4PogQ4W3HmtkwouhU0Y5D38OI4Ooq087ajr
	 rsfGvIAmR3oZrbb1dUedyc/T/QNsYnlJa+s00S2HtS49qnabmGXg3O3RFTLtdYVVBh4cI
	 DIo/8y+MHBYwM1kG2+/nU1rGkQ8zGAeJJg+EIqlDsb96/qp8ERcia0oYyFADYlL2Qv1pV
	 GhAEMznOhALS4n3NJewKzzjaQ/cFPWsKnGrDbr9Ltt5+IWleA+89Vpm8UZdEpGUdXRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mennemann.net;
	spf=pass smtp.mailfrom=mennemann.net;
	dkim=pass header.d=mennemann.net header.i=@mennemann.net header.a=rsa-sha256 header.s=sig1 header.b=kbBay+Zf;
	arc=none smtp.remote-ip=57.103.79.39
Received: from outbound.st.icloud.com (st-2005h-snip4-6.eps.apple.com [57.103.79.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E4606A320
	for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 14:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1E4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mennemann.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mennemann.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mennemann.net header.i=@mennemann.net header.a=rsa-sha256 header.s=sig1 header.b=kbBay+Zf
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-9 (Postfix) with ESMTPS id BEB821800104;
	Sun, 22 Nov 2026 14:43:08 +0000 (UTC)
X-ICL-RepId: 01a203b5-ff0d-7ec3-8ac3-87b8856142c4
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mennemann.net; s=sig1; t=1795358589; x=1826894589; bh=PCwvu/7c8j6/O2ejlxj9OlUzPL9S8uniZszqbdRiRso=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=kbBay+Zfm8P2CKOaDAdjtP9vjmUgt1Tq5Tj+B4OieVWU1LpNa1Kg9JLTI2Pk007LMVmRfo+0mGrHs87nurTnTbhF4UjZGYfdG9G8f4pOAFt5jIY+5PSzDZ+70I0WN5bLbcLnqmIiBJMIUuEj/QltdeLExZ8sjT9zgSRvBRItB5GZsiW2g4Zz3omoh7AUoaU/ScTNAFNwAhkLFTnXoHWQq2t01IjYJa5o/uvg1ooiRL/XrbXK3e9kwpUoeQM8aHFsgE6aLO2slyA+oAUSandRL1Kd31gsisR5a3Gc9xeY2LwoyifmcW9zetAPuSQ+3IYH1Q0pbvsSairVCfuUMT4bmA==
mail-alias-created-date: 1719251376433
Received: from archlinux.localdomain (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-9 (Postfix) with ESMTPSA id 32B741800116;
	Sun, 22 Nov 2026 14:43:07 +0000 (UTC)
From: Marcin Mennemann <marcin@mennemann.net>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	regressions@leemhuis.info,
	senjin@hatchling.org
Subject: Re: [PATCH] fs/ntfs3: fix SEEK_DATA/SEEK_HOLE for WOF compressed and dedup files
Date: Sun, 22 Nov 2026 15:43:02 +0100
Message-ID: <20261122144302.32486-1-marcin@mennemann.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261025122411.14550-1-marcin@mennemann.net>
References: <20261025122411.14550-1-marcin@mennemann.net>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: crt81EapdHYEbURfAgJ9fan49_Imfp2m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1OCBTYWx0ZWRfX819zAjvEBf2+
 D1XJzHs3bm9POCL1sIwUVAmw+tXsuakkQL0uVT5QrhjQmfHoj3cQ2aNTByy8YbGXL3KXvYQSdmE
 ZjE9jLR7X3LoWfc5wKIeTdbsMk8n5zE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1OCBTYWx0ZWRfXxpIIfzGUmBQZ
 Md6P1H/UwrhH7tVy8bd3DF3H+eFHINSygjSqjkMgUssSU2RFtkjl07ocpoeCf5F3W1egoKrgUXr
 fF1rNScU7f+DmUvU2xzJuV+oQC6R68rxiyGqekWwpphWcYsb7qorXNgyVjmm9b0wG4tmWGsGYji
 Y4051YKTzXBa9tG9hnTGALlXL3yM66fYURmyABCN3YcXPC39wT+ILoIRsAXMkg8IRMU+vcvDTAo
 bG9TmrcpbYRCJaokcy6EB8xBmHd2chOhblX1+njSLMZtHB9pE7J2UTuzQ1lhv0Pd4v6n18WB/u7
 GwiCgxGCQyjXePwazsBJxuWOY7kBg/n3nTnG4BwCOdrsxfzbkIU76i3PuPqXik=
X-Authority-Info-Out: v=2.4 cv=CqIq4X4D c=1 sm=1 tr=0 ts=6b02ff7d
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYaFdmsEC1CjpenOt5ir:22 a=5dLkQmbtQYkJk1E8iZFh:22 a=VwQbUJbxAAAA:8
 a=Y3k0dO8rAAAA:8 a=lAgNKBcoAAAA:8 a=kcNRxDtnd2coJggxobkA:9
 a=Vsd_HAn_fMcgZoXZC4y2:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-ORIG-GUID: crt81EapdHYEbURfAgJ9fan49_Imfp2m
X-JNJ: AAAAAAAB1EmmsLY5XstglhZZI6B3Jg2nMJCtt4Vq6zosA+6FzznV1VgiwvkyPVcfDctagn
 38TSs2VAX2M8DtuXpJlFUtPp094p7Pib4NppKrDSJOd4oV3K3wRW0aCsnnY0i3zTArF6zI
 p1zH9pEy0YGu+iejC9nDXzsYN8PD9W0QNiauhq8lz9vIkL8s8REp8hhyEm1qJAyX7T2p/8
 IKdpFovbbnSZMo8QbP4uCm4nDLVyUxBP252ttOtbbKsdVAXRir4N7zayknNNLApP3Oux9n
 GG0kcj6jpjZfEW1zJbjEFfYPP1PpeTajnrx5osnTCCBX642HqhEC9XgmThoIs33dXgUbRo
 /8a7x6I4HdBrR2uWA5jWAmxTMgNcJnLZ4sVq7GnErXbycBac1zrYEdo34fyBJF+U/E95Et
 zJgGoN3sKZv/iYlodn0Yvy9n1YKvwxh42Mj2N/BvR+cRQOIWZG7dqemyZn/BtlX/+qtbdI
 WhV+EaAFwN/SJ004ATS2pApnDrsKmlEBXZnBMMCDj2AALL/rt3NDRpVDjrnVg4EdKsAtH6
 o2HMmC/lNBFRk+eRrBsK3a2T9rzO4fubz5+E1Pv9UlsSulMkfG3lWH6e34HbNqjTExYGcn
 NPlFQVrTTqossUfEY9olpmpioqF2h8/qmu9u3lp2w0SwFpV0cd6jTbdOcDWmDnKkDF0VfB
 yA9o7cRmPD1ekXmgunYzNFe30VQLKHDgMWD/Z8S7IHU/N0WTU2hRi62w8RYkG9whdR9hEj
 IFaAJ1FUOoZjVDfwKFV6cf1qhnT+iHRj3AsEm7pIoiqOuOWxMcrJMMj3CKyfuoSWq4NHyS
 r0QdisR2MHvjOvwqjCctELa+UtlAfS0Fgc8hlBHZSSmFIoS7o+OD2TBGD/pyXrcWLqz6Oz
 EiHU5KRhvdzn3Q7cenHi9cXcsRaTuIqckBV9fb7lkvIjIJOvfTcE2ObrGZHpAlatNzClDY
 6RV0lYrJ8ya7abrjVxQea7OvwsxHlJ2D5K88FO4bM40c86ihTjr5akk4sXSJ2YpQm6BciS
 MTjJv0zPVMYurjnzcbgw4Xmo6GBjInXPR8hDY9ODyLPxrrA2pUf9XKnfNA79W+0E0u4tp5
 3k+Cr0JvZY+j72hHe/eoHlqVtBweNhcEPs/7ElcfbIGlFv+Ig7ER3dbjjzf9T2dX9msLA4
 EUkahhuSBeBCnm8jjL7CP32jqOr3V3fkfbIXcjoKdQQGncJRLDAISt0FAK75wNbYGiWmJY
 1FE/ETr6Dqg4VV2H4NM9Db8jSm4eEAc5DZK/9s9xVt+xsNRLA4aO7KAJXG5sq2JywRtSmQ
 ==

Hi Konstantin,

Could one of the two fixes (mine or Senjin's [1]) go into your next
fixes pull? It silently produces zero-filled copies of WOF compressed
files, and Thorsten listed it as a stalled regression [2].

[1] https://lore.kernel.org/ntfs3/6adc95fc26efdd1658b01fc5@mailersend.net/
[2] https://lore.kernel.org/regressions/f03086b6-7fb1-4b52-859e-78cd52c9177d@leemhuis.info/

Thanks,
Marcin
