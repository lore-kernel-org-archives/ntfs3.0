Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A986334
	for <ntfs3@lists.linux.dev>; Tue, 30 Jun 2026 01:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781642; cv=none; b=us3RrGnQao0/U3d3F28nR4tDrm4Pw6gmiOA3LACMAWqNOeaLQv7lyGlIRUSS+pOT6WIiYh2hKuEwV7I/mH5daImQ/JdeGyvRPi5F7p5QB+d7SuAacDSBg91BGYS6ycsiT6E9kyEI6RH1taq4b9a+58OPOasjkLrpeqsLHy4Q3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781642; c=relaxed/simple;
	bh=Rh9M6a7lXsrvWIP7vrFSZ0wceVZTP0epCi7OnJy2y28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6G2BihpkvSo7jmwCwhqr6CU+1wpEDAZwspfV+pdJTEUPpSfP8wYXRUZYoMCspSiB83hvlCzke0wIuDfL2jCVMJwbyODuPdEw4gZ46Efghsxo4rF7tqggJGjD4myQPgK8uFA86EFYRqJ+Wx8mUSPLzBIK+KECVmDPaiqgkV/kcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hk7Od0mL; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hk7Od0mL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=AuMBmdiOtP+MPoa3SfngH7ypIp3c1NPnaO1hwnO4O5Y=;
	b=hk7Od0mLxu6lKclH74JuUh6eJQcFSJJrvCB+r6cImRYYBX/NjLWxqZ4r8BtCXf
	uT4NC0OAowxJkE4KENvlLqVqxS/bm6d7PcRXTaB2LdQ8FmKhWzT+qKp+HvbempPi
	o66nNBo9Z885L1R1THshXb+6daJ83w6ruqEKB984U5poc=
Received: from [IPV6:2409:8900:1fda:a0a4:96c1:ee45:80de:182] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAXoXi+FkNqHr0_Gw--.40751S2;
	Tue, 30 Jun 2026 09:07:11 +0800 (CST)
Message-ID: <605277e0-9717-4175-951e-beabdd078e48@163.com>
Date: Tue, 30 Jun 2026 09:07:10 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reject FS_IOC_SETFSLABEL on readonly mounts
To: almaz.alexandrovich@paragon-software.com, ethan.ferguson@zetier.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260630005955.1374688-1-liubaolin12138@163.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <20260630005955.1374688-1-liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXoXi+FkNqHr0_Gw--.40751S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww18Cry8uF47XF4DCw1DGFg_yoWxXrWfpr
	nrJr43Gr47trWUJwsFvFyDur1ftrW8JF4DJr4293y7JF4UJw4xXF1UKw10yr1kAry5twnx
	Xr4rXrn8Xw1UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR9iSJUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwh8g6mpDFr+X5gAA3m

Dear maintainer,

This patch fixes how `ntfs3` handles `FS_IOC_SETFSLABEL` on readonly mounts.

While looking at this ioctl path, I noticed that on a readonly-mounted 
`ntfs3` filesystem, users can still call `FS_IOC_SETFSLABEL` to change 
the volume label, and the operation returns success. If the label is 
read again immediately afterwards, the current mount session shows the 
new value, but that value is not actually written to disk. After 
unmounting and mounting the filesystem again, the label goes back to the 
old one.

For a readonly mount, this operation should not be allowed in the first 
place, so the more reasonable behavior here is to return `-EROFS` directly.



To reproduce the issue, I wrote a simple test program, 
`ntfs3_label_ioctl.c`, which uses `FS_IOC_GETFSLABEL` and 
`FS_IOC_SETFSLABEL` directly to read and write the volume label. Running 
this program against a readonly-mounted `ntfs3` image makes the problem 
easy to observe.
（The source code for ntfs3_label_ioctl.c is listed at the end of the 
email.）

*********************************************************************************************************

First, build the test program:
gcc -O2 -Wall -o ntfs3_label_ioctl ntfs3_label_ioctl.c

Then prepare an NTFS image:
truncate -s 128M /tmp/ntfs3.img
mkntfs -F -q /tmp/ntfs3.img
mkdir -p /tmp/ntfs3-mnt

Mount it read-write once and explicitly set the label to `OLDLABEL`:
sudo mount -o loop -t ntfs3 /tmp/ntfs3.img /tmp/ntfs3-mnt
./ntfs3_label_ioctl set OLDLABEL /tmp/ntfs3-mnt
./ntfs3_label_ioctl get /tmp/ntfs3-mnt
sudo umount /tmp/ntfs3-mnt

At this point, the output should be:
$ ./ntfs3_label_ioctl set OLDLABEL /tmp/ntfs3-mnt
SETFSLABEL succeeded

$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='OLDLABEL'

Then mount the image readonly:
sudo mount -o loop,ro -t ntfs3 /tmp/ntfs3.img /tmp/ntfs3-mnt

