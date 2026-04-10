Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D397F15E8B
	for <ntfs3@lists.linux.dev>; Fri, 10 Apr 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816132; cv=none; b=u0AzMMuO0UY2WPjOxRo8JJFXopFZELZUEkDcdR+ASIazRG1YdO3o62bdLpuwiGQRg0bacwBslgeJ18K2CcZhg/y7txWT1hKE2EIG7oKic8A4DckeeX02dNTSGNqxqXHl7/8J+3ACOHyL354QeoCcUUtlmXYHjXxo+L3W1etm/AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816132; c=relaxed/simple;
	bh=bj/+7ZRi0oIEoeWDi4nqArlVYc8xKv/5XUrw/6YOjWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVOcd2mIb8PRibrqu4XpRsBX0D0xWP4mY02xbdzHg997JpOLK2L31TdUeC0X7P8HJrpliRj0sdlSvmSqLeshadGPnvZikVkiblZGi1Cs6iikX+4ZzTuwH8IJmynE1ljLqE3vzLQ5VRdjl2LGFS534NIXDZg9RPsqH8sABt7xATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu5fKkl8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu5fKkl8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8efed61so16267425e9.1
        for <ntfs3@lists.linux.dev>; Fri, 10 Apr 2026 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775816129; x=1776420929; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVL7Qi0wmAG3bdRetsHFrhocxBbGWFwVYmn/cmqPvYg=;
        b=Zu5fKkl8Ia9hvO+Za8G84Gr7YbyUw5fz4f5eSs51sIr/oTI+K5GsHjtNGlEV7EhFGV
         LyO8eMjulNHfFOa9Z6MXX6Xhxp6Dj4y6dGLA9gEkXbnMD9zelOhKgu3QjY/HsliBMhYr
         nJcKJsHdeCQyl2lStFNdJ631iXhoH4VrodIU4PsBVcLDyyWyK37i4l4rQ79/Cq42a87j
         v5rMVpsWt+DqBQjSq62s7FQ71upYDBHOwbch1Day1Dk5zRFPOhlTeXFXY1Xj6wiRkzvW
         jLVbLFRjDE0VxUr1Az+IiyvypNUWpbzGTfwSspOZsYYpSFISzBir3KHgc5vykK34mt0O
         Vmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816129; x=1776420929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVL7Qi0wmAG3bdRetsHFrhocxBbGWFwVYmn/cmqPvYg=;
        b=ODwcnV4pl2Iz3FByul08Na1t8OvB/qnupWp3lLt7pYFH8P+HcVbcxID2mViT51fgEz
         hOq34cFATB4eFnKknfe70mh6hb6+961rNP33DtelyVnnodEsep/2BE30zmNleQ7e5JdH
         MRi1FLIrltBiv1S8rmh0uEQO4rcpcaqm88bIUHTuE8WO1FHQtUoWEfgd0w6Slpx9qtdw
         iNFcEZa75qz1J2x1V4wRTUDb4o36/f3kVjkGCs/Sfwxf9zXgKPu06EP8UcD4JrMtBKV0
         zC6B/VmHEEo3xtzJkeTClUM75LF45hkMiwaS0fE47YEFvAQksfeyXilfMAJYtulMwsHV
         Blng==
X-Gm-Message-State: AOJu0YyJ9Vu+I2D3XqcWUjMuK6YTNETdyD3HiwyIxiNB4OOtdn+n7hfY
	uhQNvkfu8HmGvVmKruu3e6ONfu9mPMbCVXxsmKf5th3Qkeq3CC0fnIhn
X-Gm-Gg: AeBDievZu/ytimmkYvBsUObjg28yPr0gImIiXxv1HoxrTUZXJuF1oencYAi8en2M2CE
	4a1fiXywx1o5qq7m/54azmooMlEAQGnvBe3ZOcD9WN4opfyX1e1fmVmn3hfVJQ+r4G8KgNNgTMk
	MG7LNKi4tR5w+h/akUCrKi5v8eA4LeG+oapuQL5JAaYjXE7ENoPHkq7kV3cS5QlUitX3CFf7ckY
	8CzhOZ55gNECduKhjAJNRR8O+aYi244T6T7xpQUN5CAUP9LVBNb4eMpSnXovKFWDC540miXyyrA
	81a72UsGo5EZtL+UX2MaQa3Agmi/a9JWl5iv2/KCmM6LanbZ/xEB0k9qIZ6f+gj0S20NvPZLSc7
	l1+YfR5xXFJ30ZuiIgu6Za8+jVJwgGtzhvekDvMwvfary4EXN2bebvKUzc0tbRHB2bvnW74Dck+
	/iBZkqedQPawA7Z/bRkDg=
X-Received: by 2002:a05:600c:444b:b0:488:9c3b:ff40 with SMTP id 5b1f17b1804b1-488d6acd9fbmr25729935e9.15.1775816129062;
        Fri, 10 Apr 2026 03:15:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d6864121sm16374345e9.28.2026.04.10.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:15:28 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:15:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add attrib operations
Message-ID: <adjNvTr_3bZmmPfJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konstantin Komarov,

Commit be71b5cba2e6 ("fs/ntfs3: Add attrib operations") from Aug 13,
2021 (linux-next), leads to the following Smatch static checker
warning:

	fs/ntfs3/attrib.c:176 attr_allocate_clusters()
	error: we previously assumed 'pre_alloc' could be null (see line 167)

fs/ntfs3/attrib.c
    160 int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
    161                            struct runs_tree *run_da, CLST vcn, CLST lcn,
    162                            CLST len, CLST *pre_alloc, enum ALLOCATE_OPT opt,
    163                            CLST *alen, const size_t fr, CLST *new_lcn,
    164                            CLST *new_len)
    165 {
    166         int err;
    167         CLST flen, vcn0 = vcn, pre = pre_alloc ? *pre_alloc : 0;
    168         size_t cnt = run->count;
    169 
    170         for (;;) {
    171                 err = ntfs_look_for_free_space(sbi, lcn, len + pre, &lcn, &flen,
    172                                                opt);
    173 
    174                 if (err == -ENOSPC && pre) {
    175                         pre = 0;
--> 176                         if (*pre_alloc)

I'm not sure why warnings from 2021 are showing up as new warnings but
presumably this should be:

	if (pre_alloc)
		*pre_alloc = 0;

    177                                 *pre_alloc = 0;
    178                         continue;
    179                 }
    180 
    181                 if (err == -ENOSPC && new_len && vcn - vcn0) {
    182                         /* Keep already allocated clusters. */
    183                         *alen = vcn - vcn0;

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
