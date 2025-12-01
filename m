Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CB91DC985
	for <ntfs3@lists.linux.dev>; Mon,  1 Dec 2025 02:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764556906; cv=none; b=pi09zN2E1r5fsypk6LZA/YRYJ/Hb1v7THgLkH+zE8sjyUXJyorwCtGhkvsl1W8bHnLb8A2Ry8JZWfzJw1Vt1wPf3cDPCzTTgydwRK+mj7hGsjG/oMT6xgAA7FST0cN0d8me+doE00TCON1cMj2aDVv0vbuyJdjZRKm6VJ6cRB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764556906; c=relaxed/simple;
	bh=bVTMBZipQSey4Fgvkem7K+oGHQCM1N5D+geGZc1LQG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFzVwVrY0pMVH+YKCfo9clP/FsytAyTZkYTSWk98Mz3GYJIknOjZTdLnRk7kK2nABGxvLJm3bde3lKjS3th98+OsMaFX7IHWnv/sxs4NaGwbaGxRqdqK4BCZN7uW9dUYgQ0xAIku8YjDSukcWNTSjykD7uiwTPZFXvKbjvl8Kww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVBJb/ZN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVBJb/ZN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4eda6c385c0so30848991cf.3
        for <ntfs3@lists.linux.dev>; Sun, 30 Nov 2025 18:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764556904; x=1765161704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4ueRZDGEmZN3pKdDV+VUbfm/GEWq1+GkEBdKVjZOtc=;
        b=MVBJb/ZNbYpBpPmn+x8rRQWo7uyBfM80KQ568hftL96w5Mocw5ZOzg/eKDIQyvpRS/
         CoTinMdYJsKSARRB9h/QncHaakl76yzdKa6R7h5BrA65vYVHOpam6mcLzAe6AWa3zD/1
         aoL/fQJZNcoueGtm8+a3WvAasVgDJ/DO5dWr1B0Usxbh2NCtHei63cD/uahNZekgInyE
         /7s3Gudt+huMdcyx5eUrpcdCmCD781SWLh3Q8yNbchd5qyFBuFKbI85yJyWaJYtvZ9SS
         C5LWxutDyN3PHmGH3gu2v4kAlBnVu2BVBxs9KQIfd9LbMzs386gAFrlUx67ZMDMurkO/
         MvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764556904; x=1765161704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4ueRZDGEmZN3pKdDV+VUbfm/GEWq1+GkEBdKVjZOtc=;
        b=ipSqTXfairP9MGC4Y0VVz+x+x3I6xDx4a+lvUzUdqxy2EtUZgQAt3bwJi2HWwu9cl/
         9O7HP4Ivp3Ke7y2JmiYN+TkvnWZ5MfnzR4B+/sUsJVUxTTOOCYx11KbcJYJRhSzWsR0/
         7+bcgiexh0JXerr98XOK1a+nEXgj/DfmVFdXFJ9dHwAxHmPnkEc+jy93DH9+WR/D0c81
         JDydXq3nWr2UW4ETHCdBCG8Yylk6/XIccWBKwpBYoRO9pbJYJxQwadW3twFOemXa7+9Y
         1i1vGGL/JZLZ6J8IUlYVfzFZj8gaLxMlFR/ql1O/fZoLWVuWFMByLmXuado+a8n4N8Ex
         OO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+2kVJ0ZfplrpHVbBf9Vu0uwMqV0BxqlBKIrT1VITc/j+EJK+zKKyn7y6+OZeB2VY4HMXYrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHuVJnILq3LyTUvbOJjPoGYK3/3h0Cs4pJzHW/zRzQZNl8Xot9
	N20WpIYQxFTBLg3e2RPbIa4oavfxCzh1uoOiUi6tpFTOXgTqVaHj1QAqA8i1d3QJoRpKptSEA6C
	v1iwv5RyZ6Ge3x7zE4qugCBiOanVuZOE=
X-Gm-Gg: ASbGncsVOat1A8++AOxpIAa0UsG/w6VgQqycEbFGAO+W73/lIGNBtAzLatKFZmWAVh+
	LDBcvQuJZhwv4X5L/da1lemEbBKlKtFzLwmIi3aB6l2RB/e0bM0tzB0aYae+vAbPA6zTQGqYkaq
	KC5wVLodXObGwa1J0tiH1XjR4QWuxmOkRdaGA6kUMx38X2h6/FMeaX/mrpd9iUNmA+tILSflR7n
	9/aBbrzFVCSq2TlhEjwFEs2vNqFKvxMoL+ZfeBywknh+VmqvZcwYX+YS/acRWuYxpXrgTY=
X-Google-Smtp-Source: AGHT+IEmvBJytrUYv3PRff54NTqLEiIVWOTOdu8c+jgIKKnb+TW+2xLZqLXPCQhWGcR80rf7EC5pZtRoolK6Jl03Lrg=
X-Received: by 2002:a05:622a:14ce:b0:4ee:ce1:ed8a with SMTP id
 d75a77b69052e-4efbd91573emr353928791cf.16.1764556903722; Sun, 30 Nov 2025
 18:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn>
 <20251128083219.2332407-13-zhangshida@kylinos.cn> <b33b3587-edb0-4f30-a8ee-baaa2b631ed9@grimberg.me>
In-Reply-To: <b33b3587-edb0-4f30-a8ee-baaa2b631ed9@grimberg.me>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Mon, 1 Dec 2025 10:41:06 +0800
X-Gm-Features: AWmQ_blj_C1mdvu7tNb0hVlGGZGM9DWXbWPpg6J4BwD_02XuZ0ipoM_caXqdy_E
Message-ID: <CANubcdWAk2Mh5b9stjTh8N84jq+XAgaR3n2-VYRinU9ERtJLUw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] nvmet: use bio_chain_and_submit to simplify bio chaining
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Johannes.Thumshirn@wdc.com, hch@infradead.org, ming.lei@redhat.com, 
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org, 
	nvdimm@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhangshida@kylinos.cn, Andreas Gruenbacher <agruenba@redhat.com>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sagi Grimberg <sagi@grimberg.me> =E4=BA=8E2025=E5=B9=B412=E6=9C=881=E6=97=
=A5=E5=91=A8=E4=B8=80 07:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Acked-by: Sagi Grimberg <sagi@grimberg.me>

Hello,

I already dropped this patch in v3:
https://lore.kernel.org/all/20251129090122.2457896-1-zhangshida@kylinos.cn/
The reason is that the order of operations is critical. In the original cod=
e::
----------------
...
bio->bi_end_io =3D nvmet_bio_done;

for_each_sg(req->sg, sg, req->sg_cnt, i) {
...
          struct bio *prev =3D bio;
....
          bio_chain(bio, prev);
          submit_bio(prev);
}
----------------

the oldest bio (i.e., prev) retains the real bi_end_io function:

bio -> bio -> ... -> prev
However, using bio_chain_and_submit(prev, bio) would create the reverse cha=
in:

prev -> prev -> ... -> bio

where the newest bio would hold the real bi_end_io function, which does not
match the required behavior in this context.

Thanks,
Shida
