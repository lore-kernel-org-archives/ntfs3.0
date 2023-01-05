Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46780F
	for <ntfs3@lists.linux.dev>; Thu,  5 Jan 2023 07:13:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso614614wms.5
        for <ntfs3@lists.linux.dev>; Wed, 04 Jan 2023 23:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K973VJXyJCmhlaKZXH5dCoBryHgMUTdkXwqaxzazVgg=;
        b=T8rCcSzq/79cNmFCUEGOxU5FQxGvXq+ZDTW7hsZ7Yhq8cIy6ygjwoj/oi60lhy2Mwd
         B+/mhobzrWjLaE/kkJa/0lCJFfxPNBtbH3AHPaQZz2sTR1uH0Ashfs/ZwJKowsS4oWs6
         zl0pvnj6lhg1dk2+w6qgTIVZcg0Jfd0pncFNlOvHzBJKIe8I+7Ze6aSiCPay/ez7lngA
         BXptvokMgar3pktMvkendNBcNmB4Ad1xTvAGtjhIOk3mpbCzlbqe0S0LOYfz23heljgU
         OvDcZ8G09ZxP1mlq2kQVv0WWaMReOyOSZIG4jJUw0YIjxbRKvCwOcoep+xEnYilS0reW
         e2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K973VJXyJCmhlaKZXH5dCoBryHgMUTdkXwqaxzazVgg=;
        b=M3z59V8s/pdZfcaYjPX7RzQPSY4CR1YyxdUgP9yCBJDisbPgW1mm3JLf4u4rsQr7YS
         Rew3BaFtIc0cerhPoz8+vEyD/Q6HJKQYwSRnHB7QFW+CQqkhP70fVk9RD+M8pqgOudD6
         JF+2VBpDm0AuGRM3+VLw/SYgYC7zkChTOjCoXhF3n4nNK+psoWyZTa2Gl2Ao2b3Ekqbz
         EEuKoNSoDMazthVgx3kMo9w/L0hWOB51dnCtjtqJ6Tef9J6Wyke49gT+yesnCgG4b1Ni
         2tYpoUHLL4NHniHhjTYi1yEEkHQLIEAOXqhlWQOUOrIe0J9dSMg8I3pLoSZoY3u4+kOH
         9Geg==
X-Gm-Message-State: AFqh2koWmAEKHfyR8L1kojeOHKlJvIKSVaK9tH8z5XOudXUNF3tm2wp7
	AdGM9iQgP5YSyQHeiBFUWF+s+vngThY4j62q
X-Google-Smtp-Source: AMrXdXuCbm7CFibcg4zVKHsHpb3Rqb+1eTlShvl4seGwFH3sex6pr0IRJbWJbv1jrIm59YDuTa81nQ==
X-Received: by 2002:a05:600c:1c11:b0:3d0:a531:5413 with SMTP id j17-20020a05600c1c1100b003d0a5315413mr34822275wms.34.1672902786757;
        Wed, 04 Jan 2023 23:13:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b003cfa3a12660sm6473265wmb.1.2023.01.04.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 23:13:06 -0800 (PST)
Date: Thu, 5 Jan 2023 10:12:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: zhangpeng362@huawei.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Fix null-ptr-deref on inode->i_op in
 ntfs_lookup()
Message-ID: <Y7Z4aXWLuR/Uel2u@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello ZhangPeng,

The patch fb6b59b5a2d6: "fs/ntfs3: Fix null-ptr-deref on inode->i_op
in ntfs_lookup()" from Nov 25, 2022, leads to the following Smatch
static checker warning:

	fs/ntfs3/namei.c:96 ntfs_lookup()
	error: potential NULL/IS_ERR bug 'inode'

fs/ntfs3/namei.c
    67 static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
    68                                   u32 flags)
    69 {
    70         struct ntfs_inode *ni = ntfs_i(dir);
    71         struct cpu_str *uni = __getname();
    72         struct inode *inode;
    73         int err;
    74 
    75         if (!uni)
    76                 inode = ERR_PTR(-ENOMEM);
    77         else {
    78                 err = ntfs_nls_to_utf16(ni->mi.sbi, dentry->d_name.name,
    79                                         dentry->d_name.len, uni, NTFS_NAME_LEN,
    80                                         UTF16_HOST_ENDIAN);
    81                 if (err < 0)
    82                         inode = ERR_PTR(err);
    83                 else {
    84                         ni_lock(ni);
    85                         inode = dir_search_u(dir, uni, NULL);

The issue for Smatch is that dir_search_u() returns NULL if the file
is not found, or an error if there is an error, or a valid pointer.

    86                         ni_unlock(ni);
    87                 }
    88                 __putname(uni);
    89         }
    90 
    91         /*
    92          * Check for a null pointer
    93          * If the MFT record of ntfs inode is not a base record, inode->i_op can be NULL.
    94          * This causes null pointer dereference in d_splice_alias().
    95          */
--> 96         if (!IS_ERR(inode) && inode->i_op == NULL) {
                                     ^^^^^^^
Potential NULL dereference.  Seems easy to hit too.

    97                 iput(inode);
    98                 inode = ERR_PTR(-EINVAL);
    99         }
    100 
    101         return d_splice_alias(inode, dentry);
    102 }

regards,
dan carpenter
