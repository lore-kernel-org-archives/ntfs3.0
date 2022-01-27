Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E102CA0
	for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 21:38:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id p27so7951048lfa.1
        for <ntfs3@lists.linux.dev>; Thu, 27 Jan 2022 13:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+U+izVFukrEKq10kL5qCCsiT3qJmeLAo+mnNrOVCPU=;
        b=DwtRea8LCCOg/PGJHjd1bTltmn0bHa2clILkAwGYtZppoAY25qIBMTxyD6B5uMLit6
         7wk+d+sZiWX35l8wQaAoyrJ9H5CizW30SYci3NU1ojzD14qB67btK2MGpyfbQ3U8Fswu
         zxqpCDGkYCIAg/NDZ5r6/eIuacbMkuvBlqu9ammCZDYbuScyx0/VXZFI/czsoS4aCdCY
         RzPo3aqhubsJoGDCZLj5SmdkiGyLla36RWFVNiU5MVGZ7MrbcY5xEOS4+eUv/n2M8qYN
         MVuY5Y428ZMyJxOjYYJ1BtbtHPjLQ+HBbJ/bfmBPwl0UHF3vKl1N9F7XDbteSxFshMZ6
         OfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+U+izVFukrEKq10kL5qCCsiT3qJmeLAo+mnNrOVCPU=;
        b=4zrZWBwZR5eAUMt0vQyZ266BeBzJhfGbS65IoFhrxQEFaEio2pl7oLB9h5pRG1eOYt
         BDkav7fWv/AZlPDErDirz/pN0azmtoom7XpK8HnkiV89Q8hQw151gCft4FUOq71MvpXv
         rfJvaajFoiTI2CTtwgT34g4td+x1/y4hvY+7bauxR40wXHun3bquiYjHVH439Ujt0QBM
         CW9tOpdZKbh8TVcFBCHgN4cBF2DkuvY9pIDF2zv6plpgpKywhCJOR9Im/k7H7tuu9WsP
         GLMbaeGalNlNelEIeNotVRl2E0uSxpauAD3C1LFeE3xQA/s5hMdlsKmGgahi6naSLLfr
         yUkQ==
X-Gm-Message-State: AOAM533ex4fy1BrrCWT3wbeC5cB8I9ZNqxUoFpKFcMw+h3fOgaLFbKZl
	Q+i+APP2A4h3D9Nzb7xGf4YdxjeH2sneI7gVnJQ=
X-Google-Smtp-Source: ABdhPJxaVoQ4SfBVmSOjFCGrgluhZGplrFWaRNqk5pMVob8JHRQWRWEKNtxwMeMPmpBWjy5SR70YaIdo0zrC/X/8wRA=
X-Received: by 2002:ac2:58f7:: with SMTP id v23mr4043478lfo.390.1643319497799;
 Thu, 27 Jan 2022 13:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de> <20220124091107.642561-3-hch@lst.de>
In-Reply-To: <20220124091107.642561-3-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 28 Jan 2022 06:38:05 +0900
Message-ID: <CAKFNMomoLqbbOwg5d6aBHCyGT5v+NF=N2Rm3QwYk8NDXsoJHtA@mail.gmail.com>
Subject: Re: [PATCH 02/19] nilfs2: remove nilfs_alloc_seg_bio
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Mike Snitzer <snitzer@redhat.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Md . Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	linux-block@vger.kernel.org, device-mapper development <dm-devel@redhat.com>, 
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, ntfs3@lists.linux.dev, 
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 24, 2022 at 6:11 PM Christoph Hellwig <hch@lst.de> wrote:
>
> bio_alloc will never fail when it can sleep.  Remove the now simple
> nilfs_alloc_seg_bio helper and open code it in the only caller.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/nilfs2/segbuf.c | 31 ++++---------------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks!

Ryusuke Konishi