Read the current label:
./ntfs3_label_ioctl get /tmp/ntfs3-mnt

Try to set a new label:
./ntfs3_label_ioctl set NEWLABEL /tmp/ntfs3-mnt

Read the label again:
./ntfs3_label_ioctl get /tmp/ntfs3-mnt

Finally, unmount and mount it readonly again, then read the label once more:
sudo umount /tmp/ntfs3-mnt
sudo mount -o loop,ro -t ntfs3 /tmp/ntfs3.img /tmp/ntfs3-mnt
./ntfs3_label_ioctl get /tmp/ntfs3-mnt
**********************************************************************************************************

On the unpatched kernel, I see the following behavior:

$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='OLDLABEL'

$ ./ntfs3_label_ioctl set NEWLABEL /tmp/ntfs3-mnt
SETFSLABEL succeeded

$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='NEWLABEL'

$ sudo umount /tmp/ntfs3-mnt
$ sudo mount -o loop,ro -t ntfs3 /tmp/ntfs3.img /tmp/ntfs3-mnt
$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='OLDLABEL'

So `SETFSLABEL` succeeds on a readonly mount, and the label visible in 
the current mount session changes to `NEWLABEL`, but after remounting it 
goes back to `OLDLABEL`. This shows that the change was not actually 
persisted to disk, and only affected the current mount session.
**********************************************************************************************************

With this patch applied, the same test behaves like this:

$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='OLDLABEL'

$ ./ntfs3_label_ioctl set NEWLABEL /tmp/ntfs3-mnt
SETFSLABEL failed: errno=30 (Read-only file system)

$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='OLDLABEL'

$ sudo umount /tmp/ntfs3-mnt
$ sudo mount -o loop,ro -t ntfs3 /tmp/ntfs3.img /tmp/ntfs3-mnt
$ ./ntfs3_label_ioctl get /tmp/ntfs3-mnt
label='OLDLABEL'

After the patch, the ioctl correctly returns `-EROFS` on readonly 
mounts, and the inconsistent behavior between the current mount session 
and a remount is gone.

Thanks,
Baolin


**********************************************************************************************************
ntfs3_label_ioctl.c is as follows:
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <linux/fs.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>

static int do_get(int fd)
{
	char label[FSLABEL_MAX] = {0};
	int ret;

	ret = ioctl(fd, FS_IOC_GETFSLABEL, label);
	if (ret < 0) {
		perror("GETFSLABEL");
		return 1;
	}

	printf("label='%s'\n", label);
	return 0;
}

static int do_set(int fd, const char *newlabel)
{
	char label[FSLABEL_MAX] = {0};
	int ret;

	strncpy(label, newlabel, sizeof(label) - 1);

	ret = ioctl(fd, FS_IOC_SETFSLABEL, label);
	if (ret < 0) {
		printf("SETFSLABEL failed: errno=%d (%s)\n", errno, strerror(errno));
		return 1;
	}

	printf("SETFSLABEL succeeded\n");
	return 0;
}

static void usage(const char *prog)
{
	fprintf(stderr,
		"Usage:\n"
		"  %s get [path]\n"
		"  %s set <newlabel> [path]\n",
		prog, prog);
}

int main(int argc, char *argv[])
{
	const char *path = "/tmp/ntfs3-mnt";
	int fd, ret;

	if (argc < 2) {
		usage(argv[0]);
		return 1;
	}

	if (!strcmp(argv[1], "get")) {
		if (argc >= 3)
			path = argv[2];
	} else if (!strcmp(argv[1], "set")) {
		if (argc < 3) {
			usage(argv[0]);
			return 1;
		}
		if (argc >= 4)
			path = argv[3];
	} else {
		usage(argv[0]);
		return 1;
	}

	fd = open(path, O_RDONLY | O_DIRECTORY);
	if (fd < 0) {
		perror("open");
		return 1;
	}

	if (!strcmp(argv[1], "get"))
		ret = do_get(fd);
	else
		ret = do_set(fd, argv[2]);

	close(fd);
	return ret;
}

在 2026/6/30 08:59, Baolin Liu 写道:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> FS_IOC_SETFSLABEL does not check for readonly mounts and
> can report success without persisting the label change.
> 
> Return -EROFS on readonly mounts.
> 
> Fixes: 21dc07ac9c25 ("ntfs3: add FS_IOC_SETFSLABEL ioctl")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/file.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index b041639ab406..f43baa46ec5c 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -105,6 +105,9 @@ static int ntfs_ioctl_set_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
>   	if (!capable(CAP_SYS_ADMIN))
>   		return -EPERM;
>   
> +	if (sb_rdonly(sbi->sb))
> +		return -EROFS;
> +
>   	if (copy_from_user(user, buf, FSLABEL_MAX))
>   		return -EFAULT;
>   

