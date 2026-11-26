Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706093;
	b=cPowdidbpLRH4g5Jzv27Ve3FneJrKnpYNQt0/fcSz+0jTGnqB57NMOyhDoGFGZo0QZ4Q
	 1ZzWXhRH/rE8PReDbsqx1hcbbMtDIt37CHrr3qeeuH9Zx422CKNkrSZdNVc6tz7UepQ4j
	 kZ79WBpRcVWpaQpkqvH8XxNHY53p0+HQe+dYDe+0DT4ccPUGVchJtXY2QBuMznmd2cuAa
	 lY2h+izL7w3VBnLLcSY93QsAjlh8y7prGnpd6C5IVrsz3n0TU8lpwLE9wmHoVeDyeO7QQ
	 XbOoZPcGae+7Pq9ch5Ij7QjYx3NoCq87u288FCT6e7Ksee+UMkLPhMaCXnq4sX+CHGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706093;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=6L3q4ZhrpSCtwdgfs27CULhdBC1Pa7E9uSNe6YrUgDE=;
	b=lo5TZzh+7MGMzPj162Zhf+YYlCjeQGiBgWODP4f8pNCLB30xFyXzPBitQASHXp7L8qEk
	 XGa0YzDyTXLopdUnZWfqJeUREssorDORm7J516/4swjUpUyZeurzfU6xWG7K5jxMKrYmj
	 XQEFHgUPjfh2wSC9y0arUqe5Q1jf9X3iGn4FqCdQGxmalH3Pc+mrEYsg3CwJbbde/FU/2
	 LbKKauLZkBDVxJ9ibwK58uROnToSf4cos3FaIzYX0fxXCTeUitq7Wx4OFIuae1HZ0zr58
	 +fa7oZbUNzAK6NSP1sbcvL+nV4u/W2fP94CVk2tyE0fribtvC2VjplkbNKjeKIjLLSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=AOyBUP3I;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AE606A31E
	for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 15:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=AOyBUP3I
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 555301D38;
	Thu, 26 Nov 2026 15:15:26 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=AOyBUP3I;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 79F5D21D2;
	Thu, 26 Nov 2026 15:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1795706083;
	bh=6L3q4ZhrpSCtwdgfs27CULhdBC1Pa7E9uSNe6YrUgDE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AOyBUP3IHDZsvodrpODDdgacWJnDcPIO8a1Ok7aqrCd5KI3rr80ordoPjKJulALrD
	 718G4PwDcbh9f3q3CvR/pATmxf2OmqNoQhAPTGhY7uZmlP4D15QKJnfs2doj+kemMo
	 KaSgrOL6wyzTRw9F5cuujw2doEcmUEIVqMj4yxTU=
Received: from [192.168.95.128] (172.30.20.193) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 26 Nov 2026 18:14:42 +0300
Message-ID: <27742381-113b-48f8-953c-8b1d32bc8066@paragon-software.com>
Date: Thu, 26 Nov 2026 16:14:41 +0100
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] fs/ntfs3: fix out-of-bounds read in the index root
 ops of do_action()
To: Stanley Shen <stanleyshen1886@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260929204106.41921-1-stanleyshen1886@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260929204106.41921-1-stanleyshen1886@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 9/29/26 22:41, Stanley Shen wrote:

