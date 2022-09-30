Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899305A7A
	for <ntfs3@lists.linux.dev>; Fri, 30 Sep 2022 16:12:04 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3A10B1D0C;
	Fri, 30 Sep 2022 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664554187;
	bh=rzp0hFHJxLvfZaW2A6a/3ZW1NniTpaQ2dsMxkBc9TL8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=bFeUAGxmBefmRire7MFjbcmAGBjeCoI/on5Oq5ufcRSjrO2chiao8Ipsaz3BxJdc4
	 VNxE4LJCUdnG0/luxqecL9SbZSrIn7MLbgVEoT/J184K756kTOQDXWfb7ETgG2lrz1
	 vVlXoazUFOVaOe88M8oZsslOqn2Dm4H43KfGShAY=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3139C1E81;
	Fri, 30 Sep 2022 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1664554322;
	bh=rzp0hFHJxLvfZaW2A6a/3ZW1NniTpaQ2dsMxkBc9TL8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ar30OVR5Plxp+Xx3kLUSqNTl1Z8PfQSo3bC0Xk/rNU8K2zjmeBoO3XUgPhj7pzqYt
	 bpkxE+45+BWUcXCbiE9RlSQB9HfkUe5Mt2xZCvUUXxyZ8OdoC3Anv2yq+hooylgsFL
	 88mh/4R7no5eflLiT6IyGxGEP2CvNeG08K1dbqKQ=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Sep 2022 19:12:01 +0300
Message-ID: <1e05faee-c84c-9aa1-f125-a6d8d082676c@paragon-software.com>
Date: Fri, 30 Sep 2022 19:12:00 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] fs/ntfs3: use strcmp to determin attribute type
Content-Language: en-US
To: Yuan Can <yuancan@huawei.com>, <ntfs3@lists.linux.dev>
References: <20220924063204.22530-1-yuancan@huawei.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20220924063204.22530-1-yuancan@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 9/24/22 09:32, Yuan Can wrote:
> The way of determin attribute type is just matching
> name with the predefined string, do this with strcmp
> to simplify the code.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   fs/ntfs3/xattr.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 7de8718c68a9..7fa5304a969b 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -720,11 +720,9 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   {
>   	int err;
>   	struct ntfs_inode *ni = ntfs_i(inode);
> -	size_t name_len = strlen(name);
>   
>   	/* Dispatch request. */
> -	if (name_len == sizeof(SYSTEM_DOS_ATTRIB) - 1 &&
> -	    !memcmp(name, SYSTEM_DOS_ATTRIB, sizeof(SYSTEM_DOS_ATTRIB))) {
> +	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
>   		/* system.dos_attrib */
>   		if (!buffer) {
>   			err = sizeof(u8);
> @@ -737,8 +735,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		goto out;
>   	}
>   
> -	if (name_len == sizeof(SYSTEM_NTFS_ATTRIB) - 1 &&
> -	    !memcmp(name, SYSTEM_NTFS_ATTRIB, sizeof(SYSTEM_NTFS_ATTRIB))) {
> +	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
>   		/* system.ntfs_attrib */
>   		if (!buffer) {
>   			err = sizeof(u32);
> @@ -751,8 +748,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   		goto out;
>   	}
>   
> -	if (name_len == sizeof(SYSTEM_NTFS_SECURITY) - 1 &&
> -	    !memcmp(name, SYSTEM_NTFS_SECURITY, sizeof(SYSTEM_NTFS_SECURITY))) {
> +	if (!strcmp(name, SYSTEM_NTFS_SECURITY)) {
>   		/* system.ntfs_security*/
>   		struct SECURITY_DESCRIPTOR_RELATIVE *sd = NULL;
>   		size_t sd_size = 0;
> @@ -792,7 +788,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>   	}
>   
>   	/* Deal with NTFS extended attribute. */
> -	err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
> +	err = ntfs_get_ea(inode, name, strlen(name), buffer, size, NULL);
>   
>   out:
>   	return err;
> @@ -809,20 +805,17 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>   {
>   	int err = -EINVAL;
>   	struct ntfs_inode *ni = ntfs_i(inode);
> -	size_t name_len = strlen(name);
>   	enum FILE_ATTRIBUTE new_fa;
>   
>   	/* Dispatch request. */
> -	if (name_len == sizeof(SYSTEM_DOS_ATTRIB) - 1 &&
> -	    !memcmp(name, SYSTEM_DOS_ATTRIB, sizeof(SYSTEM_DOS_ATTRIB))) {
> +	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
>   		if (sizeof(u8) != size)
>   			goto out;
>   		new_fa = cpu_to_le32(*(u8 *)value);
>   		goto set_new_fa;
>   	}
>   
> -	if (name_len == sizeof(SYSTEM_NTFS_ATTRIB) - 1 &&
> -	    !memcmp(name, SYSTEM_NTFS_ATTRIB, sizeof(SYSTEM_NTFS_ATTRIB))) {
> +	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
>   		if (size != sizeof(u32))
>   			goto out;
>   		new_fa = cpu_to_le32(*(u32 *)value);
> @@ -860,8 +853,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>   		goto out;
>   	}
>   
> -	if (name_len == sizeof(SYSTEM_NTFS_SECURITY) - 1 &&
> -	    !memcmp(name, SYSTEM_NTFS_SECURITY, sizeof(SYSTEM_NTFS_SECURITY))) {
> +	if (!strcmp(name, SYSTEM_NTFS_SECURITY)) {
>   		/* system.ntfs_security*/
>   		__le32 security_id;
>   		bool inserted;
> @@ -904,7 +896,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>   	}
>   
>   	/* Deal with NTFS extended attribute. */
> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
> +	err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0);
>   
>   out:
>   	inode->i_ctime = current_time(inode);

Thank you for your work!
I've fixed code under CONFIG_NTFS3_FS_POSIX_ACL and applied.
