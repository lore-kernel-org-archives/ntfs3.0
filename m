Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECB33987F
	for <ntfs3@lists.linux.dev>; Sat, 25 Jul 2026 04:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784952938; cv=pass; b=CcNuWpZ83Nt+JEl6vpwvfkDe1EOyqWZtv1NlXQ1jqzjRb3V6+/SxCrUl2H9aMaqUpFbTjMPGX6e2/5iGkPX25FIBRr8lpFl3irxwerXKwTx9njEDS2Qq2cvZG4uQKfaZXK27wPV0KcA6j2dXuLrl+6U4USnGo0+eMNo5+R+zMkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784952938; c=relaxed/simple;
	bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFG+7G7X03QCk4c6Xsjv0iNEchIGM/gdWNbi9wqO3RvW8PXLuK92AYsEkW5QG26rlh3KdnMsJcVOTGFm6yjFiO4nZU9TbGvYWxiWxJybqMfTzHM+suzLA4bGQhSKv5cE4wBw+pzzSMdSrFDwSRTtoU2yUblOhBQklsucUqJROX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0hXWobH; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0hXWobH"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ee4f241f42so1183160a34.1
        for <ntfs3@lists.linux.dev>; Fri, 24 Jul 2026 21:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784952923; cv=none;
        d=google.com; s=arc-20260327;
        b=ce0n7/WZW8iF//tiarGE+5sCOax/WMUeF12NpDHP+7pytQ9U5vlbuVVyvViULdswsW
         E10QkjyI4J/B+OKLCijRj9YsKAWhPBIUmmkfCgltn8h5wgn7LZrGlV0yUXWKKCKZ/wux
         WzGmDupDrS/k4WoGaqO+vDPI1JvxuTUAgsgbY6j3rAN4xox5dpMvdB3vnw495la6mYc4
         0VgY3l1PNLEEz2+9CpfexWJxFDMI2geALg2xjAHiJUDbMFxILWywvZfOeHVioLlMq9aW
         nP3sPiKozf9S/LkcY5+o09N5PItc4H+bcxDwTeRsTrainK12wR65NMFfKPbqg2cMQhIO
         0lDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
        fh=PRySc7wRvwHqk4xxK21fBGgcIprt6lwRHxJghRbnpAQ=;
        b=nSFvMGT7+Z/XMBx3156WtocBMx9kDrZnIt3AKzyFU4YxG7ZuY4aA/0/VxtxnSQb/1T
         eeP689oTA8/qsvtlXK3GfG1p6kf5h0/fAIGJY9x0T11Z6TfMOgVINo2Bb+WgJTxp7rZX
         AYXMfXQN1gwAFF5/RoYPB8xvFTwnQ3yH1eyyM91REO4NdLH5nsSt6vXfXP4/ujU8cwya
         ossKWZ3C0YKFFpqDXR7ADBQbqsiK+Cfmzm/WmZARZrG+C7GxcF6/Pm81smMyAJIgLtCe
         yfTbH5zurwYH+do5+b83Bg0WmIcvtAV1Iy4PK7OxkSWlTEbULEdykGMEWU/IgfYnrUru
         ZFCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784952923; x=1785557723; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
        b=I0hXWobHGLE3NZOJ1aPcrGRpj0DTSIrgYtFeZKHCANgtJpPCVK/KZKinaZK2PYHmOH
         4yQ4NK1OPGdhkYvJ8Wmn6057ibRw6KjE3yciT5KNzjPTRbr8/ElZkIgh2J+HQtbZJmoM
         o6mk6p0NRJdOq6jzlG9/BvvAdbJmAg4XAYqLCrlAbyryN7RkgG/ERyU+iC9oaOc2EE7+
         K+cCTVX4d4rn7HqL3KGu0Jw6nn2tBfCfUbm5Dp6qlovqiIIVhD32h7eQ5wjCirdyrkXb
         EE0sedynyPTyV6FEQgu82GE+AV8BjjSTfIb57r2sOTjLJmaDXQ09IWLzXmu1j/TUeoeY
         fZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784952923; x=1785557723;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
        b=FZZWoI+F30Zq5D0nHRsOvosp+DtFBJajClhnnW9K6RzltsyFUf+3VtXXG3yVVryGJQ
         AHZ5LQV4wNf7V1qi+qpgkIX+K6vQec1GrO2X53HM9SmLvx/DSNQq9+JJrZQ0WlSSjeTl
         C0eHQq5ytsY1zCLEAioUIfIcplilXKifbI9LcWRLpSvN793+Rgmq81U++G6yKTFhIy6D
         Z2+UQN/kvhd4CYFlghKi7Txnu3oUlfxeJuh1ho0fToI0bJYgAXyVrlFSSjF7Eo7Tww8G
         4hnaPoy0+1tSiMieqhWDURjMCcxYfjMzrU6kWSBfDLh3FTBwWTkBSFGkRoOTW50QMfHR
         sAoA==
