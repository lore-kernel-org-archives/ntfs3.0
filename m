Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912F472
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:32:39 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id j12so22039684ljg.10
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q7PjJEUCW3c85Bu1V64W0nURwPby5L9s6kovx2W2rhg=;
        b=RHLrbQxDGt+Mq5Zj4dwXibKkydQD/fMJUwlWC0B/KgVZ0wY8knOP1PItYjmKoV82OT
         RNhclJUrB4K5QeImbNlWKkQsj4vdJdGxC3yHf5qljktclId+GJOneoS4m56pvivm98PF
         TugDUkGwS3qIZsoINY3e85whzphkCw9P4t/6EL4mYIsvIX4Nog7avCXmdv4LTUb3XuV+
         FPUnMcKzIQDDGLlJYaqyIP2QQyt6JSJWU8DQdIv2KJfMPs6/kWyvYuySY8JXkxUWwDcZ
         Q74tWBWz12wAHHfowV1cO1VdRdy8/PKVn47g9fzx2y6De2fpN6gHnHgDbmwTiShNwFKb
         tbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q7PjJEUCW3c85Bu1V64W0nURwPby5L9s6kovx2W2rhg=;
        b=RDvEP8htecdrScuCjmh3KWnQz3lIgbYfiKLFyINlQ+mOeLG1xqpkzjxOkkg9T9Y9+V
         PvMZd/t2LnmVSt/0k/Cqpazytw+6cgKnslvlIIduRfXZq4sX2x8bMWuWB+ncWQiKQUFq
         WQf9g8kcH4a6kOoPNkGBaSQwAo+R1EmFPT0HVnA005+ztmOltF2lONBtSNzCenDqZQjW
         seAf7RtIGmP/NRyA6cnRKOAY2nW+rdUuUMmAgK2xtBPdBjcoxrfsArEaKO1iYUOEtNst
         OflEQO8qTzi5ifgtWRbDnlbfYLX0W7ht8tgdH3YntqX0hHlR0bc/sPkNRn7rdgLHQ95n
         3+iQ==
X-Gm-Message-State: AOAM531q6rmynR48Zl8LCKrjHJMXRWGDVZxoTB8EqDXG6enDFt4WGHIR
	pz8QoKHSRsqw8KpeitWDpAE=
X-Google-Smtp-Source: ABdhPJz/bnJ/8xrjmto2LG5udbOja9MsOaNtzEJ5Wnjh9Te/zqxKgO8HmuqBMyrN1lOslnidtcL4aA==
X-Received: by 2002:a2e:9182:: with SMTP id f2mr31098898ljg.57.1629797557598;
        Tue, 24 Aug 2021 02:32:37 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id g14sm1702186lfu.61.2021.08.24.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 02:32:37 -0700 (PDT)
Date: Tue, 24 Aug 2021 12:32:35 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [bug report] fs/ntfs3: Add file operations and implementation
Message-ID: <20210824093235.7yqhds7c2kwx46lk@kari-VirtualBox>
References: <20210824090255.GA18518@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824090255.GA18518@kili>

