Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E939BFE8
	for <ntfs3@lists.linux.dev>; Tue, 10 Mar 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147253; cv=none; b=qrqsEIt+wOvI7W4FXsaeon3zCXECZvlA8vh9I5QdNPJD00vF15ZhMBToS/CwpFEjVXhDl0ois+7VBes46x66bnF/PRaPDpBx927ZDkaNoHv/OycNmoVTdxcu0iF9XjDzYoJapmulug/HMOApACymLbon5k9LdwaQbEJDNDqGFVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147253; c=relaxed/simple;
	bh=TgoJchP8+G/BTHDKgmEWupOwORUqE0/FZPIUEYu9Z9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Esx56VI6jfGGaR880chngmmOgHQ5/lYhbqp2VccRVd17XIiyD0uN4VJtlK4RcJlyj965FDYu7/2fbYOi6ZS/jpfwuinx8NndAFq9DT/BgBLaHb1iSE+Dn73rdf+NND++OhA0MCi08xpo0x4wf2yUnMbLUCnMH+SPRc5qipdSvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KXQoTynz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KXQoTynz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aeab6ff148so1635ad.1
        for <ntfs3@lists.linux.dev>; Tue, 10 Mar 2026 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773147248; x=1773752048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mm6hm+LHoMGo5Ew01sq1dP9YSITnoqIDxYFDqmtgvh0=;
        b=KXQoTynzJbkjiUm+V2aKdtQekHCsQTLAk6TYwui2b0uXcoJxj6r318O9NEJ6YJe5NM
         gg5C+u3qjuCh50ssp+c6Rbssbpnsq3g9FohngmeMkJ2NyysvjxrZXYbP8tc+hM295sam
         YSqcAn3fYMLBwRZdFQjlmMtTlJTuZT0pOJYKyq7cUQ9x9SZ9P4vsnKQSN2Q7HdA34xgD
         G7Caukn+0TLArLbM+8VqlND6tfR+A0p8trto9KpxEebgbwF13J+agbT28ej1kt6J+rzI
         QsAEuVC7UNgKPEnMlLRkslC2GCue1mUAzAnoLfm0uFIrvWmmgqT+685zh6f0G7HhashM
         2ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147248; x=1773752048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mm6hm+LHoMGo5Ew01sq1dP9YSITnoqIDxYFDqmtgvh0=;
        b=YDRoWqVUOgKaj2zJVT3UMYEghUIduv/cKKjqQqDIhowoh/kVbRDPhPxHFW7zs2any9
         7AArwem0iTY3heIVo8s1G7WtR/cjHYK4b8tjBflzPUDX2pgQ7DUzRJ4xWsWg0Tjmt7C0
         gwXtfg6UQJPU6GZEz4+vglIu/g+8lNxQOU8sn6HicqKuPn146Kt3Vzf+yibEU+9gJbZa
         yUu557hvwX8cXW/x+q90WFoLUFy/YZAasFbC292N9qTV6mQuWyNYSUqz6zBV/KFAejEF
         vXStxzqvGRuRFJu9nlqEpU4I+a25Z7HO4Bw9vtVXDQ8HXNEA6zO8/vS5o7ZLhvOniIsU
         hT1A==
X-Forwarded-Encrypted: i=1; AJvYcCXdWY0RWxr8ZLv+5EBEs2qwd8nimVv5KsqkY9XbpTVVInYcbMAdIiy/NXKbX0dM1JVw2SQ7ZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaiEW+ynanORjZa1Uu7rgQsrcsElID+onbgN0/uXDfXoQ074Ok
	F61uNNHIivbAOfh/Fx7OXzEcVMHh+tr93OuQvzGh9mmxCJdlt890Q6d+bKNDEVxlzQ==
X-Gm-Gg: ATEYQzyHQ1FZsA6L+IiIbCLGekJh2TC0X+HNtnz6s2VYO8B507yUDOS16XeGvtcKm55
	wCj7D90uc7dGXDum9MA+qsAti8cBVrZi6IjXWqLQ/cvC2TjFCM4MD9dZTgKKyYoS4+hXPOzNM+e
	G73hbBQ/Pr7xEUCPnsOqT7fGJlYxPJRT254/I5V9wX7R0uWHbtpqzs8ztu3yA6j2IX8VYJxPMMI
	AcT6eUXU8BucVzo8ebDErc8JcHywfZcoaA/seda3wMaGI3uwh8ucTTSF9v/Nx+lLgRW57fXRO0v
	OIWqdeJ0YAL+Z5C3SQ2+TepJHHgh+F+UuCbhLlLpBAzM6VPbsWQpqIAEureYnVeSBKyjGJxtC9D
	BrUDg4vJFW7AWy1qYshZydmgI62uBxYDH63Y+9IJIjRt8T5W3ZaNKHc7K0CRy+WFbd4X511uSZx
	SOxKxD+NAIvTz6M3oNtlNaE1t2wUJdDi7mxFYj/hIQfZ5xhVYBeo4nvcyM0w==
X-Received: by 2002:a17:902:ebd2:b0:2ae:45bb:bc4e with SMTP id d9443c01a7336-2aea30ebe48mr3008685ad.24.1773147247400;
        Tue, 10 Mar 2026 05:54:07 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0cb73dsm12445679a12.11.2026.03.10.05.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:54:06 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:53:54 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAUYvx6VEdSmInm@google.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>

On Tue, Mar 10, 2026 at 12:49:12PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Alex Williamson <alex@shazbot.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 742477546b15d4dbaf9ebcfb2e67627db71521e0..d71922dfde5885967398deddec3e9e04b05adfec 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -923,7 +923,7 @@ vfio_ioctl_device_feature_mig_device_state(struct vfio_device *device,
>  
>  	/* Handle the VFIO_DEVICE_FEATURE_SET */
>  	filp = device->mig_ops->migration_set_state(device, mig.device_state);
> -	if (IS_ERR(filp) || !filp)
> +	if (IS_ERR_OR_NULL(filp))
>  		goto out_copy;
>  
>  	return vfio_ioct_mig_return_fd(filp, arg, &mig);
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

The cleanup alone looks fine, but I'm not sure if the maintainers would
be happy about the tree-wide spam, since each patch might go through a
different tree. I'd wait for Alex's preference/ack on that.

Thanks,
Praan
