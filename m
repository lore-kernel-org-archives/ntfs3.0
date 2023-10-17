Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1529428
	for <ntfs3@lists.linux.dev>; Tue, 17 Oct 2023 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cFe9NV0v"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4064867903cso63532285e9.2
        for <ntfs3@lists.linux.dev>; Tue, 17 Oct 2023 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697551485; x=1698156285; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouydOp9DCQDO9RKyjjgbFfmh727nP3T250yuxX8/3Do=;
        b=cFe9NV0vWWS9s+S/zBqgpp4OZoHaLu9S0+rPRaP/J7NsL6kOju+rxk9mBq80MYObtE
         Oo9v6D/J0hcXeoc90UW5Q4SN1eNCzsHgszjNrDzpw5zlIlqyyMlMwg0cAOrja53P8UaR
         bNsaYxNEffdFWTfAxQ5tuzO6CWaVBCqO735V6KsAlollk8q4wwN9lxycp6KgJ2v6ht3Z
         X+ECUyKaYToAmh4rC9zUfzBZSPbfrCt+OlNSk5cOMlwdehd6Hn4FdI5Q1EPDeam5yl1w
         83Wl+spuioajjF+aK0GsGfaRtSlEaMokIX4bacXaM5xbLCWAdYLR/IFl2ctlcfoL/Cnu
         +5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551485; x=1698156285;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouydOp9DCQDO9RKyjjgbFfmh727nP3T250yuxX8/3Do=;
        b=X+lkUwL1EEQ8RgDc2iwn7HeDxXr+4efmYydnALItaY9+eCK5KJXZcuKte6808vtyK2
         wt4+V6wHXaovtPdln6DE6eNIpj2wCWqnbRTaF/ouJm63TVw42ep35ome7VY/zB2rC50p
         E1E1+yF6RX2F4c4V38fq58CBlvmZBXIpZR94ecIiAp4uaUbRCMPbQ6QkHhl9Wrk646F8
         E5ByePRtt6B2bmYJUKD0tsTta0pJOiLBCS8Z8s2jhpIa2fNp5IJn4Cr2KkDVUmnfzAAj
         v1Tccgf+163zeyejOf5HsorV053qjelu+M8gLlLmhbY/Sh14CwSbo7k0moALU8m0Frbk
         GVqA==
X-Gm-Message-State: AOJu0YyBdzmEzbMQEX+RE4vjEu0vgESUrCAu57tkas7eoWt2VtoA1jb8
	KuONswrVEppIRXgYWGjHseYMPQ==
X-Google-Smtp-Source: AGHT+IG+7ZMm33Rpww/J0URdy4cjxktBY6DGdh6pUvEnJTHaaeZewjB7KcCSa1ayxVlxIeHyAxsIqQ==
X-Received: by 2002:a5d:4b50:0:b0:32d:9fc9:d14c with SMTP id w16-20020a5d4b50000000b0032d9fc9d14cmr2220441wrs.47.1697551484896;
        Tue, 17 Oct 2023 07:04:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d58d2000000b0031c6581d55esm1752895wrf.91.2023.10.17.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:04:44 -0700 (PDT)
Date: Tue, 17 Oct 2023 17:04:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Fix an NULL dereference bug
Message-ID: <4dea69da-738b-41b2-b48c-22dfee5f4fc8@moroto.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The issue here is when this is called from ntfs_load_attr_list().  The
"size" comes from le32_to_cpu(attr->res.data_size) so it can't overflow
on a 64bit systems but on 32bit systems the "+ 1023" can overflow and
the result is zero.  This means that the kmalloc will succeed by
returning the ZERO_SIZE_PTR and then the memcpy() will crash with an
Oops on the next line.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/ntfs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f6706143d14b..a46d30b84bf3 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -473,7 +473,7 @@ bool al_delete_le(struct ntfs_inode *ni, enum ATTR_TYPE type, CLST vcn,
 int al_update(struct ntfs_inode *ni, int sync);
 static inline size_t al_aligned(size_t size)
 {
-	return (size + 1023) & ~(size_t)1023;
+	return size_add(size, 1023) & ~(size_t)1023;
 }
 
 /* Globals from bitfunc.c */
-- 
2.39.2

