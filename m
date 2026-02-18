Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D2330665
	for <ntfs3@lists.linux.dev>; Wed, 18 Feb 2026 16:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433624; cv=pass; b=G3fBUkEAAYHYWsQm/38t6A2qMnkoqAgdRr7mATvcbTWm5i/3EQUjVALW+Jp+C8J4eifGxwBYPUbRg+20hQ6a7g4b6x/4CXUOICYHkmxSy2cegQ64upXkfiDWZumFlskNXZcXwVa3xrmWnTs4f2UtrEiebBvo/LcUcYyyptOEYb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433624; c=relaxed/simple;
	bh=g3yqfUCC0w8uhWh0gaCulJ42wSE3w0NYVYfUc0m+/LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rL17HUoOnCpgUwXd4JFH68ee39sAEUL9zQNIWCxxuElLHEUDAPvYaHcX3v8PDu/SU4JF9mwmdPUhg5coVp/wDPug3tqrV1QE84P1al7V585RWe/UrqWVBaOogpNeUdrEYp0crKB2dQOYSaE520nWDStsH15B7RSc/49Yga4qRcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWXV+nTv; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWXV+nTv"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4638e6bb8a5so6316b6e.0
        for <ntfs3@lists.linux.dev>; Wed, 18 Feb 2026 08:53:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771433622; cv=none;
        d=google.com; s=arc-20240605;
        b=PsPaJCXP+L7AnprMiwukfQPSvXNQR2OfYyTIZINJOkq0Gp1d+FCXffI7cDHWeClelG
         +a1qTg4Tg2NS3U2QeCK7dhPEP+LNXEvOkjFYHsSFK4Ds3Dd4qPmi2FrYK97fFyN7TdVD
         nS0YK7ydBB7OLbVHV9hFCyhoatFfrhRAZTc0b3a6HO6hYv4tplSwUu7YyxeEKIEjbNXx
         OUWk8czQzX4iWdGD3mo5NWvM8VCpb0FHIX+JQjticVyHYWT/Jyms3kvncJGo8kjuQ/Z+
         etMR3TyJcxofoyWxNXuoXPQOotJTU9h3075JsZSfXCyJoep4Vd8x13a3PwKcsMgVReU+
         CO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xvG8EkoppJSFqigSB69hRsruZ4tvURNxVZr5SRYMfV4=;
        fh=+GGUGg/ziU2vwfu2pnoubRbt7UwRTH4NZ02og6HMu9w=;
        b=bIHXCUYlNW9BbkxsQvHcozUNjfR6J+7Bx6smeDtFHNo562RQEeZ6JxsuuDj/KsGDKr
         AGZh/f7SkmgzvavczL7pHuAYcZb7GBMhseChVRU6DvR6HqE/WdG4jT3ylzLAjQanPlJj
         Yqc2LlcYpbbdtJw8GgZLDfw/8w1luEFHIBRTTTZ5OQ1nt3x70RMGpLQeys7hj/5Id5vM
         bJ/1yCWRUaVH421+V20DtPhz4PqDOkXl58B7dUxyEM4zh2/+UuhcqEK38W808a89lU12
         /VTua6lJKY3y4ei1tzCNjqwD3Vv91awkMoyIWYnGf/TakVG9lCIT4z7gqirANguxjQkI
         qv2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771433622; x=1772038422; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvG8EkoppJSFqigSB69hRsruZ4tvURNxVZr5SRYMfV4=;
        b=SWXV+nTv2tSvysDyDpnzvCxve5B64wxXWwPJeNDsLVyJd+DDBpNk98+kgBQ7l1O14o
         FN2NvmvV48s2W9Ubn2Rp/ccqyF/MXPPeHXlD8HnM8um4tM/ZfW3ak1IGnURU/BrouEMg
         tgx8tS/r9mOmnXMkxCNOTOc7DMF5SkdEdfA4IznQiHZ/vMk94ttoJFQzPp/j1tC8AWKr
         O2SNWt3ezCYd84TXXBnUcdBDb7lF1VU01eRdmifUJcNOB8FkvTkiuSKIHwDefi289Yif
         W5ynDDBKKjHN3gc8iqK8DBp4HPrLDDWiSiH27/LG5HA59CUu0A1F8VIpD2oYzOUoYzSC
         8n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771433622; x=1772038422;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvG8EkoppJSFqigSB69hRsruZ4tvURNxVZr5SRYMfV4=;
        b=hNW1Ces7z+JSTdGUE4OF2gd6hqQUPjj7KfJZbN7lnXHXC34T8T0Sk4KOAG1RuuuP/w
         JT2BTkPvWcrEgf4ZIhaxYDkAtfxTwOl/uihoLROQQPr/AhHRs5lhP2BztrbmpOjd4o+H
         o8lVxeKFDQ/93vnQ6sWQjAMBS3bStdxIbfE1aZ4z+pbumuHJ8DO+QmjTgfXhjyKXESLZ
         LIH5otDVmE0J9bO0iXYPaNGELsA16ej2g08YUXxEU9EzC/yuXJ9JRjU0G0mfjQw5ad3K
         dA49ysKaHrZmQQ3zwz5GD4LKYvTpgfU2lEKwCKUuW5nwVbkaiFhDUwq1Fa6JuQg+6aId
         ClUg==
