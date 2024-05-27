Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822BF54273
	for <ntfs3@lists.linux.dev>; Mon, 27 May 2024 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798314; cv=none; b=HyuCDxTVbj8xcsl/mwf9+cmKx4HqfH7bxbW4l2bUIoCRIKUNlXnYeBKi/VFZdEjh1N7W5B71/cgzQLjaaRMTCDsxiRvGs/4/+gUQsM6E1zdDx+V0f2dIXEmy89ScovYc9px7zCSjzsUaedArDxXukguedOfHQ32HsO7kMl/x/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798314; c=relaxed/simple;
	bh=2ZRBY+oRG6mgQlZA+09if9c8IEbXJYrERfEn6Q88fAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKkPVth4RjqWBc5BAZbvC0UnP77uZ2VAApunUBuDwZ8oPv3GK8KqIQKy5lA0hz7j7NhPSVWB92wzxtWOJvPP+2ohrrs4AstRAr7znE3xOS5gXG/eYbvMyX4kVK9R9oyEo29IpUwr7pwbzYcm+dqw2dmrgzCZ8BLlTqqSnZ4OBMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWfrlN+b; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWfrlN+b"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59cc765c29so587120466b.3
        for <ntfs3@lists.linux.dev>; Mon, 27 May 2024 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716798311; x=1717403111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZRBY+oRG6mgQlZA+09if9c8IEbXJYrERfEn6Q88fAs=;
        b=OWfrlN+b4SJpv5gDLy6KakPWixyNLzfRgg9FgiMI9GWI3kANxgoJg9KQvvyULVvwoj
         +E+AEH1659MukHKeHcPUYddlf6waqBqJEp8XPNGs4uql9x+5RkrOAQK4fs112pDJXO5t
         iu2CAVXFn453YQfdEh0atvsYtuClMvKswrkFfqFNKcKXIwBTrXsjy642126o9d2rfzGB
         o093xxKD1m+gIE0CcUqWq7ghR0a6o4aWZYqNvDz9zijAmq/N2qBpMoyLWoTpGH7zcmLS
         q+aghLU2WQfX/Pk2Zfug95sco/+tpMhEKTK/4LePaym3RQ9Irsh0rmOlQY5TcSqIxG1f
         4dMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716798311; x=1717403111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZRBY+oRG6mgQlZA+09if9c8IEbXJYrERfEn6Q88fAs=;
        b=JpuyBf4FkhUvl9kvMwpm6Cn+DNKdaCMvneumDkfvGNGwhOZMApCDsGVUogOwbt/Jk8
         g5WfEq2LHTSrinCjfyFLmhIExEU81PM0KyYHJa38C8wSDyi5IdfufqCe5PgC3ZT6/pnu
         LMsNlen0GxEnl9GdUg3yjVmL3eoiRU4+YYzysKZ2GHuMgWbRK1Dez0QhCm0RPEkcN7xQ
         2S093mHSAS+pqke0lzc89ypfmOBFUTDXaySaiMGmCGMoCYKY2lZ2q0sllqug1yFr8UYf
         hlmXxIAkZJnNopmbY7AtJeiHeS2Z8X47rMNsqkwkINPosQVBaQmbpexvdiNFWN4Ok5KB
         j4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf68nCCcaqhC+6fLeBjLythZw4eQRBvmQjO44zC5ar3KsIl10xqzmn7JgOwzQKzOVzDG7cn5N638BhN2IpkDwcZm2o5MM=
X-Gm-Message-State: AOJu0Yz+jeHMSsvN9RQkEemz9AXoiKnl5vPQ9S2621Z4qMdWGM3FzcBd
	18L2uflR+EATi4mD4rAmP+IIhyFqMkCEPQEkTpAbDGqqdwvB7AzN
X-Google-Smtp-Source: AGHT+IGFEQ+ln7bM6mjNKJyMeurj649Ohn9B6Fwr19qMqxpy3ej4RECIA5/2g+HQX0zA+DLQvbh46Q==
X-Received: by 2002:a17:906:f5a1:b0:a62:f6f6:badb with SMTP id a640c23a62f3a-a62f6f6bb87mr130951766b.54.1716798310645;
        Mon, 27 May 2024 01:25:10 -0700 (PDT)
Received: from rivendell ([2a01:4f9:c010:5d73::1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817ee7sm467614666b.33.2024.05.27.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:25:10 -0700 (PDT)
Date: Mon, 27 May 2024 10:25:08 +0200
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, ntfs3@lists.linux.dev
Subject: Re: NTFS driver excessive logging by default: Correct links count
Message-ID: <ZlRDZIWnetE2kZYl@rivendell>
References: <6215a88a-7d78-4abb-911f-8a3e7033da3e@gmx.com>
 <32a9b58b-9781-4fb5-af86-3ba96041f85f@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a9b58b-9781-4fb5-af86-3ba96041f85f@paragon-software.com>

Hello all!!

So, if I understand things correctly, this problem has been fixed in commit 110b24eb1a749bea3440f3ca2ff890a26179050a and this issue caused corruption in the FS.
Did the corruption happen even when mounting the filesystem read-only (via the mount ... -o ro flag)?
Or was a write needed?

and what kind of write?

Thanks a lot,
Enrico