On Tue, Aug 24, 2021 at 12:02:55PM +0300, Dan Carpenter wrote:
> Hello Konstantin Komarov,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 4342306f0f0d: "fs/ntfs3: Add file operations and
> implementation" from Aug 13, 2021, leads to the following Smatch
> complaint:
> 
>     fs/ntfs3/namei.c:446 ntfs_rename()
>     warn: variable dereferenced before check 'old_inode' (see line 312)
> 
> fs/ntfs3/namei.c
>    311	
>    312		if (ntfs_is_meta_file(sbi, old_inode->i_ino)) {
>                                            ^^^^^^^^^^^^^^^^
> Dereference
> 
>    313			err = -EINVAL;
>    314			goto out;
>    315		}
>    316	
>    317		if (new_inode) {
>    318			/*target name exists. unlink it*/
>    319			dget(new_dentry);
>    320			ni_lock_dir(new_dir_ni);
>    321			err = ntfs_unlink_inode(new_dir, new_dentry);
>    322			ni_unlock(new_dir_ni);
>    323			dput(new_dentry);
>    324			if (err)
>    325				goto out;
>    326		}
>    327	
>    328		/* allocate PATH_MAX bytes */
>    329		old_de = __getname();
>    330		if (!old_de) {
>    331			err = -ENOMEM;
>    332			goto out;
>    333		}
>    334	
>    335		err = fill_name_de(sbi, old_de, &old_dentry->d_name, NULL);
>    336		if (err < 0)
>    337			goto out1;
>    338	
>    339		old_name = (struct ATTR_FILE_NAME *)(old_de + 1);
>    340	
>    341		if (is_same) {
>    342			new_de = old_de;
>    343		} else {
>    344			new_de = Add2Ptr(old_de, 1024);
>    345			err = fill_name_de(sbi, new_de, &new_dentry->d_name, NULL);
>    346			if (err < 0)
>    347				goto out1;
>    348		}
>    349	
>    350		ni_lock_dir(old_dir_ni);
>    351		ni_lock(old_ni);
>    352	
>    353		mi_get_ref(&old_dir_ni->mi, &old_name->home);
>    354	
>    355		/*get pointer to file_name in mft*/
>    356		fname = ni_fname_name(old_ni, (struct cpu_str *)&old_name->name_len,
>    357				      &old_name->home, &le);
>    358		if (!fname) {
>    359			err = -EINVAL;
>    360			goto out2;
>    361		}
>    362	
>    363		/* Copy fname info from record into new fname */
>    364		new_name = (struct ATTR_FILE_NAME *)(new_de + 1);
>    365		memcpy(&new_name->dup, &fname->dup, sizeof(fname->dup));
>    366	
>    367		name_type = paired_name(fname->type);
>    368	
>    369		/* remove first name from directory */
>    370		err = indx_delete_entry(&old_dir_ni->dir, old_dir_ni, old_de + 1,
>    371					le16_to_cpu(old_de->key_size), sbi);
>    372		if (err)
>    373			goto out3;
>    374	
>    375		/* remove first name from mft */
>    376		err = ni_remove_attr_le(old_ni, attr_from_name(fname), le);
>    377		if (err)
>    378			goto out4;
>    379	
>    380		le16_add_cpu(&old_ni->mi.mrec->hard_links, -1);
>    381		old_ni->mi.dirty = true;
>    382	
>    383		if (name_type != FILE_NAME_POSIX) {
>    384			/* get paired name */
>    385			fname = ni_fname_type(old_ni, name_type, &le);
>    386			if (fname) {
>    387				/* remove second name from directory */
>    388				err = indx_delete_entry(&old_dir_ni->dir, old_dir_ni,
>    389							fname, fname_full_size(fname),
>    390							sbi);
>    391				if (err)
>    392					goto out5;
>    393	
>    394				/* remove second name from mft */
>    395				err = ni_remove_attr_le(old_ni, attr_from_name(fname),
>    396							le);
>    397				if (err)
>    398					goto out6;
>    399	
>    400				le16_add_cpu(&old_ni->mi.mrec->hard_links, -1);
>    401				old_ni->mi.dirty = true;
>    402			}
>    403		}
>    404	
>    405		/* Add new name */
>    406		mi_get_ref(&old_ni->mi, &new_de->ref);
>    407		mi_get_ref(&ntfs_i(new_dir)->mi, &new_name->home);
>    408	
>    409		new_de_key_size = le16_to_cpu(new_de->key_size);
>    410	
>    411		/* insert new name in mft */
>    412		err = ni_insert_resident(old_ni, new_de_key_size, ATTR_NAME, NULL, 0,
>    413					 &attr, NULL);
>    414		if (err)
>    415			goto out7;
>    416	
>    417		attr->res.flags = RESIDENT_FLAG_INDEXED;
>    418	
>    419		memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), new_name, new_de_key_size);
>    420	
>    421		le16_add_cpu(&old_ni->mi.mrec->hard_links, 1);
>    422		old_ni->mi.dirty = true;
>    423	
>    424		/* insert new name in directory */
>    425		err = indx_insert_entry(&new_dir_ni->dir, new_dir_ni, new_de, sbi,
>    426					NULL);
>    427		if (err)
>    428			goto out8;
>    429	
>    430		if (IS_DIRSYNC(new_dir))
>    431			err = ntfs_sync_inode(old_inode);
>    432		else
>    433			mark_inode_dirty(old_inode);
>    434	
>    435		old_dir->i_ctime = old_dir->i_mtime = current_time(old_dir);
>    436		if (IS_DIRSYNC(old_dir))
>    437			(void)ntfs_sync_inode(old_dir);
>    438		else
>    439			mark_inode_dirty(old_dir);
>    440	
>    441		if (old_dir != new_dir) {
>    442			new_dir->i_mtime = new_dir->i_ctime = old_dir->i_ctime;
>    443			mark_inode_dirty(new_dir);
>    444		}
>    445	
>    446		if (old_inode) {
>                     ^^^^^^^^^
> If old_inode can be NULL we are toasted.

It seems to me that old_inode cannot be NULL. So this check is not
needed.

> 
>    447			old_inode->i_ctime = old_dir->i_ctime;
>    448			mark_inode_dirty(old_inode);
> 
> regards,
> dan carpenter
> 
