Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5653CCFDB
	for <ntfs3@lists.linux.dev>; Thu,  9 Jul 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582090; cv=none; b=PsiXQRcSdKa2KNXx4RDyF4jtYNf4mn1nHh0+O/6w7bw0TeEp2isSF7pvcAIqR02O+Wj4LXbbOoq8hNYRWkblLhLADdnXQJCyLexME0lJ60uSvjIjQtBxGu6zrKa51dCP/tGB6sR8RPktJwiJ9SG6ecH3ABGpVvfrPQ4DkuccylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582090; c=relaxed/simple;
	bh=IROkr6oC6m4doasNPCg5Brgtn0J79IpB4BpDWWSYUrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMkuvr9nkaagI3yQwT0ws9DVPJ/yxG6HsqY2nalZQCb156nV77KU6ES8alwUTiCy2dqc5TRLaC93R18NvU09Mwfsdx3J6h2ddSQnJqUvBaGHCd2L/MFHHaY0vsjbcwzKxO+YM0QpadgCDDiwDvznVw4Yre/VRA8cnZ3W+KZ1oVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oGkaY9zR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oGkaY9zR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=sRwZgJgH3KDXnPJ6foAkWkk/at0twjpIzZRNJ3SilJY=;
	b=oGkaY9zRPxrldPIE8RYMroSNXv5NlO9RsEA4KQRrOP9uXUmjf0G9C8NDKmakUB
	zDk52MbyDdhd5xxanSP6b+hejUMho9L9z/Yz4UGwQgwlSVn2en1TLlb7Dk+soxLX
	Z6+wXa8P5n+C4vfLpK5njWrilJg9ceEhk81cYpXoRP3w8=
Received: from [IPV6:2409:8900:1a86:861a:61e0:cbb5:235:300b] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDX6+d_TU9q83OXGQ--.19759S2;
	Thu, 09 Jul 2026 15:28:00 +0800 (CST)
Message-ID: <13bc7bcc-7072-401d-8187-1c3d8b064234@163.com>
Date: Thu, 9 Jul 2026 15:27:59 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: return -ERANGE for short xattr buffers
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 liubaolin12138@gmail.com, Baolin Liu <liubaolin@kylinos.cn>
References: <20260709071849.2558133-1-liubaolin12138@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260709071849.2558133-1-liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDX6+d_TU9q83OXGQ--.19759S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyrKFWfZF4kXr4xJFWUurg_yoW5tF1kpF
	ZIka13Jr45Jr1UJr9FkF4qvw18urs8JryUGrWj9r1fA3W5Jw1Iqry5Kw18Xr1Ivryqywnx
	Jw1vgrW5Zrn8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2iiDUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QDhrGpPTYDgTgAA3i

Dear maintainer,
    I found an issue where `ntfs3` returns the wrong errno when reading 
`system.ntfs_attrib` with a buffer that is too small.
When the user buffer is too small, `ntfs3` currently returns `-ENODATA`.
However, `system.ntfs_attrib` does exist in this case, and the failure 
is only caused by the user buffer being too small.
A more appropriate return value here is `-ERANGE`, not `-ENODATA`, which 
normally indicates that the xattr does not exist.

To reproduce this issue, I wrote a simple test program, 
`ntfs3_xattr_smallbuf.c`.

First, build the test program:
         gcc -O2 -Wall -o ntfs3_xattr_smallbuf ntfs3_xattr_smallbuf.c

Then reproduce it with the following steps:
         truncate -s 128M /tmp/ntfs3.img
         mkntfs -F -q /tmp/ntfs3.img
         mkdir -p /tmp/ntfs3-mnt
         mount -o loop -t ntfs3 /tmp/ntfs3.img /tmp/ntfs3-mnt
         touch /tmp/ntfs3-mnt/testfile
         ./ntfs3_xattr_smallbuf /tmp/ntfs3-mnt/testfile

On the unpatched kernel, I see the following result:
         $ ./ntfs3_xattr_smallbuf /tmp/ntfs3-mnt/testfile
         getxattr failed: errno=61 (No data available)
         `system.ntfs_attrib` does exist, but when the buffer is too 
small it returns `ENODATA`.

With this patch applied, the same test gives:
         $ ./ntfs3_xattr_smallbuf /tmp/ntfs3-mnt/testfile
         getxattr failed: errno=34 (Numerical result out of range)
         In this case, it returns `ERANGE`.

Best regards,
Baolin

***********************************************************************************************
ntfs3_xattr_smallbuf.c:
#define _GNU_SOURCE
#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/xattr.h>

int main(int argc, char *argv[])
{
         const char *path = argc > 1 ? argv[1] : "/tmp/ntfs3-mnt/testfile";
         char buf[1];
         ssize_t ret;

         ret = getxattr(path, "system.ntfs_attrib", buf, sizeof(buf));
         if (ret < 0) {
                 printf("getxattr failed: errno=%d (%s)\n", errno, 
strerror(errno));
                 return 1;
         }

         printf("getxattr succeeded: ret=%zd\n", ret);
         return 0;
}
**********************************************************************************************

在 2026/7/9 15:18, Baolin Liu 写道:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> ntfs3 currently returns -ENODATA when the xattr exists
> but the user buffer is too small.
> Return -ERANGE instead.
> 
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/xattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9743a63a152e..0a19668e970d 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -781,7 +781,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		if (!buffer) {
>   			err = sizeof(u8);
>   		} else if (size < sizeof(u8)) {
> -			err = -ENODATA;
> +			err = -ERANGE;
>   		} else {
>   			err = sizeof(u8);
>   			*(u8 *)buffer = le32_to_cpu(ni->std_fa);
> @@ -795,7 +795,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		if (!buffer) {
>   			err = sizeof(u32);
>   		} else if (size < sizeof(u32)) {
> -			err = -ENODATA;
> +			err = -ERANGE;
>   		} else {
>   			err = sizeof(u32);
>   			*(u32 *)buffer = le32_to_cpu(ni->std_fa);
> @@ -835,7 +835,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		if (!buffer) {
>   			err = sd_size;
>   		} else if (size < sd_size) {
> -			err = -ENODATA;
> +			err = -ERANGE;
>   		} else {
>   			err = sd_size;
>   			memcpy(buffer, sd, sd_size);

