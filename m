Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A82C80
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 13:54:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id i24so41001515lfj.13
        for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ffV9EXIvpsxi/zzat9M/mXqT6D2BowDOkY1JbwoxMOs=;
        b=dywwSbIGuXR+dXQSROUIhljg5+mHDSiHww9Tc5QE/0KVc6D96c2ocK9S4czPbKsPtz
         ySNRWdT9ve7V2FStFVRj6GJtI3GsO5QLdZltms855+mPxWEcF0y64BVbP3jeqDvlTRSC
         Q0SLO0cmgDLKr6f+MZ/VrWRqoygoePpVOM+o8yB+jCv00rDqDRMVdNenYkm3jQj9uL4k
         E4/MHhOextdkY9W69AUB008H67vZy/HWT7fbCa67+7KfpngwPIaSC4I9QxVoGvAnEL8B
         uHW/dfm/FieH/pIjg0HJFLHL4EoFbkdCY9X4ZyWcCPHq1gpKkT+6jn/WXPUZSeEosezu
         YVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffV9EXIvpsxi/zzat9M/mXqT6D2BowDOkY1JbwoxMOs=;
        b=RPBUoiYvHCht8UbtGwfBqZb4OGcsUveOk6f9ppMftyIFNYmLAaiY85UlQwdX8rO+wQ
         VXMRPiroVmkMC6NrvJU0S5cXZV/3Ui61CIDyJm+Pkk4YJGRnE7nApv53Yr0OhRlPMPv5
         UWneYE1v1/saev2iQMQNDW7gBZOuawMoyc7WUIvm1R4yLDdiEzgbQnDhlXc1bbu3a46J
         G1Ztxkot+rRxDpI5kUDfsVT9MVM7gOLdRFPD/Q3K8bQYwlqJWMx9c0hDDYRSZRk9X37m
         Hm8hGxs9G9ytUe1BEDVR+ybPgEAfUUzZ9IL1Rmoyi6eWZoAQM0RlOce9ENAm66ODTCj7
         aDIg==
X-Gm-Message-State: AOAM5325OJVTKqDxsjGHbb3QlL4MAb4HijPWXEvo1WGg88M3kaU7j0Gl
	ZN5QJA2qy4i/VSfN0Prj6dWK0sNINVz0q0sPppU=
X-Google-Smtp-Source: ABdhPJzz49VguPSiC+Fo0EQ3C2KxuaRWGiHMMcfCON0rRU6wG0keaxKFCd23chpDIT1aQ64ecAbOb/mh29DzHZBz3N0=
X-Received: by 2002:a2e:a170:: with SMTP id u16mr12947954ljl.108.1634306084449;
 Fri, 15 Oct 2021 06:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211015132643.1621913-1-hch@lst.de> <20211015132643.1621913-20-hch@lst.de>
In-Reply-To: <20211015132643.1621913-20-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 15 Oct 2021 22:54:32 +0900
Message-ID: <CAKFNMokH0ZU-zxMe3Wm87hZwVgXPv3nRYBx2gXU98GekaeDFRw@mail.gmail.com>
Subject: Re: [PATCH 19/30] nilfs2: use bdev_nr_bytes instead of open coding it
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>, 
	Song Liu <song@kernel.org>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Dave Kleikamp <shaggy@kernel.org>, Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Kees Cook <keescook@chromium.org>, Phillip Lougher <phillip@squashfs.org.uk>, 
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org, 
	device-mapper development <dm-devel@redhat.com>, drbd-dev@lists.linbit.com, 
	linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, linux-ntfs-dev@lists.sourceforge.net, 
	ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 10:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use the proper helper to read the block device size.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi
