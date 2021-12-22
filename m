Received: from mx1.net9.ga (mx1.net9.ga [192.210.226.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C12C80
	for <ntfs3@lists.linux.dev>; Thu, 23 Dec 2021 00:29:32 +0000 (UTC)
Received: from u34 by mx1.net9.ga with local (@Mail Server)
	(envelope-from <u34@net9.ga>)
	id 1n0BSg-0001lD-UY
	for ntfs3@lists.linux.dev; Wed, 22 Dec 2021 23:55:58 +0000
Date: Wed, 22 Dec 2021 23:55:58 +0000
To: ntfs3@lists.linux.dev
Subject: Unexpected behavior for some directories
User-Agent: s-nail v14.9.22
Message-Id: <E1n0BSg-0001lD-UY@mx1.net9.ga>
From: u34@net9.ga
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

  With the ntfs3 linux module, some, but not all, directories of the ntfs 
partition do not have permissions that are consistent with dmask set in  
/etc/fstab.
Based on a small set, the files permissions are consistent with the fmask 
setting.
  More specifically, does, for example,

    dr-xr-x--- Users/Default/Downloads

Consistent with dmask 0027 from /etc/fstab? Mount point omitted by 
submitter.
  The issue is seen with 5.16rc6-1 (mainline), and with with 
5.15.10-arch1-1 (by the archlinux distribution). On the surface, it could 
be that 
https://unix.stackexchange.com/questions/678880/how-can-i-mass-set-the-permissions-of-existing-files-in-the-new-ntfs3-driver 
is related. I have no relation to the person who wrote that stackexchange 
report.

  While writing this message, I have also noticed links such as

  'Users/myuser/My Documents' -> C:/Users/myuser/Documents

Should a C:/ mount point appear in a unix ls output? Mount point omitted 
by submitter.

  Do let me know if I can assist further in solving the issue.

Thank you for your work.
--
u34
