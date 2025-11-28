Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1622173D
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764293430; cv=none; b=VswmdHAaCp+WG7zgxOflXAX5VKdbP8pZs1kxwwvwMXsmVnpU0DDDBXzZkALccXXxk36SbVP0Z7JFqVeL6B1w5Urq0Tm+1ARrNV+/k6FoDP4ufQ/yBF3Wn2BL/ZQoD0bpQ1Becg8wi0AVrgz4ebRUOltBDQCuxpk43M6I5VQ/u1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764293430; c=relaxed/simple;
	bh=KBcsmp5at+jJviL3J+0mcROw+lr8j4mNJ+AGY+9OtGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nX0i4aVrvWpZ1RLyBbbC0lYkcxYRZe0aN6rpTt/Dj6THd6jyLz2TAkfXH++0YyT0TUzHrQjXSfIe5jSNocmcAsmo6l3O/vTTcThqpK7Sc23gBjT3+1kot88De6AHeWVhweC9yJIJUqhvycx31yKG08N0xHsPSXmEmwMUtthm0TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EohoMbcs; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EohoMbcs"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ed82ee9e57so18729671cf.0
        for <ntfs3@lists.linux.dev>; Thu, 27 Nov 2025 17:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764293428; x=1764898228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5P89IZigPftxBdPjv0hBiMVJle7Ici8oyWvWVUIt1w=;
        b=EohoMbcslBppWCzyB78X0zdPUNazPZ+8ULHM/CB+1nxoiM5i34w5x6N51p9GbRm31g
         nL2+wQVDPaEK7VbUMREkHLMucLKNjZUV7jn/PSSp4EwX1Ad4Ynm/WsPG5KqQGEUa6ApI
         TdeqPqTpAQIvPKJbCNuOAwd5v4T2f/cHDrn44XHK5JidfVviE0kakqc8QlAJBbK4Qz48
         g+qH1iOCHXfYRSy3OaDmahzOWlPhv6oLq6scohMU8qtZXz0Hy0EF0+OjcHVd6CUMgXpZ
         RI/P1ty+0fgEvclEs9VPhgt2kT8NZa5fFXXVqPcl9d1ZnhvzMpH0QOf+agOuGYgn7URI
         A1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293428; x=1764898228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D5P89IZigPftxBdPjv0hBiMVJle7Ici8oyWvWVUIt1w=;
        b=Bujqe7kso4K0y7fHYw2JNvAnr6M+IS4Fqa6SuB+o4UKazI45kQkWZlx9OHHGjTFxz5
         05Xe2Q5fqDYWwrPtOhofRyneBvG+uALF9ZBg5Kt6yVyg+70np/m6qMVCyxuv5IwMioIE
         C0EUe3LGLZl1ZYGe5Av/XG8xgtlgvGYlbFl25qKPhp85IAiyycZWgczXGbjAF9eHoQe6
         e+cTFOlztlKb5ob7d9h1jzMXnkNmXXbIM0EJE13FAV4eLycf7Gpes0Jwzp3DQJhmnA5v
         +7G5xqWVN1FrGxLNqg+wY1TUvrIqoWYhnbV7tzRhnAx4/GIuMdD3+ceIVhGp4y8Url0q
         iqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq6bMl1xwYL0EEtTDjjyIFkMRZ4upKf5LrCNDlFPAvrmPW26hQMGS+lQcrgC/rn6FGTkpF2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwywgOWlQ4qjQxF/dCzrNxvPMQ+DStxwCo0F7RtqmYgp0kHaOiA
	/Qoj+eOn8q4xNMCA5zdD6fee/kiO6oW8cI789gliyzPIpeGze9x2rneTT+nSIc95FvAQMwJ4iGt
	A2tlDvD8QC9VN31ioN5YG8Ezzv8+uMTY=
X-Gm-Gg: ASbGnct8l70MunQwYVzdJZ+osDOT7S5gwQDhesawv2DHOcVPg1lRlkFBf1zucQ949QL
	Bvsdvcgf+pAdgTO1nsbWm3ENmQupsOR5G1arLQGl0ArvgIl40t9AaZ+akwtGIqIJgYT9UG30fWh
	1EY1KSEwtK7YN9td0njT6nJfMf9MJYmTNBuzZyZ3tgCJ4GJK+wPCvU3flhUZht9vacHw/eVQA19
	8epOVMenVrEQuPy/4MJN//jlbw7+OEyvn/5hsc6JT8KacRrAfyPnc7cWzEFoQdRFJwK9Nw=
X-Google-Smtp-Source: AGHT+IHLwC+N+hhLqdlufghZ5fhnM4rSYysjvUV/1fIoNRweHCYWM0pQrvWGMYNUf8igtQ6F3vcEMbZAHieS7voSeP4=
X-Received: by 2002:ac8:57d0:0:b0:4ee:827:7e62 with SMTP id
 d75a77b69052e-4ee58b05b62mr339066531cf.82.1764293427985; Thu, 27 Nov 2025
 17:30:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121081748.1443507-1-zhangshida@kylinos.cn>
 <aSBA4xc9WgxkVIUh@infradead.org> <CANubcdVjXbKc88G6gzHAoJCwwxxHUYTzexqH+GaWAhEVrwr6Dg@mail.gmail.com>
 <aSP5svsQfFe8x8Fb@infradead.org> <CANubcdVgeov2fhcgDLwOmqW1BNDmD392havRRQ7Jz5P26+8HrQ@mail.gmail.com>
 <aSf6T6z6f2YqQRPH@infradead.org>
In-Reply-To: <aSf6T6z6f2YqQRPH@infradead.org>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Fri, 28 Nov 2025 09:29:52 +0800
X-Gm-Features: AWmQ_bnZka8N-6d6tnub2wv_mKK_srvt07g0FExU0PMtOqpsh3yITqQM0jweo2c
Message-ID: <CANubcdVhDZ+G5brj6g+mBBOHLyeyM9gWaLJ+EKwyWXJjSoi1SQ@mail.gmail.com>
Subject: Re: Fix potential data loss and corruption due to Incorrect BIO Chain Handling
To: Christoph Hellwig <hch@infradead.org>
Cc: Ming Lei <ming.lei@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-xfs@vger.kernel.org, zhangshida@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Christoph Hellwig <hch@infradead.org> =E4=BA=8E2025=E5=B9=B411=E6=9C=8827=
=E6=97=A5=E5=91=A8=E5=9B=9B 15:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Nov 27, 2025 at 03:05:29PM +0800, Stephen Zhang wrote:
> > No, they are not using bcache.
>
> Then please figure out how bio_chain_endio even gets called in this
> setup.  I think for mainline the approach should be to fix bcache
> and eorfs to not call into ->bi_end_io and add a BUG_ON() to
> bio_chain_endio to ensure no new callers appear.  I
>

Okay, thanks for the suggestion.

> > If there are no further objections or other insights regarding this iss=
ue,
> > I will proceed with creating a v2 of this series.
>
> Not sure how that is helpful.  You have a problem on a kernel from stone
> age, can't explain what actually happens and propose something that is
> mostly a no-op in mainline, with the callers that could even reach the
> area being clear API misuse.
>

Analysis of the 4.19 kernel bug confirmed it was not caused by the
->bi_end_io call. Instead, this investigation led us to discover a differen=
t bug
in the upstream kernel. The v2 patch series is dedicated to fixing this new=
ly
found upstream issue.

Thanks,
shida
>
