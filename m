Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8BFECF
	for <ntfs3@lists.linux.dev>; Fri,  7 Oct 2022 12:43:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j16so7131309wrh.5
        for <ntfs3@lists.linux.dev>; Fri, 07 Oct 2022 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmg35OUPOqpItFbb0fVCmp2BRL8Uzo+x+AWBO3UBbuk=;
        b=Vv+yV+YDonhhn4XHYSoPlHX8XAOKIfdmRGmwlFsBM6poITqF4hYx21ryn22p/Iv5OG
         zpG6X3TmnRKSuS4etgmZjC0xG896FVHDP06ANhxn2wNwjFEBFrFuhyLqPlTXmK9Hn1n4
         n32pxmud7iTfs3jREucJuRoGY9DifpfvozVNoDJgOl2tjE2xeBmzzwgKlnfAtdnouGzv
         HKyy1CVz7Fi986Ohih98mr80Epyk9G43BNgQltr8IMMX35jVW3tBQU6x5gN9AR9f9UKQ
         jqO9Q9ewrT7pfP5lbbakmLjldvKzPaViX2fosCvWyr/4Xcu1vRtxolbEtuPsvmCqgAUm
         6jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmg35OUPOqpItFbb0fVCmp2BRL8Uzo+x+AWBO3UBbuk=;
        b=XWahCOsmjx2lZk239+0PAph8xBHGlr+TCon2tXiA2EHvSmO8UMr9l4dOVmqG3f4kdG
         pVT+QLt8YQPBdcChtUzbhsQKCajMSMjAgc/EZIfM+nGPvREqsk9rH6wpJqUNF5ADGzud
         2gDHVFGkWUeqT3pm6RdJL1v7AFKyGqKpajnbnprq8hM25Jt7npk4+iyJcwyIXHrBnXyp
         HMNG2pLwcXdOS4FRUxTgn9mQx5wKw/jLE9Y6fRvdWweIEQuvzeRBKjfI0ONOAndJqde4
         1Ohb+sF3q7l2CAZZParVKtAewMoV6QJ/A6UNSv7Wi9A8hMA3RSfY8I/aa/srxb70PuUK
         by5g==
X-Gm-Message-State: ACrzQf3LtlzaGwOSb/m+zfPJn6FUDbMNl3UyvPfpQ5twGMasjV2yqvNa
	oq4t5TLgGWTKWUHKbMDUx7JcTYiW11E=
X-Google-Smtp-Source: AMsMyM7e/TZxd225fRtkWwaGrz4F/mzY0myKMuzE5tXZhg/gFu8rcafrqcK06dugaJE4/4zMtBJdkg==
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id y12-20020adfe6cc000000b0022ce0b9ef60mr3264023wrm.404.1665146586890;
        Fri, 07 Oct 2022 05:43:06 -0700 (PDT)
Received: from [192.168.42.102] (mo-217-129-7-245.netvisao.pt. [217.129.7.245])
        by smtp.gmail.com with ESMTPSA id j38-20020a05600c1c2600b003b3365b38f9sm1320809wms.10.2022.10.07.05.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 05:43:06 -0700 (PDT)
Message-ID: <7da4c888-6637-5be9-3e9a-26e0c5f19fb8@gmail.com>
Date: Fri, 7 Oct 2022 13:43:05 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: [PATCH 4/4] fs/ntfs3: rename hidedotfiles mount option to
 hide_dot_files
Content-Language: en-US
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
In-Reply-To: <536f13a9-0890-7e69-65e9-5fe1a30e04ef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The hidedotfiles mount option provides the same functionality as
the NTFS-3G hide_dot_files mount option. As such, it should be
named the same for compatibility with NTGS-3G.

Rename the hidedotfiles to hide_dot_files for compatibility with
NTFS-3G.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 fs/ntfs3/inode.c   | 2 +-
 fs/ntfs3/super.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 41a20d71562a..552dbc5b80b1 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3018,7 +3018,7 @@ int ni_add_name(struct ntfs_inode *dir_ni, struct ntfs_inode *ni,
 	struct ATTR_FILE_NAME *de_name = (struct ATTR_FILE_NAME *)(de + 1);
 	u16 de_key_size = le16_to_cpu(de->key_size);
 
-	/* If option "hidedotfiles" then set hidden attribute for dot files. */
+	/* If option "hide_dot_files" then set hidden attribute for dot files. */
 	if (ni->mi.sbi->options->hide_dot_files) {
 		if (de_name->name_len > 0 &&
 		    le16_to_cpu(de_name->name[0]) == '.')
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index e9cf00d14733..7ce2bb7646db 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1272,7 +1272,7 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
 		fa = FILE_ATTRIBUTE_ARCHIVE;
 	}
 
-	/* If option "hidedotfiles" then set hidden attribute for dot files. */
+	/* If option "hide_dot_files" then set hidden attribute for dot files. */
 	if (sbi->options->hide_dot_files && name->name[0] == '.')
 		fa |= FILE_ATTRIBUTE_HIDDEN;
 
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index d796541e2a67..af67756998df 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -268,7 +268,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("force",		Opt_force),
 	fsparam_flag_no("sparse",		Opt_sparse),
 	fsparam_flag_no("hidden",		Opt_nohidden),
-	fsparam_flag_no("hidedotfiles",		Opt_hide_dot_files),
+	fsparam_flag_no("hide_dot_files",	Opt_hide_dot_files),
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
 	fsparam_flag_no("prealloc",		Opt_prealloc),
@@ -562,7 +562,7 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 	if (opts->nohidden)
 		seq_puts(m, ",nohidden");
 	if (opts->hide_dot_files)
-		seq_puts(m, ",hidedotfiles");
+		seq_puts(m, ",hide_dot_files");
 	if (opts->force)
 		seq_puts(m, ",force");
 	if (opts->noacsrules)
