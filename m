Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B113FC3
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 16:19:51 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 87FC81D34;
	Tue, 31 Aug 2021 19:19:42 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1630426782;
	bh=6sjBYsgnQ2PmPdX06AQ2JvJobRcP9kuSQdfucv7aW/g=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=R3WujCfrqq7sHpYvvOlG4SgWfCw0p/CAma29nRskX4ZoZHrY30yiPutTYabEKQuUp
	 UZNGkWFIEY8wz7vyKzKsr8kLRtlcGzvcVQe1cOo0OeDI12enM3Q3mCUranQTM/OjvH
	 //WUXBMp1hnKMu5KgtmdNiqZ7n5psUbSACJy10nI=
Received: from [192.168.211.15] (192.168.211.15) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 19:19:42 +0300
Subject: Re: [PATCH] fs/ntfs3: Remove fat ioctl's from ntfs3 driver for now
To: Kari Argillander <kari.argillander@gmail.com>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
	<pali@kernel.org>
References: <20210824182020.1007329-1-kari.argillander@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Message-ID: <ca096313-ddb6-6897-67a6-3f0d45deefce@paragon-software.com>
Date: Tue, 31 Aug 2021 19:19:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210824182020.1007329-1-kari.argillander@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.15]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 24.08.2021 21:20, Kari Argillander wrote:
> For some reason we have FAT ioctl calls. Even old ntfs driver did not
> use these. We should not use these because it his hard to get things out
> of kernel when they are upstream. That's why we remove these for now.
> 
> More discussion is needed what ioctl should be implemented and what is
> important.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---
> Earlier disgussion with Pali can be founded here:
> lore.kernel.org/linux-fsdevel/20210824113304.eabzy7ulbuouzlac@pali/
> ---
>  fs/ntfs3/file.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 59344985c2e8..819afc4c902b 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -10,7 +10,6 @@
>  #include <linux/compat.h>
>  #include <linux/falloc.h>
>  #include <linux/fiemap.h>
> -#include <linux/msdos_fs.h> /* FAT_IOCTL_XXX */
>  #include <linux/nls.h>
>  
>  #include "debug.h"
> @@ -50,15 +49,8 @@ static long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
>  	struct ntfs_sb_info *sbi = inode->i_sb->s_fs_info;
> -	u32 __user *user_attr = (u32 __user *)arg;
>  
>  	switch (cmd) {
> -	case FAT_IOCTL_GET_ATTRIBUTES:
> -		return put_user(le32_to_cpu(ntfs_i(inode)->std_fa), user_attr);
> -
> -	case FAT_IOCTL_GET_VOLUME_ID:
> -		return put_user(sbi->volume.ser_num, user_attr);
> -
>  	case FITRIM:
>  		return ntfs_ioctl_fitrim(sbi, arg);
>  	}
> 

Hi, Kari!

Applied, thanks.

Best regards.