> The five index root redo handlers in do_action() (AddIndexEntryRoot,
> DeleteIndexEntryRoot, SetIndexEntryVcnRoot, UpdateFileNameRoot and
> UpdateRecordDataRoot) read the index root before anything has validated
> the offset the attribute was derived from:
>
>          root = resident_data(attr);
>          hdr = &root->ihdr;
>          used = le32_to_cpu(hdr->used);
>
>          if (!check_if_index_root(rec, lrh) ||
>              !check_if_root_index(attr, hdr, lrh)) {
>
> attr is Add2Ptr(rec, le16_to_cpu(lrh->record_off)) and rec is the
> record_size-sized buffer allocated in mi_init(), while record_off comes
> verbatim from the on-disk log record header. check_if_index_root() is
> what bounds it, by walking the attribute chain from rec->attr_off (which
> check_file_record() has already validated) and accepting record_off only
> when it is the offset of an ATTR_ROOT of that chain. Until it has run,
> both the attr->res.data_off read inside resident_data() and the hdr->used
> read that follows can land outside the allocation; record_off and
> data_off are both __le16, so a crafted log record can push the access
> almost 128K past a 1K or 4K record.
>
> Once check_if_index_root() has passed, check_attr() has already bounded
> the attribute and its resident data inside the record, so run it first in
> all five handlers. check_if_root_index() needs hdr and stays put.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Assisted-by: LLM
> Signed-off-by: Stanley Shen <stanleyshen1886@gmail.com>
> ---
>   fs/ntfs3/fslog.c | 39 +++++++++++++++++++++++++--------------
>   1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index ed50c1d0c23..c7c2b477643 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3471,12 +3471,19 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>          case AddIndexEntryRoot:
>                  e = (struct NTFS_DE *)data;
>                  esize = le16_to_cpu(e->size);
> +
> +               /*
> +                * check_if_index_root() is what validates lrh->record_off, so
> +                * it has to run before attr is dereferenced.
> +                */
> +               if (!check_if_index_root(rec, lrh))
> +                       goto dirty_vol;
> +
>                  root = resident_data(attr);
>                  hdr = &root->ihdr;
>                  used = le32_to_cpu(hdr->used);
>
> -               if (!check_if_index_root(rec, lrh) ||
> -                   !check_if_root_index(attr, hdr, lrh) ||
> +               if (!check_if_root_index(attr, hdr, lrh) ||
>                      Add2Ptr(data, esize) > Add2Ptr(lrh, rec_len) ||
>                      esize > le32_to_cpu(rec->total) - le32_to_cpu(rec->used)) {
>                          goto dirty_vol;
> @@ -3498,14 +3505,15 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  break;
>
>          case DeleteIndexEntryRoot:
> +               if (!check_if_index_root(rec, lrh))
> +                       goto dirty_vol;
> +
>                  root = resident_data(attr);
>                  hdr = &root->ihdr;
>                  used = le32_to_cpu(hdr->used);
>
> -               if (!check_if_index_root(rec, lrh) ||
> -                   !check_if_root_index(attr, hdr, lrh)) {
> +               if (!check_if_root_index(attr, hdr, lrh))
>                          goto dirty_vol;
> -               }
>
>                  e1 = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>                  esize = le16_to_cpu(e1->size);
> @@ -3526,13 +3534,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  break;
>
>          case SetIndexEntryVcnRoot:
> +               if (!check_if_index_root(rec, lrh))
> +                       goto dirty_vol;
> +
>                  root = resident_data(attr);
>                  hdr = &root->ihdr;
>
> -               if (!check_if_index_root(rec, lrh) ||
> -                   !check_if_root_index(attr, hdr, lrh)) {
> +               if (!check_if_root_index(attr, hdr, lrh))
>                          goto dirty_vol;
> -               }
>
>                  e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>
> @@ -3541,13 +3550,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  break;
>
>          case UpdateFileNameRoot:
> +               if (!check_if_index_root(rec, lrh))
> +                       goto dirty_vol;
> +
>                  root = resident_data(attr);
>                  hdr = &root->ihdr;
>
> -               if (!check_if_index_root(rec, lrh) ||
> -                   !check_if_root_index(attr, hdr, lrh)) {
> +               if (!check_if_root_index(attr, hdr, lrh))
>                          goto dirty_vol;
> -               }
>
>                  e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>                  fname = (struct ATTR_FILE_NAME *)(e + 1);
> @@ -3556,13 +3566,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>                  break;
>
>          case UpdateRecordDataRoot:
> +               if (!check_if_index_root(rec, lrh))
> +                       goto dirty_vol;
> +
>                  root = resident_data(attr);
>                  hdr = &root->ihdr;
>
> -               if (!check_if_index_root(rec, lrh) ||
> -                   !check_if_root_index(attr, hdr, lrh)) {
> +               if (!check_if_root_index(attr, hdr, lrh))
>                          goto dirty_vol;
> -               }
>
>                  e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>
> --
> 2.50.1 (Apple Git-155)

Hello,

Your patch was applied, thanks.

Regards,
Konstantin