X-Forwarded-Encrypted: i=1; AJvYcCWy3iVk3CvPLxDdiC3XvarI3gkKOk11xwHDtgCSPXiY4sNDjEaultPMZFxOsW2+zQw7UR10FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUz+3hwNrDecpmHrWGzE69Ps9Q4uUySz/CsBaeLXSbHscYXeQA
	rjPCFu/DP5sBdAUJrZIUwR4+TznKzDrrUsXymxd/mmqDXOkpH+h4Lg2PYkYBz+HH+yH5Y1GLJmj
	RHvo2z1qJTAG8gHn+QnzKxhlkr4fdePA=
X-Gm-Gg: AZuq6aKbQa3keWcBhjCOHrFihJugOI1BbjOA1BrIgvu5h/h+OIJRuRuZL20xACXa3fR
	4Pg/cdED8Et6wqVuPBcfti7swGlK2DDhvD+kYUo6Fs2OU/EWDaDRp+RMhk89SOMfgsJT/fCIqP8
	M9VE3knb77Rd2CHqgnBpVOI6CpCYQkvRhVgCIpTMzkx3iIjr6vW6Vv80qrC3OhYYe1rI1NV7wiP
	aPjDpJ4eu8iTzJSC4IEbpWt2VrxG/8nE93tL8H6F5Tb370NDclQMEikoERVHZS5r2HLeJedh/Fy
	L8jyOvA=
X-Received: by 2002:a05:6820:2906:b0:662:e066:73a1 with SMTP id
 006d021491bc7-6785bb6680cmr7685943eaf.57.1771433621536; Wed, 18 Feb 2026
 08:53:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260217190630.19176-1-almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260217190630.19176-1-almaz.alexandrovich@paragon-software.com>
From: Cedric Blancher <cedric.blancher@gmail.com>
Date: Wed, 18 Feb 2026 17:53:05 +0100
X-Gm-Features: AaiRm53mlLy345hnlV9B-BbxSP6_u1WFa04fVrul6o07J7U_NE0AnBbgAtp3MVA
Message-ID: <CALXu0Ufui+SPgpBz8pGOeZcB=RWDgjBChLiOHUqm3OGvy38h+A@mail.gmail.com>
Subject: Re: [GIT PULL] ntfs3: changes for 7.0
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Feb 2026 at 20:07, Konstantin Komarov
<almaz.alexandrovich@paragon-software.com> wrote:
>
> Regards,
> Konstantin
>
> ----------------------------------------------------------------
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
>
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>
> are available in the Git repository at:
>
>   https://github.com/Paragon-Software-Group/linux-ntfs3.git tags/ntfs3_for_7.0
>
> for you to fetch changes up to 10d7c95af043b45a85dc738c3271bf760ff3577e:
>
>   fs/ntfs3: add delayed-allocation (delalloc) support (2026-02-16 17:23:51 +0100)
>
> ----------------------------------------------------------------
> Changes for 7.0-rc1
>
> Added:
>         improve readahead for bitmap initialization and large directory scans
>         fsync files by syncing parent inodes
>         drop of preallocated clusters for sparse and compressed files
>         zero-fill folios beyond i_valid in ntfs_read_folio()
>         implement llseek SEEK_DATA/SEEK_HOLE by scanning data runs

Thank you for the sparse file support in NTFS3!

Ced
-- 
Cedric Blancher <cedric.blancher@gmail.com>
[https://plus.google.com/u/0/+CedricBlancher/]
Institute Pasteur
