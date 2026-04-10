Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7A21CC5A
	for <ntfs3@lists.linux.dev>; Fri, 10 Apr 2026 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800839; cv=none; b=uXdEzEexaPIYisZnziBnnPD4eNCav0LnM1VAxrJ6pUmp4/H3SdhlkiQCo+KN+4irBrzl5DzwxjTsSU6jyj6yazzG6jLJendBlwdaTuQWaUsnjbJDpZINdRe0hf6+7z2zUxd0Narz1bhPtqEmwZAz9YTS/XI6kFRiCmrROh0KXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800839; c=relaxed/simple;
	bh=6Ogwzmm054n9+T8yJh6DhsXmBMJ+W2hjcNL57kaOW04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cw5BebbdmTcIRx/oI+j+MI2SVqHSQIGY2D6ZYFqFPJ4txL3vIPpEmcbFe5e2C/uXBBQ8qSvyLQur+rWOJJvq79CvkCl4l/FoBIAFt/KAv/0XyyQDpH1ic+7ne57Eahr7VjUZQK/YDF0tXmXMZK744N7SsU8xHRWLYez/Srua1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alBfyM3T; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alBfyM3T"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso18413075e9.2
        for <ntfs3@lists.linux.dev>; Thu, 09 Apr 2026 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775800836; x=1776405636; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2AknOYeAW8rAhXVFiEJlyHdAP3xNg5oePy9Xu5rolI=;
        b=alBfyM3T64SEbEB1DDq69RjI8see8J5df2gNw8LWANadRtNV9v9OXoryoKWyevj7d3
         kDxYYpsAVtWMYaY2e0gQEGiu5dZdbjp48z9Eg8JRJqg7sHkx9q7W7anEIhhhiEv8DEsT
         9CJci/sJVjTdn13LreaSmA3gbyUjpHaksOf05MWmglbcvbmQ1c/Fk9s2g54JDln3XBED
         g134bajIfsj8W0RZcGaNrK9TWof+4AGQjMCNRbQpCjOlqvNYqRODue7Bv4x+VLZi8D7I
         HYoj4j6nfk8ouxRgeA5GI+u52rgPtuDXoVkFZgr1t5m+/CTPJVhenxeGP2czE4jTULSA
         YB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800836; x=1776405636;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2AknOYeAW8rAhXVFiEJlyHdAP3xNg5oePy9Xu5rolI=;
        b=VIhqoSvFY7/qKCvZcvIUUKWmIWAZHII/51siGU+3dp757M2qPNNy2bwksK7yBj0mfC
         x97XBTLwrr9LwaHhWmYxX/Nz9bjF6iMXjtRWmNGCdWODoFH4+NNWyeCtptLgT38mk2ID
         7P0coQfko4ZocufllAbYDcthC1Bg8NN+LyOj+qtDx+IgozHunmWkgBL8pbrmlw5MSkHa
         Mk+qtJo/uiptEEiGBDItOiPp67/ABKpHO5o3GuO0MEnYnecJhn3Y5axioHtOijVSmO7N
         AXiUQ3xz4ueObWi7EehvKLHnI3jQtDY/fiZfB63gqPzTQXy16u4pOzCOkoIBGth++J8g
         rPVg==
X-Gm-Message-State: AOJu0Yw0mam6C3cR7xsHIeF6rrox5c1hDRIEN0zZEZWe7l/8A/Y7yBMZ
	YduKoQvOVCKOf64hypq6xvXR1/x6hFFWofTrUie99PePjqA0jBp4oFWy8ttS7eEP
X-Gm-Gg: AeBDiev6+7JOfue0IbCPMqlCyIlg4NHioMVLAlSctykM2BuoxrWM3ci+6VTgRvUkgB5
	aD7RJlThFv4jot0DZ40p/yoMWpGt4ypzPjNJqzKAQSLMwAvC8eeltQGmvxvZj5jBcT6yMpcbqTK
	+b1jE6/HJwtCwDZQXEFGDt6os2wwcMTTAAMMy2hH4WudAUJreWaDtMTXvWgoDnzbsBpirlAnxa3
	pgnU25T3xvyWfdR0PhVwSXEK5w7OeI0/TA3y80MKvpjM4bQ9RwtayyWP2rbrKE7Vqcla/+z7wbC
	EqPR+0xonb/DnW6HZnmNeM3V+uO3aHJ/ZgLKeSu4oEgisvj+goqc2SmpRJZNFpbiiBQvrVJMYLs
	8D8nDVa0tcf1+BrgTFz/f7cZwywqPaGnMSmXhoVHT37+nAGIB93j3ur0LhO+KT6VAFpKAEYGzik
	mgboDsLcOQSX9fFBVR3FM=
X-Received: by 2002:a05:600c:1987:b0:488:b187:d8ed with SMTP id 5b1f17b1804b1-488d67bf765mr18948805e9.2.1775800835701;
        Thu, 09 Apr 2026 23:00:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec28asm4648627f8f.15.2026.04.09.23.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:00:34 -0700 (PDT)
Date: Fri, 10 Apr 2026 09:00:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: add delayed-allocation (delalloc) support
Message-ID: <adiR_6B7IpUDjGSh@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konstantin Komarov,

Commit 10d7c95af043 ("fs/ntfs3: add delayed-allocation (delalloc)
support") from Feb 16, 2026 (linux-next), leads to the following
Smatch static checker warning:

	fs/ntfs3/frecord.c:3303 ni_allocate_da_blocks_locked()
	error: uninitialized symbol 'err'.

fs/ntfs3/frecord.c
    3268 int ni_allocate_da_blocks_locked(struct ntfs_inode *ni)
    3269 {
    3270         int err;
    3271 
    3272         if (!ni->file.run_da.count)
    3273                 return 0;
    3274 
    3275         if (is_sparsed(ni)) {
    3276                 CLST vcn, lcn, clen, alen;
    3277                 bool new;
    3278 
    3279                 /*
    3280                  * Sparse file allocates clusters in 'attr_data_get_block_locked'
    3281                  */
    3282                 while (run_get_entry(&ni->file.run_da, 0, &vcn, &lcn, &clen)) {

Do we always enter this loop for at least on iteration?  Otherwise ...

    3283                         /* TODO: zero=true? */
    3284                         err = attr_data_get_block_locked(ni, vcn, clen, &lcn,
    3285                                                          &alen, &new, true,
    3286                                                          NULL, true);
    3287                         if (err)
    3288                                 break;
    3289                         if (!new) {
    3290                                 err = -EINVAL;
    3291                                 break;
    3292                         }
    3293                 }
    3294         } else {
    3295                 /*
    3296                  * Normal file allocates clusters in 'attr_set_size'
    3297                  */
    3298                 err = attr_set_size_ex(ni, ATTR_DATA, NULL, 0, &ni->file.run,
    3299                                        ni->vfs_inode.i_size, &ni->i_valid,
    3300                                        false, NULL, true);
    3301         }
    3302 
--> 3303         return err;

err would be uninitialized

    3304 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
