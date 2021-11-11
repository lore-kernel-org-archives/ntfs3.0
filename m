Received: from srv.fail (srv.fail [135.181.244.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C082C80
	for <ntfs3@lists.linux.dev>; Thu, 11 Nov 2021 04:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by srv.fail (Postfix) with ESMTP id 2E717152D871
	for <ntfs3@lists.linux.dev>; Thu, 11 Nov 2021 05:39:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv.fail
Received: from srv.fail ([127.0.0.1])
	by localhost (srv.fail [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rM8a-2NqGkxP for <ntfs3@lists.linux.dev>;
	Thu, 11 Nov 2021 05:39:19 +0100 (CET)
Received: from [IPV6:2a02:908:1086:27c0::84a] (unknown [IPv6:2a02:908:1086:27c0::84a])
	by srv.fail (Postfix) with ESMTPSA id B7548152D837
	for <ntfs3@lists.linux.dev>; Thu, 11 Nov 2021 05:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=totally.rip;
	s=default; t=1636605559;
	bh=+qq1biahaDn6SOzs45njVFH/T3Q95h/VdttCA6APLR8=;
	h=Date:From:Subject:To:From;
	b=jBk8wBkLzAMN+OCg2U9dPN/ilcUN/6bOft2hNaNDsgWNIYMYzAx6d5aWYiGXQczoV
	 YP1yNGx/0ZVpMslyVggSojHOaBbe4dJGZk3KGucAuH4Gwl0VX//qWHuWArZcBsTcfV
	 6DIZcDvk61v1a5AaSajZQycBLYZ+Ym1G50MGUiybed995IDSUROKQCGhDv9kkAqI+h
	 XR9qnz4+d3nJcM/5RsHV2LoD5xq+zIWsxIKiuddWpmxAEl49lYH17IqqBy27OsGm60
	 9emRvAZK2tvTBcwB7P0tuYoe8Gjif7+IvR5ztyFWOuymfkuoO2ZXq5mvn/nD2sj7sh
	 6y8Hflver5b4g==
Message-ID: <27056d4a-ad2f-c37d-7aa6-007576a26a84@totally.rip>
Date: Thu, 11 Nov 2021 05:39:19 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: jkhsjdhjs <jkhsjdhjs@totally.rip>
Subject: [BUG] Unable to mount NTFS drive, no error in dmesg
To: ntfs3@lists.linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear ntfs3-Maintainers,

I updated my kernel to version 5.15.1 today, using the package manager 
of my distro. Since I use a software RAID1 with NTFS, I wanted to mount 
it with the new ntfs3 driver instead of ntfs-3g. The RAID consists of 2x 
8TB HGST drives and will be referred to as /dev/md0 in this email.

Mounting the raid unfortunately didn't work, because the filesystem was 
dirty:
ntfs3: md0: volume is dirty and "force" flag is not set!

I then first tried to mount it anyways with -o force:
# mount -t ntfs3 -o force /dev/md0 /mnt/archive

This didn't work either, but without any error in dmesg this time. The 
mount command just printed:
mount: /mnt/archive: wrong fs type, bad option, bad superblock on 
/dev/md0, missing codepage or helper program, or other error.

Since I apparently couldn't ignore the volume being dirty, I ran ntfsfix 
-d /dev/md0, which removed the dirty bit.

Then I tried to mount the raid again:
# mount -t ntfs3 /dev/md0 /mnt/archive
mount: /mnt/archive: wrong fs type, bad option, bad superblock on 
/dev/md0, missing codepage or helper program, or other error.

Again, without any message from the ntfs3 module in dmesg. I tried to 
mount the RAID with ntfs-3g again, and that still worked:
# mount -t ntfs-3g /dev/md0 /mnt/archive

I attempted to mount /dev/md0 a few more times and even rebooted my 
computer, but it didn't help. I asked in the discussion channel of my 
linux distribution on matrix, and the people there had a few more 
suggestions:

- Check if I'm using the correct mount options since some are not 
supported anymore with ntfs3.
=> Shouldn't be an issue, since I didn't use any except force once.

- Try running mount with -v for more output.
=> Resulted in no additional output

- Maybe there's a problem with software raids and ntfs3.
=> I created a raid1 consisting of two partitions on a flash drive, had 
no issues mounting that with ntfs3.

- Does the partition contain hiberfil.sys and/or is the partition marked 
as bootable?
=> Nope & nope. While checking this I noticed that some directories on 
the RAID contain non-ascii characters. However, that's not an issue as I 
noticed in a separate check.

Since I really don't know what else to try I'm writing this mail and am 
hoping that you can help me with this issue. This might not even be an 
issue with ntfs3, maybe my ntfs partition is just using something that 
isn't supported in ntfs3. Anyways, you'll probably want to give a better 
error message if that's the case, so I'm keeping the [BUG] flag in the 
subject.

I'll provide some additional information below from which I don't know 
whether it will be helpful or not. If I can provide other information or 
should test a patched ntfs3 module with debug logging or similar, please 
just ask me.

Best Regards,

Leon


Relevant options my kernel is built with: 
https://github.com/archlinux/svntogit-packages/blob/75e1c89c13da96f2155e4a396840d93a5d0d57e7/linux/trunk/config#L9551-L9554

# ntfsinfo -m /dev/md0
Volume Information
         Name of device: /dev/md0
         Device state: 11
         Volume Name: archive
         Volume State: 91
         Volume Flags: 0x0000
         Volume Version: 3.1
         Sector Size: 512
         Cluster Size: 4096
         Index Block Size: 4096
         Volume Size in Clusters: 1953473359
MFT Information
         MFT Record Size: 1024
         MFT Zone Multiplier: 0
         MFT Data Position: 24
         MFT Zone Start: 0
         MFT Zone End: 244184173
         MFT Zone Position: 4
         Current Position in First Data Zone: 244184173
         Current Position in Second Data Zone: 0
         Allocated clusters 519608 (0,0%)
         LCN of Data Attribute for FILE_MFT: 4
         FILE_MFTMirr Size: 4
         LCN of Data Attribute for File_MFTMirr: 976753192
         Size of Attribute Definition Table: 2560
         Number of Attached Extent Inodes: 0
FILE_Bitmap Information
         FILE_Bitmap MFT Record Number: 6
         State of FILE_Bitmap Inode: 80
         Length of Attribute List: 0
         Number of Attached Extent Inodes: 0
FILE_Bitmap Data Attribute Information
         Decompressed Runlist: not done yet
         Base Inode: 6
         Attribute Types: not done yet
         Attribute Name Length: 0
         Attribute State: 3
         Attribute Allocated Size: 234987520
         Attribute Data Size: 234985352
         Attribute Initialized Size: 234985352
         Attribute Compressed Size: 0
         Compression Block Size: 0
         Compression Block Size Bits: 0
         Compression Block Clusters: 0
         Free Clusters: 709352752 (36,3%)


sdb              8:16   1   7,3T  0 disk
└─sdb1           8:17   1   7,3T  0 part
   └─md0          9:0    0   7,3T  0 raid1
sdc              8:32   1   7,3T  0 disk
└─sdc1           8:33   1   7,3T  0 part
   └─md0          9:0    0   7,3T  0 raid1


# ntfsfix -d /dev/md0
Mounting volume... OK
Processing of $MFT and $MFTMirr completed successfully.
Checking the alternate boot sector... OK
NTFS volume version is 3.1.
NTFS partition /dev/md0 was processed successfully.


When loading the ntfs3 module initially:
ntfs3: Max link count 4000
ntfs3: Enabled Linux POSIX ACLs support
ntfs3: Read-only LZX/Xpress compression included

