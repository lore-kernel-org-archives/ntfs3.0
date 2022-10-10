Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB07E
	for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 11:37:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so186178wmq.4
        for <ntfs3@lists.linux.dev>; Mon, 10 Oct 2022 04:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2EFIm4tesO4K1a7cSrq2x4CXgXoUEITju+DVHW6+iw=;
        b=ccPzMT3VJJ8v7DzPBzM1ZEtHzbEmIfYjtfYJ2k0FiNbwCHZPKU6nkzuSKhOr6OB8U7
         lOuhDT2lO4vFdvHZjTKxIdL2SfTPKVDtTqPLVw6zeKALh4KG4tCEsf8OX6liE/5DIsbf
         JRdH2aK6txpHYM6YXo/ZCSAjVKKJF10fdIajaVpj9AePxmhyOCLTUlR9RgN3TulHZ7RT
         A4X7HTJlyzaWUQAkzUYTpk1kOOw2LRxeQ4uwIpM1ONXJXxr1S9EFre2Ie5C5/+2hY97e
         CuSJm/IKg2/DZbUjgrkcIvuRBT6UnoYV/OI3DOpqc8/hQ4wz7R5Hs2F7/rS8ZgLGWkhv
         ftYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2EFIm4tesO4K1a7cSrq2x4CXgXoUEITju+DVHW6+iw=;
        b=wJ9SQF0xrTgdTARGUSSCwU9UdjOLk21MiUuV1piTpTB3edXIXcdR9lf9LThgsMpW4G
         8Ap0URiCSbtJxdhLrWE2gHlWFkUdwLbjuRAxs2EniMguyqsFy6Wg83Jtk3RAltuTJxcs
         hyfL8dRCKRWyMyJC658/tdnpwHoXjT12S3Z/mrx61IjW5cTTVoupRe9+wD2T/pa8QxW9
         B0ZmzPpNpxz3lf+0pDLPxK6E4thyfG2W4B/R+3pBBiTUuHy/Z+LBgQb4jGYNcSqPHEjt
         mQtjSxriKxJgjIuryzAC5SLPrZeUuYoH2W0aKgyL6FaDcwPRVI2ZKMpUE5L3AvV68j+y
         bpCg==
X-Gm-Message-State: ACrzQf2oOBX5dbnygqLfqvK5PYYEBdTor/nYgy+uyY78DLaLxhJewNWY
	gOoraJJlTCgdtkLkgN++J3E=
X-Google-Smtp-Source: AMsMyM7rSdwtUmlwD9h3eZ8YDRiviILWuOChr73nlodkc7/4oYafMcZ+iTeK/va4sRZ8PmRf0oP/7g==
X-Received: by 2002:a7b:cb95:0:b0:3c6:c0e7:88ab with SMTP id m21-20020a7bcb95000000b003c6c0e788abmr340799wmi.147.1665401834383;
        Mon, 10 Oct 2022 04:37:14 -0700 (PDT)
Received: from [192.168.42.102] (sm4-84-91-228-85.netvisao.pt. [84.91.228.85])
        by smtp.gmail.com with ESMTPSA id o18-20020a1c7512000000b003b492753826sm9794969wmc.43.2022.10.10.04.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 04:37:14 -0700 (PDT)
Message-ID: <b303dfee-4f3d-d21a-0e6b-5cf2c81b6fd9@gmail.com>
Date: Mon, 10 Oct 2022 12:37:13 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: [PATCH v2 5/5] fs/ntfs3: rename hidedotfiles mount option to
 hide_dot_files
Content-Language: pt-PT
From: Daniel Pinto <danielpinto52@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
In-Reply-To: <9c404576-856b-6935-f2e3-c4d0749f16ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The hidedotfiles mount option provides the same functionality as
the NTFS-3G hide_dot_files mount option. As such, it should be
named the same for compatibility with NTGS-3G.

Rename the hidedotfiles to hide_dot_files for compatbility with
NTFS-3G.

Signed-off-by: Daniel Pinto <danielpinto52@gmail.com>
---
 Documentation/filesystems/ntfs3.rst | 2 +-
 fs/ntfs3/frecord.c                  | 2 +-
 fs/ntfs3/inode.c                    | 2 +-
 fs/ntfs3/super.c                    | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index fa03165f2310..4c6eb9fe9bea 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -75,7 +75,7 @@ this table marked with no it means default is without **no**.
      - Files with the Windows-specific SYSTEM (FILE_ATTRIBUTE_SYSTEM) attribute
        will be marked as system immutable files.
 
-   * - hidedotfiles
+   * - hide_dot_files
      - Updates the Windows-specific HIDDEN (FILE_ATTRIBUTE_HIDDEN) attribute
        when creating and moving or renaming files. Files whose names start
        with a dot will have the HIDDEN attribute set and files whose names
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
