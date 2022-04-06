Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09F33C7
	for <ntfs3@lists.linux.dev>; Wed,  6 Apr 2022 17:28:30 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id d5so5274245lfj.9
        for <ntfs3@lists.linux.dev>; Wed, 06 Apr 2022 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
        b=nHoFYmIVcbUdYBuRBczLdRhO5AcYZ6GHHFtKpS9G1n5vNIpBGLipmKmQ40hQnwfBEK
         9YcCx5HGe8T4NG1UPywpqZKblDsiU8Uam6EvTYaei53mUEV7gX/X6QEIMPDVNdTe1RsC
         lSqUADllCjDlRJ3aqfDHj4gGsZ5WvTndElsOvm3ukXbURNWbOjm9tS3FKy9TW5JIte+s
         iqchodtdlLO+0839AsHapTHL+am4rmkQFqKuweIuQiuTq0iA/dxkHoEkiJl793SmXbAL
         d6FIVbXVTWtg6j4nPkHK8I7vb1+rBuBMN5T4ZVmgoa+qulAgS9/S0AV92hnwAdWJS/in
         gNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJLYFFwKJzu0AzBejzceyC93Fh4AhvIk3A/MNZXzKIU=;
        b=1VofBQYNWhI9WDkV1fpnIreHETNaKanh5gSkph3ET7yIfBHGcwmnzOoSjR6y5IQGia
         8Ik+8RHyeyqVfav4/KqiUkPsBzp1QDa8OQr4amM2kKeGDrBYaMWkP3N3zAxjHdwak76c
         Xj3kxdzp9BjNv5L8AV3PSNV8baYNggAp8DUNvMf2WSjYuncnZuAhPTl5cAaCo8/g91gQ
         I1EzurRiVs20A55iYPJfmSyPaGaGJgSdNWXPaHz1Bt/x12mCReg+MR4SR4zIXXPIWjWF
         WpahKlskZV+E892ds0qv4jwzior7T54/cSPw/nBGcWvM8b9uPrVvfnPJ+NNcHxQ0xjpY
         qJJA==
X-Gm-Message-State: AOAM533NfRY5STBH971/R9V46OrnMccKPY1kVoFGe294ZZ1A4XUNc6lY
	nyqqvPMebZTJv5wlYmG/hB5aT1o1h/tpLLIAJs8=
X-Google-Smtp-Source: ABdhPJxvT7YhfWN8QbCVz4oydCsKwT/zbXQ5089WXaSZlqzdjbFflulVc086iBmKtewP4KtbC66vp+jW8qrWjcRFTmg=
X-Received: by 2002:ac2:5f4d:0:b0:43e:da3e:4529 with SMTP id
 13-20020ac25f4d000000b0043eda3e4529mr6768924lfz.627.1649266108188; Wed, 06
 Apr 2022 10:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220406060516.409838-1-hch@lst.de> <20220406060516.409838-24-hch@lst.de>
In-Reply-To: <20220406060516.409838-24-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 7 Apr 2022 02:28:15 +0900
Message-ID: <CAKFNMokGOma3pvHdEsnsjuKgW+jpYX9zx8fWwJWyeKuCpKz-YQ@mail.gmail.com>
Subject: Re: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
To: Christoph Hellwig <hch@lst.de>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	device-mapper development <dm-devel@redhat.com>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, ntfs3@lists.linux.dev, 
	ocfs2-devel@oss.oracle.com, Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 11:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to query the number of sectors support per each discard bio
> based on the block device and use this helper to stop various places from
> poking into the request_queue to see if discard is supported and if so how
> much.  This mirrors what is done e.g. for write zeroes as well.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
...
> diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
> index 16e775bcf4a7c..7d510e4231713 100644
> --- a/drivers/target/target_core_device.c
> +++ b/drivers/target/target_core_device.c
> @@ -829,9 +829,7 @@ struct se_device *target_alloc_device(struct se_hba *hba, const char *name)
>  }
>
>  /*
> - * Check if the underlying struct block_device request_queue supports
> - * the QUEUE_FLAG_DISCARD bit for UNMAP/WRITE_SAME in SCSI + TRIM
> - * in ATA and we need to set TPE=1

> + * Check if the underlying struct block_device request_queue supports disard.
>   */

Here was a typo:

 s/disard/discard/

On Thu, Apr 7, 2022 at 12:19 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> If I'm misreading things, could you please document that
> bdev_max_discard_sectors() != 0 implies that discard is supported?

I got the same impression.   Checking the discard support with
bdev_max_discard_sectors() != 0 seems a bit unclear than before.

Thanks,
Ryusuke Konishi