X-Forwarded-Encrypted: i=1; AHgh+RokgCAWxV1/PNmEB1XDc3Q5OAnkg1RLhCySiEasSQdCxCT9M27i+Rp3q0gkvTcurRuOFlFk1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr0BpT6BlVpCOsYNngb0hMqRitM6OrWJ/hswNuNVUhtm2g0vo7
	5Alf6WRp5VbQ7w5aItcPQZh0r22kadSCbSaItmDVDrBf2/v3a68SFuxfdp/JuQH/N2l1V5T8DWy
	L/5Eehw4jc0z5N2FAbmYbAU2LTdtz7l8Y2EIF
X-Gm-Gg: AR+sD11Z8SXwPPO+S4QD6JRM4dyRPaNiurHzSjU7zLONFTM6R40ZiNn06ZIJI12MxLD
	XQUZz0hlvfa2GWcbvz7FmEF2DZxjkcrvxc3MWviGFx6QXRUvEpngqiHuQMGlI8waaI2OpsLqtxW
	HIwryitpL9fwEQnfQNsiBNiok20aFb9khz6KJOUkbEF8WMdA1MmMPvui66yiI6n3n/8/8Lw3Bb3
	xmgAGdtwAcb+lIXZLO11lxIgbvn6HEhmE3bSQWFZBdkGdy6f54KD+zYIHNHk0qLQ7b15iK9Ttq2
	T/Sbcj/AF4nF/LZH/8YvyWJOmFtnTyxBxx4Sf5MxTbsWE3Zaamd7Kyfhs773FQ==
X-Received: by 2002:a9d:7ac7:0:b0:7e9:e288:5d45 with SMTP id
 46e09a7af769-7ee6c2012e9mr2468001a34.18.1784952923486; Fri, 24 Jul 2026
 21:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713084140.249515-1-vidhu.linux@gmail.com> <amIXogW-sKfOhuxO@daedalus>
In-Reply-To: <amIXogW-sKfOhuxO@daedalus>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Sat, 25 Jul 2026 09:45:12 +0530
X-Gm-Features: AUfX_mzFsWgUGldvlaqterMEytvI9E0k_JwQopj7dlGejEsO6Kb-qaXvx3qYaTg
Message-ID: <CAFqz8LJLZ4c3qT9LWrW8BMVknrMtiRhJzwqa7VLQuxOMkJJr=A@mail.gmail.com>
Subject: Re: [RFC PATCH] fs/ntfs3: prevent positive E_NTFS_NONRESIDENT from
 reaching writeback error handling
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2026 at 7:03 PM Jori Koolstra <jkoolstra@xs4all.nl> wrote:
>
> Should attr_data_write_resident() be returning positive values on error?
> If this is correct, and this is a matter of data corruption you can use
> EFSCORRUPTED (EIO may also be fine if this is what NTFS uses in other
> places).

Yes. attr_data_write_resident() intentionally returns the positive
internal status code E_NTFS_NONRESIDENT when it detects that the DATA
attribute has become non-resident. This is an ntfs3 specific
used internally to signal the transition rather than a standard errno.

The issue is that ntfs_writepages() propagates this internal status into
the generic writeback error handling without translating it first. The
MM writeback code expects either 0 or a negative errno, so the positive
value triggers the WARN_ON_ONCE(*error > 0).

I chose -EIO because this is not filesystem metadata corruption. The
race is between is_resident() and attr_make_nonresident(), leaving the
filesystem in a valid state but causing an internal status code to
escape outside ntfs3. I think EFSCORRUPTED would imply metadata
corruption, which didnt happen here.

Thanks,
Vidhu
